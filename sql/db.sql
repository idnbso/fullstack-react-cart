--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-07-28 22:40:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 10 (class 2615 OID 18400)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12427)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 16927)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 18401)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 16897)
-- Name: books; Type: TABLE; Schema: public; Owner: idan
--

CREATE TABLE books (
    id integer NOT NULL,
    title text NOT NULL,
    author text NOT NULL,
    description text NOT NULL,
    price integer NOT NULL
);


ALTER TABLE books OWNER TO idan;

--
-- TOC entry 188 (class 1259 OID 16895)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: idan
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO idan;

--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 188
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: idan
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- TOC entry 191 (class 1259 OID 16908)
-- Name: reviews; Type: TABLE; Schema: public; Owner: idan
--

CREATE TABLE reviews (
    id integer NOT NULL,
    book_id integer NOT NULL,
    rating integer NOT NULL,
    CONSTRAINT rating CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE reviews OWNER TO idan;

--
-- TOC entry 190 (class 1259 OID 16906)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: idan
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO idan;

--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 190
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: idan
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- TOC entry 3542 (class 2604 OID 16900)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: idan
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- TOC entry 3543 (class 2604 OID 16911)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: idan
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- TOC entry 3679 (class 0 OID 16897)
-- Dependencies: 189
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: idan
--

COPY books (id, title, author, description, price) FROM stdin;
1	The Rails Way	Obie	A book about Ruby on Rails.	2999
2	Clean Code	Someone	A book about clean code.	3999
3	Learn GraphQL	Samer Buna	Learn GraphQL data modelling.	2529
4	Eloquent JavaScript	Someone	A very good JavaScript book.	1566
\.


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 188
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: idan
--

SELECT pg_catalog.setval('books_id_seq', 1, false);


--
-- TOC entry 3681 (class 0 OID 16908)
-- Dependencies: 191
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: idan
--

COPY reviews (id, book_id, rating) FROM stdin;
1	1	4
2	1	3
3	1	5
4	2	2
\.


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 190
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: idan
--

SELECT pg_catalog.setval('reviews_id_seq', 1, false);


--
-- TOC entry 3539 (class 0 OID 17224)
-- Dependencies: 193
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


SET search_path = topology, pg_catalog;

--
-- TOC entry 3540 (class 0 OID 18404)
-- Dependencies: 208
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 3541 (class 0 OID 18417)
-- Dependencies: 209
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- TOC entry 3550 (class 2606 OID 16905)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: idan
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3552 (class 2606 OID 16914)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: idan
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3553 (class 2606 OID 16915)
-- Name: reviews book_id; Type: FK CONSTRAINT; Schema: public; Owner: idan
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT book_id FOREIGN KEY (id) REFERENCES books(id);


-- Completed on 2017-07-28 22:40:45

--
-- PostgreSQL database dump complete
--

