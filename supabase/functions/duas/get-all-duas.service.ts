import { validateLanguageCodes } from "../_shared/languages.service.ts";
import { createResponse } from "../_shared/response.ts";
import { formatDuaInfos } from "./dua.utils.ts";
import { Dua, DuaItemView } from "./duas.model.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

export async function getDuas(
  languageCodes: string[],
  page: number,
  pageSize: number,
  sort: string | null,
  types: string[],
  tags: string[],
  narrators: string[],
  reciters: string[],
  book: string | null,
  hasAudio: string | null,
  minWordCount: string | null,
  maxWordCount: string | null,
): Promise<Response> {
  const errorResponse = await validateLanguageCodes(
    languageCodes,
  );
  if (errorResponse) {
    return errorResponse;
  }

  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;

  let orderBy: { column: string; referencedTable: string; ascending: boolean } =
    { column: "page_views", referencedTable: "", ascending: false };
  if (sort === "name_asc") {
    orderBy = {
      column: "title",
      referencedTable: "dua_infos",
      ascending: true,
    };
  } else if (sort === "name_desc") {
    orderBy = {
      column: "title",
      referencedTable: "dua_infos",
      ascending: false,
    };
  } else if (sort === "popularity_asc") {
    orderBy = { column: "page_views", referencedTable: "", ascending: true };
  } else if (sort === "popularity_desc") {
    orderBy = { column: "page_views", referencedTable: "", ascending: false };
  }

  let query = supabaseClient
    .from("duas")
    .select(
      `
            route_name,
            background_image_low_quality_url,
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
    .filter("dua_infos.language_code", "in", `(${languageCodes.join(",")})`);

  if (types.length > 0) {
    const includeNull = types.includes("__none");
    const concreteTypes = types.filter((n) => n !== "__none");

    if (includeNull && concreteTypes.length > 0) {
      query = query.or(
        `type.in.(${concreteTypes.join(",")}),type.is.null`,
      );
    } else if (includeNull) {
      query = query.filter("type", "is", null);
    } else if (concreteTypes.length > 0) {
      query = query.filter("type", "in", `(${concreteTypes.join(",")})`);
    }
  }
  
  if (tags.length > 0) {
    const includeNone = tags.includes("__none");
    const concreteTags = tags.filter((t) => t !== "__none");

    if (includeNone && concreteTags.length > 0) {
      const { data: taggedDuas, error } = await supabaseClient
        .from("dua_has_tags")
        .select("dua_id, tags(name)")
        .in("tags.name", concreteTags);

      if (error) {
        console.error("Tag filter failed:", error);
        return createResponse(500, { error: "Tag filter failed" });
      }

      const matchingTagDuaIds = taggedDuas
        .filter((t) => t.tags !== null)
        .map((t) => t.dua_id);

      query = query.or(
        `id.in.(${matchingTagDuaIds.join(",")}),dua_has_tags.is.null`,
      );
    } else if (includeNone) {
      query = query.is("dua_has_tags", null);
    } else if (concreteTags.length > 0) {
      const { data: taggedDuas, error } = await supabaseClient
        .from("dua_has_tags")
        .select("dua_id, tags(name)")
        .in("tags.name", concreteTags);

      if (error) {
        console.error("Tag filter failed:", error);
        return createResponse(500, { error: "Tag filter failed" });
      }

      const matchingTagDuaIds = taggedDuas
        .filter((t) => t.tags !== null)
        .map((t) => t.dua_id);

      query = query.in("id", matchingTagDuaIds);
    }
  }

  if (narrators.length > 0) {
    const includeNull = narrators.includes("__none");
    const concreteNarrators = narrators.filter((n) => n !== "__none");

    if (includeNull && concreteNarrators.length > 0) {
      query = query.or(
        `narrator.in.(${concreteNarrators.join(",")}),narrator.is.null`,
      );
    } else if (includeNull) {
      query = query.filter("narrator", "is", null);
    } else if (concreteNarrators.length > 0) {
      query = query.filter(
        "narrator",
        "in",
        `(${concreteNarrators.join(",")})`,
      );
    }
  }

  if (reciters.length > 0) {
    const includeNone = reciters.includes("__none");
    const concreteReciters = reciters.filter((r) => r !== "__none");

    if (includeNone && concreteReciters.length > 0) {
      const { data: recitations, error } = await supabaseClient
        .from("dua_recitations")
        .select("dua_id, reciters(full_name_tl)")
        .in("reciters.full_name_tl", concreteReciters);

      if (error) {
        console.error(
          "Error fetching recitations by reciter:",
          JSON.stringify(error),
        );
        return createResponse(500, { error: "Reciter filter failed" });
      }

      const validRecitations = recitations.filter((r) => r.reciters !== null);
      const matchingDuaIds = validRecitations.map((r) => r.dua_id);
      query = query.or(
        `id.in.(${matchingDuaIds.join(",")}),dua_recitations.is.null`,
      );
    } else if (includeNone) {
      query = query.is("dua_recitations", null);
    } else if (concreteReciters.length > 0) {
      const { data: recitations, error } = await supabaseClient
        .from("dua_recitations")
        .select("dua_id, reciters(full_name_tl)")
        .in("reciters.full_name_tl", concreteReciters);

      if (error) {
        console.error(
          "Error fetching recitations by reciter:",
          JSON.stringify(error),
        );
        return createResponse(500, { error: "Reciter filter failed" });
      }

      const validRecitations = recitations.filter((r) => r.reciters !== null);
      const matchingDuaIds = validRecitations.map((r) => r.dua_id);
      query = query.in("id", matchingDuaIds);
    }
  }

  if (book) {
    if (book === "__none") {
      query = query.or("book.is.null,book.eq.");
    } else {
      query = query.eq("book", book);
    }
  }

  if (hasAudio === "true") {
    query = query.not("dua_recitations", "is", null);
  } else if (hasAudio === "false") {
    query = query.is("dua_recitations", null);
  }

  // TODO: This cannot work because only the word_count of one language should only be considered.
  // if (minWordCount) {
  //   query = query.gte("dua_infos.word_count", +minWordCount);
  // }
  // if (maxWordCount) {
  //   query = query.lte("dua_infos.word_count", +maxWordCount);
  // }

  const { data: duas, error, count } = await query
    .range(from, to)
    .order(orderBy.column, {
      referencedTable: orderBy.referencedTable,
      ascending: orderBy.ascending,
    });

  if (error) {
    console.error("Error fetching duas:", JSON.stringify(error));
    return createResponse(500, { error: `Internal Server Error` });
  }

  const formattedDuas: DuaItemView[] = duas.map((dua: Dua) => {
    const { title, description, wordCount } = formatDuaInfos(dua.dua_infos);
    const tags = dua.dua_has_tags.map((duaHasTag) => duaHasTag.tags.name);
    const languages = Object.keys(title);
    console.log("recit " + JSON.stringify(dua.dua_recitations));
    const uniqueReciters = Array.from(
      new Map(
        dua.dua_recitations?.filter((r) => r.reciters).map(
          (r) => [r.reciters.full_name_tl, r.reciters]
        ),
      ).values(),
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
      reciters: uniqueReciters,
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
