drop policy "Enable read access for all users" on "public"."dua_has_tags";

drop policy "Enable read access for all users" on "public"."tags";

revoke delete on table "public"."dua_has_tags" from "anon";

revoke insert on table "public"."dua_has_tags" from "anon";

revoke references on table "public"."dua_has_tags" from "anon";

revoke select on table "public"."dua_has_tags" from "anon";

revoke trigger on table "public"."dua_has_tags" from "anon";

revoke truncate on table "public"."dua_has_tags" from "anon";

revoke update on table "public"."dua_has_tags" from "anon";

revoke delete on table "public"."dua_has_tags" from "authenticated";

revoke insert on table "public"."dua_has_tags" from "authenticated";

revoke references on table "public"."dua_has_tags" from "authenticated";

revoke select on table "public"."dua_has_tags" from "authenticated";

revoke trigger on table "public"."dua_has_tags" from "authenticated";

revoke truncate on table "public"."dua_has_tags" from "authenticated";

revoke update on table "public"."dua_has_tags" from "authenticated";

revoke delete on table "public"."dua_has_tags" from "service_role";

revoke insert on table "public"."dua_has_tags" from "service_role";

revoke references on table "public"."dua_has_tags" from "service_role";

revoke select on table "public"."dua_has_tags" from "service_role";

revoke trigger on table "public"."dua_has_tags" from "service_role";

revoke truncate on table "public"."dua_has_tags" from "service_role";

revoke update on table "public"."dua_has_tags" from "service_role";

revoke delete on table "public"."tags" from "anon";

revoke insert on table "public"."tags" from "anon";

revoke references on table "public"."tags" from "anon";

revoke select on table "public"."tags" from "anon";

revoke trigger on table "public"."tags" from "anon";

revoke truncate on table "public"."tags" from "anon";

revoke update on table "public"."tags" from "anon";

revoke delete on table "public"."tags" from "authenticated";

revoke insert on table "public"."tags" from "authenticated";

revoke references on table "public"."tags" from "authenticated";

revoke select on table "public"."tags" from "authenticated";

revoke trigger on table "public"."tags" from "authenticated";

revoke truncate on table "public"."tags" from "authenticated";

revoke update on table "public"."tags" from "authenticated";

revoke delete on table "public"."tags" from "service_role";

revoke insert on table "public"."tags" from "service_role";

revoke references on table "public"."tags" from "service_role";

revoke select on table "public"."tags" from "service_role";

revoke trigger on table "public"."tags" from "service_role";

revoke truncate on table "public"."tags" from "service_role";

revoke update on table "public"."tags" from "service_role";

alter table "public"."dua_has_tags" drop constraint "public_dua_has_tags_dua_id_fkey";

alter table "public"."dua_has_tags" drop constraint "public_dua_has_tags_tag_id_fkey";

alter table "public"."dua_has_tags" drop constraint "dua_has_tags_pkey";

alter table "public"."tags" drop constraint "tags_pkey";

drop index if exists "public"."dua_has_tags_pkey";

drop index if exists "public"."tags_pkey";

drop table "public"."dua_has_tags";

drop table "public"."tags";

alter table "public"."duas" add column "tags" text[] not null default '{}'::text[];
