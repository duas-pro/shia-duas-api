drop policy "Enable read access for all users" on "public"."narrators";

revoke delete on table "public"."narrators" from "anon";

revoke insert on table "public"."narrators" from "anon";

revoke references on table "public"."narrators" from "anon";

revoke select on table "public"."narrators" from "anon";

revoke trigger on table "public"."narrators" from "anon";

revoke truncate on table "public"."narrators" from "anon";

revoke update on table "public"."narrators" from "anon";

revoke delete on table "public"."narrators" from "authenticated";

revoke insert on table "public"."narrators" from "authenticated";

revoke references on table "public"."narrators" from "authenticated";

revoke select on table "public"."narrators" from "authenticated";

revoke trigger on table "public"."narrators" from "authenticated";

revoke truncate on table "public"."narrators" from "authenticated";

revoke update on table "public"."narrators" from "authenticated";

revoke delete on table "public"."narrators" from "service_role";

revoke insert on table "public"."narrators" from "service_role";

revoke references on table "public"."narrators" from "service_role";

revoke select on table "public"."narrators" from "service_role";

revoke trigger on table "public"."narrators" from "service_role";

revoke truncate on table "public"."narrators" from "service_role";

revoke update on table "public"."narrators" from "service_role";

alter table "public"."duas" drop constraint "public_duas_narrator_id_fkey";

alter table "public"."narrators" drop constraint "narrators_pkey";

drop index if exists "public"."narrators_pkey";

drop table "public"."narrators";

alter table "public"."dua_infos" add column "seo_description" text;

alter table "public"."dua_infos" add column "word_count" bigint;

alter table "public"."dua_recitations" add column "api_calls" bigint not null default '0'::bigint;

alter table "public"."duas" drop column "narrator_id";

alter table "public"."duas" add column "api_calls" bigint not null default '0'::bigint;

alter table "public"."duas" add column "book" text;

alter table "public"."duas" add column "narrator" text;


