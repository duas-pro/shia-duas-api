import { createResponse } from "../_shared/response.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

type SlugRow = { slug: string };

type PostTransRow = {
  post_id: string | number;   // ggf. auf deinen FK-Namen anpassen
  language_code: string;
  slug: string;
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return createResponse(200, {});

  try {
    // Parallel laden
    const [duasRes, collsRes, postsRes] = await Promise.all([
      supabaseClient.from("duas").select("slug"),
      supabaseClient.from("collections").select("slug"),
      supabaseClient.from("post_translations").select("post_id, language_code, slug"),
    ]);

    // Fehlerbehandlung
    if (duasRes.error || collsRes.error || postsRes.error) {
      console.error("Error fetching routes", {
        duas: duasRes.error,
        colls: collsRes.error,
        posts: postsRes.error
      });
      return createResponse(500, { error: "Internal Server Error" });
    }

    // Slugs (duas/collections sind unique & non-null)
    const duas = (duasRes.data as SlugRow[]).map(d => d.slug);
    const collections = (collsRes.data as SlugRow[]).map(c => c.slug);

    // Posts: pro Artikel gruppieren → { en: "...", de: "...", ... }
    const grouped = (postsRes.data as PostTransRow[]).reduce((acc, row) => {
      const key = String(row.post_id);
      acc[key] ??= {};
      acc[key][row.language_code] = row.slug;
      return acc;
    }, {} as Record<string, Record<string, string>>);

    const posts = Object.values(grouped); // Array von {en: slug, de: slug, ...}

    // Finales Sitemap-Format
    return createResponse(200, { data: { duas, collections, posts } });
  } catch (error) {
    console.error(error);
    return createResponse(400, { error: (error as Error).message });
  }
});
