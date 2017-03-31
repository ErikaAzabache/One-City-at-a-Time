--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE actions (
    action_id integer NOT NULL,
    user_id integer NOT NULL,
    place_id integer NOT NULL,
    action_code character varying(3) NOT NULL
);


ALTER TABLE actions OWNER TO vagrant;

--
-- Name: actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE actions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions_action_id_seq OWNER TO vagrant;

--
-- Name: actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE actions_action_id_seq OWNED BY actions.action_id;


--
-- Name: actiontypes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE actiontypes (
    action_code character varying(3) NOT NULL,
    action_name character varying(20) NOT NULL
);


ALTER TABLE actiontypes OWNER TO vagrant;

--
-- Name: activations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE activations (
    activation_number bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE activations OWNER TO vagrant;

--
-- Name: activations_activation_number_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE activations_activation_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activations_activation_number_seq OWNER TO vagrant;

--
-- Name: activations_activation_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE activations_activation_number_seq OWNED BY activations.activation_number;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE cities (
    city_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country_code character varying(2) NOT NULL,
    latitud character varying(100),
    longitud character varying(100),
    description text,
    picture character varying(200)
);


ALTER TABLE cities OWNER TO vagrant;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_city_id_seq OWNER TO vagrant;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE cities_city_id_seq OWNED BY cities.city_id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE comments (
    comment_id integer NOT NULL,
    user_id integer NOT NULL,
    place_id integer NOT NULL,
    review text
);


ALTER TABLE comments OWNER TO vagrant;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_comment_id_seq OWNER TO vagrant;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE comments_comment_id_seq OWNED BY comments.comment_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE countries (
    country_code character varying(2) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    latitud character varying(100),
    longitud character varying(100),
    picture character varying(200)
);


ALTER TABLE countries OWNER TO vagrant;

--
-- Name: place_tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE place_tags (
    place_tag_id integer NOT NULL,
    place_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE place_tags OWNER TO vagrant;

--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE place_tags_place_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE place_tags_place_tag_id_seq OWNER TO vagrant;

--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE place_tags_place_tag_id_seq OWNED BY place_tags.place_tag_id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE places (
    place_id integer NOT NULL,
    name character varying(100) NOT NULL,
    city_id integer NOT NULL,
    rating double precision,
    latitud character varying(100),
    longitud character varying(100),
    address character varying(200),
    description text,
    picture character varying(200),
    url_4s character varying(200)
);


ALTER TABLE places OWNER TO vagrant;

--
-- Name: places_place_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE places_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE places_place_id_seq OWNER TO vagrant;

--
-- Name: places_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE places_place_id_seq OWNED BY places.place_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE tags (
    tag_id integer NOT NULL,
    tag_name character varying(50) NOT NULL
);


ALTER TABLE tags OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.tag_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    lastname character varying(100) NOT NULL,
    city_id integer,
    email character varying(64) NOT NULL,
    password text NOT NULL,
    is_activated boolean,
    picture character varying(200),
    description text
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: action_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions ALTER COLUMN action_id SET DEFAULT nextval('actions_action_id_seq'::regclass);


--
-- Name: activation_number; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY activations ALTER COLUMN activation_number SET DEFAULT nextval('activations_activation_number_seq'::regclass);


--
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);


--
-- Name: comment_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY comments ALTER COLUMN comment_id SET DEFAULT nextval('comments_comment_id_seq'::regclass);


--
-- Name: place_tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags ALTER COLUMN place_tag_id SET DEFAULT nextval('place_tags_place_tag_id_seq'::regclass);


--
-- Name: place_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY places ALTER COLUMN place_id SET DEFAULT nextval('places_place_id_seq'::regclass);


--
-- Name: tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags ALTER COLUMN tag_id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY actions (action_id, user_id, place_id, action_code) FROM stdin;
1	2	88	sav
2	4	148	sav
3	2	139	sav
4	2	106	sav
5	9	24	sav
6	4	85	sav
7	2	133	sav
8	7	61	sav
9	7	74	sav
10	8	128	sav
11	3	65	hbh
12	3	139	sav
13	5	143	sav
14	6	83	hbh
15	7	138	sav
16	6	31	sav
17	3	91	hbh
18	4	27	sav
19	2	25	sav
20	2	141	sav
22	11	2	hbh
23	11	3	sav
24	11	149	sav
25	11	147	hbh
26	11	241	sav
27	11	242	hbh
28	11	1	hbh
29	11	4	hbh
\.


--
-- Name: actions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('actions_action_id_seq', 29, true);


--
-- Data for Name: actiontypes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY actiontypes (action_code, action_name) FROM stdin;
sav	Save
hbh	Have been here
\.


--
-- Data for Name: activations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY activations (activation_number, user_id) FROM stdin;
1411427069	1
6606354600	2
8234913878	3
6560422098	4
8797352625	5
9986034449	6
7297160956	7
2325355163	8
7589807935	9
3071990707	10
773646477731	11
\.


--
-- Name: activations_activation_number_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('activations_activation_number_seq', 1, false);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY cities (city_id, name, country_code, latitud, longitud, description, picture) FROM stdin;
1	London	GB	51.50853	-0.12574	\N	\N
2	Cairo	EG	30.06263	31.24967	\N	\N
3	Mumbai	IN	19.07283	72.88261	\N	\N
4	Kolkata	IN	22.56263	88.36304	\N	\N
5	Hong Kong	HK	22.28552	114.15769	\N	\N
6	Tokyo	JP	35.6895	139.69171	\N	\N
7	San Francisco	US	37.77493	-122.41942	\N	\N
8	New York City	US	40.742185	-73.992602	\N	\N
9	Singapore	SG	1.28967	103.85007	\N	\N
10	Stockholm	SE	59.33258	18.0649	\N	\N
11	Cartagena	CO	10.39972	-75.51444	\N	\N
12	Rio De Janeiro	BR	-22.90278	-43.2075	\N	\N
13	Noailles	FR	\N	\N	\N	\N
14	Lima	PE	\N	\N	\N	\N
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('cities_city_id_seq', 14, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY comments (comment_id, user_id, place_id, review) FROM stdin;
1	3	1	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
2	9	1	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
3	3	1	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
4	8	1	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
5	10	1	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
6	6	1	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
7	3	1	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
8	7	1	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
9	7	1	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
10	2	1	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
11	4	2	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
12	7	2	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
13	4	2	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
14	3	2	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
15	4	2	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
16	5	2	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
17	3	2	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
18	9	2	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
19	4	2	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
20	10	2	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
21	2	3	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
22	10	3	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
23	2	3	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
24	10	3	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
25	10	3	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
26	9	3	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
27	6	3	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
28	1	3	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
29	7	3	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
30	8	3	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
31	10	4	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
32	6	4	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
33	10	4	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
34	9	4	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
35	2	4	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
36	9	4	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
37	4	4	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
38	3	4	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
39	2	4	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
40	8	4	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
41	9	5	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
42	10	5	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
43	8	5	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
44	3	5	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
45	3	5	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
46	4	5	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
47	2	5	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
48	7	5	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
49	7	5	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
50	1	5	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
51	2	6	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
52	3	6	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
53	7	6	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
54	4	6	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
55	7	6	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
56	2	6	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
57	7	6	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
58	8	6	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
59	2	6	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
60	9	6	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
61	1	7	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
62	7	7	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
63	5	7	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
64	4	7	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
65	10	7	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
66	1	7	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
67	5	7	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
68	8	7	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
69	5	7	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
70	1	7	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
71	9	8	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
72	6	8	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
73	10	8	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
74	6	8	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
75	1	8	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
76	6	8	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
77	3	8	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
78	9	8	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
79	10	8	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
80	3	8	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
81	6	9	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
82	6	9	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
83	2	9	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
84	4	9	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
85	7	9	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
128	3	13	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
86	10	9	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
87	3	9	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
88	10	9	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
89	10	9	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
90	7	9	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
91	5	10	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
92	9	10	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
93	4	10	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
94	4	10	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
95	3	10	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
96	6	10	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
97	7	10	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
98	5	10	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
99	5	10	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
100	1	10	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
101	10	11	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
102	7	11	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
103	9	11	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
104	3	11	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
105	10	11	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
106	6	11	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
107	6	11	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
108	9	11	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
109	3	11	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
110	1	11	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
111	5	12	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
112	3	12	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
113	10	12	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
114	4	12	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
115	8	12	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
116	2	12	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
117	4	12	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
118	1	12	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
119	10	12	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
120	5	12	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
121	4	13	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
122	2	13	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
123	6	13	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
124	6	13	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
125	2	13	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
126	2	13	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
127	2	13	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
129	4	13	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
130	3	13	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
131	7	14	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
132	2	14	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
133	8	14	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
134	4	14	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
135	7	14	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
136	10	14	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
137	1	14	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
138	7	14	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
139	8	14	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
140	8	14	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
141	2	15	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
142	1	15	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
143	2	15	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
144	1	15	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
145	8	15	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
146	6	15	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
147	5	15	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
148	8	15	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
149	9	15	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
150	1	15	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
151	3	16	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
152	8	16	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
153	6	16	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
154	9	16	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
155	5	16	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
156	2	16	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
157	7	16	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
158	6	16	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
159	10	16	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
160	7	16	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
161	3	17	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
162	8	17	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
163	10	17	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
164	8	17	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
165	1	17	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
166	4	17	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
167	3	17	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
168	5	17	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
169	6	17	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
170	8	17	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
171	2	18	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
172	7	18	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
173	8	18	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
174	5	18	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
175	8	18	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
176	7	18	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
177	10	18	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
178	7	18	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
179	10	18	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
180	1	18	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
181	2	19	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
182	9	19	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
183	6	19	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
184	2	19	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
185	4	19	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
186	5	19	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
187	9	19	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
188	9	19	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
189	10	19	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
190	4	19	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
191	9	20	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
192	2	20	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
193	10	20	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
194	2	20	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
195	1	20	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
196	3	20	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
197	2	20	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
198	6	20	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
199	10	20	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
200	6	20	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
201	8	21	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
202	2	21	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
203	2	21	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
204	3	21	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
205	2	21	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
206	5	21	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
207	10	21	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
208	10	21	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
209	7	21	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
210	10	21	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
211	5	22	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
212	7	22	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
213	1	22	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
214	5	22	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
215	2	22	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
216	8	22	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
217	3	22	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
218	10	22	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
219	10	22	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
220	6	22	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
221	5	23	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
222	9	23	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
223	2	23	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
224	1	23	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
225	2	23	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
226	4	23	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
227	1	23	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
228	5	23	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
229	1	23	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
230	10	23	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
231	5	24	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
232	4	24	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
233	9	24	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
234	1	24	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
235	1	24	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
236	2	24	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
237	9	24	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
238	8	24	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
239	4	24	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
240	7	24	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
241	6	25	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
242	6	25	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
243	10	25	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
244	9	25	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
245	4	25	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
246	6	25	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
247	4	25	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
248	1	25	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
249	6	25	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
250	3	25	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
251	7	26	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
252	5	26	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
253	5	26	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
254	3	26	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
255	8	26	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
298	2	30	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
256	9	26	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
257	6	26	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
258	8	26	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
259	1	26	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
260	7	26	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
261	7	27	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
262	6	27	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
263	10	27	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
264	8	27	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
265	7	27	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
266	7	27	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
267	5	27	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
268	10	27	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
269	5	27	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
270	3	27	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
271	9	28	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
272	1	28	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
273	10	28	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
274	6	28	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
275	3	28	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
276	9	28	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
277	9	28	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
278	7	28	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
279	8	28	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
280	6	28	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
281	5	29	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
282	6	29	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
283	8	29	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
284	10	29	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
285	7	29	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
286	3	29	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
287	5	29	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
288	5	29	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
289	10	29	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
290	2	29	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
291	5	30	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
292	10	30	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
293	9	30	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
294	10	30	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
295	9	30	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
296	10	30	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
297	10	30	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
299	2	30	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
300	9	30	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
301	7	31	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
302	3	31	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
303	1	31	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
304	5	31	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
305	6	31	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
306	6	31	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
307	7	31	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
308	3	31	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
309	5	31	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
310	4	31	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
311	5	32	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
312	4	32	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
313	8	32	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
314	9	32	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
315	7	32	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
316	6	32	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
317	3	32	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
318	4	32	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
319	10	32	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
320	8	32	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
321	4	33	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
322	2	33	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
323	9	33	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
324	8	33	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
325	7	33	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
326	1	33	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
327	1	33	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
328	7	33	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
329	3	33	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
330	5	33	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
331	10	34	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
332	2	34	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
333	3	34	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
334	1	34	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
335	2	34	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
336	4	34	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
337	4	34	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
338	5	34	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
339	1	34	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
340	4	34	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
341	3	35	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
342	8	35	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
343	6	35	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
344	10	35	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
345	10	35	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
346	8	35	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
347	6	35	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
348	9	35	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
349	10	35	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
350	6	35	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
351	1	36	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
352	8	36	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
353	4	36	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
354	4	36	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
355	6	36	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
356	8	36	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
357	9	36	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
358	3	36	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
359	9	36	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
360	10	36	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
361	6	37	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
362	4	37	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
363	6	37	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
364	9	37	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
365	8	37	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
366	10	37	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
367	2	37	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
368	5	37	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
369	2	37	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
370	5	37	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
371	4	38	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
372	5	38	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
373	10	38	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
374	3	38	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
375	7	38	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
376	10	38	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
377	4	38	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
378	8	38	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
379	5	38	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
380	1	38	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
381	6	39	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
382	1	39	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
383	5	39	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
384	5	39	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
385	9	39	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
386	2	39	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
387	2	39	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
388	7	39	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
389	3	39	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
390	7	39	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
391	9	40	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
392	2	40	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
393	10	40	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
394	3	40	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
395	10	40	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
396	9	40	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
397	9	40	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
398	3	40	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
399	2	40	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
400	4	40	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
401	2	41	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
402	4	41	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
403	5	41	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
404	3	41	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
405	6	41	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
406	1	41	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
407	7	41	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
408	3	41	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
409	7	41	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
410	1	41	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
411	7	42	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
412	1	42	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
413	4	42	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
414	8	42	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
415	4	42	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
416	7	42	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
417	5	42	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
418	6	42	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
419	10	42	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
420	7	42	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
421	4	43	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
422	9	43	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
423	8	43	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
424	6	43	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
425	2	43	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
468	2	47	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
426	8	43	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
427	10	43	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
428	3	43	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
429	4	43	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
430	8	43	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
431	6	44	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
432	10	44	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
433	6	44	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
434	4	44	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
435	6	44	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
436	7	44	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
437	4	44	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
438	8	44	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
439	9	44	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
440	6	44	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
441	2	45	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
442	1	45	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
443	4	45	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
444	8	45	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
445	5	45	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
446	2	45	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
447	3	45	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
448	10	45	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
449	3	45	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
450	6	45	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
451	8	46	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
452	1	46	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
453	10	46	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
454	4	46	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
455	10	46	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
456	7	46	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
457	1	46	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
458	9	46	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
459	3	46	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
460	7	46	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
461	9	47	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
462	9	47	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
463	9	47	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
464	1	47	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
465	3	47	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
466	5	47	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
467	2	47	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
469	1	47	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
470	1	47	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
471	4	48	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
472	7	48	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
473	10	48	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
474	9	48	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
475	5	48	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
476	1	48	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
477	4	48	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
478	5	48	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
479	6	48	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
480	9	48	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
481	6	49	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
482	8	49	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
483	3	49	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
484	2	49	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
485	8	49	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
486	9	49	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
487	4	49	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
488	2	49	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
489	1	49	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
490	1	49	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
491	8	50	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
492	2	50	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
493	9	50	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
494	10	50	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
495	10	50	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
496	3	50	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
497	4	50	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
498	7	50	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
499	7	50	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
500	5	50	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
501	1	51	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
502	1	51	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
503	3	51	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
504	2	51	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
505	3	51	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
506	5	51	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
507	6	51	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
508	6	51	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
509	3	51	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
510	5	51	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
511	6	52	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
512	5	52	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
513	8	52	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
514	1	52	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
515	8	52	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
516	6	52	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
517	4	52	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
518	5	52	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
519	7	52	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
520	8	52	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
521	3	53	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
522	5	53	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
523	1	53	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
524	5	53	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
525	7	53	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
526	10	53	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
527	7	53	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
528	9	53	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
529	3	53	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
530	10	53	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
531	3	54	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
532	1	54	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
533	1	54	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
534	9	54	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
535	8	54	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
536	10	54	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
537	2	54	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
538	10	54	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
539	3	54	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
540	6	54	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
541	4	55	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
542	2	55	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
543	5	55	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
544	10	55	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
545	5	55	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
546	2	55	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
547	1	55	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
548	4	55	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
549	10	55	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
550	3	55	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
551	9	56	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
552	8	56	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
553	5	56	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
554	10	56	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
555	4	56	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
556	3	56	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
557	8	56	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
558	6	56	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
559	3	56	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
560	1	56	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
561	2	57	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
562	3	57	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
563	1	57	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
564	9	57	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
565	3	57	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
566	4	57	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
567	2	57	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
568	7	57	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
569	6	57	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
570	6	57	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
571	7	58	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
572	1	58	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
573	2	58	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
574	9	58	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
575	10	58	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
576	3	58	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
577	1	58	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
578	4	58	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
579	9	58	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
580	1	58	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
581	3	59	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
582	10	59	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
583	4	59	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
584	8	59	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
585	1	59	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
586	6	59	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
587	9	59	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
588	5	59	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
589	10	59	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
590	10	59	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
591	1	60	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
592	6	60	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
593	5	60	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
594	7	60	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
595	7	60	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
638	2	64	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
596	10	60	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
597	2	60	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
598	4	60	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
599	3	60	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
600	9	60	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
601	10	61	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
602	8	61	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
603	7	61	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
604	8	61	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
605	10	61	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
606	7	61	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
607	2	61	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
608	10	61	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
609	6	61	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
610	8	61	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
611	10	62	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
612	7	62	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
613	8	62	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
614	4	62	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
615	4	62	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
616	1	62	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
617	5	62	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
618	9	62	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
619	8	62	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
620	2	62	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
621	9	63	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
622	8	63	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
623	3	63	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
624	1	63	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
625	4	63	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
626	10	63	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
627	2	63	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
628	10	63	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
629	9	63	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
630	3	63	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
631	2	64	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
632	8	64	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
633	10	64	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
634	1	64	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
635	4	64	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
636	5	64	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
637	7	64	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
639	8	64	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
640	6	64	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
641	8	65	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
642	2	65	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
643	7	65	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
644	6	65	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
645	1	65	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
646	3	65	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
647	4	65	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
648	8	65	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
649	1	65	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
650	8	65	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
651	7	66	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
652	9	66	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
653	6	66	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
654	2	66	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
655	4	66	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
656	3	66	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
657	3	66	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
658	5	66	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
659	5	66	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
660	9	66	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
661	5	67	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
662	9	67	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
663	7	67	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
664	7	67	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
665	7	67	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
666	7	67	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
667	3	67	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
668	10	67	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
669	5	67	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
670	2	67	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
671	7	68	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
672	6	68	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
673	7	68	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
674	6	68	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
675	8	68	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
676	5	68	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
677	1	68	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
678	2	68	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
679	1	68	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
680	9	68	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
681	2	69	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
682	2	69	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
683	10	69	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
684	1	69	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
685	6	69	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
686	8	69	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
687	5	69	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
688	6	69	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
689	9	69	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
690	10	69	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
691	6	70	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
692	3	70	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
693	5	70	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
694	9	70	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
695	2	70	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
696	9	70	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
697	4	70	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
698	10	70	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
699	1	70	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
700	7	70	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
701	1	71	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
702	9	71	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
703	6	71	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
704	8	71	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
705	4	71	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
706	10	71	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
707	5	71	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
708	5	71	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
709	7	71	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
710	8	71	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
711	2	72	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
712	1	72	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
713	6	72	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
714	4	72	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
715	4	72	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
716	10	72	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
717	9	72	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
718	6	72	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
719	1	72	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
720	4	72	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
721	10	73	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
722	10	73	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
723	9	73	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
724	10	73	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
725	4	73	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
726	1	73	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
727	1	73	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
728	5	73	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
729	6	73	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
730	2	73	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
731	3	74	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
732	1	74	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
733	6	74	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
734	1	74	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
735	5	74	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
736	5	74	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
737	5	74	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
738	7	74	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
739	9	74	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
740	3	74	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
741	2	75	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
742	2	75	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
743	7	75	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
744	2	75	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
745	1	75	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
746	5	75	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
747	6	75	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
748	5	75	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
749	3	75	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
750	1	75	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
751	7	76	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
752	4	76	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
753	10	76	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
754	4	76	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
755	10	76	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
756	5	76	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
757	2	76	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
758	10	76	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
759	5	76	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
760	4	76	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
761	1	77	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
762	7	77	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
763	3	77	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
764	10	77	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
765	9	77	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
808	6	81	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
766	7	77	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
767	2	77	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
768	10	77	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
769	9	77	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
770	10	77	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
771	2	78	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
772	9	78	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
773	6	78	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
774	5	78	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
775	5	78	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
776	1	78	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
777	9	78	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
778	1	78	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
779	6	78	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
780	1	78	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
781	8	79	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
782	3	79	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
783	3	79	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
784	7	79	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
785	2	79	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
786	7	79	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
787	6	79	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
788	8	79	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
789	3	79	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
790	9	79	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
791	2	80	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
792	2	80	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
793	5	80	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
794	5	80	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
795	9	80	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
796	7	80	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
797	6	80	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
798	7	80	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
799	9	80	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
800	8	80	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
801	10	81	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
802	7	81	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
803	4	81	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
804	5	81	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
805	4	81	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
806	9	81	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
807	4	81	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
809	10	81	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
810	3	81	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
811	8	82	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
812	2	82	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
813	3	82	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
814	9	82	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
815	9	82	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
816	8	82	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
817	4	82	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
818	10	82	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
819	1	82	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
820	8	82	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
821	10	83	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
822	3	83	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
823	4	83	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
824	10	83	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
825	9	83	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
826	7	83	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
827	7	83	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
828	7	83	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
829	1	83	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
830	10	83	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
831	1	84	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
832	7	84	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
833	6	84	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
834	9	84	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
835	3	84	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
836	1	84	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
837	7	84	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
838	6	84	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
839	3	84	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
840	7	84	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
841	6	85	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
842	1	85	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
843	2	85	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
844	9	85	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
845	4	85	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
846	2	85	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
847	7	85	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
848	9	85	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
849	9	85	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
850	6	85	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
851	8	86	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
852	10	86	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
853	8	86	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
854	2	86	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
855	7	86	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
856	9	86	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
857	7	86	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
858	10	86	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
859	6	86	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
860	8	86	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
861	10	87	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
862	6	87	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
863	10	87	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
864	4	87	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
865	2	87	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
866	10	87	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
867	2	87	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
868	7	87	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
869	6	87	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
870	2	87	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
871	7	88	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
872	5	88	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
873	9	88	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
874	9	88	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
875	10	88	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
876	7	88	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
877	4	88	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
878	8	88	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
879	2	88	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
880	10	88	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
881	10	89	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
882	3	89	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
883	3	89	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
884	9	89	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
885	10	89	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
886	9	89	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
887	9	89	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
888	6	89	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
889	8	89	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
890	1	89	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
891	6	90	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
892	1	90	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
893	5	90	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
894	7	90	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
895	7	90	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
896	8	90	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
897	10	90	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
898	7	90	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
899	9	90	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
900	5	90	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
901	8	91	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
902	3	91	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
903	1	91	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
904	3	91	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
905	9	91	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
906	10	91	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
907	5	91	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
908	9	91	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
909	5	91	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
910	10	91	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
911	6	92	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
912	6	92	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
913	1	92	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
914	9	92	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
915	6	92	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
916	6	92	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
917	2	92	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
918	8	92	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
919	3	92	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
920	2	92	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
921	2	93	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
922	8	93	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
923	3	93	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
924	4	93	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
925	3	93	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
926	4	93	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
927	8	93	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
928	9	93	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
929	9	93	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
930	5	93	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
931	7	94	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
932	6	94	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
933	10	94	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
934	3	94	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
935	10	94	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
978	5	98	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
936	1	94	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
937	7	94	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
938	4	94	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
939	10	94	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
940	10	94	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
941	2	95	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
942	2	95	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
943	8	95	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
944	4	95	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
945	8	95	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
946	8	95	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
947	10	95	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
948	6	95	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
949	5	95	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
950	8	95	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
951	1	96	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
952	4	96	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
953	2	96	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
954	7	96	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
955	7	96	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
956	1	96	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
957	2	96	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
958	5	96	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
959	4	96	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
960	1	96	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
961	4	97	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
962	8	97	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
963	8	97	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
964	1	97	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
965	10	97	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
966	8	97	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
967	6	97	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
968	7	97	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
969	3	97	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
970	10	97	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
971	5	98	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
972	8	98	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
973	3	98	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
974	4	98	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
975	5	98	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
976	8	98	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
977	2	98	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
979	6	98	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
980	10	98	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
981	10	99	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
982	4	99	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
983	4	99	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
984	6	99	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
985	7	99	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
986	7	99	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
987	6	99	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
988	3	99	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
989	4	99	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
990	5	99	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
991	9	100	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
992	6	100	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
993	3	100	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
994	2	100	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
995	4	100	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
996	4	100	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
997	7	100	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
998	6	100	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
999	7	100	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1000	5	100	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1001	1	101	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1002	4	101	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1003	2	101	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1004	2	101	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1005	6	101	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1006	3	101	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1007	5	101	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1008	7	101	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1009	4	101	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1010	7	101	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1011	8	102	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1012	9	102	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1013	7	102	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1014	5	102	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1015	7	102	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1016	7	102	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1017	4	102	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1018	10	102	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1019	6	102	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1020	4	102	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1021	3	103	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1022	1	103	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1023	1	103	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1024	9	103	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1025	9	103	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1026	10	103	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1027	2	103	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1028	5	103	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1029	6	103	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1030	4	103	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1031	3	104	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1032	6	104	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1033	9	104	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1034	1	104	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1035	6	104	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1036	9	104	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1037	10	104	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1038	4	104	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1039	8	104	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1040	1	104	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1041	7	105	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1042	10	105	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1043	9	105	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1044	4	105	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1045	2	105	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1046	6	105	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1047	1	105	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1048	4	105	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1049	3	105	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1050	1	105	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1051	6	106	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1052	4	106	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1053	3	106	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1054	9	106	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1055	5	106	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1056	1	106	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1057	7	106	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1058	2	106	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1059	10	106	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1060	6	106	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1061	1	107	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1062	6	107	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1063	2	107	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1064	10	107	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1065	9	107	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1066	8	107	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1067	10	107	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1068	8	107	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1069	2	107	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1070	8	107	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1071	3	108	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1072	3	108	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1073	3	108	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1074	2	108	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1075	2	108	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1076	6	108	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1077	10	108	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1078	5	108	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1079	6	108	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1080	10	108	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1081	5	109	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1082	1	109	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1083	9	109	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1084	2	109	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1085	6	109	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1086	3	109	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1087	7	109	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1088	2	109	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1089	7	109	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1090	2	109	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1091	8	110	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1092	5	110	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1093	4	110	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1094	4	110	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1095	7	110	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1096	4	110	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1097	7	110	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1098	5	110	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1099	4	110	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1100	2	110	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1101	7	111	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1102	9	111	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1103	2	111	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1104	5	111	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1105	1	111	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1148	7	115	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1106	8	111	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1107	8	111	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1108	6	111	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1109	5	111	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1110	6	111	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1111	3	112	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1112	4	112	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1113	3	112	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1114	1	112	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1115	3	112	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1116	9	112	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1117	10	112	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1118	9	112	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1119	9	112	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1120	5	112	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1121	1	113	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1122	3	113	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1123	2	113	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1124	10	113	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1125	2	113	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1126	8	113	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1127	8	113	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1128	3	113	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1129	7	113	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1130	10	113	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1131	6	114	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1132	4	114	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1133	10	114	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1134	4	114	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1135	6	114	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1136	6	114	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1137	10	114	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1138	9	114	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1139	5	114	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1140	8	114	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1141	5	115	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1142	9	115	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1143	4	115	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1144	7	115	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1145	7	115	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1146	10	115	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1147	4	115	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1149	10	115	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1150	8	115	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1151	8	116	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1152	1	116	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1153	7	116	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1154	8	116	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1155	5	116	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1156	8	116	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1157	2	116	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1158	3	116	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1159	9	116	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1160	6	116	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1161	6	117	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1162	9	117	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1163	6	117	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1164	9	117	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1165	2	117	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1166	5	117	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1167	9	117	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1168	4	117	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1169	4	117	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1170	1	117	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1171	8	118	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1172	8	118	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1173	10	118	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1174	9	118	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1175	8	118	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1176	5	118	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1177	3	118	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1178	3	118	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1179	9	118	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1180	6	118	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1181	2	119	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1182	10	119	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1183	6	119	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1184	4	119	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1185	8	119	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1186	7	119	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1187	4	119	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1188	10	119	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1189	8	119	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1190	8	119	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1191	2	120	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1192	7	120	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1193	7	120	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1194	6	120	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1195	3	120	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1196	5	120	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1197	7	120	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1198	4	120	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1199	9	120	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1200	4	120	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1201	2	121	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1202	1	121	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1203	7	121	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1204	3	121	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1205	5	121	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1206	3	121	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1207	6	121	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1208	9	121	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1209	7	121	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1210	10	121	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1211	4	122	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1212	6	122	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1213	6	122	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1214	4	122	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1215	9	122	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1216	1	122	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1217	6	122	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1218	5	122	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1219	10	122	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1220	3	122	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1221	5	123	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1222	9	123	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1223	10	123	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1224	3	123	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1225	3	123	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1226	10	123	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1227	8	123	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1228	2	123	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1229	9	123	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1230	4	123	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1231	5	124	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1232	6	124	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1233	7	124	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1234	6	124	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1235	7	124	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1236	2	124	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1237	5	124	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1238	6	124	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1239	6	124	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1240	9	124	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1241	4	125	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1242	1	125	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1243	9	125	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1244	7	125	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1245	10	125	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1246	10	125	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1247	2	125	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1248	8	125	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1249	5	125	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1250	5	125	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1251	5	126	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1252	7	126	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1253	6	126	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1254	1	126	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1255	7	126	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1256	7	126	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1257	3	126	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1258	5	126	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1259	5	126	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1260	4	126	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1261	4	127	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1262	7	127	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1263	5	127	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1264	5	127	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1265	6	127	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1266	5	127	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1267	6	127	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1268	7	127	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1269	1	127	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1270	6	127	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1271	10	128	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1272	8	128	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1273	7	128	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1274	7	128	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1275	2	128	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1318	4	132	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1276	6	128	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1277	8	128	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1278	4	128	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1279	8	128	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1280	1	128	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1281	6	129	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1282	1	129	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1283	5	129	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1284	3	129	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1285	4	129	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1286	3	129	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1287	6	129	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1288	10	129	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1289	9	129	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1290	3	129	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1291	2	130	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1292	3	130	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1293	2	130	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1294	9	130	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1295	5	130	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1296	1	130	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1297	6	130	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1298	1	130	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1299	6	130	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1300	5	130	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1301	10	131	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1302	8	131	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1303	1	131	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1304	10	131	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1305	9	131	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1306	3	131	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1307	9	131	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1308	5	131	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1309	3	131	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1310	3	131	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1311	3	132	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1312	6	132	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1313	2	132	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1314	9	132	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1315	5	132	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1316	5	132	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1317	1	132	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1319	1	132	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1320	10	132	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1321	5	133	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1322	7	133	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1323	3	133	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1324	9	133	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1325	6	133	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1326	5	133	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1327	9	133	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1328	4	133	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1329	3	133	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1330	3	133	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1331	10	134	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1332	3	134	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1333	9	134	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1334	2	134	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1335	8	134	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1336	6	134	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1337	2	134	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1338	6	134	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1339	2	134	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1340	1	134	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1341	1	135	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1342	7	135	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1343	4	135	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1344	3	135	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1345	7	135	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1346	4	135	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1347	3	135	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1348	6	135	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1349	2	135	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1350	5	135	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1351	4	136	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1352	9	136	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1353	3	136	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1354	4	136	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1355	2	136	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1356	7	136	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1357	6	136	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1358	3	136	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1359	8	136	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1360	5	136	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1361	8	137	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1362	2	137	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1363	3	137	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1364	4	137	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1365	10	137	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1366	4	137	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1367	1	137	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1368	7	137	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1369	9	137	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1370	3	137	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1371	1	138	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1372	4	138	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1373	4	138	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1374	3	138	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1375	6	138	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1376	2	138	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1377	5	138	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1378	3	138	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1379	6	138	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1380	1	138	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1381	6	139	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1382	1	139	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1383	1	139	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1384	7	139	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1385	3	139	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1386	1	139	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1387	6	139	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1388	9	139	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1389	6	139	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1390	3	139	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1391	10	140	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1392	10	140	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1393	4	140	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1394	7	140	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1395	2	140	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1396	10	140	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1397	4	140	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1398	7	140	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1399	7	140	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1400	1	140	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1401	4	141	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1402	4	141	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1403	7	141	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1404	2	141	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1405	6	141	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1406	6	141	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1407	9	141	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1408	7	141	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1409	5	141	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1410	10	141	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1411	1	142	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1412	6	142	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1413	8	142	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1414	2	142	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1415	3	142	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1416	1	142	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1417	4	142	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1418	5	142	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1419	6	142	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1420	10	142	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1421	8	143	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1422	10	143	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1423	2	143	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1424	6	143	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1425	10	143	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1426	5	143	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1427	7	143	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1428	10	143	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1429	10	143	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1430	10	143	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1431	7	144	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1432	5	144	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1433	9	144	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1434	6	144	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1435	6	144	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1436	10	144	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1437	8	144	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1438	10	144	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1439	3	144	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1440	8	144	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1441	8	145	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1442	2	145	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1443	6	145	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1444	8	145	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1445	8	145	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1488	4	149	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1446	3	145	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1447	1	145	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1448	5	145	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1449	8	145	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1450	1	145	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1451	5	146	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1452	3	146	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1453	6	146	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1454	1	146	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1455	7	146	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1456	9	146	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1457	8	146	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1458	6	146	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1459	10	146	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1460	8	146	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1461	10	147	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1462	4	147	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1463	3	147	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1464	10	147	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1465	6	147	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1466	5	147	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1467	5	147	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1468	3	147	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1469	9	147	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1470	8	147	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1471	3	148	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1472	5	148	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1473	1	148	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1474	5	148	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1475	4	148	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1476	4	148	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1477	7	148	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1478	3	148	Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!
1479	7	148	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1480	10	148	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1481	7	149	This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!
1482	7	149	So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular.
1483	2	149	So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness.
1484	1	149	A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by.
1485	9	149	I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there.
1486	6	149	Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!
1487	2	149	A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves.
1489	4	149	This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back.
1490	2	149	Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!
1491	11	1	Love this place! I never get tired of jogging or even just walking a little bit around it. London definitely needs the extra oxygen!
\.


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('comments_comment_id_seq', 1491, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY countries (country_code, name, description, latitud, longitud, picture) FROM stdin;
CA	Canada	\N	\N	\N	\N
ST	Sao Tome and Principe	\N	\N	\N	\N
GW	Guinea-Bissau	\N	\N	\N	\N
MC	Monaco	\N	\N	\N	\N
LT	Lithuania	\N	\N	\N	\N
KH	Cambodia	\N	\N	\N	\N
KN	Saint Kitts and Nevis	\N	\N	\N	\N
CH	Switzerland	\N	\N	\N	\N
ET	Ethiopia	\N	\N	\N	\N
AW	Aruba	\N	\N	\N	\N
MF	Saint Martin (French part)	\N	\N	\N	\N
PS	Palestine	\N	\N	\N	\N
AR	Argentina	\N	\N	\N	\N
BO	Bolivia	\N	\N	\N	\N
CM	Cameroon	\N	\N	\N	\N
BF	Burkina Faso	\N	\N	\N	\N
TM	Turkmenistan	\N	\N	\N	\N
GH	Ghana	\N	\N	\N	\N
SA	Saudi Arabia	\N	\N	\N	\N
RW	Rwanda	\N	\N	\N	\N
TG	Togo	\N	\N	\N	\N
JP	Japan	\N	\N	\N	\N
AS	American Samoa	\N	\N	\N	\N
UM	United States Minor Outlying Islands	\N	\N	\N	\N
CC	Cocos (Keeling) Islands	\N	\N	\N	\N
PN	Pitcairn	\N	\N	\N	\N
GT	Guatemala	\N	\N	\N	\N
BA	Bosnia and Herzegovina	\N	\N	\N	\N
KW	Kuwait	\N	\N	\N	\N
JO	Jordan	\N	\N	\N	\N
BL	Saint Barthelemy	\N	\N	\N	\N
DM	Dominica	\N	\N	\N	\N
LR	Liberia	\N	\N	\N	\N
MV	Maldives	\N	\N	\N	\N
JM	Jamaica	\N	\N	\N	\N
OM	Oman	\N	\N	\N	\N
TZ	Tanzania	\N	\N	\N	\N
MQ	Martinique	\N	\N	\N	\N
AL	Albania	\N	\N	\N	\N
GA	Gabon	\N	\N	\N	\N
NU	Niue	\N	\N	\N	\N
VA	Vatican	\N	\N	\N	\N
WF	Wallis and Futuna	\N	\N	\N	\N
NZ	New Zealand	\N	\N	\N	\N
YE	Yemen	\N	\N	\N	\N
JE	Jersey	\N	\N	\N	\N
AD	Andorra	\N	\N	\N	\N
GL	Greenland	\N	\N	\N	\N
WS	Samoa	\N	\N	\N	\N
NF	Norfolk Island	\N	\N	\N	\N
AE	United Arab Emirates	\N	\N	\N	\N
GU	Guam	\N	\N	\N	\N
IN	India	\N	\N	\N	\N
AZ	Azerbaijan	\N	\N	\N	\N
LS	Lesotho	\N	\N	\N	\N
VC	Saint Vincent and the Grenadines	\N	\N	\N	\N
KE	Kenya	\N	\N	\N	\N
MO	Macao	\N	\N	\N	\N
TR	Turkey	\N	\N	\N	\N
AF	Afghanistan	\N	\N	\N	\N
BD	Bangladesh	\N	\N	\N	\N
MR	Mauritania	\N	\N	\N	\N
SB	Solomon Islands	\N	\N	\N	\N
TC	Turks and Caicos Islands	\N	\N	\N	\N
LC	Saint Lucia	\N	\N	\N	\N
SM	San Marino	\N	\N	\N	\N
PF	French Polynesia	\N	\N	\N	\N
FR	France	\N	\N	\N	\N
BM	Bermuda	\N	\N	\N	\N
SK	Slovakia	\N	\N	\N	\N
SO	Somalia	\N	\N	\N	\N
PE	Peru	\N	\N	\N	\N
SZ	Swaziland	\N	\N	\N	\N
BQ	Bonaire Sint Eustatius and Saba	\N	\N	\N	\N
NR	Nauru	\N	\N	\N	\N
SC	Seychelles	\N	\N	\N	\N
NO	Norway	\N	\N	\N	\N
CI	Cote d'Ivoire	\N	\N	\N	\N
CK	Cook Islands	\N	\N	\N	\N
BJ	Benin	\N	\N	\N	\N
KR	Korea	\N	\N	\N	\N
EH	Western Sahara	\N	\N	\N	\N
CU	Cuba	\N	\N	\N	\N
ME	Montenegro	\N	\N	\N	\N
FK	Falkland Islands (Malvinas)	\N	\N	\N	\N
YT	Mayotte	\N	\N	\N	\N
CN	China	\N	\N	\N	\N
AM	Armenia	\N	\N	\N	\N
TL	Timor-Leste	\N	\N	\N	\N
DO	Dominican Republic	\N	\N	\N	\N
MN	Mongolia	\N	\N	\N	\N
UA	Ukraine	\N	\N	\N	\N
BH	Bahrain	\N	\N	\N	\N
TO	Tonga	\N	\N	\N	\N
FI	Finland	\N	\N	\N	\N
LY	Libya	\N	\N	\N	\N
KY	Cayman Islands	\N	\N	\N	\N
CF	Central African Republic	\N	\N	\N	\N
NC	New Caledonia	\N	\N	\N	\N
MU	Mauritius	\N	\N	\N	\N
TJ	Tajikistan	\N	\N	\N	\N
LI	Liechtenstein	\N	\N	\N	\N
AU	Australia	\N	\N	\N	\N
ML	Mali	\N	\N	\N	\N
SE	Sweden	\N	\N	\N	\N
RU	Russia	\N	\N	\N	\N
BG	Bulgaria	\N	\N	\N	\N
US	United States	\N	\N	\N	\N
RO	Romania	\N	\N	\N	\N
AO	Angola	\N	\N	\N	\N
TF	French Southern Territories	\N	\N	\N	\N
TD	Chad	\N	\N	\N	\N
ZA	South Africa	\N	\N	\N	\N
TK	Tokelau	\N	\N	\N	\N
CY	Cyprus	\N	\N	\N	\N
GS	South Georgia and the South Sandwich Islands	\N	\N	\N	\N
BN	Brunei Darussalam	\N	\N	\N	\N
QA	Qatar	\N	\N	\N	\N
MY	Malaysia	\N	\N	\N	\N
AT	Austria	\N	\N	\N	\N
VN	Vietnam	\N	\N	\N	\N
MZ	Mozambique	\N	\N	\N	\N
UG	Uganda	\N	\N	\N	\N
HU	Hungary	\N	\N	\N	\N
NE	Niger	\N	\N	\N	\N
IM	Isle of Man	\N	\N	\N	\N
BR	Brazil	\N	\N	\N	\N
FO	Faroe Islands	\N	\N	\N	\N
GN	Guinea	\N	\N	\N	\N
PA	Panama	\N	\N	\N	\N
CR	Costa Rica	\N	\N	\N	\N
LU	Luxembourg	\N	\N	\N	\N
CV	Cape Verde	\N	\N	\N	\N
BS	Bahamas	\N	\N	\N	\N
GI	Gibraltar	\N	\N	\N	\N
IE	Ireland	\N	\N	\N	\N
PK	Pakistan	\N	\N	\N	\N
PW	Palau	\N	\N	\N	\N
NG	Nigeria	\N	\N	\N	\N
EC	Ecuador	\N	\N	\N	\N
CZ	Czech Republic	\N	\N	\N	\N
BY	Belarus	\N	\N	\N	\N
IR	Iran	\N	\N	\N	\N
DZ	Algeria	\N	\N	\N	\N
SI	Slovenia	\N	\N	\N	\N
SV	El Salvador	\N	\N	\N	\N
TV	Tuvalu	\N	\N	\N	\N
PM	Saint Pierre and Miquelon	\N	\N	\N	\N
MH	Marshall Islands	\N	\N	\N	\N
CL	Chile	\N	\N	\N	\N
PR	Puerto Rico	\N	\N	\N	\N
BE	Belgium	\N	\N	\N	\N
KI	Kiribati	\N	\N	\N	\N
HT	Haiti	\N	\N	\N	\N
BZ	Belize	\N	\N	\N	\N
HK	Hong Kong	\N	\N	\N	\N
SL	Sierra Leone	\N	\N	\N	\N
GE	Georgia	\N	\N	\N	\N
LA	Lao People's Democratic Republic	\N	\N	\N	\N
MX	Mexico	\N	\N	\N	\N
GM	Gambia	\N	\N	\N	\N
PH	Philippines	\N	\N	\N	\N
MD	Moldova	\N	\N	\N	\N
MA	Morocco	\N	\N	\N	\N
HR	Croatia	\N	\N	\N	\N
FM	Micronesia	\N	\N	\N	\N
GG	Guernsey	\N	\N	\N	\N
TH	Thailand	\N	\N	\N	\N
NA	Namibia	\N	\N	\N	\N
GD	Grenada	\N	\N	\N	\N
IQ	Iraq	\N	\N	\N	\N
PT	Portugal	\N	\N	\N	\N
EE	Estonia	\N	\N	\N	\N
UY	Uruguay	\N	\N	\N	\N
GQ	Equatorial Guinea	\N	\N	\N	\N
LB	Lebanon	\N	\N	\N	\N
SJ	Svalbard and Jan Mayen	\N	\N	\N	\N
UZ	Uzbekistan	\N	\N	\N	\N
TN	Tunisia	\N	\N	\N	\N
DJ	Djibouti	\N	\N	\N	\N
HM	Heard Island and McDonald Islands	\N	\N	\N	\N
AG	Antigua and Barbuda	\N	\N	\N	\N
ES	Spain	\N	\N	\N	\N
CO	Colombia	\N	\N	\N	\N
RE	Reunion	\N	\N	\N	\N
BI	Burundi	\N	\N	\N	\N
TW	Taiwan	\N	\N	\N	\N
FJ	Fiji	\N	\N	\N	\N
BB	Barbados	\N	\N	\N	\N
MG	Madagascar	\N	\N	\N	\N
IT	Italy	\N	\N	\N	\N
CW	Curacao	\N	\N	\N	\N
BT	Bhutan	\N	\N	\N	\N
SD	Sudan	\N	\N	\N	\N
NP	Nepal	\N	\N	\N	\N
MT	Malta	\N	\N	\N	\N
NL	Netherlands	\N	\N	\N	\N
MP	Northern Mariana Islands	\N	\N	\N	\N
SR	Suriname	\N	\N	\N	\N
AI	Anguilla	\N	\N	\N	\N
VE	Venezuela	\N	\N	\N	\N
AX	Aland Islands	\N	\N	\N	\N
CX	Christmas Island	\N	\N	\N	\N
ID	Indonesia	\N	\N	\N	\N
IS	Iceland	\N	\N	\N	\N
ZM	Zambia	\N	\N	\N	\N
SN	Senegal	\N	\N	\N	\N
PG	Papua New Guinea	\N	\N	\N	\N
MW	Malawi	\N	\N	\N	\N
TT	Trinidad and Tobago	\N	\N	\N	\N
ZW	Zimbabwe	\N	\N	\N	\N
DE	Germany	\N	\N	\N	\N
VU	Vanuatu	\N	\N	\N	\N
DK	Denmark	\N	\N	\N	\N
KZ	Kazakhstan	\N	\N	\N	\N
PL	Poland	\N	\N	\N	\N
ER	Eritrea	\N	\N	\N	\N
KG	Kyrgyzstan	\N	\N	\N	\N
IO	British Indian Ocean Territory	\N	\N	\N	\N
MS	Montserrat	\N	\N	\N	\N
IL	Israel	\N	\N	\N	\N
MK	Macedonia	\N	\N	\N	\N
LK	Sri Lanka	\N	\N	\N	\N
LV	Latvia	\N	\N	\N	\N
SS	South Sudan	\N	\N	\N	\N
GY	Guyana	\N	\N	\N	\N
SY	Syria	\N	\N	\N	\N
GP	Guadeloupe	\N	\N	\N	\N
HN	Honduras	\N	\N	\N	\N
MM	Myanmar	\N	\N	\N	\N
BV	Bouvet Island	\N	\N	\N	\N
EG	Egypt	\N	\N	\N	\N
NI	Nicaragua	\N	\N	\N	\N
SG	Singapore	\N	\N	\N	\N
RS	Serbia	\N	\N	\N	\N
BW	Botswana	\N	\N	\N	\N
GB	United Kingdom	\N	\N	\N	\N
AQ	Antarctica	\N	\N	\N	\N
CG	Congo	\N	\N	\N	\N
SX	Sint Maarten (Dutch part)	\N	\N	\N	\N
GR	Greece	\N	\N	\N	\N
PY	Paraguay	\N	\N	\N	\N
GF	French Guiana	\N	\N	\N	\N
KM	Comoros	\N	\N	\N	\N
\.


--
-- Data for Name: place_tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY place_tags (place_tag_id, place_id, tag_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	2
7	7	3
8	8	4
9	9	1
10	10	5
11	11	1
12	12	6
13	13	7
14	14	8
15	15	1
16	16	9
17	17	1
18	18	10
19	19	1
20	20	11
21	13	7
22	22	12
23	23	1
24	24	3
25	25	1
26	26	1
27	27	13
28	28	14
29	29	15
30	30	16
31	31	17
32	32	18
33	33	19
34	34	20
35	35	21
36	36	22
37	37	23
38	38	19
39	39	24
40	40	25
41	41	26
42	42	27
43	43	28
44	44	26
45	45	29
46	46	6
47	46	6
48	48	19
49	49	30
50	50	31
51	51	32
52	52	25
53	53	33
54	54	34
55	55	35
56	56	18
57	57	36
58	58	37
59	59	38
60	60	39
61	61	20
62	62	17
63	63	40
64	64	41
65	65	40
66	66	40
67	67	20
68	68	3
69	69	42
70	70	40
71	71	43
72	72	44
73	73	1
74	71	42
75	75	30
76	76	45
77	77	14
78	78	46
79	79	30
80	80	47
81	81	48
82	82	49
83	83	50
84	84	51
85	85	52
86	86	30
87	87	53
88	88	54
89	89	7
90	88	54
91	91	55
92	92	12
93	93	7
94	94	21
95	95	56
96	96	19
97	97	57
98	98	49
99	99	20
100	100	30
101	101	6
102	102	23
103	103	58
104	104	56
105	105	59
106	106	60
107	107	29
108	108	61
109	109	56
110	110	56
111	111	51
112	112	30
113	113	43
114	114	62
115	115	63
116	116	1
117	117	58
118	118	44
119	119	25
120	120	49
121	121	64
122	122	65
123	123	66
124	124	51
125	125	67
126	126	68
127	127	69
128	128	66
129	129	3
130	130	66
131	131	66
132	132	30
133	133	70
134	134	35
135	135	66
136	136	1
137	137	40
138	138	30
139	139	71
140	140	72
141	141	47
142	142	73
143	143	74
144	144	66
145	145	66
146	146	66
147	147	5
148	148	73
149	149	66
150	150	73
151	151	64
152	152	54
153	153	7
154	154	75
155	155	76
156	156	73
157	157	37
158	158	76
159	159	77
160	160	78
161	161	79
162	162	47
163	163	6
164	164	80
165	165	81
166	166	1
167	167	68
168	168	3
169	169	77
170	170	82
171	171	47
172	172	47
173	173	83
174	174	84
175	175	71
176	176	5
177	177	85
178	178	84
179	179	73
180	180	86
181	181	1
182	182	87
183	183	65
184	184	43
185	185	40
186	186	40
187	187	1
188	188	6
189	189	1
190	190	1
191	191	88
192	192	89
193	193	19
194	194	90
195	195	40
196	196	1
197	197	91
198	198	92
199	199	93
200	200	94
201	201	95
202	202	6
203	203	30
204	204	96
205	205	93
206	206	1
207	207	1
208	208	97
209	209	93
210	210	6
211	211	1
212	212	98
213	213	13
214	214	1
215	215	1
216	216	89
217	217	1
218	218	99
219	219	64
220	220	17
221	221	1
222	222	6
223	223	52
224	224	100
225	225	1
226	226	101
227	227	43
228	228	1
229	229	102
230	230	103
231	231	89
232	232	104
233	233	105
234	234	106
235	235	17
236	236	94
237	237	107
238	238	1
239	239	108
240	240	40
241	241	64
242	242	109
243	243	110
244	244	40
245	245	35
246	246	6
247	247	9
248	248	91
249	249	66
250	250	6
251	251	70
252	252	20
253	253	93
254	254	17
255	255	111
256	256	30
257	257	64
258	258	40
259	259	9
260	260	65
261	261	112
262	262	113
263	263	1
264	264	100
265	265	1
266	266	66
267	267	1
268	268	114
269	269	3
270	270	72
271	271	40
272	272	92
273	273	6
274	274	47
275	275	13
276	276	64
277	277	6
278	278	30
279	279	115
280	280	116
281	281	117
282	282	12
283	283	30
284	284	1
285	285	116
286	286	118
287	287	57
288	288	119
289	289	116
290	290	108
291	291	63
292	292	28
293	293	115
294	294	109
295	295	116
296	296	116
297	297	102
298	298	120
299	299	116
300	300	1
301	301	19
302	302	20
303	303	48
304	304	29
305	305	19
306	306	93
307	307	28
308	304	108
309	309	121
310	310	47
311	311	122
312	312	44
313	313	19
314	314	48
315	315	123
316	316	124
317	317	6
318	318	30
319	319	44
320	320	93
321	321	93
322	322	124
323	323	121
324	324	43
325	325	125
326	326	48
327	327	93
328	328	23
329	329	1
330	310	47
331	331	25
332	332	40
333	333	68
334	334	93
335	335	93
336	336	68
337	337	101
338	338	126
339	339	17
340	340	93
341	341	93
342	342	93
343	343	6
344	344	93
345	345	93
346	346	50
347	347	1
348	348	68
349	349	40
350	350	93
351	351	40
352	352	40
353	353	5
354	354	127
355	355	128
356	356	129
357	357	19
358	358	40
359	359	93
360	360	6
\.


--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('place_tags_place_tag_id_seq', 360, true);


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY places (place_id, name, city_id, rating, latitud, longitud, address, description, picture, url_4s) FROM stdin;
1	Hyde Park	1	9.69999999999999929	51.50778087767913	-0.16239166259765625	Serpentine Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51bde126498e9198c22500b0
2	Regent's Park	1	9.69999999999999929	51.52672720162008	-0.15000286207157104	Chester Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51ba92cf498e54a17abde041
3	Hampstead Heath	1	9.69999999999999929	51.56351904151964	-0.16839981079101562	E Heath Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d5a787a8e1059416c37dee1
4	Primrose Hill	1	9.69999999999999929	51.539580748273785	-0.16061717509928597	Primrose Hill Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4fe4b4e2e4b0b34d05aaf854
5	Greenwich Park	1	9.59999999999999964	51.477908339347096	-0.00038623809814453125	Romney Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d5a6e178e105941f4cbdde1
6	Royal Albert Hall	1	9.59999999999999964	51.500982454474055	-0.1774120330810547	Kensington Gore	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d5405e4a64560fcf364b53a
7	National Gallery	1	9.59999999999999964	51.50846740897111	-0.12826068559120496	Trafalgar Sq	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50f3111ae4b09716f37aec53
8	Borough Market	1	9.59999999999999964	51.5054492490639	-0.0905466384816534	Southwark St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f70845be4b0e0075d49dab7
9	St James's Park	1	9.59999999999999964	51.50213114998136	-0.133807886303843	The Mall	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d54110fa64560fc44beb53a
10	Elizabeth Tower (Big Ben) (Big Ben (Elizabeth Tower))	1	9.59999999999999964	51.50089416145207	-0.1254165659909606	Parliament Sq (Bridge St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50f6b55ae4b0833ecce0aee1
11	Victoria Park	1	9.59999999999999964	51.53680634141707	-0.03712177276611328	Grove Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f71a29ae4b0741eb47b2a13
12	Daunt Books	1	9.59999999999999964	51.520446103688144	-0.15188031915267824	83 Marylebone High St (Paddington St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f9918f1e4b06526ab6c55ce
13	Dishoom	1	9.59999999999999964	51.52452361919365	-0.07674786755631656	7 Boundary St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51045cb6e4b0f868863c82e8
14	Maltby Street Market	1	9.59999999999999964	51.499326358394505	-0.07560628325817981	Rope Walk (Maltby St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f7087d8e4b03b575eed01b1
15	Kensington Gardens	1	9.59999999999999964	51.506765853364506	-0.18037319183349607	Exhibition Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/518ffd5a498e1e45fb05f36c
16	Royal Botanic Gardens (Royal Botanic Gardens, Kew)	1	9.5	51.477747968798816	-0.296630859375	Kew Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f466166e4b00ed04a3aae96
17	Holland Park	1	9.5	51.50259867448262	-0.2036762237548828	Ilchester Pl	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d5926175e7788bff9b8849e
18	Somerset House	1	9.5	51.51078575130956	-0.11789917945861816	Strand	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50d04952e4b028fc43581adb
19	Richmond Park	1	9.5	51.438787958727794	-0.2747011184692383	Richmond	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4acde01070c603bbea908eb4
20	Rough Trade East	1	9.5	51.5210642591425	-0.0724947452545166	91 Brick Ln	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e395a0f1fc77951ffe69e4d
21	Dishoom	1	9.5	51.536116098887355	-0.12568378171178593	5 Stable St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5499cf4a498e4a801262bc04
22	British Museum	1	9.5	51.5191665422969	-0.12645354720748264	Great Russell St (btwn Montague & Bloomsbury)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51895de4498eaddda1d26171
23	Battersea Park	1	9.5	51.479512013817555	-0.1569843292236328	Albert Bridge Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d593fc95e7788bf287f859e
24	Tate Britain	1	9.5	51.49077851281006	-0.12711536698936093	Millbank	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d345adc306160fcb63c6b88
25	Clissold Park	1	9.5	51.56076785329521	-0.08901603993015311	Church St (at Green Ln)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ad0984a70c603bb40948eb4
26	Brockwell Park	1	9.5	51.45047677918557	-0.10788917541503906	Dulwich Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f71a164e4b0022eb9ce9cc7
27	Victoria and Albert Museum (V&A)	1	9.5	51.4964175460653	-0.17237235342987087	Cromwell Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51e5c875498e1f652f88d018
28	Scott's	1	9.5	51.50974974863149	-0.15086267845070342	20 Mount St.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4bf404a470c603bb3e1f9cb4
29	Coya London	1	9.5	51.50440036150375	-0.1477551586390948	118 Piccadilly (Old Park Lane)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/515301a4e4b0cffe8e8868b7
30	Scarfes Bar	1	9.5	51.517866	-0.118259	252 High Holborn	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54a078f4498e6a3066ad9098
31	Wekalet Al-Ghouri Arts Center (وكالة السلطان الغوري)	2	9.59999999999999964	30.04567566848748	31.260884598410605	3 Mohamed Abdo St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50d89451e4b0260d14ddbc89
32	NOLA Cupcakes	2	9.40000000000000036	30.061250969543476	31.222657983830015	12 Brazil St (26 of July St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4db97d281e7206c23d1e07da
33	Sultan Hassan Mosque (مسجد السلطان حسن)	2	9.30000000000000071	30.032340231578896	31.256290681546982	Salah Al Dine Sq.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53637e5e498e53731732e5ce
34	Fairmont Nile City	2	9.30000000000000071	30.071842277035007	31.22792959213257	Nile City Towers - 2005 B, Corniche El Nil, Ramlet Boulac	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/500d5682e4b0ba42c2f3c0f5
35	Katameya Heights Golf Resort	2	9.30000000000000071	29.99257186263911	31.40367007211638	New Cairo	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/509d8111e4b044f763b38ad8
36	Pinkberry (پنكبيري)	2	9.30000000000000071	30.07346556282549	31.344516116570894	City Stars, Phase 2	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52ab3d3511d2a16d226ec634
37	Sequoia	2	9.30000000000000071	30.073313528295593	31.222512633123106	Abou Al Feda St.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c3240463896e21e053ae890
38	El Moez St (شارع المعز لدين الله)	2	9.30000000000000071	30.050482085745507	31.261851421837317	Al-Mu'izz ledin Illah Street	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4fba249fe4b08ee511b28513
39	Bayt El Suhaymi (بيت السحيمى)	2	9.19999999999999929	30.052144533649493	31.262058198071596	El Moez St.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50456531e4b0bf160517b272
40	Heliopolis Sporting Club (نادى هليوبوليس الرياضي)	2	9.19999999999999929	30.088689527022275	31.316399792498817	Merghany St (Ahram St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c20093498eef4516759b74
41	Al Azhar Mosque (الجامع الأزهر)	2	9.19999999999999929	30.045969886817048	31.262538811699812	Azhar St. (القاهرة الفاطمية)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e774e0e152037f9e17dd9c2
42	Cairo Opera House (دار الأوبرا المصرية)	2	9.19999999999999929	30.043267865180223	31.22271947830607	El Gezira (Off Opera Sq.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f870f21e4b039b142f6bba2
43	Zööba (زووبا)	2	9.19999999999999929	30.06122788504218	31.219225423273567	26 of July St. (btw Shagaret El Durr & El Saleh Ayoub)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/501c611ee4b04dbcf07765b7
44	Al Haakem Mosque (جامع الحاكم بامر الله)	2	9.19999999999999929	30.05452432583057	31.263617390956583	Al Moez st. (Al Muizz)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5319c6a7498eadeb2d1c9901
45	Il Mulino	2	9.09999999999999964	29.969854	31.275064	7, Road 261, Maadi	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5020205ce4b0997f80697a96
46	Diwan Bookstore (مكتبة ديوان)	2	9.09999999999999964	30.09560364059631	31.341188549995422	105, Abu Bakr El Seddiq St. (Orouba)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50f5e3e4e4b0da51c9953d8e
47	Diwan Bookstore (مكتبة ديوان)	2	9.09999999999999964	30.05925140815715	31.224002838134766	159 26th Of July St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ede787c6c2547bc676c7f9d
48	The Saladin Citadel of Cairo (قلعة صلاح الدين)	2	9.09999999999999964	30.029360254297842	31.261730790138245	Salah Salem Rd. (Salah Salem Rd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50218e6ee4b018f53e1284cb
49	Naguib Mahfouz Cafe (مقهى نجيب محفوظ)	2	9.09999999999999964	30.047772219421613	31.26221626996994	Al Husain	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f9691c0e4b087d33ee2339e
50	The Platform	2	9.09999999999999964	29.974344107380006	31.234319000413976	Corniche El Maadi	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52c42ae2498e8f9bf4199f11
51	Bubblicious	2	9.09999999999999964	30.065052606785844	31.21726311670449	6A Ismail Mohamed St. (Bahgat Ali)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50845244e4b0d5064c204e10
52	Gezira Sporting Club (نادي الجزيرة الرياضي)	2	9.09999999999999964	30.05324440403166	31.22396613215141	15 Sarayah El Gezira Street	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/506ec4ede4b0748e04dd698a
53	Zawya Art House Cinema (Zawya Art House Cinema | زاوية)	2	9	30.050047438553626	31.238852287188497	4 Abd El Hamid Said St. (Talaat Harb St.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5363cede498e537317435d81
54	Nile City Sky Pool	2	9	30.071797288061852	31.227795457487385	Nile City Tower - 2005 B Corniche El Nil - Ramlet Beaulac	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51a0b91e498e30596387c8cd
55	KidZania Cairo	2	9	30.031193475996897	31.4051213246491	The Ring Road, Taha Hussein St. South of The Police Academy 5th District, New Cairo	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53c908b3498e3cd402718c7f
56	NOLA Cupcakes | نولا (نولا)	2	9	29.958720868588678	31.259532150010997	84, Rd 9 (Rd 81)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/502677d7e4b0dd4acc35f04b
57	Khan Al-Khalili (خان الخليلي)	2	9	30.047091750692303	31.261991135548918	Islamic Cairo - Cairo, Egypt	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52de413911d22d96051dc485
58	Cairo Jazz Club	2	9	30.061940258728466	31.211834458042194	187, 26th of July street (Sphinx Sq. Agouza)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ff1920ce4b0ccc7764144c7
59	Left Bank	2	9	30.073034918695033	31.221981542482556	53 Abou El Feda St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f6d9c70e4b0ca47b111be07
60	Mori Sushi	2	9	30.057988518777446	31.217479705810547	19 El Gabalaya St.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50fd7cd6e4b0ba414f6d5a1a
61	Taj Mahal Palace & Tower	3	9.5	18.922354859453687	72.83346856352783	Apollo Bunder (P. Jetha Singh Ramchandani Marg)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f0163fce5faf2869d2edb77
62	Prithvi Theatre	3	9.40000000000000036	19.106020521599856	72.8260087966919	Church Road (Juhu)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5098d1d7498e20f69f3719a9
63	Nariman Point	3	9.40000000000000036	18.92918335830556	72.82223224639893	Nariman Point (Dorabji Tata Road)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f6875a2e4b0f8b5d45aa427
64	Hard Rock Café Mumbai	3	9.30000000000000071	19.007120453676198	72.8292795707588	Pandurang Budhkar Marg (Bombay Dyeing Mill Compound)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b1219db70c603bb82248fb4
65	Worli Sea Face	3	9.30000000000000071	19.009216497075652	72.8150224685669	Worli (Khan Abdul Gaffar Khan Road)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f687331e4b05eede50de473
66	Marine Drive	3	9.30000000000000071	18.94178483611529	72.82277668061836	Marine Drive	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b4f39de70c603bba24f90b4
67	The Westin Mumbai Garden City	3	9.30000000000000071	19.17263507417028	72.86040679581922	International Business Park, Oberoi Garden City (Off Western Express Highway)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4fcdb69ae4b0ac5f60431c5f
68	Jehangir Art Gallery	3	9.30000000000000071	18.92757321510909	72.83151832515472	161 Mahatma Gandhi Road (Kala Ghoda)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5151ea56e4b02da134241626
69	Narayan Dosa	3	9.30000000000000071	18.957440451574335	72.81329611473541	Parmanand Building, French Bridge (Opera House)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5205b2b1498e7bbf3e5cef2f
70	Bandstand Promenade	3	9.19999999999999929	19.046946970470685	72.81991481781006	Bandra West (Byramji Jeejobhoy Rd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/517eb3df498e0a550b10e282
71	Candies	3	9.19999999999999929	19.06115067399369	72.82672921212136	Union Park, Pali Hill (St. Andrews Rd.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/517bd5b6e4b03ec765a20316
72	Doolally Tap Room	3	9.19999999999999929	19.049346395784823	72.82899684000584	Shop 5&6, Geleki (ONGC Colony)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5597d600498e16dee2344d39
73	Jogger's Park	3	9.19999999999999929	19.059728381291716	72.82205540884804	Carter Road (Bandra West)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5115962ce4b034f50b7c7d98
74	Candies	3	9.19999999999999929	19.070344638889228	72.82630799648008	Union Park, Bandra West (Near Carter Road)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ed56e556c2528aaaec06bd1
75	Café Zoe	3	9.19999999999999929	19.000519856775945	72.83026047083173	Todi/Mathuradas Mills Compound (NM Joshi Marg, Lower Parel)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f88820ce4b047d84944cf49
76	Mahalaxmi Race Course (Royal Western India Turf Club)	3	9.19999999999999929	18.980534507963622	72.81858750447056	Mahalaxmi Race Course	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5106ed0ae4b0120cec17bf5f
77	Mahesh Lunch Home	3	9.19999999999999929	19.103710205271224	72.82686769381735	Juhu Tara Rd, Juhu (next to tulip star)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53649abc498e0a332f83ea25
78	Indigo Deli	3	9.19999999999999929	19.061760051790852	72.82998351121061	Pali Hill (Bandra)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52519f69498eb2e6085f1f3a
79	Café Mondegar	3	9.09999999999999964	18.924053150474474	72.83211350440979	Metro House, 5-A Shahid Bhagat Singh Road (Near Regal Cinema)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/500ea9d2e4b0878eb5b847a9
80	Starbucks	3	9.09999999999999964	18.932225624611906	72.83378013862767	10, Elphinstone Building, Veer Nariman Rd. (Horniman Circle)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/508836a9e4b09049870acc03
81	Natural's Ice Cream Parlour	3	9.09999999999999964	18.93469714763862	72.82414997618469	Marine Drive	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5239189511d2373871958abf
82	High Street Phoenix	3	9.09999999999999964	18.994966958554343	72.82503247261047	Senapati Bapat Marg (Lower Parel)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4da291b37c1d4eb9712319c6
83	Ram Ashraya	3	9.09999999999999964	19.028008003189164	72.85174190998077	Near Matunga Central Railway Station, Matunga (Bhandarkar Road, L. Napoo Road)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50014dffe4b0a4b26cc3f291
84	PVR Cinemas	3	9.09999999999999964	19.173972270272255	72.86033756452709	Oberoi Mall, Off Western Express Highway (Goregaon (East))	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d592f3323e0a0935ac14149
85	National Centre for the Performing Arts (NCPA)	3	9.09999999999999964	18.92563130239702	72.81986117362976	Nariman Point (NCPA Marg)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52a1ca8411d279d3c1f7416d
86	Prithvi Cafe	3	9.09999999999999964	19.10618823486576	72.82581753899608	Juhu Church Road	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d7e454ff635236a74b26416
87	Britannia & Co.	3	9.09999999999999964	18.93474562063126	72.83998270817887	11 Sprott Rd., Ballard Estate (Shiv Sagar Ram Gulam Marg)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f016b175c5c51dd2fd14556
88	Theobroma	3	9.09999999999999964	18.919122848967582	72.82933150086151	Shop 24, Cusrow Baug, Colaba Causeway (Shahid Bhagat Singh Road)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4be47fef70c603bbae9a9ab4
89	Swati Snacks	3	9.09999999999999964	18.96641305313836	72.81365387860524	Karai Estate, Tardeo Road (Opp Bhatia Hospital)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cc723b9c844721e4bbaf801
90	Theobroma	3	9.09999999999999964	19.065375195311677	72.83374551919181	29/30, Link Square Mall, (Off Linking Road, Bandra (W))	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cef7e2df98ba0904bccc573
91	Eden Garden	4	9.30000000000000071	22.564541597977065	88.34329605102539	BBD Bagh	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/525d22f311d2620bc6f8c512
92	Victoria Memorial	4	9.09999999999999964	22.545844129353117	88.34289036897952	1, Queen's Way	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/519e0c57498eb6f277a4cd03
93	Peter Cat	4	9.09999999999999964	22.552240637568158	88.35258392817117	18, Park St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e771aa188775d593eacca27
94	Royal Calcutta Golf Club (RCGC)	4	9	22.494599652615197	88.35106648888241	18, Golf Club Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50ced969e4b0f94b3ff67333
95	Golden Joy	4	8.80000000000000071	22.545537663981865	88.38752031326294	50/1, Matherswartala Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51acb7de498ed257e83c6351
96	Princep Ghat	4	8.69999999999999929	22.556159580665305	88.33067893981932	Strand Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50bdc134e4b0732f1a225b51
97	The Blue Poppy	4	8.69999999999999929	22.548476519295296	88.35133678665171	4/1, Middleton St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/57db820e498e6a2a8f174e39
98	Acropolis Mall	4	8.69999999999999929	22.514754629216785	88.39310829151978	1858/1, Rajdanga Main Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/588dcc4be309e179e6ef98d5
99	Taj Bengal	4	8.59999999999999964	22.53772924116422	88.3342570066452	34B, Belvedere Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c3f02998d99b71373041b06
100	The Coffee Bean & Tea Leaf	4	8.59999999999999964	22.538635144217853	88.35137472304561	Forum Mall	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50bda94ce4b0c7b81be1679c
101	Starmark	4	8.59999999999999964	22.50172323665606	88.36167796422644	South City Mall	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d04fd2ae8d85941996b2ea6
102	Aqua	4	8.59999999999999964	22.55458571437324	88.35217612159236	The Park (at The Park hotel)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5301148911d262c185bf388a
103	Jai Hind Dhaba	4	8.59999999999999964	22.533002354389474	88.35317194461823	41/1A, Sarat Bose Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e05ff8eaeb74c399106ce6a
104	Big Boss	4	8.59999999999999964	22.546425041122074	88.38801995103512	54C, Matheswartala Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/524ecdbb11d21ea15ac63cfb
105	Maidan	4	8.59999999999999964	22.54898441562954	88.34808361715235	Kolkata	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/582022cd38faeb02717e0809
106	Girish Chandra Dey & Nakur Chandra Nandy	4	8.59999999999999964	22.59603964813232	88.36748519805334	56, Ramdulal Sarkar St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5187970e498e9011586d5304
107	Spaghetti Kitchen	4	8.59999999999999964	22.538580631836147	88.35148378999273	Forum Mall	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5220374511d2b0341d350fe4
108	Saltlake Swimming Pool	4	8.5	22.59604391328037	88.4176254272461	BF Block	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/503f16fde4b075a92511a261
109	Red Hot Chilli Pepper	4	8.5	22.529058203445924	88.35561275482178	26/2, Ballygunge Circular Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54d1182c498e47ac98ecd81b
110	Beijing Restaurant	4	8.5	22.546462379048837	88.3871149784587	77/1, Christopher Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f7b1672e4b0ddbcd4c9e66b
291	Akkurat	10	9.30000000000000071	59.319644425962025	18.068883622738515	Hornsgatan 18	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4fbfe663e4b0bccbf57aeb3d
111	INOX	4	8.5	22.570840827748093	88.40109965901357	89C, Maulana Abdul Kalam Azad Sarani (at Swabhumi)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f8f9dbbe4b03376fccae1ad
112	Cafe Coffee Day	4	8.40000000000000036	22.577618905113656	88.39043855667114	P-183A, C. I. T. Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/544bef36498e86d59158985f
113	Flurys	4	8.40000000000000036	22.552696115512873	88.35270721777539	18, Park St (Sir William James Sarani)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d1cfd64c03c594138f645cc
114	Nocturne	4	8.40000000000000036	22.544447682246673	88.35670709609985	31, Shakespeare Sarani	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5052f9b1e4b0f42fb5dd7240
115	Blue & Beyond	4	8.30000000000000071	22.559265742236903	88.35312366485596	Hotel Lindsay	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5234cf7811d24ec6991f317d
116	Deshapriya Park	4	8.30000000000000071	22.518394558202573	88.35317730903624	5/2, Deshapriya Pk East	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/55dabe49498e79e0530dc555
117	Balwant Singh's Eating House	4	8.30000000000000071	22.53777878838665	88.34413826465607	10/B, Harish Mukherjee Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5026ad80e4b0c75a158b80a9
118	Opium	4	8.30000000000000071	22.568748294488813	88.43420043331902	J2, Block GP, Sector V, Salt Lake	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/523463da11d2f50ad2743378
119	Tollygunge Club	4	8.30000000000000071	22.495643246926846	88.34323660490969	Kolkata	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d7a4bdfe540f04d753f10dc
120	South City Mall	4	8.30000000000000071	22.501753624460576	88.36177752337967	375, Prince Anwar Shah Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ca376ddc1f1ef3bef6890a4
121	Nan Lian Garden	5	9.5	22.339663323718344	114.20401995515398	60 Fung Tak Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5250e59911d2cc0d5860c883
122	Morning Trail, The Peak	5	9.5	22.2780082676673	114.14443177978094	Harlech Rd and Lugard Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5687e176498eaebe398e9372
352	Pedra do Leme	12	9.5	-22.962776442469828	-43.16471390986915	Leme	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5122a1a2e4b0293c88080d3a
123	Toy Story Land	5	9.40000000000000036	22.310369992285068	114.039779214547	Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ea8e598b8f7d2a521a92c8d
124	Broadway Cinematheque (百老匯電影中心)	5	9.40000000000000036	22.310716183194028	114.16890263557434	G/F, Prosperous Garden, 3 Public Square St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5195443a498edbf8a550bc56
125	The Asia Society Hong Kong Center 亞洲協會香港中心	5	9.40000000000000036	22.27591114063176	114.1654487911651	9 Justice Dr	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/516b8c6fe4b010e0c0352a85
126	Victoria Peak (太平山)	5	9.30000000000000071	22.271138338877577	114.14992997222568	Peak Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50b4e4d9e4b0f6a10aa028ae
127	Samsen 泰麵	5	9.30000000000000071	22.274093	114.174093	G/F, 68 Stone Nullah Lane	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/589ef12004f4d77ed036e2ec
128	Big Grizzly Mountain Runaway Mine Cars	5	9.19999999999999929	22.310113333685624	114.04193951519044	Grizzly Gulch, Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54c49b79498e64b8cdef4360
129	ArtisTree	5	9.19999999999999929	22.286708	114.212735	1/F, Cornwall House, Taikoo Place, 979 King's Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/517fdb5fe4b06e1ee7696897
130	Mickey's PhilharMagic	5	9.19999999999999929	22.312061103888105	114.04047310352325	Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5277cd4c498e0d29857374f9
131	Adventureland	5	9.19999999999999929	22.312498442831586	114.04188144272356	Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5279086d498e9152e02cd000
132	Café Gray Deluxe	5	9.19999999999999929	22.277784	114.165378	49/F, Upper House, Pacific Place, 88 Queensway	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51be6280498e40022fa144eb
133	Hong Kong Park Aviary 香港公園觀鳥園	5	9.19999999999999929	22.27714	114.161399	Hong Kong Park	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b4c9b2870c603bbbacf8fb4
134	Hong Kong Disneyland (香港迪士尼樂園)	5	9.19999999999999929	22.31331767425492	114.04389074586591	Fantasy Rd (Penny's Bay)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e1ad9a7636529dcc13b782a
135	Sleeping Beauty's Castle	5	9.19999999999999929	22.312768364230536	114.04185240648741	Fantasyland, Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c985bd498e805f34b8ba62
136	Hong Kong Park	5	9.19999999999999929	22.27769953093909	114.16185379028319	19 Cotton Tree Dr	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5084cf11e4b0d2d6651e5550
137	The Sky Terrace 428 凌霄閣摩天臺428	5	9.19999999999999929	22.271315676638288	114.1500198841095	The Peak Tower, 128 Peak Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5188a0cf498e470e92b650dd
138	NOT Specialty Coffee	5	9.09999999999999964	22.279719808343184	114.17888290047385	324 Jaffe Rd (btwn Marsh & Tonnochy Rd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/562dc9d6498e4b2dbb44df93
139	Din Tai Fung (鼎泰豐)	5	9.09999999999999964	22.2976732545756	114.16944980621338	Shop 130, 3/F, Silvercord, 30 Canton Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50db27abe4b0b7ab9cc1dd4b
140	Shing Mun Reservoir	5	9.09999999999999964	22.38727777777778	114.14825	Shing Mun Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/570e2be8498e8d1c226055a8
141	Winstons Coffee	5	9.09999999999999964	22.28695648501287	114.1443156609422	213 Queens Rd W	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5712f616498ecfc33f311668
142	Yardbird	5	9.09999999999999964	22.28360160666072	114.15011376142502	33-35 Bridges St (at Aberdeen St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e605f6b1520355eb67a351b
143	Pure Yoga	5	9.09999999999999964	22.283033302292747	114.15579386198564	2/F, Asia Standard Tower, 59-65 Queen's Rd C	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5386ada5498e6b709bd94c83
144	Flash	5	9.09999999999999964	22.234606358005475	114.17110928025497	Ocean Park Hong Kong	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50f28caee4b0dbfd2234f4f1
145	Fantasyland	5	9.09999999999999964	22.312324131143953	114.0404462814331	Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52009e3a498ef1acdc45b09d
146	Tomorrowland	5	9.09999999999999964	22.313536503714015	114.04192790069763	Hong Kong Disneyland	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/57e759da498ec357e4315d3a
147	Tian Tan Buddha (Giant Buddha) (天壇大佛)	5	9	22.253953	113.905011	Po Lin Monastery, Ngong Ping Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f1d9acfe4b03543a3844660
148	Ronin	5	9	22.284359575185206	114.15273419844749	8 On Wo Ln	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5304d5f3498ef560ddc4b9b4
149	Hair Raiser 動感快車	5	9	22.234557725134476	114.17187561782718	180 Wong Chuk Hang Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50f25623e4b0bf1338498328
150	Sake Bar Ginn	5	9	22.28110535076267	114.1552539228899	Unit 4C, Ho Lee Commercial Bldg, 38-44 D'Aguilar St	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5188fe82498e495f1f7631da
151	Shinjuku Gyoen (新宿御苑)	6	9.59999999999999964	35.68504754570482	139.70957815647125	内藤町11	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e5774eb6365d314184c14d7
152	Aigre Douce (エーグル ドゥース)	6	9.59999999999999964	35.722390409498196	139.70065794825427	下落合3-22-13	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54699cf8498eacc105266d41
153	shiva curry wara	6	9.5	35.64606092692241	139.66971625881217	太子堂4-28-6 (サダン大田 2F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/57a226ef498ec735357b10df
154	Nui. | HOSTEL & BAR LOUNGE	6	9.5	35.70388526685761	139.79361507181764	蔵前2-14-13	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/533c37d4498e513bed1b719c
155	Taiyaki Wakaba (たいやき わかば)	6	9.5	35.686004	139.72684800000002	若葉1-10	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/520b4c0d11d2bdc4d7598bc1
156	Gohanya Isshin (ごはんや 一芯 代官山)	6	9.5	35.64734910400587	139.7018051147461	猿楽町30-3 (ツインビル代官山A棟 B1F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/57063d6e498e6141aa29eeac
157	Blue Note Tokyo	6	9.5	35.661129621679365	139.71617370843887	南青山6-3-16 (ライカビル B2F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b79667070c603bbd04e92b4
158	Himitsudo (ひみつ堂)	6	9.5	35.7273531782387	139.7665697336197	谷中3-11-18	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51f4bb11498eb42cc57da9ed
159	Maruka (丸香)	6	9.5	35.696708664949284	139.76013511419296	神田小川町3-16-1 (ニュー駿河台ビル 1F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/520453e7498eaa7f051a2d97
160	Saya no Yudokoro (前野原温泉 さやの湯処)	6	9.5	35.77083028340486	139.69238630223276	前野町3-41-1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50f2b686e4b04eb64493249c
161	Jomon (ジョウモン 六本木店)	6	9.40000000000000036	35.66139218604258	139.73280319394547	六本木5-9-17 (藤森ビル 1F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/525022e111d2160fb4c93639
162	FUGLEN TOKYO	6	9.40000000000000036	35.66663201080257	139.69242006540298	富ヶ谷1-16-11	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4faf5f0fe4b01d7a9060d58c
163	TSUTAYA BOOKS (代官山 蔦屋書店)	6	9.40000000000000036	35.64905190280918	139.69973050902777	猿楽町17-5 (代官山T-SITE 蔦屋書店 1-3号館)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f017ed129c201c6fed78daa
164	Gyuzo (焼肉問屋 牛蔵)	6	9.40000000000000036	35.73609834511769	139.6291183668992	貫井3-10-2	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53e5a6f2498e7cd4f411e066
165	Meiji Jingu Shrine (明治神宮)	6	9.40000000000000036	35.67620199564515	139.69936966896057	代々木神園町1-1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e57740e6365d314184c1461
166	Inokashira Park (井の頭恩賜公園)	6	9.40000000000000036	35.699917970910036	139.57785426133182	御殿山1-18-31	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4df02c73d22d4336871680ec
167	Top of Mt. Takao (高尾山 山頂)	6	9.40000000000000036	35.62511993216723	139.24365766346455	高尾町 (高尾山)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b6ee39770c603bbabb991b4
168	21_21 DESIGN SIGHT	6	9.40000000000000036	35.667477492825796	139.73035991191864	赤坂9-7-6 (東京ミッドタウン ガーデン内)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e57743e6365d314184c1489
169	Oniyamma (おにやんま)	6	9.40000000000000036	35.625569126355785	139.72379378282707	西五反田1-6-3	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51b4735d498e2b54b44031f6
170	Tensuke (天すけ)	6	9.40000000000000036	35.705895053151664	139.64874873366043	高円寺北3-22-7 (プラザ高円寺 1F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/56c4794d498ef80b9422a2a5
171	Little Nap COFFEE STAND	6	9.40000000000000036	35.67212312601507	139.6906015276909	代々木5-65-4	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/523f317911d2a15c3f2021b5
172	Onibus Coffee 中目黒	6	9.40000000000000036	35.6432349	139.6980934	上目黒2-14-1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/56a49003498e48f84943da8c
173	寿湯	6	9.40000000000000036	35.712227	139.78292098	東上野5-4-17	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4fcc37c3e4b05a5ebcc4388c
174	Yamabe (とんかつ 山家 上野店)	6	9.40000000000000036	35.70869064331055	139.77389526367188	上野4-5-1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/535de00111d2ba5e33884a92
175	Harajuku Gyoza Lou (原宿餃子楼)	6	9.40000000000000036	35.66753472567976	139.70619795522765	神宮前6-2-4 (岡島ビル)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52230ad411d2b60cd9422719
176	Tokyo Tower (東京タワー)	6	9.40000000000000036	35.65866812492017	139.74566118686639	芝公園4-2-8	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5192f208498eabb16bd4611e
177	Ramen Jiro (ラーメン二郎 ひばりヶ丘駅前店)	6	9.40000000000000036	35.74994154	139.54345155	谷戸町3-27-24 (ひばりヶ丘プラザ 1F)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/524e69e2498ea6675164c080
178	Tonkatsu Tonki (とんかつ とんき 目黒本店)	6	9.40000000000000036	35.633609808690444	139.71428006887436	下目黒1-1-2	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e4b1f7a6365dbba614df103
179	Ohitsuzen Tanbo (おひつ膳 田んぼ 代々木本店)	6	9.40000000000000036	35.682386	139.699878	代々木1-41-9	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/513ac609e4b0b36efd066874
180	Senso-ji Temple (浅草寺)	6	9.40000000000000036	35.71385729774461	139.79665155656974	浅草2-3-1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4dc44b9e922ef0b112554fe9
181	Golden Gate Park	7	9.69999999999999929	37.76878957103581	-122.4819052219391	501 Stanyan St (btwn Fulton St & Lincoln Way)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/512520dce4b07a4d99d469ec
182	Flora Grubb Gardens	7	9.69999999999999929	37.73961925	-122.39023187	1634 Jerrold Ave	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50d11dcde4b01474e0c84488
183	Lands End	7	9.69999999999999929	37.78315503056424	-122.51118555665016	El Camino Del Mar (at Point Lobos Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4dd54524b3adf8876d22066a
184	Neighbor Bakehouse	7	9.69999999999999929	37.759746	-122.38823	2343 3rd St (at 20th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5512f334498e4a0186f5b0aa
185	Twin Peaks Summit	7	9.69999999999999929	37.75457863421966	-122.44648882852353	100 Christmas Tree Point Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ee235060e61689f53b80baf
186	Lands End Lookout	7	9.69999999999999929	37.7800419794306	-122.51151363121903	22 Merrie Way (at Point Lobos Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52deec3311d2b85aa18f3ec6
187	Bernal Heights Park	7	9.59999999999999964	37.74326497795579	-122.41495681987165	10 Bernal Heights Blvd (at Anderson St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/554bc2d8498e9fd13b47fbe6
188	Green Apple Books	7	9.59999999999999964	37.782960004647364	-122.46485710144043	506 Clement St (btwn 6th & 7th Ave.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d8cc70e62f1dcb325c26912
189	Presidio of San Francisco	7	9.59999999999999964	37.79642406344077	-122.46150970458984	Golden Gate National Recreation Area	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ebab0afc2ee8d9019815f40
190	Crissy Field	7	9.59999999999999964	37.80535063771921	-122.4549757444062	1199 East Beach (Golden Gate National Recreation Area)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e5eb8a581dc82bf11cc579a
191	Good Vibrations	7	9.59999999999999964	37.763086	-122.421665	603 Valencia St (at 17th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4dd5513db3adf8876d224daa
192	The Olympic Club	7	9.59999999999999964	37.78810265888637	-122.41105198708772	524 Post St (at Taylor St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b8d8f8370c603bbce6993b4
193	Palace of Fine Arts	7	9.59999999999999964	37.80288814426483	-122.44841247797011	3301 Lyon St (btwn Bay & Jefferson St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5226201411d251d99e9c2792
194	K&L Wine Merchants	7	9.59999999999999964	37.77963176565572	-122.40074157714844	855 Harrison St (btwn 4th and 5th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51739cafe4b0cb9cbc0e0b41
195	Golden Gate Overlook	7	9.59999999999999964	37.80410459983463	-122.47678756713866	Lincoln Blvd & Merchant Rd (Presidio of San Francisco)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ff39b29e4b01ead00ad0d26
196	Mission Dolores Park	7	9.5	37.75931744166371	-122.4271626342798	Dolores St (btwn 18th & 20th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e3eb3c72271d21e870667de
197	Kokkari Estiatorio	7	9.5	37.79693592834394	-122.39975702239228	200 Jackson St (at Front St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e4aad54636576bfab294615
198	Mission Cliffs	7	9.5	37.76078380755669	-122.412539822924	2295 Harrison St (at 19th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c22e57498e965129c2bf30
199	Baker Beach	7	9.5	37.79154574416933	-122.48357738463181	1504 Pershing Dr (at Lincoln Blvd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d796118b5222d433ba70f2c
200	Ferry Building (Ferry Building Marketplace)	7	9.5	37.795611038670984	-122.39382695694917	1 Ferry Building (at The Embarcadero)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b60ad0a70c603bb11f490b4
201	Haus of Hipstamatic	7	9.5	37.776574526831226	-122.40893358224552	74 Langton St (btwn Folsom & Howard, 7th and 8th)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5109b7efe4b0b12f3467f81e
202	Dog Eared Books	7	9.5	37.75850137297435	-122.42142677307129	900 Valencia St (at 20th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ca0d304604c76b0248c977b
203	Vive La Tarte	7	9.5	37.777089059825975	-122.4109966767992	1160 Howard St (at 8th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/555e42d7498ef6dbf536c102
204	California Academy of Sciences	7	9.5	37.76982548539413	-122.46624265135708	55 Music Concourse Dr (at Martin Luther King Jr Dr)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cfeaf0c2c6459410f80464a
205	Ocean Beach	7	9.5	37.76806118678047	-122.51056320347324	Point Lobos Ave (at Great Hwy)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52354e4411d23a55abfe02f2
206	Glen Canyon Park	7	9.5	37.73736184098628	-122.44080469835735	Glen Canyon Park (at O'Shaughnessy Blvd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ea778cd2c5b8e25be171e8d
207	Lafayette Park	7	9.5	37.791246594951375	-122.42808063995858	2000 Sacramento St (at Gough St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4bd528a870c603bb5b4199b4
208	Mollusk Surf Shop	7	9.5	37.762307	-122.506217	4500 Irving St (at 46th Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51100411e4b077917d6c733b
209	Fort Funston	7	9.5	37.714986930252145	-122.50263342459404	500 Skyline Blvd (at John Muir Dr)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4dd54762b3adf8876d2213aa
210	Kinokuniya Bookstore	7	9.5	37.78492719900686	-122.43162184953688	1581 Webster St #163	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50baa536e4b0c379f43cb36f
211	Central Park	8	9.80000000000000071	40.78885994449482	-73.96116256713867	59th St to 110th St (5th Ave to Central Park West)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5150464ee4b02f70eb28eee4
212	Aire Ancient Baths	8	9.69999999999999929	40.71814377480724	-74.0049147605896	88 Franklin St (at Church St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51672662e4b0a1b862b1530c
213	The Metropolitan Museum of Art (Metropolitan Museum of Art)	8	9.69999999999999929	40.77913186407382	-73.96291774473308	1000 5th Ave (btwn E 80th & E 84th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/512d1d4fe4b0ae1a14d17f5f
214	High Line	8	9.69999999999999929	40.74488019457947	-74.00559949094632	btwn Gansevoort & W 34th St (btwn 10th & 12th Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4eaed5b72c5bb67b2435833e
215	Bryant Park	8	9.59999999999999964	40.75381489678715	-73.98394128255757	E 42nd St (btwn 5th & 6th Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ca509f2ae1eef3b8bfc2f47
216	Equinox West 50th Street	8	9.59999999999999964	40.762177	-73.984548	1633 Broadway (at Paramount Plz)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	\N
217	Gantry Plaza State Park	8	9.59999999999999964	40.74655794031174	-73.9580512046814	474 48th Ave (at Center Blvd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e871dc8775b8a3951afd996
218	West Side Highway Running Path	8	9.59999999999999964	40.733218047025495	-74.00863511726843	West Side Highway (btwn Battery Park & W 72nd St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51f039a0498ef4a3724bbbed
219	Central Park - Conservatory Garden	8	9.59999999999999964	40.79424530078437	-73.95197868347168	1231 5th Ave (at 105th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4de6af768130690dbf1147ca
220	Minskoff Theatre	8	9.59999999999999964	40.75749442223194	-73.98568022741497	1515 Broadway (at W 45th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b2d716970c603bbca7e8fb4
221	Washington Square Park	8	9.59999999999999964	40.73077900590829	-73.99755972622535	W 4th St (btwn MacDougal St & University Pl)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c757e2c6f789c7494424c4c
222	Strand Bookstore	8	9.59999999999999964	40.73320178975766	-73.99096009548717	828 Broadway (at E 12th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4be21e8470c603bb5d639ab4
223	Lincoln Center for the Performing Arts	8	9.59999999999999964	40.77223354479133	-73.98289102110769	70 Lincoln Center Plz (btwn Columbus & 10th Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4be2234d70c603bbdd639ab4
224	Elf Cosmetics	8	9.59999999999999964	40.72988079657862	-73.99235464508372	10 W 33rd St Rm 802 (5th Avenue)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/578e5afb498e144cd7cc8863
225	Riverside Park	8	9.59999999999999964	40.806809433439135	-73.96865129470825	Riverside Dr. (btwn W 59th St. & St. Clair Pl.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c0d794498efff55bf8dac9
226	St. Patrick's Cathedral	8	9.59999999999999964	40.75874373368367	-73.97660654989457	14 E 51st St (at 5th Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4bf6e15e70c603bb556b9cb4
227	Levain Bakery	8	9.59999999999999964	40.77984275934918	-73.98056030273438	167 W 74th St (at Amsterdam Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5110161ce4b03a1187a32fe3
228	Hudson River Park	8	9.59999999999999964	40.73265337566474	-74.01070666068738	West St (btwn Battery Pl & W 59th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cbdfc6fee009521d0c5fb24
229	Murray's Cheese	8	9.59999999999999964	40.73109392616922	-74.00284500572215	254 Bleecker St (at Cornelia St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5155a2f8e4b065694633ed6b
230	New York Public Library - Schomburg Center for Research in Black Culture	8	9.59999999999999964	40.81413402921382	-73.94021987915039	515 Malcolm X Blvd (at W 135th St.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50cb8389e4b05e0e484daa63
231	Equinox East 63rd Street	8	9.59999999999999964	40.764401	-73.966462	817 Lexington Avenue (at E 63rd St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5841f9ffc45ee347d5b8d11d
232	Brooklyn Bridge	8	9.59999999999999964	40.706215080199364	-73.99601026811312	Brooklyn Bridge	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4bb155a870c603bb712496b4
233	I Love Kickboxing - Midtown East 43rd	8	9.59999999999999964	40.75059241608557	-73.97161326199841	303 E 43rd Street, Lower Level (2nd Ave.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/543882d611d24cd01f11a50f
234	Bethesda Fountain	8	9.59999999999999964	40.77429373881737	-73.9708399772644	Terrace Dr (at Central Park)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ff31547e4b041a995485e27
235	David H. Koch Theater	8	9.59999999999999964	40.77199437487606	-73.98347854614258	Lincoln Center Plaza (at W 63rd St & Columbus Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5050dce9e4b0e464efcdcb20
236	Union Square Greenmarket	8	9.59999999999999964	40.73652697126574	-73.9905595779419	1 Union Sq W (btwn 15th & 17th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d93acf9a8a95941ce962978
237	Jacqueline Kennedy Onassis Reservoir	8	9.59999999999999964	40.78511988296314	-73.96247578387509	Central Park (btwn 85th & 96th St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4be2204270c603bb96639ab4
238	Carl Schurz Park	8	9.59999999999999964	40.77511823969361	-73.94376326618595	599 E 86th St (at East End Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cacdecbeabd76b0730f7ddf
239	Rubirosa Ristorante	8	9.59999999999999964	40.722726166658305	-73.99599305184151	235 Mulberry St (btwn Prince & Spring St)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e8cbed9be7bc43c182e5487
240	Top of The Rock Observation Deck	8	9.59999999999999964	40.75903357413162	-73.97933721542358	30 Rockefeller Plz (btwn 5th & 6th Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e49771262e13240b6f23c6c
241	Gardens by the Bay	9	9.5	1.28239816416113	103.86304166015074	18 Marina Gardens Dr	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ff7fab3e4b054fbaaba909b
242	Marina Bay Downtown Area (MBDA)	9	9.5	1.2790415374388213	103.85495626876134	Marina Blvd, Central Blvd & Surrounds	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e9c20981081f57b9e735d9f
243	Napoleon Food & Wine Bar	9	9.40000000000000036	1.2799670469544204	103.84714543819426	206 Telok Ayer Street	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c5c83f498e778c13e597ad
244	Henderson Waves	9	9.30000000000000071	1.276239028996051	103.81523273528167	Henderson Rd (Connecting Telok Blangah Hill Park & Mt Faber Park)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c64dcabba119c7489bd22a2
245	Universal Studios Singapore	9	9.30000000000000071	1.2558362351439183	103.82142514956163	32 Sentosa Gateway (Resorts World Sentosa)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c03b68b70c603bbfbc39db4
246	Books Actually	9	9.30000000000000071	1.2825811480513059	103.83032370327051	9 Yong Siak St (Tiong Bahru Estate)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50e0100be4b0f34007cf9b0e
247	Singapore Botanic Gardens	9	9.30000000000000071	1.3154563430460127	103.81596290467682	1 Cluny Rd.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e8ac9530cd6c43cb1903465
248	Blu Kouzina	9	9.30000000000000071	1.303253431786934	103.81035625934601	Blk 10 Dempsey Hill #01-21 (10 Dempsey Rd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54320529498e30aedc0307b1
249	Transformers The Ride: The Ultimate 3D Battle	9	9.30000000000000071	1.2543801160622412	103.8216062847745	Universal Studios Singapore (Sci-Fi City Zone)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ef41ba36da1a067a63a3b63
250	Books Kinokuniya 紀伊國屋書店	9	9.30000000000000071	1.3031855416785523	103.8342467245539	#04-20/20B/20C/20E Ngee Ann City (391 Orchard Rd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ba5e1dc70c603bbf92a95b4
251	Singapore Zoo	9	9.30000000000000071	1.4048016561145835	103.79060739455322	80 Mandai Lake Rd.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51d3a64d498e2527fd0fa472
252	Marina Bay Sands	9	9.30000000000000071	1.2831902557086854	103.85912418365479	10 Bayfront Avenue	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/55a03979498e868f0af2cd31
253	East Coast Park	9	9.30000000000000071	1.3051144026337076	103.92740249633789	Along East Coast Pkwy (East Coast Park Service Rd)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c5037348edf0f471f6fe2ae
254	Esplanade - Theatres On The Bay	9	9.30000000000000071	1.2896406004717818	103.85580555199617	1 Esplanade Dr.	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4fc0fa14e4b014a2d67e724e
255	Resorts World Sentosa	9	9.19999999999999929	1.2566552412496912	103.82039494764757	8 Sentosa Gateway	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ddf84913151c0922ed0a275
256	Percolate	9	9.19999999999999929	1.3280234803803905	103.93487431293876	#01-152, 136 Bedok North Ave 3	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53773823498e90583ae891b2
257	National Orchid Garden	9	9.19999999999999929	1.3117038129541208	103.81474029768252	Singapore Botanic Gardens (1 Cluny Rd. (Central Core along Tyersall Ave.))	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51521d0ee4b0507a3943715a
258	Marina Bay Sands Boardwalk	9	9.19999999999999929	1.284048347205377	103.85849118232727	10 Bayfront Avenue	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53714ce511d26dd2ea2c25ba
259	Cloud Forest	9	9.19999999999999929	1.283866002786424	103.86573314666748	Gardens By The Bay (18 Marina Gardens Dr.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/501aaea8e4b07ea8afb15026
260	Punggol Promenade Riverside Walk	9	9.19999999999999929	1.3932439841755129	103.91734169924771	Punggol East	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4df7eeafa809df9984e8460e
261	28 HongKong Street	9	9.19999999999999929	1.287873047219137	103.84684871187127	28 Hong Kong Street	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51f5d1aa498e5eb85c39fe58
262	Binomio Spanish Restaurante	9	9.19999999999999929	1.2778417019561932	103.84228559303185	#01-02, Craig Place (20 Craig Rd.)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51bc0a95498e7e9461eca6dd
263	Punggol Waterway Park	9	9.19999999999999929	1.4102274642652444	103.90697479248047	Punggol	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4eb403028b81a81f8fe988d3
264	Sephora	9	9.19999999999999929	1.3038197334026675	103.83206159335528	#B2-09, ION Orchard (2 Orchard Turn)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c7f14ce8e64952163b813bd
265	Mount Faber Park	9	9.19999999999999929	1.2727409581382068	103.81864022617543	Mount Faber Rd	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/541ee970498e943eba8d1ee3
266	The Singapore Flyer	9	9.09999999999999964	1.2894447773183417	103.86324549975406	30 Raffles Ave	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5162eb5c498e5d9dadd35b2d
267	Bay East (Gardens by the Bay)	9	9.09999999999999964	1.2895830304297036	103.86895179748535	Tanjong Rhu Rd (Gardens by the Bay)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51540288e4b0dfc99a0b50d3
268	Rooftop Infinity Pool	9	9.09999999999999964	1.2836796223931373	103.86065789188754	Level 57, Marina Bay Sands Hotel (12A Bayfront Ave)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d731670ec075481a02193bf
269	National Gal­lery Singa­pore	9	9.09999999999999964	1.2907395913341984	103.85154786540198	1 St. Andrew's Road	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5693cee3498e0bad978adeb2
270	MacRitchie Reservoir	9	9.09999999999999964	1.3426982080671415	103.83363246917725	MacRitchie Reservoir Park	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/526b265911d27c7e42e8c3d9
271	Monteliusvägen	10	9.5	59.32074765317659	18.06259770163445	Monteliusvägen	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50995297e4b0fd2387c50b02
272	Klättercentret	10	9.5	59.29907433092187	17.991520561261485	Tellusgången 24	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53ab4494498eddb7e1576f3b
273	Papercut	10	9.5	59.317171692578555	18.054880964900807	Krukmakargatan 24–26	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51595ef2e4b0dc047ec21a70
274	Johan & Nyström	10	9.5	59.316209845175614	18.063844070646958	Swedenborgsgatan 7 (Maria Prästgårdsgata)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52779c2f11d220aa1d9ae399
275	Fotografiska	10	9.5	59.317987362345406	18.085006451389237	Stadsgårdshamnen 22	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e33fac3b3ad90171c63445d
276	Rosendals Trädgård	10	9.40000000000000036	59.327447531966364	18.115183206731857	Rosendalsterrassen 12	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5343363a498e48d2bdc7c5a1
277	Science Fiction Bokhandeln	10	9.40000000000000036	59.324040574431656	18.070626918333545	Västerlånggatan 48 (Gamla Stan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c485e71972c0f4797bf2621
278	Snickarbacken 7	10	9.40000000000000036	59.33794104458486	18.0679698710224	Snickarbacken 7	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/512895e3e4b0fb383035dbdc
279	Sivletto	10	9.40000000000000036	59.30961801913805	18.089211881160736	Malmgårdsvägen 16-18 (at Ringvägen)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/571b563c498e4be6bcc7a7bb
280	Lilla Ego	10	9.40000000000000036	59.34376	18.045631	Västmannagatan 69	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/55d4d6be498e485b599b05db
281	Stockholms Stadshus | Stockholm City Hall (Stockholms Stadshus)	10	9.30000000000000071	59.32744588143589	18.05499494075775	Ragnar Östbergs plan 1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51ebcf39498e4f9b4a92f6c1
282	Vasamuseet	10	9.30000000000000071	59.32784815275516	18.091607093811035	Galärvarvsvägen 14 (Djurgårdsvägen)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4edddc8b8231efe393788e71
283	Café Pascal	10	9.30000000000000071	59.3419875630816	18.05197477340698	Norrtullsgatan 4 (Sandåsgatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/55199bae498e4147d065c31c
284	Humlegården	10	9.30000000000000071	59.338757620691425	18.072455872562365	Humlegårdsgatan	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4edeb5a5b8f76b6e9cd9b775
285	Oaxen Krog & Slip	10	9.30000000000000071	59.32232111516647	18.101470170666516	Beckholmsvägen 26 (Djurgården)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54f323b5498e60009296d9bb
286	Linje Tio	10	9.30000000000000071	59.31619183255724	18.035047687018626	Hornsbruksgatan 24 (Borgargatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53cf6f45498e2dae354d98d6
287	Farang	10	9.30000000000000071	59.3416374320375	18.062725067138672	Tulegatan 7 (Rådmansgatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51aef897498e5587bc60877e
288	Nackareservatet	10	9.30000000000000071	59.288262477543654	18.12200789174107	Sverige	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/572cb702498e379a1b068fd9
289	Kalf & Hansen	10	9.30000000000000071	59.318931110835905	18.061942836651983	Mariatorget 2	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/53fdbcc9498ee29eeebf7025
290	Pizza Hatt	10	9.30000000000000071	59.337240930764764	18.05401689900642	Upplandsgatan 9B (Kammakargatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cd2c9b8fa66236a6611ed2e
292	Reggev Hummus	10	9.30000000000000071	59.308763	18.082216	Ringvägen 145 (btw Bjurholmsgatan & Södermannagatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e99939977c85da036f264b7
293	Grandpa	10	9.19999999999999929	59.312822	18.080763	Södermannagatan 21 (Bondegatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54fc52fb498e6dddac50e422
294	Hornsbergs Strand	10	9.19999999999999929	59.339149	18.004111	Kungsholmen	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51ec2c6f498e1729c83c90af
295	Rolfs Kök	10	9.19999999999999929	59.33871041413502	18.05702805519104	Tegnérgatan 41	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c9b36d9d4b1b1f75f8ad635
296	Bakfickan	10	9.19999999999999929	59.330055	18.07102	Karl XII:s Torg	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/55b4bb7f498e86438a7ff111
297	Wijnjas grosshandel	10	9.19999999999999929	59.32958904076409	18.046292451172757	Bergsgatan 24 (at Pipersgatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/54341f7811d259b7bf4952ba
298	Pen Store	10	9.19999999999999929	59.317550315729385	18.051835751327715	Hornsgatan 98	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/56e2dd1d498eb73dd5d8e207
299	Speceriet	10	9.19999999999999929	59.333803020889185	18.080834954224848	Artillerigatan 14	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51ded703498edd1da5d93d34
300	Vasaparken	10	9.19999999999999929	59.340477431475904	18.04266697145536	Vasaparken (Odengatan)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/510ae64de4b0ee657472ad34
301	Centro Histórico de Cartagena / Ciudad Amurallada	11	9.59999999999999964	10.424203397846842	-75.5488990963779	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50214cbee4b048261ce07e7d
302	Sofitel Santa Clara	11	9.5	10.428479350488166	-75.54796663570262	Calle del Torno 39-29	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4b51bbf170c603bb871790b4
303	La Palettería	11	9.30000000000000071	10.424227424120954	-75.55099142580087	Cll Santo Domingo # 36 - 86	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c9add7498e72fbf2791d3e
304	Di Silvio Trattoria	11	9.30000000000000071	10.420772502637178	-75.54583311080933	Calle de la Sierpe #9A-08 (Getsemaní)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51b6176e498e6a62be9664fb
305	Ciudad Amurallada	11	9.19999999999999929	10.424015601005486	-75.55198640904256	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ed41e675c5c9528fd9b2acd
306	Bahía de Manga	11	9.19999999999999929	10.410748060925236	-75.53890228271484	Calle 36	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5023d836e4b0e5018875b762
307	Azzahr by El Arabe	11	9.19999999999999929	10.423676851537428	-75.55327134893727	Calle de la Artilleria # 33 - 24 (Centro Historico)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/58a5e34cecb67e34d752f676
308	Di Silvio Trattoria	11	9.19999999999999929	10.39910712817434	-75.55653481871336	Colombia	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/57d6f4f4498eb016f7237f68
309	Restaurante Donjuán	11	9.19999999999999929	10.4239855317609	-75.5495935678482	Calle del Colegio # 34-60 Local 1	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d36444dedbd37046fda68e3
310	Juan Valdez Café	11	9.09999999999999964	10.402348	-75.556178	Bocagrande Av. San Martín #7-17	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4cfd36552c1aa090321a057a
311	Restaurante La Mulata	11	9.09999999999999964	10.426277825230748	-75.54672713620855	Calle de Quero	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5287bf6f11d2cccdffb6ceab
312	EL BARÓN - Café & Liquor Bar	11	9.09999999999999964	10.422007069472345	-75.55076569318771	Carrera 4 No. 31-7 (Plaza de San Pedro Claver)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/532e075b498e3c6c3433fbfa
313	Torre del Reloj	11	9.09999999999999964	10.422980474488789	-75.54912954568863	Centro	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52fe3f2411d262c185ae9b80
314	Shakin' Milkshake and Smoothie Bar	11	9	10.4090232370618	-75.55175898489095	Carrera 1 # 11-28	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/581513c4d67cfccd58ec4ff5
315	Cuzco Cocina Peruana	11	9	10.423614033635145	-75.55203757942854	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50e74077e4b0ecb01f4e985f
316	Plaza Santo Domingo	11	9	10.42423576652723	-75.55199778024097	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e63dfc61495676d565c91c6
317	Abaco	11	8.90000000000000036	10.424964905265005	-75.55121316550216	Calle De La Iglesia Con Calle De La Mantilla Esquina (3-86)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d1a43c2bb488cfa4afec3d4
318	San Alberto	11	8.90000000000000036	10.42399619746591	-75.55104828216619	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/55d341cb498e5655beb23a4f
319	Via Apia	11	8.90000000000000036	10.423508716180578	-75.55215697692705	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/521c3110498e68feb8b3c600
320	Isla de Baru	11	8.90000000000000036	10.218259957385426	-75.61172428685471	Isla Baru	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51c6615b498ebd0759066501
321	Laguito, Cartagena	11	8.90000000000000036	10.396431841011132	-75.56307291268057	Barrio El Laguito	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/508c1f1de4b0ca23f60b0188
322	Plaza De La Trinidad	11	8.90000000000000036	10.420694702351229	-75.54540802444272	Barrio Getsemani	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/534890e2498e2d9ce524f3ad
323	Bohemia Cocina En Evolución	11	8.90000000000000036	10.423584053700052	-75.55235597254396	Cartagena de Indias, Bolívar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/563bdccbcd10d54e891af465
324	Mila Pasteleria	11	8.90000000000000036	10.424986932021659	-75.55109376724273	Calle de la iglesia # 35 - 76	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/507b6922e4b0772057ac8066
325	Gokela - Cartagena	11	8.90000000000000036	10.403076507329313	-75.55444836616516	Carerra 3 (No 7-157)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51632b20e4b06c51d43bbf57
326	Gelateria Paradiso	11	8.80000000000000071	10.42517371142022	-75.55059343063253	Calle de las Estrellas (Calle 36) (at Calle del Cuartel (Carrera 5))	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50aec12ae4b03ce490a3fc35
327	Bahia Castillo grande	11	8.80000000000000071	10.39508498355955	-75.55085497043507	Castillo grande	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e9b8becd22d8be5898552e3
328	El Coro Lounge	11	8.80000000000000071	10.428084865621027	-75.54810762405396	Centro Historico, Calle Stuart	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/521e915a11d21ac519058a12
329	Plaza De Bolívar	11	8.80000000000000071	10.423287401193594	-75.55115062356874	Cll 33 3 1-99	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f5615a4e4b06e95a3d22874
330	Juan Valdez Café	11	8.80000000000000071	10.403358220875656	-75.55406163828985	La Mansión, Bocagrande, Cr. 3	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50b21e70e4b04c369e58a097
331	Clube de Regatas do Flamengo	12	9.69999999999999929	-22.978515531102296	-43.219164429783504	Av. Borges de Medeiros, 997 (R. Gilberto Cardoso)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e9e3f96d22d38ff2b54d8d2
332	Pedra do Arpoador	12	9.69999999999999929	-22.989812043443823	-43.19118527781922	Rio de Janeiro, RJ	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5070c2c3e4b0dc1ac020f316
333	Morro da Urca	12	9.69999999999999929	-22.951161706121745	-43.16348075866699	Morro da Urca	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4eeb7b1f2c5beea6208380fc
334	Praia de Ipanema	12	9.59999999999999964	-22.98678159847527	-43.201000315286144	Av. Vieira Souto	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/f0a4ed5011d21c8aa77e9dff
335	Praia do Arpoador	12	9.59999999999999964	-22.988322605164075	-43.192594297770434	Av. Francisco Bhering	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d5ee242b19fa143f8b9dfc8
336	Morro do Pão de Açúcar	12	9.59999999999999964	-22.949776405734585	-43.15649226307869	Morro do Pão de Açúcar	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d1aa90eeab1224b4031cce2
337	Igreja e Mosteiro de São Bento	12	9.59999999999999964	-22.896971602829545	-43.17781448364257	R. D. Gerardo, 68	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e49dbcafa76a0c058c9e7b1
338	Instituto Moreira Salles (IMS)	12	9.59999999999999964	-22.981893386298086	-43.23939800262451	R. Mq. de S. Vicente, 476	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4c264264f3859c74f3596588
339	Theatro Municipal do Rio de Janeiro	12	9.59999999999999964	-22.90971007297455	-43.176951019854684	Pç. Mal. Floriano, s/n	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d9223b6d2c3a090e7b9c166
340	Praia do Leblon	12	9.59999999999999964	-22.987111882021534	-43.22097433722052	Av. Delfim Moreira	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ede291ef5b921398d04744e
341	Praia da Barra da Tijuca	12	9.5	-23.01073633891216	-43.33386279774357	Av. Lúcio Costa, s/n	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/52d9a123498ed213828bddb2
342	Praia do Pepê	12	9.5	-23.014556412355454	-43.31129224509345	Av. do Pepê	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/527e306111d2f7fdccf2ea35
343	Livraria Cultura	12	9.5	-22.91086104549193	-43.17719696145121	R. Sen. Dantas, 45	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/50ecb7afe4b0beb132c065ef
344	Praia da Joatinga	12	9.5	-23.014600436228193	-43.289240045570075	Pr. da Joatinga	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ee7cb54b63425225895ad7c
345	Prainha	12	9.5	-23.040383757898663	-43.504795084929675	Av. Estado da Guanabara, s/n	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e498375483b16676e33951e
346	.Org  Bistrô	12	9.5	-23.01345745164861	-43.3056378364563	Av. Olegário Maciel, 175, Lj. G	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f2af078e4b09f1287014fd2
347	Parque Lage	12	9.5	-22.9606649200928	-43.21225026701909	R. Jd. Botânico, 414	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/520ff70511d21f2af72368d1
348	Pedra Bonita	12	9.5	-22.989280684114558	-43.28264231409664	São Conrado	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4d4dcd9ab1fa236a6db79229
349	Mirante do Leblon	12	9.5	-22.98980484784934	-43.22763919830322	Av. Niemeyer	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51588bd7e4b0ac34490e2c07
350	Praia da Reserva	12	9.5	-23.01244671528012	-43.415777998690054	Av. Lúcio Costa, s/n	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4f215091e4b0926f76b28476
351	Vista Chinesa	12	9.5	-22.973251734974436	-43.249461155672634	Parque Nacional da Tijuca	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4eb12be361afbb09a03bf734
353	Cristo Redentor	12	9.5	-22.951901228066497	-43.210529849145395	Estr. do Corcovado, s/n (Pq. Nacional da Tijuca)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e5ac1ec1495a8911290d09e
354	Posto 9	12	9.5	-22.986867776841674	-43.20397848854003	Pr. de Ipanema	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ede2ddfe300851bfdf04ec5
355	CT Boucherie	12	9.5	-22.982044014580946	-43.224350810050964	R. Dias Ferreira, 636 (R. Bartolomeu Mitre)	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4dfd0d43e4cdbe059c3b5278
356	Parque Olímpico do Rio de Janeiro	12	9.5	-22.978070828750326	-43.393893241882324	Av. Emb. Abelardo Bueno, 3401	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5213727811d2afdbe1341d4f
357	Parque das Ruínas	12	9.40000000000000036	-22.917825539080358	-43.182351999333086	R. Murtinho Nobre, 169	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4e2f328f152010789d1427e2
358	Mirante Dona Marta	12	9.40000000000000036	-22.945598749744136	-43.197166248601214	Estr. Mirante Da. Marta	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/51378919e4b071feb442dce5
359	Praia de Copacabana	12	9.40000000000000036	-22.9706333004463	-43.18421525018639	Av. Atlântica	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/4ede2a0cf790c0454a18a39c
360	Livraria da Travessa	12	9.40000000000000036	-22.951580591961307	-43.18452263266247	R. Voluntários da Pátria, 97	Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water.	https://i.imgur.com/iW4HZCH.jpg	https://foursquare.com/item/5334890011d2cfa3279aa848
\.


--
-- Name: places_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('places_place_id_seq', 360, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tags (tag_id, tag_name) FROM stdin;
1	Park
2	Concert Hall
3	Art Gallery
4	Market
5	Monument / Landmark
6	Bookstore
7	Indian Restaurant
8	Street Food Gathering
9	Botanical Garden
10	Event Space
11	Record Shop
12	History Museum
13	Art Museum
14	Seafood Restaurant
15	Latin American Restaurant
16	Hotel Bar
17	Theater
18	Cupcake Shop
19	Historic Site
20	Hotel
21	Golf Course
22	Frozen Yogurt Shop
23	Lounge
24	Arts & Entertainment
25	Sports Club
26	Mosque
27	Opera House
28	Middle Eastern Restaurant
29	Italian Restaurant
30	Café
31	Food Court
32	Bubble Tea Shop
33	Movie Theater
34	Roof Deck
35	Theme Park
36	Flea Market
37	Jazz Club
38	Breakfast Spot
39	Sushi Restaurant
40	Scenic Lookout
41	American Restaurant
42	Fast Food Restaurant
43	Bakery
44	Bar
45	Club House
46	Deli / Bodega
47	Coffee Shop
48	Ice Cream Shop
49	Shopping Mall
50	Vegetarian / Vegan Restaurant
51	Multiplex
52	Performing Arts Venue
53	Gastropub
54	Dessert Shop
55	Cricket Ground
56	Chinese Restaurant
57	Asian Restaurant
58	Dhaba
59	Field
60	Indian Sweet Shop
61	Pool
62	Nightclub
63	Pub
64	Garden
65	Trail
66	Theme Park Ride / Attraction
67	Non-Profit
68	Mountain
69	Thai Restaurant
70	Zoo
71	Dumpling Restaurant
72	Reservoir
73	Japanese Restaurant
74	Yoga Studio
75	Hostel
76	Wagashi Place
77	Udon Restaurant
78	Hot Spring
79	Yakitori Restaurant
80	BBQ Joint
81	Shrine
82	Tempura Restaurant
83	Bath House
84	Tonkatsu Restaurant
85	Ramen Restaurant
86	Buddhist Temple
87	Flower Shop
88	Adult Boutique
89	Gym / Fitness Center
90	Wine Shop
91	Greek Restaurant
92	Climbing Gym
93	Beach
94	Farmers Market
95	Office
96	Science Museum
97	Board Shop
98	Spa
99	Track
100	Cosmetics Shop
101	Church
102	Cheese Shop
103	Library
104	Bridge
105	Martial Arts Dojo
106	Fountain
107	Lake
108	Pizza Place
109	Harbor / Marina
110	Wine Bar
111	Resort
112	Cocktail Bar
113	Spanish Restaurant
114	Hotel Pool
115	Clothing Store
116	Scandinavian Restaurant
117	City Hall
118	French Restaurant
119	Nature Preserve
120	Arts & Crafts Store
121	Restaurant
122	Caribbean Restaurant
123	Peruvian Restaurant
124	Plaza
125	Sandwich Place
126	Cultural Center
127	Bathing Area
128	Steakhouse
129	Athletics & Sports
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tags_tag_id_seq', 129, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, name, lastname, city_id, email, password, is_activated, picture, description) FROM stdin;
1	Kenneth	Allen	5	kallen0@slashdot.org	$argon2i$v=19$m=512,t=2,p=2$EUKIMeZcixEC4ByDEOLc+w$Bir3x4oEXL8AT7PSdwkHSw	t	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
2	Annie	Mason	9	amason1@bravesites.com	$argon2i$v=19$m=512,t=2,p=2$lbIWAmDMOUeotdY6xzjHGA$lB6TqUEJFK1V82fw7+5q7A	t	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
3	Joe	Lawrence	10	jlawrence2@ezinearticles.com	$argon2i$v=19$m=512,t=2,p=2$Q6gVIuSc854zhrA25jwnJA$DAXVrl8k6HPemNbMpYq6EA	f	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
4	Adam	Burns	10	aburns3@hugedomains.com	$argon2i$v=19$m=512,t=2,p=2$0Pq/d27t3Rvj3BujVEophQ$vLJYAh3p89onlrlLVhmCfA	f	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
5	Paula	Cooper	5	pcooper4@fotki.com	$argon2i$v=19$m=512,t=2,p=2$vReCUCql9P6/F2KMUQohZA$WnzW0vmX+JqmGkruSZOR2w	f	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
6	Kelly	Schmidt	1	kschmidt5@nytimes.com	$argon2i$v=19$m=512,t=2,p=2$Zsw5xzhHiNEaYwzhfE/pPQ$+QumOkFyyiDHHlhgbnxxiA	t	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
7	Brenda	Wheeler	1	bwheeler6@purevolume.com	$argon2i$v=19$m=512,t=2,p=2$i/F+rxVijBFC6J3TWiuF0A$ryE5sPVqdCZymH2FE+W7GQ	t	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
8	Shawn	Kennedy	1	skennedy7@dyndns.org	$argon2i$v=19$m=512,t=2,p=2$B8D4/18rRWitFeIcY+xdCw$JAO/PFc+2qS92SmUOK21jQ	t	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
9	Barbara	Sanders	11	bsanders8@house.gov	$argon2i$v=19$m=512,t=2,p=2$aw2htPY+p9S61zpHaI2xtg$prO0rGXArIX1h3M2qwc2fQ	t	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
10	Bonnie	Kelly	13	bkellya@jiathis.com	$argon2i$v=19$m=512,t=2,p=2$ixHifE+ptfa+t/Y+pxTivA$FnqstvFj0vqRPGlF5XUV2g	f	http://i.imgur.com/Jckb780t.jpeg	I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!
11	Erika	Villar	14	erika@doravel.me	$argon2i$v=19$m=512,t=2,p=2$hnAOQej9vxeidE5JqVUqpQ$ZXVHtgZzXtjXYngK4jPm2w	t	http://i.imgur.com/nivHsnHt.jpeg	\N
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 11, true);


--
-- Name: actions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);


--
-- Name: actiontypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actiontypes
    ADD CONSTRAINT actiontypes_pkey PRIMARY KEY (action_code);


--
-- Name: activations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY activations
    ADD CONSTRAINT activations_pkey PRIMARY KEY (activation_number);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_code);


--
-- Name: place_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags
    ADD CONSTRAINT place_tags_pkey PRIMARY KEY (place_tag_id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: actions_action_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_action_code_fkey FOREIGN KEY (action_code) REFERENCES actiontypes(action_code);


--
-- Name: actions_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_place_id_fkey FOREIGN KEY (place_id) REFERENCES places(place_id);


--
-- Name: actions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: activations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY activations
    ADD CONSTRAINT activations_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: cities_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(country_code);


--
-- Name: comments_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_place_id_fkey FOREIGN KEY (place_id) REFERENCES places(place_id);


--
-- Name: comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: place_tags_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags
    ADD CONSTRAINT place_tags_place_id_fkey FOREIGN KEY (place_id) REFERENCES places(place_id);


--
-- Name: place_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags
    ADD CONSTRAINT place_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id);


--
-- Name: places_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(city_id);


--
-- Name: users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(city_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

