--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-09-05 12:01:53

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
-- TOC entry 200 (class 1259 OID 24738)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24810)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32813)
-- Name: measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurement (
    id bigint NOT NULL,
    blood_pressure_upper integer,
    is_correct_by_doctor boolean NOT NULL,
    is_correct_by_patient boolean NOT NULL,
    pulse_rate integer,
    "time" timestamp without time zone,
    user_id bigint,
    blood_pressure_lower integer
);


ALTER TABLE public.measurement OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24812)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id bigint NOT NULL,
    filename character varying(255),
    tag character varying(255),
    text character varying(255),
    user_id bigint
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24820)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id bigint NOT NULL,
    roles character varying(255)
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24823)
-- Name: usr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usr (
    id bigint NOT NULL,
    active boolean NOT NULL,
    password character varying(255),
    username character varying(255),
    firstname character varying(255),
    lastname character varying,
    middlename character varying
);


ALTER TABLE public.usr OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 24738)
-- Dependencies: 200
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3017 (class 0 OID 32813)
-- Dependencies: 205
-- Data for Name: measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.measurement (id, blood_pressure_upper, is_correct_by_doctor, is_correct_by_patient, pulse_rate, "time", user_id, blood_pressure_lower) VALUES (3, 150, false, false, 22, '2021-08-24 14:41:20', 26, 60);
INSERT INTO public.measurement (id, blood_pressure_upper, is_correct_by_doctor, is_correct_by_patient, pulse_rate, "time", user_id, blood_pressure_lower) VALUES (2, 140, false, false, 43, '2021-08-24 14:41:20', 26, 43);
INSERT INTO public.measurement (id, blood_pressure_upper, is_correct_by_doctor, is_correct_by_patient, pulse_rate, "time", user_id, blood_pressure_lower) VALUES (4, 170, false, false, 89, '2021-08-24 14:41:20', 26, 80);
INSERT INTO public.measurement (id, blood_pressure_upper, is_correct_by_doctor, is_correct_by_patient, pulse_rate, "time", user_id, blood_pressure_lower) VALUES (5, 165, false, false, 99, '2021-08-24 14:41:20', 26, 70);


--
-- TOC entry 3014 (class 0 OID 24812)
-- Dependencies: 202
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3015 (class 0 OID 24820)
-- Dependencies: 203
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_role (user_id, roles) VALUES (1, 'ADMIN');
INSERT INTO public.user_role (user_id, roles) VALUES (2, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (9, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (10, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (11, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (12, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (13, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (14, 'USER');
INSERT INTO public.user_role (user_id, roles) VALUES (18, 'PATIENT');
INSERT INTO public.user_role (user_id, roles) VALUES (-1, 'PATIENT');
INSERT INTO public.user_role (user_id, roles) VALUES (26, 'PATIENT');
INSERT INTO public.user_role (user_id, roles) VALUES (27, 'PATIENT');
INSERT INTO public.user_role (user_id, roles) VALUES (28, 'PATIENT');
INSERT INTO public.user_role (user_id, roles) VALUES (29, 'PATIENT');


--
-- TOC entry 3016 (class 0 OID 24823)
-- Dependencies: 204
-- Data for Name: usr; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (9, true, '34', 'gfg', 'Антон', 'Уорнклиффа ', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (10, true, '1', 'ytyrt', 'Имя', 'Фамилия', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (11, true, 'WEWE', 'WEWE', 'Имя', 'Фамилия', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (12, true, 'WSSX', 'WSXX', 'Имя', 'Фамилия', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (13, true, '', '', '', 'Фамилия', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (14, true, '1', 'kjkkkk', 'gfg', 'Фамилия', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (18, true, '2323', 'ewe', '2323', '3233', '232');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (-1, true, 'qwerty', 'Пользователь', 'Имя', 'Фамилия', 'Отчество');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (1, true, '12', 'admin', 'Админ', 'Админов', 'Админович');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (27, true, '12', 'кук', 'Валентин', 'Иванов', 'Олегович');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (26, true, '12', 'Логиин', 'Надежда', 'Петровна', 'Сходько');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (28, true, '12', 'куку', 'Светлана', 'Петрова ', 'Александровна');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (29, true, '12', 'кук', 'Игорь', 'Сидоров ', 'Константинович');
INSERT INTO public.usr (id, active, password, username, firstname, lastname, middlename) VALUES (2, true, '1', 'u', 'Валентин', 'Калинов', 'Тахирович');


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 201
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 26, true);


--
-- TOC entry 2871 (class 2606 OID 24746)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 2878 (class 2606 OID 32817)
-- Name: measurement measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT measurement_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 24819)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 24830)
-- Name: usr usr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (id);


--
-- TOC entry 2872 (class 1259 OID 24747)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 2881 (class 2606 OID 32822)
-- Name: measurement fk6vgro8mycubdq1j4ugm26p4f2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT fk6vgro8mycubdq1j4ugm26p4f2 FOREIGN KEY (user_id) REFERENCES public.usr(id);


--
-- TOC entry 2879 (class 2606 OID 24831)
-- Name: message fk70bv6o4exfe3fbrho7nuotopf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT fk70bv6o4exfe3fbrho7nuotopf FOREIGN KEY (user_id) REFERENCES public.usr(id);


--
-- TOC entry 2880 (class 2606 OID 32808)
-- Name: user_role user_role_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_fk FOREIGN KEY (user_id) REFERENCES public.usr(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-09-05 12:01:53

--
-- PostgreSQL database dump complete
--

