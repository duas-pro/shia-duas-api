CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- GIN trigram index enables fast fuzzy/ilike searches on dua_infos.title
CREATE INDEX IF NOT EXISTS idx_dua_infos_title_trgm
  ON public.dua_infos USING gin(title gin_trgm_ops);

-- Returns distinct dua_ids whose title fuzzy-matches the search term in the given languages.
-- Uses word_similarity so partial-word typos ("Allegianca", "Alegiance") still match.
CREATE OR REPLACE FUNCTION search_dua_ids_by_title(
  p_search       text,
  p_language_codes text[]
)
RETURNS TABLE(dua_id bigint)
LANGUAGE sql
STABLE
AS $$
  SELECT DISTINCT di.dua_id
  FROM public.dua_infos di
  WHERE di.language_code = ANY(p_language_codes)
    AND (
      di.title ILIKE '%' || p_search || '%'
      OR word_similarity(p_search, di.title) > 0.3
    );
$$;

GRANT EXECUTE ON FUNCTION search_dua_ids_by_title(text, text[]) TO anon, authenticated;
