\connect srsvhdb
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-01 22:08:51

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

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16834)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16862)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    did bigint NOT NULL,
    size_doc integer NOT NULL,
    idmd5 character varying(32) NOT NULL,
    idsha256 character varying(64) NOT NULL,
    create_date timestamp with time zone DEFAULT now() NOT NULL,
    modify_date timestamp with time zone NOT NULL,
    pid bigint NOT NULL,
    docid uuid NOT NULL,
    "DocType" text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16860)
-- Name: documents_did_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.documents ALTER COLUMN did ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.documents_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16861)
-- Name: documents_size_doc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.documents ALTER COLUMN size_doc ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.documents_size_doc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16847)
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    pid bigint NOT NULL,
    create_date timestamp with time zone DEFAULT now() NOT NULL,
    modify_date timestamp with time zone NOT NULL,
    uuid uuid NOT NULL,
    user_id uuid NOT NULL,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.packages OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16846)
-- Name: packages_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.packages ALTER COLUMN pid ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.packages_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16855)
-- Name: pkg_status_graph; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pkg_status_graph (
    oldst integer NOT NULL,
    newst integer NOT NULL
);


ALTER TABLE public.pkg_status_graph OWNER TO postgres;

--
-- TOC entry 4805 (class 0 OID 16834)
-- Dependencies: 215
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") VALUES ('20240923172023_InitServerDB', '8.0.8');
INSERT INTO public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") VALUES ('20241001190439_UpdateServerDbIndex', '8.0.8');


--
-- TOC entry 4811 (class 0 OID 16862)
-- Dependencies: 221
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4807 (class 0 OID 16847)
-- Dependencies: 217
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4808 (class 0 OID 16855)
-- Dependencies: 218
-- Data for Name: pkg_status_graph; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (0, 1);
INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (0, 4);
INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (1, 3);
INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (1, 4);
INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (3, 4);
INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (3, 5);
INSERT INTO public.pkg_status_graph (oldst, newst) VALUES (5, 4);


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 219
-- Name: documents_did_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_did_seq', 1, false);


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 220
-- Name: documents_size_doc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_size_doc_seq', 1, false);


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 216
-- Name: packages_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_pid_seq', 1, false);


--
-- TOC entry 4653 (class 2606 OID 16838)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 4660 (class 2606 OID 16867)
-- Name: documents PK_documents; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT "PK_documents" PRIMARY KEY (did);


--
-- TOC entry 4655 (class 2606 OID 16853)
-- Name: packages PK_packages; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT "PK_packages" PRIMARY KEY (pid);


--
-- TOC entry 4657 (class 2606 OID 16884)
-- Name: pkg_status_graph PK_pkg_status_graph; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pkg_status_graph
    ADD CONSTRAINT "PK_pkg_status_graph" PRIMARY KEY (oldst, newst);


--
-- TOC entry 4658 (class 1259 OID 16879)
-- Name: IX_documents_pid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_documents_pid" ON public.documents USING btree (pid);


--
-- TOC entry 4661 (class 2606 OID 16873)
-- Name: documents FK_documents_packages_pid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT "FK_documents_packages_pid" FOREIGN KEY (pid) REFERENCES public.packages(pid) ON DELETE CASCADE;


-- Completed on 2024-10-01 22:08:51

--
-- PostgreSQL database dump complete
--

