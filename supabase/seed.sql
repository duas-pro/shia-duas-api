--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.10

-- Started on 2025-02-08 18:40:41

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

-- Storages
INSERT INTO
storage.buckets (id, name, public, owner, avif_autodetection)
VALUES
('duas', 'duas', true, null, false),
('reciters', 'reciters', true, null, false),
('recitations', 'recitations', true, null, false);

--
-- TOC entry 3850 (class 0 OID 17403)
-- Dependencies: 297
-- Data for Name: duas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.duas VALUES (2, '2025-02-08 16:39:18.09398+00', NULL, 'dua-aahad', 'http://127.0.0.1:54321/storage/v1/object/public/duas/dua-aahad_low.jpg?', 'http://127.0.0.1:54321/storage/v1/object/public/duas/dua-aahad_high.jpg?', false, 'dua', '[]');


--
-- TOC entry 3855 (class 0 OID 17423)
-- Dependencies: 302
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3836 (class 0 OID 17358)
-- Dependencies: 283
-- Data for Name: dua_has_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3851 (class 0 OID 17409)
-- Dependencies: 298
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.languages VALUES ('en', '2025-02-08 16:38:11.415606+00', NULL);
INSERT INTO public.languages VALUES ('ar', '2025-02-08 16:38:16.321813+00', NULL);
INSERT INTO public.languages VALUES ('translit', '2025-02-08 16:38:20.831092+00', NULL);
INSERT INTO public.languages VALUES ('de', '2025-02-08 16:38:25.642478+00', NULL);


--
-- TOC entry 3838 (class 0 OID 17363)
-- Dependencies: 285
-- Data for Name: dua_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dua_infos VALUES (1, '2025-02-08 16:39:18.123103+00', NULL, 2, 'EN', 'Supplication of Allegiance', 'ImamJaffarSadiq', NULL);
INSERT INTO public.dua_infos VALUES (2, '2025-02-08 16:39:18.133414+00', NULL, 2, 'AR', 'دعاء عَهْد', 'ImamJaffarSadiq', NULL);
INSERT INTO public.dua_infos VALUES (3, '2025-02-08 16:39:18.14044+00', NULL, 2, 'TL', 'Dua Aahad', 'ImamJaffarSadiq', NULL);


--
-- TOC entry 3842 (class 0 OID 17377)
-- Dependencies: 289
-- Data for Name: dua_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dua_lines VALUES (1, '2025-02-08 16:39:18.147406+00', NULL, 2, 1, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (2, '2025-02-08 16:39:18.178089+00', NULL, 2, 2, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (3, '2025-02-08 16:39:18.209004+00', NULL, 2, 3, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (4, '2025-02-08 16:39:18.237259+00', NULL, 2, 4, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (5, '2025-02-08 16:39:18.266878+00', NULL, 2, 5, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (6, '2025-02-08 16:39:18.295665+00', NULL, 2, 6, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (7, '2025-02-08 16:39:18.324611+00', NULL, 2, 7, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (8, '2025-02-08 16:39:18.353802+00', NULL, 2, 8, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (9, '2025-02-08 16:39:18.383153+00', NULL, 2, 9, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (10, '2025-02-08 16:39:18.411087+00', NULL, 2, 10, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (11, '2025-02-08 16:39:18.438828+00', NULL, 2, 11, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (12, '2025-02-08 16:39:18.46735+00', NULL, 2, 12, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (13, '2025-02-08 16:39:18.496121+00', NULL, 2, 13, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (14, '2025-02-08 16:39:18.52436+00', NULL, 2, 14, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (15, '2025-02-08 16:39:18.551995+00', NULL, 2, 15, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (16, '2025-02-08 16:39:18.580823+00', NULL, 2, 16, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (17, '2025-02-08 16:39:18.60938+00', NULL, 2, 17, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (18, '2025-02-08 16:39:18.639313+00', NULL, 2, 18, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (19, '2025-02-08 16:39:18.667033+00', NULL, 2, 19, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (20, '2025-02-08 16:39:18.69611+00', NULL, 2, 20, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (21, '2025-02-08 16:39:18.723862+00', NULL, 2, 21, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (22, '2025-02-08 16:39:18.750614+00', NULL, 2, 22, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (23, '2025-02-08 16:39:18.778326+00', NULL, 2, 23, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (24, '2025-02-08 16:39:18.807456+00', NULL, 2, 24, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (25, '2025-02-08 16:39:18.835821+00', NULL, 2, 25, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (26, '2025-02-08 16:39:18.866834+00', NULL, 2, 26, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (27, '2025-02-08 16:39:18.895258+00', NULL, 2, 27, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (28, '2025-02-08 16:39:18.924407+00', NULL, 2, 28, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (29, '2025-02-08 16:39:18.952852+00', NULL, 2, 29, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (30, '2025-02-08 16:39:18.981536+00', NULL, 2, 30, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (31, '2025-02-08 16:39:19.010047+00', NULL, 2, 31, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (32, '2025-02-08 16:39:19.039411+00', NULL, 2, 32, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (33, '2025-02-08 16:39:19.06623+00', NULL, 2, 33, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (34, '2025-02-08 16:39:19.094133+00', NULL, 2, 34, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (35, '2025-02-08 16:39:19.122822+00', NULL, 2, 35, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (36, '2025-02-08 16:39:19.149549+00', NULL, 2, 36, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (37, '2025-02-08 16:39:19.175401+00', NULL, 2, 37, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (38, '2025-02-08 16:39:19.203721+00', NULL, 2, 38, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (39, '2025-02-08 16:39:19.23156+00', NULL, 2, 39, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (40, '2025-02-08 16:39:19.258677+00', NULL, 2, 40, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (41, '2025-02-08 16:39:19.285464+00', NULL, 2, 41, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (42, '2025-02-08 16:39:19.313598+00', NULL, 2, 42, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (43, '2025-02-08 16:39:19.340702+00', NULL, 2, 43, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (44, '2025-02-08 16:39:19.368693+00', NULL, 2, 44, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (45, '2025-02-08 16:39:19.395998+00', NULL, 2, 45, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (46, '2025-02-08 16:39:19.424268+00', NULL, 2, 46, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (47, '2025-02-08 16:39:19.452078+00', NULL, 2, 47, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (48, '2025-02-08 16:39:19.479093+00', NULL, 2, 48, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (49, '2025-02-08 16:39:19.507055+00', NULL, 2, 49, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (50, '2025-02-08 16:39:19.535318+00', NULL, 2, 50, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (51, '2025-02-08 16:39:19.562175+00', NULL, 2, 51, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (52, '2025-02-08 16:39:19.589916+00', NULL, 2, 52, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (53, '2025-02-08 16:39:19.61811+00', NULL, 2, 53, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (54, '2025-02-08 16:39:19.645604+00', NULL, 2, 54, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (55, '2025-02-08 16:39:19.673619+00', NULL, 2, 55, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (56, '2025-02-08 16:39:19.702032+00', NULL, 2, 56, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (57, '2025-02-08 16:39:19.729996+00', NULL, 2, 57, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (58, '2025-02-08 16:39:19.757871+00', NULL, 2, 58, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (59, '2025-02-08 16:39:19.788817+00', NULL, 2, 59, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (60, '2025-02-08 16:39:19.817596+00', NULL, 2, 60, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (61, '2025-02-08 16:39:19.843996+00', NULL, 2, 61, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (62, '2025-02-08 16:39:19.869877+00', NULL, 2, 62, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (63, '2025-02-08 16:39:19.89894+00', NULL, 2, 63, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (64, '2025-02-08 16:39:19.927116+00', NULL, 2, 64, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (65, '2025-02-08 16:39:19.955033+00', NULL, 2, 65, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (66, '2025-02-08 16:39:19.984289+00', NULL, 2, 66, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (67, '2025-02-08 16:39:20.012698+00', NULL, 2, 67, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (68, '2025-02-08 16:39:20.041092+00', NULL, 2, 68, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (69, '2025-02-08 16:39:20.071162+00', NULL, 2, 69, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (70, '2025-02-08 16:39:20.099221+00', NULL, 2, 70, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (71, '2025-02-08 16:39:20.127351+00', NULL, 2, 71, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (72, '2025-02-08 16:39:20.153611+00', NULL, 2, 72, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (73, '2025-02-08 16:39:20.180755+00', NULL, 2, 73, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (74, '2025-02-08 16:39:20.209605+00', NULL, 2, 74, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (75, '2025-02-08 16:39:20.239192+00', NULL, 2, 75, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (76, '2025-02-08 16:39:20.266469+00', NULL, 2, 76, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (77, '2025-02-08 16:39:20.295134+00', NULL, 2, 77, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (78, '2025-02-08 16:39:20.322977+00', NULL, 2, 78, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (79, '2025-02-08 16:39:20.349524+00', NULL, 2, 79, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (80, '2025-02-08 16:39:20.376941+00', NULL, 2, 80, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (81, '2025-02-08 16:39:20.405626+00', NULL, 2, 81, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (82, '2025-02-08 16:39:20.433232+00', NULL, 2, 82, 'SUPPLICATION', false, NULL);
INSERT INTO public.dua_lines VALUES (83, '2025-02-08 16:39:20.46062+00', NULL, 2, 83, 'SUPPLICATION', false, NULL);


--
-- TOC entry 3840 (class 0 OID 17370)
-- Dependencies: 287
-- Data for Name: dua_line_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dua_line_texts VALUES (1, '2025-02-08 16:39:18.155335+00', NULL, 1, 'EN', 'In the Name of Allah, the All-beneficent, the All-merciful');
INSERT INTO public.dua_line_texts VALUES (2, '2025-02-08 16:39:18.163427+00', NULL, 1, 'AR', 'ِسْمِ ٱللَّهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ');
INSERT INTO public.dua_line_texts VALUES (3, '2025-02-08 16:39:18.170991+00', NULL, 1, 'TL', 'bismi allahi alrrahmani alrrahimi');
INSERT INTO public.dua_line_texts VALUES (4, '2025-02-08 16:39:18.185884+00', NULL, 2, 'EN', 'O Allah: (please do) send blessings upon Muhammad and the Household of Muhammad—');
INSERT INTO public.dua_line_texts VALUES (5, '2025-02-08 16:39:18.194079+00', NULL, 2, 'AR', 'اللّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ');
INSERT INTO public.dua_line_texts VALUES (6, '2025-02-08 16:39:18.201237+00', NULL, 2, 'TL', 'allahumma salli `ala muhammadin wa ali muhammadin');
INSERT INTO public.dua_line_texts VALUES (7, '2025-02-08 16:39:18.216223+00', NULL, 3, 'EN', 'O Allah the Lord of the Great Light,');
INSERT INTO public.dua_line_texts VALUES (8, '2025-02-08 16:39:18.223222+00', NULL, 3, 'AR', 'اَللَّهُمَّ رَبَّ ٱلنُّورِ ٱلْعَظِيمِ');
INSERT INTO public.dua_line_texts VALUES (9, '2025-02-08 16:39:18.229977+00', NULL, 3, 'TL', 'allahumma rabba alnnuri al`azimi');
INSERT INTO public.dua_line_texts VALUES (10, '2025-02-08 16:39:18.24502+00', NULL, 4, 'EN', 'the Lord of the Elevated Throne,');
INSERT INTO public.dua_line_texts VALUES (11, '2025-02-08 16:39:18.252267+00', NULL, 4, 'AR', 'وَرَبَّ ٱلْكُرْسِيِّ ٱلرَّفِيعِ');
INSERT INTO public.dua_line_texts VALUES (12, '2025-02-08 16:39:18.259397+00', NULL, 4, 'TL', 'wa rabba alkursiyyi alrrafi`i');
INSERT INTO public.dua_line_texts VALUES (13, '2025-02-08 16:39:18.274764+00', NULL, 5, 'EN', 'the Lord of the swollen ocean,');
INSERT INTO public.dua_line_texts VALUES (14, '2025-02-08 16:39:18.281699+00', NULL, 5, 'AR', 'وَرَبَّ ٱلْبَحْرِ ٱلْمَسْجُورِ');
INSERT INTO public.dua_line_texts VALUES (15, '2025-02-08 16:39:18.288797+00', NULL, 5, 'TL', 'wa rabba albahri almasjuri');
INSERT INTO public.dua_line_texts VALUES (16, '2025-02-08 16:39:18.303207+00', NULL, 6, 'EN', 'the Revealer of the Torah, the Gospel, and the Psalms,');
INSERT INTO public.dua_line_texts VALUES (17, '2025-02-08 16:39:18.310565+00', NULL, 6, 'AR', 'وَمُنْزِلَ ٱلتَّوْرَاةِ وَٱلإِنْجِيلِ وَٱلزَّبُورِ');
INSERT INTO public.dua_line_texts VALUES (18, '2025-02-08 16:39:18.317724+00', NULL, 6, 'TL', 'wa munzila alttawrati wal-injili wallzzaburi');
INSERT INTO public.dua_line_texts VALUES (19, '2025-02-08 16:39:18.332284+00', NULL, 7, 'EN', 'the Lord of shade and heat,');
INSERT INTO public.dua_line_texts VALUES (20, '2025-02-08 16:39:18.339532+00', NULL, 7, 'AR', 'وَرَبَّ ٱلظِّلِّ وَٱلْحَرُورِ');
INSERT INTO public.dua_line_texts VALUES (21, '2025-02-08 16:39:18.346608+00', NULL, 7, 'TL', 'wa rabba alzzilli walharuri');
INSERT INTO public.dua_line_texts VALUES (22, '2025-02-08 16:39:18.361145+00', NULL, 8, 'EN', 'the Revealer of the Great Qur''an,');
INSERT INTO public.dua_line_texts VALUES (23, '2025-02-08 16:39:18.368701+00', NULL, 8, 'AR', 'وَمُنْزِلَ ٱلْقُرْآنِ ٱلْعَظِيمِ');
INSERT INTO public.dua_line_texts VALUES (24, '2025-02-08 16:39:18.376032+00', NULL, 8, 'TL', 'wa munzila alqur''ani al`azimi');
INSERT INTO public.dua_line_texts VALUES (25, '2025-02-08 16:39:18.390308+00', NULL, 9, 'EN', 'and the Lord of the Archangels,');
INSERT INTO public.dua_line_texts VALUES (26, '2025-02-08 16:39:18.397132+00', NULL, 9, 'AR', 'وَرَبَّ ٱلْمَلاَئِكَةِ ٱلْمُقَرَّبِينَ');
INSERT INTO public.dua_line_texts VALUES (27, '2025-02-08 16:39:18.404276+00', NULL, 9, 'TL', 'wa rabba almala''ikati almuqarrabina');
INSERT INTO public.dua_line_texts VALUES (28, '2025-02-08 16:39:18.417527+00', NULL, 10, 'EN', 'the Prophets, and the Messengers:');
INSERT INTO public.dua_line_texts VALUES (29, '2025-02-08 16:39:18.424759+00', NULL, 10, 'AR', 'وَٱلانْبِيَاءِ وَٱلْمُرْسَلِينَ');
INSERT INTO public.dua_line_texts VALUES (30, '2025-02-08 16:39:18.431916+00', NULL, 10, 'TL', 'wal-anbiya''i walmursalina');
INSERT INTO public.dua_line_texts VALUES (31, '2025-02-08 16:39:18.445826+00', NULL, 11, 'EN', 'O Allah, I beseech You in Your Noble Name,');
INSERT INTO public.dua_line_texts VALUES (32, '2025-02-08 16:39:18.452637+00', NULL, 11, 'AR', 'اَللَّهُمَّ إِنِّي اسْالُكَ بِٱسْمِكَ ٱلْكَرِيـمِ');
INSERT INTO public.dua_line_texts VALUES (33, '2025-02-08 16:39:18.459938+00', NULL, 11, 'TL', 'allahumma inni as''aluka bismika alkarimi');
INSERT INTO public.dua_line_texts VALUES (34, '2025-02-08 16:39:18.475632+00', NULL, 12, 'EN', 'in the Light of Your Luminous Face');
INSERT INTO public.dua_line_texts VALUES (35, '2025-02-08 16:39:18.482735+00', NULL, 12, 'AR', 'وَبِنُورِ وَجْهِكَ ٱلْمُنِيرِ');
INSERT INTO public.dua_line_texts VALUES (36, '2025-02-08 16:39:18.489408+00', NULL, 12, 'TL', 'wa binuri wajhika almuniri');
INSERT INTO public.dua_line_texts VALUES (37, '2025-02-08 16:39:18.503049+00', NULL, 13, 'EN', 'and Your Eternal Kingdom.');
INSERT INTO public.dua_line_texts VALUES (38, '2025-02-08 16:39:18.510021+00', NULL, 13, 'AR', 'وَمُلْكِكَ ٱلْقَدِيمِ');
INSERT INTO public.dua_line_texts VALUES (39, '2025-02-08 16:39:18.517179+00', NULL, 13, 'TL', 'wa mulkika alqadimi');
INSERT INTO public.dua_line_texts VALUES (40, '2025-02-08 16:39:18.531315+00', NULL, 14, 'EN', 'O Ever-living! O Self-Subsistent!');
INSERT INTO public.dua_line_texts VALUES (41, '2025-02-08 16:39:18.538286+00', NULL, 14, 'AR', 'يَا حَيُّ يَا قَيُّومُ');
INSERT INTO public.dua_line_texts VALUES (42, '2025-02-08 16:39:18.545107+00', NULL, 14, 'TL', 'ya hayyu ya qayyumu');
INSERT INTO public.dua_line_texts VALUES (43, '2025-02-08 16:39:18.558984+00', NULL, 15, 'EN', 'I beseech You in the name of Your Name with which the heavens and the earth have lit up');
INSERT INTO public.dua_line_texts VALUES (44, '2025-02-08 16:39:18.566199+00', NULL, 15, 'AR', 'اسْالُكَ بِٱسْمِكَ ٱلَّذِي اشْرَقَتْ بِهِ ٱلسَّمَاوَاتُ وَٱلارَضُونَ');
INSERT INTO public.dua_line_texts VALUES (45, '2025-02-08 16:39:18.573628+00', NULL, 15, 'TL', 'as''aluka bismika alladhi ashraqat bihi alssamawatu wal-araduna');
INSERT INTO public.dua_line_texts VALUES (46, '2025-02-08 16:39:18.587751+00', NULL, 16, 'EN', 'and in Your Name with which the past and the coming generations have become upright!');
INSERT INTO public.dua_line_texts VALUES (47, '2025-02-08 16:39:18.59488+00', NULL, 16, 'AR', 'وَبِٱسْمِكَ ٱلَّذِي يَصْلَحُ بِهِ ٱلاوَّلُونَ وَٱلآخِرُونَ');
INSERT INTO public.dua_line_texts VALUES (48, '2025-02-08 16:39:18.602181+00', NULL, 16, 'TL', 'wa bismika alladhi yasluhu bihi al-awwaluna wal-akhiruna');
INSERT INTO public.dua_line_texts VALUES (49, '2025-02-08 16:39:18.617033+00', NULL, 17, 'EN', 'O He Who has been always alive before the existence of all living things!');
INSERT INTO public.dua_line_texts VALUES (50, '2025-02-08 16:39:18.624215+00', NULL, 17, 'AR', 'يَا حَيّاً قَبْلَ كُلِّ حَيٍّ');
INSERT INTO public.dua_line_texts VALUES (51, '2025-02-08 16:39:18.63193+00', NULL, 17, 'TL', 'ya hayyan qabla kulli hayyin');
INSERT INTO public.dua_line_texts VALUES (52, '2025-02-08 16:39:18.646352+00', NULL, 18, 'EN', 'O He Who shall be alive after the extinction of all living things!');
INSERT INTO public.dua_line_texts VALUES (53, '2025-02-08 16:39:18.653327+00', NULL, 18, 'AR', 'وَيَا حَيّاً بَعْدَ كُلِّ حَيٍّ');
INSERT INTO public.dua_line_texts VALUES (54, '2025-02-08 16:39:18.660204+00', NULL, 18, 'TL', 'wa ya hayyan ba`da kulli hayyin');
INSERT INTO public.dua_line_texts VALUES (55, '2025-02-08 16:39:18.674451+00', NULL, 19, 'EN', 'O He Who has been always alive even when there was nothing else alive!');
INSERT INTO public.dua_line_texts VALUES (56, '2025-02-08 16:39:18.681295+00', NULL, 19, 'AR', 'وَيَا حَيّاً حِينَ لا حَيُّ');
INSERT INTO public.dua_line_texts VALUES (57, '2025-02-08 16:39:18.688713+00', NULL, 19, 'TL', 'wa ya hayyan hina la hayyu');
INSERT INTO public.dua_line_texts VALUES (58, '2025-02-08 16:39:18.703767+00', NULL, 20, 'EN', 'O He Who revives the dead ones and causes the living ones to die!');
INSERT INTO public.dua_line_texts VALUES (59, '2025-02-08 16:39:18.710746+00', NULL, 20, 'AR', 'يَا مُحْيِيَ ٱلْمَوْتَىٰ وَمُمِيتَ ٱلاحْيَاءِ');
INSERT INTO public.dua_line_texts VALUES (60, '2025-02-08 16:39:18.717317+00', NULL, 20, 'TL', 'ya muhyiya almawta wa mumita al-ahya''i');
INSERT INTO public.dua_line_texts VALUES (61, '2025-02-08 16:39:18.730449+00', NULL, 21, 'EN', 'O Ever-living! There is no god save You.');
INSERT INTO public.dua_line_texts VALUES (62, '2025-02-08 16:39:18.736961+00', NULL, 21, 'AR', 'يَا حَيُّ لا إِلٰهَ إِلاَّ انْتَ');
INSERT INTO public.dua_line_texts VALUES (63, '2025-02-08 16:39:18.743776+00', NULL, 21, 'TL', 'ya hayyu la ilaha illa anta');
INSERT INTO public.dua_line_texts VALUES (64, '2025-02-08 16:39:18.757168+00', NULL, 22, 'EN', 'O Allah, convey to our master Imam al-Mahdi, the guide who is to undertake Your orders,');
INSERT INTO public.dua_line_texts VALUES (65, '2025-02-08 16:39:18.763941+00', NULL, 22, 'AR', 'اَللَّهُمَّ بَلِّغْ مَوْلاَنَا ٱلإِمَامَ ٱلْهَادِيَ ٱلْمَهْدِيَّ ٱلْقَائِمَ بِامْرِكَ');
INSERT INTO public.dua_line_texts VALUES (66, '2025-02-08 16:39:18.771145+00', NULL, 22, 'TL', 'allahumma balligh mawlana al-imama alhadiya almahdiyya alqa''ima bi''amrika');
INSERT INTO public.dua_line_texts VALUES (67, '2025-02-08 16:39:18.785344+00', NULL, 23, 'EN', 'may Allah’s blessings be upon him and upon his immaculate fathers,');
INSERT INTO public.dua_line_texts VALUES (68, '2025-02-08 16:39:18.792469+00', NULL, 23, 'AR', 'صَلَوَاتُ ٱللَّهِ عَلَيْهِ وَعَلَىٰ آبَائِهِ ٱلطَّاهِرِينَ');
INSERT INTO public.dua_line_texts VALUES (69, '2025-02-08 16:39:18.800132+00', NULL, 23, 'TL', 'salawatu allahi `alayhi wa `ala aba''ihi alttahirina');
INSERT INTO public.dua_line_texts VALUES (70, '2025-02-08 16:39:18.81452+00', NULL, 24, 'EN', 'on behalf of all of the believing men and women');
INSERT INTO public.dua_line_texts VALUES (71, '2025-02-08 16:39:18.821971+00', NULL, 24, 'AR', 'عَنْ جَمِيعِ ٱلْمُؤْمِنِينَ وَٱلْمُؤْمِنَاتِ');
INSERT INTO public.dua_line_texts VALUES (72, '2025-02-08 16:39:18.828839+00', NULL, 24, 'TL', '`an jami`i almu''minina walmu''minati');
INSERT INTO public.dua_line_texts VALUES (73, '2025-02-08 16:39:18.843127+00', NULL, 25, 'EN', 'in the east and west of the earth');
INSERT INTO public.dua_line_texts VALUES (74, '2025-02-08 16:39:18.851628+00', NULL, 25, 'AR', 'فِي مَشَارِقِ ٱلارْضِ وَمَغَارِبِهَا');
INSERT INTO public.dua_line_texts VALUES (75, '2025-02-08 16:39:18.859345+00', NULL, 25, 'TL', 'fi mashariqi al-ardi wa magharibiha');
INSERT INTO public.dua_line_texts VALUES (76, '2025-02-08 16:39:18.873876+00', NULL, 26, 'EN', 'and in plains, mountains,');
INSERT INTO public.dua_line_texts VALUES (77, '2025-02-08 16:39:18.880965+00', NULL, 26, 'AR', 'سَهْلِهَا وَجَبَلِهَا');
INSERT INTO public.dua_line_texts VALUES (78, '2025-02-08 16:39:18.888072+00', NULL, 26, 'TL', 'sahliha wa jabaliha');
INSERT INTO public.dua_line_texts VALUES (79, '2025-02-08 16:39:18.902487+00', NULL, 27, 'EN', 'lands, and seas,');
INSERT INTO public.dua_line_texts VALUES (80, '2025-02-08 16:39:18.909581+00', NULL, 27, 'AR', 'وَبَرِّهَا وَبَحْرِهَا');
INSERT INTO public.dua_line_texts VALUES (81, '2025-02-08 16:39:18.916986+00', NULL, 27, 'TL', 'wa barriha wa bahriha');
INSERT INTO public.dua_line_texts VALUES (82, '2025-02-08 16:39:18.931385+00', NULL, 28, 'EN', 'and on behalf of my parents');
INSERT INTO public.dua_line_texts VALUES (83, '2025-02-08 16:39:18.938481+00', NULL, 28, 'AR', 'وَعَنِّي وَعَنْ وَالِدَيَّ');
INSERT INTO public.dua_line_texts VALUES (84, '2025-02-08 16:39:18.945516+00', NULL, 28, 'TL', 'wa `anni wa `an walidayya');
INSERT INTO public.dua_line_texts VALUES (85, '2025-02-08 16:39:18.959792+00', NULL, 29, 'EN', '(convey to him) blessings that are as weighty as Allah’s Throne,');
INSERT INTO public.dua_line_texts VALUES (86, '2025-02-08 16:39:18.967021+00', NULL, 29, 'AR', 'مِنَ ٱلصَّلَوَاتِ زِنَةَ عَرْشِ ٱللَّهِ');
INSERT INTO public.dua_line_texts VALUES (87, '2025-02-08 16:39:18.974123+00', NULL, 29, 'TL', 'min alssalawati zinata `arshi allahi');
INSERT INTO public.dua_line_texts VALUES (88, '2025-02-08 16:39:18.988522+00', NULL, 30, 'EN', 'as much as the ink of His Words,');
INSERT INTO public.dua_line_texts VALUES (89, '2025-02-08 16:39:18.995594+00', NULL, 30, 'AR', 'وَمِدَادَ كَلِمَاتِهِ');
INSERT INTO public.dua_line_texts VALUES (90, '2025-02-08 16:39:19.002634+00', NULL, 30, 'TL', 'wa midada kalimatihi');
INSERT INTO public.dua_line_texts VALUES (91, '2025-02-08 16:39:19.017219+00', NULL, 31, 'EN', 'and as many as that which is counted by His knowledge and encompassed by His Book.');
INSERT INTO public.dua_line_texts VALUES (92, '2025-02-08 16:39:19.02449+00', NULL, 31, 'AR', 'وَمَا احْصَاهُ عِلْمُهُ وَاحَاطَ بِهِ كِتَابُهُ');
INSERT INTO public.dua_line_texts VALUES (93, '2025-02-08 16:39:19.032001+00', NULL, 31, 'TL', 'wa ma ahsahu `ilmuhu wa ahata bihi kitabuhu');
INSERT INTO public.dua_line_texts VALUES (94, '2025-02-08 16:39:19.046103+00', NULL, 32, 'EN', 'O Allah, I update to him in the beginning of this day');
INSERT INTO public.dua_line_texts VALUES (95, '2025-02-08 16:39:19.052892+00', NULL, 32, 'AR', 'اَللَّهُمَّ إِنِّي اجَدِّدُ لَهُ فِي صَبِيحَةِ يَوْمِي هٰذَا');
INSERT INTO public.dua_line_texts VALUES (96, '2025-02-08 16:39:19.059476+00', NULL, 32, 'TL', 'allahumma inni ujaddidu lahu fi sabihati yawmi hadha');
INSERT INTO public.dua_line_texts VALUES (97, '2025-02-08 16:39:19.07294+00', NULL, 33, 'EN', 'and throughout the days of lifetime a pledge,');
INSERT INTO public.dua_line_texts VALUES (98, '2025-02-08 16:39:19.079621+00', NULL, 33, 'AR', 'وَمَا عِشْتُ مِنْ ايَّامِي');
INSERT INTO public.dua_line_texts VALUES (99, '2025-02-08 16:39:19.086575+00', NULL, 33, 'TL', 'wa ma `ishtu min ayyami');
INSERT INTO public.dua_line_texts VALUES (100, '2025-02-08 16:39:19.101646+00', NULL, 34, 'EN', 'a covenant, and allegiance to which I commit myself');
INSERT INTO public.dua_line_texts VALUES (101, '2025-02-08 16:39:19.108898+00', NULL, 34, 'AR', 'عَهْداً وَعَقْداً وَبَيْعَةً لَهُ فِي عُنُقِي');
INSERT INTO public.dua_line_texts VALUES (102, '2025-02-08 16:39:19.11593+00', NULL, 34, 'TL', '`ahdan wa `aqdan wa bay`atan lahu fi `unuqi');
INSERT INTO public.dua_line_texts VALUES (103, '2025-02-08 16:39:19.129479+00', NULL, 35, 'EN', 'and from which I neither convert nor change.');
INSERT INTO public.dua_line_texts VALUES (104, '2025-02-08 16:39:19.136507+00', NULL, 35, 'AR', 'لا احُولُ عَنْه وَلا ازُولُ ابَداً');
INSERT INTO public.dua_line_texts VALUES (105, '2025-02-08 16:39:19.142926+00', NULL, 35, 'TL', 'la ahulu `anhu wa la azulu abadan');
INSERT INTO public.dua_line_texts VALUES (106, '2025-02-08 16:39:19.156012+00', NULL, 36, 'EN', 'O Allah, (please do) make me of his supporters,');
INSERT INTO public.dua_line_texts VALUES (107, '2025-02-08 16:39:19.16253+00', NULL, 36, 'AR', 'اَللَّهُمَّ ٱجْعَلْنِي مِنْ انْصَارِهِ');
INSERT INTO public.dua_line_texts VALUES (108, '2025-02-08 16:39:19.168991+00', NULL, 36, 'TL', 'allahumma ij`alni min ansarihi');
INSERT INTO public.dua_line_texts VALUES (109, '2025-02-08 16:39:19.181945+00', NULL, 37, 'EN', 'sponsors, defenders,');
INSERT INTO public.dua_line_texts VALUES (110, '2025-02-08 16:39:19.188477+00', NULL, 37, 'AR', 'وَاعْوَانِهِ وَٱلذَّابِّينَ عَنْهُ');
INSERT INTO public.dua_line_texts VALUES (111, '2025-02-08 16:39:19.195022+00', NULL, 37, 'TL', 'wa a`wanihi waldhdhabbina `anhu');
INSERT INTO public.dua_line_texts VALUES (112, '2025-02-08 16:39:19.210798+00', NULL, 38, 'EN', 'and those who hurry in carrying out his instructions,');
INSERT INTO public.dua_line_texts VALUES (113, '2025-02-08 16:39:19.217756+00', NULL, 38, 'AR', 'وَٱلْمُسَارِعِينَ إِلَيْهِ فِي قَضَاءِ حَوَائِجِهِ');
INSERT INTO public.dua_line_texts VALUES (114, '2025-02-08 16:39:19.224601+00', NULL, 38, 'TL', 'walmusari`ina ilayhi fi qada''i hawa''ijihi');
INSERT INTO public.dua_line_texts VALUES (115, '2025-02-08 16:39:19.238158+00', NULL, 39, 'EN', 'those who comply with his orders,');
INSERT INTO public.dua_line_texts VALUES (116, '2025-02-08 16:39:19.245009+00', NULL, 39, 'AR', 'وَٱلْمُمْتَثِلِينَ لاِوَامِرِهِ');
INSERT INTO public.dua_line_texts VALUES (117, '2025-02-08 16:39:19.251722+00', NULL, 39, 'TL', 'walmumtathilina li''awamirihi');
INSERT INTO public.dua_line_texts VALUES (118, '2025-02-08 16:39:19.26522+00', NULL, 40, 'EN', 'those who uphold him,');
INSERT INTO public.dua_line_texts VALUES (119, '2025-02-08 16:39:19.271958+00', NULL, 40, 'AR', 'وَٱلْمُحَامِينَ عَنْهُ');
INSERT INTO public.dua_line_texts VALUES (120, '2025-02-08 16:39:19.27861+00', NULL, 40, 'TL', 'walmuhamina `anhu');
INSERT INTO public.dua_line_texts VALUES (121, '2025-02-08 16:39:19.292823+00', NULL, 41, 'EN', 'those who precede others to implementing his will,');
INSERT INTO public.dua_line_texts VALUES (122, '2025-02-08 16:39:19.299549+00', NULL, 41, 'AR', 'وَٱلسَّابِقِينَ إِلَىٰ إِرَادَتِهِ');
INSERT INTO public.dua_line_texts VALUES (123, '2025-02-08 16:39:19.30649+00', NULL, 41, 'TL', 'walssabiqina ila iradatihi');
INSERT INTO public.dua_line_texts VALUES (124, '2025-02-08 16:39:19.320518+00', NULL, 42, 'EN', 'and those who will be martyred before him.');
INSERT INTO public.dua_line_texts VALUES (125, '2025-02-08 16:39:19.327159+00', NULL, 42, 'AR', 'وَٱلْمُسْتَشْهَدِينَ بَيْنَ يَدَيْهِ');
INSERT INTO public.dua_line_texts VALUES (126, '2025-02-08 16:39:19.333882+00', NULL, 42, 'TL', 'walmustashhadina bayna yadayhi');
INSERT INTO public.dua_line_texts VALUES (127, '2025-02-08 16:39:19.347214+00', NULL, 43, 'EN', 'O Allah, if death that You have made inevitably and certainly incumbent upon Your servants stands between me and him,');
INSERT INTO public.dua_line_texts VALUES (128, '2025-02-08 16:39:19.354466+00', NULL, 43, 'AR', 'اَللَّهُمَّ إِنْ حَالَ بَيْنِي وَبَيْنَهُ ٱلْمَوْتُ ٱلَّذِي جَعَلْتَهُ عَلَىٰ عِبَادِكَ حَتْماً مَقْضِيّاً');
INSERT INTO public.dua_line_texts VALUES (129, '2025-02-08 16:39:19.361351+00', NULL, 43, 'TL', 'allahumma in hala bayni wa baynahu almawtu alladhi ja`altahu `ala `ibadika hatman maqdiyyan');
INSERT INTO public.dua_line_texts VALUES (130, '2025-02-08 16:39:19.375335+00', NULL, 44, 'EN', 'then (please do) take me out of my grave using my shroud as dress,');
INSERT INTO public.dua_line_texts VALUES (131, '2025-02-08 16:39:19.382092+00', NULL, 44, 'AR', 'فَاخْرِجْنِي مِنْ قَبْرِي مُؤْتَزِراً كَفَنِي');
INSERT INTO public.dua_line_texts VALUES (132, '2025-02-08 16:39:19.388732+00', NULL, 44, 'TL', 'fa''akhrijni min qabri mu''taziran kafani');
INSERT INTO public.dua_line_texts VALUES (133, '2025-02-08 16:39:19.403089+00', NULL, 45, 'EN', 'unsheathing my sword,');
INSERT INTO public.dua_line_texts VALUES (134, '2025-02-08 16:39:19.410281+00', NULL, 45, 'AR', 'شَاهِراً سَيْفِي');
INSERT INTO public.dua_line_texts VALUES (135, '2025-02-08 16:39:19.417274+00', NULL, 45, 'TL', 'sharihan sayfi');
INSERT INTO public.dua_line_texts VALUES (136, '2025-02-08 16:39:19.431048+00', NULL, 46, 'EN', 'holding my lance in my hand,');
INSERT INTO public.dua_line_texts VALUES (137, '2025-02-08 16:39:19.438074+00', NULL, 46, 'AR', 'مُجَرِّداً قَنَاتِي');
INSERT INTO public.dua_line_texts VALUES (138, '2025-02-08 16:39:19.445126+00', NULL, 46, 'TL', 'mujarridan qanati');
INSERT INTO public.dua_line_texts VALUES (139, '2025-02-08 16:39:19.45855+00', NULL, 47, 'EN', 'and responding to the call of the Caller who shall announce (his advent) in urban areas and deserts.');
INSERT INTO public.dua_line_texts VALUES (140, '2025-02-08 16:39:19.465051+00', NULL, 47, 'AR', 'مُلَبِّياً دَعْوَةَ ٱلدَّاعِي فِي ٱلْحَاضِرِ وَٱلْبَادِي');
INSERT INTO public.dua_line_texts VALUES (141, '2025-02-08 16:39:19.471859+00', NULL, 47, 'TL', 'mulabbiyan da`wata aldda`i filhadiri walbadi');
INSERT INTO public.dua_line_texts VALUES (142, '2025-02-08 16:39:19.486139+00', NULL, 48, 'EN', 'O Allah, (please do) show me his magnificent mien');
INSERT INTO public.dua_line_texts VALUES (143, '2025-02-08 16:39:19.493374+00', NULL, 48, 'AR', 'اَللَّهُمَّ ارِنِي ٱلطَّلْعَةَ ٱلرَّشِيدَةَ');
INSERT INTO public.dua_line_texts VALUES (144, '2025-02-08 16:39:19.500165+00', NULL, 48, 'TL', 'allahumma arini alttal`ata alrrashidata');
INSERT INTO public.dua_line_texts VALUES (145, '2025-02-08 16:39:19.513782+00', NULL, 49, 'EN', 'and his praiseworthy forehead,');
INSERT INTO public.dua_line_texts VALUES (146, '2025-02-08 16:39:19.521637+00', NULL, 49, 'AR', 'وَٱلْغُرَّةَ ٱلْحَمِيدَةَ');
INSERT INTO public.dua_line_texts VALUES (147, '2025-02-08 16:39:19.528418+00', NULL, 49, 'TL', 'walghurrata alhamidata');
INSERT INTO public.dua_line_texts VALUES (148, '2025-02-08 16:39:19.541937+00', NULL, 50, 'EN', 'delight my eyes by letting me have a look at him.');
INSERT INTO public.dua_line_texts VALUES (149, '2025-02-08 16:39:19.548711+00', NULL, 50, 'AR', 'وَٱكْحُلْ نَاظِرِي بِنَظْرَةٍ مِنِّي إِلَيْهِ');
INSERT INTO public.dua_line_texts VALUES (150, '2025-02-08 16:39:19.555469+00', NULL, 50, 'TL', 'wakhul naziri binazratin minni ilayhi');
INSERT INTO public.dua_line_texts VALUES (151, '2025-02-08 16:39:19.568885+00', NULL, 51, 'EN', 'And (please) expedite his relief,');
INSERT INTO public.dua_line_texts VALUES (152, '2025-02-08 16:39:19.575765+00', NULL, 51, 'AR', 'وَعَجِّلْ فَرَجَهُ');
INSERT INTO public.dua_line_texts VALUES (153, '2025-02-08 16:39:19.582784+00', NULL, 51, 'TL', 'wa `ajjil farajahu');
INSERT INTO public.dua_line_texts VALUES (154, '2025-02-08 16:39:19.597003+00', NULL, 52, 'EN', 'make his reappearance easy,');
INSERT INTO public.dua_line_texts VALUES (155, '2025-02-08 16:39:19.604122+00', NULL, 52, 'AR', 'وَسَهِّلْ مَخْرَجَهُ');
INSERT INTO public.dua_line_texts VALUES (156, '2025-02-08 16:39:19.611366+00', NULL, 52, 'TL', 'wa sahhil makhrajahu');
INSERT INTO public.dua_line_texts VALUES (157, '2025-02-08 16:39:19.624856+00', NULL, 53, 'EN', 'clear a spacious space for him,');
INSERT INTO public.dua_line_texts VALUES (158, '2025-02-08 16:39:19.631533+00', NULL, 53, 'AR', 'وَاوْسِعْ مَنْهَجَهُ');
INSERT INTO public.dua_line_texts VALUES (159, '2025-02-08 16:39:19.63842+00', NULL, 53, 'TL', 'wa awsi` manhajahu');
INSERT INTO public.dua_line_texts VALUES (160, '2025-02-08 16:39:19.652693+00', NULL, 54, 'EN', 'guide me to follow his course,');
INSERT INTO public.dua_line_texts VALUES (161, '2025-02-08 16:39:19.659772+00', NULL, 54, 'AR', 'وَٱسْلُكْ بِي مَحَجَّتَهُ');
INSERT INTO public.dua_line_texts VALUES (162, '2025-02-08 16:39:19.66659+00', NULL, 54, 'TL', 'wasluk bi muhajjatahu');
INSERT INTO public.dua_line_texts VALUES (163, '2025-02-08 16:39:19.680714+00', NULL, 55, 'EN', 'give success to his issues,');
INSERT INTO public.dua_line_texts VALUES (164, '2025-02-08 16:39:19.687785+00', NULL, 55, 'AR', 'وَانْفِذْ امْرَهُ');
INSERT INTO public.dua_line_texts VALUES (165, '2025-02-08 16:39:19.694755+00', NULL, 55, 'TL', 'wa anfidh amrahu');
INSERT INTO public.dua_line_texts VALUES (166, '2025-02-08 16:39:19.708804+00', NULL, 56, 'EN', 'and confirm his strength.');
INSERT INTO public.dua_line_texts VALUES (167, '2025-02-08 16:39:19.715911+00', NULL, 56, 'AR', 'وَٱشْدُدْ ازْرَهُ');
INSERT INTO public.dua_line_texts VALUES (168, '2025-02-08 16:39:19.722928+00', NULL, 56, 'TL', 'washdud azrahu');
INSERT INTO public.dua_line_texts VALUES (169, '2025-02-08 16:39:19.737036+00', NULL, 57, 'EN', 'O Allah, construct Your lands through him');
INSERT INTO public.dua_line_texts VALUES (170, '2025-02-08 16:39:19.743984+00', NULL, 57, 'AR', 'وَٱعْمُرِ ٱللَّهُمَّ بِهِ بِلادَكَ');
INSERT INTO public.dua_line_texts VALUES (171, '2025-02-08 16:39:19.750999+00', NULL, 57, 'TL', 'wa`mur allahumma bihi biladaka');
INSERT INTO public.dua_line_texts VALUES (172, '2025-02-08 16:39:19.764837+00', NULL, 58, 'EN', 'and refresh Your servants through him,');
INSERT INTO public.dua_line_texts VALUES (173, '2025-02-08 16:39:19.771621+00', NULL, 58, 'AR', 'وَاحْيِ بِهِ عِبَادَكَ');
INSERT INTO public.dua_line_texts VALUES (174, '2025-02-08 16:39:19.778543+00', NULL, 58, 'TL', 'wa ahyi bihi `ibadaka');
INSERT INTO public.dua_line_texts VALUES (175, '2025-02-08 16:39:19.796934+00', NULL, 59, 'EN', 'For You have said, and true are Your words:');
INSERT INTO public.dua_line_texts VALUES (176, '2025-02-08 16:39:19.803821+00', NULL, 59, 'AR', 'فَإِنَّكَ قُلْتَ وَقَوْلُكَ ٱلْحَقُّ:');
INSERT INTO public.dua_line_texts VALUES (177, '2025-02-08 16:39:19.810733+00', NULL, 59, 'TL', 'fa''innaka qulta wa qawluka alhaqqu');
INSERT INTO public.dua_line_texts VALUES (178, '2025-02-08 16:39:19.824328+00', NULL, 60, 'EN', '“Corruption has appeared in the land and the sea');
INSERT INTO public.dua_line_texts VALUES (179, '2025-02-08 16:39:19.83101+00', NULL, 60, 'AR', '«ظَهَرَ ٱلْفَسَادُ فِي ٱلْبَرِّ وَٱلْبَحْرِ');
INSERT INTO public.dua_line_texts VALUES (180, '2025-02-08 16:39:19.837639+00', NULL, 60, 'TL', 'zahara alfasadu filbarri walbahri');
INSERT INTO public.dua_line_texts VALUES (181, '2025-02-08 16:39:19.850423+00', NULL, 61, 'EN', 'on account of what the hands of men have wrought.”');
INSERT INTO public.dua_line_texts VALUES (182, '2025-02-08 16:39:19.857035+00', NULL, 61, 'AR', 'بِمَا كَسَبَتْ ايْدِي ٱلنَّاسِ.»');
INSERT INTO public.dua_line_texts VALUES (183, '2025-02-08 16:39:19.863426+00', NULL, 61, 'TL', 'bima kasabat aydi alnnasi');
INSERT INTO public.dua_line_texts VALUES (184, '2025-02-08 16:39:19.878012+00', NULL, 62, 'EN', 'So, O Allah, (please) show us Your vicegerent,');
INSERT INTO public.dua_line_texts VALUES (185, '2025-02-08 16:39:19.885241+00', NULL, 62, 'AR', 'فَاظْهِرِ ٱللَّهُمَّ لَنَا وَلِيَّكَ');
INSERT INTO public.dua_line_texts VALUES (186, '2025-02-08 16:39:19.89213+00', NULL, 62, 'TL', 'fa''azhir allahumma lana waliyyaka');
INSERT INTO public.dua_line_texts VALUES (187, '2025-02-08 16:39:19.905926+00', NULL, 63, 'EN', 'the son of Your Prophet,');
INSERT INTO public.dua_line_texts VALUES (188, '2025-02-08 16:39:19.91298+00', NULL, 63, 'AR', 'وَٱبْنَ بِنْتِ نَبِيِّكَ');
INSERT INTO public.dua_line_texts VALUES (189, '2025-02-08 16:39:19.920124+00', NULL, 63, 'TL', 'wabna binti nabiyyika');
INSERT INTO public.dua_line_texts VALUES (190, '2025-02-08 16:39:19.934037+00', NULL, 64, 'EN', 'and the namesake of Your Messenger,');
INSERT INTO public.dua_line_texts VALUES (191, '2025-02-08 16:39:19.940848+00', NULL, 64, 'AR', 'ٱلْمُسَمَّىٰ بِٱسْمِ رَسُولِكَ');
INSERT INTO public.dua_line_texts VALUES (192, '2025-02-08 16:39:19.94777+00', NULL, 64, 'TL', 'almusamma bismi rasulika');
INSERT INTO public.dua_line_texts VALUES (193, '2025-02-08 16:39:19.962234+00', NULL, 65, 'EN', 'peace be upon him and his Household,');
INSERT INTO public.dua_line_texts VALUES (194, '2025-02-08 16:39:19.969321+00', NULL, 65, 'AR', 'صَلَّىٰ ٱللَّهُ عَلَيْهِ وَآلِهِ');
INSERT INTO public.dua_line_texts VALUES (195, '2025-02-08 16:39:19.976523+00', NULL, 65, 'TL', 'salla allahu `alayhi wa alihi');
INSERT INTO public.dua_line_texts VALUES (196, '2025-02-08 16:39:19.991347+00', NULL, 66, 'EN', 'so that he shall tear up any wrong item that he will face');
INSERT INTO public.dua_line_texts VALUES (197, '2025-02-08 16:39:19.998366+00', NULL, 66, 'AR', 'حَتَّىٰ لا يَظْفَرَ بِشَيْءٍ مِنَ ٱلْبَاطِلِ إِلاَّ مَزَّقَهُ');
INSERT INTO public.dua_line_texts VALUES (198, '2025-02-08 16:39:20.005547+00', NULL, 66, 'TL', 'hatta la yazfara bishay''in min albatili illa mazzaqahu');
INSERT INTO public.dua_line_texts VALUES (199, '2025-02-08 16:39:20.019956+00', NULL, 67, 'EN', 'and shall confirm and approve of the truth.');
INSERT INTO public.dua_line_texts VALUES (200, '2025-02-08 16:39:20.026887+00', NULL, 67, 'AR', 'وَيُحِقُّ ٱلْحَقَّ وَيُحَقِّقَهُ');
INSERT INTO public.dua_line_texts VALUES (201, '2025-02-08 16:39:20.033643+00', NULL, 67, 'TL', 'wa yahiqqa alhaqqa wa yuhaqqiqahu');
INSERT INTO public.dua_line_texts VALUES (202, '2025-02-08 16:39:20.048218+00', NULL, 68, 'EN', 'O Allah, (please) make him the shelter to whom Your wronged servants shall resort,');
INSERT INTO public.dua_line_texts VALUES (203, '2025-02-08 16:39:20.055677+00', NULL, 68, 'AR', 'وَٱجْعَلْهُ ٱللَّهُمَّ مَفْزَعاً لِمَظْلُومِ عِبَادِكَ');
INSERT INTO public.dua_line_texts VALUES (204, '2025-02-08 16:39:20.063954+00', NULL, 68, 'TL', 'waj`alhu allahumma mafza`an limazlumi `ibadika');
INSERT INTO public.dua_line_texts VALUES (205, '2025-02-08 16:39:20.078099+00', NULL, 69, 'EN', 'the supporter of those who cannot find any supporter save You,');
INSERT INTO public.dua_line_texts VALUES (206, '2025-02-08 16:39:20.085034+00', NULL, 69, 'AR', 'وَنَاصِراً لِمَنْ لا يَجِدُ لَهُ نَاصِراً غَيْرَكَ');
INSERT INTO public.dua_line_texts VALUES (207, '2025-02-08 16:39:20.092361+00', NULL, 69, 'TL', 'wa nasiran liman la yajidu lahu nasiran ghayraka');
INSERT INTO public.dua_line_texts VALUES (208, '2025-02-08 16:39:20.106428+00', NULL, 70, 'EN', 'the reviver of the laws of Your Book that have been suspended,');
INSERT INTO public.dua_line_texts VALUES (209, '2025-02-08 16:39:20.113625+00', NULL, 70, 'AR', 'وَمُجَدِّداً لِمَا عُطِّلَ مِنْ احْكَامِ كِتَابِكَ');
INSERT INTO public.dua_line_texts VALUES (210, '2025-02-08 16:39:20.120516+00', NULL, 70, 'TL', 'wa mujaddidan lima `uttila min ahkami kitabika');
INSERT INTO public.dua_line_texts VALUES (211, '2025-02-08 16:39:20.13411+00', NULL, 71, 'EN', 'and the constructor of all signs of Your religion and instructions of Your Messenger,');
INSERT INTO public.dua_line_texts VALUES (212, '2025-02-08 16:39:20.140632+00', NULL, 71, 'AR', 'وَمُشَيِّداً لِمَا وَرَدَ مِنْ اعْلامِ دِينِكَ وَسُنَنِ نَبِيِّكَ');
INSERT INTO public.dua_line_texts VALUES (213, '2025-02-08 16:39:20.147068+00', NULL, 71, 'TL', 'wa mushayyidan lima warada min a`lami dinika wa sunani nabiyyika');
INSERT INTO public.dua_line_texts VALUES (214, '2025-02-08 16:39:20.160272+00', NULL, 72, 'EN', 'peace be upon him and his Household, that he will see.');
INSERT INTO public.dua_line_texts VALUES (215, '2025-02-08 16:39:20.167234+00', NULL, 72, 'AR', 'صَلَّىٰ ٱللَّهُ عَلَيْهِ وآلِهِ');
INSERT INTO public.dua_line_texts VALUES (216, '2025-02-08 16:39:20.173882+00', NULL, 72, 'TL', 'salla allahu `alayhi wa alihi');
INSERT INTO public.dua_line_texts VALUES (217, '2025-02-08 16:39:20.187655+00', NULL, 73, 'EN', 'O Allah, (please) include him with those whom You protect from the domination of the aggressors.');
INSERT INTO public.dua_line_texts VALUES (218, '2025-02-08 16:39:20.195478+00', NULL, 73, 'AR', 'وَٱجْعَلْهُ ٱللَّهُمَّ مِمَّنْ حَصَّنْتَهُ مِنْ بَاسِ ٱلْمُعْتَدِينَ');
INSERT INTO public.dua_line_texts VALUES (219, '2025-02-08 16:39:20.202655+00', NULL, 73, 'TL', 'waj`alhu allahumma mimman hassantahu min ba''si almu`tadina');
INSERT INTO public.dua_line_texts VALUES (220, '2025-02-08 16:39:20.216895+00', NULL, 74, 'EN', 'O Allah, (please) delight Your Prophet Muhammad,');
INSERT INTO public.dua_line_texts VALUES (221, '2025-02-08 16:39:20.224775+00', NULL, 74, 'AR', 'اَللَّهُمَّ وَسُرَّ نَبِيَّكَ مُحَمَّداً');
INSERT INTO public.dua_line_texts VALUES (222, '2025-02-08 16:39:20.231884+00', NULL, 74, 'TL', 'allahumma wa surra nabiyyaka muhammadan');
INSERT INTO public.dua_line_texts VALUES (223, '2025-02-08 16:39:20.246016+00', NULL, 75, 'EN', 'peace be upon him and his Household,');
INSERT INTO public.dua_line_texts VALUES (224, '2025-02-08 16:39:20.252533+00', NULL, 75, 'AR', 'صَلَّىٰ ٱللَّهُ عَلَيْهِ وآلِهِ');
INSERT INTO public.dua_line_texts VALUES (225, '2025-02-08 16:39:20.259634+00', NULL, 75, 'TL', 'salla allahu `alayhi wa alihi');
INSERT INTO public.dua_line_texts VALUES (226, '2025-02-08 16:39:20.273633+00', NULL, 76, 'EN', 'as well as all those who followed him in his promulgation by making (us) see him,');
INSERT INTO public.dua_line_texts VALUES (227, '2025-02-08 16:39:20.280813+00', NULL, 76, 'AR', 'بِرُؤْيَتِهِ وَمَنْ تَبِعَهُ عَلَىٰ دَعْوَتِهِ');
INSERT INTO public.dua_line_texts VALUES (228, '2025-02-08 16:39:20.288003+00', NULL, 76, 'TL', 'biru''yatihi wa man tabi`ahu `ala da`watihi');
INSERT INTO public.dua_line_texts VALUES (229, '2025-02-08 16:39:20.302026+00', NULL, 77, 'EN', 'and (please) have mercy upon our humiliation after him.');
INSERT INTO public.dua_line_texts VALUES (230, '2025-02-08 16:39:20.308952+00', NULL, 77, 'AR', 'وَٱرْحَمِ ٱسْتِكَانَتَنَا بَعْدَهُ');
INSERT INTO public.dua_line_texts VALUES (231, '2025-02-08 16:39:20.316114+00', NULL, 77, 'TL', 'warham istikanatana ba`dahu');
INSERT INTO public.dua_line_texts VALUES (232, '2025-02-08 16:39:20.329669+00', NULL, 78, 'EN', 'O Allah, (please) relieve this community from the (current) grief through presenting him');
INSERT INTO public.dua_line_texts VALUES (233, '2025-02-08 16:39:20.336229+00', NULL, 78, 'AR', 'اَللَّهُمَّ ٱكْشِفْ هٰذِهِ ٱلْغُمَّةَ عَنْ هٰذِهِ ٱلامَّةِ بِحُضُورِهِ');
INSERT INTO public.dua_line_texts VALUES (234, '2025-02-08 16:39:20.343011+00', NULL, 78, 'TL', 'allahumma ikshif hadhihi alghummata `an hadhihi al-ummati bihudurihi');
INSERT INTO public.dua_line_texts VALUES (235, '2025-02-08 16:39:20.356221+00', NULL, 79, 'EN', 'and expedite his advent for us:');
INSERT INTO public.dua_line_texts VALUES (236, '2025-02-08 16:39:20.362829+00', NULL, 79, 'AR', 'وَعَجِّلْ لَنَا ظُهُورَهُ');
INSERT INTO public.dua_line_texts VALUES (237, '2025-02-08 16:39:20.369825+00', NULL, 79, 'TL', 'wa `ajjil lana zuhurahu');
INSERT INTO public.dua_line_texts VALUES (238, '2025-02-08 16:39:20.383887+00', NULL, 80, 'EN', '“Surely, they think it to be far off, and We see it nigh.”');
INSERT INTO public.dua_line_texts VALUES (239, '2025-02-08 16:39:20.39115+00', NULL, 80, 'AR', '«إِنَّهُمْ يَرَوْنَهُ بَعِيداً وَنَرَاهُ قَرِيباً.»');
INSERT INTO public.dua_line_texts VALUES (240, '2025-02-08 16:39:20.398602+00', NULL, 80, 'TL', 'innahum yarawnahu ba`idan wa narahu qariban');
INSERT INTO public.dua_line_texts VALUES (241, '2025-02-08 16:39:20.41257+00', NULL, 81, 'EN', '[do all that] In the name of Your mercy; O most merciful of all those who show mercy.');
INSERT INTO public.dua_line_texts VALUES (242, '2025-02-08 16:39:20.419562+00', NULL, 81, 'AR', 'بِرَحْمَتِكَ يَا ارْحَمَ ٱلرَّاحِمِينَ');
INSERT INTO public.dua_line_texts VALUES (243, '2025-02-08 16:39:20.426615+00', NULL, 81, 'TL', 'birahmatika ya arhama alrrahimina');
INSERT INTO public.dua_line_texts VALUES (244, '2025-02-08 16:39:20.440433+00', NULL, 82, 'EN', 'You may then slap your right thigh with your hand three times and, at each time, say the following words:');
INSERT INTO public.dua_line_texts VALUES (245, '2025-02-08 16:39:20.447007+00', NULL, 82, 'AR', NULL);
INSERT INTO public.dua_line_texts VALUES (246, '2025-02-08 16:39:20.453645+00', NULL, 82, 'TL', NULL);
INSERT INTO public.dua_line_texts VALUES (247, '2025-02-08 16:39:20.46748+00', NULL, 83, 'EN', '(We pray for Your) earliest advent, earliest advent, O Patron of the Age.');
INSERT INTO public.dua_line_texts VALUES (248, '2025-02-08 16:39:20.474216+00', NULL, 83, 'AR', 'الْعَجَلَ ٱلْعَجَلَ يَامَوْلايَ يَا صَاحِبَ ٱلزَّمَانِ');
INSERT INTO public.dua_line_texts VALUES (249, '2025-02-08 16:39:20.480788+00', NULL, 83, 'TL', 'al`ajala al`ajala ya mawlaya ya sahiba alzzamani');


--
-- TOC entry 3853 (class 0 OID 17416)
-- Dependencies: 300
-- Data for Name: reciters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reciters VALUES (1, '2025-02-08 16:39:29.349255+00', NULL, 'Ali Fani', '??? ????', 'http://127.0.0.1:54321/storage/v1/object/public/reciters/Ali-Fani.jpg?');
INSERT INTO public.reciters VALUES (2, '2025-02-08 16:39:31.251916+00', NULL, 'Hussein Ghareeb', 'حسين غريب', 'http://127.0.0.1:54321/storage/v1/object/public/reciters/Hussein-Ghareeb.jpg?');
INSERT INTO public.reciters VALUES (3, '2025-02-08 16:39:33.245803+00', NULL, 'AbdulHai Qambar', 'عبد الحي قمبر', 'http://127.0.0.1:54321/storage/v1/object/public/reciters/AbdulHai-Qambar.jpg?');


--
-- TOC entry 3846 (class 0 OID 17389)
-- Dependencies: 293
-- Data for Name: dua_recitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dua_recitations VALUES (1, '2025-02-08 16:39:29.816372+00', NULL, 2, 1, 516120, 'http://127.0.0.1:54321/storage/v1/object/public/recitations/dua-aahad_Ali-Fani_64.mp3?', 'http://127.0.0.1:54321/storage/v1/object/public/recitations/dua-aahad_Ali-Fani_128.mp3?', 508051);
INSERT INTO public.dua_recitations VALUES (2, '2025-02-08 16:39:31.792216+00', NULL, 2, 2, 439176, 'http://127.0.0.1:54321/storage/v1/object/public/recitations/dua-aahad_Hussein-Ghareeb_64.mp3?', 'http://127.0.0.1:54321/storage/v1/object/public/recitations/dua-aahad_Hussein-Ghareeb_128.mp3?', 416556);
INSERT INTO public.dua_recitations VALUES (3, '2025-02-08 16:39:33.834873+00', NULL, 2, 3, 521400, 'http://127.0.0.1:54321/storage/v1/object/public/recitations/dua-aahad_AbdulHai-Qambar_64.mp3?', 'http://127.0.0.1:54321/storage/v1/object/public/recitations/dua-aahad_AbdulHai-Qambar_128.mp3?', 509606);


--
-- TOC entry 3844 (class 0 OID 17384)
-- Dependencies: 291
-- Data for Name: dua_lines_has_recitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dua_lines_has_recitations VALUES (1, '2025-02-08 16:39:29.833412+00', NULL, 1, 1, 0);
INSERT INTO public.dua_lines_has_recitations VALUES (2, '2025-02-08 16:39:29.850959+00', NULL, 2, 1, 4455);
INSERT INTO public.dua_lines_has_recitations VALUES (3, '2025-02-08 16:39:29.865877+00', NULL, 3, 1, 4705);
INSERT INTO public.dua_lines_has_recitations VALUES (4, '2025-02-08 16:39:29.880662+00', NULL, 4, 1, 11167);
INSERT INTO public.dua_lines_has_recitations VALUES (5, '2025-02-08 16:39:29.896362+00', NULL, 5, 1, 15425);
INSERT INTO public.dua_lines_has_recitations VALUES (6, '2025-02-08 16:39:29.911905+00', NULL, 6, 1, 19932);
INSERT INTO public.dua_lines_has_recitations VALUES (7, '2025-02-08 16:39:29.927866+00', NULL, 7, 1, 27462);
INSERT INTO public.dua_lines_has_recitations VALUES (8, '2025-02-08 16:39:29.944121+00', NULL, 8, 1, 33226);
INSERT INTO public.dua_lines_has_recitations VALUES (9, '2025-02-08 16:39:29.959225+00', NULL, 9, 1, 37983);
INSERT INTO public.dua_lines_has_recitations VALUES (10, '2025-02-08 16:39:29.974798+00', NULL, 10, 1, 43243);
INSERT INTO public.dua_lines_has_recitations VALUES (11, '2025-02-08 16:39:29.992874+00', NULL, 11, 1, 49520);
INSERT INTO public.dua_lines_has_recitations VALUES (12, '2025-02-08 16:39:30.007227+00', NULL, 12, 1, 58042);
INSERT INTO public.dua_lines_has_recitations VALUES (13, '2025-02-08 16:39:30.022914+00', NULL, 13, 1, 62799);
INSERT INTO public.dua_lines_has_recitations VALUES (14, '2025-02-08 16:39:30.037825+00', NULL, 14, 1, 67065);
INSERT INTO public.dua_lines_has_recitations VALUES (15, '2025-02-08 16:39:30.053076+00', NULL, 15, 1, 72576);
INSERT INTO public.dua_lines_has_recitations VALUES (16, '2025-02-08 16:39:30.068011+00', NULL, 16, 1, 82594);
INSERT INTO public.dua_lines_has_recitations VALUES (17, '2025-02-08 16:39:30.083042+00', NULL, 17, 1, 91866);
INSERT INTO public.dua_lines_has_recitations VALUES (18, '2025-02-08 16:39:30.098043+00', NULL, 18, 1, 98125);
INSERT INTO public.dua_lines_has_recitations VALUES (19, '2025-02-08 16:39:30.113294+00', NULL, 19, 1, 103133);
INSERT INTO public.dua_lines_has_recitations VALUES (20, '2025-02-08 16:39:30.12803+00', NULL, 20, 1, 109403);
INSERT INTO public.dua_lines_has_recitations VALUES (21, '2025-02-08 16:39:30.143072+00', NULL, 21, 1, 117167);
INSERT INTO public.dua_lines_has_recitations VALUES (22, '2025-02-08 16:39:30.159392+00', NULL, 22, 1, 124681);
INSERT INTO public.dua_lines_has_recitations VALUES (23, '2025-02-08 16:39:30.175106+00', NULL, 23, 1, 143715);
INSERT INTO public.dua_lines_has_recitations VALUES (24, '2025-02-08 16:39:30.191532+00', NULL, 24, 1, 152728);
INSERT INTO public.dua_lines_has_recitations VALUES (25, '2025-02-08 16:39:30.21102+00', NULL, 25, 1, 159257);
INSERT INTO public.dua_lines_has_recitations VALUES (26, '2025-02-08 16:39:30.226994+00', NULL, 26, 1, 166272);
INSERT INTO public.dua_lines_has_recitations VALUES (27, '2025-02-08 16:39:30.243247+00', NULL, 27, 1, 169531);
INSERT INTO public.dua_lines_has_recitations VALUES (28, '2025-02-08 16:39:30.259163+00', NULL, 28, 1, 173038);
INSERT INTO public.dua_lines_has_recitations VALUES (29, '2025-02-08 16:39:30.275865+00', NULL, 29, 1, 177296);
INSERT INTO public.dua_lines_has_recitations VALUES (30, '2025-02-08 16:39:30.291978+00', NULL, 30, 1, 182057);
INSERT INTO public.dua_lines_has_recitations VALUES (31, '2025-02-08 16:39:30.307932+00', NULL, 31, 1, 186314);
INSERT INTO public.dua_lines_has_recitations VALUES (32, '2025-02-08 16:39:30.323133+00', NULL, 32, 1, 194841);
INSERT INTO public.dua_lines_has_recitations VALUES (33, '2025-02-08 16:39:30.338635+00', NULL, 33, 1, 202804);
INSERT INTO public.dua_lines_has_recitations VALUES (34, '2025-02-08 16:39:30.354496+00', NULL, 34, 1, 207064);
INSERT INTO public.dua_lines_has_recitations VALUES (35, '2025-02-08 16:39:30.370382+00', NULL, 35, 1, 213074);
INSERT INTO public.dua_lines_has_recitations VALUES (36, '2025-02-08 16:39:30.386761+00', NULL, 36, 1, 218586);
INSERT INTO public.dua_lines_has_recitations VALUES (37, '2025-02-08 16:39:30.402657+00', NULL, 37, 1, 224109);
INSERT INTO public.dua_lines_has_recitations VALUES (38, '2025-02-08 16:39:30.418063+00', NULL, 38, 1, 229866);
INSERT INTO public.dua_lines_has_recitations VALUES (39, '2025-02-08 16:39:30.433818+00', NULL, 39, 1, 237131);
INSERT INTO public.dua_lines_has_recitations VALUES (40, '2025-02-08 16:39:30.451779+00', NULL, 40, 1, 241889);
INSERT INTO public.dua_lines_has_recitations VALUES (41, '2025-02-08 16:39:30.467138+00', NULL, 41, 1, 245395);
INSERT INTO public.dua_lines_has_recitations VALUES (42, '2025-02-08 16:39:30.482949+00', NULL, 42, 1, 248902);
INSERT INTO public.dua_lines_has_recitations VALUES (43, '2025-02-08 16:39:30.498361+00', NULL, 43, 1, 255167);
INSERT INTO public.dua_lines_has_recitations VALUES (44, '2025-02-08 16:39:30.515054+00', NULL, 44, 1, 268445);
INSERT INTO public.dua_lines_has_recitations VALUES (45, '2025-02-08 16:39:30.531753+00', NULL, 45, 1, 274978);
INSERT INTO public.dua_lines_has_recitations VALUES (46, '2025-02-08 16:39:30.548312+00', NULL, 46, 1, 278482);
INSERT INTO public.dua_lines_has_recitations VALUES (47, '2025-02-08 16:39:30.564562+00', NULL, 47, 1, 281738);
INSERT INTO public.dua_lines_has_recitations VALUES (48, '2025-02-08 16:39:30.579814+00', NULL, 48, 1, 291006);
INSERT INTO public.dua_lines_has_recitations VALUES (49, '2025-02-08 16:39:30.596864+00', NULL, 49, 1, 297771);
INSERT INTO public.dua_lines_has_recitations VALUES (50, '2025-02-08 16:39:30.612781+00', NULL, 50, 1, 301777);
INSERT INTO public.dua_lines_has_recitations VALUES (51, '2025-02-08 16:39:30.628437+00', NULL, 51, 1, 307287);
INSERT INTO public.dua_lines_has_recitations VALUES (52, '2025-02-08 16:39:30.644409+00', NULL, 52, 1, 310294);
INSERT INTO public.dua_lines_has_recitations VALUES (53, '2025-02-08 16:39:30.661052+00', NULL, 53, 1, 314303);
INSERT INTO public.dua_lines_has_recitations VALUES (54, '2025-02-08 16:39:30.677408+00', NULL, 54, 1, 318311);
INSERT INTO public.dua_lines_has_recitations VALUES (55, '2025-02-08 16:39:30.693955+00', NULL, 55, 1, 322318);
INSERT INTO public.dua_lines_has_recitations VALUES (56, '2025-02-08 16:39:30.709719+00', NULL, 56, 1, 325825);
INSERT INTO public.dua_lines_has_recitations VALUES (57, '2025-02-08 16:39:30.725265+00', NULL, 57, 1, 329331);
INSERT INTO public.dua_lines_has_recitations VALUES (58, '2025-02-08 16:39:30.742537+00', NULL, 58, 1, 333085);
INSERT INTO public.dua_lines_has_recitations VALUES (59, '2025-02-08 16:39:30.758367+00', NULL, 59, 1, 336840);
INSERT INTO public.dua_lines_has_recitations VALUES (60, '2025-02-08 16:39:30.774947+00', NULL, 60, 1, 342100);
INSERT INTO public.dua_lines_has_recitations VALUES (61, '2025-02-08 16:39:30.791192+00', NULL, 61, 1, 346106);
INSERT INTO public.dua_lines_has_recitations VALUES (62, '2025-02-08 16:39:30.806841+00', NULL, 62, 1, 349330);
INSERT INTO public.dua_lines_has_recitations VALUES (63, '2025-02-08 16:39:30.82246+00', NULL, 63, 1, 354340);
INSERT INTO public.dua_lines_has_recitations VALUES (64, '2025-02-08 16:39:30.838216+00', NULL, 64, 1, 357344);
INSERT INTO public.dua_lines_has_recitations VALUES (65, '2025-02-08 16:39:30.853968+00', NULL, 65, 1, 361302);
INSERT INTO public.dua_lines_has_recitations VALUES (66, '2025-02-08 16:39:30.870085+00', NULL, 66, 1, 361552);
INSERT INTO public.dua_lines_has_recitations VALUES (67, '2025-02-08 16:39:30.886359+00', NULL, 67, 1, 368815);
INSERT INTO public.dua_lines_has_recitations VALUES (68, '2025-02-08 16:39:30.902921+00', NULL, 68, 1, 373331);
INSERT INTO public.dua_lines_has_recitations VALUES (69, '2025-02-08 16:39:30.918952+00', NULL, 69, 1, 380094);
INSERT INTO public.dua_lines_has_recitations VALUES (70, '2025-02-08 16:39:30.934932+00', NULL, 70, 1, 386604);
INSERT INTO public.dua_lines_has_recitations VALUES (71, '2025-02-08 16:39:30.951056+00', NULL, 71, 1, 392878);
INSERT INTO public.dua_lines_has_recitations VALUES (72, '2025-02-08 16:39:30.967828+00', NULL, 72, 1, 401396);
INSERT INTO public.dua_lines_has_recitations VALUES (73, '2025-02-08 16:39:30.983681+00', NULL, 73, 1, 406403);
INSERT INTO public.dua_lines_has_recitations VALUES (74, '2025-02-08 16:39:30.999234+00', NULL, 74, 1, 414922);
INSERT INTO public.dua_lines_has_recitations VALUES (75, '2025-02-08 16:39:31.015616+00', NULL, 75, 1, 424942);
INSERT INTO public.dua_lines_has_recitations VALUES (76, '2025-02-08 16:39:31.03274+00', NULL, 76, 1, 429950);
INSERT INTO public.dua_lines_has_recitations VALUES (77, '2025-02-08 16:39:31.049796+00', NULL, 77, 1, 438217);
INSERT INTO public.dua_lines_has_recitations VALUES (78, '2025-02-08 16:39:31.066086+00', NULL, 78, 1, 443476);
INSERT INTO public.dua_lines_has_recitations VALUES (79, '2025-02-08 16:39:31.081587+00', NULL, 79, 1, 451992);
INSERT INTO public.dua_lines_has_recitations VALUES (80, '2025-02-08 16:39:31.097469+00', NULL, 80, 1, 456751);
INSERT INTO public.dua_lines_has_recitations VALUES (81, '2025-02-08 16:39:31.114455+00', NULL, 81, 1, 464527);
INSERT INTO public.dua_lines_has_recitations VALUES (82, '2025-02-08 16:39:31.132041+00', NULL, 82, 1, 471039);
INSERT INTO public.dua_lines_has_recitations VALUES (83, '2025-02-08 16:39:31.151618+00', NULL, 83, 1, 473740);
INSERT INTO public.dua_lines_has_recitations VALUES (84, '2025-02-08 16:39:31.81165+00', NULL, 1, 2, 0);
INSERT INTO public.dua_lines_has_recitations VALUES (85, '2025-02-08 16:39:31.828925+00', NULL, 2, 2, 4870);
INSERT INTO public.dua_lines_has_recitations VALUES (86, '2025-02-08 16:39:31.846063+00', NULL, 3, 2, 12623);
INSERT INTO public.dua_lines_has_recitations VALUES (87, '2025-02-08 16:39:31.862964+00', NULL, 4, 2, 19471);
INSERT INTO public.dua_lines_has_recitations VALUES (88, '2025-02-08 16:39:31.879765+00', NULL, 5, 2, 23755);
INSERT INTO public.dua_lines_has_recitations VALUES (89, '2025-02-08 16:39:31.896193+00', NULL, 6, 2, 26455);
INSERT INTO public.dua_lines_has_recitations VALUES (90, '2025-02-08 16:39:31.912772+00', NULL, 7, 2, 33046);
INSERT INTO public.dua_lines_has_recitations VALUES (91, '2025-02-08 16:39:31.929379+00', NULL, 8, 2, 37756);
INSERT INTO public.dua_lines_has_recitations VALUES (92, '2025-02-08 16:39:31.947167+00', NULL, 9, 2, 40984);
INSERT INTO public.dua_lines_has_recitations VALUES (93, '2025-02-08 16:39:31.96451+00', NULL, 10, 2, 45723);
INSERT INTO public.dua_lines_has_recitations VALUES (94, '2025-02-08 16:39:31.981244+00', NULL, 11, 2, 49714);
INSERT INTO public.dua_lines_has_recitations VALUES (95, '2025-02-08 16:39:31.998107+00', NULL, 12, 2, 57550);
INSERT INTO public.dua_lines_has_recitations VALUES (96, '2025-02-08 16:39:32.015928+00', NULL, 13, 2, 61608);
INSERT INTO public.dua_lines_has_recitations VALUES (97, '2025-02-08 16:39:32.032423+00', NULL, 14, 2, 64282);
INSERT INTO public.dua_lines_has_recitations VALUES (98, '2025-02-08 16:39:32.048881+00', NULL, 15, 2, 68022);
INSERT INTO public.dua_lines_has_recitations VALUES (99, '2025-02-08 16:39:32.065626+00', NULL, 16, 2, 74843);
INSERT INTO public.dua_lines_has_recitations VALUES (100, '2025-02-08 16:39:32.082154+00', NULL, 17, 2, 81909);
INSERT INTO public.dua_lines_has_recitations VALUES (101, '2025-02-08 16:39:32.09866+00', NULL, 18, 2, 88133);
INSERT INTO public.dua_lines_has_recitations VALUES (102, '2025-02-08 16:39:32.115846+00', NULL, 19, 2, 93884);
INSERT INTO public.dua_lines_has_recitations VALUES (103, '2025-02-08 16:39:32.131878+00', NULL, 20, 2, 99651);
INSERT INTO public.dua_lines_has_recitations VALUES (104, '2025-02-08 16:39:32.148519+00', NULL, 21, 2, 105627);
INSERT INTO public.dua_lines_has_recitations VALUES (105, '2025-02-08 16:39:32.165391+00', NULL, 22, 2, 111268);
INSERT INTO public.dua_lines_has_recitations VALUES (106, '2025-02-08 16:39:32.181531+00', NULL, 23, 2, 122397);
INSERT INTO public.dua_lines_has_recitations VALUES (107, '2025-02-08 16:39:32.198603+00', NULL, 24, 2, 128005);
INSERT INTO public.dua_lines_has_recitations VALUES (108, '2025-02-08 16:39:32.216159+00', NULL, 25, 2, 133473);
INSERT INTO public.dua_lines_has_recitations VALUES (109, '2025-02-08 16:39:32.23434+00', NULL, 26, 2, 137479);
INSERT INTO public.dua_lines_has_recitations VALUES (110, '2025-02-08 16:39:32.250493+00', NULL, 27, 2, 141612);
INSERT INTO public.dua_lines_has_recitations VALUES (111, '2025-02-08 16:39:32.266784+00', NULL, 28, 2, 143820);
INSERT INTO public.dua_lines_has_recitations VALUES (112, '2025-02-08 16:39:32.282483+00', NULL, 29, 2, 149730);
INSERT INTO public.dua_lines_has_recitations VALUES (113, '2025-02-08 16:39:32.299571+00', NULL, 30, 2, 152896);
INSERT INTO public.dua_lines_has_recitations VALUES (114, '2025-02-08 16:39:32.315774+00', NULL, 31, 2, 156719);
INSERT INTO public.dua_lines_has_recitations VALUES (115, '2025-02-08 16:39:32.331782+00', NULL, 32, 2, 161898);
INSERT INTO public.dua_lines_has_recitations VALUES (116, '2025-02-08 16:39:32.348257+00', NULL, 33, 2, 170741);
INSERT INTO public.dua_lines_has_recitations VALUES (117, '2025-02-08 16:39:32.365022+00', NULL, 34, 2, 174736);
INSERT INTO public.dua_lines_has_recitations VALUES (118, '2025-02-08 16:39:32.381045+00', NULL, 35, 2, 183840);
INSERT INTO public.dua_lines_has_recitations VALUES (119, '2025-02-08 16:39:32.396939+00', NULL, 36, 2, 188623);
INSERT INTO public.dua_lines_has_recitations VALUES (120, '2025-02-08 16:39:32.412829+00', NULL, 37, 2, 192924);
INSERT INTO public.dua_lines_has_recitations VALUES (121, '2025-02-08 16:39:32.428984+00', NULL, 38, 2, 198420);
INSERT INTO public.dua_lines_has_recitations VALUES (122, '2025-02-08 16:39:32.447095+00', NULL, 39, 2, 203398);
INSERT INTO public.dua_lines_has_recitations VALUES (123, '2025-02-08 16:39:32.463105+00', NULL, 40, 2, 207025);
INSERT INTO public.dua_lines_has_recitations VALUES (124, '2025-02-08 16:39:32.478585+00', NULL, 41, 2, 210252);
INSERT INTO public.dua_lines_has_recitations VALUES (125, '2025-02-08 16:39:32.494619+00', NULL, 42, 2, 213560);
INSERT INTO public.dua_lines_has_recitations VALUES (126, '2025-02-08 16:39:32.510613+00', NULL, 43, 2, 218598);
INSERT INTO public.dua_lines_has_recitations VALUES (127, '2025-02-08 16:39:32.527018+00', NULL, 44, 2, 232886);
INSERT INTO public.dua_lines_has_recitations VALUES (128, '2025-02-08 16:39:32.54371+00', NULL, 45, 2, 242096);
INSERT INTO public.dua_lines_has_recitations VALUES (129, '2025-02-08 16:39:32.56005+00', NULL, 46, 2, 244972);
INSERT INTO public.dua_lines_has_recitations VALUES (130, '2025-02-08 16:39:32.576451+00', NULL, 47, 2, 248737);
INSERT INTO public.dua_lines_has_recitations VALUES (131, '2025-02-08 16:39:32.593408+00', NULL, 48, 2, 254845);
INSERT INTO public.dua_lines_has_recitations VALUES (132, '2025-02-08 16:39:32.609793+00', NULL, 49, 2, 260505);
INSERT INTO public.dua_lines_has_recitations VALUES (133, '2025-02-08 16:39:32.625812+00', NULL, 50, 2, 263464);
INSERT INTO public.dua_lines_has_recitations VALUES (134, '2025-02-08 16:39:32.641866+00', NULL, 51, 2, 268829);
INSERT INTO public.dua_lines_has_recitations VALUES (135, '2025-02-08 16:39:32.658226+00', NULL, 52, 2, 272522);
INSERT INTO public.dua_lines_has_recitations VALUES (136, '2025-02-08 16:39:32.674474+00', NULL, 53, 2, 275208);
INSERT INTO public.dua_lines_has_recitations VALUES (137, '2025-02-08 16:39:32.691304+00', NULL, 54, 2, 277924);
INSERT INTO public.dua_lines_has_recitations VALUES (138, '2025-02-08 16:39:32.707502+00', NULL, 55, 2, 281489);
INSERT INTO public.dua_lines_has_recitations VALUES (139, '2025-02-08 16:39:32.72369+00', NULL, 56, 2, 283956);
INSERT INTO public.dua_lines_has_recitations VALUES (140, '2025-02-08 16:39:32.739298+00', NULL, 57, 2, 287231);
INSERT INTO public.dua_lines_has_recitations VALUES (141, '2025-02-08 16:39:32.75583+00', NULL, 58, 2, 291334);
INSERT INTO public.dua_lines_has_recitations VALUES (142, '2025-02-08 16:39:32.771971+00', NULL, 59, 2, 294598);
INSERT INTO public.dua_lines_has_recitations VALUES (143, '2025-02-08 16:39:32.78815+00', NULL, 60, 2, 299057);
INSERT INTO public.dua_lines_has_recitations VALUES (144, '2025-02-08 16:39:32.804749+00', NULL, 61, 2, 303991);
INSERT INTO public.dua_lines_has_recitations VALUES (145, '2025-02-08 16:39:32.820989+00', NULL, 62, 2, 306132);
INSERT INTO public.dua_lines_has_recitations VALUES (146, '2025-02-08 16:39:32.837973+00', NULL, 63, 2, 310699);
INSERT INTO public.dua_lines_has_recitations VALUES (147, '2025-02-08 16:39:32.852838+00', NULL, 64, 2, 313532);
INSERT INTO public.dua_lines_has_recitations VALUES (148, '2025-02-08 16:39:32.868091+00', NULL, 65, 2, 316435);
INSERT INTO public.dua_lines_has_recitations VALUES (149, '2025-02-08 16:39:32.883931+00', NULL, 66, 2, 316615);
INSERT INTO public.dua_lines_has_recitations VALUES (150, '2025-02-08 16:39:32.899068+00', NULL, 67, 2, 322905);
INSERT INTO public.dua_lines_has_recitations VALUES (151, '2025-02-08 16:39:32.914361+00', NULL, 68, 2, 326966);
INSERT INTO public.dua_lines_has_recitations VALUES (152, '2025-02-08 16:39:32.929911+00', NULL, 69, 2, 333354);
INSERT INTO public.dua_lines_has_recitations VALUES (153, '2025-02-08 16:39:32.946391+00', NULL, 70, 2, 339616);
INSERT INTO public.dua_lines_has_recitations VALUES (154, '2025-02-08 16:39:32.962767+00', NULL, 71, 2, 346120);
INSERT INTO public.dua_lines_has_recitations VALUES (155, '2025-02-08 16:39:32.979273+00', NULL, 72, 2, 353444);
INSERT INTO public.dua_lines_has_recitations VALUES (156, '2025-02-08 16:39:32.995252+00', NULL, 73, 2, 357400);
INSERT INTO public.dua_lines_has_recitations VALUES (157, '2025-02-08 16:39:33.010972+00', NULL, 74, 2, 363594);
INSERT INTO public.dua_lines_has_recitations VALUES (158, '2025-02-08 16:39:33.026935+00', NULL, 75, 2, 368453);
INSERT INTO public.dua_lines_has_recitations VALUES (159, '2025-02-08 16:39:33.043069+00', NULL, 76, 2, 371552);
INSERT INTO public.dua_lines_has_recitations VALUES (160, '2025-02-08 16:39:33.05946+00', NULL, 77, 2, 376495);
INSERT INTO public.dua_lines_has_recitations VALUES (161, '2025-02-08 16:39:33.075054+00', NULL, 78, 2, 381595);
INSERT INTO public.dua_lines_has_recitations VALUES (162, '2025-02-08 16:39:33.091379+00', NULL, 79, 2, 391515);
INSERT INTO public.dua_lines_has_recitations VALUES (163, '2025-02-08 16:39:33.109847+00', NULL, 80, 2, 395562);
INSERT INTO public.dua_lines_has_recitations VALUES (164, '2025-02-08 16:39:33.125491+00', NULL, 81, 2, 403074);
INSERT INTO public.dua_lines_has_recitations VALUES (165, '2025-02-08 16:39:33.141246+00', NULL, 82, 2, 408182);
INSERT INTO public.dua_lines_has_recitations VALUES (166, '2025-02-08 16:39:33.158144+00', NULL, 83, 2, 410239);
INSERT INTO public.dua_lines_has_recitations VALUES (167, '2025-02-08 16:39:33.862885+00', NULL, 1, 3, 0);
INSERT INTO public.dua_lines_has_recitations VALUES (168, '2025-02-08 16:39:33.882857+00', NULL, 2, 3, 8943);
INSERT INTO public.dua_lines_has_recitations VALUES (169, '2025-02-08 16:39:33.900147+00', NULL, 3, 3, 20693);
INSERT INTO public.dua_lines_has_recitations VALUES (170, '2025-02-08 16:39:33.917697+00', NULL, 4, 3, 25692);
INSERT INTO public.dua_lines_has_recitations VALUES (171, '2025-02-08 16:39:33.935068+00', NULL, 5, 3, 30443);
INSERT INTO public.dua_lines_has_recitations VALUES (172, '2025-02-08 16:39:33.953032+00', NULL, 6, 3, 34942);
INSERT INTO public.dua_lines_has_recitations VALUES (173, '2025-02-08 16:39:33.971581+00', NULL, 7, 3, 41442);
INSERT INTO public.dua_lines_has_recitations VALUES (174, '2025-02-08 16:39:33.990584+00', NULL, 8, 3, 45941);
INSERT INTO public.dua_lines_has_recitations VALUES (175, '2025-02-08 16:39:34.009207+00', NULL, 9, 3, 50693);
INSERT INTO public.dua_lines_has_recitations VALUES (176, '2025-02-08 16:39:34.027279+00', NULL, 10, 3, 55942);
INSERT INTO public.dua_lines_has_recitations VALUES (177, '2025-02-08 16:39:34.045647+00', NULL, 11, 3, 61443);
INSERT INTO public.dua_lines_has_recitations VALUES (178, '2025-02-08 16:39:34.062848+00', NULL, 12, 3, 69692);
INSERT INTO public.dua_lines_has_recitations VALUES (179, '2025-02-08 16:39:34.081369+00', NULL, 13, 3, 78906);
INSERT INTO public.dua_lines_has_recitations VALUES (180, '2025-02-08 16:39:34.100222+00', NULL, 14, 3, 82906);
INSERT INTO public.dua_lines_has_recitations VALUES (181, '2025-02-08 16:39:34.116997+00', NULL, 15, 3, 86657);
INSERT INTO public.dua_lines_has_recitations VALUES (182, '2025-02-08 16:39:34.13426+00', NULL, 16, 3, 96906);
INSERT INTO public.dua_lines_has_recitations VALUES (183, '2025-02-08 16:39:34.152035+00', NULL, 17, 3, 116106);
INSERT INTO public.dua_lines_has_recitations VALUES (184, '2025-02-08 16:39:34.171631+00', NULL, 18, 3, 121355);
INSERT INTO public.dua_lines_has_recitations VALUES (185, '2025-02-08 16:39:34.191371+00', NULL, 19, 3, 126105);
INSERT INTO public.dua_lines_has_recitations VALUES (186, '2025-02-08 16:39:34.210742+00', NULL, 20, 3, 132106);
INSERT INTO public.dua_lines_has_recitations VALUES (187, '2025-02-08 16:39:34.227756+00', NULL, 21, 3, 138106);
INSERT INTO public.dua_lines_has_recitations VALUES (188, '2025-02-08 16:39:34.244489+00', NULL, 22, 3, 143107);
INSERT INTO public.dua_lines_has_recitations VALUES (189, '2025-02-08 16:39:34.261427+00', NULL, 23, 3, 154105);
INSERT INTO public.dua_lines_has_recitations VALUES (190, '2025-02-08 16:39:34.278431+00', NULL, 24, 3, 161606);
INSERT INTO public.dua_lines_has_recitations VALUES (191, '2025-02-08 16:39:34.298402+00', NULL, 25, 3, 166606);
INSERT INTO public.dua_lines_has_recitations VALUES (192, '2025-02-08 16:39:34.317883+00', NULL, 26, 3, 171606);
INSERT INTO public.dua_lines_has_recitations VALUES (193, '2025-02-08 16:39:34.337833+00', NULL, 27, 3, 175606);
INSERT INTO public.dua_lines_has_recitations VALUES (194, '2025-02-08 16:39:34.354641+00', NULL, 28, 3, 179855);
INSERT INTO public.dua_lines_has_recitations VALUES (195, '2025-02-08 16:39:34.372082+00', NULL, 29, 3, 183855);
INSERT INTO public.dua_lines_has_recitations VALUES (196, '2025-02-08 16:39:34.389877+00', NULL, 30, 3, 188856);
INSERT INTO public.dua_lines_has_recitations VALUES (197, '2025-02-08 16:39:34.409693+00', NULL, 31, 3, 191855);
INSERT INTO public.dua_lines_has_recitations VALUES (198, '2025-02-08 16:39:34.427558+00', NULL, 32, 3, 199355);
INSERT INTO public.dua_lines_has_recitations VALUES (199, '2025-02-08 16:39:34.448881+00', NULL, 33, 3, 208855);
INSERT INTO public.dua_lines_has_recitations VALUES (200, '2025-02-08 16:39:34.467453+00', NULL, 34, 3, 213356);
INSERT INTO public.dua_lines_has_recitations VALUES (201, '2025-02-08 16:39:34.485361+00', NULL, 35, 3, 221857);
INSERT INTO public.dua_lines_has_recitations VALUES (202, '2025-02-08 16:39:34.503359+00', NULL, 36, 3, 228107);
INSERT INTO public.dua_lines_has_recitations VALUES (203, '2025-02-08 16:39:34.521275+00', NULL, 37, 3, 233607);
INSERT INTO public.dua_lines_has_recitations VALUES (204, '2025-02-08 16:39:34.540173+00', NULL, 38, 3, 239105);
INSERT INTO public.dua_lines_has_recitations VALUES (205, '2025-02-08 16:39:34.558342+00', NULL, 39, 3, 246605);
INSERT INTO public.dua_lines_has_recitations VALUES (206, '2025-02-08 16:39:34.576484+00', NULL, 40, 3, 250605);
INSERT INTO public.dua_lines_has_recitations VALUES (207, '2025-02-08 16:39:34.594903+00', NULL, 41, 3, 253606);
INSERT INTO public.dua_lines_has_recitations VALUES (208, '2025-02-08 16:39:34.612903+00', NULL, 42, 3, 258105);
INSERT INTO public.dua_lines_has_recitations VALUES (209, '2025-02-08 16:39:34.630856+00', NULL, 43, 3, 262105);
INSERT INTO public.dua_lines_has_recitations VALUES (210, '2025-02-08 16:39:34.650084+00', NULL, 44, 3, 276355);
INSERT INTO public.dua_lines_has_recitations VALUES (211, '2025-02-08 16:39:34.667369+00', NULL, 45, 3, 285607);
INSERT INTO public.dua_lines_has_recitations VALUES (212, '2025-02-08 16:39:34.685357+00', NULL, 46, 3, 288855);
INSERT INTO public.dua_lines_has_recitations VALUES (213, '2025-02-08 16:39:34.702721+00', NULL, 47, 3, 293106);
INSERT INTO public.dua_lines_has_recitations VALUES (214, '2025-02-08 16:39:34.720507+00', NULL, 48, 3, 300107);
INSERT INTO public.dua_lines_has_recitations VALUES (215, '2025-02-08 16:39:34.73775+00', NULL, 49, 3, 308357);
INSERT INTO public.dua_lines_has_recitations VALUES (216, '2025-02-08 16:39:34.755385+00', NULL, 50, 3, 312106);
INSERT INTO public.dua_lines_has_recitations VALUES (217, '2025-02-08 16:39:34.773357+00', NULL, 51, 3, 317856);
INSERT INTO public.dua_lines_has_recitations VALUES (218, '2025-02-08 16:39:34.79068+00', NULL, 52, 3, 320606);
INSERT INTO public.dua_lines_has_recitations VALUES (219, '2025-02-08 16:39:34.807723+00', NULL, 53, 3, 323356);
INSERT INTO public.dua_lines_has_recitations VALUES (220, '2025-02-08 16:39:34.824351+00', NULL, 54, 3, 326607);
INSERT INTO public.dua_lines_has_recitations VALUES (221, '2025-02-08 16:39:34.841816+00', NULL, 55, 3, 329605);
INSERT INTO public.dua_lines_has_recitations VALUES (222, '2025-02-08 16:39:34.85893+00', NULL, 56, 3, 332106);
INSERT INTO public.dua_lines_has_recitations VALUES (223, '2025-02-08 16:39:34.875609+00', NULL, 57, 3, 334355);
INSERT INTO public.dua_lines_has_recitations VALUES (224, '2025-02-08 16:39:34.892885+00', NULL, 58, 3, 339106);
INSERT INTO public.dua_lines_has_recitations VALUES (225, '2025-02-08 16:39:34.908995+00', NULL, 59, 3, 342105);
INSERT INTO public.dua_lines_has_recitations VALUES (226, '2025-02-08 16:39:34.925184+00', NULL, 60, 3, 348355);
INSERT INTO public.dua_lines_has_recitations VALUES (227, '2025-02-08 16:39:34.941145+00', NULL, 61, 3, 353107);
INSERT INTO public.dua_lines_has_recitations VALUES (228, '2025-02-08 16:39:34.957866+00', NULL, 62, 3, 357107);
INSERT INTO public.dua_lines_has_recitations VALUES (229, '2025-02-08 16:39:34.974961+00', NULL, 63, 3, 362856);
INSERT INTO public.dua_lines_has_recitations VALUES (230, '2025-02-08 16:39:34.991407+00', NULL, 64, 3, 366605);
INSERT INTO public.dua_lines_has_recitations VALUES (231, '2025-02-08 16:39:35.008701+00', NULL, 65, 3, 370606);
INSERT INTO public.dua_lines_has_recitations VALUES (232, '2025-02-08 16:39:35.025528+00', NULL, 66, 3, 375605);
INSERT INTO public.dua_lines_has_recitations VALUES (233, '2025-02-08 16:39:35.04232+00', NULL, 67, 3, 384355);
INSERT INTO public.dua_lines_has_recitations VALUES (234, '2025-02-08 16:39:35.058658+00', NULL, 68, 3, 390605);
INSERT INTO public.dua_lines_has_recitations VALUES (235, '2025-02-08 16:39:35.074978+00', NULL, 69, 3, 397606);
INSERT INTO public.dua_lines_has_recitations VALUES (236, '2025-02-08 16:39:35.091437+00', NULL, 70, 3, 403857);
INSERT INTO public.dua_lines_has_recitations VALUES (237, '2025-02-08 16:39:35.108319+00', NULL, 71, 3, 410355);
INSERT INTO public.dua_lines_has_recitations VALUES (238, '2025-02-08 16:39:35.124846+00', NULL, 72, 3, 419105);
INSERT INTO public.dua_lines_has_recitations VALUES (239, '2025-02-08 16:39:35.141683+00', NULL, 73, 3, 423356);
INSERT INTO public.dua_lines_has_recitations VALUES (240, '2025-02-08 16:39:35.161244+00', NULL, 74, 3, 431856);
INSERT INTO public.dua_lines_has_recitations VALUES (241, '2025-02-08 16:39:35.179528+00', NULL, 75, 3, 439357);
INSERT INTO public.dua_lines_has_recitations VALUES (242, '2025-02-08 16:39:35.19789+00', NULL, 76, 3, 443106);
INSERT INTO public.dua_lines_has_recitations VALUES (243, '2025-02-08 16:39:35.216091+00', NULL, 77, 3, 449356);
INSERT INTO public.dua_lines_has_recitations VALUES (244, '2025-02-08 16:39:35.23191+00', NULL, 78, 3, 453106);
INSERT INTO public.dua_lines_has_recitations VALUES (245, '2025-02-08 16:39:35.249424+00', NULL, 79, 3, 466857);
INSERT INTO public.dua_lines_has_recitations VALUES (246, '2025-02-08 16:39:35.265957+00', NULL, 80, 3, 470356);
INSERT INTO public.dua_lines_has_recitations VALUES (247, '2025-02-08 16:39:35.283024+00', NULL, 81, 3, 476857);
INSERT INTO public.dua_lines_has_recitations VALUES (248, '2025-02-08 16:39:35.30217+00', NULL, 82, 3, 482357);
INSERT INTO public.dua_lines_has_recitations VALUES (249, '2025-02-08 16:39:35.318817+00', NULL, 83, 3, 488856);


--
-- TOC entry 3848 (class 0 OID 17396)
-- Dependencies: 295
-- Data for Name: dua_references; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dua_references VALUES (2, '2025-02-08 16:39:18.107305+00', NULL, 'duaplayer.org API call', 'https://www.duaplayer.org/api/2/aahad?langs=ar|en|tl&getSlides=true', 'EN', 2);
INSERT INTO public.dua_references VALUES (3, '2025-02-08 16:39:18.116057+00', NULL, 'duaplayer.org Website', 'https://www.duaplayer.org/dua/aahad', 'EN', 2);


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 284
-- Name: dua_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dua_infos_id_seq', 3, true);


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 286
-- Name: dua_line_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dua_line_texts_id_seq', 249, true);


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 290
-- Name: dua_lines_has_recitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dua_lines_has_recitations_id_seq', 249, true);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 288
-- Name: dua_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dua_lines_id_seq', 83, true);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 292
-- Name: dua_recitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dua_recitations_id_seq', 3, true);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 294
-- Name: dua_references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dua_references_id_seq', 3, true);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 296
-- Name: duas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.duas_id_seq', 2, true);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 299
-- Name: reciters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reciters_id_seq', 3, true);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 301
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


-- Completed on 2025-02-08 18:40:41

--
-- PostgreSQL database dump complete
--
