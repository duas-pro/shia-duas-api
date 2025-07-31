import { getAvailableLanguages } from "../_shared/languages.service.ts";
import { createResponse } from "../_shared/response.ts";

Deno.serve(async () => {
  try {
    const languages = await getAvailableLanguages()
    return createResponse(200, { success: true, "data": languages })
  } catch (err) {
    return new Response(String(err?.message ?? err), { status: 500 })
  }
});
