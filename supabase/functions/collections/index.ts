import { supabaseClient } from "../_shared/supabase-client.ts";
import { createResponse } from "../_shared/response.ts";

const excludedCollection = ["sirat-guide"];

Deno.serve(async (req: Request) => {
  const { url, method } = req;

  if (method === "OPTIONS") {
    return createResponse(200, {});
  }

  const urlObj = new URL(url);
  // Required param
  const languageCodes =
    urlObj.searchParams.get("languages")?.split(",").map((lc) =>
      lc.toLowerCase()
    ) || [];

  const { data: collections, error } = await supabaseClient
    .from("collections")
    .select(
      `slug, 
       image_url, 
       type,
       collection_has_duas(count),
       collection_translations(
         title, 
         description, 
         seo_description, 
         language_code
       )`
    )
    .not("slug", "in", `(${excludedCollection.join(",")})`)
    .filter(
      "collection_translations.language_code",
      "in",
      `(${languageCodes.join(",")})`,
    )
    .order("page_views", { ascending: false });

  if (error) {
    console.error(
      "Error while fetching collections " + String(error?.message ?? error),
    );
    return createResponse(500, { error: `Internal Server Error` });
  }

  // 👉 Mapping in Variante 1 Schema (direkt title/description als Objekte)
  const mappedCollections = collections.map((col) => {
    const title: Record<string, string | null> = {};
    const description: Record<string, string | null> = {};
    const seo_description: Record<string, string | null> = {};

    col.collection_translations.forEach((tr) => {
      title[tr.language_code] = tr.title;
      description[tr.language_code] = tr.description;
      seo_description[tr.language_code] = tr.seo_description;
    });

    // ⚠️ PostgREST gibt bei Aggregaten ein Array mit einem Objekt { count: number } zurück.
    // Fallback: falls Aggregat nicht greift, Länge zählen (nur wenn IDs selektiert würden).
    const dua_count =
      col.collection_has_duas?.[0]?.count ??
      (Array.isArray(col.collection_has_duas) ? col.collection_has_duas.length : 0) ??
      0;
    return {
      slug: col.slug,
      image_url: col.image_url,
      type: col.type,
      title,
      description,
      seo_description,
      dua_count,
    };
  });

  return createResponse(200, {
    data: mappedCollections,
  });
});
