create policy "Enable read access for all users"
on "public"."dua_contents"
as permissive
to anon
using (true);
