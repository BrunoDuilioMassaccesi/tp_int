--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2025-07-18 09:26:12

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16456)
-- Name: event_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying,
    display_order integer
);


ALTER TABLE public.event_categories OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16455)
-- Name: event_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_categories_id_seq OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 227
-- Name: event_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_categories_id_seq OWNED BY public.event_categories.id;


--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: event_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer,
    description character varying,
    registration_date_time date,
    attended integer,
    observations character varying,
    rating integer
);


ALTER TABLE public.event_enrollments OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: event_enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_enrollments_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 215
-- Name: event_enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_enrollments_id_seq OWNED BY public.event_enrollments.id;


--
-- TOC entry 226 (class 1259 OID 16447)
-- Name: event_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer,
    name character varying,
    full_address character varying,
    max_capacity character varying,
    latitude integer,
    longitude integer,
    id_creator_user integer
);


ALTER TABLE public.event_locations OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16446)
-- Name: event_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_locations_id_seq OWNER TO postgres;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 225
-- Name: event_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_locations_id_seq OWNED BY public.event_locations.id;


--
-- TOC entry 218 (class 1259 OID 16409)
-- Name: event_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer
);


ALTER TABLE public.event_tags OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16408)
-- Name: event_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.event_tags_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 217
-- Name: event_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_tags_id_seq OWNED BY public.event_tags.id;


--
-- TOC entry 222 (class 1259 OID 16429)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying,
    description character varying,
    id_event_category integer,
    id_event_location integer,
    start_date date,
    duration_in_minutes integer,
    price integer,
    enabled_for_enrollment integer,
    max_assistance integer,
    id_creator_user integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16428)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 230 (class 1259 OID 16465)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying,
    id_province integer,
    latitude integer,
    longitude integer
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16464)
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 229
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- TOC entry 232 (class 1259 OID 16474)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying,
    full_name character varying,
    latitude integer,
    longitude integer,
    display_order integer
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16473)
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.provinces_id_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 231
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16419)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 219
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 224 (class 1259 OID 16438)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    username character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16437)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4679 (class 2604 OID 16459)
-- Name: event_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories ALTER COLUMN id SET DEFAULT nextval('public.event_categories_id_seq'::regclass);


--
-- TOC entry 4678 (class 2604 OID 16450)
-- Name: event_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations ALTER COLUMN id SET DEFAULT nextval('public.event_locations_id_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 16412)
-- Name: event_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags ALTER COLUMN id SET DEFAULT nextval('public.event_tags_id_seq'::regclass);


--
-- TOC entry 4676 (class 2604 OID 16432)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4680 (class 2604 OID 16468)
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- TOC entry 4681 (class 2604 OID 16477)
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 16423)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 4677 (class 2604 OID 16441)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4865 (class 0 OID 16456)
-- Dependencies: 228
-- Data for Name: event_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_categories VALUES (1, 'Tecnología', 1);
INSERT INTO public.event_categories VALUES (2, 'Arte y Cultura', 2);
INSERT INTO public.event_categories VALUES (3, 'Educación', 3);
INSERT INTO public.event_categories VALUES (4, 'Salud y Bienestar', 4);
INSERT INTO public.event_categories VALUES (5, 'Deportes', 5);


--
-- TOC entry 4853 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: event_enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_enrollments VALUES (21, 1, 1, 'Me interesa mucho React', '2025-07-01', 1, 'Participó activamente', 5);
INSERT INTO public.event_enrollments VALUES (22, 1, 2, 'Vengo desde La Plata', '2025-07-02', 1, 'Llegó puntual', 4);
INSERT INTO public.event_enrollments VALUES (23, 2, 3, 'Soy fan del vino', '2025-07-03', 1, 'Muy participativo', 5);
INSERT INTO public.event_enrollments VALUES (24, 3, 4, 'Quiero aprender IA', '2025-07-04', 0, 'No asistió', NULL);
INSERT INTO public.event_enrollments VALUES (25, 4, 5, 'Interesado en historia local', '2025-07-05', 1, 'Buena actitud', 4);
INSERT INTO public.event_enrollments VALUES (26, 5, 6, 'Me encanta la fotografía urbana', '2025-07-06', 1, 'Excelente desempeño', 5);
INSERT INTO public.event_enrollments VALUES (27, 5, 7, 'Voy con amigos', '2025-07-07', 0, 'Faltó sin aviso', NULL);
INSERT INTO public.event_enrollments VALUES (28, 2, 8, 'Vengo de Mendoza', '2025-07-08', 1, 'Educado y puntual', 4);
INSERT INTO public.event_enrollments VALUES (29, 3, 9, 'Primera vez en este tipo de charlas', '2025-07-09', 1, 'Buen participante', 3);
INSERT INTO public.event_enrollments VALUES (30, 1, 10, 'Estoy cursando programación', '2025-07-10', 1, 'Gran aporte técnico', 5);


--
-- TOC entry 4863 (class 0 OID 16447)
-- Dependencies: 226
-- Data for Name: event_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_locations VALUES (1, 1, 'Centro Cultural La Plata', 'Calle 12 N°345, La Plata, Buenos Aires', '100', -34, -58, 1);
INSERT INTO public.event_locations VALUES (2, 2, 'Salón Mar del Plata', 'Av. Colón 1234, Mar del Plata, Buenos Aires', '150', -38, -57, 2);
INSERT INTO public.event_locations VALUES (3, 3, 'Auditorio Córdoba', 'Bv. San Juan 567, Córdoba Capital', '200', -31, -64, 3);
INSERT INTO public.event_locations VALUES (4, 5, 'Centro de Convenciones Rosario', 'Calle Corrientes 890, Rosario', '120', -32, -60, 4);
INSERT INTO public.event_locations VALUES (5, 7, 'Salón Mendoza Sur', 'Av. San Martín 456, Godoy Cruz', '80', -32, -68, 1);


--
-- TOC entry 4855 (class 0 OID 16409)
-- Dependencies: 218
-- Data for Name: event_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4859 (class 0 OID 16429)
-- Dependencies: 222
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.events VALUES (1, 'Taller de React', 'Curso intensivo de desarrollo front-end con React', NULL, NULL, '2025-08-01', 120, 0, 1, 30, 1);
INSERT INTO public.events VALUES (2, 'Cata de vinos', 'Evento gourmet para conocer vinos mendocinos', NULL, NULL, '2025-08-03', 90, 5000, 1, 20, 2);
INSERT INTO public.events VALUES (3, 'Charla sobre IA', 'Debate y exposición sobre la inteligencia artificial', NULL, NULL, '2025-08-05', 60, 0, 1, 100, 3);
INSERT INTO public.events VALUES (4, 'Recorrido histórico', 'Visita guiada al casco antiguo de La Plata', NULL, NULL, '2025-08-10', 150, 2000, 1, 40, 1);
INSERT INTO public.events VALUES (5, 'Workshop de Fotografía', 'Práctica de fotografía urbana en Rosario', NULL, NULL, '2025-08-12', 180, 3500, 1, 25, 4);


--
-- TOC entry 4867 (class 0 OID 16465)
-- Dependencies: 230
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations VALUES (1, 'La Plata', 1, -34, -58);
INSERT INTO public.locations VALUES (2, 'Mar del Plata', 1, -38, -57);
INSERT INTO public.locations VALUES (3, 'Córdoba Capital', 2, -31, -64);
INSERT INTO public.locations VALUES (4, 'Río Cuarto', 2, -33, -64);
INSERT INTO public.locations VALUES (5, 'Rosario', 3, -32, -60);
INSERT INTO public.locations VALUES (6, 'Santa Fe Capital', 3, -31, -60);
INSERT INTO public.locations VALUES (7, 'Godoy Cruz', 4, -32, -68);
INSERT INTO public.locations VALUES (8, 'Villa Mercedes', 5, -33, -65);
INSERT INTO public.locations VALUES (9, 'San Miguel de Tucumán', 10, -26, -65);
INSERT INTO public.locations VALUES (10, 'Ushuaia', 7, -54, -68);


--
-- TOC entry 4869 (class 0 OID 16474)
-- Dependencies: 232
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provinces VALUES (1, 'BA', 'Buenos Aires', -34, -58, 1);
INSERT INTO public.provinces VALUES (2, 'CBA', 'Córdoba', -31, -64, 2);
INSERT INTO public.provinces VALUES (3, 'SFE', 'Santa Fe', -31, -60, 3);
INSERT INTO public.provinces VALUES (4, 'MZA', 'Mendoza', -32, -68, 4);
INSERT INTO public.provinces VALUES (5, 'SL', 'San Luis', -33, -66, 5);
INSERT INTO public.provinces VALUES (6, 'NQN', 'Neuquén', -38, -68, 6);
INSERT INTO public.provinces VALUES (7, 'TDF', 'Tierra del Fuego', -54, -68, 7);
INSERT INTO public.provinces VALUES (8, 'CHU', 'Chubut', -43, -66, 8);
INSERT INTO public.provinces VALUES (9, 'SJ', 'San Juan', -31, -68, 9);
INSERT INTO public.provinces VALUES (10, 'TUC', 'Tucumán', -26, -65, 10);


--
-- TOC entry 4857 (class 0 OID 16420)
-- Dependencies: 220
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4861 (class 0 OID 16438)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Juan', 'Pérez', 'juanp', '1234');
INSERT INTO public.users VALUES (2, 'Ana', 'Gómez', 'anag', 'abcd');
INSERT INTO public.users VALUES (3, 'Lucas', 'Martínez', 'lucasm', 'pass123');
INSERT INTO public.users VALUES (4, 'Sofía', 'López', 'sofial', 'qwerty');
INSERT INTO public.users VALUES (5, 'Diego', 'Fernández', 'diegof', 'contraseña');
INSERT INTO public.users VALUES (6, 'María', 'Rodríguez', 'mariar', 'pass456');
INSERT INTO public.users VALUES (7, 'Carlos', 'Ramírez', 'carlitos', 'clave789');
INSERT INTO public.users VALUES (8, 'Luisa', 'García', 'luisag', 'hola123');
INSERT INTO public.users VALUES (9, 'Tomás', 'Sánchez', 'tomi', 'tompass');
INSERT INTO public.users VALUES (10, 'Valentina', 'Torres', 'valet', 'vale321');


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 227
-- Name: event_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_categories_id_seq', 1, false);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 215
-- Name: event_enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_enrollments_id_seq', 1, false);


--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 225
-- Name: event_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_locations_id_seq', 5, true);


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 217
-- Name: event_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_tags_id_seq', 1, false);


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 229
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 231
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 1, false);


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 219
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4695 (class 2606 OID 16463)
-- Name: event_categories event_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 16416)
-- Name: event_enrollments event_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4693 (class 2606 OID 16454)
-- Name: event_locations event_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 16418)
-- Name: event_tags event_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 16436)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 16472)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- TOC entry 4699 (class 2606 OID 16481)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 16427)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 16445)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 2606 OID 16487)
-- Name: event_enrollments event_enrollments_id_event_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4701 (class 2606 OID 16482)
-- Name: event_enrollments event_enrollments_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4707 (class 2606 OID 16517)
-- Name: event_locations event_locations_id_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_id_location_fkey FOREIGN KEY (id_location) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4702 (class 2606 OID 16492)
-- Name: event_tags event_tags_id_event_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4703 (class 2606 OID 16497)
-- Name: event_tags event_tags_id_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_tag_fkey FOREIGN KEY (id_tag) REFERENCES public.tags(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4704 (class 2606 OID 16502)
-- Name: events events_id_creator_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_creator_user_fkey FOREIGN KEY (id_creator_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4705 (class 2606 OID 16532)
-- Name: events events_id_event_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_category_fkey FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4706 (class 2606 OID 16527)
-- Name: events events_id_event_location_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_location_fkey FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4708 (class 2606 OID 16522)
-- Name: locations locations_id_province_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_id_province_fkey FOREIGN KEY (id_province) REFERENCES public.provinces(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2025-07-18 09:26:12

--
-- PostgreSQL database dump complete
--

