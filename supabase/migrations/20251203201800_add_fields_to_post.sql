alter table "public"."post_translations" add column "title" text not null default ''::text;

alter table "public"."posts" add column "slug_suffix" text not null default ''::text;

alter table "public"."posts" add column "topic" text;
