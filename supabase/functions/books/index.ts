import { createResponse } from "../_shared/response.ts";

export const books = [
  "mafatih-ul-jinan",
  "sahifa-sadschadiyya"
] as const;

Deno.serve(() => {
  return createResponse(200, {
    success: true,
    data: books,
  });
});
