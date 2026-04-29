
CREATE TABLE IF NOT EXISTS live_reading_sessions (
  id           UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id      UUID        REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  code         TEXT        NOT NULL UNIQUE,
  name         TEXT        NOT NULL,
  dua_slug     TEXT        NOT NULL,
  dua_title    JSONB       NOT NULL DEFAULT '{}',
  schedule     JSONB       NOT NULL,
  created_at   TIMESTAMPTZ DEFAULT NOW() NOT NULL
);
ALTER TABLE live_reading_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage their own sessions"
  ON live_reading_sessions FOR ALL
  USING  (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
