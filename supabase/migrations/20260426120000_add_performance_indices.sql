-- Composite index on dua_infos covers both the FK join and the language_code filter
CREATE INDEX idx_dua_infos_dua_id_language_code ON public.dua_infos (dua_id, language_code);

-- dua_lines joined by dua_id
CREATE INDEX idx_dua_lines_dua_id ON public.dua_lines (dua_id);

-- Composite index on dua_line_texts covers both the FK join and the language_code filter
CREATE INDEX idx_dua_line_texts_dua_line_id_language_code ON public.dua_line_texts (dua_line_id, language_code);

-- dua_recitations joined by dua_id
CREATE INDEX idx_dua_recitations_dua_id ON public.dua_recitations (dua_id);

-- collection_translations joined by collection_id
CREATE INDEX idx_collection_translations_collection_id ON public.collection_translations (collection_id);

-- Atomic api_calls increment to avoid a read-modify-write round-trip on every dua fetch
CREATE OR REPLACE FUNCTION increment_dua_api_calls(p_slug TEXT)
RETURNS VOID
LANGUAGE SQL
SECURITY DEFINER
AS $$
  UPDATE duas SET api_calls = api_calls + 1 WHERE slug = p_slug;
$$;

GRANT EXECUTE ON FUNCTION increment_dua_api_calls(text) TO service_role;
