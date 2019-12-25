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

-- DROP DATABASE IF EXISTS grails_demo_db;
--
-- Name: grails_demo_db; Type: DATABASE; Schema: -; Owner: postgres
--

-- CREATE DATABASE grails_demo_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE grails_demo_db OWNER TO postgres;


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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: driver; Type: TABLE; Schema: public; Owner: development
--

CREATE TABLE public.driver (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.driver OWNER TO development;

--
-- Name: driver_sequence; Type: SEQUENCE; Schema: public; Owner: development
--

CREATE SEQUENCE public.driver_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_sequence OWNER TO development;

--
-- Name: make; Type: TABLE; Schema: public; Owner: development
--

CREATE TABLE public.make (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.make OWNER TO development;

--
-- Name: make_sequence; Type: SEQUENCE; Schema: public; Owner: development
--

CREATE SEQUENCE public.make_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.make_sequence OWNER TO development;

--
-- Name: model; Type: TABLE; Schema: public; Owner: development
--

CREATE TABLE public.model (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.model OWNER TO development;

--
-- Name: model_sequence; Type: SEQUENCE; Schema: public; Owner: development
--

CREATE SEQUENCE public.model_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_sequence OWNER TO development;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: development
--

CREATE TABLE public.vehicle (
    id bigint NOT NULL,
    version bigint NOT NULL,
    driver_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    make_id bigint NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.vehicle OWNER TO development;

--
-- Name: vehicle_sequence; Type: SEQUENCE; Schema: public; Owner: development
--

CREATE SEQUENCE public.vehicle_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicle_sequence OWNER TO development;

--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: development
--



--
-- Data for Name: make; Type: TABLE DATA; Schema: public; Owner: development
--



--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: development
--



--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: development
--



--
-- Name: driver_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.driver_sequence', 1, false);


--
-- Name: make_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.make_sequence', 1, false);


--
-- Name: model_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.model_sequence', 1, false );


--
-- Name: vehicle_sequence; Type: SEQUENCE SET; Schema: public; Owner: development
--

SELECT pg_catalog.setval('public.vehicle_sequence', 1, false );


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: make make_pkey; Type: CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.make
    ADD CONSTRAINT make_pkey PRIMARY KEY (id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- Name: vehicle fk27cc9wpp4hrwtmjyew3ln1pw3; Type: FK CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk27cc9wpp4hrwtmjyew3ln1pw3 FOREIGN KEY (model_id) REFERENCES public.model(id);


--
-- Name: vehicle fkdpor9ohov2f3optwe7twe49tt; Type: FK CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fkdpor9ohov2f3optwe7twe49tt FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: vehicle fkf9eeyc823n7u3ngwo162r8vg4; Type: FK CONSTRAINT; Schema: public; Owner: development
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fkf9eeyc823n7u3ngwo162r8vg4 FOREIGN KEY (make_id) REFERENCES public.make(id);


--
-- Name: DATABASE grails_demo_db; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE grails_demo_db TO development;


--
-- PostgreSQL database dump complete
--

