--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.5

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
-- Name: discussions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.discussions (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    author_id integer NOT NULL,
    category text NOT NULL,
    upvotes integer DEFAULT 0 NOT NULL,
    created_at text NOT NULL
);


ALTER TABLE public.discussions OWNER TO neondb_owner;

--
-- Name: discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.discussions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.discussions_id_seq OWNER TO neondb_owner;

--
-- Name: discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.discussions_id_seq OWNED BY public.discussions.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    owner_id integer NOT NULL,
    skills jsonb,
    members jsonb,
    status text DEFAULT 'open'::text NOT NULL
);


ALTER TABLE public.projects OWNER TO neondb_owner;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO neondb_owner;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO neondb_owner;

--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    bio text,
    avatar text,
    skills jsonb,
    social jsonb
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: discussions id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.discussions ALTER COLUMN id SET DEFAULT nextval('public.discussions_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: discussions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.discussions (id, title, content, author_id, category, upvotes, created_at) FROM stdin;
1	hi	hi	1	Web Development	0	2025-02-10T11:12:26.980Z
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.projects (id, title, description, owner_id, skills, members, status) FROM stdin;
1	hik	jkhjkn	1	["mmnnm"]	[1]	open
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.session (sid, sess, expire) FROM stdin;
QlE-Xjh0_knPAbmQrw0Pc3XIq_0ObRyz	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":1}}	2025-02-12 11:06:56
ErqtC1TaqdhxhSZNw--fu6oV14egViHw	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":4}}	2025-02-12 10:59:50
hlr7ttb2VMHQuVG4RFrQStDBdALBwJRq	{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"},"passport":{"user":6}}	2025-02-13 10:26:32
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

COPY public.users (id, username, password, bio, avatar, skills, social) FROM stdin;
1	spamgow9@gmail.com	cd6b038fc99ff77122c2210625760819a677aafcce5665fb284111bc8ea2c1f3ebfe36e6d8975d2c8c3321030b61677fcae2860b8af02613d9e9f9de68a801fb.26df4d8a71f3824d5a365fd11341774a			{}	{}
2	spamgow@gmail.com	59445cb41ac5a4079c76c7484688a0377eda8fd5815642b60981b32a104de5c5c83a7150d638d51e59374df967c6c35a9ab42f760ad2c2b0eaba8af4304022b3.c113dd404492bbe4a4be5bc5bd1b4e99			{}	{}
4	abhi	3c86b3824f5bc46cf47ddd60609be92ad607aab9b8c5b555a8d7b97b58e754fbc2a0e46d76d522048273753be03fe52c032434873ab05c50edaba92ca6d6c3c1.3bc907ae0ee859827cfc4e88decc29f5	\N	\N	\N	\N
5	R	46e88be82128d9b2cd005a825ca4badee762bec2221a02b99c8cdd88dda1e8f7a7e9d8d73f22d2e9f40a78f2c484b07eb5466e17b60d02fb1c55c8553cc2c164.4e7809e47b0526b9b8080b6b6fca5437	\N	\N	\N	\N
6	jvr883@gmail.com	9685baf615dcc5fffe6e667a4bb47294235b878d216dd0c2746f8c2ea31636807bd711ada571cfce6fe7d83fa7bd9455030e5ad99df6fa885121d72a3efc781f.04a20c59e8a53e2a86a86e2b5cc79516		https://www.google.com/search?sca_esv=4997893477147106&rlz=1C1CHBF_enIN1016IN1016&sxsrf=AHTn8zrPpmV6QiCDqENoaHj_yci1kLtPqQ:1739355802940&q=car&udm=2&fbs=ABzOT_CWdhQLP1FcmU5B0fn3xuWpA-dk4wpBWOGsoR7DG5zJBpwxALD7bRaeOIZxqOFEngzB_O_LYSS4XXpaWwzVPCpGyfWZJNZM94YXT9YDYyu8sXSqhrL12HIXDrJcXcBPVxMprVBzBBo8GpBTOKii_ARewHE9whuTvgqKpWOQ3jE_MfDjmcaUNU5MpOa63pWd-S9AtQjUEKe-W7V3qjyZPFG2EsavEg&sa=X&ved=2ahUKEwjVtJam9b2LAxW5UGcHHTLGG6IQtKgLegQIHBAB&biw=1280&bih=551&dpr=1.5#vhid=baSEjfFr44j6yM&vssid=mosaic	{}	{}
7	tenz	97a72ee3477a938fd04f1672b1fa8bc46dc9783c6a6c9a3b25b1ca472ba4e5719c44fe6215bfcccd169df84017b7bcc91bd9f1127281c634d6537331b10118d7.aff41f563eb0b05c4a7a7afa75e67dce	\N	\N	\N	\N
8	20mis7015	99c4589103c7b6591e0862bcff27e523df89c1dbd5c989a79d46fd435ab76cd76928c7369c2b72a85662bce07f9d04543f702080237db7e347dbc4f9276a546b.956236761e15f77bb16df789c0479864	\N	\N	\N	\N
\.


--
-- Name: discussions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.discussions_id_seq', 1, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: discussions discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

