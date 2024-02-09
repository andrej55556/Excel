--
-- PostgreSQL database cluster dump
--

-- Started on 2024-02-09 10:59:58

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-09 10:59:58

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

-- Completed on 2024-02-09 10:59:58

--
-- PostgreSQL database dump complete
--

--
-- Database "Normalization" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-09 10:59:58

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
-- TOC entry 4861 (class 1262 OID 41405)
-- Name: Normalization; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Normalization" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Normalization" OWNER TO postgres;

\connect "Normalization"

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
-- TOC entry 216 (class 1259 OID 41407)
-- Name: Attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Attributes" (
    id_attribute integer NOT NULL,
    attribute_name character varying NOT NULL
);


ALTER TABLE public."Attributes" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41406)
-- Name: Attributes_id_attribute_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Attributes" ALTER COLUMN id_attribute ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Attributes_id_attribute_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 41432)
-- Name: FunctionalDependencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FunctionalDependencies" (
    id_fd integer NOT NULL,
    id_key integer NOT NULL,
    id_not_key integer
);


ALTER TABLE public."FunctionalDependencies" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 41435)
-- Name: FunctionalDependencies_id_fd_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."FunctionalDependencies" ALTER COLUMN id_fd ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."FunctionalDependencies_id_fd_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 41412)
-- Name: KeyAttributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KeyAttributes" (
    id_key integer NOT NULL,
    id_attribute integer NOT NULL
);


ALTER TABLE public."KeyAttributes" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 41424)
-- Name: NotKeyAttributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NotKeyAttributes" (
    id_not_key integer NOT NULL,
    id_attribute integer NOT NULL
);


ALTER TABLE public."NotKeyAttributes" OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 41407)
-- Dependencies: 216
-- Data for Name: Attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Attributes" (id_attribute, attribute_name) FROM stdin;
1	№ договора
2	Дата договора
3	№ клиента
4	Наименование клиента
5	Адрес клиента
6	Телефон клиента
7	№ типового проекта
8	Название типового проекта
9	Общая площадь в кв. м.
10	Кол-во этажей
11	Кол-во комнат
12	Код типа дома
13	Тип дома
14	Цена за 1 коттедж
15	Код исполнителя
16	ФИО исполнителя
17	Шифр профиля
18	Профиль
\.


--
-- TOC entry 4854 (class 0 OID 41432)
-- Dependencies: 219
-- Data for Name: FunctionalDependencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FunctionalDependencies" (id_fd, id_key, id_not_key) FROM stdin;
1	1	\N
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
2	2	2
\.


--
-- TOC entry 4852 (class 0 OID 41412)
-- Dependencies: 217
-- Data for Name: KeyAttributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KeyAttributes" (id_key, id_attribute) FROM stdin;
5	15
4	3
3	7
2	1
1	1
1	15
8	2
8	7
6	17
7	12
\.


--
-- TOC entry 4853 (class 0 OID 41424)
-- Dependencies: 218
-- Data for Name: NotKeyAttributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NotKeyAttributes" (id_not_key, id_attribute) FROM stdin;
6	18
7	13
5	16
5	17
4	4
4	5
4	6
3	8
3	9
3	10
3	11
3	12
2	2
2	3
8	14
2	7
\.


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 215
-- Name: Attributes_id_attribute_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Attributes_id_attribute_seq"', 18, true);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 220
-- Name: FunctionalDependencies_id_fd_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FunctionalDependencies_id_fd_seq"', 8, true);


--
-- TOC entry 4702 (class 2606 OID 41418)
-- Name: Attributes attributes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attributes"
    ADD CONSTRAINT attributes_pk PRIMARY KEY (id_attribute);


--
-- TOC entry 4704 (class 2606 OID 41440)
-- Name: FunctionalDependencies functionaldependencies_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FunctionalDependencies"
    ADD CONSTRAINT functionaldependencies_pk PRIMARY KEY (id_fd);


--
-- TOC entry 4705 (class 2606 OID 41419)
-- Name: KeyAttributes keyattributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KeyAttributes"
    ADD CONSTRAINT keyattributes_fk FOREIGN KEY (id_attribute) REFERENCES public."Attributes"(id_attribute);


--
-- TOC entry 4706 (class 2606 OID 41427)
-- Name: NotKeyAttributes notkeyattributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotKeyAttributes"
    ADD CONSTRAINT notkeyattributes_fk FOREIGN KEY (id_attribute) REFERENCES public."Attributes"(id_attribute);


-- Completed on 2024-02-09 10:59:59

--
-- PostgreSQL database dump complete
--

--
-- Database "Zelye" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-02-09 10:59:59

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
-- TOC entry 4868 (class 1262 OID 32800)
-- Name: Zelye; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Zelye" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Zelye" OWNER TO postgres;

\connect "Zelye"

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
-- TOC entry 216 (class 1259 OID 32802)
-- Name: z_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.z_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.z_type OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32801)
-- Name: Type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.z_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 32823)
-- Name: ind; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ind (
    id integer NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.ind OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32822)
-- Name: ind_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ind ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 32809)
-- Name: recept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recept (
    id_zelya integer NOT NULL,
    id_ind integer NOT NULL,
    count integer NOT NULL
);


ALTER TABLE public.recept OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32815)
-- Name: zelye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zelye (
    id integer NOT NULL,
    z_name character varying NOT NULL,
    complexity integer NOT NULL,
    id_type integer NOT NULL
);


ALTER TABLE public.zelye OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32814)
-- Name: zelye_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.zelye ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.zelye_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4862 (class 0 OID 32823)
-- Dependencies: 221
-- Data for Name: ind; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ind (id, name, price) FROM stdin;
1	корень хуйни	34
2	пизда	21
3	корень пизды	55
4	эсс	300
\.


--
-- TOC entry 4858 (class 0 OID 32809)
-- Dependencies: 217
-- Data for Name: recept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recept (id_zelya, id_ind, count) FROM stdin;
1	1	5
1	3	4
2	4	1
\.


--
-- TOC entry 4857 (class 0 OID 32802)
-- Dependencies: 216
-- Data for Name: z_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.z_type (id, name) FROM stdin;
1	лёгкая сл
2	средняя сл
3	Усыпляющее
\.


--
-- TOC entry 4860 (class 0 OID 32815)
-- Dependencies: 219
-- Data for Name: zelye; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zelye (id, z_name, complexity, id_type) FROM stdin;
2	пиздец	5	2
3	ёбнуться	3	2
5	вфыв	1	3
6	ывфы	4	2
7	выфв	3	3
8	вфывф	2	1
1	хуёвое на 100%	3	1
4	ахуй 5%	2	1
9	10%	10	3
\.


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 215
-- Name: Type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Type_id_seq"', 3, true);


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 220
-- Name: ind_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ind_id_seq', 4, true);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 218
-- Name: zelye_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zelye_id_seq', 9, true);


--
-- TOC entry 4709 (class 2606 OID 32829)
-- Name: ind ind_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ind
    ADD CONSTRAINT ind_pk PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 32813)
-- Name: recept recept_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_pk PRIMARY KEY (id_zelya, id_ind);


--
-- TOC entry 4703 (class 2606 OID 32808)
-- Name: z_type type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.z_type
    ADD CONSTRAINT type_pk PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 32821)
-- Name: zelye zelye_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zelye
    ADD CONSTRAINT zelye_pk PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 32830)
-- Name: recept recept_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_fk FOREIGN KEY (id_ind) REFERENCES public.ind(id);


--
-- TOC entry 4711 (class 2606 OID 32845)
-- Name: recept recept_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recept
    ADD CONSTRAINT recept_fk2 FOREIGN KEY (id_zelya) REFERENCES public.zelye(id);


--
-- TOC entry 4712 (class 2606 OID 32840)
-- Name: zelye zelye_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zelye
    ADD CONSTRAINT zelye_fk FOREIGN KEY (id_type) REFERENCES public.z_type(id);


-- Completed on 2024-02-09 10:59:59

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-02-09 10:59:59

--
-- PostgreSQL database cluster dump complete
--

