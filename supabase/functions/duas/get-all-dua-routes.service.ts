import SupabaseClient from "https://esm.sh/v135/@supabase/supabase-js@2.7.1/dist/module/SupabaseClient.js";
import { createResponse } from "../_shared/response.ts";

export async function getDuaRoutes(
  supabaseClient: SupabaseClient,
): Promise<Response> {
  const { data, error } = await supabaseClient
    .from("duas")
    .select(`route_name`);

  if (error) {
    console.error(
      "Error while receiving dua routes, error: " +
        JSON.stringify(error),
    );
    return createResponse(500, { error: `Internal Server Error` });
  }
  const routeNames = data.map((item) => item.route_name);

  return createResponse(200, { "data": { route_names: routeNames } });
}
