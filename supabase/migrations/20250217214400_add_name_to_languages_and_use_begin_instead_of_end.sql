create extension if not exists "moddatetime" with schema "extensions";


alter table "public"."dua_lines" drop column "end_of_section";

alter table "public"."dua_lines" add column "begin_of_section" boolean not null;

alter table "public"."languages" add column "name_in_en" text;

CREATE TRIGGER handle_duas_updated_at BEFORE UPDATE ON public.duas FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');
