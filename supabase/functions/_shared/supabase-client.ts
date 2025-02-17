import { createClient } from "https://esm.sh/v135/@supabase/supabase-js@2.7.1/dist/module/index.js";

export const supabaseClient = createClient(
  Deno.env.get("MY_SUPABASE_URL") ?? "",
  Deno.env.get("MY_SUPABASE_ANON_KEY") ?? "",
);
