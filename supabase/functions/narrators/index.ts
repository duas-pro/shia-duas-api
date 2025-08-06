import { createResponse } from "../_shared/response.ts";

export const narrators = [
  "prophet-muhammad",
  "lady-fatimah",
  "imam-ali",
  "imam-hasan",
  "imam-hussain",
  "imam-sajjad",
  "imam-baqir",
  "imam-sadiq",
  "imam-kadhim",
  "imam-ridha",
  "imam-jawad",
  "imam-hadi",
  "imam-askari",
  "imam-mahdi"
] as const;

Deno.serve(() => {
  return createResponse(200, {
    success: true,
    data: narrators,
  });
});
