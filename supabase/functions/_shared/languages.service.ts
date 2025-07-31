import SupabaseClient from "https://esm.sh/v135/@supabase/supabase-js@2.7.1/dist/module/SupabaseClient.js";
import { createResponse } from "./response.ts";
import { Language } from "./language.model.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

export async function validateLanguageCodes(usedLanguageCodes: string[]): Promise<Response | null> {
    if (usedLanguageCodes.length === 0) {
        return createResponse(400, {error: 'At least one language code must be provided'});
    }
    
    const availableLanguageCodes: string[] = (await getAvailableLanguages()).map(lang => lang.code);
    const invalidCodes = usedLanguageCodes.filter(code => !availableLanguageCodes.includes(code));
    if (invalidCodes.length > 0) {
        return createResponse(400, {error: `Invalid language code(s): ${invalidCodes.join(', ')}`});
    }
    return null;
}

export async function getAvailableLanguages(): Promise<Language[]> {
    const { data: languages, error } = await supabaseClient.from('languages').select('code, name_in_en');
    if (error) {
        console.error('Error fetching languages:', JSON.stringify(error));
        throw error;
    }
    return languages;
}
