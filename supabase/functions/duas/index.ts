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
    const languageCodes =
      urlObj.searchParams.get("languages")?.split(",").map((lc) =>
        lc.toLowerCase()
      ) || [];
    const duaTypes =
      urlObj.searchParams.get("types")?.split(",").map((dt) =>
        dt.toLowerCase()
      ) || [];
    const page = urlObj.searchParams.get("page");
    const pageSize = urlObj.searchParams.get("size");

    const taskPattern = new URLPattern({ pathname: "/duas/:id" });
    const matchingPath = taskPattern.exec(url);
    const routeName = matchingPath ? matchingPath.pathname.groups.id : null;

    if (urlObj.pathname === "/duas/routes") {
      return getDuaRoutes(supabaseClient);
    }

    if (routeName == null) {
      return getDuas(
        +(page ?? 1),
        +(pageSize ?? 10),
        languageCodes,
        duaTypes,
      );
    }
    return getDua(supabaseClient, routeName, languageCodes);
  } catch (error) {
    console.error(error);
    return createResponse(400, { error: (error as Error).message });
  }
});
