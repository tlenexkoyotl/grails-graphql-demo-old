--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11 (Ubuntu 10.11-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.6 (Ubuntu 11.6-1.pgdg18.04+1)

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
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: development
--

INSERT INTO public.driver (id, version, name) VALUES (1, 0, 'Eduard');
INSERT INTO public.driver (id, version, name) VALUES (2, 0, 'Susan');
INSERT INTO public.driver (id, version, name) VALUES (3, 0, 'Pedro');


--
-- Data for Name: make; Type: TABLE DATA; Schema: public; Owner: development
--

INSERT INTO public.make (id, version, name) VALUES (1, 0, 'Nissan');
INSERT INTO public.make (id, version, name) VALUES (2, 0, 'Ford');


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: development
--

INSERT INTO public.model (id, version, name) VALUES (1, 0, 'Titan');
INSERT INTO public.model (id, version, name) VALUES (2, 0, 'Leaf');
INSERT INTO public.model (id, version, name) VALUES (3, 0, 'Windstar');
INSERT INTO public.model (id, version, name) VALUES (4, 0, 'Focus');


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: development
--

INSERT INTO public.vehicle (id, version, driver_id, name, make_id, model_id) VALUES (1, 0, 2, 'Pickup', 1, 1);
INSERT INTO public.vehicle (id, version, driver_id, name, make_id, model_id) VALUES (2, 0, 2, 'Economy', 1, 2);
INSERT INTO public.vehicle (id, version, driver_id, name, make_id, model_id) VALUES (3, 0, 3, 'Minivan', 2, 3);


--
-- Name: driver_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.driver_sequence', 3, true);


--
-- Name: make_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.make_sequence', 2, true);


--
-- Name: model_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.model_sequence', 4, true);


--
-- Name: vehicle_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.vehicle_sequence', 3, true);


--
-- PostgreSQL database dump complete
--

