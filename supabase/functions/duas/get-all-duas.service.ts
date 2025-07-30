import SupabaseClient from "https://esm.sh/v135/@supabase/supabase-js@2.7.1/dist/module/SupabaseClient.js";
import { validateLanguageCodes } from "../_shared/languages.service.ts";
import { createResponse } from "../_shared/response.ts";
import { formatDuaInfos } from "./dua.utils.ts";
import { Dua, DuaItemView } from "./duas.model.ts";

export async function getDuas(
  supabaseClient: SupabaseClient,
  languageCodes: string[],
  page: number,
  pageSize: number,
): Promise<Response> {
  const errorResponse = await validateLanguageCodes(
    supabaseClient,
    languageCodes,
  );
  if (errorResponse) {
    return errorResponse;
  }

  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;

  const { data: duas, error, count } = await supabaseClient
    .from("duas")
    .select(
      `
            route_name,
            background_image_low_quality_url,
            background_image_high_quality_url,
            page_views,
            dua_infos (
                title,
                description,
                language_code,
                narrated_by
            ),
            dua_has_tags (
                tags (
                    name
                )
            )
        `,
      { count: "exact" },
    )
    .filter("dua_infos.language_code", "in", `(${languageCodes.join(",")})`)
    .range(from, to)
    .order("page_views", { ascending: false })
    .order("id", { ascending: true });

  if (error) {
    console.error("Error fetching duas:", JSON.stringify(error));
    return createResponse(500, { error: `Internal Server Error` });
  }

  const formattedDuas: DuaItemView[] = duas.map((dua: Dua) => {
    const { title, description, narratedBy } = formatDuaInfos(dua.dua_infos);
    const tags = dua.dua_has_tags.map((duaHasTag) => duaHasTag.tags.name);
    const languages = Object.keys(title);

    return {
      route_name: dua.route_name,
      image_url: dua.background_image_low_quality_url,
      languages,
      title: title,
      description: description,
      narratedBy,
      tags,
    };
  });

  const totalPages = Math.ceil((count || 0) / pageSize);

  return createResponse(200, {
    data: formattedDuas,
    pagination: {
      page,
      pageSize,
      totalPages,
      totalCount: count,
    },
  });
}
