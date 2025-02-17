import { getAvailableLanguages } from "../_shared/languages.service.ts";
import { createResponse } from "../_shared/response.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

Deno.serve(async () => {
  try {
    const languages = await getAvailableLanguages(supabaseClient)
    return createResponse(200, { success: true, "data": languages })
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 500 })
  }
});
