import SupabaseClient from "https://esm.sh/v135/@supabase/supabase-js@2.7.1/dist/module/SupabaseClient.js";
import { validateLanguageCodes } from "../_shared/languages.service.ts";
import { createResponse } from "../_shared/response.ts";
import { formatDuaInfos, formatDuaLines } from "./dua.utils.ts";
import { Dua, DuaView } from "./duas.model.ts";
import { supabaseAdmin } from "../_shared/supabase-admin.ts";

export async function getDua(
  supabaseClient: SupabaseClient,
  routeName: string,
  languageCodes: string[],
): Promise<Response> {
  const errorResponse = await validateLanguageCodes(languageCodes);
  if (errorResponse) {
    return errorResponse;
  }

  const { data: duas, error } = await supabaseClient
    .from("duas")
    .select(`
            route_name,
            background_image_low_quality_url,
            background_image_high_quality_url,
            narrator,
            book,
            api_calls,
            dua_infos (
                title,
                description,
                seo_description,
                language_code,
                word_count
            ),
            dua_lines (
                line_number,
                type,
                begin_of_section,
                repetitions_number,
                dua_line_texts (
                    text,
                    language_code
                )
            ),
            dua_has_tags (
                tags (
                    name
                )
            ),
            dua_recitations (
                uuid,
                duration_in_ms,
                reciters (
                    full_name_tl,
                    full_name_ar,
                    profile_image_url
                )
            )
        `)
    .eq("route_name", routeName)
    .filter("dua_infos.language_code", "in", `(${languageCodes.join(",")})`)
    .filter(
      "dua_lines.dua_line_texts.language_code",
      "in",
      `(${languageCodes.join(",")})`,
    )
    .order("line_number", { referencedTable: "dua_lines", ascending: true })
    .order("audio_plays", {
      referencedTable: "dua_recitations",
      ascending: false,
    })
    .limit(1);

  if (error) {
    console.error(
      "Error while receiving single dua " + routeName + ", error: " +
        JSON.stringify(error),
    );
    return createResponse(500, { error: `Internal Server Error` });
  }

  if (duas.length === 0) {
    return createResponse(404, { error: "Not Found" });
  }

  const dua = duas[0] as unknown as Dua;

  const newApiCallsCount = dua.api_calls + 1;
  const { increaseError } = await supabaseAdmin.from("duas").update({
    "api_calls": newApiCallsCount,
  }).eq("route_name", routeName);
  if (increaseError) {
    console.error("Error while increasing api_calls to " + newApiCallsCount + " for " + routeName + ": " + JSON.stringify(increaseError));
  }

  const { title, description, seoDescription, wordCount } = formatDuaInfos(dua.dua_infos);
  const lines = formatDuaLines(dua.dua_lines!);
  const tags = dua.dua_has_tags.map((duaHasTag) => duaHasTag.tags.name);

  const formattedDua: DuaView = {
    route_name: dua.route_name,
    image_url: dua.background_image_high_quality_url,
    narrator: dua.narrator,
    book: dua.book,
    title,
    description,
    seo_description: seoDescription,
    word_count: wordCount,
    tags,
    languages: languageCodes,
    recitations: dua.dua_recitations!,
    lines,
  };

  return createResponse(200, { "data": formattedDua });
}
