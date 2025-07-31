import SupabaseClient from "https://esm.sh/v135/@supabase/supabase-js@2.7.1/dist/module/SupabaseClient.js";
import { validateLanguageCodes } from "../_shared/languages.service.ts";
import { createResponse } from "../_shared/response.ts";
import { formatDuaInfos } from "./dua.utils.ts";
import { Dua, DuaItemView } from "./duas.model.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

export async function getDuas(
  page: number,
  pageSize: number,
  languageCodes: string[],
  types: string[] | null,
  narrators: string[] | null,
): Promise<Response> {
  const errorResponse = await validateLanguageCodes(
    languageCodes,
  );
  if (errorResponse) {
    return errorResponse;
  }

  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;

  let query = supabaseClient
    .from("duas")
    .select(
      `
            route_name,
            background_image_low_quality_url,
            background_image_high_quality_url,
            narrator,
            book,
            dua_infos (
                title,
                description,
                language_code,
                word_count
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
        `,
      { count: "exact" },
    )
    .filter("dua_infos.language_code", "in", `(${languageCodes.join(",")})`)    

  if (types && types.length > 0) {
    const includeNull = types.includes("__none");
    const concreteTypes = types.filter(n => n !== "__none");

    if (includeNull && concreteTypes.length > 0) {
      query = query.or(
        `type.in.(${concreteTypes.join(",")}),type.is.null`
      );
    } else if (includeNull) {
      query = query.filter("type", "is", null);
    } else if (concreteTypes.length > 0) {
      query = query.filter("type", "in", `(${concreteTypes.join(",")})`);
    }
  }
  if (narrators && narrators.length > 0) {
    const includeNull = narrators.includes("__none");
    const concreteNarrators = narrators.filter(n => n !== "__none");

    if (includeNull && concreteNarrators.length > 0) {
      query = query.or(
        `narrator.in.(${concreteNarrators.join(",")}),narrator.is.null`
      );
    } else if (includeNull) {
      query = query.filter("narrator", "is", null);
    } else if (concreteNarrators.length > 0) {
      query = query.filter("narrator", "in", `(${concreteNarrators.join(",")})`);
    }
  }
  const { data: duas, error, count } = await query
    .range(from, to)
    .order("page_views", { ascending: false })
    .order("id", { ascending: true });
  if (error) {
    console.error("Error fetching duas:", JSON.stringify(error));
    return createResponse(500, { error: `Internal Server Error` });
  }

  const formattedDuas: DuaItemView[] = duas.map((dua: Dua) => {
    const { title, description, wordCount } = formatDuaInfos(dua.dua_infos);
    const tags = dua.dua_has_tags.map((duaHasTag) => duaHasTag.tags.name);
    const languages = Object.keys(title);
    const uniqueReciters = Array.from(
      new Map(
        dua.dua_recitations.map(r => [r.reciters.full_name_tl, r.reciters])
      ).values()
    );
    return {
      route_name: dua.route_name,
      image_url: dua.background_image_low_quality_url,
      languages,
      title,
      description,
      word_count: wordCount,
      narrator: dua.narrator,
      book: dua.book,
      tags,
      reciters: uniqueReciters
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
