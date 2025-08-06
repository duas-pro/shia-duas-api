import { createResponse } from "../_shared/response.ts";

export const duaTypes = [
  "dua",
  "ziyarat",
  "munajat",
  "amal",
  "salawat",
  "salat",
  "tasbihat"
] as const;

Deno.serve(() => {
  return createResponse(200, {
    success: true,
    data: duaTypes,
  });
});
