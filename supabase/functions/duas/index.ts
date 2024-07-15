// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import {createClient, SupabaseClient} from 'https://esm.sh/@supabase/supabase-js@2.7.1'

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey',
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE',
}

interface Language {
    id: number;
    code: string;
}

interface DuaContentLine {
    id?: number;
    line_number: number;
    text: string;
    repetitions_number: number | null;
    end_of_section: boolean;
}

interface DuaContent {
    id?: number;
    title: string;
    description: string;
    narrated_by: string;
    language_id: number;
    dua_content_lines?: DuaContentLine[];
}

interface Tag {
    name: string;
}

interface DuaHasTag {
    tags: Tag;
}

interface Dua {
    id?: number;
    route_name: string;
    image_url: string;
    dua_contents: DuaContent[];
    dua_has_tags: DuaHasTag[];
}

interface FormattedDua {
    route_name: string;
    image_url: string;
    languages: string[];
    title: { [key: string]: string };
    description: { [key: string]: string };
    narratedBy: { [key: string]: string };
    tags: string[];
}

interface FormattedDuaWithLines extends FormattedDua {
    lines: Array<{
        [key: string]: string | number | null | boolean;
        repetitions_number: number | null;
        end_of_section: boolean;
    }>;
}

function hasAtLeastOneLanguageCode(languageCodes: string[]): Response | null {
    if (languageCodes.length === 0) {
        return new Response(JSON.stringify({
            error: 'At least one language code must be provided'
        }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400, // Bad Request
        });
    }
    return null;
}

async function getLanguageMappings(supabaseClient: SupabaseClient): Promise<{ languageMap: Record<number, Language>, codeToIdMap: Record<string, number> }> {
    const { data: languages, error } = await supabaseClient.from('languages').select('*');
    if (error) {
        console.error('Error fetching languages:', error);
        throw error;
    }
    const languageMap: Record<number, Language> = Object.fromEntries(languages.map(lang => [lang.id, lang]));
    const codeToIdMap: Record<string, number> = Object.fromEntries(languages.map(lang => [lang.code, lang.id]));
    return { languageMap, codeToIdMap };
}

function hasValidLanguageCodes(languageCodes: string[], codeToIdMap: Record<string, number>): Response | null {
    const invalidCodes = languageCodes.filter(code => !codeToIdMap[code]);
    if (invalidCodes.length > 0) {
        return new Response(JSON.stringify({
            error: `Invalid language code(s): ${invalidCodes.join(', ')}`
        }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            status: 400, // Bad Request
        });
    }
    return null;
}

function extractTags(duaHasTags: DuaHasTag[]): string[] {
    return duaHasTags
        .map(relation => relation.tags.name)
        .filter((tag): tag is string => tag !== null);
}

function formatDuaContents(duaContents: DuaContent[], languageMap: Record<number, Language>): { 
    title: { [key: string]: string },
    description: { [key: string]: string }, 
    narratedBy: { [key: string]: string }, 
    lines: Array<{ [key: string]: string | number | null | boolean, 
        repetitions_number: number | null, end_of_section: boolean }> 
    } {
    const title: { [key: string]: string } = {};
    const description: { [key: string]: string } = {};
    const narratedBy: { [key: string]: string } = {};
    const lines: Array<{
        [key: string]: string | number | null | boolean,
        repetitions_number: number | null,
        end_of_section: boolean
    }> = [];

    duaContents.forEach(content => {
        const languageCode = languageMap[content.language_id].code;
        title[languageCode] = content.title;
        description[languageCode] = content.description;
        narratedBy[languageCode] = content.narrated_by;
        
        content.dua_content_lines?.forEach(line => {
            if (!lines[line.line_number - 1]) {
                lines[line.line_number - 1] = {
                    repetitions_number: line.repetitions_number,
                    end_of_section: line.end_of_section
                };
            }
            lines[line.line_number - 1][languageCode] = line.text;
        });
    });

    const compactLines = lines.filter(line => Object.keys(line).length > 2);
        
    return { title, description, narratedBy, lines: compactLines };
}

function convertLanguageCodesToIds(languageCodes: string[], codeToIdMap: Record<string, number>): (number | string)[] {
    return languageCodes.map(code => codeToIdMap[code] || code);
}

async function getDuas(
    supabaseClient: SupabaseClient, 
    languageCodes: string[], 
    page: number = 1, 
    pageSize: number = 10
): Promise<Response> {
    const hasAtLeastOneLanguageCodeError = hasAtLeastOneLanguageCode(languageCodes);
    if (hasAtLeastOneLanguageCodeError) {
        return hasAtLeastOneLanguageCodeError;
    }

    const { languageMap, codeToIdMap } = await getLanguageMappings(supabaseClient);
    const hasValidLanguageCodeError = hasValidLanguageCodes(languageCodes, codeToIdMap);
    if (hasValidLanguageCodeError) {
        return hasValidLanguageCodeError;
    }
    const languageIds = convertLanguageCodesToIds(languageCodes, codeToIdMap);

    let query = supabaseClient
        .from('duas')
        .select(`
            route_name,
            image_url,
            dua_contents (
                title,
                description,
                language_id,
                narrated_by
            ),
            dua_has_tags (
                tags (
                    name
                )
            )
        `, { count: 'exact' });

    query = query.filter('dua_contents.language_id', 'in', `(${languageIds.join(',')})`);

    // Hinzufügen von Paginierung
    const from = (page - 1) * pageSize;
    const to = from + pageSize - 1;
    query = query.range(from, to);

    const { data: duas, error, count } = await query;
    if (error) {
        console.error('Error fetching duas:', error);
        throw error;
    }

    const formattedDuas: FormattedDua[] = duas.map((dua: Dua) => {
        const { title, description, narratedBy } = formatDuaContents(dua.dua_contents, languageMap);
        const tags = extractTags(dua.dua_has_tags);
        const languages = Object.keys(title);

        return {
            route_name: dua.route_name,
            image_url: dua.image_url,
            languages,
            title: title,
            description: description,
            narratedBy,
            tags
        };
    }).filter(dua => dua.languages.length > 0);

    const totalPages = Math.ceil((count || 0) / pageSize);

    const response = {
        data: formattedDuas,
        pagination: {
            page,
            pageSize,
            totalPages,
            totalCount: count
        }
    };

    return new Response(JSON.stringify(response), {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200,
    });
}

async function getDua(supabaseClient: SupabaseClient, routeName: string, languageCodes: string[]): Promise<Response> {
    const languageCodesValidationError = hasAtLeastOneLanguageCode(languageCodes);
    if (languageCodesValidationError) {
        return languageCodesValidationError;
    }
    
    const { languageMap, codeToIdMap } = await getLanguageMappings(supabaseClient);
    const hasValidLanguageCodeError = hasValidLanguageCodes(languageCodes, codeToIdMap);
    if (hasValidLanguageCodeError) {
        return hasValidLanguageCodeError;
    }
    const languageIds = convertLanguageCodesToIds(languageCodes, codeToIdMap);

    let query = supabaseClient
        .from('duas')
        .select(`
            id,
            route_name,
            image_url,
            dua_contents (
                id,
                title,
                description,
                language_id,
                narrated_by,
                dua_content_lines (
                    id,
                    line_number,
                    text,
                    repetitions_number,
                    end_of_section
                )
            ),
            dua_has_tags (
                tags (
                    name
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

    const dua = duas[0] as Dua;
    const { title, description, narratedBy, lines } = formatDuaContents(dua.dua_contents, languageMap);
    const tags = extractTags(dua.dua_has_tags);

    const formattedDua: FormattedDuaWithLines = {
        route_name: dua.route_name,
        image_url: dua.image_url,
        title,
        description,
        narratedBy,
        lines,
        tags,
        languages: Object.keys(title)
    };

    return new Response(JSON.stringify(formattedDua), {
        headers: {...corsHeaders, 'Content-Type': 'application/json'},
        status: 200,
    });
}

Deno.serve((req: Request) => {
    const { url, method } = req

    if (method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        const supabaseClient = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_ANON_KEY') ?? ''
        )

        const urlObj = new URL(url);
        const languageCodes = urlObj.searchParams.get('languages')?.split(',') || [];
        const page = urlObj.searchParams.get('page');
        const pageSize = urlObj.searchParams.get('size');

        const taskPattern = new URLPattern({ pathname: '/duas/:id' })
        const matchingPath = taskPattern.exec(url)
        const routeName = matchingPath ? matchingPath.pathname.groups.id : null

        if (routeName == null) {
            if (!page || !pageSize) {
                return new Response(JSON.stringify({
                    error: '"page" and "size" query parameters are required.'
                }), {
                    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                    status: 400, // Bad Request
                });
            }
            return getDuas(supabaseClient, languageCodes, +page, +pageSize);
        }
        return getDua(supabaseClient, routeName, languageCodes)
    } catch (error) {
        console.error(error)

        return new Response(JSON.stringify({ error: (error as Error).message }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
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
