// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import {createClient, SupabaseClient} from 'https://esm.sh/@supabase/supabase-js@2.7.1'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey',
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE',
}

async function getDuas(supabaseClient: SupabaseClient, languageCodes: string[]) {
    // Überprüfe, ob mindestens eine Sprache angegeben wurde
    if (languageCodes.length === 0) {
        return new Response(JSON.stringify({
            error: 'At least one language code must be provided'
        }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400, // Bad Request
        });
    }

    // Zuerst alle Sprachen abrufen
    const { data: languages, error: languageError } = await supabaseClient
        .from('languages')
        .select('*');

    if (languageError) {
        console.error('Error fetching languages:', languageError);
        throw languageError;
    }

    // Erstelle Mappings für Sprachen
    const languageMap = Object.fromEntries(languages.map(lang => [lang.id, lang]));
    const codeToIdMap = Object.fromEntries(languages.map(lang => [lang.code, lang.id]));

    // Überprüfe, ob alle angeforderten Sprachcodes existieren
    const invalidCodes = languageCodes.filter(code => !codeToIdMap[code]);
    if (invalidCodes.length > 0) {
        return new Response(JSON.stringify({
            error: `Invalid language code(s): ${invalidCodes.join(', ')}`
        }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400, // Bad Request
        });
    }

    // Konvertiere languageCodes zu IDs
    const languageIds = languageCodes.map(code => codeToIdMap[code]);

    // Basisquery definieren
    let query = supabaseClient
        .from('duas')
        .select(`
            route_name,
            image_url,
            dua_contents (
                title,
                description,
                language_id
            ),
            dua_has_tags (
                tags (
                    name
                )
            )
        `);

    // Sprachfilter anwenden
    query = query.filter('dua_contents.language_id', 'in', `(${languageIds.join(',')})`);

    // Daten abrufen
    const { data: duas, error } = await query;
    if (error) {
        console.error('Error fetching duas:', error);
        throw error;
    }

    // Daten formatieren
    const formattedDuas = duas.map(dua => {
        const languages = new Set<string>();
        const title: {[key: string]: string} = {};
        const description: {[key: string]: string} = {};

        dua.dua_contents.forEach(content => {
            if (content.language_id && languageMap[content.language_id]) {
                const langCode = languageMap[content.language_id].code;
                languages.add(langCode);
                title[langCode] = content.title;
                description[langCode] = content.description;
            }
        });

        const tags = dua.dua_has_tags
            .map(relation => relation.tags.name)
            .filter((tag): tag is string => tag !== null);

        return {
            route_name: dua.route_name,
            image_url: dua.image_url,
            languages: Array.from(languages),
            title,
            description,
            tags
        };
    }).filter(dua => dua.languages.length > 0);

    // Antwort zurückgeben
    return new Response(JSON.stringify(formattedDuas), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
    });
}

async function getDua(supabaseClient: SupabaseClient, routeName: string, languageCodes: string[]) {
    console.log('Requested route name:', routeName);
    console.log('Requested language codes:', languageCodes);

    // Zuerst alle Sprachen abrufen
    const { data: languages, error: languageError } = await supabaseClient
        .from('languages')
        .select('*');

    if (languageError) {
        console.error('Error fetching languages:', languageError);
        throw languageError;
    }

    // Erstelle Mappings für Sprachen
    const languageMap = Object.fromEntries(languages.map(lang => [lang.id, lang]));
    const codeToIdMap = Object.fromEntries(languages.map(lang => [lang.code, lang.id]));

    // Konvertiere languageCodes zu IDs, falls nötig
    const languageIds = languageCodes.map(code => codeToIdMap[code] || code);

    let query = supabaseClient
        .from('duas')
        .select(`
            id,
            route_name,
            dua_contents (
                id,
                title,
                description,
                language_id,
                dua_content_lines (
                    id,
                    line_number,
                    text,
                    repetitions_number,
                    end_of_section
                )
            )
        `)
        .eq('route_name', routeName);

    if (languageIds.length > 0) {
        query = query.filter('dua_contents.language_id', 'in', `(${languageIds.join(',')})`);
    }

    const { data: duas, error } = await query.limit(1);
    if (error) throw error;

    if (duas.length === 0) {
        return new Response(JSON.stringify({error: 'Not Found'}), {
            headers: {...corsHeaders, 'Content-Type': 'application/json'},
            status: 404,
        });
    }

    const dua = duas[0];

    const titles: { [key: string]: string } = {};
    const descriptions: { [key: string]: string } = {};
    const lines: { [key: number]: { 
        [key: string]: { 
            text: string, 
            repetitions_number: number | null, 
            end_of_section: boolean 
        } 
    } } = {};

    dua.dua_contents.forEach(content => {
        const languageCode = languageMap[content.language_id].code;

        // Set title for the language
        titles[languageCode] = content.title;

        // Set description for the language
        descriptions[languageCode] = content.description;

        // Set lines for the language
        content.dua_content_lines.forEach(line => {
            if (!lines[line.line_number]) {
                lines[line.line_number] = {};
            }

            lines[line.line_number][languageCode] = {
                text: line.text,
                repetitions_number: line.repetitions_number,
                end_of_section: line.end_of_section
            };
        });
    });

    const sortedLines = Object.keys(lines)
        .map(key => parseInt(key))
        .sort((a, b) => a - b)
        .reduce((acc, key) => {
            acc[key] = lines[key];
            return acc;
        }, {} as typeof lines);

    const formattedDua = {
        route_name: dua.route_name,
        titles: titles,
        descriptions: descriptions,
        lines: sortedLines
    };

    return new Response(JSON.stringify(formattedDua), {
        headers: {...corsHeaders, 'Content-Type': 'application/json'},
        status: 200,
    });
}

Deno.serve(req => {
    const {url, method} = req

    // This is needed if you're planning to invoke your function from a browser.
    if (method === 'OPTIONS') {
        return new Response('ok', {headers: corsHeaders})
    }

    try {
        const supabaseClient = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_ANON_KEY') ?? ''
        )

        // Extract query parameters
        const urlObj = new URL(url);
        const languageCodes = urlObj.searchParams.get('languages')?.split(',') || [];

        // For more details on URLPattern, check https://developer.mozilla.org/en-US/docs/Web/API/URL_Pattern_API
        const taskPattern = new URLPattern({pathname: '/duas/:id'})
        const matchingPath = taskPattern.exec(url)
        const routeName = matchingPath ? matchingPath.pathname.groups.id : null

        if (routeName == null) {
            return getDuas(supabaseClient, languageCodes)
        }
        return getDua(supabaseClient, routeName, languageCodes)
    } catch (error) {
        console.error(error)

        return new Response(JSON.stringify({error: error.message}), {
            headers: {...corsHeaders, 'Content-Type': 'application/json'},
            status: 400,
        })
    }
})

/* To invoke locally:

  0. If you changed something in the database structure, run `supabase db reset`

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Run `supabase functions serve --no-verify-jwt`
  3. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/hello-world' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'
*/
