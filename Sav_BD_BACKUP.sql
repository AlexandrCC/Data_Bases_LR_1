--
-- PostgreSQL database dump
--

-- Dumped from database version 13.16
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-02 23:06:33

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16409)
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    "Category_ID" integer NOT NULL,
    "Category_Name" character varying(50) NOT NULL
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16416)
-- Name: Diseases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Diseases" (
    "Disease_id" integer NOT NULL,
    "Disease_name" character varying(50)
);


ALTER TABLE public."Diseases" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16423)
-- Name: Manufactures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Manufactures" (
    "Manufacturer_id" integer NOT NULL,
    "Manufacturer_name" character varying(128) NOT NULL,
    "Location of facilities" character varying(128) NOT NULL
);


ALTER TABLE public."Manufactures" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16671)
-- Name: Medicines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Medicines" (
    "Medicine_id" integer NOT NULL,
    "Manufacturer_id" integer NOT NULL,
    "Specs_id" integer NOT NULL,
    "Category_id" integer NOT NULL,
    "Treats_id" integer NOT NULL,
    "Contradicts_id" integer NOT NULL,
    "Medicine_name" character varying(50) NOT NULL
);


ALTER TABLE public."Medicines" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16428)
-- Name: Specs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Specs" (
    "Specs_id" integer NOT NULL,
    "Lisence_name" character varying(128) NOT NULL,
    "Term_of_issue" boolean NOT NULL,
    "Medicine_form" character varying(50) NOT NULL
);


ALTER TABLE public."Specs" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16706)
-- Name: man_med_tab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.man_med_tab (
    "Tab_id" integer NOT NULL,
    "Medicine_id" integer NOT NULL,
    "Manufacturer_id" integer NOT NULL
);


ALTER TABLE public.man_med_tab OWNER TO postgres;

--
-- TOC entry 3022 (class 0 OID 16409)
-- Dependencies: 201
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" ("Category_ID", "Category_Name") FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 16416)
-- Dependencies: 202
-- Data for Name: Diseases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Diseases" ("Disease_id", "Disease_name") FROM stdin;
\.


--
-- TOC entry 3024 (class 0 OID 16423)
-- Dependencies: 203
-- Data for Name: Manufactures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Manufactures" ("Manufacturer_id", "Manufacturer_name", "Location of facilities") FROM stdin;
122	FARMAK	PPIDVAl
\.


--
-- TOC entry 3026 (class 0 OID 16671)
-- Dependencies: 205
-- Data for Name: Medicines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Medicines" ("Medicine_id", "Manufacturer_id", "Specs_id", "Category_id", "Treats_id", "Contradicts_id", "Medicine_name") FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 16428)
-- Dependencies: 204
-- Data for Name: Specs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Specs" ("Specs_id", "Lisence_name", "Term_of_issue", "Medicine_form") FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 16706)
-- Dependencies: 206
-- Data for Name: man_med_tab; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.man_med_tab ("Tab_id", "Medicine_id", "Manufacturer_id") FROM stdin;
\.


--
-- TOC entry 2870 (class 2606 OID 16413)
-- Name: Categories Category_ID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Category_ID" PRIMARY KEY ("Category_ID");


--
-- TOC entry 2872 (class 2606 OID 16415)
-- Name: Categories Categoties_Category_Name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categoties_Category_Name_key" UNIQUE ("Category_Name");


--
-- TOC entry 2874 (class 2606 OID 16420)
-- Name: Diseases Disease_id_prkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Diseases"
    ADD CONSTRAINT "Disease_id_prkey" PRIMARY KEY ("Disease_id");


--
-- TOC entry 2878 (class 2606 OID 16427)
-- Name: Manufactures Manufcaturer_id_prkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Manufactures"
    ADD CONSTRAINT "Manufcaturer_id_prkey" PRIMARY KEY ("Manufacturer_id");


--
-- TOC entry 2882 (class 2606 OID 16675)
-- Name: Medicines Med_id_prk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Med_id_prk" PRIMARY KEY ("Medicine_id");


--
-- TOC entry 2876 (class 2606 OID 16422)
-- Name: Diseases Name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Diseases"
    ADD CONSTRAINT "Name" UNIQUE ("Disease_name");


--
-- TOC entry 2884 (class 2606 OID 16677)
-- Name: Medicines Specs_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Specs_id" UNIQUE ("Specs_id");


--
-- TOC entry 2880 (class 2606 OID 16432)
-- Name: Specs Specs_id_prkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Specs"
    ADD CONSTRAINT "Specs_id_prkey" PRIMARY KEY ("Specs_id");


--
-- TOC entry 2885 (class 2606 OID 16693)
-- Name: Medicines Category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Category_fk" FOREIGN KEY ("Category_id") REFERENCES public."Categories"("Category_ID");


--
-- TOC entry 2886 (class 2606 OID 16698)
-- Name: Medicines Contradict_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Contradict_fk" FOREIGN KEY ("Contradicts_id") REFERENCES public."Diseases"("Disease_id");


--
-- TOC entry 2890 (class 2606 OID 16709)
-- Name: man_med_tab Man_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.man_med_tab
    ADD CONSTRAINT "Man_fk" FOREIGN KEY ("Manufacturer_id") REFERENCES public."Manufactures"("Manufacturer_id");


--
-- TOC entry 2887 (class 2606 OID 16678)
-- Name: Medicines Manufacturer_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Manufacturer_fk" FOREIGN KEY ("Manufacturer_id") REFERENCES public."Manufactures"("Manufacturer_id");


--
-- TOC entry 2891 (class 2606 OID 16714)
-- Name: man_med_tab Med_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.man_med_tab
    ADD CONSTRAINT "Med_fk" FOREIGN KEY ("Medicine_id") REFERENCES public."Medicines"("Medicine_id");


--
-- TOC entry 2888 (class 2606 OID 16683)
-- Name: Medicines Specs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Specs_fk" FOREIGN KEY ("Specs_id") REFERENCES public."Specs"("Specs_id");


--
-- TOC entry 2889 (class 2606 OID 16688)
-- Name: Medicines Treats_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medicines"
    ADD CONSTRAINT "Treats_fk" FOREIGN KEY ("Treats_id") REFERENCES public."Diseases"("Disease_id");


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-10-02 23:06:33

--
-- PostgreSQL database dump complete
--

