// /posts.ts (Deno Edge Function)
import { createResponse } from "../_shared/response.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";

type ListSort = "newest" | "oldest" | "updated" | "popular";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return createResponse(200, {});

  try {
    const url = new URL(req.url);
    const lang = (url.searchParams.get("language") || "").trim().toLowerCase();
    const slug = url.searchParams.get("slug")?.trim() || null;

    const page = Math.max(1, parseInt(url.searchParams.get("page") || "1", 10));
    const size = Math.min(
      50,
      Math.max(1, parseInt(url.searchParams.get("size") || "10", 10)),
    );
    const sort = (url.searchParams.get("sort") || "newest")
      .toLowerCase() as ListSort;

    // --------------------------
    // DETAILS: /posts?lang=de&slug=willkommen--suffix
    // --------------------------
    if (slug) {
      const slugSuffix = slug.split("--")[1];
      const { data: row, error: detailErr } = await supabaseClient
        .from("post_translations")
        .select(`
          post_id,
          language_code,
          slug,
          title,
          excerpt,
          body_markdown,
          posts!inner (
            id,
            created_at,
            updated_at,
            cover_image_url,
            slug_suffix,
            topic
          )
        `)
        .eq("language_code", lang)
        .eq("posts.slug_suffix", slugSuffix)
        .single();

      if (detailErr) {
        console.error("Post detail fetch error:", detailErr);
        return createResponse(500, { error: "Internal Server Error" });
      }
      if (!row) {
        return createResponse(404, { error: "Post not found" });
      }

      return createResponse(200, {
        data: {
          id: row.posts.id,
          language: row.language_code,
          slug: row.slug,
          title: row.title,
          excerpt: row.excerpt,
          body_markdown: row.body_markdown,
          created_at: row.posts.created_at,
          updated_at: row.posts.updated_at,
          cover_image_url: row.posts.cover_image_url,
          slug_suffix: row.posts.slug_suffix,
          topic: row.posts.topic,
        },
      });
    }

    if (!lang) {
      return createResponse(400, {
        error: "Missing required parameter: language",
      });
    }

    // --------------------------
    // LIST: /posts?lang=de&page=1&size=12&sort=newest
    // --------------------------
    const from = (page - 1) * size;
    const to = from + size - 1;

    const baseQuery = supabaseClient
      .from("post_translations")
      .select(
        `
        slug,
        title,
        excerpt,
        language_code,
        posts!inner(
          id,
          created_at,
          updated_at,
          cover_image_url,
          slug_suffix,
          topic
        )
      `,
        { count: "exact" },
      )
      .eq("language_code", lang);

    // Sortierung
    // Hinweis: Für "popular" brauchst du z. B. eine Spalte posts.views
    const applySort = (s: ListSort) => {
      switch (s) {
        case "oldest":
          baseQuery.order("created_at", {
            ascending: true,
            referencedTable: "posts",
            nullsFirst: true,
          });
          break;
        case "updated":
          baseQuery.order("updated_at", {
            ascending: false,
            referencedTable: "posts",
            nullsFirst: false,
          });
          baseQuery.order("created_at", {
            ascending: false,
            referencedTable: "posts",
            nullsFirst: false,
          });
          break;
        case "popular":
          // Falls es keine "views"-Spalte gibt, fallback auf newest
          baseQuery.order("views", {
            ascending: false,
            referencedTable: "posts",
            nullsFirst: false,
          }).order(
            "created_at",
            { ascending: false, referencedTable: "posts", nullsFirst: false },
          );
          break;
        case "newest":
        default:
          baseQuery.order("created_at", {
            ascending: false,
            referencedTable: "posts",
            nullsFirst: false,
          });
          break;
      }
      // Sekundär sortieren, um stabile Reihenfolge zu haben
      baseQuery.order("id", {
        ascending: false,
        referencedTable: "posts",
        nullsFirst: false,
      });
    };

    applySort(sort);

    const { data, error: listErr, count } = await baseQuery.range(from, to);

    if (listErr) {
      console.error("Posts list fetch error:", listErr);
      return createResponse(500, { error: "Internal Server Error" });
    }

    const items = (data ?? []).map((r: any) => ({
      slug: r.slug,
      title: r.title,
      excerpt: r.excerpt,
      language: r.language_code,
      created_at: r.posts.created_at,
      updated_at: r.posts.updated_at,
      cover_image_url: r.posts.cover_image_url,
      slug_suffix: r.posts.slug_suffix,
      topic: r.posts.topic,
    }));

    const total = count ?? 0;
    const total_pages = Math.ceil(total / size);

    return createResponse(200, {
      data: {
        items,
        lang,
      },
      pagination: {
        page,
        pageSize: size,
        totalPages: total_pages,
        totalCount: total,
      },
    });
  } catch (error) {
    console.error(error);
    return createResponse(400, { error: (error as Error).message });
  }
});
