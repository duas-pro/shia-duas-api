import { createResponse } from "../_shared/response.ts";
import { supabaseClient } from "../_shared/supabase-client.ts";
import { getDuaRoutes } from "./get-all-dua-routes.service.ts";
import { getDuas } from "./get-all-duas.service.ts";
import { getDua } from "./get-single-dua.service.ts";

Deno.serve((req: Request) => {
  const { url, method } = req;

  if (method === "OPTIONS") {
    return createResponse(200, {});
  }

  try {
    const urlObj = new URL(url);
    // Required param
    const languageCodes =
      urlObj.searchParams.get("languages")?.split(",").map((lc) =>
        lc.toLowerCase()
      ) || [];

    // Pagination and Sort
    const page = urlObj.searchParams.get("page");
    const pageSize = urlObj.searchParams.get("size");
    const sort = urlObj.searchParams.get("sort");

    // Filter options
    const types = urlObj.searchParams.get("types")?.split(",").filter(n => n && n.trim() !== "").map((dt) => dt.toLowerCase()) ?? [];
    const tags = urlObj.searchParams.get("tags")?.split(",").filter(n => n && n.trim() !== "") ?? [];
    const narrators = urlObj.searchParams.get("narrators")?.split(",").filter(n => n && n.trim() !== "") ?? [];
    const reciters = urlObj.searchParams.get("reciters")?.split(",").filter(n => n && n.trim() !== "") ?? [];
    const book = urlObj.searchParams.get("book");
    const hasAudio = urlObj.searchParams.get("has_audio");
    const minWordCount = urlObj.searchParams.get("min_word_count");
    const maxWordCount = urlObj.searchParams.get("max_word_count");
    
    const taskPattern = new URLPattern({ pathname: "/duas/:id" });
    const matchingPath = taskPattern.exec(url);
    const routeName = matchingPath ? matchingPath.pathname.groups.id : null;

    if (urlObj.pathname === "/duas/routes") {
      return getDuaRoutes(supabaseClient);
    }

    if (routeName == null) {
      return getDuas(
        languageCodes,
        +(page ?? 1),
        +(pageSize ?? 10),
        sort,
        types,
        tags,
        narrators,
        reciters,
        book,
        hasAudio,
        minWordCount,
        maxWordCount
      );
    }
    return getDua(supabaseClient, routeName, languageCodes);
  } catch (error) {
    console.error(error);
    return createResponse(400, { error: (error as Error).message });
  }
});
