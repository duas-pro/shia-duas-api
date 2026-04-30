# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Supabase Edge Functions API (Deno/TypeScript) for duas.pro — a multi-language collection of Shia Islamic supplications (duas) and pilgrimage prayers (ziyarat). The API serves content in 8 languages with audio recitations and line-by-line translations.

- **Frontend repo**: duas.pro (separate repo)
- **API docs**: Postman workspace at postman.com/duas-pro/workspace/shia-duas-api

## Development Commands

Prerequisites: Docker must be running.

```bash
supabase start                             # Start local Supabase stack (DB, Studio, Auth)
supabase functions serve --no-verify-jwt  # Serve all Edge Functions locally

# Local endpoints
# API:     http://127.0.0.1:54321/functions/v1/<function-name>
# Studio:  http://localhost:54323

# Database migrations
supabase db diff --schema public          # Generate migration from local schema changes
```

Migrations live in `supabase/migrations/` and must follow the `<timestamp>_<description>.sql` naming convention. Edge Functions and migrations deploy automatically on push to `main`.

## Architecture

### Edge Functions (`supabase/functions/`)

Each subdirectory is an independent Edge Function with its own `index.ts` entry point. HTTP routing inside a function uses the `URLPattern` API:

```typescript
const pattern = new URLPattern({ pathname: "/duas/:id" });
const match = pattern.exec(url);
const id = match?.pathname.groups.id ?? null;
```

Key functions:
- `duas/` — main content endpoint; handles both list (`GET /duas`) and detail (`GET /duas/:id`)
- `collections/` — dua collections by language
- `posts/` — blog/article posts
- `routes/` — all slugs for sitemap generation
- `audios/`, `reciters/`, `languages/`, `tags/`, `books/`, `narrators/`, `types/` — reference data

### Shared Utilities (`supabase/functions/_shared/`)

- **`supabase-client.ts`** — anonymous Supabase client (read-only public access)
- **`supabase-admin.ts`** — service-role client (used only for `api_calls` increment writes)
- **`response.ts`** — creates JSON responses with CORS headers (`Access-Control-Allow-Origin: *`)
- **`languages.service.ts`** — validates and fetches supported language codes
- **`language.model.ts`** — `Language` interface

### Service Layer (inside `duas/`)

Business logic is split into service files:
- `get-all-duas.service.ts` — filtering, pagination, sorting for list view
- `get-single-dua.service.ts` — full dua detail with lines and recitations
- `dua.utils.ts` — `formatDuaInfos()` and `formatDuaLines()` helpers
- `duas.model.ts` — TypeScript interfaces (`Dua`, `DuaLine`, `DuaInfo`, `Reciter`, `DuaRecitation`)

### Database Schema

Core tables:
- `duas` — main records (slug, tags, narrator, book, page_views, api_calls)
- `dua_infos` — per-language titles/descriptions (dua_id, language_code, title, seo_description, word_count)
- `dua_lines` — individual lines (dua_id, line_number, type, begin_of_section, repetitions_number)
- `dua_line_texts` — per-language line text (dua_line_id, language_code, text, section_title)
- `dua_recitations` — audio files (dua_id, reciter_id, duration_in_ms, audio URLs)
- `dua_lines_has_recitations` — timing sync data (dua_line_id, dua_recitation_id, start_time_in_ms)
- `collections` + `collection_has_duas` + `collection_translations` — grouped dua sets
- `posts` + `post_translations` — multi-language blog content
- `reciters`, `languages`, `tags`, `dua_has_tags` — reference/junction tables

All tables have Row Level Security enabled with public read access for `anon` and `authenticated` roles.

### API Response Format

All endpoints return a consistent shape:
```json
{
  "data": [...],
  "pagination": { "page": 1, "pageSize": 10, "totalPages": 5, "totalCount": 50 },
  "success": true,
  "error": null
}
```

### Environment Variables

```
SUPABASE_URL
SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY   # Only needed for write operations (api_calls tracking)
```

These are injected automatically by the Supabase runtime in both local and production environments.
