SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-1.pgdg20.04+1)

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: dua_audios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: duas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."duas" ("id", "created_at", "updated_at", "route_name", "image_url") VALUES
	(22, '2024-07-05 18:57:13.719849+00', NULL, 'aahad', 'https://www.duaplayer.org/api/bg/dua/aahad/app_1080p/1');


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."languages" ("id", "created_at", "updated_at", "name", "code") VALUES
	(1, '2024-07-05 16:52:49.15016+00', NULL, 'English', 'en'),
	(2, '2024-07-05 16:53:01.318867+00', NULL, 'Arabic', 'ar'),
	(3, '2024-07-05 16:55:19.438415+00', NULL, 'Transliteration', 'translit');


--
-- Data for Name: dua_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."dua_contents" ("id", "created_at", "updated_at", "dua_id", "language_id", "title", "description", "state", "narrated_by") VALUES
	(1, '2024-07-05 18:57:13.891477+00', NULL, 22, 2, 'Ï»Ï╣ÏºÏí┬áÏ╣┘Ä┘ç┘ÆÏ»', NULL, NULL, 'ImamJaffarSadiq'),
	(2, '2024-07-05 18:57:13.97661+00', NULL, 22, 1, 'Supplication of Allegiance', NULL, NULL, 'ImamJaffarSadiq'),
	(3, '2024-07-05 18:57:14.049315+00', NULL, 22, 3, 'Dua Aahad', NULL, NULL, 'ImamJaffarSadiq');


--
-- Data for Name: dua_content_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."dua_content_lines" ("id", "created_at", "updated_at", "dua_content_id", "line_number", "text", "repetitions_number", "end_of_section") VALUES
	(3329, '2024-07-05 18:57:14.122581+00', NULL, 2, 1, 'In the Name of Allah, the All-beneficent, the All-merciful', NULL, false),
	(3330, '2024-07-05 18:57:14.194202+00', NULL, 1, 1, '┘ÉÏ│┘Æ┘à┘É ┘▒┘ä┘ä┘æ┘Ä┘ç┘É ┘▒┘äÏ▒┘æ┘ÄÏ¡┘Æ┘à┘░┘å┘É ┘▒┘äÏ▒┘æ┘ÄÏ¡┘É┘è┘à┘É', NULL, false),
	(3331, '2024-07-05 18:57:14.274496+00', NULL, 3, 1, 'bismi allahi alrrahmani alrrahimi', NULL, false),
	(3332, '2024-07-05 18:57:14.343578+00', NULL, 2, 2, 'O Allah: (please do) send blessings upon Muhammad and the Household of MuhammadÔÇö', NULL, false),
	(3333, '2024-07-05 18:57:14.411567+00', NULL, 1, 2, 'Ïº┘ä┘ä┘æ┘ç┘Å┘à┘æ┘Ä ÏÁ┘Ä┘ä┘æ┘É Ï╣┘Ä┘ä┘Ä┘ë ┘à┘ÅÏ¡┘Ä┘à┘æ┘ÄÏ»┘ì ┘ê┘ÄÏó┘ä┘É ┘à┘ÅÏ¡┘Ä┘à┘æ┘ÄÏ»┘ì', NULL, false),
	(3334, '2024-07-05 18:57:14.490475+00', NULL, 3, 2, 'allahumma salli `ala muhammadin wa ali muhammadin', NULL, false),
	(3335, '2024-07-05 18:57:14.57057+00', NULL, 2, 3, 'O Allah the Lord of the Great Light,', NULL, false),
	(3336, '2024-07-05 18:57:14.64395+00', NULL, 1, 3, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä Ï▒┘ÄÏ¿┘æ┘Ä ┘▒┘ä┘å┘æ┘Å┘êÏ▒┘É ┘▒┘ä┘ÆÏ╣┘ÄÏ©┘É┘è┘à┘É', NULL, false),
	(3337, '2024-07-05 18:57:14.705976+00', NULL, 3, 3, 'allahumma rabba alnnuri al`azimi', NULL, false),
	(3338, '2024-07-05 18:57:14.804386+00', NULL, 2, 4, 'the Lord of the Elevated Throne,', NULL, false),
	(3339, '2024-07-05 18:57:14.895696+00', NULL, 1, 4, '┘ê┘ÄÏ▒┘ÄÏ¿┘æ┘Ä ┘▒┘ä┘Æ┘â┘ÅÏ▒┘ÆÏ│┘É┘è┘æ┘É ┘▒┘äÏ▒┘æ┘Ä┘ü┘É┘èÏ╣┘É', NULL, false),
	(3340, '2024-07-05 18:57:14.999617+00', NULL, 3, 4, 'wa rabba alkursiyyi alrrafi`i', NULL, false),
	(3341, '2024-07-05 18:57:15.062489+00', NULL, 2, 5, 'the Lord of the swollen ocean,', NULL, false),
	(3342, '2024-07-05 18:57:15.151741+00', NULL, 1, 5, '┘ê┘ÄÏ▒┘ÄÏ¿┘æ┘Ä ┘▒┘ä┘ÆÏ¿┘ÄÏ¡┘ÆÏ▒┘É ┘▒┘ä┘Æ┘à┘ÄÏ│┘ÆÏ¼┘Å┘êÏ▒┘É', NULL, false),
	(3343, '2024-07-05 18:57:15.22392+00', NULL, 3, 5, 'wa rabba albahri almasjuri', NULL, false),
	(3344, '2024-07-05 18:57:15.291621+00', NULL, 2, 6, 'the Revealer of the Torah, the Gospel, and the Psalms,', NULL, false),
	(3345, '2024-07-05 18:57:15.3774+00', NULL, 1, 6, '┘ê┘Ä┘à┘Å┘å┘ÆÏ▓┘É┘ä┘Ä ┘▒┘äÏ¬┘æ┘Ä┘ê┘ÆÏ▒┘ÄÏºÏ®┘É ┘ê┘Ä┘▒┘äÏÑ┘É┘å┘ÆÏ¼┘É┘è┘ä┘É ┘ê┘Ä┘▒┘äÏ▓┘æ┘ÄÏ¿┘Å┘êÏ▒┘É', NULL, false),
	(3346, '2024-07-05 18:57:15.441342+00', NULL, 3, 6, 'wa munzila alttawrati wal-injili wallzzaburi', NULL, false),
	(3347, '2024-07-05 18:57:15.502032+00', NULL, 2, 7, 'the Lord of shade and heat,', NULL, false),
	(3348, '2024-07-05 18:57:15.557344+00', NULL, 1, 7, '┘ê┘ÄÏ▒┘ÄÏ¿┘æ┘Ä ┘▒┘äÏ©┘æ┘É┘ä┘æ┘É ┘ê┘Ä┘▒┘ä┘ÆÏ¡┘ÄÏ▒┘Å┘êÏ▒┘É', NULL, false),
	(3349, '2024-07-05 18:57:15.623162+00', NULL, 3, 7, 'wa rabba alzzilli walharuri', NULL, false),
	(3350, '2024-07-05 18:57:15.68616+00', NULL, 2, 8, 'the Revealer of the Great Qur''an,', NULL, false),
	(3351, '2024-07-05 18:57:15.754684+00', NULL, 1, 8, '┘ê┘Ä┘à┘Å┘å┘ÆÏ▓┘É┘ä┘Ä ┘▒┘ä┘Æ┘é┘ÅÏ▒┘ÆÏó┘å┘É ┘▒┘ä┘ÆÏ╣┘ÄÏ©┘É┘è┘à┘É', NULL, false),
	(3352, '2024-07-05 18:57:15.829235+00', NULL, 3, 8, 'wa munzila alqur''ani al`azimi', NULL, false),
	(3353, '2024-07-05 18:57:15.890646+00', NULL, 2, 9, 'and the Lord of the Archangels,', NULL, false),
	(3354, '2024-07-05 18:57:15.953341+00', NULL, 1, 9, '┘ê┘ÄÏ▒┘ÄÏ¿┘æ┘Ä ┘▒┘ä┘Æ┘à┘Ä┘äÏº┘ÄÏª┘É┘â┘ÄÏ®┘É ┘▒┘ä┘Æ┘à┘Å┘é┘ÄÏ▒┘æ┘ÄÏ¿┘É┘è┘å┘Ä', NULL, false),
	(3355, '2024-07-05 18:57:16.030149+00', NULL, 3, 9, 'wa rabba almala''ikati almuqarrabina', NULL, false),
	(3356, '2024-07-05 18:57:16.112211+00', NULL, 2, 10, 'the Prophets, and the Messengers:', NULL, false),
	(3357, '2024-07-05 18:57:16.176597+00', NULL, 1, 10, '┘ê┘Ä┘▒┘äÏº┘å┘ÆÏ¿┘É┘è┘ÄÏºÏí┘É ┘ê┘Ä┘▒┘ä┘Æ┘à┘ÅÏ▒┘ÆÏ│┘Ä┘ä┘É┘è┘å┘Ä', NULL, false),
	(3358, '2024-07-05 18:57:16.249642+00', NULL, 3, 10, 'wal-anbiya''i walmursalina', NULL, false),
	(3359, '2024-07-05 18:57:16.320264+00', NULL, 2, 11, 'O Allah, I beseech You in Your Noble Name,', NULL, false),
	(3360, '2024-07-05 18:57:16.381484+00', NULL, 1, 11, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ÏÑ┘É┘å┘æ┘É┘è ÏºÏ│┘ÆÏº┘ä┘Å┘â┘Ä Ï¿┘É┘▒Ï│┘Æ┘à┘É┘â┘Ä ┘▒┘ä┘Æ┘â┘ÄÏ▒┘É┘è┘Ç┘à┘É', NULL, false),
	(3361, '2024-07-05 18:57:16.455043+00', NULL, 3, 11, 'allahumma inni as''aluka bismika alkarimi', NULL, false),
	(3362, '2024-07-05 18:57:16.558711+00', NULL, 2, 12, 'in the Light of Your Luminous Face', NULL, false),
	(3363, '2024-07-05 18:57:16.614135+00', NULL, 1, 12, '┘ê┘ÄÏ¿┘É┘å┘Å┘êÏ▒┘É ┘ê┘ÄÏ¼┘Æ┘ç┘É┘â┘Ä ┘▒┘ä┘Æ┘à┘Å┘å┘É┘èÏ▒┘É', NULL, false),
	(3364, '2024-07-05 18:57:16.674856+00', NULL, 3, 12, 'wa binuri wajhika almuniri', NULL, false),
	(3365, '2024-07-05 18:57:16.748335+00', NULL, 2, 13, 'and Your Eternal Kingdom.', NULL, false),
	(3366, '2024-07-05 18:57:16.802669+00', NULL, 1, 13, '┘ê┘Ä┘à┘Å┘ä┘Æ┘â┘É┘â┘Ä ┘▒┘ä┘Æ┘é┘ÄÏ»┘É┘è┘à┘É', NULL, false),
	(3367, '2024-07-05 18:57:16.886573+00', NULL, 3, 13, 'wa mulkika alqadimi', NULL, false),
	(3368, '2024-07-05 18:57:16.949554+00', NULL, 2, 14, 'O Ever-living! O Self-Subsistent!', NULL, false),
	(3369, '2024-07-05 18:57:17.024803+00', NULL, 1, 14, '┘è┘ÄÏº Ï¡┘Ä┘è┘æ┘Å ┘è┘ÄÏº ┘é┘Ä┘è┘æ┘Å┘ê┘à┘Å', NULL, false),
	(3370, '2024-07-05 18:57:17.085308+00', NULL, 3, 14, 'ya hayyu ya qayyumu', NULL, false),
	(3371, '2024-07-05 18:57:17.149653+00', NULL, 2, 15, 'I beseech You in the name of Your Name with which the heavens and the earth have lit up', NULL, false),
	(3372, '2024-07-05 18:57:17.21846+00', NULL, 1, 15, 'ÏºÏ│┘ÆÏº┘ä┘Å┘â┘Ä Ï¿┘É┘▒Ï│┘Æ┘à┘É┘â┘Ä ┘▒┘ä┘æ┘ÄÏ░┘É┘è ÏºÏ┤┘ÆÏ▒┘Ä┘é┘ÄÏ¬┘Æ Ï¿┘É┘ç┘É ┘▒┘äÏ│┘æ┘Ä┘à┘ÄÏº┘ê┘ÄÏºÏ¬┘Å ┘ê┘Ä┘▒┘äÏºÏ▒┘ÄÏÂ┘Å┘ê┘å┘Ä', NULL, false),
	(3373, '2024-07-05 18:57:17.283665+00', NULL, 3, 15, 'as''aluka bismika alladhi ashraqat bihi alssamawatu wal-araduna', NULL, false),
	(3374, '2024-07-05 18:57:17.359539+00', NULL, 2, 16, 'and in Your Name with which the past and the coming generations have become upright!', NULL, false),
	(3375, '2024-07-05 18:57:17.425377+00', NULL, 1, 16, '┘ê┘ÄÏ¿┘É┘▒Ï│┘Æ┘à┘É┘â┘Ä ┘▒┘ä┘æ┘ÄÏ░┘É┘è ┘è┘ÄÏÁ┘Æ┘ä┘ÄÏ¡┘Å Ï¿┘É┘ç┘É ┘▒┘äÏº┘ê┘æ┘Ä┘ä┘Å┘ê┘å┘Ä ┘ê┘Ä┘▒┘äÏóÏ«┘ÉÏ▒┘Å┘ê┘å┘Ä', NULL, false),
	(3376, '2024-07-05 18:57:17.487538+00', NULL, 3, 16, 'wa bismika alladhi yasluhu bihi al-awwaluna wal-akhiruna', NULL, false),
	(3377, '2024-07-05 18:57:17.552611+00', NULL, 2, 17, 'O He Who has been always alive before the existence of all living things!', NULL, false),
	(3378, '2024-07-05 18:57:17.62158+00', NULL, 1, 17, '┘è┘ÄÏº Ï¡┘Ä┘è┘æÏº┘ï ┘é┘ÄÏ¿┘Æ┘ä┘Ä ┘â┘Å┘ä┘æ┘É Ï¡┘Ä┘è┘æ┘ì', NULL, false),
	(3379, '2024-07-05 18:57:17.685193+00', NULL, 3, 17, 'ya hayyan qabla kulli hayyin', NULL, false),
	(3380, '2024-07-05 18:57:17.742473+00', NULL, 2, 18, 'O He Who shall be alive after the extinction of all living things!', NULL, false),
	(3381, '2024-07-05 18:57:17.813403+00', NULL, 1, 18, '┘ê┘Ä┘è┘ÄÏº Ï¡┘Ä┘è┘æÏº┘ï Ï¿┘ÄÏ╣┘ÆÏ»┘Ä ┘â┘Å┘ä┘æ┘É Ï¡┘Ä┘è┘æ┘ì', NULL, false),
	(3382, '2024-07-05 18:57:17.906154+00', NULL, 3, 18, 'wa ya hayyan ba`da kulli hayyin', NULL, false),
	(3383, '2024-07-05 18:57:17.99959+00', NULL, 2, 19, 'O He Who has been always alive even when there was nothing else alive!', NULL, false),
	(3384, '2024-07-05 18:57:18.071355+00', NULL, 1, 19, '┘ê┘Ä┘è┘ÄÏº Ï¡┘Ä┘è┘æÏº┘ï Ï¡┘É┘è┘å┘Ä ┘äÏº Ï¡┘Ä┘è┘æ┘Å', NULL, false),
	(3385, '2024-07-05 18:57:18.138723+00', NULL, 3, 19, 'wa ya hayyan hina la hayyu', NULL, false),
	(3386, '2024-07-05 18:57:18.21096+00', NULL, 2, 20, 'O He Who revives the dead ones and causes the living ones to die!', NULL, false),
	(3387, '2024-07-05 18:57:18.275243+00', NULL, 1, 20, '┘è┘ÄÏº ┘à┘ÅÏ¡┘Æ┘è┘É┘è┘Ä ┘▒┘ä┘Æ┘à┘Ä┘ê┘ÆÏ¬┘Ä┘ë┘░ ┘ê┘Ä┘à┘Å┘à┘É┘èÏ¬┘Ä ┘▒┘äÏºÏ¡┘Æ┘è┘ÄÏºÏí┘É', NULL, false),
	(3388, '2024-07-05 18:57:18.339343+00', NULL, 3, 20, 'ya muhyiya almawta wa mumita al-ahya''i', NULL, false),
	(3389, '2024-07-05 18:57:18.405315+00', NULL, 2, 21, 'O Ever-living! There is no god save You.', NULL, false),
	(3390, '2024-07-05 18:57:18.464789+00', NULL, 1, 21, '┘è┘ÄÏº Ï¡┘Ä┘è┘æ┘Å ┘äÏº ÏÑ┘É┘ä┘░┘ç┘Ä ÏÑ┘É┘äÏº┘æ┘Ä Ïº┘å┘ÆÏ¬┘Ä', NULL, false),
	(3391, '2024-07-05 18:57:18.533707+00', NULL, 3, 21, 'ya hayyu la ilaha illa anta', NULL, false),
	(3392, '2024-07-05 18:57:18.600721+00', NULL, 2, 22, 'O Allah, convey to our master Imam al-Mahdi, the guide who is to undertake Your orders,', NULL, false),
	(3393, '2024-07-05 18:57:18.671645+00', NULL, 1, 22, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä Ï¿┘Ä┘ä┘æ┘ÉÏ║┘Æ ┘à┘Ä┘ê┘Æ┘äÏº┘Ä┘å┘ÄÏº ┘▒┘äÏÑ┘É┘à┘ÄÏº┘à┘Ä ┘▒┘ä┘Æ┘ç┘ÄÏºÏ»┘É┘è┘Ä ┘▒┘ä┘Æ┘à┘Ä┘ç┘ÆÏ»┘É┘è┘æ┘Ä ┘▒┘ä┘Æ┘é┘ÄÏºÏª┘É┘à┘Ä Ï¿┘ÉÏº┘à┘ÆÏ▒┘É┘â┘Ä', NULL, false),
	(3394, '2024-07-05 18:57:18.734101+00', NULL, 3, 22, 'allahumma balligh mawlana al-imama alhadiya almahdiyya alqa''ima bi''amrika', NULL, false),
	(3395, '2024-07-05 18:57:18.798626+00', NULL, 2, 23, 'may AllahÔÇÖs blessings be upon him and upon his immaculate fathers,', NULL, false),
	(3466, '2024-07-05 18:57:23.574523+00', NULL, 3, 46, 'mujarridan qanati', NULL, false),
	(3396, '2024-07-05 18:57:18.863153+00', NULL, 1, 23, 'ÏÁ┘Ä┘ä┘Ä┘ê┘ÄÏºÏ¬┘Å ┘▒┘ä┘ä┘æ┘Ä┘ç┘É Ï╣┘Ä┘ä┘Ä┘è┘Æ┘ç┘É ┘ê┘ÄÏ╣┘Ä┘ä┘Ä┘ë┘░ ÏóÏ¿┘ÄÏºÏª┘É┘ç┘É ┘▒┘äÏÀ┘æ┘ÄÏº┘ç┘ÉÏ▒┘É┘è┘å┘Ä', NULL, false),
	(3397, '2024-07-05 18:57:18.928277+00', NULL, 3, 23, 'salawatu allahi `alayhi wa `ala aba''ihi alttahirina', NULL, false),
	(3398, '2024-07-05 18:57:18.998922+00', NULL, 2, 24, 'on behalf of all of the believing men and women', NULL, false),
	(3399, '2024-07-05 18:57:19.071101+00', NULL, 1, 24, 'Ï╣┘Ä┘å┘Æ Ï¼┘Ä┘à┘É┘èÏ╣┘É ┘▒┘ä┘Æ┘à┘ÅÏñ┘Æ┘à┘É┘å┘É┘è┘å┘Ä ┘ê┘Ä┘▒┘ä┘Æ┘à┘ÅÏñ┘Æ┘à┘É┘å┘ÄÏºÏ¬┘É', NULL, false),
	(3400, '2024-07-05 18:57:19.139165+00', NULL, 3, 24, '`an jami`i almu''minina walmu''minati', NULL, false),
	(3401, '2024-07-05 18:57:19.231064+00', NULL, 2, 25, 'in the east and west of the earth', NULL, false),
	(3402, '2024-07-05 18:57:19.300838+00', NULL, 1, 25, '┘ü┘É┘è ┘à┘ÄÏ┤┘ÄÏºÏ▒┘É┘é┘É ┘▒┘äÏºÏ▒┘ÆÏÂ┘É ┘ê┘Ä┘à┘ÄÏ║┘ÄÏºÏ▒┘ÉÏ¿┘É┘ç┘ÄÏº', NULL, false),
	(3403, '2024-07-05 18:57:19.362436+00', NULL, 3, 25, 'fi mashariqi al-ardi wa magharibiha', NULL, false),
	(3404, '2024-07-05 18:57:19.457343+00', NULL, 2, 26, 'and in plains, mountains,', NULL, false),
	(3405, '2024-07-05 18:57:19.517477+00', NULL, 1, 26, 'Ï│┘Ä┘ç┘Æ┘ä┘É┘ç┘ÄÏº ┘ê┘ÄÏ¼┘ÄÏ¿┘Ä┘ä┘É┘ç┘ÄÏº', NULL, false),
	(3406, '2024-07-05 18:57:19.577592+00', NULL, 3, 26, 'sahliha wa jabaliha', NULL, false),
	(3407, '2024-07-05 18:57:19.646863+00', NULL, 2, 27, 'lands, and seas,', NULL, false),
	(3408, '2024-07-05 18:57:19.701803+00', NULL, 1, 27, '┘ê┘ÄÏ¿┘ÄÏ▒┘æ┘É┘ç┘ÄÏº ┘ê┘ÄÏ¿┘ÄÏ¡┘ÆÏ▒┘É┘ç┘ÄÏº', NULL, false),
	(3409, '2024-07-05 18:57:19.757296+00', NULL, 3, 27, 'wa barriha wa bahriha', NULL, false),
	(3410, '2024-07-05 18:57:19.826024+00', NULL, 2, 28, 'and on behalf of my parents', NULL, false),
	(3411, '2024-07-05 18:57:19.891277+00', NULL, 1, 28, '┘ê┘ÄÏ╣┘Ä┘å┘æ┘É┘è ┘ê┘ÄÏ╣┘Ä┘å┘Æ ┘ê┘ÄÏº┘ä┘ÉÏ»┘Ä┘è┘æ┘Ä', NULL, false),
	(3412, '2024-07-05 18:57:19.960689+00', NULL, 3, 28, 'wa `anni wa `an walidayya', NULL, false),
	(3413, '2024-07-05 18:57:20.026503+00', NULL, 2, 29, '(convey to him) blessings that are as weighty as AllahÔÇÖs Throne,', NULL, false),
	(3414, '2024-07-05 18:57:20.095477+00', NULL, 1, 29, '┘à┘É┘å┘Ä ┘▒┘äÏÁ┘æ┘Ä┘ä┘Ä┘ê┘ÄÏºÏ¬┘É Ï▓┘É┘å┘ÄÏ®┘Ä Ï╣┘ÄÏ▒┘ÆÏ┤┘É ┘▒┘ä┘ä┘æ┘Ä┘ç┘É', NULL, false),
	(3415, '2024-07-05 18:57:20.169437+00', NULL, 3, 29, 'min alssalawati zinata `arshi allahi', NULL, false),
	(3416, '2024-07-05 18:57:20.238017+00', NULL, 2, 30, 'as much as the ink of His Words,', NULL, false),
	(3417, '2024-07-05 18:57:20.324215+00', NULL, 1, 30, '┘ê┘Ä┘à┘ÉÏ»┘ÄÏºÏ»┘Ä ┘â┘Ä┘ä┘É┘à┘ÄÏºÏ¬┘É┘ç┘É', NULL, false),
	(3418, '2024-07-05 18:57:20.381434+00', NULL, 3, 30, 'wa midada kalimatihi', NULL, false),
	(3419, '2024-07-05 18:57:20.439696+00', NULL, 2, 31, 'and as many as that which is counted by His knowledge and encompassed by His Book.', NULL, false),
	(3420, '2024-07-05 18:57:20.508607+00', NULL, 1, 31, '┘ê┘Ä┘à┘ÄÏº ÏºÏ¡┘ÆÏÁ┘ÄÏº┘ç┘Å Ï╣┘É┘ä┘Æ┘à┘Å┘ç┘Å ┘ê┘ÄÏºÏ¡┘ÄÏºÏÀ┘Ä Ï¿┘É┘ç┘É ┘â┘ÉÏ¬┘ÄÏºÏ¿┘Å┘ç┘Å', NULL, false),
	(3421, '2024-07-05 18:57:20.566711+00', NULL, 3, 31, 'wa ma ahsahu `ilmuhu wa ahata bihi kitabuhu', NULL, false),
	(3422, '2024-07-05 18:57:20.642677+00', NULL, 2, 32, 'O Allah, I update to him in the beginning of this day', NULL, false),
	(3423, '2024-07-05 18:57:20.713086+00', NULL, 1, 32, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ÏÑ┘É┘å┘æ┘É┘è ÏºÏ¼┘ÄÏ»┘æ┘ÉÏ»┘Å ┘ä┘Ä┘ç┘Å ┘ü┘É┘è ÏÁ┘ÄÏ¿┘É┘èÏ¡┘ÄÏ®┘É ┘è┘Ä┘ê┘Æ┘à┘É┘è ┘ç┘░Ï░┘ÄÏº', NULL, false),
	(3424, '2024-07-05 18:57:20.788216+00', NULL, 3, 32, 'allahumma inni ujaddidu lahu fi sabihati yawmi hadha', NULL, false),
	(3425, '2024-07-05 18:57:20.853265+00', NULL, 2, 33, 'and throughout the days of lifetime a pledge,', NULL, false),
	(3426, '2024-07-05 18:57:20.908753+00', NULL, 1, 33, '┘ê┘Ä┘à┘ÄÏº Ï╣┘ÉÏ┤┘ÆÏ¬┘Å ┘à┘É┘å┘Æ Ïº┘è┘æ┘ÄÏº┘à┘É┘è', NULL, false),
	(3427, '2024-07-05 18:57:20.982747+00', NULL, 3, 33, 'wa ma `ishtu min ayyami', NULL, false),
	(3428, '2024-07-05 18:57:21.049095+00', NULL, 2, 34, 'a covenant, and allegiance to which I commit myself', NULL, false),
	(3429, '2024-07-05 18:57:21.107805+00', NULL, 1, 34, 'Ï╣┘Ä┘ç┘ÆÏ»Ïº┘ï ┘ê┘ÄÏ╣┘Ä┘é┘ÆÏ»Ïº┘ï ┘ê┘ÄÏ¿┘Ä┘è┘ÆÏ╣┘ÄÏ®┘ï ┘ä┘Ä┘ç┘Å ┘ü┘É┘è Ï╣┘Å┘å┘Å┘é┘É┘è', NULL, false),
	(3430, '2024-07-05 18:57:21.17329+00', NULL, 3, 34, '`ahdan wa `aqdan wa bay`atan lahu fi `unuqi', NULL, false),
	(3431, '2024-07-05 18:57:21.239191+00', NULL, 2, 35, 'and from which I neither convert nor change.', NULL, false),
	(3432, '2024-07-05 18:57:21.303898+00', NULL, 1, 35, '┘äÏº ÏºÏ¡┘Å┘ê┘ä┘Å Ï╣┘Ä┘å┘Æ┘ç ┘ê┘Ä┘äÏº ÏºÏ▓┘Å┘ê┘ä┘Å ÏºÏ¿┘ÄÏ»Ïº┘ï', NULL, false),
	(3433, '2024-07-05 18:57:21.352684+00', NULL, 3, 35, 'la ahulu `anhu wa la azulu abadan', NULL, false),
	(3434, '2024-07-05 18:57:21.411383+00', NULL, 2, 36, 'O Allah, (please do) make me of his supporters,', NULL, false),
	(3435, '2024-07-05 18:57:21.477383+00', NULL, 1, 36, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ┘▒Ï¼┘ÆÏ╣┘Ä┘ä┘Æ┘å┘É┘è ┘à┘É┘å┘Æ Ïº┘å┘ÆÏÁ┘ÄÏºÏ▒┘É┘ç┘É', NULL, false),
	(3436, '2024-07-05 18:57:21.533989+00', NULL, 3, 36, 'allahumma ij`alni min ansarihi', NULL, false),
	(3437, '2024-07-05 18:57:21.593806+00', NULL, 2, 37, 'sponsors, defenders,', NULL, false),
	(3438, '2024-07-05 18:57:21.656106+00', NULL, 1, 37, '┘ê┘ÄÏºÏ╣┘Æ┘ê┘ÄÏº┘å┘É┘ç┘É ┘ê┘Ä┘▒┘äÏ░┘æ┘ÄÏºÏ¿┘æ┘É┘è┘å┘Ä Ï╣┘Ä┘å┘Æ┘ç┘Å', NULL, false),
	(3439, '2024-07-05 18:57:21.71892+00', NULL, 3, 37, 'wa a`wanihi waldhdhabbina `anhu', NULL, false),
	(3440, '2024-07-05 18:57:21.781516+00', NULL, 2, 38, 'and those who hurry in carrying out his instructions,', NULL, false),
	(3441, '2024-07-05 18:57:21.839982+00', NULL, 1, 38, '┘ê┘Ä┘▒┘ä┘Æ┘à┘ÅÏ│┘ÄÏºÏ▒┘ÉÏ╣┘É┘è┘å┘Ä ÏÑ┘É┘ä┘Ä┘è┘Æ┘ç┘É ┘ü┘É┘è ┘é┘ÄÏÂ┘ÄÏºÏí┘É Ï¡┘Ä┘ê┘ÄÏºÏª┘ÉÏ¼┘É┘ç┘É', NULL, false),
	(3442, '2024-07-05 18:57:21.908276+00', NULL, 3, 38, 'walmusari`ina ilayhi fi qada''i hawa''ijihi', NULL, false),
	(3443, '2024-07-05 18:57:21.973196+00', NULL, 2, 39, 'those who comply with his orders,', NULL, false),
	(3444, '2024-07-05 18:57:22.030164+00', NULL, 1, 39, '┘ê┘Ä┘▒┘ä┘Æ┘à┘Å┘à┘ÆÏ¬┘ÄÏ½┘É┘ä┘É┘è┘å┘Ä ┘äÏº┘É┘ê┘ÄÏº┘à┘ÉÏ▒┘É┘ç┘É', NULL, false),
	(3445, '2024-07-05 18:57:22.091266+00', NULL, 3, 39, 'walmumtathilina li''awamirihi', NULL, false),
	(3446, '2024-07-05 18:57:22.151356+00', NULL, 2, 40, 'those who uphold him,', NULL, false),
	(3447, '2024-07-05 18:57:22.220777+00', NULL, 1, 40, '┘ê┘Ä┘▒┘ä┘Æ┘à┘ÅÏ¡┘ÄÏº┘à┘É┘è┘å┘Ä Ï╣┘Ä┘å┘Æ┘ç┘Å', NULL, false),
	(3448, '2024-07-05 18:57:22.295487+00', NULL, 3, 40, 'walmuhamina `anhu', NULL, false),
	(3449, '2024-07-05 18:57:22.366752+00', NULL, 2, 41, 'those who precede others to implementing his will,', NULL, false),
	(3450, '2024-07-05 18:57:22.519078+00', NULL, 1, 41, '┘ê┘Ä┘▒┘äÏ│┘æ┘ÄÏºÏ¿┘É┘é┘É┘è┘å┘Ä ÏÑ┘É┘ä┘Ä┘ë┘░ ÏÑ┘ÉÏ▒┘ÄÏºÏ»┘ÄÏ¬┘É┘ç┘É', NULL, false),
	(3451, '2024-07-05 18:57:22.582528+00', NULL, 3, 41, 'walssabiqina ila iradatihi', NULL, false),
	(3452, '2024-07-05 18:57:22.648263+00', NULL, 2, 42, 'and those who will be martyred before him.', NULL, false),
	(3453, '2024-07-05 18:57:22.713419+00', NULL, 1, 42, '┘ê┘Ä┘▒┘ä┘Æ┘à┘ÅÏ│┘ÆÏ¬┘ÄÏ┤┘Æ┘ç┘ÄÏ»┘É┘è┘å┘Ä Ï¿┘Ä┘è┘Æ┘å┘Ä ┘è┘ÄÏ»┘Ä┘è┘Æ┘ç┘É', NULL, false),
	(3454, '2024-07-05 18:57:22.771852+00', NULL, 3, 42, 'walmustashhadina bayna yadayhi', NULL, false),
	(3455, '2024-07-05 18:57:22.828813+00', NULL, 2, 43, 'O Allah, if death that You have made inevitably and certainly incumbent upon Your servants stands between me and him,', NULL, false),
	(3456, '2024-07-05 18:57:22.898457+00', NULL, 1, 43, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ÏÑ┘É┘å┘Æ Ï¡┘ÄÏº┘ä┘Ä Ï¿┘Ä┘è┘Æ┘å┘É┘è ┘ê┘ÄÏ¿┘Ä┘è┘Æ┘å┘Ä┘ç┘Å ┘▒┘ä┘Æ┘à┘Ä┘ê┘ÆÏ¬┘Å ┘▒┘ä┘æ┘ÄÏ░┘É┘è Ï¼┘ÄÏ╣┘Ä┘ä┘ÆÏ¬┘Ä┘ç┘Å Ï╣┘Ä┘ä┘Ä┘ë┘░ Ï╣┘ÉÏ¿┘ÄÏºÏ»┘É┘â┘Ä Ï¡┘ÄÏ¬┘Æ┘àÏº┘ï ┘à┘Ä┘é┘ÆÏÂ┘É┘è┘æÏº┘ï', NULL, false),
	(3457, '2024-07-05 18:57:22.96608+00', NULL, 3, 43, 'allahumma in hala bayni wa baynahu almawtu alladhi ja`altahu `ala `ibadika hatman maqdiyyan', NULL, false),
	(3458, '2024-07-05 18:57:23.033774+00', NULL, 2, 44, 'then (please do) take me out of my grave using my shroud as dress,', NULL, false),
	(3459, '2024-07-05 18:57:23.102321+00', NULL, 1, 44, '┘ü┘ÄÏºÏ«┘ÆÏ▒┘ÉÏ¼┘Æ┘å┘É┘è ┘à┘É┘å┘Æ ┘é┘ÄÏ¿┘ÆÏ▒┘É┘è ┘à┘ÅÏñ┘ÆÏ¬┘ÄÏ▓┘ÉÏ▒Ïº┘ï ┘â┘Ä┘ü┘Ä┘å┘É┘è', NULL, false),
	(3460, '2024-07-05 18:57:23.163748+00', NULL, 3, 44, 'fa''akhrijni min qabri mu''taziran kafani', NULL, false),
	(3461, '2024-07-05 18:57:23.234393+00', NULL, 2, 45, 'unsheathing my sword,', NULL, false),
	(3462, '2024-07-05 18:57:23.294457+00', NULL, 1, 45, 'Ï┤┘ÄÏº┘ç┘ÉÏ▒Ïº┘ï Ï│┘Ä┘è┘Æ┘ü┘É┘è', NULL, false),
	(3463, '2024-07-05 18:57:23.35488+00', NULL, 3, 45, 'sharihan sayfi', NULL, false),
	(3464, '2024-07-05 18:57:23.444422+00', NULL, 2, 46, 'holding my lance in my hand,', NULL, false),
	(3465, '2024-07-05 18:57:23.506504+00', NULL, 1, 46, '┘à┘ÅÏ¼┘ÄÏ▒┘æ┘ÉÏ»Ïº┘ï ┘é┘Ä┘å┘ÄÏºÏ¬┘É┘è', NULL, false),
	(3467, '2024-07-05 18:57:23.637136+00', NULL, 2, 47, 'and responding to the call of the Caller who shall announce (his advent) in urban areas and deserts.', NULL, false),
	(3468, '2024-07-05 18:57:23.721888+00', NULL, 1, 47, '┘à┘Å┘ä┘ÄÏ¿┘æ┘É┘èÏº┘ï Ï»┘ÄÏ╣┘Æ┘ê┘ÄÏ®┘Ä ┘▒┘äÏ»┘æ┘ÄÏºÏ╣┘É┘è ┘ü┘É┘è ┘▒┘ä┘ÆÏ¡┘ÄÏºÏÂ┘ÉÏ▒┘É ┘ê┘Ä┘▒┘ä┘ÆÏ¿┘ÄÏºÏ»┘É┘è', NULL, false),
	(3469, '2024-07-05 18:57:23.793128+00', NULL, 3, 47, 'mulabbiyan da`wata aldda`i filhadiri walbadi', NULL, false),
	(3470, '2024-07-05 18:57:23.869174+00', NULL, 2, 48, 'O Allah, (please do) show me his magnificent mien', NULL, false),
	(3471, '2024-07-05 18:57:23.946356+00', NULL, 1, 48, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ÏºÏ▒┘É┘å┘É┘è ┘▒┘äÏÀ┘æ┘Ä┘ä┘ÆÏ╣┘ÄÏ®┘Ä ┘▒┘äÏ▒┘æ┘ÄÏ┤┘É┘èÏ»┘ÄÏ®┘Ä', NULL, false),
	(3472, '2024-07-05 18:57:24.008996+00', NULL, 3, 48, 'allahumma arini alttal`ata alrrashidata', NULL, false),
	(3473, '2024-07-05 18:57:24.074097+00', NULL, 2, 49, 'and his praiseworthy forehead,', NULL, false),
	(3474, '2024-07-05 18:57:24.143809+00', NULL, 1, 49, '┘ê┘Ä┘▒┘ä┘ÆÏ║┘ÅÏ▒┘æ┘ÄÏ®┘Ä ┘▒┘ä┘ÆÏ¡┘Ä┘à┘É┘èÏ»┘ÄÏ®┘Ä', NULL, false),
	(3475, '2024-07-05 18:57:24.193763+00', NULL, 3, 49, 'walghurrata alhamidata', NULL, false),
	(3476, '2024-07-05 18:57:24.267946+00', NULL, 2, 50, 'delight my eyes by letting me have a look at him.', NULL, false),
	(3477, '2024-07-05 18:57:24.338188+00', NULL, 1, 50, '┘ê┘Ä┘▒┘â┘ÆÏ¡┘Å┘ä┘Æ ┘å┘ÄÏºÏ©┘ÉÏ▒┘É┘è Ï¿┘É┘å┘ÄÏ©┘ÆÏ▒┘ÄÏ®┘ì ┘à┘É┘å┘æ┘É┘è ÏÑ┘É┘ä┘Ä┘è┘Æ┘ç┘É', NULL, false),
	(3478, '2024-07-05 18:57:24.413393+00', NULL, 3, 50, 'wakhul naziri binazratin minni ilayhi', NULL, false),
	(3479, '2024-07-05 18:57:24.488659+00', NULL, 2, 51, 'And (please) expedite his relief,', NULL, false),
	(3480, '2024-07-05 18:57:24.555847+00', NULL, 1, 51, '┘ê┘ÄÏ╣┘ÄÏ¼┘æ┘É┘ä┘Æ ┘ü┘ÄÏ▒┘ÄÏ¼┘Ä┘ç┘Å', NULL, false),
	(3481, '2024-07-05 18:57:24.628135+00', NULL, 3, 51, 'wa `ajjil farajahu', NULL, false),
	(3482, '2024-07-05 18:57:24.685746+00', NULL, 2, 52, 'make his reappearance easy,', NULL, false),
	(3483, '2024-07-05 18:57:24.767408+00', NULL, 1, 52, '┘ê┘ÄÏ│┘Ä┘ç┘æ┘É┘ä┘Æ ┘à┘ÄÏ«┘ÆÏ▒┘ÄÏ¼┘Ä┘ç┘Å', NULL, false),
	(3484, '2024-07-05 18:57:24.843112+00', NULL, 3, 52, 'wa sahhil makhrajahu', NULL, false),
	(3485, '2024-07-05 18:57:24.920863+00', NULL, 2, 53, 'clear a spacious space for him,', NULL, false),
	(3486, '2024-07-05 18:57:24.98587+00', NULL, 1, 53, '┘ê┘ÄÏº┘ê┘ÆÏ│┘ÉÏ╣┘Æ ┘à┘Ä┘å┘Æ┘ç┘ÄÏ¼┘Ä┘ç┘Å', NULL, false),
	(3487, '2024-07-05 18:57:25.060737+00', NULL, 3, 53, 'wa awsi` manhajahu', NULL, false),
	(3488, '2024-07-05 18:57:25.135698+00', NULL, 2, 54, 'guide me to follow his course,', NULL, false),
	(3489, '2024-07-05 18:57:25.195672+00', NULL, 1, 54, '┘ê┘Ä┘▒Ï│┘Æ┘ä┘Å┘â┘Æ Ï¿┘É┘è ┘à┘ÄÏ¡┘ÄÏ¼┘æ┘ÄÏ¬┘Ä┘ç┘Å', NULL, false),
	(3490, '2024-07-05 18:57:25.256317+00', NULL, 3, 54, 'wasluk bi muhajjatahu', NULL, false),
	(3491, '2024-07-05 18:57:25.326931+00', NULL, 2, 55, 'give success to his issues,', NULL, false),
	(3492, '2024-07-05 18:57:25.393395+00', NULL, 1, 55, '┘ê┘ÄÏº┘å┘Æ┘ü┘ÉÏ░┘Æ Ïº┘à┘ÆÏ▒┘Ä┘ç┘Å', NULL, false),
	(3493, '2024-07-05 18:57:25.45636+00', NULL, 3, 55, 'wa anfidh amrahu', NULL, false),
	(3494, '2024-07-05 18:57:25.518991+00', NULL, 2, 56, 'and confirm his strength.', NULL, false),
	(3495, '2024-07-05 18:57:25.59522+00', NULL, 1, 56, '┘ê┘Ä┘▒Ï┤┘ÆÏ»┘ÅÏ»┘Æ ÏºÏ▓┘ÆÏ▒┘Ä┘ç┘Å', NULL, false),
	(3496, '2024-07-05 18:57:25.657096+00', NULL, 3, 56, 'washdud azrahu', NULL, false),
	(3497, '2024-07-05 18:57:25.709159+00', NULL, 2, 57, 'O Allah, construct Your lands through him', NULL, false),
	(3498, '2024-07-05 18:57:25.770284+00', NULL, 1, 57, '┘ê┘Ä┘▒Ï╣┘Æ┘à┘ÅÏ▒┘É ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä Ï¿┘É┘ç┘É Ï¿┘É┘äÏºÏ»┘Ä┘â┘Ä', NULL, false),
	(3499, '2024-07-05 18:57:25.835735+00', NULL, 3, 57, 'wa`mur allahumma bihi biladaka', NULL, false),
	(3500, '2024-07-05 18:57:25.904673+00', NULL, 2, 58, 'and refresh Your servants through him,', NULL, false),
	(3501, '2024-07-05 18:57:25.972757+00', NULL, 1, 58, '┘ê┘ÄÏºÏ¡┘Æ┘è┘É Ï¿┘É┘ç┘É Ï╣┘ÉÏ¿┘ÄÏºÏ»┘Ä┘â┘Ä', NULL, false),
	(3502, '2024-07-05 18:57:26.030521+00', NULL, 3, 58, 'wa ahyi bihi `ibadaka', NULL, false),
	(3503, '2024-07-05 18:57:26.110686+00', NULL, 2, 59, 'For You have said, and true are Your words:', NULL, false),
	(3504, '2024-07-05 18:57:26.173082+00', NULL, 1, 59, '┘ü┘ÄÏÑ┘É┘å┘æ┘Ä┘â┘Ä ┘é┘Å┘ä┘ÆÏ¬┘Ä ┘ê┘Ä┘é┘Ä┘ê┘Æ┘ä┘Å┘â┘Ä ┘▒┘ä┘ÆÏ¡┘Ä┘é┘æ┘Å:', NULL, false),
	(3505, '2024-07-05 18:57:26.245404+00', NULL, 3, 59, 'fa''innaka qulta wa qawluka alhaqqu', NULL, false),
	(3506, '2024-07-05 18:57:26.304021+00', NULL, 2, 60, 'ÔÇ£Corruption has appeared in the land and the sea', NULL, false),
	(3507, '2024-07-05 18:57:26.375254+00', NULL, 1, 60, '┬½Ï©┘Ä┘ç┘ÄÏ▒┘Ä ┘▒┘ä┘Æ┘ü┘ÄÏ│┘ÄÏºÏ»┘Å ┘ü┘É┘è ┘▒┘ä┘ÆÏ¿┘ÄÏ▒┘æ┘É ┘ê┘Ä┘▒┘ä┘ÆÏ¿┘ÄÏ¡┘ÆÏ▒┘É', NULL, false),
	(3508, '2024-07-05 18:57:26.441969+00', NULL, 3, 60, 'zahara alfasadu filbarri walbahri', NULL, false),
	(3509, '2024-07-05 18:57:26.504328+00', NULL, 2, 61, 'on account of what the hands of men have wrought.ÔÇØ', NULL, false),
	(3510, '2024-07-05 18:57:26.574939+00', NULL, 1, 61, 'Ï¿┘É┘à┘ÄÏº ┘â┘ÄÏ│┘ÄÏ¿┘ÄÏ¬┘Æ Ïº┘è┘ÆÏ»┘É┘è ┘▒┘ä┘å┘æ┘ÄÏºÏ│┘É.┬╗', NULL, false),
	(3511, '2024-07-05 18:57:26.642963+00', NULL, 3, 61, 'bima kasabat aydi alnnasi', NULL, false),
	(3512, '2024-07-05 18:57:26.709824+00', NULL, 2, 62, 'So, O Allah, (please) show us Your vicegerent,', NULL, false),
	(3513, '2024-07-05 18:57:26.770617+00', NULL, 1, 62, '┘ü┘ÄÏºÏ©┘Æ┘ç┘ÉÏ▒┘É ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ┘ä┘Ä┘å┘ÄÏº ┘ê┘Ä┘ä┘É┘è┘æ┘Ä┘â┘Ä', NULL, false),
	(3514, '2024-07-05 18:57:26.850094+00', NULL, 3, 62, 'fa''azhir allahumma lana waliyyaka', NULL, false),
	(3515, '2024-07-05 18:57:26.949238+00', NULL, 2, 63, 'the son of Your Prophet,', NULL, false),
	(3516, '2024-07-05 18:57:27.02159+00', NULL, 1, 63, '┘ê┘Ä┘▒Ï¿┘Æ┘å┘Ä Ï¿┘É┘å┘ÆÏ¬┘É ┘å┘ÄÏ¿┘É┘è┘æ┘É┘â┘Ä', NULL, false),
	(3517, '2024-07-05 18:57:27.098146+00', NULL, 3, 63, 'wabna binti nabiyyika', NULL, false),
	(3518, '2024-07-05 18:57:27.163835+00', NULL, 2, 64, 'and the namesake of Your Messenger,', NULL, false),
	(3519, '2024-07-05 18:57:27.236639+00', NULL, 1, 64, '┘▒┘ä┘Æ┘à┘ÅÏ│┘Ä┘à┘æ┘Ä┘ë┘░ Ï¿┘É┘▒Ï│┘Æ┘à┘É Ï▒┘ÄÏ│┘Å┘ê┘ä┘É┘â┘Ä', NULL, false),
	(3520, '2024-07-05 18:57:27.29917+00', NULL, 3, 64, 'almusamma bismi rasulika', NULL, false),
	(3521, '2024-07-05 18:57:27.366625+00', NULL, 2, 65, 'peace be upon him and his Household,', NULL, false),
	(3522, '2024-07-05 18:57:27.42593+00', NULL, 1, 65, 'ÏÁ┘Ä┘ä┘æ┘Ä┘ë┘░ ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å Ï╣┘Ä┘ä┘Ä┘è┘Æ┘ç┘É ┘ê┘ÄÏó┘ä┘É┘ç┘É', NULL, false),
	(3523, '2024-07-05 18:57:27.498678+00', NULL, 3, 65, 'salla allahu `alayhi wa alihi', NULL, false),
	(3524, '2024-07-05 18:57:27.58532+00', NULL, 2, 66, 'so that he shall tear up any wrong item that he will face', NULL, false),
	(3525, '2024-07-05 18:57:27.648833+00', NULL, 1, 66, 'Ï¡┘ÄÏ¬┘æ┘Ä┘ë┘░ ┘äÏº ┘è┘ÄÏ©┘Æ┘ü┘ÄÏ▒┘Ä Ï¿┘ÉÏ┤┘Ä┘è┘ÆÏí┘ì ┘à┘É┘å┘Ä ┘▒┘ä┘ÆÏ¿┘ÄÏºÏÀ┘É┘ä┘É ÏÑ┘É┘äÏº┘æ┘Ä ┘à┘ÄÏ▓┘æ┘Ä┘é┘Ä┘ç┘Å', NULL, false),
	(3526, '2024-07-05 18:57:27.707371+00', NULL, 3, 66, 'hatta la yazfara bishay''in min albatili illa mazzaqahu', NULL, false),
	(3527, '2024-07-05 18:57:27.77368+00', NULL, 2, 67, 'and shall confirm and approve of the truth.', NULL, false),
	(3528, '2024-07-05 18:57:27.840066+00', NULL, 1, 67, '┘ê┘Ä┘è┘ÅÏ¡┘É┘é┘æ┘Å ┘▒┘ä┘ÆÏ¡┘Ä┘é┘æ┘Ä ┘ê┘Ä┘è┘ÅÏ¡┘Ä┘é┘æ┘É┘é┘Ä┘ç┘Å', NULL, false),
	(3529, '2024-07-05 18:57:27.917431+00', NULL, 3, 67, 'wa yahiqqa alhaqqa wa yuhaqqiqahu', NULL, false),
	(3530, '2024-07-05 18:57:27.982415+00', NULL, 2, 68, 'O Allah, (please) make him the shelter to whom Your wronged servants shall resort,', NULL, false),
	(3531, '2024-07-05 18:57:28.043127+00', NULL, 1, 68, '┘ê┘Ä┘▒Ï¼┘ÆÏ╣┘Ä┘ä┘Æ┘ç┘Å ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ┘à┘Ä┘ü┘ÆÏ▓┘ÄÏ╣Ïº┘ï ┘ä┘É┘à┘ÄÏ©┘Æ┘ä┘Å┘ê┘à┘É Ï╣┘ÉÏ¿┘ÄÏºÏ»┘É┘â┘Ä', NULL, false),
	(3532, '2024-07-05 18:57:28.106122+00', NULL, 3, 68, 'waj`alhu allahumma mafza`an limazlumi `ibadika', NULL, false),
	(3533, '2024-07-05 18:57:28.175465+00', NULL, 2, 69, 'the supporter of those who cannot find any supporter save You,', NULL, false),
	(3534, '2024-07-05 18:57:28.248414+00', NULL, 1, 69, '┘ê┘Ä┘å┘ÄÏºÏÁ┘ÉÏ▒Ïº┘ï ┘ä┘É┘à┘Ä┘å┘Æ ┘äÏº ┘è┘ÄÏ¼┘ÉÏ»┘Å ┘ä┘Ä┘ç┘Å ┘å┘ÄÏºÏÁ┘ÉÏ▒Ïº┘ï Ï║┘Ä┘è┘ÆÏ▒┘Ä┘â┘Ä', NULL, false),
	(3535, '2024-07-05 18:57:28.32465+00', NULL, 3, 69, 'wa nasiran liman la yajidu lahu nasiran ghayraka', NULL, false),
	(3536, '2024-07-05 18:57:28.383881+00', NULL, 2, 70, 'the reviver of the laws of Your Book that have been suspended,', NULL, false),
	(3537, '2024-07-05 18:57:28.439883+00', NULL, 1, 70, '┘ê┘Ä┘à┘ÅÏ¼┘ÄÏ»┘æ┘ÉÏ»Ïº┘ï ┘ä┘É┘à┘ÄÏº Ï╣┘ÅÏÀ┘æ┘É┘ä┘Ä ┘à┘É┘å┘Æ ÏºÏ¡┘Æ┘â┘ÄÏº┘à┘É ┘â┘ÉÏ¬┘ÄÏºÏ¿┘É┘â┘Ä', NULL, false),
	(3538, '2024-07-05 18:57:28.502458+00', NULL, 3, 70, 'wa mujaddidan lima `uttila min ahkami kitabika', NULL, false),
	(3539, '2024-07-05 18:57:28.565903+00', NULL, 2, 71, 'and the constructor of all signs of Your religion and instructions of Your Messenger,', NULL, false),
	(3540, '2024-07-05 18:57:28.629539+00', NULL, 1, 71, '┘ê┘Ä┘à┘ÅÏ┤┘Ä┘è┘æ┘ÉÏ»Ïº┘ï ┘ä┘É┘à┘ÄÏº ┘ê┘ÄÏ▒┘ÄÏ»┘Ä ┘à┘É┘å┘Æ ÏºÏ╣┘Æ┘äÏº┘à┘É Ï»┘É┘è┘å┘É┘â┘Ä ┘ê┘ÄÏ│┘Å┘å┘Ä┘å┘É ┘å┘ÄÏ¿┘É┘è┘æ┘É┘â┘Ä', NULL, false),
	(3541, '2024-07-05 18:57:28.689225+00', NULL, 3, 71, 'wa mushayyidan lima warada min a`lami dinika wa sunani nabiyyika', NULL, false),
	(3542, '2024-07-05 18:57:28.752252+00', NULL, 2, 72, 'peace be upon him and his Household, that he will see.', NULL, false),
	(3543, '2024-07-05 18:57:28.820611+00', NULL, 1, 72, 'ÏÁ┘Ä┘ä┘æ┘Ä┘ë┘░ ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å Ï╣┘Ä┘ä┘Ä┘è┘Æ┘ç┘É ┘êÏó┘ä┘É┘ç┘É', NULL, false),
	(3544, '2024-07-05 18:57:28.891556+00', NULL, 3, 72, 'salla allahu `alayhi wa alihi', NULL, false),
	(3545, '2024-07-05 18:57:28.956453+00', NULL, 2, 73, 'O Allah, (please) include him with those whom You protect from the domination of the aggressors.', NULL, false),
	(3546, '2024-07-05 18:57:29.051403+00', NULL, 1, 73, '┘ê┘Ä┘▒Ï¼┘ÆÏ╣┘Ä┘ä┘Æ┘ç┘Å ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ┘à┘É┘à┘æ┘Ä┘å┘Æ Ï¡┘ÄÏÁ┘æ┘Ä┘å┘ÆÏ¬┘Ä┘ç┘Å ┘à┘É┘å┘Æ Ï¿┘ÄÏºÏ│┘É ┘▒┘ä┘Æ┘à┘ÅÏ╣┘ÆÏ¬┘ÄÏ»┘É┘è┘å┘Ä', NULL, false),
	(3547, '2024-07-05 18:57:29.112673+00', NULL, 3, 73, 'waj`alhu allahumma mimman hassantahu min ba''si almu`tadina', NULL, false),
	(3548, '2024-07-05 18:57:29.174965+00', NULL, 2, 74, 'O Allah, (please) delight Your Prophet Muhammad,', NULL, false),
	(3549, '2024-07-05 18:57:29.22934+00', NULL, 1, 74, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ┘ê┘ÄÏ│┘ÅÏ▒┘æ┘Ä ┘å┘ÄÏ¿┘É┘è┘æ┘Ä┘â┘Ä ┘à┘ÅÏ¡┘Ä┘à┘æ┘ÄÏ»Ïº┘ï', NULL, false),
	(3550, '2024-07-05 18:57:29.310513+00', NULL, 3, 74, 'allahumma wa surra nabiyyaka muhammadan', NULL, false),
	(3551, '2024-07-05 18:57:29.380047+00', NULL, 2, 75, 'peace be upon him and his Household,', NULL, false),
	(3552, '2024-07-05 18:57:29.442069+00', NULL, 1, 75, 'ÏÁ┘Ä┘ä┘æ┘Ä┘ë┘░ ┘▒┘ä┘ä┘æ┘Ä┘ç┘Å Ï╣┘Ä┘ä┘Ä┘è┘Æ┘ç┘É ┘êÏó┘ä┘É┘ç┘É', NULL, false),
	(3553, '2024-07-05 18:57:29.508606+00', NULL, 3, 75, 'salla allahu `alayhi wa alihi', NULL, false),
	(3554, '2024-07-05 18:57:29.561894+00', NULL, 2, 76, 'as well as all those who followed him in his promulgation by making (us) see him,', NULL, false),
	(3555, '2024-07-05 18:57:29.623609+00', NULL, 1, 76, 'Ï¿┘ÉÏ▒┘ÅÏñ┘Æ┘è┘ÄÏ¬┘É┘ç┘É ┘ê┘Ä┘à┘Ä┘å┘Æ Ï¬┘ÄÏ¿┘ÉÏ╣┘Ä┘ç┘Å Ï╣┘Ä┘ä┘Ä┘ë┘░ Ï»┘ÄÏ╣┘Æ┘ê┘ÄÏ¬┘É┘ç┘É', NULL, false),
	(3556, '2024-07-05 18:57:29.693574+00', NULL, 3, 76, 'biru''yatihi wa man tabi`ahu `ala da`watihi', NULL, false),
	(3557, '2024-07-05 18:57:29.77055+00', NULL, 2, 77, 'and (please) have mercy upon our humiliation after him.', NULL, false),
	(3558, '2024-07-05 18:57:29.840833+00', NULL, 1, 77, '┘ê┘Ä┘▒Ï▒┘ÆÏ¡┘Ä┘à┘É ┘▒Ï│┘ÆÏ¬┘É┘â┘ÄÏº┘å┘ÄÏ¬┘Ä┘å┘ÄÏº Ï¿┘ÄÏ╣┘ÆÏ»┘Ä┘ç┘Å', NULL, false),
	(3559, '2024-07-05 18:57:29.909293+00', NULL, 3, 77, 'warham istikanatana ba`dahu', NULL, false),
	(3560, '2024-07-05 18:57:29.967108+00', NULL, 2, 78, 'O Allah, (please) relieve this community from the (current) grief through presenting him', NULL, false),
	(3561, '2024-07-05 18:57:30.033991+00', NULL, 1, 78, 'Ïº┘Ä┘ä┘ä┘æ┘Ä┘ç┘Å┘à┘æ┘Ä ┘▒┘â┘ÆÏ┤┘É┘ü┘Æ ┘ç┘░Ï░┘É┘ç┘É ┘▒┘ä┘ÆÏ║┘Å┘à┘æ┘ÄÏ®┘Ä Ï╣┘Ä┘å┘Æ ┘ç┘░Ï░┘É┘ç┘É ┘▒┘äÏº┘à┘æ┘ÄÏ®┘É Ï¿┘ÉÏ¡┘ÅÏÂ┘Å┘êÏ▒┘É┘ç┘É', NULL, false),
	(3562, '2024-07-05 18:57:30.110521+00', NULL, 3, 78, 'allahumma ikshif hadhihi alghummata `an hadhihi al-ummati bihudurihi', NULL, false),
	(3563, '2024-07-05 18:57:30.176871+00', NULL, 2, 79, 'and expedite his advent for us:', NULL, false),
	(3564, '2024-07-05 18:57:30.256692+00', NULL, 1, 79, '┘ê┘ÄÏ╣┘ÄÏ¼┘æ┘É┘ä┘Æ ┘ä┘Ä┘å┘ÄÏº Ï©┘Å┘ç┘Å┘êÏ▒┘Ä┘ç┘Å', NULL, false),
	(3565, '2024-07-05 18:57:30.320136+00', NULL, 3, 79, 'wa `ajjil lana zuhurahu', NULL, false),
	(3566, '2024-07-05 18:57:30.394974+00', NULL, 2, 80, 'ÔÇ£Surely, they think it to be far off, and We see it nigh.ÔÇØ', NULL, false),
	(3567, '2024-07-05 18:57:30.476279+00', NULL, 1, 80, '┬½ÏÑ┘É┘å┘æ┘Ä┘ç┘Å┘à┘Æ ┘è┘ÄÏ▒┘Ä┘ê┘Æ┘å┘Ä┘ç┘Å Ï¿┘ÄÏ╣┘É┘èÏ»Ïº┘ï ┘ê┘Ä┘å┘ÄÏ▒┘ÄÏº┘ç┘Å ┘é┘ÄÏ▒┘É┘èÏ¿Ïº┘ï.┬╗', NULL, false),
	(3568, '2024-07-05 18:57:30.564136+00', NULL, 3, 80, 'innahum yarawnahu ba`idan wa narahu qariban', NULL, false),
	(3569, '2024-07-05 18:57:30.627293+00', NULL, 2, 81, '[do all that] In the name of Your mercy; O most merciful of all those who show mercy.', NULL, false),
	(3570, '2024-07-05 18:57:30.700974+00', NULL, 1, 81, 'Ï¿┘ÉÏ▒┘ÄÏ¡┘Æ┘à┘ÄÏ¬┘É┘â┘Ä ┘è┘ÄÏº ÏºÏ▒┘ÆÏ¡┘Ä┘à┘Ä ┘▒┘äÏ▒┘æ┘ÄÏºÏ¡┘É┘à┘É┘è┘å┘Ä', NULL, false),
	(3571, '2024-07-05 18:57:30.766605+00', NULL, 3, 81, 'birahmatika ya arhama alrrahimina', NULL, false),
	(3572, '2024-07-05 18:57:30.836131+00', NULL, 2, 82, 'You may then slap your right thigh with your hand three times and, at each time, say the following words:', NULL, false),
	(3573, '2024-07-05 18:57:30.90558+00', NULL, 1, 82, '', NULL, false),
	(3574, '2024-07-05 18:57:30.974898+00', NULL, 3, 82, '', NULL, false),
	(3575, '2024-07-05 18:57:31.035027+00', NULL, 2, 83, '(We pray for Your) earliest advent, earliest advent, O Patron of the Age.', NULL, false),
	(3576, '2024-07-05 18:57:31.123219+00', NULL, 1, 83, 'Ïº┘ä┘ÆÏ╣┘ÄÏ¼┘Ä┘ä┘Ä ┘▒┘ä┘ÆÏ╣┘ÄÏ¼┘Ä┘ä┘Ä ┘è┘ÄÏº┘à┘Ä┘ê┘Æ┘äÏº┘è┘Ä ┘è┘ÄÏº ÏÁ┘ÄÏºÏ¡┘ÉÏ¿┘Ä ┘▒┘äÏ▓┘æ┘Ä┘à┘ÄÏº┘å┘É', NULL, false),
	(3577, '2024-07-05 18:57:31.20154+00', NULL, 3, 83, 'al`ajala al`ajala ya mawlaya ya sahiba alzzamani', NULL, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."tags" ("id", "created_at", "updated_at", "name") VALUES
	(1, '2024-06-19 15:20:03.920618+00', NULL, 'daily');


--
-- Data for Name: dua_has_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."dua_has_tags" ("created_at", "updated_at", "dua_id", "tag_id") VALUES
	('2024-07-09 09:32:52.854205+00', NULL, 22, 1);


--
-- Data for Name: reciters; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: references; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."references" ("id", "created_at", "updated_at", "url", "type", "dua_id", "language_id") VALUES
	(2, '2024-07-05 18:57:13.806806+00', NULL, 'https://www.duaplayer.org/api/2/aahad?langs=ar|en|tl&getSlides=true', 'Duaplayer Api', 22, 1);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: audio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."audio_id_seq"', 1, false);


--
-- Name: dua_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."dua_contents_id_seq"', 3, true);


--
-- Name: dua_translation_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."dua_translation_lines_id_seq"', 3577, true);


--
-- Name: duas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."duas_id_seq"', 22, true);


--
-- Name: languages_code_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."languages_code_seq"', 3, true);


--
-- Name: reciter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."reciter_id_seq"', 1, false);


--
-- Name: references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."references_id_seq"', 2, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."tags_id_seq"', 1, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
