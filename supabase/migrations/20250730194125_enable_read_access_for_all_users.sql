create policy "Enable read access for all users"
on "public"."dua_has_tags"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."dua_infos"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."dua_line_texts"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."dua_lines"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."dua_lines_has_recitations"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."dua_recitations"
as permissive
for select
to public
using (true);


create policy "Enable update for all users"
on "public"."dua_recitations"
as permissive
for update
to public
using (true)
with check (true);


create policy "Enable read access for all users"
on "public"."dua_references"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."duas"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."languages"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."narrators"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."reciters"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."tags"
as permissive
for select
to public
using (true);



