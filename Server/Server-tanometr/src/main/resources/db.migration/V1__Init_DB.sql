
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