--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 14.2

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
-- Name: dev; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dev;


ALTER SCHEMA dev OWNER TO postgres;

--
-- Name: SCHEMA dev; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA dev IS 'standard dev schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: dev; Owner: postgres
--

CREATE TABLE dev.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE dev.ar_internal_metadata OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: dev; Owner: postgres
--

CREATE TABLE dev.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE dev.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: dev; Owner: postgres
--

CREATE TABLE dev.users (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE dev.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: dev; Owner: postgres
--

CREATE SEQUENCE dev.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dev.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: dev; Owner: postgres
--

ALTER SEQUENCE dev.users_id_seq OWNED BY dev.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: dev; Owner: postgres
--

ALTER TABLE ONLY dev.users ALTER COLUMN id SET DEFAULT nextval('dev.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: dev; Owner: postgres
--

COPY dev.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-04-14 18:42:10.517965	2022-04-14 18:42:10.517965
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: dev; Owner: postgres
--

COPY dev.schema_migrations (version) FROM stdin;
20220414184206
20220414184250
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: dev; Owner: postgres
--

COPY dev.users (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: dev; Owner: postgres
--

SELECT pg_catalog.setval('dev.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: dev; Owner: postgres
--

ALTER TABLE ONLY dev.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: dev; Owner: postgres
--

ALTER TABLE ONLY dev.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_email_null; Type: CHECK CONSTRAINT; Schema: dev; Owner: postgres
--

ALTER TABLE dev.users
    ADD CONSTRAINT users_email_null CHECK ((email IS NOT NULL)) NOT VALID;


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: dev; Owner: postgres
--

ALTER TABLE ONLY dev.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

