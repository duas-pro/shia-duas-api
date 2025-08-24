import { supabaseClient } from "../_shared/supabase-client.ts";
import { createResponse } from "../_shared/response.ts";

Deno.serve(async () => {
  const excludedTags = ["sirat-guide"];

  const { data, error } = await supabaseClient
    .from("tags")
    .select("name")
    .not("name", "in", `(${excludedTags.join(",")})`)
    .order("name", { ascending: true });

    // number of duas inside this collection

  if (error) {
    console.error(
      "Error while fetching tags " + String(error?.message ?? error),
    );
    return createResponse(500, { error: `Internal Server Error` });
  }

  return createResponse(200, { success: true, data });
});
