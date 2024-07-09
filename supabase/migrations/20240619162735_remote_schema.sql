
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

COMMENT ON SCHEMA "public" IS 'standard public schema';

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

CREATE TYPE "public"."TextLineType" AS ENUM (
    'TITLE',
    'DESCRIPTION',
    'TEXT',
    'REMARK'
);

ALTER TYPE "public"."TextLineType" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."dua_audios" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);

ALTER TABLE "public"."dua_audios" OWNER TO "postgres";

ALTER TABLE "public"."dua_audios" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."audio_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."dua_content_lines" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "dua_content_id" bigint NOT NULL,
    "line_number" bigint NOT NULL,
    "text" "text" NOT NULL,
    "repetitions_number" smallint,
    "end_of_section" boolean DEFAULT false NOT NULL
);

ALTER TABLE "public"."dua_content_lines" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."dua_contents" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "dua_id" bigint NOT NULL,
    "language_id" bigint NOT NULL,
    "title" "text" NOT NULL,
    "description" "text",
    "state" "text",
    "narrated_by" "text"
);

ALTER TABLE "public"."dua_contents" OWNER TO "postgres";

ALTER TABLE "public"."dua_contents" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."dua_contents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."dua_has_tags" (
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "dua_id" bigint NOT NULL,
    "tag_id" bigint NOT NULL
);

ALTER TABLE "public"."dua_has_tags" OWNER TO "postgres";

ALTER TABLE "public"."dua_content_lines" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."dua_translation_lines_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."duas" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "route_name" "text" NOT NULL,
    "image_url" "text"
);

ALTER TABLE "public"."duas" OWNER TO "postgres";

ALTER TABLE "public"."duas" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."duas_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."languages" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "name" "text" NOT NULL,
    "code" "text" NOT NULL
);

ALTER TABLE "public"."languages" OWNER TO "postgres";

ALTER TABLE "public"."languages" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."languages_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."reciters" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);

ALTER TABLE "public"."reciters" OWNER TO "postgres";

ALTER TABLE "public"."reciters" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."reciter_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."references" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "url" "text" NOT NULL,
    "type" "text" NOT NULL,
    "dua_id" bigint NOT NULL,
    "language_id" bigint
);

ALTER TABLE "public"."references" OWNER TO "postgres";

ALTER TABLE "public"."references" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."references_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."tags" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone,
    "name" "text" NOT NULL
);

ALTER TABLE "public"."tags" OWNER TO "postgres";

ALTER TABLE "public"."tags" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."tags_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY "public"."dua_audios"
    ADD CONSTRAINT "audio_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."dua_contents"
    ADD CONSTRAINT "dua_contents_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."dua_has_tags"
    ADD CONSTRAINT "dua_has_tags_pkey" PRIMARY KEY ("dua_id", "tag_id");

ALTER TABLE ONLY "public"."dua_content_lines"
    ADD CONSTRAINT "dua_translation_lines_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."duas"
    ADD CONSTRAINT "duas_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."duas"
    ADD CONSTRAINT "duas_route_name_key" UNIQUE ("route_name");

ALTER TABLE ONLY "public"."languages"
    ADD CONSTRAINT "languages_code_key" UNIQUE ("code");

ALTER TABLE ONLY "public"."languages"
    ADD CONSTRAINT "languages_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."reciters"
    ADD CONSTRAINT "reciter_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."references"
    ADD CONSTRAINT "references_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."tags"
    ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."dua_content_lines"
    ADD CONSTRAINT "dua_content_lines_dua_content_id_fkey" FOREIGN KEY ("dua_content_id") REFERENCES "public"."dua_contents"("id");

ALTER TABLE ONLY "public"."dua_contents"
    ADD CONSTRAINT "dua_contents_dua_id_fkey" FOREIGN KEY ("dua_id") REFERENCES "public"."duas"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."dua_contents"
    ADD CONSTRAINT "dua_contents_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "public"."languages"("id") ON UPDATE CASCADE;

ALTER TABLE ONLY "public"."dua_has_tags"
    ADD CONSTRAINT "dua_has_tags_dua_id_fkey" FOREIGN KEY ("dua_id") REFERENCES "public"."duas"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."dua_has_tags"
    ADD CONSTRAINT "dua_has_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "public"."tags"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."references"
    ADD CONSTRAINT "references_dua_id_fkey" FOREIGN KEY ("dua_id") REFERENCES "public"."duas"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."references"
    ADD CONSTRAINT "references_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "public"."languages"("id") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE POLICY "Enable read access for all users" ON "public"."dua_content_lines" FOR SELECT TO "anon" USING (true);

CREATE POLICY "Enable read access for all users" ON "public"."dua_has_tags" FOR SELECT TO "anon" USING (true);

CREATE POLICY "Enable read access for all users" ON "public"."duas" FOR SELECT TO "anon" USING (true);

CREATE POLICY "Enable read access for all users" ON "public"."languages" FOR SELECT TO "anon" USING (true);

CREATE POLICY "Enable read access for all users" ON "public"."tags" FOR SELECT TO "anon" USING (true);

ALTER TABLE "public"."dua_audios" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."dua_content_lines" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."dua_contents" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."dua_has_tags" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."duas" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."languages" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."reciters" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."references" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."tags" ENABLE ROW LEVEL SECURITY;

ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON TABLE "public"."dua_audios" TO "anon";
GRANT ALL ON TABLE "public"."dua_audios" TO "authenticated";
GRANT ALL ON TABLE "public"."dua_audios" TO "service_role";

GRANT ALL ON SEQUENCE "public"."audio_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."audio_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."audio_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."dua_content_lines" TO "anon";
GRANT ALL ON TABLE "public"."dua_content_lines" TO "authenticated";
GRANT ALL ON TABLE "public"."dua_content_lines" TO "service_role";

GRANT ALL ON TABLE "public"."dua_contents" TO "anon";
GRANT ALL ON TABLE "public"."dua_contents" TO "authenticated";
GRANT ALL ON TABLE "public"."dua_contents" TO "service_role";

GRANT ALL ON SEQUENCE "public"."dua_contents_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."dua_contents_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."dua_contents_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."dua_has_tags" TO "anon";
GRANT ALL ON TABLE "public"."dua_has_tags" TO "authenticated";
GRANT ALL ON TABLE "public"."dua_has_tags" TO "service_role";

GRANT ALL ON SEQUENCE "public"."dua_translation_lines_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."dua_translation_lines_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."dua_translation_lines_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."duas" TO "anon";
GRANT ALL ON TABLE "public"."duas" TO "authenticated";
GRANT ALL ON TABLE "public"."duas" TO "service_role";

GRANT ALL ON SEQUENCE "public"."duas_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."duas_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."duas_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."languages" TO "anon";
GRANT ALL ON TABLE "public"."languages" TO "authenticated";
GRANT ALL ON TABLE "public"."languages" TO "service_role";

GRANT ALL ON SEQUENCE "public"."languages_code_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."languages_code_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."languages_code_seq" TO "service_role";

GRANT ALL ON TABLE "public"."reciters" TO "anon";
GRANT ALL ON TABLE "public"."reciters" TO "authenticated";
GRANT ALL ON TABLE "public"."reciters" TO "service_role";

GRANT ALL ON SEQUENCE "public"."reciter_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."reciter_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."reciter_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."references" TO "anon";
GRANT ALL ON TABLE "public"."references" TO "authenticated";
GRANT ALL ON TABLE "public"."references" TO "service_role";

GRANT ALL ON SEQUENCE "public"."references_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."references_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."references_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."tags" TO "anon";
GRANT ALL ON TABLE "public"."tags" TO "authenticated";
GRANT ALL ON TABLE "public"."tags" TO "service_role";

GRANT ALL ON SEQUENCE "public"."tags_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."tags_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."tags_id_seq" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
