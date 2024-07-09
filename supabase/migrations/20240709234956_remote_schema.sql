alter table "public"."dua_content_lines" drop constraint "dua_content_lines_dua_content_id_fkey";

alter table "public"."dua_content_lines" alter column "text" drop not null;

alter table "public"."dua_contents" alter column "title" drop not null;

alter table "public"."dua_content_lines" add constraint "dua_content_lines_dua_content_id_fkey" FOREIGN KEY (dua_content_id) REFERENCES dua_contents(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."dua_content_lines" validate constraint "dua_content_lines_dua_content_id_fkey";


