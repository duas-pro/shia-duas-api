import { supabaseClient } from "../_shared/supabase-client.ts";
import { createResponse } from "../_shared/response.ts";

Deno.serve(async () => {
  const { data, error } = await supabaseClient
    .from("reciters")
    .select("full_name_tl, full_name_ar, profile_image_url")
    .order("full_name_tl", { ascending: true });

  if (error) {
    console.error(
      "Error while fetching reciters " + String(error?.message ?? error),
    );
    return createResponse(500, { error: `Internal Server Error` });
  }

  return createResponse(200, { success: true, data });
});