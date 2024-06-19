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
    let query = supabaseClient.from('duas').select('route_name, dua_translations(language, title), tags(name)');

    if (languageCodes.length > 0) {
        query = query.filter('dua_translations.language', 'in', `(${languageCodes.join(',')})`);
    }

    const {data: duas, error} = await query;
    if (error) throw error;

    const formattedDuas = duas.map(dua => {
        const titles: { [key: string]: string } = {};
        dua.dua_translations.forEach(translation => {
            titles[translation.language] = translation.title;
        });

        return {
            route_name: dua.route_name,
            titles: titles,
            tags: dua.tags.map(tag => tag.name)
        };
    });

    return new Response(JSON.stringify(formattedDuas), {
        headers: {...corsHeaders, 'Content-Type': 'application/json'},
        status: 200,
    });
}

async function getDua(supabaseClient: SupabaseClient, routeName: string, languageCodes: string[]) {
    let query = supabaseClient.from('duas')
        .select('route_name, dua_translations(language, title, dua_translation_lines(line_number, text))')
        .filter('route_name', 'eq', routeName);

    if (languageCodes.length > 0) {
        query = query.filter('dua_translations.language', 'in', `(${languageCodes.join(',')})`);
    }

    const {data: duas, error} = await query.limit(1);
    if (error) throw error;

    if (duas.length === 0) {
        return new Response(JSON.stringify({error: 'Not Found'}), {
            headers: {...corsHeaders, 'Content-Type': 'application/json'},
            status: 404,
        });
    }
    const dua = duas[0]

    const titles: { [key: string]: string } = {};
    const lines: { [key: number]: { [key: string]: string } } = {};

    dua.dua_translations.forEach(translation => {
        const {language, title, dua_translation_lines} = translation;

        // Set title for the language
        if (!titles[language]) {
            titles[language] = title;
        }

        // Set lines for the language
        dua_translation_lines.forEach(line => {
            const {line_number, text} = line;

            if (!lines[line_number]) {
                lines[line_number] = {};
            }

            lines[line_number][language] = text;
        });
    });

    const sortedLines = Object.keys(lines)
        .map(key => parseInt(key)) // Convert keys to numbers
        .sort((a, b) => a - b) // Sort numerically
        .reduce((acc, key) => {
            acc[key] = lines[key];
            return acc;
        }, {} as { [key: number]: { [key: string]: string } });

    const formattedDua = {
        route_name: dua.route_name,
        titles: titles,
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
  2. Run `supabase functions serve`
  3. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/hello-world' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'
*/
