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
  collections: string[],
): Promise<Response> {
  const errorResponse = await validateLanguageCodes(languageCodes);
  if (errorResponse) return errorResponse;

  const from = (page - 1) * pageSize;
  const to = from + pageSize - 1;

  // 1) Selects vorbereiten
  const selectLeft = `
    id,
    slug,
    background_image_low_quality_url,
    narrator,
    book,
    tags,
    dua_infos (
      title,
      description,
      language_code,
      word_count
    ),
    dua_recitations (
      uuid,
      duration_in_ms,
      reciters ( full_name_tl, full_name_ar, profile_image_url )
    ),
    collection_has_duas!left (
      collection_id,
      collections (
        id,
        slug,
        image_url,
        collection_translations ( language_code, title, description, seo_description )
      )
    )
  `;

  const selectInner = selectLeft.replace("!left", "!inner");

  const hasCollectionFilter = Array.isArray(collections) &&
    collections.length > 0;

  // 2) Query-Grundlage (Join-Typ abhängig vom Filter)
  let query = supabaseClient
    .from("duas")
    .select(hasCollectionFilter ? selectInner : selectLeft, { count: "exact" })
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
      query = query.or(
        `tags.overlaps.{${concreteTags.join(",")}},tags.is.null`,
      );
    } else if (includeNone) {
      query = query.is("tags", null);
    } else if (concreteTags.length > 0) {
      query = query.overlaps("tags", concreteTags);
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

  // 3) Collections-Filter (nur Slugs, kein __none)
  if (hasCollectionFilter) {
    const { data: colRows, error: colErr } = await supabaseClient
      .from("collections")
      .select("id")
      .in("slug", collections);

    if (colErr) {
      console.error("Error resolving collection slugs:", colErr);
      return createResponse(500, { error: "Internal Server Error" });
    }

    const colIds = (colRows ?? []).map((r) => r.id);

    if (colIds.length === 0) {
      return createResponse(200, {
        data: [],
        pagination: { page, pageSize, totalPages: 0, totalCount: 0 },
      });
    }

    query = query.in("collection_has_duas.collection_id", colIds);
  }

  // --- Reciter-Filter (deins, unverändert in Logik) ---
  if (reciters.length > 0) {
    const includeNone = reciters.includes("__none");
    const concreteReciters = reciters.filter((r) => r !== "__none");

    // resolve dua_ids per reciter
    const { data: recitations, error: recErr } = concreteReciters.length > 0
      ? await supabaseClient
        .from("dua_recitations")
        .select("dua_id, reciters(full_name_tl)")
        .in("reciters.full_name_tl", concreteReciters)
      : { data: [], error: null };

    if (recErr) {
      console.error(
        "Error fetching recitations by reciter:",
        JSON.stringify(recErr),
      );
      return createResponse(500, { error: "Reciter filter failed" });
    }

    const validRecitations = (recitations ?? []).filter((r) =>
      r.reciters !== null
    );
    const matchingDuaIds = validRecitations.map((r) => r.dua_id);

    if (includeNone && concreteReciters.length > 0) {
      query = query.or(
        `id.in.(${matchingDuaIds.join(",")}),dua_recitations.is.null`,
      );
    } else if (includeNone) {
      query = query.is("dua_recitations", null);
    } else if (concreteReciters.length > 0) {
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
  
  if (hasAudio === "true") query = query.not("dua_recitations", "is", null);
  else if (hasAudio === "false") query = query.is("dua_recitations", null);

  // TODO: This cannot work because only the word_count of one language should only be considered.
  // if (minWordCount) {
  //   query = query.gte("dua_infos.word_count", +minWordCount);
  // }
  // if (maxWordCount) {
  //   query = query.lte("dua_infos.word_count", +maxWordCount);
  // }

  // Sort
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

  // --- Mapping: dua_infos + collections(collection_translations) ins gewünschte Schema ---
  const formatted = (duas ?? []).map((dua: any) => {
    const { title, description, wordCount } = formatDuaInfos(dua.dua_infos);
    const languages = Object.keys(title);

    const uniqueReciters = Array.from(
      new Map(
        (dua.dua_recitations ?? [])
          .filter((r: any) => r.reciters)
          .map((r: any) => [r.reciters.full_name_tl, r.reciters]),
      ).values(),
    );

    const collectionsRaw = (dua.collection_has_duas ?? [])
      .map((chd: any) => chd.collections)
      .filter(Boolean);

    const seen = new Set<string>();
    const collectionsView = collectionsRaw.filter((c: any) => {
      if (seen.has(c.id)) return false;
      seen.add(c.id);
      return true;
    }).map((c: any) => {
      const tTitle: Record<string, string | null> = {};
      const tDesc: Record<string, string | null> = {};
      const tSeo: Record<string, string | null> = {};
      (c.collection_translations ?? []).forEach((tr: any) => {
        tTitle[tr.language_code] = tr.title ?? null;
        tDesc[tr.language_code] = tr.description ?? null;
        tSeo[tr.language_code] = tr.seo_description ?? null;
      });
      return {
        id: c.id,
        slug: c.slug,
        image_url: c.image_url,
        title: tTitle,
        description: tDesc,
        seo_description: tSeo,
      };
    });

    return {
      slug: dua.slug,
      image_url: dua.background_image_low_quality_url,
      languages,
      title,
      description,
      word_count: wordCount,
      narrator: dua.narrator,
      book: dua.book,
      tags: dua.tags,
      reciters: uniqueReciters,
      collections: collectionsView,
    } as DuaItemView;
  });

  const totalPages = Math.ceil((count || 0) / pageSize);

  return createResponse(200, {
    data: formatted,
    pagination: { page, pageSize, totalPages, totalCount: count },
  });
}
