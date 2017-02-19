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
    password character varying(20) NOT NULL,
    picture character varying(200)
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
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);


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
1	97	1995	sav
2	741	1554	sav
3	173	1273	hbh
4	345	2135	hbh
5	570	598	hbh
6	214	1894	sav
7	460	2276	hbh
8	210	1969	sav
9	657	1594	sav
10	99	1761	hbh
11	81	1852	hbh
12	838	1994	hbh
13	382	1828	sav
14	364	1072	sav
15	437	2686	hbh
16	217	2816	hbh
17	682	1037	hbh
18	734	1873	hbh
19	967	1659	sav
20	255	1640	sav
21	598	2873	hbh
22	453	2403	hbh
23	721	1020	sav
24	385	1435	sav
25	240	795	sav
26	203	1479	sav
27	297	2280	hbh
28	440	425	sav
29	909	1699	hbh
30	578	396	hbh
31	236	2872	hbh
32	167	2839	hbh
33	952	2278	sav
34	519	254	hbh
35	622	111	sav
36	169	2416	sav
37	395	1499	hbh
38	253	2712	sav
39	306	1640	sav
40	182	2317	hbh
41	358	2986	hbh
42	791	2994	hbh
43	423	1538	sav
44	882	445	sav
45	245	1355	hbh
46	199	2884	hbh
47	789	1739	hbh
48	957	296	hbh
49	536	125	hbh
50	619	1618	sav
51	475	1195	sav
52	347	2548	sav
53	608	2837	sav
54	978	2092	hbh
55	8	2470	hbh
56	529	1116	sav
57	424	2533	sav
58	948	2429	sav
59	47	2208	hbh
60	346	429	hbh
61	738	1005	sav
62	509	3002	hbh
63	585	2704	hbh
64	641	255	hbh
65	288	281	hbh
66	926	979	sav
67	882	719	hbh
68	962	2973	sav
69	284	126	hbh
70	225	2232	sav
71	779	1999	sav
72	679	1897	hbh
73	252	560	sav
74	837	2554	hbh
75	446	164	sav
76	854	862	sav
77	20	2938	sav
78	741	1901	sav
79	779	1175	hbh
80	720	1944	sav
81	985	2670	sav
82	8	1708	sav
83	110	2181	sav
84	990	203	sav
85	813	1442	hbh
86	589	63	sav
87	217	306	hbh
88	25	2978	hbh
89	520	1486	sav
90	1	525	sav
91	995	2843	sav
92	559	1453	sav
93	874	2197	sav
94	416	37	sav
95	262	1209	hbh
96	7	2118	sav
97	671	2005	sav
98	295	283	sav
99	390	686	hbh
100	526	893	sav
101	310	2381	hbh
102	831	857	sav
103	554	2798	hbh
104	235	1152	sav
105	672	1395	hbh
106	897	1340	hbh
107	820	2022	hbh
108	206	2344	hbh
109	358	2995	hbh
110	595	2547	hbh
111	876	2706	sav
112	994	104	hbh
113	59	2802	sav
114	674	1885	hbh
115	834	2227	sav
116	270	925	hbh
117	493	2654	sav
118	269	246	hbh
119	173	2247	sav
120	728	1232	sav
121	352	274	hbh
122	761	2603	sav
123	148	2835	sav
124	532	12	sav
125	608	8	sav
126	260	2880	sav
127	95	1859	sav
128	100	1125	hbh
129	435	1466	hbh
130	769	222	hbh
131	918	616	sav
132	851	2643	hbh
133	255	522	sav
134	742	2146	sav
135	161	2814	sav
136	303	2724	sav
137	182	47	sav
138	682	1006	hbh
139	992	1078	hbh
140	542	181	hbh
141	74	1473	hbh
142	498	2363	hbh
143	284	646	hbh
144	321	90	sav
145	761	1371	sav
146	668	2528	sav
147	453	1649	sav
148	93	116	hbh
149	908	2772	hbh
150	642	2882	sav
151	266	567	hbh
152	623	2766	hbh
153	877	2185	sav
154	836	2530	sav
155	117	788	hbh
156	773	2457	sav
157	729	1106	sav
158	49	2057	sav
159	930	556	hbh
160	328	1538	sav
161	609	1187	hbh
162	14	861	hbh
163	996	1772	hbh
164	334	907	sav
165	738	2861	sav
166	274	1941	sav
167	211	1875	sav
168	237	1568	hbh
169	69	2971	sav
170	971	301	sav
171	548	2686	sav
172	327	1215	hbh
173	374	859	sav
174	172	718	hbh
175	737	1609	sav
176	556	1011	hbh
177	314	1817	sav
178	886	1731	sav
179	988	1097	sav
180	422	1442	hbh
181	254	294	sav
182	448	1846	sav
183	17	860	sav
184	149	1799	hbh
185	623	1315	hbh
186	275	1419	sav
187	333	736	hbh
188	396	2272	hbh
189	685	88	sav
190	764	1651	sav
191	606	1841	sav
192	327	1473	hbh
193	115	452	hbh
194	386	772	sav
195	3	2900	sav
196	653	1802	hbh
197	14	877	hbh
198	335	2146	sav
199	901	2928	hbh
200	890	1098	sav
201	627	644	sav
202	8	1443	hbh
203	372	339	hbh
204	101	1786	sav
205	379	1780	sav
206	270	2865	hbh
207	641	1894	hbh
208	774	744	sav
209	979	1740	sav
210	773	1167	sav
211	113	1152	hbh
212	612	2156	sav
213	317	2958	sav
214	40	660	hbh
215	355	2770	sav
216	293	1383	sav
217	87	2099	hbh
218	427	1052	sav
219	513	428	sav
220	364	583	sav
221	111	40	hbh
222	309	2427	sav
223	475	1735	sav
224	792	2098	hbh
225	437	1570	sav
226	887	2764	sav
227	350	1204	sav
228	380	476	hbh
229	432	482	hbh
230	429	1375	hbh
231	598	1858	hbh
232	556	2282	hbh
233	819	377	hbh
234	43	2778	hbh
235	308	2794	hbh
236	330	2411	hbh
237	422	580	hbh
238	29	2539	sav
239	916	349	hbh
240	608	1292	hbh
241	922	2762	sav
242	574	2883	hbh
243	815	1638	sav
244	976	1522	hbh
245	515	1505	sav
246	108	514	hbh
247	40	1877	hbh
248	413	1088	hbh
249	280	1792	sav
250	67	1801	hbh
\.


--
-- Name: actions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('actions_action_id_seq', 250, true);


--
-- Data for Name: actiontypes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY actiontypes (action_code, action_name) FROM stdin;
sav	Save
hbh	Have been here
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY cities (city_id, name, country_code, latitud, longitud, description, picture) FROM stdin;
1	Hong Kong	HK	22.28552	114.15769	\N	\N
2	Singapore	SG	1.28967	103.85007	\N	\N
3	Stockholm	SE	59.33258	18.0649	\N	\N
4	London	GB	51.50853	-0.12574	\N	\N
5	Cartagena	CO	10.39972	-75.51444	\N	\N
6	Kuala Lumpur	MY	3.1412	101.68653	\N	\N
7	La Habana	CU	23.13302	-82.38304	\N	\N
8	Antalya	TR	36.90812	30.69556	\N	\N
9	Paris	FR	48.85341	2.3488	\N	\N
10	Istanbul	TR	41.01384	28.94966	\N	\N
11	Rome	IT	41.89193	12.51133	\N	\N
12	Dubai	AE	25.0657	55.17128	\N	\N
13	Guangzhou	CN	23.11667	113.25	\N	\N
14	Montevideo	UY	-34.90328	-56.18816	\N	\N
15	Santiago	CL	-33.45694	-70.64827	\N	\N
16	Porto	PT	41.14961	-8.61099	\N	\N
17	Pattaya	TH	12.93333	100.88333	\N	\N
18	Taipei	TW	25.04776	121.53185	\N	\N
19	Prague	CZ	50.08804	14.42076	\N	\N
20	Shanghai	CN	31.22222	121.45806	\N	\N
21	Las Vegas	US	36.17497	-115.13722	\N	\N
22	Miami	US	25.77427	-80.19366	\N	\N
23	Barcelona	ES	41.38879	2.15899	\N	\N
24	Manchester	GB	42.99564	-71.45479	\N	\N
25	Beijing	CN	39.9075	116.39723	\N	\N
26	Los Angeles	US	34.05223	-118.24368	\N	\N
27	Budapest	HU	47.49801	19.03991	\N	\N
28	Vienna	AT	48.20849	16.37208	\N	\N
29	Amsterdam	NL	52.37403	4.88969	\N	\N
30	Sofia	BG	42.69751	23.32415	\N	\N
31	Madrid	ES	40.4165	-3.70256	\N	\N
32	Orlando	US	28.53834	-81.37924	\N	\N
33	Ho Chi Minh City	VN	10.82302	106.62965	\N	\N
34	Lima	PE	-12.04318	-77.02824	\N	\N
35	Berlin	DE	52.52437	13.41053	\N	\N
36	Tokyo	JP	35.6895	139.69171	\N	\N
37	Warsaw	PL	52.22977	21.01178	\N	\N
38	Chennai	IN	13.08784	80.27847	\N	\N
39	Cairo	EG	30.06263	31.24967	\N	\N
40	Nairobi	KE	-1.28333	36.81667	\N	\N
41	Milan	IT	45.46427	9.18951	\N	\N
42	San Francisco	US	37.77493	-122.41942	\N	\N
43	Buenos Aires	AR	-34.61315	-58.37723	\N	\N
44	Venice	IT	45.43713	12.33265	\N	\N
45	Copenhagen	DK	55.67594	12.56553	\N	\N
46	Mugla	TR	37.21807	28.3665	\N	\N
47	Mumbai	IN	19.07283	72.88261	\N	\N
48	Delhi	IN	28.65195	77.23149	\N	\N
49	Toronto	CA	43.70011	-79.4163	\N	\N
50	Caracas	VE	10.48801	-66.87919	\N	\N
51	St. Petersburg	RU	59.93863	30.31413	\N	\N
52	Burgas	BG	42.50606	27.46781	\N	\N
53	Sydney	AU	-33.86785	151.20732	\N	\N
54	Djerba	TN	33.87576	10.85745	\N	\N
55	Munich	DE	48.13743	11.57549	\N	\N
56	Johannesburg	ZA	-26.20227	28.04363	\N	\N
57	Edirne	TR	41.67719	26.55597	\N	\N
58	Bogota	CO	4.60971	-74.08175	\N	\N
59	Bucharest	RO	44.43225	26.10626	\N	\N
60	Granada	ES	37.18817	-3.60667	\N	\N
61	Jaipur	IN	26.91962	75.78781	\N	\N
62	Brussels	BE	50.85045	4.34878	\N	\N
63	Nice	FR	43.70313	7.26608	\N	\N
64	Guayaquil	EC	-2.20584	-79.90795	\N	\N
65	Munich	DE	48.13743	11.57549	\N	\N
66	Lisbon	PT	38.71667	-9.13333	\N	\N
67	Cozumel	MX	20.501	-86.94598	\N	\N
68	Marrakech	MA	31.63416	-7.99994	\N	\N
69	Jakarta	ID	-6.21462	106.84513	\N	\N
70	Manama	BH	26.21536	50.5832	\N	\N
71	Hanoi	VN	21.0245	105.84117	\N	\N
72	Honolulu	US	21.30694	-157.85833	\N	\N
73	Manila	PH	14.6042	120.9822	\N	\N
74	Medellin	CO	6.25184	-75.56359	\N	\N
75	Auckland	NZ	-36.86667	174.76667	\N	\N
76	Siem Reap	KH	13.36179	103.86056	\N	\N
77	Sousse	TN	35.82539	10.63699	\N	\N
78	Amman	JO	31.95522	35.94503	\N	\N
79	Vancouver	CA	49.24966	-123.11934	\N	\N
80	Abu Dhabi	AE	24.46667	54.36667	\N	\N
81	Kiev	UA	50.45466	30.5238	\N	\N
82	Doha	QA	25.27932	51.52245	\N	\N
83	Florence	IT	43.77925	11.24626	\N	\N
85	Melbourne	AU	-37.814	144.96332	\N	\N
86	Washington DC	US	38.89511	-77.03637	\N	\N
87	Riyadh	SA	24.68773	46.72185	\N	\N
88	Christchurch	NZ	-43.53333	172.63333	\N	\N
89	Frankfurt	DE	50.11552	8.68417	\N	\N
90	Dresden	DE	51.05089	13.73832	\N	\N
91	Sao Paulo	BR	-23.5475	-46.63611	\N	\N
92	Seattle	US	47.60621	-122.33207	\N	\N
93	Kolkata	IN	22.56263	88.36304	\N	\N
94	Nanjing	CN	32.06167	118.77778	\N	\N
95	New York City	US	40.742185	-73.992602	\N	\N
96	Hangzhou	CN	30.29365	120.16142	\N	\N
97	Mexico City	MX	19.42847	-99.12766	\N	\N
98	Athens	GR	37.97945	23.71622	\N	\N
99	Denpasar	ID	-8.65	115.21667	\N	\N
100	Cancun	MX	21.17429	-86.84656	\N	\N
101	Punta Cana	DO	18.58182	-68.40431	\N	\N
102	Matviyivka	UA	\N	\N	\N	\N
103	Mahuta	NG	\N	\N	\N	\N
104	Chirpan	BG	\N	\N	\N	\N
105	Mali Iđoš	RS	\N	\N	\N	\N
106	Zhendong	CN	\N	\N	\N	\N
107	Laiyang	CN	\N	\N	\N	\N
108	Pimentel	PE	\N	\N	\N	\N
109	Miguelópolis	BR	\N	\N	\N	\N
110	Rochester	US	\N	\N	\N	\N
111	Qorovulbozor	UZ	\N	\N	\N	\N
112	Noailles	FR	\N	\N	\N	\N
113	Oehaunu	ID	\N	\N	\N	\N
114	Hetou	CN	\N	\N	\N	\N
115	Ungus-Ungus	PH	\N	\N	\N	\N
116	Jaroměřice nad Rokytnou	CZ	\N	\N	\N	\N
117	Comrat	MD	\N	\N	\N	\N
118	Mithi	PK	\N	\N	\N	\N
119	Magutian	CN	\N	\N	\N	\N
120	Vinkkilä	FI	\N	\N	\N	\N
121	Zhangyang	CN	\N	\N	\N	\N
122	Bambali	GM	\N	\N	\N	\N
123	Antanifotsy	MG	\N	\N	\N	\N
124	Yoichi	JP	\N	\N	\N	\N
125	Isahaya	JP	\N	\N	\N	\N
126	Funga	ID	\N	\N	\N	\N
127	Villanova	IT	\N	\N	\N	\N
128	Tegalgunung	ID	\N	\N	\N	\N
129	Camasca	HN	\N	\N	\N	\N
130	Seaforth	JM	\N	\N	\N	\N
131	Cimuncang	ID	\N	\N	\N	\N
132	Haolibao	CN	\N	\N	\N	\N
133	Danao	PH	\N	\N	\N	\N
134	Veinticinco de Mayo	AR	\N	\N	\N	\N
135	Korenëvo	RU	\N	\N	\N	\N
136	Nîmes	FR	\N	\N	\N	\N
137	Yushang	CN	\N	\N	\N	\N
138	Wasquehal	FR	\N	\N	\N	\N
139	São Bernardo do Campo	BR	\N	\N	\N	\N
140	Leran	ID	\N	\N	\N	\N
141	Gon’ba	RU	\N	\N	\N	\N
142	Nizhnyaya Salda	RU	\N	\N	\N	\N
143	Paris La Défense	FR	\N	\N	\N	\N
144	Semanding	ID	\N	\N	\N	\N
145	Dolisie	CG	\N	\N	\N	\N
146	Wysoka	PL	\N	\N	\N	\N
147	Fantino	DO	\N	\N	\N	\N
148	Chão	PT	\N	\N	\N	\N
149	Annecy	FR	\N	\N	\N	\N
150	Sajia	CN	\N	\N	\N	\N
151	Irecê	BR	\N	\N	\N	\N
152	Tuusula	FI	\N	\N	\N	\N
153	Berezanka	UA	\N	\N	\N	\N
154	Orléans	FR	\N	\N	\N	\N
155	Mantalongon	PH	\N	\N	\N	\N
156	Frydrychowice	PL	\N	\N	\N	\N
157	Zayta	PS	\N	\N	\N	\N
158	Bozoum	CF	\N	\N	\N	\N
159	Lajinha	BR	\N	\N	\N	\N
160	Tours	FR	\N	\N	\N	\N
161	Guilhabreu	PT	\N	\N	\N	\N
162	Chengyang	CN	\N	\N	\N	\N
163	Mników	PL	\N	\N	\N	\N
164	Suwaluh	ID	\N	\N	\N	\N
165	Bardaskan	IR	\N	\N	\N	\N
166	Pérama	GR	\N	\N	\N	\N
167	Taroudant	MA	\N	\N	\N	\N
168	Munduk	ID	\N	\N	\N	\N
169	Río Grande	AR	\N	\N	\N	\N
170	Pisangkemeng	ID	\N	\N	\N	\N
171	Suure-Jaani	EE	\N	\N	\N	\N
172	Beringinjaya	ID	\N	\N	\N	\N
173	Lamatuka	ID	\N	\N	\N	\N
174	Oslo	NO	\N	\N	\N	\N
175	Caujul	PE	\N	\N	\N	\N
176	Mikhaylov	RU	\N	\N	\N	\N
177	Huanghuai	CN	\N	\N	\N	\N
178	Khvatovka	RU	\N	\N	\N	\N
179	Margarita	CO	\N	\N	\N	\N
180	Okanagan	CA	\N	\N	\N	\N
181	Lue Amnat	TH	\N	\N	\N	\N
182	Martigues	FR	\N	\N	\N	\N
183	Khao Yoi	TH	\N	\N	\N	\N
184	Independencia	MX	\N	\N	\N	\N
185	Yangzhen	CN	\N	\N	\N	\N
186	Kawage	JP	\N	\N	\N	\N
187	Mandal	MN	\N	\N	\N	\N
188	Třemošnice	CZ	\N	\N	\N	\N
189	Kugri	CN	\N	\N	\N	\N
190	Yaroslavskaya	RU	\N	\N	\N	\N
191	Nizhnedevitsk	RU	\N	\N	\N	\N
192	Koumac	NC	\N	\N	\N	\N
193	Hexi	CN	\N	\N	\N	\N
194	Kafr Sawm	JO	\N	\N	\N	\N
195	Tairua	NZ	\N	\N	\N	\N
196	Kirkuk	IQ	\N	\N	\N	\N
197	Zheleznogorsk	RU	\N	\N	\N	\N
198	Al Muwayh	SA	\N	\N	\N	\N
199	Dalianhe	CN	\N	\N	\N	\N
200	Omaha	US	\N	\N	\N	\N
201	Xinmin	CN	\N	\N	\N	\N
202	Kortowo	PL	\N	\N	\N	\N
203	Áno Kastrítsion	GR	\N	\N	\N	\N
204	Calvário	PT	\N	\N	\N	\N
205	Santa Brigida	PH	\N	\N	\N	\N
206	Studená	CZ	\N	\N	\N	\N
207	Sincé	CO	\N	\N	\N	\N
208	Tawali	ID	\N	\N	\N	\N
209	Garang	CN	\N	\N	\N	\N
210	San Miguel de Tucumán	AR	\N	\N	\N	\N
211	Shiqiao	CN	\N	\N	\N	\N
212	Przywidz	PL	\N	\N	\N	\N
213	Nay Pyi Taw	MM	\N	\N	\N	\N
214	Guadalupe	PH	\N	\N	\N	\N
215	Binubusan	PH	\N	\N	\N	\N
216	Al Jumaylīyah	QA	\N	\N	\N	\N
217	Arneiro	PT	\N	\N	\N	\N
218	Jiangcun	CN	\N	\N	\N	\N
219	Tselinnoye	RU	\N	\N	\N	\N
220	Zongzhai	CN	\N	\N	\N	\N
221	Kubang	ID	\N	\N	\N	\N
222	Wola Rębkowska	PL	\N	\N	\N	\N
223	Panzhuang	CN	\N	\N	\N	\N
224	Miraflores	PE	\N	\N	\N	\N
225	Bergen	NO	\N	\N	\N	\N
226	Verkhniy Rohachyk	UA	\N	\N	\N	\N
227	La Ravoire	FR	\N	\N	\N	\N
228	Andorinha	PT	\N	\N	\N	\N
229	Wonosari	ID	\N	\N	\N	\N
230	Jiuchenggong	CN	\N	\N	\N	\N
231	Singaraja	ID	\N	\N	\N	\N
232	Baclayon	PH	\N	\N	\N	\N
233	München	DE	\N	\N	\N	\N
234	Paseh	ID	\N	\N	\N	\N
235	Bourges	FR	\N	\N	\N	\N
236	Nong Ki	TH	\N	\N	\N	\N
237	El Viejo	NI	\N	\N	\N	\N
238	Sihanoukville	KH	\N	\N	\N	\N
239	Morales	CO	\N	\N	\N	\N
240	Puconci	SI	\N	\N	\N	\N
241	Shitong	CN	\N	\N	\N	\N
242	Patrocínio	BR	\N	\N	\N	\N
243	Xiaozhi	CN	\N	\N	\N	\N
244	Brooklyn	US	\N	\N	\N	\N
245	Cilolohan	ID	\N	\N	\N	\N
246	Tarub	ID	\N	\N	\N	\N
247	Esplanada	BR	\N	\N	\N	\N
248	Luhans’ke	UA	\N	\N	\N	\N
249	Lagny-sur-Marne	FR	\N	\N	\N	\N
250	Takatsuki	JP	\N	\N	\N	\N
251	Mölnlycke	SE	\N	\N	\N	\N
252	Övertorneå	SE	\N	\N	\N	\N
253	Trancas	AR	\N	\N	\N	\N
254	Changyanbao	CN	\N	\N	\N	\N
255	Aplahoué	BJ	\N	\N	\N	\N
256	Cincinnati	US	\N	\N	\N	\N
257	Shangdu	CN	\N	\N	\N	\N
258	Mshinskaya	RU	\N	\N	\N	\N
259	Monte	PT	\N	\N	\N	\N
260	Coromoro	CO	\N	\N	\N	\N
261	Hadano	JP	\N	\N	\N	\N
262	Uherské Hradiště	CZ	\N	\N	\N	\N
263	Yeri	CY	\N	\N	\N	\N
264	Prapen	ID	\N	\N	\N	\N
265	Cutral-Có	AR	\N	\N	\N	\N
266	Xiachu	CN	\N	\N	\N	\N
267	Hikari	JP	\N	\N	\N	\N
268	Warungsugan	ID	\N	\N	\N	\N
269	Stepanivka	UA	\N	\N	\N	\N
270	Birmingham	US	\N	\N	\N	\N
271	Syriam	MM	\N	\N	\N	\N
272	Água de Pau	PT	\N	\N	\N	\N
273	Kertasari	ID	\N	\N	\N	\N
274	Maglaj	BA	\N	\N	\N	\N
275	Luziânia	BR	\N	\N	\N	\N
276	Vila Maior	PT	\N	\N	\N	\N
277	Guimba	PH	\N	\N	\N	\N
278	Wołomin	PL	\N	\N	\N	\N
279	Jezzîne	LB	\N	\N	\N	\N
280	Kesugihan	ID	\N	\N	\N	\N
281	Xiangyun	CN	\N	\N	\N	\N
282	Xindu	CN	\N	\N	\N	\N
283	Växjö	SE	\N	\N	\N	\N
284	Quba	AZ	\N	\N	\N	\N
285	Vojnić	HR	\N	\N	\N	\N
286	Al Ma‘baţlī	SY	\N	\N	\N	\N
287	Lanjaghbyur	AM	\N	\N	\N	\N
288	Troitsk	RU	\N	\N	\N	\N
289	Aurora	US	\N	\N	\N	\N
290	Strasbourg	FR	\N	\N	\N	\N
291	Baler Baleagung	ID	\N	\N	\N	\N
292	Qiancheng	CN	\N	\N	\N	\N
293	Ujiie	JP	\N	\N	\N	\N
294	Baokou	CN	\N	\N	\N	\N
295	Obukhiv	UA	\N	\N	\N	\N
296	Xindeng	CN	\N	\N	\N	\N
297	Javorník	CZ	\N	\N	\N	\N
298	Annopol	PL	\N	\N	\N	\N
299	Pereiro	PT	\N	\N	\N	\N
300	Manaulanan	PH	\N	\N	\N	\N
301	Zmiyëvka	RU	\N	\N	\N	\N
302	Parakanpanjang	ID	\N	\N	\N	\N
303	Žleby	CZ	\N	\N	\N	\N
304	São Torcato	PT	\N	\N	\N	\N
305	Alepoú	GR	\N	\N	\N	\N
306	Peterborough	CA	\N	\N	\N	\N
307	Pucallpa	PE	\N	\N	\N	\N
308	Piedras	CO	\N	\N	\N	\N
309	Linquan	CN	\N	\N	\N	\N
310	Kilkenny	IE	\N	\N	\N	\N
311	North Vancouver	CA	\N	\N	\N	\N
312	Curuzú Cuatiá	AR	\N	\N	\N	\N
313	Rennes	FR	\N	\N	\N	\N
314	Alvega	PT	\N	\N	\N	\N
315	Quimper	FR	\N	\N	\N	\N
316	Shabqadar	PK	\N	\N	\N	\N
317	Pemzashen	AM	\N	\N	\N	\N
318	Ngilengan	ID	\N	\N	\N	\N
319	Borovoy	RU	\N	\N	\N	\N
320	Tuchkovo	RU	\N	\N	\N	\N
321	Gengcheng	CN	\N	\N	\N	\N
322	Chicago	US	\N	\N	\N	\N
323	Łyse	PL	\N	\N	\N	\N
324	Łubnice	PL	\N	\N	\N	\N
325	Shilong	CN	\N	\N	\N	\N
326	Dongdajie	CN	\N	\N	\N	\N
327	Sabang	PH	\N	\N	\N	\N
328	Quzi	CN	\N	\N	\N	\N
329	Gorelovo	RU	\N	\N	\N	\N
330	Nahrīn	AF	\N	\N	\N	\N
331	Shixian	CN	\N	\N	\N	\N
332	Staryy Krym	UA	\N	\N	\N	\N
333	Numazu	JP	\N	\N	\N	\N
334	Malita	PH	\N	\N	\N	\N
335	Rawannawi Village	KI	\N	\N	\N	\N
336	Kidal	ML	\N	\N	\N	\N
337	Sanlidian	CN	\N	\N	\N	\N
338	Arauquita	CO	\N	\N	\N	\N
339	Köln	DE	\N	\N	\N	\N
340	Marcq-en-Barœul	FR	\N	\N	\N	\N
341	Bąków	PL	\N	\N	\N	\N
342	Dzüünkharaa	MN	\N	\N	\N	\N
343	Tupiza	BO	\N	\N	\N	\N
344	Kinel’-Cherkassy	RU	\N	\N	\N	\N
345	Gaojian	CN	\N	\N	\N	\N
346	Rosario	AR	\N	\N	\N	\N
347	Changlu	CN	\N	\N	\N	\N
348	El Porvenir	MX	\N	\N	\N	\N
349	Talisay	PH	\N	\N	\N	\N
350	Mandaluyong City	PH	\N	\N	\N	\N
351	Pervomayskoye	RU	\N	\N	\N	\N
352	Żarnów	PL	\N	\N	\N	\N
353	Miłosław	PL	\N	\N	\N	\N
354	Shevchenkove	UA	\N	\N	\N	\N
355	Zhonghuopu	CN	\N	\N	\N	\N
356	Wufu	CN	\N	\N	\N	\N
357	Los Pinos	MX	\N	\N	\N	\N
358	Marmashen	AM	\N	\N	\N	\N
359	Bordeaux	FR	\N	\N	\N	\N
360	Yaodian	CN	\N	\N	\N	\N
361	Koukkuniemi	FI	\N	\N	\N	\N
362	Moroni	KM	\N	\N	\N	\N
363	Kachia	NG	\N	\N	\N	\N
364	Kostyantynivka	UA	\N	\N	\N	\N
365	Serpukhov	RU	\N	\N	\N	\N
366	Dziewin	PL	\N	\N	\N	\N
367	Olleros	PE	\N	\N	\N	\N
368	Pinsk	BY	\N	\N	\N	\N
369	Dongba	CN	\N	\N	\N	\N
370	Laâyoune / El Aaiún	EH	\N	\N	\N	\N
371	Tondabayashichō	JP	\N	\N	\N	\N
372	Talā	EG	\N	\N	\N	\N
373	Jiguan	CN	\N	\N	\N	\N
374	Cedar Rapids	US	\N	\N	\N	\N
375	Wangkung	ID	\N	\N	\N	\N
376	Agen	FR	\N	\N	\N	\N
377	Kalá Déndra	GR	\N	\N	\N	\N
378	Vogar	IS	\N	\N	\N	\N
379	Norak	TJ	\N	\N	\N	\N
380	Chlumčany	CZ	\N	\N	\N	\N
381	Cabalawan	PH	\N	\N	\N	\N
382	Nsukka	NG	\N	\N	\N	\N
383	Quangang	CN	\N	\N	\N	\N
384	Padangulaktanding	ID	\N	\N	\N	\N
385	Al Baqāliţah	TN	\N	\N	\N	\N
386	Barbacoas	VE	\N	\N	\N	\N
387	Retorta	PT	\N	\N	\N	\N
388	Pampachiri	PE	\N	\N	\N	\N
389	Cabanilla	PE	\N	\N	\N	\N
390	Brka	BA	\N	\N	\N	\N
391	Sepanjang	ID	\N	\N	\N	\N
392	Qiaosi	CN	\N	\N	\N	\N
393	Tarrafal de São Nicolau	CV	\N	\N	\N	\N
394	Luleå	SE	\N	\N	\N	\N
395	Utarapasar	ID	\N	\N	\N	\N
396	Głubczyce	PL	\N	\N	\N	\N
397	Yinyang	CN	\N	\N	\N	\N
398	Clarence-Rockland	CA	\N	\N	\N	\N
399	Xi’an	CN	\N	\N	\N	\N
400	Morris	CA	\N	\N	\N	\N
401	Baidoa	SO	\N	\N	\N	\N
402	Maszewo Duże	PL	\N	\N	\N	\N
403	Jayyūs	PS	\N	\N	\N	\N
404	Khiliomódhi	GR	\N	\N	\N	\N
405	Taphan Hin	TH	\N	\N	\N	\N
406	Baisangguan	CN	\N	\N	\N	\N
407	Wonorejo Dua	ID	\N	\N	\N	\N
408	Watublapi	ID	\N	\N	\N	\N
409	Hrib-Loški Potok	SI	\N	\N	\N	\N
410	Ferreñafe	PE	\N	\N	\N	\N
411	Novoanninskiy	RU	\N	\N	\N	\N
412	Lárdos	GR	\N	\N	\N	\N
413	Ndélé	CF	\N	\N	\N	\N
414	Videira	BR	\N	\N	\N	\N
415	Sinjār	SY	\N	\N	\N	\N
416	Chantilly	FR	\N	\N	\N	\N
417	Czerwionka-Leszczyny	PL	\N	\N	\N	\N
418	Yelyzavethradka	UA	\N	\N	\N	\N
419	Zhongxin	CN	\N	\N	\N	\N
420	Balayan	PH	\N	\N	\N	\N
421	Cibangban Girang	ID	\N	\N	\N	\N
422	Guanambi	BR	\N	\N	\N	\N
423	Fajã de Cima	PT	\N	\N	\N	\N
424	Ventersburg	ZA	\N	\N	\N	\N
425	Ghormach	AF	\N	\N	\N	\N
426	Wichita	US	\N	\N	\N	\N
427	Novyy Svit	UA	\N	\N	\N	\N
428	Voiron	FR	\N	\N	\N	\N
429	Bela Vista	BR	\N	\N	\N	\N
430	Chegutu	ZW	\N	\N	\N	\N
431	Semuda	ID	\N	\N	\N	\N
432	Sussex	CA	\N	\N	\N	\N
433	Pulau Pinang	MY	\N	\N	\N	\N
434	Marinilla	CO	\N	\N	\N	\N
435	Binzhou	CN	\N	\N	\N	\N
436	Shirokaya Rechka	RU	\N	\N	\N	\N
437	Shanghuang	CN	\N	\N	\N	\N
438	Danderyd	SE	\N	\N	\N	\N
439	Los Boquerones	PA	\N	\N	\N	\N
440	Al Majd	PS	\N	\N	\N	\N
441	Maraial	BR	\N	\N	\N	\N
442	Banjarsari	ID	\N	\N	\N	\N
443	Trang	TH	\N	\N	\N	\N
444	Kazo	JP	\N	\N	\N	\N
445	Zhonghe	CN	\N	\N	\N	\N
446	Babakan	ID	\N	\N	\N	\N
447	Francisco Villa	MX	\N	\N	\N	\N
448	San Bartolomé Milpas Altas	GT	\N	\N	\N	\N
449	Mekarsari	ID	\N	\N	\N	\N
450	Uppsala	SE	\N	\N	\N	\N
451	San Juan	PE	\N	\N	\N	\N
452	Huangshi	CN	\N	\N	\N	\N
453	Zamora	HN	\N	\N	\N	\N
454	Magisterial	MX	\N	\N	\N	\N
455	Boji	CN	\N	\N	\N	\N
456	Banyumas	ID	\N	\N	\N	\N
457	Santiago De Compostela	ES	\N	\N	\N	\N
458	Lincheng	CN	\N	\N	\N	\N
459	Nyurba	RU	\N	\N	\N	\N
460	Anabar	NR	\N	\N	\N	\N
461	Kuala Terengganu	MY	\N	\N	\N	\N
462	Małkinia Górna	PL	\N	\N	\N	\N
463	Zwolle	NL	\N	\N	\N	\N
464	Netishyn	UA	\N	\N	\N	\N
465	Villefontaine	FR	\N	\N	\N	\N
466	Falun	SE	\N	\N	\N	\N
467	Uruzgān	AF	\N	\N	\N	\N
468	Litian	CN	\N	\N	\N	\N
469	Huiqi	CN	\N	\N	\N	\N
470	Sukasari	ID	\N	\N	\N	\N
471	Bolszewo	PL	\N	\N	\N	\N
472	Mölndal	SE	\N	\N	\N	\N
473	Binangun	ID	\N	\N	\N	\N
474	Tojeira	PT	\N	\N	\N	\N
475	Likino-Dulevo	RU	\N	\N	\N	\N
476	Pandasan	PH	\N	\N	\N	\N
477	Älvängen	SE	\N	\N	\N	\N
478	Maoyang	CN	\N	\N	\N	\N
479	Shangganshan	CN	\N	\N	\N	\N
480	Vilela	PT	\N	\N	\N	\N
481	Longhua	CN	\N	\N	\N	\N
482	Baoxu	CN	\N	\N	\N	\N
483	‘Awaj	SY	\N	\N	\N	\N
484	Chumphon	TH	\N	\N	\N	\N
485	Powassan	CA	\N	\N	\N	\N
486	Izvestkovyy	RU	\N	\N	\N	\N
487	Xiaochuan	CN	\N	\N	\N	\N
488	Estância	BR	\N	\N	\N	\N
489	Pimenta Bueno	BR	\N	\N	\N	\N
490	Cotorra	CO	\N	\N	\N	\N
491	Rancabelut	ID	\N	\N	\N	\N
492	Yanping	CN	\N	\N	\N	\N
493	Sena	TH	\N	\N	\N	\N
494	Talangnan	PH	\N	\N	\N	\N
495	Didou	CN	\N	\N	\N	\N
496	Sida	TH	\N	\N	\N	\N
497	Oklahoma City	US	\N	\N	\N	\N
498	Xihuachi	CN	\N	\N	\N	\N
499	Damawato	PH	\N	\N	\N	\N
500	Claver	PH	\N	\N	\N	\N
501	Sabinópolis	BR	\N	\N	\N	\N
502	Lawonda	ID	\N	\N	\N	\N
503	Pushkinskiye Gory	RU	\N	\N	\N	\N
504	Bayaguana	DO	\N	\N	\N	\N
505	Semibratovo	RU	\N	\N	\N	\N
506	Berëzovskiy	RU	\N	\N	\N	\N
507	Vogan	TG	\N	\N	\N	\N
508	Turpo	PE	\N	\N	\N	\N
509	Río de Jesús	PA	\N	\N	\N	\N
510	Zaozerne	UA	\N	\N	\N	\N
511	Ponoka	CA	\N	\N	\N	\N
512	Lyakhovtsy	UA	\N	\N	\N	\N
513	Shitouhe	CN	\N	\N	\N	\N
514	Kayan Hulu	ID	\N	\N	\N	\N
515	Xinli	CN	\N	\N	\N	\N
516	Tukuyu	TZ	\N	\N	\N	\N
517	Wangwu	CN	\N	\N	\N	\N
518	Longos	PH	\N	\N	\N	\N
519	Odemira	PT	\N	\N	\N	\N
520	Cipanggung	ID	\N	\N	\N	\N
521	Valencia	PH	\N	\N	\N	\N
522	Menzel Abderhaman	TN	\N	\N	\N	\N
523	Phutthaisong	TH	\N	\N	\N	\N
524	Baisha	CN	\N	\N	\N	\N
525	Guiping	CN	\N	\N	\N	\N
526	Hobart	AU	\N	\N	\N	\N
527	Opoczno	PL	\N	\N	\N	\N
528	Carson City	US	\N	\N	\N	\N
529	Vårby	SE	\N	\N	\N	\N
530	Nyandoma	RU	\N	\N	\N	\N
531	Allen	AR	\N	\N	\N	\N
532	Lasehao	ID	\N	\N	\N	\N
533	Longchiqiao	CN	\N	\N	\N	\N
534	Ayamaru	ID	\N	\N	\N	\N
535	Villa Nueva	AR	\N	\N	\N	\N
536	Waitakere	NZ	\N	\N	\N	\N
537	Fatuhilik	ID	\N	\N	\N	\N
538	Dagupan	PH	\N	\N	\N	\N
539	Barrancas	VE	\N	\N	\N	\N
540	Ambatolaona	MG	\N	\N	\N	\N
541	Huaguoshan	CN	\N	\N	\N	\N
542	Gálvez	AR	\N	\N	\N	\N
543	Oropesa	PE	\N	\N	\N	\N
544	Swellendam	ZA	\N	\N	\N	\N
545	Shanglian	CN	\N	\N	\N	\N
546	Houston	US	\N	\N	\N	\N
547	Santiago Vázquez	UY	\N	\N	\N	\N
548	Vale de Figueira	PT	\N	\N	\N	\N
549	Żabbar	MT	\N	\N	\N	\N
550	Куклиш	MK	\N	\N	\N	\N
551	Tucheng	CN	\N	\N	\N	\N
552	Mandepa Barat	ID	\N	\N	\N	\N
553	Yuqi	CN	\N	\N	\N	\N
554	Bebedouro	BR	\N	\N	\N	\N
555	Adstock	CA	\N	\N	\N	\N
556	Kuchurhan	UA	\N	\N	\N	\N
557	Knurów	PL	\N	\N	\N	\N
558	Manjo	CM	\N	\N	\N	\N
559	Sukacai Tengah	ID	\N	\N	\N	\N
560	Lac-Brome	CA	\N	\N	\N	\N
561	Fale old settlement	TK	\N	\N	\N	\N
562	Belén	UY	\N	\N	\N	\N
563	Kaniów	PL	\N	\N	\N	\N
564	Kokar	ID	\N	\N	\N	\N
565	Västra Frölunda	SE	\N	\N	\N	\N
566	Niños Heroes	MX	\N	\N	\N	\N
567	Wangchang	CN	\N	\N	\N	\N
568	Täby	SE	\N	\N	\N	\N
569	Lille	FR	\N	\N	\N	\N
570	Komorniki	PL	\N	\N	\N	\N
571	Pīshvā	IR	\N	\N	\N	\N
572	Huagu	CN	\N	\N	\N	\N
573	Loučeň	CZ	\N	\N	\N	\N
574	Anxi	CN	\N	\N	\N	\N
575	Karangnongko	ID	\N	\N	\N	\N
576	Sędziejowice	PL	\N	\N	\N	\N
577	Shatalovo	RU	\N	\N	\N	\N
578	Biga	PH	\N	\N	\N	\N
579	Ladan	ID	\N	\N	\N	\N
580	Banjar Geriana Kangin	ID	\N	\N	\N	\N
581	Shatian	CN	\N	\N	\N	\N
582	Rouen	FR	\N	\N	\N	\N
583	Hronov	CZ	\N	\N	\N	\N
584	Penedo	BR	\N	\N	\N	\N
585	Chuandao	CN	\N	\N	\N	\N
586	Talawakele	LK	\N	\N	\N	\N
587	Oxelösund	SE	\N	\N	\N	\N
588	Yiánnouli	GR	\N	\N	\N	\N
589	Xingang	CN	\N	\N	\N	\N
590	Frankfort	US	\N	\N	\N	\N
591	Tanabe	JP	\N	\N	\N	\N
592	Norrköping	SE	\N	\N	\N	\N
593	Pital	CO	\N	\N	\N	\N
594	Loja	EC	\N	\N	\N	\N
595	Zhangjiang	CN	\N	\N	\N	\N
596	Qamdo	CN	\N	\N	\N	\N
597	Xiabao	CN	\N	\N	\N	\N
598	Placer	PH	\N	\N	\N	\N
599	Moch	FM	\N	\N	\N	\N
600	Jackson	US	\N	\N	\N	\N
601	Prómachoi	GR	\N	\N	\N	\N
602	Khalkhāl	IR	\N	\N	\N	\N
603	Malec	PL	\N	\N	\N	\N
604	Bangunsari	ID	\N	\N	\N	\N
605	Saint Petersburg	RU	\N	\N	\N	\N
606	Kasui	ID	\N	\N	\N	\N
607	Ramenki	RU	\N	\N	\N	\N
608	Vodyane	UA	\N	\N	\N	\N
609	Kota Kinabalu	MY	\N	\N	\N	\N
610	Dois Córregos	BR	\N	\N	\N	\N
611	Tangkilsari	ID	\N	\N	\N	\N
612	Jilib	SO	\N	\N	\N	\N
613	Podstepki	RU	\N	\N	\N	\N
614	Uzlovaya	RU	\N	\N	\N	\N
615	Reforma	MX	\N	\N	\N	\N
616	Nansha	CN	\N	\N	\N	\N
617	Jiayi	CN	\N	\N	\N	\N
618	Khursā	PS	\N	\N	\N	\N
619	Wielka Nieszawka	PL	\N	\N	\N	\N
620	Asia	PE	\N	\N	\N	\N
621	La Cueva	BO	\N	\N	\N	\N
622	Konstantinovo	BY	\N	\N	\N	\N
623	Sundumbili	ZA	\N	\N	\N	\N
624	Leramatang	ID	\N	\N	\N	\N
625	Poja	ID	\N	\N	\N	\N
626	Krutinka	RU	\N	\N	\N	\N
627	Shisui	JP	\N	\N	\N	\N
628	Sruni	ID	\N	\N	\N	\N
629	Konstantynów	PL	\N	\N	\N	\N
630	Furongqiao	CN	\N	\N	\N	\N
631	Jibiya	NG	\N	\N	\N	\N
632	Pajarillo	PE	\N	\N	\N	\N
633	Acevedo	CO	\N	\N	\N	\N
634	Banayoyo	PH	\N	\N	\N	\N
635	Gaoyu	CN	\N	\N	\N	\N
636	Mogi das Cruzes	BR	\N	\N	\N	\N
637	Xihe	CN	\N	\N	\N	\N
638	Clondalkin	IE	\N	\N	\N	\N
639	Laojie	CN	\N	\N	\N	\N
640	Zgłobień	PL	\N	\N	\N	\N
641	Talabaan	PH	\N	\N	\N	\N
642	Ulset	NO	\N	\N	\N	\N
643	Nagrog Wetan	ID	\N	\N	\N	\N
644	Umi	JP	\N	\N	\N	\N
645	Gambo	CF	\N	\N	\N	\N
646	Rāwandūz	IQ	\N	\N	\N	\N
647	Youfang	CN	\N	\N	\N	\N
648	Antanhol	PT	\N	\N	\N	\N
649	Ercheng	CN	\N	\N	\N	\N
650	Novoselitsa	UA	\N	\N	\N	\N
651	Concepción	CL	\N	\N	\N	\N
652	Thị Trấn Nho Quan	VN	\N	\N	\N	\N
653	Vänersborg	SE	\N	\N	\N	\N
654	Kryvyy Rih	UA	\N	\N	\N	\N
655	Potchefstroom	ZA	\N	\N	\N	\N
656	Longtang	CN	\N	\N	\N	\N
657	Coishco	PE	\N	\N	\N	\N
658	Phichit	TH	\N	\N	\N	\N
659	Göteborg	SE	\N	\N	\N	\N
660	Kinnula	FI	\N	\N	\N	\N
661	Tiznit	MA	\N	\N	\N	\N
662	Litibakul	ID	\N	\N	\N	\N
663	Sirindhorn	TH	\N	\N	\N	\N
664	Tullinge	SE	\N	\N	\N	\N
665	Mataya	PH	\N	\N	\N	\N
666	Bajo Pichanaqui	PE	\N	\N	\N	\N
667	Cikendi	ID	\N	\N	\N	\N
668	Biryukove	UA	\N	\N	\N	\N
669	Fort Pierce	US	\N	\N	\N	\N
670	Tulsa	US	\N	\N	\N	\N
671	Paris 14	FR	\N	\N	\N	\N
672	Sebedo	ID	\N	\N	\N	\N
673	Jovellanos	CU	\N	\N	\N	\N
674	Vanino	RU	\N	\N	\N	\N
675	Ntungamo	UG	\N	\N	\N	\N
676	Baru Timur	ID	\N	\N	\N	\N
677	Atsugi	JP	\N	\N	\N	\N
678	Kuznetsovs’k	UA	\N	\N	\N	\N
679	Igbor	NG	\N	\N	\N	\N
680	Halteu	ID	\N	\N	\N	\N
681	Skalat	UA	\N	\N	\N	\N
682	Boca do Acre	BR	\N	\N	\N	\N
683	Xihongmen	CN	\N	\N	\N	\N
684	Dolní Sloupnice	CZ	\N	\N	\N	\N
685	Qijing	CN	\N	\N	\N	\N
686	Hāla	PK	\N	\N	\N	\N
687	Shaozhai	CN	\N	\N	\N	\N
688	Cermee	ID	\N	\N	\N	\N
689	Nandu	CN	\N	\N	\N	\N
690	Río Tercero	AR	\N	\N	\N	\N
691	Jishi	CN	\N	\N	\N	\N
692	Citeureup	ID	\N	\N	\N	\N
693	Wenceslao Escalante	AR	\N	\N	\N	\N
694	Libato	PH	\N	\N	\N	\N
695	Hema	CN	\N	\N	\N	\N
696	Puerto Santander	CO	\N	\N	\N	\N
697	Pápa	HU	\N	\N	\N	\N
698	Mertert	LU	\N	\N	\N	\N
699	Khao Kho	TH	\N	\N	\N	\N
700	Burgersdorp	ZA	\N	\N	\N	\N
701	Saint-Paul	RE	\N	\N	\N	\N
702	Paris 04	FR	\N	\N	\N	\N
703	Les Coteaux	CA	\N	\N	\N	\N
704	Akankpa	NG	\N	\N	\N	\N
705	San Antonio	VE	\N	\N	\N	\N
706	Mingelchaur	AZ	\N	\N	\N	\N
707	Neringa	LT	\N	\N	\N	\N
708	Huacheng	CN	\N	\N	\N	\N
709	Alingsås	SE	\N	\N	\N	\N
710	Yaohua	CN	\N	\N	\N	\N
711	Bakıxanov	AZ	\N	\N	\N	\N
712	Marseille	FR	\N	\N	\N	\N
713	Altunemil	CN	\N	\N	\N	\N
714	Obsharovka	RU	\N	\N	\N	\N
715	Krajan Kinanti	ID	\N	\N	\N	\N
716	Luchegorsk	RU	\N	\N	\N	\N
717	Suqin Huimin	CN	\N	\N	\N	\N
718	Gantang	CN	\N	\N	\N	\N
719	Huaihe	CN	\N	\N	\N	\N
720	Santa Maria	MX	\N	\N	\N	\N
721	Yefremov	RU	\N	\N	\N	\N
722	Petropavlivka	UA	\N	\N	\N	\N
723	Tonghong	CN	\N	\N	\N	\N
724	Nova Petrópolis	BR	\N	\N	\N	\N
725	Qingyang	CN	\N	\N	\N	\N
726	Södra Sandby	SE	\N	\N	\N	\N
727	Xinglong	CN	\N	\N	\N	\N
728	Dapawan	PH	\N	\N	\N	\N
729	Shengao	CN	\N	\N	\N	\N
730	Zavolzh’ye	RU	\N	\N	\N	\N
731	Vilar do Monte	PT	\N	\N	\N	\N
732	Pachīr wa Āgām	AF	\N	\N	\N	\N
733	Pittsburgh	US	\N	\N	\N	\N
734	Fanrong	CN	\N	\N	\N	\N
735	Peza e Madhe	AL	\N	\N	\N	\N
736	Palykavichy Pyershyya	BY	\N	\N	\N	\N
737	Huddinge	SE	\N	\N	\N	\N
738	Poconé	BR	\N	\N	\N	\N
739	Pilníkov	CZ	\N	\N	\N	\N
740	Karangbaru	ID	\N	\N	\N	\N
741	Shinshiro	JP	\N	\N	\N	\N
742	Campamento	CO	\N	\N	\N	\N
743	Sancha	CN	\N	\N	\N	\N
744	Cikondang	ID	\N	\N	\N	\N
745	Leeuwarden	NL	\N	\N	\N	\N
746	Maliang	CN	\N	\N	\N	\N
747	Luanda	AO	\N	\N	\N	\N
748	Besko	PL	\N	\N	\N	\N
749	Kościerzyna	PL	\N	\N	\N	\N
750	Aguadulce	PA	\N	\N	\N	\N
751	Xiamazhuang	CN	\N	\N	\N	\N
752	Dalar	AM	\N	\N	\N	\N
753	Wschowa	PL	\N	\N	\N	\N
754	Xiangshui	CN	\N	\N	\N	\N
755	Ciracap	ID	\N	\N	\N	\N
756	Yên Lạc	VN	\N	\N	\N	\N
757	Nong Khae	TH	\N	\N	\N	\N
758	Samouco	PT	\N	\N	\N	\N
759	Margahayukencana	ID	\N	\N	\N	\N
760	Nelipyno	UA	\N	\N	\N	\N
761	Akhaltsikhe	GE	\N	\N	\N	\N
762	Viçosa	BR	\N	\N	\N	\N
763	Kuteynykove	UA	\N	\N	\N	\N
764	Jiblah	YE	\N	\N	\N	\N
765	Port Colborne	CA	\N	\N	\N	\N
766	Huxiaoqiao	CN	\N	\N	\N	\N
767	Peredovaya	RU	\N	\N	\N	\N
768	Pieniężno	PL	\N	\N	\N	\N
769	Yanwan	CN	\N	\N	\N	\N
770	Dinggou	CN	\N	\N	\N	\N
771	Abaeté	BR	\N	\N	\N	\N
772	Visaginas	LT	\N	\N	\N	\N
773	Kyaikkami	MM	\N	\N	\N	\N
774	Yakimovo	BG	\N	\N	\N	\N
775	Sampungu	ID	\N	\N	\N	\N
776	Mori	CN	\N	\N	\N	\N
777	Sonzacate	SV	\N	\N	\N	\N
778	Kafr Zaytā	SY	\N	\N	\N	\N
779	Zhangcun	CN	\N	\N	\N	\N
780	Faratsiho	MG	\N	\N	\N	\N
781	Sarvaš	HR	\N	\N	\N	\N
782	Trindade	BR	\N	\N	\N	\N
783	Bailizhou	CN	\N	\N	\N	\N
784	Tacheng	CN	\N	\N	\N	\N
785	Jadów	PL	\N	\N	\N	\N
786	Shuanghejiedao	CN	\N	\N	\N	\N
787	Khodasy	BY	\N	\N	\N	\N
788	Handegate	CN	\N	\N	\N	\N
789	Tagkawayan Sabang	PH	\N	\N	\N	\N
790	Baton Rouge	US	\N	\N	\N	\N
791	Miguel Aleman	MX	\N	\N	\N	\N
792	Bené Beraq	IL	\N	\N	\N	\N
793	Susiec	PL	\N	\N	\N	\N
794	Bokor	ID	\N	\N	\N	\N
795	San Cosme y Damián	PY	\N	\N	\N	\N
796	Gabao	PH	\N	\N	\N	\N
797	Drohiczyn	PL	\N	\N	\N	\N
798	Alah Sāy	AF	\N	\N	\N	\N
799	Hekou	CN	\N	\N	\N	\N
800	Papetoai	PF	\N	\N	\N	\N
801	Otok	HR	\N	\N	\N	\N
802	San Vicente	PH	\N	\N	\N	\N
803	Washington	US	\N	\N	\N	\N
804	Shangshaleng	CN	\N	\N	\N	\N
805	Bandeirantes	BR	\N	\N	\N	\N
806	Kaiapoi	NZ	\N	\N	\N	\N
807	Lianhe	CN	\N	\N	\N	\N
808	Banjar Medura	ID	\N	\N	\N	\N
809	Usquil	PE	\N	\N	\N	\N
810	Kudang	ID	\N	\N	\N	\N
811	Kuangyuan	CN	\N	\N	\N	\N
812	Akbarābād	IR	\N	\N	\N	\N
813	Emiliano Zapata	MX	\N	\N	\N	\N
814	Ikeda	JP	\N	\N	\N	\N
815	St. Catharines	CA	\N	\N	\N	\N
816	Plumbangan	ID	\N	\N	\N	\N
817	Jinjiahe	CN	\N	\N	\N	\N
818	Alès	FR	\N	\N	\N	\N
819	Gandoang	ID	\N	\N	\N	\N
820	Stráž	CZ	\N	\N	\N	\N
821	São Sebastião	BR	\N	\N	\N	\N
822	Sebba	BF	\N	\N	\N	\N
823	Moca	DO	\N	\N	\N	\N
824	Daqiao	CN	\N	\N	\N	\N
825	Xukou	CN	\N	\N	\N	\N
826	Killam	CA	\N	\N	\N	\N
827	Kangxung	CN	\N	\N	\N	\N
828	Poços de Caldas	BR	\N	\N	\N	\N
829	General Elizardo Aquino	PY	\N	\N	\N	\N
830	Gaoqiao	CN	\N	\N	\N	\N
831	Briey	FR	\N	\N	\N	\N
832	Ho	GH	\N	\N	\N	\N
833	Khānaqāh	AF	\N	\N	\N	\N
834	Chynów	PL	\N	\N	\N	\N
835	Pyhäsalmi	FI	\N	\N	\N	\N
836	Ayabe	JP	\N	\N	\N	\N
837	Gujiang	CN	\N	\N	\N	\N
838	Carazinho	BR	\N	\N	\N	\N
839	Shimo-furano	JP	\N	\N	\N	\N
840	Yongchang	CN	\N	\N	\N	\N
841	Paseka	CZ	\N	\N	\N	\N
842	Manay	PH	\N	\N	\N	\N
843	President Roxas	PH	\N	\N	\N	\N
844	Përmet	AL	\N	\N	\N	\N
845	Suncun	CN	\N	\N	\N	\N
846	Valence	FR	\N	\N	\N	\N
847	Otra Banda	DO	\N	\N	\N	\N
848	Picoto	PT	\N	\N	\N	\N
849	Lat Yao	TH	\N	\N	\N	\N
850	Cibolang	ID	\N	\N	\N	\N
851	Phu Kradueng	TH	\N	\N	\N	\N
852	Carrigtwohill	IE	\N	\N	\N	\N
853	Banī Mazār	EG	\N	\N	\N	\N
854	Volosovo	RU	\N	\N	\N	\N
855	Solna	SE	\N	\N	\N	\N
856	Peuteuy	ID	\N	\N	\N	\N
857	La Courneuve	FR	\N	\N	\N	\N
858	Foumbot	CM	\N	\N	\N	\N
859	Gawul	ID	\N	\N	\N	\N
860	Novotroitsk	RU	\N	\N	\N	\N
861	San Felipe	CR	\N	\N	\N	\N
862	Yaurisque	PE	\N	\N	\N	\N
863	Sōja	JP	\N	\N	\N	\N
864	Uryupinsk	RU	\N	\N	\N	\N
865	Vir	SI	\N	\N	\N	\N
866	Goz Béïda	TD	\N	\N	\N	\N
867	Banjar Tiga	ID	\N	\N	\N	\N
868	Korenovsk	RU	\N	\N	\N	\N
869	Mayo	PH	\N	\N	\N	\N
870	Velký Újezd	CZ	\N	\N	\N	\N
871	Argalastí	GR	\N	\N	\N	\N
872	Järfälla	SE	\N	\N	\N	\N
873	Lobito	AO	\N	\N	\N	\N
874	Dongtai	CN	\N	\N	\N	\N
875	Zliten	LY	\N	\N	\N	\N
876	Olympia	US	\N	\N	\N	\N
877	Gjirokastër	AL	\N	\N	\N	\N
878	Kokubu-matsuki	JP	\N	\N	\N	\N
879	Västerås	SE	\N	\N	\N	\N
880	Staten Island	US	\N	\N	\N	\N
881	Nowe Warpno	PL	\N	\N	\N	\N
882	Katakwi	UG	\N	\N	\N	\N
883	Bicas	PT	\N	\N	\N	\N
884	Karakabak	CN	\N	\N	\N	\N
885	Vol’nyy Aul	RU	\N	\N	\N	\N
886	Mankoeng	ZA	\N	\N	\N	\N
887	Adraskan	AF	\N	\N	\N	\N
888	Besisahar	NP	\N	\N	\N	\N
889	Karangarjo	ID	\N	\N	\N	\N
890	U Minh	VN	\N	\N	\N	\N
891	Carenang Lor	ID	\N	\N	\N	\N
892	Cajati	BR	\N	\N	\N	\N
893	Heemskerk	NL	\N	\N	\N	\N
894	Dinahican	PH	\N	\N	\N	\N
895	Shawan	CN	\N	\N	\N	\N
896	Hwawŏn	KR	\N	\N	\N	\N
897	Qal‘ah-ye Na‘īm	AF	\N	\N	\N	\N
898	Ohafia-Ifigh	NG	\N	\N	\N	\N
899	Santol	PH	\N	\N	\N	\N
900	Taipinghu	CN	\N	\N	\N	\N
901	Turiys’k	UA	\N	\N	\N	\N
902	Tanxi	CN	\N	\N	\N	\N
903	Dolní Lhota	CZ	\N	\N	\N	\N
904	Manwakh	YE	\N	\N	\N	\N
905	Shiren	CN	\N	\N	\N	\N
906	Ancol	ID	\N	\N	\N	\N
907	Taradale	NZ	\N	\N	\N	\N
908	Jianshe	CN	\N	\N	\N	\N
909	Tanumshede	SE	\N	\N	\N	\N
910	Rucheng Chengguanzhen	CN	\N	\N	\N	\N
911	Petrozavodsk	RU	\N	\N	\N	\N
912	Zarya	UA	\N	\N	\N	\N
913	Bungur	ID	\N	\N	\N	\N
914	Porto Alto	PT	\N	\N	\N	\N
915	Banjar Danginsema	ID	\N	\N	\N	\N
916	Chigoré	PA	\N	\N	\N	\N
917	Storozhevaya	RU	\N	\N	\N	\N
918	Quimperlé	FR	\N	\N	\N	\N
919	Nangerang	ID	\N	\N	\N	\N
920	Wanzhai	CN	\N	\N	\N	\N
921	Oriximiná	BR	\N	\N	\N	\N
922	Sidomakmur	ID	\N	\N	\N	\N
923	Biaoxi	CN	\N	\N	\N	\N
924	Hoxtolgay	CN	\N	\N	\N	\N
925	Pakemitan	ID	\N	\N	\N	\N
926	Guanajuato	MX	\N	\N	\N	\N
927	Achanizo	PE	\N	\N	\N	\N
928	Zhouzhuang	CN	\N	\N	\N	\N
929	Lorient	FR	\N	\N	\N	\N
930	Soledade	BR	\N	\N	\N	\N
931	Shuigou’ao	CN	\N	\N	\N	\N
932	Kanḏay	AF	\N	\N	\N	\N
933	Takub	PH	\N	\N	\N	\N
934	Ekibastuz	KZ	\N	\N	\N	\N
935	Hengliang	CN	\N	\N	\N	\N
936	Hulín	CZ	\N	\N	\N	\N
937	Rakhiv	UA	\N	\N	\N	\N
938	Kaburon	ID	\N	\N	\N	\N
939	Haczów	PL	\N	\N	\N	\N
940	Ōkawara	JP	\N	\N	\N	\N
941	Gravataí	BR	\N	\N	\N	\N
942	Muchkapskiy	RU	\N	\N	\N	\N
943	Capacho Nuevo	VE	\N	\N	\N	\N
944	Cuyotenango	GT	\N	\N	\N	\N
945	Mesiméri	GR	\N	\N	\N	\N
946	Neglasari	ID	\N	\N	\N	\N
947	Karangampel	ID	\N	\N	\N	\N
948	Dongfeng	CN	\N	\N	\N	\N
949	Pokrovo-Prigorodnoye	RU	\N	\N	\N	\N
950	Kamubheka	ID	\N	\N	\N	\N
951	Nanjiao	CN	\N	\N	\N	\N
952	Sarandë	AL	\N	\N	\N	\N
953	Krasnyy Oktyabr’	RU	\N	\N	\N	\N
954	Princeville	CA	\N	\N	\N	\N
955	Samburat	ID	\N	\N	\N	\N
956	Huangtan	CN	\N	\N	\N	\N
957	Tangzha	CN	\N	\N	\N	\N
958	Semikarakorsk	RU	\N	\N	\N	\N
959	Barengkok Hilir	ID	\N	\N	\N	\N
960	Halong	ID	\N	\N	\N	\N
961	Kondinskoye	RU	\N	\N	\N	\N
962	Agudos	BR	\N	\N	\N	\N
963	St. Thomas	CA	\N	\N	\N	\N
964	Nggelok	ID	\N	\N	\N	\N
965	Fredrikstad	NO	\N	\N	\N	\N
966	Inkerman	UA	\N	\N	\N	\N
967	Tsotsin-Yurt	RU	\N	\N	\N	\N
968	Lees Summit	US	\N	\N	\N	\N
969	Oehala	ID	\N	\N	\N	\N
970	Aragarças	BR	\N	\N	\N	\N
971	Simpang Ulim	ID	\N	\N	\N	\N
972	Koronadal	PH	\N	\N	\N	\N
973	Khanu Woralaksaburi	TH	\N	\N	\N	\N
974	Novogurovskiy	RU	\N	\N	\N	\N
975	Arapongas	BR	\N	\N	\N	\N
976	Xixiang	CN	\N	\N	\N	\N
977	Guanfang	CN	\N	\N	\N	\N
978	Hrastnik	SI	\N	\N	\N	\N
979	Jiulong	CN	\N	\N	\N	\N
980	Yangping	CN	\N	\N	\N	\N
981	Belleville	CA	\N	\N	\N	\N
982	Brovary	UA	\N	\N	\N	\N
983	Mŭglizh	BG	\N	\N	\N	\N
984	Sigu	CN	\N	\N	\N	\N
985	Bafoussam	CM	\N	\N	\N	\N
986	‘Afrīn	SY	\N	\N	\N	\N
987	Toba	RS	\N	\N	\N	\N
988	Virginia Beach	US	\N	\N	\N	\N
989	Wangliao	CN	\N	\N	\N	\N
990	Brněnec	CZ	\N	\N	\N	\N
991	Bayart Huxu	CN	\N	\N	\N	\N
992	Ploemeur	FR	\N	\N	\N	\N
993	Xincheng	CN	\N	\N	\N	\N
994	Dasht-e Lati	IR	\N	\N	\N	\N
995	Hitachi	JP	\N	\N	\N	\N
996	Dhamār	YE	\N	\N	\N	\N
997	Pasiripis	ID	\N	\N	\N	\N
998	Chavárion	GR	\N	\N	\N	\N
999	Komsomolets	KZ	\N	\N	\N	\N
1000	Shazhouba	CN	\N	\N	\N	\N
1001	Chocos	PE	\N	\N	\N	\N
1002	Graikochóri	GR	\N	\N	\N	\N
1003	Xitan	CN	\N	\N	\N	\N
1004	Katyr-Yurt	RU	\N	\N	\N	\N
1005	Labé	GN	\N	\N	\N	\N
1006	Taltal	CL	\N	\N	\N	\N
1007	Zhob	PK	\N	\N	\N	\N
1008	Bailang	CN	\N	\N	\N	\N
1009	Panganiban	PH	\N	\N	\N	\N
1010	Catamayo	EC	\N	\N	\N	\N
1011	Alabat	PH	\N	\N	\N	\N
1012	Darungan	ID	\N	\N	\N	\N
1013	Chiryū	JP	\N	\N	\N	\N
1014	Lasusua	ID	\N	\N	\N	\N
1015	Baishui	CN	\N	\N	\N	\N
1016	Novyye Kuz’minki	RU	\N	\N	\N	\N
1017	Mar’’ina Horka	BY	\N	\N	\N	\N
1018	Babo-Pangulo	PH	\N	\N	\N	\N
1019	Guam Government House	GU	\N	\N	\N	\N
1020	Caculé	BR	\N	\N	\N	\N
1021	Sufālat Samā’il	OM	\N	\N	\N	\N
1022	Grazhdanka	RU	\N	\N	\N	\N
1023	Kouloúra	GR	\N	\N	\N	\N
1024	Gaoyi	CN	\N	\N	\N	\N
1025	Xiashan	CN	\N	\N	\N	\N
1026	Sochi	RU	\N	\N	\N	\N
1027	Firminy	FR	\N	\N	\N	\N
1028	Beisijiazi	CN	\N	\N	\N	\N
1029	Tanggu	CN	\N	\N	\N	\N
1030	Semypolky	UA	\N	\N	\N	\N
1031	Phôngsali	CN	\N	\N	\N	\N
1032	Guanshan	CN	\N	\N	\N	\N
1033	Sukarara Utara	ID	\N	\N	\N	\N
1034	Bantal	ID	\N	\N	\N	\N
1035	Kadubera	ID	\N	\N	\N	\N
1036	Luuka Town	UG	\N	\N	\N	\N
1037	Nanmen	CN	\N	\N	\N	\N
1038	Sulyukta	KG	\N	\N	\N	\N
1039	Cigadog Hilir	ID	\N	\N	\N	\N
1040	General Martín Miguel de Güemes	AR	\N	\N	\N	\N
1041	Morelos	MX	\N	\N	\N	\N
1042	Rosebank	ZA	\N	\N	\N	\N
1043	Lagoa de Albufeira	PT	\N	\N	\N	\N
1044	Lajarik	ID	\N	\N	\N	\N
1045	Buzhakan	AM	\N	\N	\N	\N
1046	Verin Artashat	AM	\N	\N	\N	\N
1047	Anuradhapura	LK	\N	\N	\N	\N
1048	Tangwei	CN	\N	\N	\N	\N
1049	Mora	SE	\N	\N	\N	\N
1050	Maracha	UG	\N	\N	\N	\N
1051	El Paso	US	\N	\N	\N	\N
1052	Francisco I Madero	MX	\N	\N	\N	\N
1053	Cobre	PT	\N	\N	\N	\N
1054	Vrakháti	GR	\N	\N	\N	\N
1055	Słupno	PL	\N	\N	\N	\N
1056	Batelov	CZ	\N	\N	\N	\N
1057	Totok	ID	\N	\N	\N	\N
1058	São João dos Inhamuns	BR	\N	\N	\N	\N
1059	Simunul	PH	\N	\N	\N	\N
1060	San José de Mayo	UY	\N	\N	\N	\N
1061	Niedzica	PL	\N	\N	\N	\N
1062	Sharïngol	MN	\N	\N	\N	\N
1063	Neiva	CO	\N	\N	\N	\N
1064	Shuya	RU	\N	\N	\N	\N
1065	Kissidougou	GN	\N	\N	\N	\N
1066	Krasnorechenskiy	RU	\N	\N	\N	\N
1067	Promyshlennaya	RU	\N	\N	\N	\N
1068	Klirou	CY	\N	\N	\N	\N
1069	Yeping	CN	\N	\N	\N	\N
1070	Baluk	ID	\N	\N	\N	\N
1071	El Suyatal	HN	\N	\N	\N	\N
1072	Huasahuasi	PE	\N	\N	\N	\N
1073	Malakwāl	PK	\N	\N	\N	\N
1074	Buôn Ma Thuột	VN	\N	\N	\N	\N
84	Rio De Janeiro	BR	-22.90278	-43.2075	\N	\N
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('cities_city_id_seq', 1074, true);


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
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	4
11	11	4
12	12	10
13	13	4
14	14	11
15	15	4
16	16	12
17	17	13
18	18	14
19	19	15
20	20	16
21	21	4
22	22	17
23	23	18
24	24	7
25	25	4
26	26	4
27	18	19
28	28	4
29	29	20
30	30	1
31	31	1
32	32	21
33	33	22
34	34	12
35	35	11
36	36	4
37	37	23
38	38	24
39	39	25
40	40	24
41	41	10
42	42	26
43	43	27
44	44	28
45	45	29
46	46	1
47	47	7
48	48	25
49	49	12
50	50	30
51	51	31
52	52	32
53	53	33
54	54	6
55	55	13
56	56	13
57	57	2
58	58	34
59	59	4
60	60	35
61	61	12
62	62	36
63	63	24
64	64	15
65	65	37
66	66	24
67	67	1
68	68	7
69	69	38
70	70	39
71	71	40
72	72	41
73	73	39
74	74	7
75	75	42
76	76	13
77	77	39
78	78	43
79	79	44
80	80	45
81	81	46
82	82	38
83	83	22
84	84	39
85	85	47
86	86	39
87	87	48
88	88	45
89	89	49
90	90	50
91	91	13
92	92	13
93	93	13
94	94	13
95	95	13
96	96	51
97	97	6
98	98	52
99	99	17
100	100	13
101	101	13
102	102	24
103	103	53
104	104	13
105	105	25
106	106	13
107	107	54
108	108	55
109	109	56
110	110	13
111	111	41
112	103	53
113	113	13
114	114	13
115	115	13
116	116	57
117	117	37
118	118	6
119	119	58
120	120	59
121	121	60
122	122	26
123	123	31
124	124	61
125	125	60
126	126	28
127	127	62
128	128	47
129	129	15
130	124	45
131	131	63
132	132	64
133	133	60
134	134	31
135	135	28
136	136	65
137	137	66
138	138	66
139	139	61
140	140	28
141	141	7
142	142	24
143	143	31
144	144	67
145	145	68
146	146	69
147	147	27
148	148	70
149	149	13
150	150	27
151	151	24
152	152	71
153	153	72
154	154	29
155	155	73
156	156	74
157	157	72
158	158	8
159	159	75
160	160	16
161	161	2
162	162	76
163	163	72
164	164	44
165	165	77
166	166	13
167	167	7
168	53	33
169	169	78
170	170	72
171	171	15
172	172	67
173	173	79
174	174	80
175	175	81
176	176	31
177	177	82
178	178	83
179	179	26
180	180	37
181	181	64
182	182	84
183	183	28
184	184	84
185	185	66
186	186	84
187	187	66
188	188	85
189	189	37
190	190	86
191	191	13
192	192	87
193	193	84
194	194	28
195	195	88
196	196	69
197	197	69
198	198	62
199	199	60
200	200	83
201	201	30
202	202	84
203	203	84
204	204	84
205	205	66
206	206	17
207	207	7
208	208	89
209	209	90
210	210	32
211	211	60
212	212	91
213	213	92
214	214	93
215	215	45
216	216	45
217	217	94
218	218	13
219	219	24
220	220	95
221	221	7
222	222	31
223	223	96
224	224	93
225	225	73
226	226	38
227	227	57
228	228	2
229	229	50
230	230	97
231	231	98
232	232	99
233	233	13
234	234	38
235	235	100
236	236	60
237	237	101
238	238	102
239	239	81
240	240	103
241	241	13
242	242	1
243	243	1
244	244	66
245	245	104
246	246	37
247	247	13
248	248	105
249	249	17
250	250	24
251	251	86
252	252	66
253	253	1
254	254	17
255	255	13
256	256	66
257	257	21
258	258	106
259	259	24
260	260	16
261	261	44
262	262	13
263	263	37
264	264	107
265	265	108
266	266	57
267	267	109
268	268	13
269	269	104
270	270	73
271	271	60
272	272	41
273	273	81
274	274	41
275	275	6
276	276	7
277	277	110
278	278	111
279	279	41
280	280	73
281	281	45
282	234	91
283	283	6
284	284	6
285	285	62
286	286	57
287	287	112
288	288	13
289	289	81
290	290	37
291	291	27
292	292	113
293	293	114
294	294	45
295	295	28
296	296	34
297	297	81
298	298	13
299	299	102
300	300	115
301	301	104
302	302	66
303	303	13
304	304	12
305	305	116
306	306	13
307	307	60
308	308	104
309	309	60
310	310	104
311	311	66
312	312	87
313	313	13
314	314	12
315	315	66
316	316	12
317	317	31
318	318	117
319	319	61
320	320	13
321	321	13
322	322	21
323	323	31
324	324	12
325	325	66
326	326	116
327	327	60
328	328	51
329	329	66
330	330	118
331	331	119
332	332	28
333	333	72
334	334	74
335	335	24
336	336	116
337	337	26
338	338	88
339	339	17
340	340	42
341	341	16
342	342	120
343	343	44
344	344	66
345	345	121
346	346	29
347	347	122
348	348	123
349	349	124
350	350	61
351	351	72
352	352	13
353	353	30
354	354	3
355	355	125
356	356	123
357	357	26
358	358	26
359	359	126
360	360	70
361	361	26
362	362	60
363	363	72
364	364	66
365	365	26
366	366	127
367	367	86
368	368	126
369	369	24
370	370	128
371	371	129
372	372	11
373	373	17
374	374	15
375	375	13
376	376	130
377	377	30
378	378	53
379	376	123
380	380	13
381	381	128
382	382	4
383	383	15
384	384	111
385	385	131
386	386	128
387	387	62
388	388	16
389	389	132
390	390	124
391	391	51
392	392	24
393	393	133
394	394	102
395	395	58
396	396	86
397	397	12
398	398	134
399	399	37
400	400	92
401	401	12
402	402	135
403	403	12
404	404	12
405	405	136
406	406	102
407	407	137
408	408	138
409	409	93
410	410	64
411	411	12
412	412	139
413	413	7
414	414	62
415	415	66
416	416	7
417	417	13
418	418	62
419	419	92
420	420	7
421	421	13
422	422	6
423	423	8
424	424	140
425	425	13
426	426	73
427	427	119
428	428	27
429	429	141
430	430	12
431	431	45
432	432	7
433	433	21
434	434	73
435	435	13
436	436	8
437	437	142
438	438	143
439	439	144
440	440	42
441	441	145
442	442	146
443	443	68
444	444	7
445	445	15
446	446	87
447	447	47
448	448	147
449	449	148
450	450	74
451	451	149
452	452	13
453	453	66
454	454	68
455	455	150
456	456	151
457	457	1
458	458	1
459	459	73
460	460	152
461	461	51
462	462	152
463	463	68
464	464	153
465	465	62
466	466	64
467	467	104
468	468	66
469	469	13
470	470	15
471	471	31
472	472	17
473	473	37
474	474	152
475	475	64
476	476	67
477	477	154
478	478	46
479	479	73
480	480	150
481	481	59
482	482	12
483	483	72
484	484	44
485	485	62
486	486	62
487	487	25
488	488	38
489	489	61
490	490	146
491	491	62
492	492	57
493	493	50
494	494	69
495	495	126
496	496	61
497	497	62
498	498	62
499	499	103
500	500	13
501	501	64
502	502	15
503	503	13
504	504	155
505	505	61
506	506	7
507	507	15
508	508	126
509	509	26
510	510	156
511	511	2
512	512	24
513	512	24
514	514	132
515	18	14
516	516	14
517	18	14
518	518	26
519	519	12
520	520	19
521	521	13
522	522	67
523	523	29
524	18	14
525	525	149
526	526	132
527	527	37
528	528	157
529	529	149
530	530	6
531	531	132
532	532	13
533	533	133
534	534	48
535	535	24
536	536	67
537	537	31
538	18	14
539	539	16
540	540	16
541	541	13
542	542	13
543	543	158
544	544	105
545	545	87
546	546	13
547	547	13
548	548	43
549	549	13
550	550	10
551	551	7
552	552	87
553	553	117
554	554	30
555	555	13
556	556	31
557	557	13
558	558	44
559	559	159
560	560	43
561	561	7
562	562	160
563	563	12
564	564	7
565	565	1
566	566	7
567	567	6
568	568	49
569	569	104
570	570	13
571	571	12
572	572	4
573	573	4
574	574	70
575	575	61
576	576	6
577	18	161
578	18	161
579	579	7
580	580	59
581	581	147
582	582	30
583	583	27
584	584	150
585	585	162
586	586	70
587	587	93
588	588	163
589	589	67
590	590	146
591	591	15
592	592	164
593	18	161
594	594	13
595	18	161
596	596	30
597	18	161
598	598	11
599	599	62
600	600	132
601	601	69
602	602	66
603	603	83
604	604	43
605	605	165
606	606	29
607	607	57
608	608	166
609	609	165
610	610	165
611	611	165
612	612	103
613	613	167
614	614	27
615	615	27
616	616	16
617	617	15
618	618	69
619	619	168
620	620	165
621	621	57
622	622	118
623	623	9
624	624	126
625	625	169
626	626	165
627	627	109
628	628	72
629	629	27
630	630	126
631	631	6
632	632	6
633	633	119
634	634	170
635	635	73
636	636	7
637	637	31
638	638	21
639	639	146
640	640	13
641	641	29
642	642	162
643	643	171
644	341	16
645	645	64
646	646	57
647	647	172
648	648	28
649	649	173
650	650	171
651	651	134
652	652	95
653	653	13
654	654	57
655	655	62
656	656	15
657	657	150
658	658	171
659	659	84
660	660	106
661	661	13
662	662	8
663	663	174
664	664	7
665	665	146
666	666	119
667	667	73
668	668	51
669	669	67
670	670	32
671	671	62
672	672	12
673	673	133
674	674	60
675	675	175
676	676	24
677	677	17
678	678	30
679	679	166
680	680	102
681	681	150
682	682	21
683	683	66
684	684	150
685	685	176
686	686	62
687	687	37
688	688	9
689	689	66
690	690	45
691	691	170
692	692	177
693	693	23
694	694	24
695	695	178
696	696	179
697	697	7
698	698	123
699	699	61
700	700	50
701	701	67
702	702	168
703	703	180
704	704	50
705	705	37
706	706	7
707	707	181
708	708	7
709	709	178
710	643	52
711	711	182
712	712	13
713	713	123
714	714	68
715	715	171
716	716	13
717	717	183
718	718	68
719	719	2
720	720	184
721	721	60
722	722	26
723	723	13
724	724	60
725	725	185
726	726	186
727	727	161
728	728	13
729	729	42
730	730	187
731	731	132
732	732	60
733	727	161
734	734	60
735	727	161
736	18	19
737	737	46
738	738	188
739	739	132
740	740	189
741	741	186
742	742	7
743	743	60
744	744	45
745	745	64
746	746	132
747	747	13
748	748	186
749	749	186
750	750	93
751	751	28
752	752	37
753	753	37
754	754	13
755	755	166
756	756	37
757	757	190
758	758	6
759	759	7
760	760	11
761	761	191
762	762	61
763	763	24
764	764	51
765	765	2
766	766	192
767	767	2
768	768	68
769	769	170
770	770	73
771	771	73
772	772	193
773	773	194
774	774	195
775	775	196
776	776	123
777	777	2
778	778	183
779	779	13
780	780	28
781	781	12
782	782	197
783	783	198
784	784	160
785	785	62
786	786	51
787	787	15
788	788	12
789	789	12
790	790	23
791	791	27
792	792	8
793	793	31
794	794	31
795	795	28
796	796	36
797	797	15
798	798	163
799	799	13
800	800	103
801	801	46
802	802	87
803	803	13
804	804	127
805	805	160
806	806	66
807	807	45
808	808	15
809	809	104
810	810	15
811	811	13
812	812	66
813	813	13
814	814	199
815	815	73
816	816	13
817	817	13
818	818	66
819	819	51
820	820	1
821	821	10
822	822	16
823	823	37
824	824	37
825	825	8
826	826	16
827	827	200
828	828	13
829	829	199
830	830	66
831	831	104
832	832	106
833	833	73
834	834	133
835	835	86
836	836	7
837	837	201
838	838	95
839	839	202
840	840	13
841	841	56
842	842	13
843	843	107
844	844	13
845	845	7
846	846	30
847	847	133
848	848	15
849	849	186
850	850	13
851	851	73
852	852	103
853	853	24
854	854	15
855	855	30
856	856	7
857	857	15
858	858	51
859	859	13
860	860	27
861	861	18
862	862	37
863	863	64
864	864	135
865	865	67
866	866	15
867	867	168
868	868	21
869	869	7
870	870	31
871	871	27
872	872	13
873	873	8
874	874	13
875	875	13
876	876	13
877	877	101
878	878	47
879	879	7
880	880	67
881	881	45
882	882	13
883	883	67
884	884	61
885	885	67
886	886	202
887	887	203
888	888	151
889	889	133
890	890	24
891	891	2
892	892	24
893	893	86
894	894	133
895	895	198
896	896	15
897	897	67
898	898	62
899	899	180
900	900	31
901	901	13
902	902	91
903	903	118
904	904	62
905	905	32
906	906	6
907	907	150
908	908	45
909	909	17
910	910	66
911	911	66
912	912	30
913	913	17
914	914	37
915	915	15
916	916	32
917	917	204
918	918	24
919	919	32
920	920	31
921	921	16
922	922	66
923	923	13
924	924	13
925	925	17
926	926	33
927	927	1
928	928	52
929	929	26
930	930	37
931	931	11
932	932	4
933	933	11
934	934	29
935	608	166
936	936	13
937	937	27
938	938	4
939	939	4
940	940	4
941	941	4
942	942	68
943	943	4
944	944	4
945	945	1
946	946	4
947	947	124
948	948	11
949	658	171
950	643	171
951	951	205
952	356	123
953	953	118
954	954	45
955	955	7
956	956	4
957	957	4
958	958	31
959	959	84
960	960	206
961	961	45
962	962	42
963	963	59
964	964	151
965	961	45
966	966	126
967	967	188
968	968	92
969	969	186
970	970	68
971	971	207
972	972	7
973	973	53
974	974	135
975	975	7
976	976	16
977	977	42
978	978	127
979	979	62
980	980	127
981	981	127
982	982	7
983	983	151
984	984	208
985	985	203
986	986	188
987	987	127
988	988	7
989	989	26
990	990	62
991	991	12
992	992	28
993	993	41
994	994	13
995	995	57
996	996	209
997	997	210
998	998	31
999	999	16
1000	1000	65
1001	1001	13
1002	1002	27
1003	1003	13
1004	1004	28
1005	1005	13
1006	1006	211
1007	1007	16
1008	1008	118
1009	1009	126
1010	1010	101
1011	1011	6
1012	1012	24
1013	1013	65
1014	1014	42
1015	1015	16
1016	1016	12
1017	1017	72
1018	1018	7
1019	1019	61
1020	1020	62
1021	1021	13
1022	1022	6
1023	1023	24
1024	1024	13
1025	1025	13
1026	1026	6
1027	1027	66
1028	1028	48
1029	1029	7
1030	1030	24
1031	1031	142
1032	1032	17
1033	1033	13
1034	1034	13
1035	1035	15
1036	1036	45
1037	1037	13
1038	1038	15
1039	1039	160
1040	1040	24
1041	1041	67
1042	1042	7
1043	1043	31
1044	1044	64
1045	1045	15
1046	1046	12
1047	1047	51
1048	1048	36
1049	1049	186
1050	1050	15
1051	1051	212
1052	1052	101
1053	1053	1
1054	1054	53
1055	1055	213
1056	1056	16
1057	1057	212
1058	1058	214
1059	1059	89
1060	1060	215
1061	1061	216
1062	1062	6
1063	1063	24
1064	1064	15
1065	1065	217
1066	1066	8
1067	1067	13
1068	1068	92
1069	1069	218
1070	1070	15
1071	1071	215
1072	1072	15
1073	1073	219
1074	1074	30
1075	1075	14
1076	1076	220
1077	1077	220
1078	1078	17
1079	1079	37
1080	1080	118
1081	1081	13
1082	1082	13
1083	1083	54
1084	1084	13
1085	1085	13
1086	1086	119
1087	1087	221
1088	1088	1
1089	1089	222
1090	1090	118
1091	1091	13
1092	1092	13
1093	1093	60
1094	1094	66
1095	1095	112
1096	1096	53
1097	1097	7
1098	1098	118
1099	1099	166
1100	1100	50
1101	1101	15
1102	1102	30
1103	1103	31
1104	1104	13
1105	1105	168
1106	1106	62
1107	1107	206
1108	1097	15
1109	1109	45
1110	1110	139
1111	1111	223
1112	1112	3
1113	1113	26
1114	1114	13
1115	1115	210
1116	1116	68
1117	1117	53
1118	1118	28
1119	1119	224
1120	1120	27
1121	1121	225
1122	1122	3
1123	1123	28
1124	1124	73
1125	1125	3
1126	1126	61
1127	1127	226
1128	1128	3
1129	1119	224
1130	1130	227
1131	1131	28
1132	1132	72
1133	1133	228
1134	1134	57
1135	1135	64
1136	1136	7
1137	1137	31
1138	1138	229
1139	1139	177
1140	1140	61
1141	1141	27
1142	1142	203
1143	1143	96
1144	1144	74
1145	1145	60
1146	1146	26
1147	1147	70
1148	1148	60
1149	1149	230
1150	1150	86
1151	1151	231
1152	1152	47
1153	1153	81
1154	1154	81
1155	1155	7
1156	1156	61
1157	1157	24
1158	1157	24
1159	1159	142
1160	1160	60
1161	1161	231
1162	1162	232
1163	1163	233
1164	1164	223
1165	1165	11
1166	1166	203
1167	1167	234
1168	1168	89
1169	1169	101
1170	1170	118
1171	1171	72
1172	1172	235
1173	1173	92
1174	1174	235
1175	1175	172
1176	1176	236
1177	1177	26
1178	1178	123
1179	1179	9
1180	1180	13
1181	1181	64
1182	1182	44
1183	1183	72
1184	1184	7
1185	1185	237
1186	1186	64
1187	1187	10
1188	1188	235
1189	1189	57
1190	1190	101
1191	1191	61
1192	1192	132
1193	1193	235
1194	1194	238
1195	1195	223
1196	1196	7
1197	1197	13
1198	1198	72
1199	1199	186
1200	1200	7
1201	1201	66
1202	1202	13
1203	1203	73
1204	1204	72
1205	1205	213
1206	1206	66
1207	1207	118
1208	1208	31
1209	1209	6
1210	1210	61
1211	1211	108
1212	1212	87
1213	296	108
1214	1214	13
1215	1215	7
1216	1216	45
1217	1217	12
1218	1218	54
1219	1219	204
1220	1220	27
1221	1221	17
1222	1222	239
1223	1223	37
1224	1224	108
1225	1225	240
1226	1226	57
1227	1227	30
1228	1228	16
1229	1229	6
1230	1230	73
1231	1231	13
1232	1232	2
1233	1233	241
1234	1234	67
1235	1235	12
1236	1236	13
1237	1237	12
1238	1238	24
1239	1239	13
1240	1240	13
1241	1241	242
1242	1242	60
1243	1243	93
1244	1244	12
1245	1245	166
1246	1246	36
1247	1247	13
1248	1248	23
1249	1249	24
1250	1250	110
1251	1251	28
1252	1252	209
1253	1253	195
1254	1254	28
1255	1255	7
1256	1256	13
1257	1257	243
1258	1258	106
1259	1259	13
1260	1260	28
1261	1261	24
1262	1262	1
1263	1263	86
1264	1264	92
1265	1265	204
1266	1266	31
1267	1267	45
1268	1268	31
1269	1269	32
1270	1270	37
1271	1271	64
1272	1272	172
1273	1273	37
1274	1274	30
1275	1275	45
1276	1276	47
1277	1277	27
1278	1278	67
1279	1279	24
1280	1280	204
1281	1281	15
1282	1266	225
1283	1283	204
1284	1284	32
1285	1285	31
1286	1286	181
1287	1266	31
1288	1288	168
1289	1289	204
1290	1290	62
1291	1291	197
1292	1292	143
1293	1293	24
1294	1294	66
1295	1295	68
1296	1296	41
1297	1297	244
1298	1298	104
1299	1299	37
1300	1300	12
1301	1301	61
1302	1302	147
1303	1303	203
1304	1304	61
1305	1305	104
1306	1306	6
1307	1307	27
1308	1308	31
1309	1309	60
1310	1310	143
1311	1311	245
1312	1312	61
1313	1313	143
1314	1314	12
1315	1315	246
1316	1316	203
1317	1317	6
1318	1318	68
1319	1319	66
1320	1320	61
1321	1321	13
1322	1322	21
1323	1323	142
1324	1324	247
1325	1325	28
1326	1326	51
1327	1327	1
1328	1328	223
1329	1329	39
1330	1330	206
1331	1331	148
1332	1332	31
1333	1333	15
1334	1334	39
1335	1335	27
1336	1336	13
1337	1337	13
1338	1338	46
1339	1339	75
1340	1340	25
1341	1341	15
1342	1342	27
1343	1343	7
1344	1333	15
1345	1345	30
1346	1346	166
1347	1347	109
1348	1348	7
1349	1349	64
1350	1350	7
1351	1351	29
1352	1352	149
1353	1353	28
1354	1354	22
1355	1354	28
1356	1356	149
1357	1357	69
1358	1358	28
1359	1359	142
1360	1360	122
1361	1361	62
1362	1362	248
1363	1363	29
1364	1364	28
1365	1365	108
1366	1366	249
1367	1367	146
1368	1368	22
1369	1369	22
1370	1370	57
1371	1371	28
1372	1372	250
1373	1373	50
1374	1374	108
1375	1375	7
1376	1376	57
1377	1354	28
1378	1378	251
1379	1379	93
1380	1380	64
1381	1381	26
1382	1382	27
1383	1383	12
1384	1384	123
1385	1385	12
1386	1386	26
1387	1387	12
1388	1388	6
1389	1389	67
1390	1390	244
1391	1391	12
1392	1392	13
1393	383	15
1394	1394	31
1395	1395	7
1396	1389	244
1397	1397	20
1398	1398	72
1399	1399	7
1400	1400	57
1401	1401	151
1402	1402	64
1403	1403	3
1404	1404	170
1405	1405	135
1406	1406	101
1407	1407	135
1408	1408	7
1409	1409	95
1410	1410	70
1411	1411	62
1412	1412	52
1413	1413	17
1414	1414	72
1415	1411	61
1416	1411	61
1417	1417	66
1418	1418	61
1419	1419	252
1420	1420	17
1421	1421	53
1422	1422	123
1423	1423	61
1424	1424	52
1425	1425	223
1426	1426	13
1427	1427	7
1428	1428	9
1429	1429	17
1430	1430	93
1431	1431	15
1432	1432	53
1433	1433	62
1434	1434	53
1435	383	7
1436	1436	53
1437	1437	146
1438	1438	67
1439	1439	72
1440	1440	53
1441	1441	146
1442	1442	67
1443	1443	195
1444	1444	45
1445	1445	186
1446	1446	13
1447	1447	101
1448	1448	119
1449	1449	186
1450	1450	197
1451	1451	195
1452	1452	13
1453	1453	13
1454	1454	68
1455	1455	9
1456	1456	123
1457	1457	62
1458	1458	42
1459	1459	42
1460	1460	253
1461	1461	62
1462	1462	68
1463	1463	184
1464	1464	15
1465	1465	126
1466	1466	92
1467	1467	31
1468	1468	223
1469	1469	37
1470	1470	41
1471	1471	27
1472	1472	6
1473	1473	254
1474	1474	62
1475	1475	61
1476	1476	2
1477	1477	255
1478	1478	51
1479	1479	61
1480	1480	66
1481	1481	256
1482	1482	45
1483	1483	7
1484	1484	7
1485	1485	24
1486	1486	41
1487	1487	27
1488	1488	136
1489	1489	163
1490	1490	72
1491	1491	101
1492	1492	15
1493	1493	57
1494	1494	15
1495	1495	118
1496	1496	32
1497	1497	29
1498	1498	236
1499	1499	50
1500	1500	7
1501	1501	227
1502	1502	114
1503	1503	66
1504	1504	66
1505	1505	60
1506	1506	13
1507	1507	13
1508	1508	27
1509	1509	12
1510	1510	18
1511	1511	13
1512	1512	120
1513	1513	27
1514	1514	12
1515	1515	257
1516	1516	93
1517	1517	188
1518	1518	93
1519	1519	6
1520	1520	37
1521	1521	24
1522	1522	136
1523	1523	147
1524	1524	113
1525	1525	30
1526	1526	114
1527	1527	97
1528	1528	62
1529	1529	13
1530	1530	126
1531	1531	13
1532	1532	15
1533	1533	30
1534	1534	246
1535	1535	66
1536	1536	64
1537	1537	66
1538	1538	24
1539	1539	258
1540	1540	61
1541	1541	181
1542	1542	49
1543	1543	88
1544	1544	92
1545	1545	66
1546	1546	28
1547	1547	77
1548	1548	62
1549	1549	61
1550	1550	26
1551	1551	7
1552	1552	133
1553	1553	12
1554	1554	15
1555	1116	68
1556	1556	28
1557	1557	118
1558	1558	259
1559	1559	28
1560	1560	75
1561	1561	12
1562	1562	2
1563	1563	28
1564	1564	86
1565	1565	28
1566	1566	31
1567	1567	25
1568	1568	28
1569	91	13
1570	1570	28
1571	1571	28
1572	1572	28
1573	1573	13
1574	1574	6
1575	1575	28
1576	1576	28
1577	1577	60
1578	1578	6
1579	1579	210
1580	1580	13
1581	1581	18
1582	1582	7
1583	1583	62
1584	1584	22
1585	1585	30
1586	1586	67
1587	1587	13
1588	1588	17
1589	1589	7
1590	1586	67
1591	1591	260
1592	1592	178
1593	1593	7
1594	1594	62
1595	1595	146
1596	1596	29
1597	1597	70
1598	1598	7
1599	1599	7
1600	1600	244
1601	1601	261
1602	1602	77
1603	1603	48
1604	1604	47
1605	1605	122
1606	1606	7
1607	1607	7
1608	1608	7
1609	1609	162
1610	1610	7
1611	1611	133
1612	1612	7
1613	1613	133
1614	1614	133
1615	1615	7
1616	1616	15
1617	1617	45
1618	1618	177
1619	1619	41
1620	1620	7
1621	1621	13
1622	1622	122
1623	1623	13
1624	1624	66
1625	1625	13
1626	1626	28
1627	1627	195
1628	1628	13
1629	1629	12
1630	1630	15
1631	1631	31
1632	1632	262
1633	1633	263
1634	1634	73
1635	1635	13
1636	1636	264
1637	1637	7
1638	1638	113
1639	1639	86
1640	1640	127
1641	1641	13
1642	1642	66
1643	1643	7
1644	1644	31
1645	1645	66
1646	1646	12
1647	1647	265
1648	1648	10
1649	1649	266
1650	1650	54
1651	1651	246
1652	1652	234
1653	1653	15
1654	1654	234
1655	1655	53
1656	1656	62
1657	1657	57
1658	1658	26
1659	1659	15
1660	1660	15
1661	1661	135
1662	1662	48
1663	1663	152
1664	1664	61
1665	1665	31
1666	1666	146
1667	1667	62
1668	1668	15
1669	1669	163
1670	1670	50
1671	1671	7
1672	1672	72
1673	1673	62
1674	1674	108
1675	1675	41
1676	1676	62
1677	1677	77
1678	1678	1
1679	1679	15
1680	1680	267
1681	1681	81
1682	1682	41
1683	1683	7
1684	1684	81
1685	1685	81
1686	1686	60
1687	1687	211
1688	1688	45
1689	1689	128
1690	1690	128
1691	1691	128
1692	1692	128
1693	1693	50
1694	1694	62
1695	1695	93
1696	1696	128
1697	1697	99
1698	1698	268
1699	1699	269
1700	1700	62
1701	1701	113
1702	1702	101
1703	1703	75
1704	1704	46
1705	1705	249
1706	1706	62
1707	1707	101
1708	1708	128
1709	1709	7
1710	1710	120
1711	1711	62
1712	1712	41
1713	1713	13
1714	1714	63
1715	1715	42
1716	1716	158
1717	1717	62
1718	1718	37
1719	1719	13
1720	1720	44
1721	1721	44
1722	1722	57
1723	1723	70
1724	1724	163
1725	1725	42
1726	1726	12
1727	1727	177
1728	1728	13
1729	1729	204
1730	1730	42
1731	1731	67
1732	1732	8
1733	1733	61
1734	1734	50
1735	1735	61
1736	1736	61
1737	1737	32
1738	1738	15
1739	1739	41
1740	1740	27
1741	1741	13
1742	1742	13
1743	1743	203
1744	1744	1
1745	1745	15
1746	1746	93
1747	1747	24
1748	1748	15
1749	1749	133
1750	1750	203
1751	1751	67
1752	1752	223
1753	1745	15
1754	1754	15
1755	1755	51
1756	1756	123
1757	1757	270
1758	1758	50
1759	1759	102
1760	1760	271
1761	1761	133
1762	1762	27
1763	1763	13
1764	383	15
1765	1765	181
1766	1766	24
1767	1767	15
1768	383	15
1769	1769	72
1770	1770	13
1771	1771	199
1772	1772	60
1773	1773	60
1774	1774	66
1775	1775	73
1776	1776	61
1777	1777	7
1778	1778	60
1779	1779	60
1780	1780	32
1781	1781	1
1782	1782	60
1783	1783	12
1784	1784	12
1785	1785	110
1786	1786	31
1787	1787	15
1788	1788	66
1789	1789	150
1790	1790	32
1791	1791	7
1792	1792	13
1793	1793	150
1794	1790	32
1795	1795	66
1796	1796	150
1797	1797	272
1798	1798	64
1799	1799	111
1800	1800	150
1801	1801	60
1802	1802	133
1803	1803	31
1804	1804	145
1805	1805	53
1806	1806	7
1807	1807	133
1808	1808	70
1809	1809	67
1810	1810	185
1811	1811	106
1812	1812	60
1813	1813	53
1814	1814	70
1815	1815	92
1816	1816	60
1817	1817	273
1818	1818	3
1819	1819	61
1820	1820	72
1821	1821	64
1822	1822	74
1823	1823	7
1824	1824	60
1825	1825	45
1826	1826	15
1827	1827	274
1828	1828	62
1829	1829	7
1830	1830	26
1831	1831	51
1832	1832	66
1833	1833	112
1834	1834	13
1835	1835	12
1836	1836	51
1837	1837	275
1838	1838	45
1839	1839	254
1840	1840	37
1841	1841	68
1842	1842	42
1843	1843	180
1844	1844	203
1845	1845	13
1846	1846	42
1847	1847	186
1848	1848	62
1849	1849	61
1850	1850	92
1851	1851	15
1852	1852	46
1853	1853	13
1854	1854	45
1855	1855	101
1856	1856	206
1857	1857	67
1858	1858	15
1859	1859	64
1860	1860	225
1861	1861	7
1862	1862	13
1863	1863	42
1864	1864	66
1865	1865	42
1866	1866	85
1867	1867	178
1868	1868	13
1869	1869	31
1870	1870	12
1871	1871	26
1872	1872	195
1873	1873	57
1874	1874	42
1875	1875	150
1876	1876	12
1877	1877	28
1878	1878	203
1879	1878	15
1880	1880	46
1881	1881	146
1882	1882	146
1883	1883	88
1884	1884	61
1885	1885	181
1886	1886	1
1887	1887	61
1888	1888	37
1889	1889	111
1890	1890	13
1891	1891	27
1892	1892	61
1893	1893	61
1894	1894	26
1895	1895	57
1896	1896	13
1897	1897	15
1898	1898	170
1899	1899	61
1900	1900	57
1901	1901	68
1902	1902	77
1903	1903	146
1904	1904	12
1905	1905	101
1906	1906	119
1907	1900	57
1908	1908	13
1909	1909	211
1910	1910	231
1911	1911	57
1912	1912	111
1913	1913	113
1914	1914	276
1915	1915	177
1916	1897	15
1917	1917	67
1918	1918	118
1919	1919	58
1920	1920	123
1921	1621	13
1922	1622	122
1923	1623	13
1924	1624	66
1925	1625	13
1926	1626	28
1927	1627	195
1928	1628	13
1929	1629	12
1930	1630	15
1931	1631	31
1932	1632	262
1933	1633	263
1934	1634	73
1935	1635	13
1936	1636	264
1937	1637	7
1938	1638	113
1939	1639	86
1940	1640	127
1941	1641	13
1942	1642	66
1943	1643	7
1944	1644	31
1945	1645	66
1946	1646	12
1947	1647	265
1948	1648	10
1949	1649	266
1950	1650	54
1951	1951	21
1952	1952	12
1953	1953	12
1954	1954	147
1955	1955	66
1956	1956	12
1957	1957	31
1958	1958	12
1959	1959	184
1960	1960	1
1961	1961	66
1962	471	31
1963	1963	105
1964	1964	62
1965	1965	101
1966	1966	1
1967	1967	142
1968	1968	1
1969	1969	73
1970	1970	53
1971	1971	1
1972	1972	57
1973	1973	24
1974	1974	42
1975	1975	31
1976	1976	66
1977	1977	140
1978	1978	45
1979	1979	101
1980	1980	27
1981	1981	62
1982	1982	28
1983	1983	57
1984	1984	28
1985	1985	244
1986	1986	184
1987	1987	64
1988	1988	146
1989	1989	163
1990	1990	61
1991	1991	57
1992	1992	66
1993	1993	64
1994	1994	61
1995	1995	64
1996	1996	277
1997	1997	64
1998	1998	46
1999	1999	28
2000	2000	61
2001	2001	204
2002	2002	211
2003	2003	28
2004	2004	28
2005	2005	197
2006	2006	95
2007	2007	28
2008	2008	57
2009	383	15
2010	2010	184
2011	2011	272
2012	2012	26
2013	2013	272
2014	2014	211
2015	2015	70
2016	2016	42
2017	2017	73
2018	2018	1
2019	2019	31
2020	2020	70
2021	2021	42
2022	2022	272
2023	2023	272
2024	2024	203
2025	2025	272
2026	2026	163
2027	2027	236
2028	2028	61
2029	2029	126
2030	2030	272
2031	2031	272
2032	2032	272
2033	2033	60
2034	2034	70
2035	2035	60
2036	2036	47
2037	2037	69
2038	2038	7
2039	2039	69
2040	2040	7
2041	2041	243
2042	2042	118
2043	2043	74
2044	2044	72
2045	2045	50
2046	2046	72
2047	2047	215
2048	2048	3
2049	2049	72
2050	2050	123
2051	2051	3
2052	2052	278
2053	2053	38
2054	2054	118
2055	383	15
2056	2056	150
2057	2057	69
2058	2058	42
2059	2059	279
2060	2060	44
2061	2061	223
2062	2062	7
2063	2063	72
2064	2064	62
2065	2065	140
2066	2066	70
2067	2067	280
2068	2068	279
2069	2069	62
2070	2070	120
2071	2071	3
2072	2072	72
2073	2073	7
2074	2074	50
2075	2073	42
2076	2076	16
2077	2077	67
2078	2078	7
2079	2079	44
2080	2080	61
2081	2081	16
2082	2082	62
2083	2083	44
2084	2084	83
2085	2085	118
2086	2086	223
2087	2087	249
2088	2088	126
2089	2089	72
2090	2090	7
2091	2091	70
2092	2092	126
2093	2093	42
2094	2094	9
2095	2095	7
2096	2096	44
2097	2097	62
2098	2098	61
2099	2099	163
2100	2100	7
2101	2101	26
2102	961	45
2103	2103	15
2104	2104	277
2105	2105	281
2106	2106	281
2107	2107	68
2108	2108	77
2109	2109	31
2110	2110	281
2111	2111	181
2112	2112	50
2113	2113	26
2114	2114	126
2115	2115	15
2116	2116	75
2117	2117	105
2118	2118	15
2119	2119	24
2120	2120	127
2121	2121	7
2122	2122	127
2123	2123	127
2124	2124	127
2125	2125	188
2126	2126	281
2127	2127	127
2128	383	15
2129	2129	15
2130	2130	13
2131	2131	261
2132	2132	67
2133	2133	282
2134	2134	281
2135	2135	28
2136	2136	26
2137	2137	43
2138	2138	28
2139	2139	60
2140	2140	57
2141	2141	28
2142	2142	37
2143	2143	44
2144	2144	16
2145	2145	7
2146	2146	28
2147	2147	13
2148	2148	62
2149	2149	33
2150	2150	123
2151	2151	60
2152	2152	12
2153	2153	127
2154	2154	45
2155	2155	132
2156	2156	13
2157	2157	28
2158	2158	122
2159	2159	283
2160	2160	93
2161	2161	67
2162	2162	44
2163	2163	132
2164	2164	104
2165	2165	284
2166	2166	132
2167	2167	104
2168	2168	26
2169	2169	104
2170	2170	132
2171	2171	246
2172	2172	62
2173	2173	181
2174	2174	67
2175	2175	38
2176	2176	7
2177	2177	285
2178	2178	45
2179	2179	31
2180	2180	113
2181	2181	284
2182	2182	177
2183	2183	224
2184	2184	16
2185	2185	62
2186	2186	285
2187	2187	284
2188	2188	64
2189	2189	132
2190	2190	16
2191	2191	72
2192	2192	11
2193	2193	61
2194	2194	7
2195	2195	286
2196	2196	204
2197	2197	135
2198	2198	7
2199	2199	259
2200	2200	67
2201	2201	31
2202	2202	57
2203	2203	62
2204	2204	140
2205	2205	163
2206	2206	42
2207	2207	58
2208	2208	30
2209	2209	75
2210	2210	27
2211	2211	1
2212	2212	287
2213	2213	168
2214	2214	163
2215	2215	73
2216	2216	61
2217	2217	151
2218	2218	133
2219	2219	7
2220	2220	62
2221	2221	62
2222	2222	13
2223	2223	122
2224	2224	16
2225	2225	31
2226	2226	8
2227	2227	68
2228	2228	28
2229	2229	13
2230	2230	181
2231	2231	10
2232	2232	12
2233	2233	7
2234	2234	12
2235	2235	64
2236	2236	204
2237	2237	168
2238	2238	13
2239	2239	28
2240	2240	31
2241	2241	66
2242	2242	72
2243	2243	7
2244	2244	123
2245	2245	53
2246	2246	162
2247	2247	62
2248	2248	50
2249	2249	28
2250	2250	160
2251	2251	60
2252	2252	60
2253	2253	60
2254	2254	60
2255	2255	62
2256	2256	101
2257	2257	13
2258	2258	7
2259	2259	62
2260	2260	44
2261	2261	288
2262	2262	44
2263	2263	30
2264	2264	42
2265	2265	126
2266	2266	7
2267	2267	42
2268	2268	30
2269	2269	60
2270	2270	289
2271	2271	61
2272	2272	60
2273	2273	289
2274	2274	7
2275	2275	44
2276	2276	67
2277	2277	42
2278	2278	15
2279	2279	226
2280	2280	141
2281	2281	224
2282	2282	61
2283	2283	177
2284	2284	165
2285	2285	170
2286	2286	7
2287	2287	64
2288	2288	30
2289	2289	68
2290	2290	244
2291	2291	68
2292	2292	133
2293	2293	62
2294	2294	7
2295	2295	62
2296	2296	244
2297	2297	31
2298	2298	211
2299	2299	224
2300	2300	45
2301	2301	60
2302	2302	113
2303	2303	70
2304	2304	7
2305	2305	62
2306	2306	7
2307	2307	96
2308	2308	244
2309	2309	61
2310	2310	69
2311	2311	38
2312	2312	73
2313	2313	126
2314	1143	96
2315	2315	154
2316	2316	139
2317	2317	31
2318	2318	45
2319	2319	47
2320	2320	224
2321	2321	15
2322	2322	71
2323	2323	7
2324	2324	67
2325	2325	118
2326	2326	119
2327	2327	6
2328	2328	223
2329	2329	146
2330	2317	31
2331	2331	66
2332	2332	139
2333	2333	50
2334	2334	15
2335	2335	61
2336	2336	61
2337	2337	7
2338	2315	154
2339	2339	7
2340	2340	60
2341	2341	13
2342	2342	28
2343	2343	2
2344	2344	15
2345	2345	2
2346	2346	28
2347	2347	68
2348	2348	28
2349	2349	2
2350	2350	13
2351	2351	168
2352	2352	2
2353	2353	186
2354	2354	28
2355	2355	132
2356	2356	57
2357	2357	70
2358	2358	13
2359	2359	16
2360	2360	62
2361	2361	42
2362	2362	31
2363	2363	28
2364	2364	2
2365	2365	52
2366	2366	31
2367	2367	42
2368	2368	50
2369	2369	184
2370	2370	16
2371	2371	81
2372	2372	26
2373	2373	144
2374	2374	28
2375	2375	26
2376	2376	29
2377	2377	72
2378	2378	13
2379	2379	28
2380	2380	124
2381	2381	26
2382	2382	74
2383	341	16
2384	2384	72
2385	2385	4
2386	2386	28
2387	2387	132
2388	2388	62
2389	2389	28
2390	2390	26
2391	2391	123
2392	2392	168
2393	2393	44
2394	2394	70
2395	2395	7
2396	2396	74
2397	383	7
2398	2398	11
2399	2399	13
2400	2400	28
2401	2401	166
2402	2402	13
2403	2403	290
2404	2404	13
2405	2405	66
2406	2406	13
2407	2407	27
2408	2408	108
2409	2409	271
2410	2410	243
2411	2411	6
2412	2412	249
2413	2413	147
2414	2414	140
2415	2415	66
2416	2416	13
2417	2417	243
2418	2418	136
2419	2419	34
2420	2420	13
2421	2421	223
2422	2422	49
2423	2423	27
2424	2424	17
2425	2425	12
2426	2426	31
2427	2427	18
2428	2428	290
2429	2429	79
2430	2430	13
2431	2431	7
2432	2432	13
2433	2433	140
2434	2434	234
2435	2374	22
2436	2387	132
2437	2437	37
2438	2438	13
2439	2439	72
2440	2440	44
2441	2441	62
2442	2442	7
2443	2443	42
2444	2444	74
2445	2445	57
2446	2446	26
2447	2447	133
2448	2448	61
2449	2449	28
2450	2450	16
2451	2451	209
2452	2452	72
2453	2453	16
2454	2454	171
2455	2455	7
2456	2456	136
2457	2457	101
2458	1143	96
2459	2459	223
2460	2460	128
2461	2461	66
2462	1201	66
2463	2463	66
2464	2464	104
2465	2465	7
2466	2466	68
2467	2467	40
2468	2468	117
2469	2469	160
2470	2470	37
2471	2471	31
2472	2472	6
2473	2465	7
2474	2474	101
2475	2475	60
2476	2476	223
2477	2477	66
2478	2478	61
2479	2479	66
2480	2480	12
2481	2481	45
2482	2482	31
2483	2483	31
2484	2484	31
2485	2485	31
2486	2486	66
2487	2487	68
2488	2488	73
2489	2489	21
2490	2490	61
2491	2491	12
2492	2492	231
2493	2493	8
2494	2494	28
2495	2495	28
2496	2496	8
2497	2497	105
2498	2498	104
2499	2499	28
2500	2500	27
2501	2501	8
2502	2502	28
2503	2503	24
2504	2504	28
2505	2505	28
2506	2506	28
2507	2507	151
2508	2508	13
2509	2509	28
2510	2510	12
2511	2511	12
2512	2512	120
2513	2513	17
2514	2514	12
2515	2515	291
2516	2516	24
2517	2517	60
2518	2518	12
2519	2516	24
2520	2520	28
2521	2521	67
2522	2522	292
2523	2523	25
2524	2524	7
2525	2525	62
2526	2526	17
2527	2527	6
2528	2528	15
2529	2529	252
2530	2530	64
2531	2531	46
2532	2532	30
2533	2533	32
2534	2534	15
2535	2535	95
2536	2536	64
2537	2537	44
2538	2538	170
2539	2539	31
2540	2540	273
2541	2541	151
2542	2542	293
2543	2543	13
2544	2544	13
2545	2545	16
2546	2546	92
2547	2547	7
2548	2548	294
2549	2549	295
2550	2550	101
2551	2551	170
2552	2552	17
2553	2553	13
2554	2554	7
2555	2555	13
2556	2556	17
2557	2557	37
2558	2558	52
2559	2559	17
2560	2560	195
2561	2561	148
2562	2562	37
2563	2563	73
2564	2564	53
2565	2565	37
2566	2566	110
2567	2567	41
2568	2568	110
2569	2569	67
2570	2570	13
2571	2571	15
2572	2572	42
2573	2573	147
2574	2574	106
2575	2575	13
2576	2576	2
2577	2577	166
2578	2578	238
2579	2579	53
2580	2580	15
2581	2581	140
2582	2582	163
2583	2583	226
2584	2584	77
2585	2585	67
2586	2586	13
2587	2587	66
2588	2588	77
2589	2588	77
2590	2590	99
2591	2591	296
2592	2592	168
2593	2593	15
2594	2594	297
2595	2595	156
2596	2596	199
2597	2597	45
2598	2598	101
2599	2599	96
2600	2600	15
2601	2601	96
2602	2588	77
2603	2603	67
2604	2604	72
2605	2605	79
2606	2588	171
2607	2607	16
2608	2608	126
2609	2609	101
2610	2610	79
2611	2611	1
2612	2612	28
2613	2613	13
2614	2614	15
2615	2615	7
2616	2616	163
2617	2617	7
2618	2618	28
2619	2619	46
2620	2620	64
2621	2621	195
2622	2622	113
2623	2623	64
2624	2624	106
2625	2625	70
2626	2626	72
2627	2627	15
2628	2628	62
2629	2629	298
2630	2630	234
2631	2631	28
2632	2632	7
2633	2633	160
2634	2634	7
2635	2635	7
2636	2636	7
2637	2637	61
2638	2638	7
2639	2639	76
2640	2640	108
2641	2641	52
2642	2642	139
2643	2643	109
2644	2644	88
2645	2645	7
2646	2646	45
2647	2647	195
2648	2648	15
2649	1041	67
2650	2650	61
2651	2651	110
2652	2652	25
2653	2653	37
2654	2654	15
2655	2655	71
2656	2656	13
2657	2657	13
2658	2658	66
2659	2659	15
2660	2660	27
2661	2661	126
2662	2662	7
2663	2663	37
2664	2664	73
2665	2665	13
2666	2666	30
2667	2667	77
2668	2668	68
2669	2669	299
2670	2670	265
2671	2671	60
2672	2672	60
2673	2673	13
2674	2674	104
2675	2675	198
2676	2676	253
2677	2677	133
2678	2678	66
2679	2679	106
2680	2680	66
2681	2681	7
2682	2682	6
2683	2683	86
2684	2684	66
2685	2685	75
2686	2686	95
2687	2687	265
2688	2688	110
2689	2689	202
2690	2690	106
2691	2691	66
2692	2692	13
2693	2693	151
2694	2694	37
2695	2695	30
2696	2696	53
2697	2697	73
2698	2698	7
2699	2699	106
2700	2700	62
2701	2503	24
2702	2702	13
2703	2703	51
2704	2704	31
2705	2705	27
2706	2704	31
2707	2707	10
2708	2708	13
2709	2709	37
2710	2710	6
2711	2704	31
2712	2712	13
2713	2713	64
2714	2714	276
2715	2715	62
2716	2716	186
2717	2717	105
2718	2718	118
2719	2719	33
2720	2720	171
2721	2721	249
2722	2722	45
2723	2723	27
2724	2704	31
2725	2725	300
2726	2726	37
2727	2727	45
2728	2728	93
2729	2729	103
2730	2730	59
2731	2731	2
2732	2732	13
2733	2733	13
2734	2734	24
2735	2735	13
2736	2736	195
2737	2737	13
2738	2738	13
2739	2739	36
2740	2740	61
2741	2741	96
2742	2742	223
2743	2743	67
2744	2744	28
2745	2745	28
2746	2746	195
2747	2747	6
2748	2748	13
2749	2749	301
2750	2750	61
2751	2751	21
2752	2752	73
2753	2753	28
2754	2743	67
2755	2755	183
2756	2756	49
2757	2757	15
2758	2758	24
2759	2759	202
2760	2760	193
2761	2761	273
2762	2762	41
2763	2763	53
2764	2764	74
2765	2765	132
2766	2766	24
2767	2767	44
2768	2768	60
2769	2769	7
2770	2770	72
2771	2771	302
2772	2772	132
2773	2773	26
2774	2774	303
2775	2775	253
2776	2776	70
2777	2777	83
2778	2778	132
2779	2779	61
2780	2780	46
2781	2781	132
2782	2782	13
2783	2783	3
2784	2784	67
2785	2785	26
2786	2786	231
2787	2787	72
2788	2788	304
2789	2789	302
2790	2790	64
2791	2791	13
2792	2792	24
2793	2793	163
2794	2794	111
2795	2795	16
2796	2796	7
2797	2797	305
2798	2798	64
2799	2799	72
2800	2800	109
2801	2801	132
2802	2802	72
2803	2803	62
2804	2804	111
2805	2805	127
2806	2806	64
2807	2807	306
2808	2808	15
2809	2809	53
2810	2810	66
2811	2811	162
2812	2812	307
2813	2813	73
2814	2814	71
2815	2815	68
2816	2816	60
2817	2817	109
2818	2818	91
2819	2819	67
2820	2820	223
2821	2821	13
2822	2822	37
2823	2823	126
2824	2824	13
2825	2825	27
2826	2826	93
2827	2827	13
2828	2828	172
2829	2829	1
2830	2830	13
2831	2831	24
2832	2832	148
2833	2833	308
2834	2834	33
2835	2835	13
2836	2836	170
2837	2837	104
2838	2838	67
2839	2839	49
2840	2840	93
2841	2841	117
2842	2842	27
2843	2843	195
2844	2844	13
2845	2845	180
2846	2846	61
2847	2847	116
2848	2848	45
2849	2849	12
2850	2850	13
2851	2851	111
2852	2852	12
2853	2853	132
2854	2854	64
2855	2855	15
2856	2855	15
2857	2857	15
2858	2858	66
2859	2859	89
2860	2860	72
2861	2861	50
2862	2862	60
2863	2863	61
2864	2855	15
2865	2865	109
2866	2866	72
2867	2867	30
2868	2868	132
2869	2869	72
2870	2855	15
2871	2871	44
2872	2872	72
2873	2855	15
2874	2874	67
2875	2875	10
2876	2876	132
2877	2877	132
2878	2878	132
2879	2879	15
2880	2880	15
2881	2881	103
2882	2882	37
2883	2883	86
2884	2884	51
2885	2885	170
2886	2886	67
2887	2887	13
2888	2888	73
2889	2889	16
2890	2890	51
2891	2886	67
2892	2892	106
2893	2893	184
2894	2894	37
2895	2895	146
2896	2896	31
2897	2897	309
2898	2898	31
2899	2899	31
2900	2893	184
2901	2898	31
2902	2902	42
2903	2903	147
2904	2904	163
2905	2893	184
2906	2906	13
2907	2896	31
2908	2908	37
2909	2909	160
2910	2910	66
2911	2911	68
2912	2912	105
2913	2913	60
2914	2914	60
2915	2915	41
2916	2916	60
2917	2917	310
2918	2918	149
2919	2919	108
2920	2920	8
2921	2921	27
2922	2922	163
2923	2923	22
2924	2924	170
2925	2925	88
2926	2926	311
2927	2927	108
2928	2928	41
2929	2929	101
2930	2930	60
2931	2931	67
2932	2932	15
2933	2933	141
2934	2934	160
2935	2935	60
2936	2936	149
2937	2937	312
2938	296	108
2939	2939	313
2940	2940	106
2941	2941	26
2942	2942	7
2943	2943	61
2944	2944	64
2945	2945	28
2946	2946	181
2947	2947	26
2948	2948	314
2949	2949	62
2950	2950	7
2951	2951	177
2952	2952	62
2953	2953	185
2954	2954	132
2955	2955	177
2956	2956	28
2957	2957	314
2958	2958	314
2959	2959	124
2960	2960	57
2961	2961	92
2962	2962	170
2963	2963	314
2964	2964	64
2965	2965	314
2966	2966	113
2967	2967	44
2968	2968	61
2969	2969	314
2970	2970	13
2971	2971	204
2972	2972	197
2973	2973	26
2974	2974	62
2975	2975	149
2976	2976	126
2977	2977	29
2978	2978	28
2979	2979	28
2980	2980	29
2981	2981	57
2982	2982	26
2983	2983	29
2984	2984	29
2985	2985	72
2986	2986	69
2987	2987	31
2988	2988	28
2989	2989	50
2990	2990	28
2991	2991	72
2992	2992	16
2993	2993	9
2994	2994	29
2995	2995	61
2996	2996	74
2997	2997	93
2998	2998	184
2999	2999	315
3000	1994	61
3001	3001	77
3002	3002	244
3003	3003	31
3004	2986	69
3005	3005	21
3006	3006	61
3007	3007	146
3008	3008	66
3009	3009	28
3010	3010	113
3011	3011	74
3012	3012	61
3013	3013	178
3014	3014	168
3015	3015	62
3016	3016	61
3017	3017	61
3018	3018	69
3019	3019	37
3020	3020	28
3021	3021	64
3022	3022	57
3023	3023	92
3024	3024	146
3025	3025	74
3026	3026	51
3027	3027	29
3028	3028	62
3029	3029	211
3030	3030	28
\.


--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('place_tags_place_tag_id_seq', 3030, true);


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY places (place_id, name, city_id, rating, latitud, longitud, address, description, picture, url_4s) FROM stdin;
1	Nan Lian Garden	1	9.5	22.339663323718344	114.20401995515398	60 Fung Tak Rd	\N	\N	https://foursquare.com/item/5250e59911d2cc0d5860c883
2	Morning Trail, The Peak	1	9.5	22.2780082676673	114.14443177978094	Harlech Rd and Lugard Rd	\N	\N	https://foursquare.com/item/5687e176498eaebe398e9372
3	Broadway Cinematheque (百老匯電影中心)	1	9.40000000000000036	22.310716183194028	114.16890263557434	G/F, Prosperous Garden, 3 Public Square St	\N	\N	https://foursquare.com/item/5195443a498edbf8a550bc56
4	Toy Story Land	1	9.40000000000000036	22.310369992285068	114.039779214547	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/4ea8e598b8f7d2a521a92c8d
5	The Asia Society Hong Kong Center 亞洲協會香港中心	1	9.40000000000000036	22.27591114063176	114.1654487911651	9 Justice Dr	\N	\N	https://foursquare.com/item/516b8c6fe4b010e0c0352a85
6	ArtisTree	1	9.30000000000000071	22.286708	114.212735	1/F, Cornwall House, Taikoo Place, 979 King's Rd	\N	\N	https://foursquare.com/item/517fdb5fe4b06e1ee7696897
7	Café Gray Deluxe	1	9.30000000000000071	22.277784	114.165378	49/F, Upper House, Pacific Place, 88 Queensway	\N	\N	https://foursquare.com/item/51be6280498e40022fa144eb
8	Victoria Peak (太平山)	1	9.30000000000000071	22.271138338877577	114.14992997222568	Peak Rd	\N	\N	https://foursquare.com/item/50b4e4d9e4b0f6a10aa028ae
9	Samsen 泰麵	1	9.30000000000000071	22.274093	114.174093	G/F, 68 Stone Nullah Lane	\N	\N	https://foursquare.com/item/589ef12004f4d77ed036e2ec
10	Mickey's PhilharMagic	1	9.19999999999999929	22.312061103888105	114.04047310352325	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/5277cd4c498e0d29857374f9
11	Big Grizzly Mountain Runaway Mine Cars	1	9.19999999999999929	22.310113333685624	114.04193951519044	Grizzly Gulch, Hong Kong Disneyland	\N	\N	https://foursquare.com/item/54c49b79498e64b8cdef4360
12	Hong Kong Park Aviary 香港公園觀鳥園	1	9.19999999999999929	22.27714	114.161399	Hong Kong Park	\N	\N	https://foursquare.com/item/4b4c9b2870c603bbbacf8fb4
13	Adventureland	1	9.19999999999999929	22.312498442831586	114.04188144272356	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/5279086d498e9152e02cd000
14	Hong Kong Disneyland (香港迪士尼樂園)	1	9.19999999999999929	22.313330601839578	114.04434370895963	Fantasy Rd (Penny's Bay)	\N	\N	https://foursquare.com/item/4e1ad9a7636529dcc13b782a
15	Sleeping Beauty's Castle	1	9.19999999999999929	22.312768364230536	114.04185240648741	Fantasyland, Hong Kong Disneyland	\N	\N	https://foursquare.com/item/51c985bd498e805f34b8ba62
16	The Sky Terrace 428 凌霄閣摩天臺428	1	9.19999999999999929	22.271315676638288	114.1500198841095	The Peak Tower, 128 Peak Rd	\N	\N	https://foursquare.com/item/5188a0cf498e470e92b650dd
17	Hong Kong Park	1	9.09999999999999964	22.27769953093909	114.16185379028319	19 Cotton Tree Dr	\N	\N	https://foursquare.com/item/5084cf11e4b0d2d6651e5550
18	Din Tai Fung (鼎泰豐)	1	9.09999999999999964	22.2976732545756	114.16944980621338	Shop 130, 3/F, Silvercord, 30 Canton Rd	\N	\N	https://foursquare.com/item/50db27abe4b0b7ab9cc1dd4b
19	Winstons Coffee	1	9.09999999999999964	22.28695648501287	114.1443156609422	213 Queens Rd W	\N	\N	https://foursquare.com/item/5712f616498ecfc33f311668
20	Yardbird	1	9.09999999999999964	22.28360160666072	114.15011376142502	33-35 Bridges St (at Aberdeen St)	\N	\N	https://foursquare.com/item/4e605f6b1520355eb67a351b
21	Flash	1	9.09999999999999964	22.234606358005475	114.17110928025497	Ocean Park Hong Kong	\N	\N	https://foursquare.com/item/50f28caee4b0dbfd2234f4f1
22	Tian Tan Buddha (Giant Buddha) (天壇大佛)	1	9.09999999999999964	22.253953	113.905011	Po Lin Monastery, Ngong Ping Rd	\N	\N	https://foursquare.com/item/4f1d9acfe4b03543a3844660
23	Pure Yoga	1	9.09999999999999964	22.283033302292747	114.15579386198564	2/F, Asia Standard Tower, 59-65 Queen's Rd C	\N	\N	https://foursquare.com/item/5386ada5498e6b709bd94c83
24	NOT Specialty Coffee	1	9.09999999999999964	22.279719808343184	114.17888290047385	324 Jaffe Rd (btwn Marsh & Tonnochy Rd)	\N	\N	https://foursquare.com/item/562dc9d6498e4b2dbb44df93
25	Fantasyland	1	9	22.312324131143953	114.0404462814331	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/52009e3a498ef1acdc45b09d
26	Hair Raiser 動感快車	1	9	22.234557725134476	114.17187561782718	180 Wong Chuk Hang Rd	\N	\N	https://foursquare.com/item/50f25623e4b0bf1338498328
27	Din Tai Fung (鼎泰豐)	1	9	22.279396925607852	114.18624420086987	68 Yee Wo St, 铜锣湾	\N	\N	https://foursquare.com/item/4bd4597370c603bb672b99b4
28	Tomorrowland	1	9	22.313536503714015	114.04192790069763	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/57e759da498ec357e4315d3a
29	Royal Hong Kong Yacht Club 香港遊艇會	1	9	22.284367	114.1821	Kellett Island	\N	\N	https://foursquare.com/item/503b4803e4b0e2a7dbd2c750
30	Victoria Peak Garden	1	9	22.274014922218168	114.14346799250524	16 Mount Austin Rd	\N	\N	https://foursquare.com/item/4db4ee34fa8c350240effbf2
31	Gardens by the Bay	2	9.5	1.282457110058118	103.86341536632324	18 Marina Gardens Dr	\N	\N	https://foursquare.com/item/4ff7fab3e4b054fbaaba909b
32	Napoleon Food & Wine Bar	2	9.5	1.2799670469544204	103.84714543819426	206 Telok Ayer Street	\N	\N	https://foursquare.com/item/51c5c83f498e778c13e597ad
33	Marina Bay Downtown Area (MBDA)	2	9.5	1.2790415374388213	103.85495626876134	Marina Blvd, Central Blvd & Surrounds	\N	\N	https://foursquare.com/item/4e9c20981081f57b9e735d9f
34	Henderson Waves	2	9.30000000000000071	1.276239028996051	103.81523273528167	Henderson Rd (Connecting Telok Blangah Hill Park & Mt Faber Park)	\N	\N	https://foursquare.com/item/4c64dcabba119c7489bd22a2
35	Universal Studios Singapore	2	9.30000000000000071	1.2564316392730344	103.82130627970989	32 Sentosa Gateway (Resorts World Sentosa)	\N	\N	https://foursquare.com/item/4c03b68b70c603bbfbc39db4
36	Transformers The Ride: The Ultimate 3D Battle	2	9.30000000000000071	1.2543801160622412	103.8216062847745	Universal Studios Singapore (Sci-Fi City Zone)	\N	\N	https://foursquare.com/item/4ef41ba36da1a067a63a3b63
37	Blu Kouzina	2	9.30000000000000071	1.303253431786934	103.81035625934601	Blk 10 Dempsey Hill #01-21 (10 Dempsey Rd)	\N	\N	https://foursquare.com/item/54320529498e30aedc0307b1
38	Books Actually	2	9.30000000000000071	1.2825811480513059	103.83032370327051	9 Yong Siak St (Tiong Bahru Estate)	\N	\N	https://foursquare.com/item/50e0100be4b0f34007cf9b0e
39	Singapore Botanic Gardens	2	9.30000000000000071	1.3151299585941574	103.81578743725312	1 Cluny Rd.	\N	\N	https://foursquare.com/item/4e8ac9530cd6c43cb1903465
40	Books Kinokuniya 紀伊國屋書店	2	9.30000000000000071	1.3031855416785523	103.8342467245539	#04-20/20B/20C/20E Ngee Ann City (391 Orchard Rd)	\N	\N	https://foursquare.com/item/4ba5e1dc70c603bbf92a95b4
41	Singapore Zoo	2	9.30000000000000071	1.4048016561145835	103.79060739455322	80 Mandai Lake Rd.	\N	\N	https://foursquare.com/item/51d3a64d498e2527fd0fa472
42	Marina Bay Sands	2	9.30000000000000071	1.2831902557086854	103.85912418365479	10 Bayfront Avenue	\N	\N	https://foursquare.com/item/55a03979498e868f0af2cd31
43	Esplanade - Theatres On The Bay	2	9.30000000000000071	1.2896406004717818	103.85580555199617	1 Esplanade Dr.	\N	\N	https://foursquare.com/item/4fc0fa14e4b014a2d67e724e
44	East Coast Park	2	9.30000000000000071	1.3051144026337076	103.92740249633789	Along East Coast Pkwy (East Coast Park Service Rd)	\N	\N	https://foursquare.com/item/4c5037348edf0f471f6fe2ae
45	Resorts World Sentosa	2	9.19999999999999929	1.2564040250000972	103.82051381669906	8 Sentosa Gateway	\N	\N	https://foursquare.com/item/4ddf84913151c0922ed0a275
46	National Orchid Garden	2	9.19999999999999929	1.3117038129541208	103.81474029768252	Singapore Botanic Gardens (1 Cluny Rd. (Central Core along Tyersall Ave.))	\N	\N	https://foursquare.com/item/51521d0ee4b0507a3943715a
47	Percolate	2	9.19999999999999929	1.3280234803803905	103.93487431293876	#01-152, 136 Bedok North Ave 3	\N	\N	https://foursquare.com/item/53773823498e90583ae891b2
48	Cloud Forest	2	9.19999999999999929	1.283866002786424	103.86573314666748	Gardens By The Bay (18 Marina Gardens Dr.)	\N	\N	https://foursquare.com/item/501aaea8e4b07ea8afb15026
49	Marina Bay Sands Boardwalk	2	9.19999999999999929	1.284048347205377	103.85849118232727	10 Bayfront Avenue	\N	\N	https://foursquare.com/item/53714ce511d26dd2ea2c25ba
50	28 HongKong Street	2	9.19999999999999929	1.287873047219137	103.84684871187127	28 Hong Kong Street	\N	\N	https://foursquare.com/item/51f5d1aa498e5eb85c39fe58
51	Tom's Palette	2	9.19999999999999929	1.29599858576298	103.8567567555145	#01-25 Shaw Towers (100 Beach Road)	\N	\N	https://foursquare.com/item/4ccc348db571b60c3bf9d065
52	Binomio Spanish Restaurante	2	9.19999999999999929	1.2778417019561932	103.84228559303185	#01-02, Craig Place (20 Craig Rd.)	\N	\N	https://foursquare.com/item/51bc0a95498e7e9461eca6dd
53	Sephora	2	9.19999999999999929	1.3038197334026675	103.83206159335528	#B2-09, ION Orchard (2 Orchard Turn)	\N	\N	https://foursquare.com/item/4c7f14ce8e64952163b813bd
54	National Gal­lery Singa­pore	2	9.19999999999999929	1.2907395913341984	103.85154786540198	1 St. Andrew's Road	\N	\N	https://foursquare.com/item/5693cee3498e0bad978adeb2
55	Mount Faber Park	2	9.09999999999999964	1.2727409581382068	103.81864022617543	Mount Faber Rd	\N	\N	https://foursquare.com/item/541ee970498e943eba8d1ee3
56	Punggol Waterway Park	2	9.09999999999999964	1.4102274642652444	103.90697479248047	Punggol	\N	\N	https://foursquare.com/item/4eb403028b81a81f8fe988d3
57	Punggol Promenade Riverside Walk	2	9.09999999999999964	1.3932439841755129	103.91734169924771	Punggol East	\N	\N	https://foursquare.com/item/4df7eeafa809df9984e8460e
58	Louis Vuitton Island Maison	2	9.09999999999999964	1.2850588251910706	103.85863087238256	Marina Bay Sands (2 Bayfront Ave.)	\N	\N	https://foursquare.com/item/4e8addcce5e8cd224a750f43
59	The Singapore Flyer	2	9.09999999999999964	1.2894447773183417	103.86324549975406	30 Raffles Ave	\N	\N	https://foursquare.com/item/5162eb5c498e5d9dadd35b2d
60	MacRitchie Reservoir	2	9.09999999999999964	1.3426982080671415	103.83363246917725	MacRitchie Reservoir Park	\N	\N	https://foursquare.com/item/526b265911d27c7e42e8c3d9
61	Monteliusvägen	3	9.5	59.32074765317659	18.06259770163445	Monteliusvägen	\N	\N	https://foursquare.com/item/50995297e4b0fd2387c50b02
62	Klättercentret	3	9.5	59.29907433092187	17.991520561261485	Tellusgången 24	\N	\N	https://foursquare.com/item/53ab4494498eddb7e1576f3b
63	Papercut	3	9.5	59.317171692578555	18.054880964900807	Krukmakargatan 24–26	\N	\N	https://foursquare.com/item/51595ef2e4b0dc047ec21a70
64	Johan & Nyström	3	9.5	59.316209845175614	18.063844070646958	Swedenborgsgatan 7 (Maria Prästgårdsgata)	\N	\N	https://foursquare.com/item/52779c2f11d220aa1d9ae399
65	Fotografiska	3	9.5	59.317987362345406	18.085006451389237	Stadsgårdshamnen 22	\N	\N	https://foursquare.com/item/4e33fac3b3ad90171c63445d
66	Science Fiction Bokhandeln	3	9.40000000000000036	59.324040574431656	18.070626918333545	Västerlånggatan 48 (Gamla Stan)	\N	\N	https://foursquare.com/item/4c485e71972c0f4797bf2621
67	Rosendals Trädgård	3	9.40000000000000036	59.327447531966364	18.115183206731857	Rosendalsterrassen 12	\N	\N	https://foursquare.com/item/5343363a498e48d2bdc7c5a1
68	Snickarbacken 7	3	9.40000000000000036	59.33794104458486	18.0679698710224	Snickarbacken 7	\N	\N	https://foursquare.com/item/512895e3e4b0fb383035dbdc
69	Sivletto	3	9.40000000000000036	59.30961801913805	18.089211881160736	Malmgårdsvägen 16-18 (at Ringvägen)	\N	\N	https://foursquare.com/item/571b563c498e4be6bcc7a7bb
70	Lilla Ego	3	9.40000000000000036	59.34376	18.045631	Västmannagatan 69	\N	\N	https://foursquare.com/item/55d4d6be498e485b599b05db
71	Stockholms Stadshus | Stockholm City Hall (Stockholms Stadshus)	3	9.30000000000000071	59.32744588143589	18.05499494075775	Ragnar Östbergs plan 1	\N	\N	https://foursquare.com/item/51ebcf39498e4f9b4a92f6c1
72	Vasamuseet	3	9.30000000000000071	59.32784815275516	18.091607093811035	Galärvarvsvägen 14 (Djurgårdsvägen)	\N	\N	https://foursquare.com/item/4edddc8b8231efe393788e71
73	Oaxen Krog & Slip	3	9.30000000000000071	59.32232111516647	18.101470170666516	Beckholmsvägen 26 (Djurgården)	\N	\N	https://foursquare.com/item/54f323b5498e60009296d9bb
74	Café Pascal	3	9.30000000000000071	59.3419875630816	18.05197477340698	Norrtullsgatan 4 (Sandåsgatan)	\N	\N	https://foursquare.com/item/55199bae498e4147d065c31c
75	Linje Tio	3	9.30000000000000071	59.31619183255724	18.035047687018626	Hornsbruksgatan 24 (Borgargatan)	\N	\N	https://foursquare.com/item/53cf6f45498e2dae354d98d6
76	Humlegården	3	9.30000000000000071	59.339068782213815	18.072836995124817	Humlegårdsgatan	\N	\N	https://foursquare.com/item/4edeb5a5b8f76b6e9cd9b775
77	Kalf & Hansen	3	9.30000000000000071	59.318931110835905	18.061942836651983	Mariatorget 2	\N	\N	https://foursquare.com/item/53fdbcc9498ee29eeebf7025
78	Nackareservatet	3	9.30000000000000071	59.288262477543654	18.12200789174107	Sverige	\N	\N	https://foursquare.com/item/572cb702498e379a1b068fd9
79	Farang	3	9.30000000000000071	59.3416374320375	18.062725067138672	Tulegatan 7 (Rådmansgatan)	\N	\N	https://foursquare.com/item/51aef897498e5587bc60877e
80	Pizza Hatt	3	9.30000000000000071	59.337240930764764	18.05401689900642	Upplandsgatan 9B (Kammakargatan)	\N	\N	https://foursquare.com/item/4cd2c9b8fa66236a6611ed2e
81	Akkurat	3	9.30000000000000071	59.319644425962025	18.068883622738515	Hornsgatan 18	\N	\N	https://foursquare.com/item/4fbfe663e4b0bccbf57aeb3d
82	Grandpa	3	9.19999999999999929	59.312822	18.080763	Södermannagatan 21 (Bondegatan)	\N	\N	https://foursquare.com/item/54fc52fb498e6dddac50e422
83	Hornsbergs Strand	3	9.19999999999999929	59.34064172715326	18.00682783126831	Kungsholmen	\N	\N	https://foursquare.com/item/51ec2c6f498e1729c83c90af
84	Bakfickan	3	9.19999999999999929	59.330055	18.07102	Karl XII:s Torg	\N	\N	https://foursquare.com/item/55b4bb7f498e86438a7ff111
85	Reggev Hummus	3	9.19999999999999929	59.308763	18.082216	Ringvägen 145 (btw Bjurholmsgatan & Södermannagatan)	\N	\N	https://foursquare.com/item/4e99939977c85da036f264b7
86	Rolfs Kök	3	9.19999999999999929	59.33871041413502	18.05702805519104	Tegnérgatan 41	\N	\N	https://foursquare.com/item/4c9b36d9d4b1b1f75f8ad635
87	Pen Store	3	9.19999999999999929	59.317550315729385	18.051835751327715	Hornsgatan 98	\N	\N	https://foursquare.com/item/56e2dd1d498eb73dd5d8e207
88	800 grader	3	9.19999999999999929	59.34242804623578	18.04084761922348	Sigtunagatan 17	\N	\N	https://foursquare.com/item/56116dae498ee97d50a5243b
89	Wijnjas grosshandel	3	9.19999999999999929	59.32958904076409	18.046292451172757	Bergsgatan 24 (at Pipersgatan)	\N	\N	https://foursquare.com/item/54341f7811d259b7bf4952ba
90	AG Restaurang & Bar	3	9.19999999999999929	59.33518662932892	18.03496074467464	Kronobergsgatan 37 (Fleminggatan)	\N	\N	https://foursquare.com/item/4b05626b70c603bb0eed8eb4
91	Hyde Park	4	9.69999999999999929	51.50778087767913	-0.16239166259765625	Serpentine Rd	\N	\N	https://foursquare.com/item/51bde126498e9198c22500b0
92	Regent's Park	4	9.69999999999999929	51.527247837410805	-0.15111879685219604	Chester Rd	\N	\N	https://foursquare.com/item/51ba92cf498e54a17abde041
93	Hampstead Heath	4	9.69999999999999929	51.56351904151964	-0.16839981079101562	E Heath Rd	\N	\N	https://foursquare.com/item/4d5a787a8e1059416c37dee1
94	Primrose Hill	4	9.69999999999999929	51.539580748273785	-0.16061717509928597	Primrose Hill Rd	\N	\N	https://foursquare.com/item/4fe4b4e2e4b0b34d05aaf854
95	Greenwich Park	4	9.59999999999999964	51.477908339347096	-0.00038623809814453125	Romney Rd	\N	\N	https://foursquare.com/item/4d5a6e178e105941f4cbdde1
96	Royal Albert Hall	4	9.59999999999999964	51.500982454474055	-0.1774120330810547	Kensington Gore	\N	\N	https://foursquare.com/item/4d5405e4a64560fcf364b53a
97	National Gallery	4	9.59999999999999964	51.50846740897111	-0.12826068559120496	Trafalgar Sq	\N	\N	https://foursquare.com/item/50f3111ae4b09716f37aec53
98	Borough Market	4	9.59999999999999964	51.50548444430651	-0.09020398384821562	Southwark St	\N	\N	https://foursquare.com/item/4f70845be4b0e0075d49dab7
99	Elizabeth Tower (Big Ben) (Big Ben (Elizabeth Tower))	4	9.59999999999999964	51.501086556019715	-0.12348249667037624	Parliament Sq (Bridge St)	\N	\N	https://foursquare.com/item/50f6b55ae4b0833ecce0aee1
100	St James's Park	4	9.59999999999999964	51.502306003907684	-0.13158065270517666	The Mall	\N	\N	https://foursquare.com/item/4d54110fa64560fc44beb53a
101	Victoria Park	4	9.59999999999999964	51.53680634141707	-0.03712177276611328	Grove Rd	\N	\N	https://foursquare.com/item/4f71a29ae4b0741eb47b2a13
102	Daunt Books	4	9.59999999999999964	51.520446103688144	-0.15188031915267824	83 Marylebone High St (Paddington St)	\N	\N	https://foursquare.com/item/4f9918f1e4b06526ab6c55ce
103	Dishoom	4	9.59999999999999964	51.52452361919365	-0.07674786755631656	7 Boundary St	\N	\N	https://foursquare.com/item/51045cb6e4b0f868863c82e8
104	Holland Park	4	9.59999999999999964	51.50259867448262	-0.2036762237548828	Ilchester Pl	\N	\N	https://foursquare.com/item/4d5926175e7788bff9b8849e
105	Royal Botanic Gardens (Royal Botanic Gardens, Kew)	4	9.5	51.477747968798816	-0.296630859375	Kew Rd	\N	\N	https://foursquare.com/item/4f466166e4b00ed04a3aae96
106	Kensington Gardens	4	9.5	51.50536748609696	-0.18559692951674742	Exhibition Rd	\N	\N	https://foursquare.com/item/518ffd5a498e1e45fb05f36c
107	Somerset House	4	9.5	51.51078575130956	-0.11789917945861816	Strand	\N	\N	https://foursquare.com/item/50d04952e4b028fc43581adb
108	Maltby Street Market	4	9.5	51.499326358394505	-0.07560628325817981	Rope Walk (Maltby St)	\N	\N	https://foursquare.com/item/4f7087d8e4b03b575eed01b1
109	Rough Trade East	4	9.5	51.5210642591425	-0.0724947452545166	91 Brick Ln	\N	\N	https://foursquare.com/item/4e395a0f1fc77951ffe69e4d
110	Richmond Park	4	9.5	51.438787958727794	-0.2747011184692383	Richmond	\N	\N	https://foursquare.com/item/4acde01070c603bbea908eb4
111	British Museum	4	9.5	51.51909051512128	-0.1265965471332373	Great Russell St (btwn Montague & Bloomsbury)	\N	\N	https://foursquare.com/item/51895de4498eaddda1d26171
112	Dishoom	4	9.5	51.536116098887355	-0.12568378171178593	5 Stable St	\N	\N	https://foursquare.com/item/5499cf4a498e4a801262bc04
113	Battersea Park	4	9.5	51.479512013817555	-0.1569843292236328	Albert Bridge Rd	\N	\N	https://foursquare.com/item/4d593fc95e7788bf287f859e
114	Clissold Park	4	9.5	51.56076785329521	-0.08901603993015311	Church St (at Green Ln)	\N	\N	https://foursquare.com/item/4ad0984a70c603bb40948eb4
115	Brockwell Park	4	9.5	51.45047677918557	-0.10788917541503906	Dulwich Rd	\N	\N	https://foursquare.com/item/4f71a164e4b0022eb9ce9cc7
116	Scott's	4	9.5	51.50974974863149	-0.15086267845070342	20 Mount St.	\N	\N	https://foursquare.com/item/4bf404a470c603bb3e1f9cb4
117	Victoria and Albert Museum (V&A)	4	9.5	51.4964175460653	-0.17237235342987087	Cromwell Rd	\N	\N	https://foursquare.com/item/51e5c875498e1f652f88d018
118	Tate Britain	4	9.5	51.49077851281006	-0.12711536698936093	Millbank	\N	\N	https://foursquare.com/item/4d345adc306160fcb63c6b88
119	Coya London	4	9.5	51.50440036150375	-0.1477551586390948	118 Piccadilly (Old Park Lane)	\N	\N	https://foursquare.com/item/515301a4e4b0cffe8e8868b7
120	Scarfes Bar	4	9.5	51.517866	-0.118259	252 High Holborn	\N	\N	https://foursquare.com/item/54a078f4498e6a3066ad9098
121	Centro Histórico de Cartagena / Ciudad Amurallada	5	9.59999999999999964	10.424203397846842	-75.5488990963779	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/50214cbee4b048261ce07e7d
122	Sofitel Santa Clara	5	9.5	10.428479350488166	-75.54796663570262	Calle del Torno 39-29	\N	\N	https://foursquare.com/item/4b51bbf170c603bb871790b4
123	La Palettería	5	9.30000000000000071	10.424227424120954	-75.55099142580087	Cll Santo Domingo # 36 - 86	\N	\N	https://foursquare.com/item/51c9add7498e72fbf2791d3e
124	Di Silvio Trattoria	5	9.30000000000000071	10.420772502637178	-75.54583311080933	Calle de la Sierpe #9A-08 (Getsemaní)	\N	\N	https://foursquare.com/item/51b6176e498e6a62be9664fb
125	Ciudad Amurallada	5	9.19999999999999929	10.424015601005486	-75.55198640904256	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/4ed41e675c5c9528fd9b2acd
1664	Tortellino D'Oro	56	8.80000000000000071	-26.146622	28.063689	Pretoria St.	\N	\N	https://foursquare.com/item/4c822d8adc018cfabd7dcc6c
126	Bahía de Manga	5	9.19999999999999929	10.410748060925236	-75.53890228271484	Calle 36	\N	\N	https://foursquare.com/item/5023d836e4b0e5018875b762
127	Restaurante Donjuán	5	9.19999999999999929	10.4239855317609	-75.5495935678482	Calle del Colegio # 34-60 Local 1	\N	\N	https://foursquare.com/item/4d36444dedbd37046fda68e3
128	Azzahr by El Arabe	5	9.19999999999999929	10.423676851537428	-75.55327134893727	Calle de la Artilleria # 33 - 24 (Centro Historico)	\N	\N	https://foursquare.com/item/585da6b6964d7878e39c7654
129	Juan Valdez Café	5	9.09999999999999964	10.402348	-75.556178	Bocagrande Av. San Martín #7-17	\N	\N	https://foursquare.com/item/4cfd36552c1aa090321a057a
130	Di Silvio Trattoria	5	9.09999999999999964	10.39910712817434	-75.55653481871336	Colombia	\N	\N	https://foursquare.com/item/57d6f4f4498eb016f7237f68
131	Restaurante La Mulata	5	9.09999999999999964	10.426277825230748	-75.54672713620855	Calle de Quero	\N	\N	https://foursquare.com/item/5287bf6f11d2cccdffb6ceab
132	EL BARÓN - Café & Liquor Bar	5	9.09999999999999964	10.422007069472345	-75.55076569318771	Carrera 4 No. 31-7 (Plaza de San Pedro Claver)	\N	\N	https://foursquare.com/item/532e075b498e3c6c3433fbfa
133	Torre del Reloj	5	9.09999999999999964	10.422980474488789	-75.54912954568863	Centro	\N	\N	https://foursquare.com/item/52fe3f2411d262c185ae9b80
134	Shakin' Milkshake and Smoothie Bar	5	9	10.4090232370618	-75.55175898489095	Carrera 1 # 11-28	\N	\N	https://foursquare.com/item/581513c4d67cfccd58ec4ff5
135	Laguito, Cartagena	5	9	10.396431841011132	-75.56307291268057	Barrio El Laguito	\N	\N	https://foursquare.com/item/508c1f1de4b0ca23f60b0188
136	Cuzco Cocina Peruana	5	9	10.423614033635145	-75.55203757942854	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/50e74077e4b0ecb01f4e985f
137	Plaza De La Trinidad	5	9	10.420694702351229	-75.54540802444272	Barrio Getsemani	\N	\N	https://foursquare.com/item/534890e2498e2d9ce524f3ad
138	Plaza Santo Domingo	5	9	10.42423576652723	-75.55199778024097	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/4e63dfc61495676d565c91c6
139	Tratoria Cebichería Wippy	5	9	10.423927505591314	-75.55203189383096	Calle Santo Domingo 33-81 (Plaza Santo Domingo)	\N	\N	https://foursquare.com/item/55220605498ee59418e43cfe
140	Isla de Baru	5	8.90000000000000036	10.218259957385426	-75.61172428685471	Isla Baru	\N	\N	https://foursquare.com/item/51c6615b498ebd0759066501
141	San Alberto	5	8.90000000000000036	10.42399619746591	-75.55104828216619	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/55d341cb498e5655beb23a4f
142	Abaco	5	8.90000000000000036	10.424964905265005	-75.55121316550216	Calle De La Iglesia Con Calle De La Mantilla Esquina (3-86)	\N	\N	https://foursquare.com/item/4d1a43c2bb488cfa4afec3d4
143	Gelateria Paradiso	5	8.90000000000000036	10.42517371142022	-75.55059343063253	Calle de las Estrellas (Calle 36) (at Calle del Cuartel (Carrera 5))	\N	\N	https://foursquare.com/item/50aec12ae4b03ce490a3fc35
144	Mila Pasteleria	5	8.90000000000000036	10.424986932021659	-75.55109376724273	Calle de la iglesia # 35 - 76	\N	\N	https://foursquare.com/item/507b6922e4b0772057ac8066
145	Gokela - Cartagena	5	8.80000000000000071	10.403076507329313	-75.55444836616516	Carerra 3 (No 7-157)	\N	\N	https://foursquare.com/item/51632b20e4b06c51d43bbf57
146	alquimico	5	8.80000000000000071	10.42371	-75.549685	Colombia	\N	\N	https://foursquare.com/item/5875968504ab1a1578d7625d
147	Teatro Adolfo Mejía	5	8.80000000000000071	10.426713151161056	-75.55127263069153	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/4fef5432e4b0ac0d2f481395
148	El Coro Lounge	5	8.80000000000000071	10.428084865621027	-75.54810762405396	Centro Historico, Calle Stuart	\N	\N	https://foursquare.com/item/521e915a11d21ac519058a12
149	Plaza De Bolívar	5	8.80000000000000071	10.423287401193594	-75.55115062356874	Cll 33 3 1-99	\N	\N	https://foursquare.com/item/4f5615a4e4b06e95a3d22874
150	Teatro Pedro De Heredia	5	8.80000000000000071	10.42663019149386	-75.55112219540847	Centro	\N	\N	https://foursquare.com/item/550e63c6498e1815cf1f8052
151	Kinokuniya	6	9.30000000000000071	3.1573925503930806	101.71216421670377	Suria KLCC (406-408 & 429-430)	\N	\N	https://foursquare.com/item/523431d511d2cc2dddd88129
152	PETRONAS Twin Towers	6	9.30000000000000071	3.1583639892105504	101.71114116251098	Kuala Lumpur City Centre	\N	\N	https://foursquare.com/item/4f5402bfe4b0e14ed8c3bcb1
153	Pavilion Kuala Lumpur	6	9.19999999999999929	3.1490045550351393	101.7128592320763	168 Jalan Bukit Bintang	\N	\N	https://foursquare.com/item/4cc29ba29141370461a6b555
154	Mandarin Oriental, Kuala Lumpur	6	9.19999999999999929	3.1559687077528986	101.71178057020414	Kuala Lumpur City Centre	\N	\N	https://foursquare.com/item/50646e97e4b0b4fe2033909d
155	Islamic Arts Museum Malaysia	6	9.09999999999999964	3.141594959386471	101.68983723183355	Jalan Lembah Perdana	\N	\N	https://foursquare.com/item/4f5995e8e4b09c8f908ae4b0
156	Tournament Players Club (TPC)	6	9.09999999999999964	3.139509867142692	101.64029137004705	10 Jalan 1/70D	\N	\N	https://foursquare.com/item/51984e27498ec814d74ffd9f
157	Suria KLCC	6	9	3.1577019049265913	101.71243666217731	Kuala Lumpur City Centre (Jalan Ampang)	\N	\N	https://foursquare.com/item/4d1c6abaaff260fc30702934
158	Bukit Tabur Taman Melawati	6	9	3.2308947752665307	101.74885623727566	Taman melawati	\N	\N	https://foursquare.com/item/51612683e4b06cc90f056824
159	Ales & Lagers	6	9	3.1714895298833308	101.66725938806462	D5-G4-3, Solaris Dutamas, No. 1, Jalan Dutamas 1	\N	\N	https://foursquare.com/item/524704c511d2ac79dcf2859a
160	Oribe (織部)	6	9	3.152169666589498	101.71324844271	Vipod Residences (Block C-1), Jalan Kia Peng	\N	\N	https://foursquare.com/item/569b76de498ec7b13a10977b
161	Kiara Park Trail And Mountain Bike Track	6	8.90000000000000036	3.1523534559726714	101.63124062786336	Taman Rekreasi Lembah Kiara (Jalan Abang Haji Openg, Taman Tun Dr Ismail)	\N	\N	https://foursquare.com/item/50f34c1ce4b0447160952113
162	The Humble Chef	6	8.90000000000000036	3.1448011745526814	101.661746293904	Jalan Damansara, Pusat Bandar Damansara	\N	\N	https://foursquare.com/item/4b87dbf570c603bb121993b4
163	The Gardens Mall	6	8.90000000000000036	3.1186618098835	101.67627993143081	Mid Valley City (Lingkaran Syed Putra)	\N	\N	https://foursquare.com/item/4d8947c2b3358eecc77cb244
164	Restoran Beriani Asif	6	8.90000000000000036	3.145390647877375	101.71327624352517	No.9, Jalan Padang Walter Grenier (Off Jalan Imbi)	\N	\N	https://foursquare.com/item/50223a1ae4b052a4476e548e
165	Ben's Independent Grocer (B.I.G.)	6	8.90000000000000036	3.1711848891167373	101.66488071872384	Publika (Lot UG-1A), Jalan Dutamas 1	\N	\N	https://foursquare.com/item/51616c22498ee174caf052d4
2201	Arte Dolce	74	9.19999999999999929	6.2074633	-75.56477	carrera 33 #7 165	\N	\N	https://foursquare.com/item/547a4c6e498e793e0e087215
166	Kuala Lumpur City Centre (KLCC) Park	6	8.90000000000000036	3.1564934270558704	101.71287035235993	Kuala Lumpur City Centre	\N	\N	https://foursquare.com/item/4f59d8cae4b030058516e870
167	VCR	6	8.90000000000000036	3.143311649873575	101.70548118557679	2, Jalan Galloway (off Jalan Pudu)	\N	\N	https://foursquare.com/item/527bbb3d11d2fb40849fb6cf
168	Sephora	6	8.90000000000000036	3.1574838664204523	101.71233658008383	Suria KLCC (C22)	\N	\N	https://foursquare.com/item/4fbf5f07e4b0b0419adda0cf
169	Dewi Petshop Pantai Dalam KL	6	8.90000000000000036	3.1055339105309288	101.66614229589806	GK1-2 Bazaria Pantai, Jalan Pantai Permai 2 (Jalan Pantai Murni)	\N	\N	https://foursquare.com/item/56c10502498e82b67b91f50c
170	Mid Valley Megamall	6	8.90000000000000036	3.1180703793080915	101.67720815261556	Lingkaran Syed Putra	\N	\N	https://foursquare.com/item/4ccd0160511b236a9526f5c9
171	Code:Black Espresso	6	8.90000000000000036	3.2435546148191006	101.65187125295202	B-G-9, Emerald Avenue, Jln PS11, Prima Selayang (Lebuhraya Selayang Kepong)	\N	\N	https://foursquare.com/item/5662e62b498e17f7e9957631
172	源味本鋪 Original Cake	6	8.90000000000000036	3.127622	101.724104	Sunway Velocity (Lot 3-29, 3rd Floor)	\N	\N	https://foursquare.com/item/58a2937c7b88a70fcf32b64c
173	Tiffany & Co.	6	8.90000000000000036	3.157291898493749	101.71117452281533	Suria KLCC (G25B)	\N	\N	https://foursquare.com/item/567cd7c0498e37dce5b70790
174	Typo	6	8.80000000000000071	3.1335662573743344	101.68736354565033	NU Sentral (Lot GF.16), Jalan Stesen Sentral 5	\N	\N	https://foursquare.com/item/5870a0517ff1e472bd4c9c29
175	Masjid Jamek Al-Imam Al-Ghazali	6	8.80000000000000071	3.196199346133876	101.62808418273926	Jalan Taman Bukit Maluri, Bandar Menjalara	\N	\N	https://foursquare.com/item/4d26a385ebacb1f7dd39e04f
176	The Ice Cream Bar	6	8.80000000000000071	3.163290610252209	101.65045981588692	60G, Jalan 27/70A, (Desa Sri Hartamas.)	\N	\N	https://foursquare.com/item/576ec874cd108cb6c9d8b5ad
177	Nasi Ayam Kampung	6	8.80000000000000071	3.1680313619379876	101.70435812260881	35, Medan Selera, Lorong Raja Muda (Kampung Baru)	\N	\N	https://foursquare.com/item/51a58339498e4375edabf740
178	Regalia Sky Pool	6	8.80000000000000071	3.1641755216833145	101.69265563818797	Kuala Lumpur, Kuala Lumpur	\N	\N	https://foursquare.com/item/520ae0b611d263f90aa5b1bf
179	DoubleTree by Hilton Hotel Kuala Lumpur	6	8.80000000000000071	3.161758284521054	101.72017663519587	The Intermark (348 Jalan Tun Razak)	\N	\N	https://foursquare.com/item/51fa7101498eb89a045af7e5
180	Royal Selangor Pewter	6	8.80000000000000071	3.1966358033666746	101.72445833261992	4 Jalan Usahawan 6	\N	\N	https://foursquare.com/item/4c237dae34faef3b18de586d
181	El Chanchullero	7	9.19999999999999929	23.134144486532207	-82.35596179962158	Teniente Rey 457ª bajos (Between Bernaza y El Cristo (Plaza del Cristo))	\N	\N	https://foursquare.com/item/548df32c498e11569b260031
182	Paladar La Guarida	7	9.19999999999999929	23.138419052090917	-82.3684945093313	Calle Concordia, 418 (e/ Gervasio y Escobar)	\N	\N	https://foursquare.com/item/5580c6de498efcb4f0f5e2ce
183	Santa Maria Del Mar	7	9.19999999999999929	23.176528444179286	-82.18940599937183	Playas Del Este	\N	\N	https://foursquare.com/item/54d5268e498e000e0ac14872
184	O'Reilly 304	7	9.19999999999999929	23.139507635595454	-82.35061150840332	O'Reilly 304 (Bw Aguilar y Havana)	\N	\N	https://foursquare.com/item/531e89d4498e3f1e7951b132
185	Plaza Vieja	7	9.09999999999999964	23.136223879787867	-82.3501241113486	Plaza Vieja	\N	\N	https://foursquare.com/item/541403fc498e36280d5620b2
186	Guajirito	7	8.90000000000000036	23.121340287197363	-82.41697165393971	Barrio El Fanguito	\N	\N	https://foursquare.com/item/5604693c498e481e73edbc90
187	Plaza de la Catedral	7	8.90000000000000036	23.14086066851074	-82.35161930322647	Plaza de la Catedral	\N	\N	https://foursquare.com/item/5065c06be4b0a44a76b01bf5
188	El Malecón	7	8.80000000000000071	23.1454505648215	-82.38457443192601	Avenida	\N	\N	https://foursquare.com/item/54026bce11d22a64b7e826e6
189	Museo Nacional de Bellas Artes	7	8.69999999999999929	23.138621773646634	-82.35867955478535	Trocadero e/ Zulueta y Monserrate (Habana Vieja)	\N	\N	https://foursquare.com/item/56c13a05498e374804531c7a
190	Gran Teatro de la Habana	7	8.69999999999999929	23.136840372302714	-82.3595315264538	458 paseo de Marti	\N	\N	https://foursquare.com/item/583e0b78040d53756b680596
191	Parque Central	7	8.59999999999999964	23.137400261269537	-82.35868692398071	Paseo de Martí (Habana Vieja)	\N	\N	https://foursquare.com/item/52c7957b498ece9a22ce2edc
192	Castillo de los Tres Reyes del Morro	7	8.59999999999999964	23.150767840866678	-82.35624074935913	La Habana, La Habana	\N	\N	https://foursquare.com/item/514072eee4b050823017eaf1
193	Restaurante Floridita	7	8.5	23.137439724720846	-82.35733240842819	Obispo 557 (Esq. Monserrate)	\N	\N	https://foursquare.com/item/50311a22e4b08345cda1cc54
194	Varadero	7	8.5	23.13956037006336	-82.3826080379503	Varadero, Matanzas	\N	\N	https://foursquare.com/item/547b6560498ec6621ae2b9ed
195	Paseo del Prado (Paseo Marti)	7	8.40000000000000036	23.14223938036964	-82.35871911048889	Paseo Marti	\N	\N	https://foursquare.com/item/531e868811d289a2e58e785e
196	Cabaret Tropicana	7	8.40000000000000036	23.09458544599938	-82.41914391517639	Linea del Ferrocarril y Calle 72 (Marianao)	\N	\N	https://foursquare.com/item/5044a647e4b0f30042f9c52f
197	Casa de la Musica de Miramar	7	8.40000000000000036	23.118150572413175	-82.41490745752505	Avenida 35 esq. a 20 (Playa)	\N	\N	https://foursquare.com/item/4bf0cf3d70c603bb58d09bb4
198	El Cocinero	7	8.40000000000000036	23.13940545807562	-82.40251040397138	Calle 26 (Entre 11 Y 13, Vedado)	\N	\N	https://foursquare.com/item/56fe847d498edea9b63a94e7
199	Fortaleza San Carlos de la Cabaña	7	8.30000000000000071	23.14727948868528	-82.35016649383614	La Habana, La Habana	\N	\N	https://foursquare.com/item/581033cf38fa19aa00d81aba
200	Melia Hotel Swim.Pool	7	8.19999999999999929	23.109179344414148	-82.44273718787422	Cuba	\N	\N	https://foursquare.com/item/541402b2498ee4527773fb41
201	La Bodeguita del Medio	7	8.19999999999999929	23.14089273173826	-82.35248565673828	Calle Empedrado, 207 (Habana Vieja)	\N	\N	https://foursquare.com/item/4e175e7ed1648b834827d829
202	Café Laurent	7	8.19999999999999929	23.141768301525964	-82.3837199807167	Calle M 257 (between Calles 19 and 21)	\N	\N	https://foursquare.com/item/546966f9498e16ada3ca21e3
203	Paladar Los Mercaderes	7	8.09999999999999964	23.137967547265603	-82.34970688819885	Calle Mercaderes 207  (e/ Lamparilla y Amargura)	\N	\N	https://foursquare.com/item/51d8d1fe498e40b208d5c8fb
204	El Aljibe	7	8	23.119544857949823	-82.42110515520619	Calle 7ma | entre 24 y 26	\N	\N	https://foursquare.com/item/4f9fb84de4b02b7fdaaaa471
205	Plaza de la Revolución	7	8	23.12438162150132	-82.38573314622045	Av. Paseo (Av. De La Independencia)	\N	\N	https://foursquare.com/item/583bbbb72896a2502e666055
206	Monumento Plaza De La Revolución	7	8	23.121337672410586	-82.3870325088501	Avenida Paseo	\N	\N	https://foursquare.com/item/54026c5d498e67869a9954e7
207	Café del Oriente	7	7.90000000000000036	23.13767259494789	-82.34891619964962	Calle Oficios, 112. Esq. Amargura (Plaza de San Francisco)	\N	\N	https://foursquare.com/item/525aea94498eafa9602c3a07
208	La Zorra Y El Cuervo	7	7.90000000000000036	23.141575327210752	-82.38107237035916	Calle 23 y O (Vedado)	\N	\N	https://foursquare.com/item/520e880311d299f09070c3e7
209	Fabrica De Tabacos Partagas	7	7.90000000000000036	23.134223415339545	-82.36048132181168	Calle Industria, 520 (Habana Vieja)	\N	\N	https://foursquare.com/item/5045e84de4b0c93959c0a372
210	Los Nardos	7	7.90000000000000036	23.134693780736903	-82.35862128595936	Paseo del Prado 563, entre Teniente Rey y Dragones	\N	\N	https://foursquare.com/item/4bf0c24d70c603bb2fcf9bb4
211	Kaleiçi	8	9.59999999999999964	36.884264036736795	30.705880179407924	Selçuk Mah.	\N	\N	https://foursquare.com/item/51e0578f498e275a1b527977
212	Atletico  Sport Shop	8	9.5	36.85431674841824	30.74923038482666	Fener mah. Tekelioglu cad. 23/A (Lara)	\N	\N	https://foursquare.com/item/5287441211d2638cd21a2dd9
213	Kekik Mangal Evi	8	9.5	36.893051898157175	30.73732152869292	Termosos Bulv	\N	\N	https://foursquare.com/item/573b68ae498edd5a205b0dcc
214	Akra Barut Fitness Center	8	9.5	36.863981012819366	30.725887696578706	Akra Barut Hotel (Şirinyalı Mah. Lara Cad. No:24)	\N	\N	https://foursquare.com/item/571b9235498eb552c04d2da0
215	Rokka	8	9.40000000000000036	36.8852	30.709305	Türkiye	\N	\N	https://foursquare.com/item/56e47417498e5c0ff9875dac
216	Pizza Napoli	8	9.40000000000000036	36.859184185846836	30.731710195541382	Eski Lara Cad. No: 97/B	\N	\N	https://foursquare.com/item/5172bd57e4b049eea13704d1
217	Düden Şelalesi	8	9.40000000000000036	36.964292340959275	30.726774599814473	Habibler Mah. 3167 Sk.	\N	\N	https://foursquare.com/item/50fc4d1ee4b0ff3fcf14e32a
218	Düden Parkı	8	9.40000000000000036	36.854236653848005	30.780521488222224	Lara Cad.	\N	\N	https://foursquare.com/item/503159e7e4b0504d9f56e97f
219	Octopus Book&Cafe	8	9.40000000000000036	36.881954866912146	30.70899188518524	Haşimişcan Mh. 1295 Sk. 41/A (Işıklar Caddesi)	\N	\N	https://foursquare.com/item/5847e91cc7ec6b4e7c463621
220	Castle Brasserie	8	9.40000000000000036	36.88215868234771	30.707696378231045	Kılıçarslan Mah.Hamam Sokak No 25 (Atatürk Caddesi)	\N	\N	https://foursquare.com/item/55d610da498e907fb4efebfe
221	Harman Cafe & Börek	8	9.40000000000000036	36.88604212769649	30.697655060351643	HARMAN CAFE & BÖREK, APT. B, Deniz Mahallesi, Fatih Caddesi No:3, 07050 Muratpaşa/Antalya	\N	\N	https://foursquare.com/item/574be7cf498e89188d4cf9c1
222	Konak Dondurma Lara	8	9.40000000000000036	36.868352738163416	30.722738577814713	Yeşilbahçe Mah. Metin Kasapoğlu Cad. No: 44	\N	\N	https://foursquare.com/item/53efc940498ec46db6fd3589
223	Iceberry Waffle&Frozen Yogurt Shop	8	9.40000000000000036	36.88158375140642	30.70811462340826	Haşimişcan Mah. Atatürk Cad. Günertem Ap. 81/B (Işıklar)	\N	\N	https://foursquare.com/item/565788dc498e2a2cccb4133a
224	Gem's Fitness Center	8	9.40000000000000036	36.88549123608217	30.709950430669224	Işıklar cad.	\N	\N	https://foursquare.com/item/51e004d7e4b055dd150a87dd
225	Antalya Arkeoloji Müzesi	8	9.40000000000000036	36.88558180094945	30.68018120473537	Bahçelievler Mah.	\N	\N	https://foursquare.com/item/51e5abf7498ebebf2166798e
226	Soydance	8	9.30000000000000071	36.88599674722963	30.69763541221619	Güllük Cad. Fatih Apt. No:3/G	\N	\N	https://foursquare.com/item/50abd30de4b0de093ec0d611
227	Lara Balık Evi	8	9.30000000000000071	36.87369900144704	30.714890695438257	Demircikara Mah. Tevfik Işık Cad. No:8 (Işıklar Şubesi)	\N	\N	https://foursquare.com/item/4f92ccd8e4b0e29f5466e136
228	Yalım yürüyüş yolu	8	9.30000000000000071	36.87509498379626	30.71772564549419	Türkiye	\N	\N	https://foursquare.com/item/53ae33fb498e895e00f84da4
229	Loti Et Restaurant	8	9.30000000000000071	36.84800743623299	30.764198405374337	Çağlayan Mah. 2020 Sok.	\N	\N	https://foursquare.com/item/58220d4938fa102a45cb6a49
230	Antalya Gokart	8	9.30000000000000071	36.88676779438877	30.818697544504012	Altıntaş mahallesi Yörükoğlu caddesi no 27 (Turizim yolu)	\N	\N	https://foursquare.com/item/57e0160a498e93e6be707f68
231	Lara Caddesi Yürüyüş Yolu	8	9.30000000000000071	36.857784936640186	30.735315084457397	Eski Lara Cad.	\N	\N	https://foursquare.com/item/523a94c111d2d4a7a4fb0b76
232	La Liga Playstation Cafe	8	9.30000000000000071	36.914223	30.688055	zafer mah. 2610 sk.no:12 yıldızlaar apt. dukkan	\N	\N	https://foursquare.com/item/52496bc6498ec80107d01f4f
233	Atatürk Parkı	8	9.30000000000000071	36.884907219804724	30.68821094627979	Konyaaltı Cad.	\N	\N	https://foursquare.com/item/4f4a0a50e4b076e6e137ad06
234	Fenerium	8	9.30000000000000071	36.89311485009408	30.70434187062548	MarkAntalya	\N	\N	https://foursquare.com/item/525c307c11d2124c89fec1f7
235	Custom Tattoo - Antalya	8	9.30000000000000071	36.852994674847295	30.754315853118893	Fener Mah. 1950 Sok. Ali Koç Apt. 4/B (Tekelioğlu Caddesi)	\N	\N	https://foursquare.com/item/51ff5039498e523eac21ce62
236	Üçkapılar	8	9.30000000000000071	36.88542766251832	30.70881638777795	Barbaros Mah. Atatürk Cad.	\N	\N	https://foursquare.com/item/50f03713e4b0d659318135f5
237	Şehr-i Künefe	8	9.30000000000000071	36.88351587440055	30.714817715676144	Türkiye	\N	\N	https://foursquare.com/item/56d1e18c498e1a2064c65dd2
238	Antalya Arena	8	9.30000000000000071	36.888013316636766	30.66850662231445	Meltem Mah. Sakıp Sabancı Blv.	\N	\N	https://foursquare.com/item/562e943f498e05d55767ad3d
239	Muratpaşa Camii	8	9.30000000000000071	36.891723930034665	30.7023150918372	Kızılsaray Mh. Muratpaşa	\N	\N	https://foursquare.com/item/51fd614b498e883bf1104275
240	PRO DJ ANTALYA	8	9.30000000000000071	36.888695505719035	30.706041455268856	Balbey Mahallesi 405 Sokak M.Ali Gönen İş Merkezi    Kat:1 No:19 05555432555	\N	\N	https://foursquare.com/item/4fcddef3e4b00c762ce248a0
241	Parc des Buttes-Chaumont	9	9.69999999999999929	48.879517600082266	2.3823115112913933	Parc des Buttes-Chaumont (8 rue Botzaris)	\N	\N	https://foursquare.com/item/4ba33d5f70c603bbb9ec94b4
242	Jardin du Luxembourg	9	9.69999999999999929	48.84705013115828	2.338511873859104	Place Edmond Rostand	\N	\N	https://foursquare.com/item/4d5d1b42fb186dcbded3079b
243	Jardin des Tuileries	9	9.59999999999999964	48.863641957269515	2.326483726501465	Rue de Rivoli (Quai des Tuileries)	\N	\N	https://foursquare.com/item/4d3706702c9759411af25fa7
244	Place des Vosges	9	9.59999999999999964	48.85562342675294	2.365531325340271	Place des Vosges (Square Louis XIII)	\N	\N	https://foursquare.com/item/4d16a369c2782d4349ceb9b0
245	Cathédrale Notre-Dame de Paris	9	9.59999999999999964	48.85342620374535	2.347850337472787	6 place du parvis Notre-Dame (Place Jean-Paul II)	\N	\N	https://foursquare.com/item/4dad00e704370a776f6613d1
246	Musée d'Orsay	9	9.59999999999999964	48.86015056666333	2.325492693889496	1 rue de la Légion d'Honneur (Quai Anatole France)	\N	\N	https://foursquare.com/item/4e373b6eb61c5cb3c37e8e9d
247	Parc Montsouris	9	9.59999999999999964	48.822654403748636	2.339155366440146	Boulevard Jourdan	\N	\N	https://foursquare.com/item/55f85965498e184e3a4a65de
248	Le CENTQUATRE – 104	9	9.59999999999999964	48.889766	2.371296	5 rue Curial (104 rue d'Aubervilliers)	\N	\N	https://foursquare.com/item/524fd20711d2d39c362bdd25
249	Tour Eiffel	9	9.59999999999999964	48.858249354605626	2.2944259643554683	5 avenue Anatole France (Parc du Champ-de-Mars)	\N	\N	https://foursquare.com/item/51dacd8c498e81059bd6817e
250	Shakespeare & Company	9	9.59999999999999964	48.85257555417096	2.347107231616974	37 rue de la Bûcherie	\N	\N	https://foursquare.com/item/4d2e29fcbb73a09041cf54dc
251	Opéra Garnier	9	9.5	48.87194695327607	2.3323814128273286	8 rue Scribe (Rue Auber)	\N	\N	https://foursquare.com/item/4e3be5ad18a83d5b282df72c
252	Place de l'Opéra	9	9.5	48.87069860500127	2.3321704923678963	Place de l'Opéra	\N	\N	https://foursquare.com/item/55eade21498e6565c922cf88
253	Jardin du Palais Royal	9	9.5	48.86494061245833	2.3377275466918945	2 place Colette (Palais Royal)	\N	\N	https://foursquare.com/item/5210d4b311d2ca5a567aefc4
254	Arc de Triomphe (Arc de Triomphe de l'Étoile)	9	9.5	48.873783275868725	2.2950589656829834	Place Charles de Gaulle (Avenue des Champs-Élysées)	\N	\N	https://foursquare.com/item/4d51a63ed7eaa143f067750f
255	Parc de Sceaux	9	9.5	48.77334527434298	2.29689359664917	Domaine de Sceaux	\N	\N	https://foursquare.com/item/5039eb7de4b0d21c20d460cb
256	Place du Trocadéro	9	9.5	48.861871440816955	2.288204473349061	Place du Trocadéro et du 11 Novembre	\N	\N	https://foursquare.com/item/4ff9bc7de4b0e8d00ea1cb2f
257	Le Barav	9	9.5	48.86516646209463	2.363154888153076	6 rue Charles-François Dupuis (Rue de la Corderie)	\N	\N	https://foursquare.com/item/5086458de4b07645f1beedad
258	Max Linder Panorama	9	9.5	48.871265814429606	2.344769215661929	24 boulevard Poissonnière	\N	\N	https://foursquare.com/item/4f9fe936e4b0bf270c447f8f
259	Artazart Design Bookstore	9	9.5	48.87276225106327	2.3639303407366925	83 quai de Valmy	\N	\N	https://foursquare.com/item/4b9de7ce70c603bb657d94b4
260	Guilo Guilo	9	9.5	48.88591204892492	2.3369550704956055	8 rue Garreau (Rue Durantin)	\N	\N	https://foursquare.com/item/50a43854e4b0279f2a967323
261	Dersou	9	9.5	48.85131858363501	2.374719698294808	21 rue Saint-Nicolas	\N	\N	https://foursquare.com/item/55149a21498e44fb4aae9e96
262	Parc Monceau	9	9.5	48.87958041734081	2.3091804903585342	35 boulevard de Courcelles	\N	\N	https://foursquare.com/item/52209901498ebc08ee3cc2ff
263	Musée du Louvre	9	9.5	48.8610850052472	2.335463054572662	Rue de Rivoli	\N	\N	https://foursquare.com/item/4b4a526170c603bbd17790b4
264	Canal Saint-Martin	9	9.5	48.87109465050329	2.365536689758301	Quai de Valmy (Quai de Jemmapes)	\N	\N	https://foursquare.com/item/538f51bc498e57e3f0f2cfcf
265	CHANEL Boutique	9	9.5	48.86765782031438	2.307504455134071	40 avenue Montaigne	\N	\N	https://foursquare.com/item/551ab0fb498e58337394b12d
266	Clamato	9	9.5	48.853709993352446	2.3808276536983386	80 rue de Charonne	\N	\N	https://foursquare.com/item/53a8965c498e2e7a675e0b70
267	Fleux'	9	9.5	48.858806993594236	2.35406756401062	39 et 52 rue Sainte-Croix de la Bretonnerie	\N	\N	https://foursquare.com/item/52aaa90311d2d05d44b03e8c
268	Parc de la Villette	9	9.5	48.89340010221068	2.390176565153927	211 avenue Jean Jaurès	\N	\N	https://foursquare.com/item/51a0d762498e3795c034e64d
269	Basilique du Sacré-Cœur de Montmartre (Basilique du Sacré-Cœur)	9	9.40000000000000036	48.886603420322	2.3430490493774414	35 rue du Chevalier de la Barre	\N	\N	https://foursquare.com/item/4d4ae9649526b60cf81787ee
270	La Cinémathèque Française	9	9.40000000000000036	48.83705178775484	2.3822245441469887	51 rue de Bercy	\N	\N	https://foursquare.com/item/52921d5311d2f766ac2c2d11
271	Galata Kulesi	10	9.69999999999999929	41.025773839212604	28.97422180335175	Bereketzade Mah. Büyük Hendek Cad. Galata	\N	\N	https://foursquare.com/item/50b7c988e4b06f5c01550d62
272	Ayasofya | Hagia Sophia (Ayasofya)	10	9.69999999999999929	41.008021069052134	28.97891756114089	Ayasofya Myd. Sultanahmet	\N	\N	https://foursquare.com/item/50c986ffe4b0d59c9447f413
273	Sultan Ahmet Camii	10	9.59999999999999964	41.00593562680219	28.97701880945081	Sultanahmet Mah. Atmeydanı Cad.	\N	\N	https://foursquare.com/item/50d055ebe4b0fda9eedc1f05
274	Dolmabahçe Sarayı	10	9.59999999999999964	41.038111006177374	28.996863589534396	Vişnezade Mah. Dolmabahçe Cad.	\N	\N	https://foursquare.com/item/509df35ee4b0b11968b8bb13
275	SALT Galata	10	9.59999999999999964	41.02387245980033	28.97340416908264	Bankalar Cad. No:11 Karaköy	\N	\N	https://foursquare.com/item/50b12e5de4b0a2172e1aebbc
276	Match Cafe	10	9.59999999999999964	41.065150395174506	28.99566422106267	Ortaklar Cad. Mecidiyekoy	\N	\N	https://foursquare.com/item/5660afa3498ee321e1adda85
277	Rahmi M. Koç Müzesi	10	9.59999999999999964	41.04216878296811	28.94923979334289	Hasköy Cad. No:5	\N	\N	https://foursquare.com/item/4d445d0c7c555941cb521bd2
278	Dinakord Elektronik San. Tic. Ltd. Şti.	10	9.59999999999999964	41.05476085737834	28.981155753135678	Ergenekon caddesi şahadet sok. no:6 feriköy (Ergenekon caddesi)	\N	\N	https://foursquare.com/item/53edf8da498ea895b0dcc006
279	Topkapı Sarayı	10	9.59999999999999964	41.01107132557603	28.98276047212313	Sultanahmet	\N	\N	https://foursquare.com/item/51542d6be4b0d72677616747
280	Sakıp Sabancı Müzesi	10	9.59999999999999964	41.105991521404704	29.056098462275287	Sakıp Sabancı Cad. No:42 Emirgan (Atlı Köşk)	\N	\N	https://foursquare.com/item/4c30948f66e40f47cfb0c38b
281	Bee Pizza	10	9.59999999999999964	41.034215	28.88555	Mimar sinan mah. 70. Sok. No: 5 İstanbul (Davutpaşa cad)	\N	\N	https://foursquare.com/item/589b49e030ecc651dc403dbb
282	Fenerium	10	9.59999999999999964	40.98836163399737	29.03757333755493	Bağdat Cad. Kızıltoprak (Maraton Tribün Altı)	\N	\N	https://foursquare.com/item/517aab9ae4b06b790eb9fba3
283	40 Haramiler Fotoğrafçılık Kursu (Muammer Yanmaz Atölyesi, 40 Haramiler) (Fotoğrafçılık Kursu)	10	9.59999999999999964	41.0686627823168	28.995441198349	Eski Osmanlı Sk. No: 21 1A Mecidiyeköy	\N	\N	https://foursquare.com/item/5177a8c8e4b037542b9f3f93
284	Venüs Sanat Galerisi	10	9.59999999999999964	40.98171236052554	29.058494567871094	Mustafa Kaya Sokak No 2 (Mustafa Mazharbey Caddesi)	\N	\N	https://foursquare.com/item/535e28b511d25420c6e6c488
285	Südde-i saadet	10	9.59999999999999964	41.01674097994516	28.96654114607075	Demirtas Mah (fetva yokuşu No:4)	\N	\N	https://foursquare.com/item/583c35b2005a0f4a1a0a731f
286	Aqua Florya Balıkev	10	9.59999999999999964	40.96635050457578	28.796463398707235	Şenlikköy Mahallesi (Yeşilköy Halkalı Caddesi)	\N	\N	https://foursquare.com/item/587d0e84e753561722c0e6b7
287	Belgrad Ormanı	10	9.59999999999999964	41.18214740006502	28.968255682035252	Sarıyer - Kemerburgaz Yolu	\N	\N	https://foursquare.com/item/50f44d5ae4b0232ee7a30683
288	Fenerbahçe Parkı	10	9.59999999999999964	40.96830570939702	29.035380509813013	Fenerbahçe Mah. (Fener-Kalamış Caddesi)	\N	\N	https://foursquare.com/item/511a688fe4b0446bf38ce901
289	Nuruosmaniye Camii	10	9.5	41.010264667151645	28.97099018096924	Beyazıt Mah. Nuruosmaniye Cad.	\N	\N	https://foursquare.com/item/518a2469498e5779ed0d48ba
290	İstanbul Modern	10	9.5	41.02601238554324	28.98305607669598	Kılıçali Paşa Mah. Meclis-i Mebusan Cad. Antrepo No:4 Karaköy	\N	\N	https://foursquare.com/item/4bb8fbe670c603bbf7bf96b4
291	Harbiye Muhsin Ertuğrul Sahnesi	10	9.5	41.046442574912625	28.988928257812187	Harbiye Mah. Gümüş Cad. No:3	\N	\N	https://foursquare.com/item/5388b78e498e2bbfc1b9868c
292	Power Plate Akademi	10	9.5	40.960990837268874	29.085788726806637	Çolak İsmail Sok. no:49b Yılmazlar Apartmanı (Bağdat Caddesi)	\N	\N	https://foursquare.com/item/520d377411d22b227deb050f
293	Zehra Nargile Cafe	10	9.5	40.98760038469009	29.026037762220025	Caferağa Mah.	\N	\N	https://foursquare.com/item/51fa84fd498ef057272b39ea
294	Wiseguy NY Pizza	10	9.5	41.085653	29.046785	6. Sok. No:8 Rumeli Hisarüstü	\N	\N	https://foursquare.com/item/57b86e78498e9b76beb41c54
295	Suadiye Sahili	10	9.5	40.956891026778024	29.080222300357427	Suadiye Mah.	\N	\N	https://foursquare.com/item/536651c611d23054e11470f2
296	Louis Vuitton	10	9.5	41.109637287184505	29.031203621877847	İstinyePark (İstinye Bayırı Cad. No:73)	\N	\N	https://foursquare.com/item/50688d98e4b05eea70988e34
297	Mihrimah Sultan Camii	10	9.5	41.026661459747196	29.01561458512132	Sultantepe Mah. Paşalimanı Cad.	\N	\N	https://foursquare.com/item/52f4c262498e2b04bc6f92a1
298	Göztepe 60. Yıl Parkı	10	9.5	40.97018569638632	29.058405334280536	Caddebostan Mah. Opr. Cemil Topuzlu Cd. Göztepe	\N	\N	https://foursquare.com/item/51866194498e285dd8da0e4e
299	Ülker Stadyumu Fenerbahçe Şükrü Saracoğlu Spor Kompleksi	10	9.5	40.98768134935173	29.036929607391354	Zühtüpaşa Mah. Recep Peker Cad.	\N	\N	https://foursquare.com/item/523d940211d22b2bb4f5145e
300	Hissedilebilir Yüzey	10	9.5	41.09470732651691	28.986053466796875	Altınay Caddesi Nilüfer Sokak 2/2 Seyrantepe Kağıthane İstanbul (Altınay Caddesi)	\N	\N	https://foursquare.com/item/53848913498e6092c0146bf8
301	Pantheon	11	9.59999999999999964	41.89862864741138	12.476820119704826	Piazza della Rotonda (Via Palombella)	\N	\N	https://foursquare.com/item/5302206f498e2b04bcb66247
302	Piazza Navona	11	9.59999999999999964	41.898983153321815	12.47312839721866	Piazza Navona	\N	\N	https://foursquare.com/item/4c9766febc279c74f0626e53
303	Villa Borghese	11	9.59999999999999964	41.91201489708188	12.483375258087307	Piazzale Flaminio	\N	\N	https://foursquare.com/item/51b4f6ab498ebc58a32eb3d8
304	Giardino degli Aranci	11	9.59999999999999964	41.885151295235055	12.480127519340863	Piazza Pietro d'Illaria	\N	\N	https://foursquare.com/item/4d30267d789a8cfabaf32bc6
305	Fontana dei Quattro Fiumi	11	9.5	41.89893401813364	12.473145194596697	Piazza Navona	\N	\N	https://foursquare.com/item/4f80773ae4b06d09f9352a6a
306	Villa Doria Pamphilj	11	9.5	41.88317368508112	12.441598494723003	Villa Doria Pamphili	\N	\N	https://foursquare.com/item/520ce7fa498ea10a76e5420b
307	Colosseo	11	9.5	41.89078471886763	12.491444609573776	Piazza del Colosseo (Via dei Fori Imperiali)	\N	\N	https://foursquare.com/item/4f22f0cde4b08318750511fd
308	Basilica di San Pietro in Vaticano	11	9.5	41.902117334528036	12.453625202178953	Piazza San Pietro	\N	\N	https://foursquare.com/item/4e86d2134fc6432751dbca8f
309	Foro Romano	11	9.5	41.89259105805128	12.487009475478906	Via dei Fori Imperiali	\N	\N	https://foursquare.com/item/4e25f03845dd3b8cf8fe3224
310	Basilica di Santa Maria Maggiore	11	9.5	41.897629420367046	12.498428821563719	Piazza di Santa Maria Maggiore	\N	\N	https://foursquare.com/item/4f68b61ee4b0eebfb533aa1a
311	Piazza Venezia	11	9.5	41.89546654173921	12.482613711038741	Piazza Venezia	\N	\N	https://foursquare.com/item/4f4e5f9de4b0b0a21583347d
312	Castel Sant'Angelo	11	9.5	41.903131463609306	12.466328144073485	Lungotevere Castello	\N	\N	https://foursquare.com/item/4e5a69bb1fc7864a236a67ad
313	Parco Regionale dell'Appia Antica	11	9.5	41.8668603520918	12.50291347503662	Via Appia Antica, 58/60	\N	\N	https://foursquare.com/item/4e552d95a8093d27ccaf2704
314	Terrazza del Pincio	11	9.5	41.91110818501902	12.47797429561615	Villa Borghese	\N	\N	https://foursquare.com/item/4d996d5ed7366a311643130b
315	Piazza San Pietro	11	9.5	41.902424753297645	12.457670261795872	Piazza San Pietro	\N	\N	https://foursquare.com/item/53ef7ce0498e95ef2b92ad32
316	Terrazza del Gianicolo	11	9.5	41.89155637967782	12.461348446833272	Piazzale Giuseppe Garibaldi	\N	\N	https://foursquare.com/item/4c97552ebc279c7435c76d53
317	La Romana	11	9.40000000000000036	41.90770399964908	12.498898487180185	Via Venti Settembre, 60 (Via Piave)	\N	\N	https://foursquare.com/item/55b2b11e498e508ffb9f2ed6
318	Ponte Sant'Angelo	11	9.40000000000000036	41.90176997165117	12.466456890106201	Ponte Sant'Angelo	\N	\N	https://foursquare.com/item/53ef79e4498edf4260be446a
319	La Prosciutteria	11	9.40000000000000036	41.89063262939453	12.46856689453125	Via della Scala, 71	\N	\N	https://foursquare.com/item/560d6cab498e2a609eec92c6
320	Parco degli Acquedotti	11	9.40000000000000036	41.85172599464196	12.55763053894043	Via Lemonia	\N	\N	https://foursquare.com/item/4e7f68e500394ee730fe03b0
321	Villa Ada	11	9.40000000000000036	41.93447156087869	12.504975073533833	Via di Ponte Salario, 47	\N	\N	https://foursquare.com/item/4fd3161ce4b0f4325c6b50bf
322	Il Goccetto	11	9.40000000000000036	41.89780431431987	12.467462223177852	Via dei Banchi Vecchi, 14	\N	\N	https://foursquare.com/item/53ef84db498e99fa6d3a3203
323	Gelateria del Teatro	11	9.40000000000000036	41.900619868820854	12.469388242777415	Via dei Coronari, 65 (Via di San Simone 70)	\N	\N	https://foursquare.com/item/51f694e8498ebb945fe0803e
324	Buco della Serratura Priorato dei Cavalieri di Malta	11	9.40000000000000036	41.88339697349531	12.478408813476562	Villa del Priorato dei Cavalieri di Malta (Piazza dei Cavalieri di Malta, 3)	\N	\N	https://foursquare.com/item/5273b28811d208421e55ad0e
325	Piazza del Campidoglio	11	9.40000000000000036	41.89338078397464	12.482759356498718	Piazza del Campidoglio	\N	\N	https://foursquare.com/item/51f63bc4498ec5b141263dcf
326	Fontana delle Tartarughe	11	9.30000000000000071	41.89386218346234	12.477495798957165	Piazza Mattei	\N	\N	https://foursquare.com/item/4e6a6cfd81dc6cbf2734f2b5
327	Monumento Vittorio Emanuele	11	9.30000000000000071	41.895439625175584	12.482686505757227	Piazza Venezia	\N	\N	https://foursquare.com/item/560a2583498ee087b1d0917f
328	Auditorium Parco della Musica	11	9.30000000000000071	41.929280305259574	12.474651369569415	Viale Pietro de Coubertin, 30	\N	\N	https://foursquare.com/item/4e86cf494fc6432751db86e1
329	Piazza del Popolo	11	9.30000000000000071	41.91068300860548	12.476342493364426	Piazza del Popolo	\N	\N	https://foursquare.com/item/4f22f135e4b01b0c5de37bbb
330	Sushisen	11	9.30000000000000071	41.875164	12.479289	Via Giuseppe Giulietti, 21	\N	\N	https://foursquare.com/item/50f46105e4b0dfb46fe49d3d
331	Mohammed Bin Rashid Blvd (بوليفارد محمد بن راشد)	12	9.59999999999999964	25.194145687944182	55.27940999295211	دبي	\N	\N	https://foursquare.com/item/52003b44498e32d1d585c2c1
332	Jumeirah Beach (شاطئ جميرا)	12	9.59999999999999964	25.168188054485885	55.23031462588398	Near Jumeirah Beach Hotel & Burj Al Arab (2 C Street)	\N	\N	https://foursquare.com/item/521e301f498e90607b3e4913
333	The Dubai Mall (دبي مول)	12	9.59999999999999964	25.19689170060707	55.2788108369552	Mohammed bin Rashid Blvd. (بوليفارد محمد بن راشد)	\N	\N	https://foursquare.com/item/51e1c240498e7dedc1b4ad8e
334	Dubai Creek Golf & Yacht Club	12	9.59999999999999964	25.242056387145738	55.33367156982422	Sheikh Rashid Road	\N	\N	https://foursquare.com/item/5226f49a498e2e7b09ffb9be
335	Book World By Kinokuniya	12	9.59999999999999964	25.19720738548365	55.27731026634251	The Dubai Mall, Level 2 (Doha Street)	\N	\N	https://foursquare.com/item/523da902498e38c1d056873a
336	The Dubai Fountain (نافورة دبي)	12	9.59999999999999964	25.195735424344377	55.27736424324963	D 55 (Emaar Blvd)	\N	\N	https://foursquare.com/item/520a67e1498e5527ba7278b6
337	Jumeirah (جميرا)	12	9.59999999999999964	25.13335757044343	55.18657922744751	Jumeirah Beach Road, Next to Wild Wadi (بعد فندق شاطئ جميرا - شارع جميرا الصفوح)	\N	\N	https://foursquare.com/item/4f6b7564e4b0b949c511ff0a
338	The Walk at JBR (الممشى في الجي بي آر)	12	9.59999999999999964	25.076719083619327	55.13225664200999	JBR Rd. (at Al Gharbi St)	\N	\N	https://foursquare.com/item/50dc6362e4b0eb147181f37e
339	Burj Khalifa (برج خليفة)	12	9.59999999999999964	25.197233275964653	55.27414798736572	1 Mohammed bin Rashid Blvd (at Doha St.)	\N	\N	https://foursquare.com/item/51925c65498eebc6aae26640
340	La Petite Maison	12	9.5	25.213056981984657	55.28268653229415	Capitol Club (DIFC)	\N	\N	https://foursquare.com/item/50eb1f40e4b05fbb8b33aedc
341	Zuma	12	9.5	25.213923483319164	55.28339907463437	Gate Village 06, DIFC	\N	\N	https://foursquare.com/item/5217b93611d22d0e81676022
342	Skydive Dubai Palm Drop Zone	12	9.5	25.090496087853886	55.136518478393555	Al Seyahi St	\N	\N	https://foursquare.com/item/51d53f61498ec498f6fc53de
343	PF Chang's (بي إف تشانغز)	12	9.5	25.195335329012185	55.2782818558436	The Dubai Mall (at Doha St.)	\N	\N	https://foursquare.com/item/51c0b8bd498e9abf7e900e8d
344	Box Park (بوكس بارك)	12	9.5	25.200010157411757	55.24920908548897	Al Wasl (Al Wasl Rd.)	\N	\N	https://foursquare.com/item/550af8fb498e003a0aefad1f
345	Level Shoe District	12	9.5	25.19640875406406	55.27906453313012	Dubai Mall	\N	\N	https://foursquare.com/item/5246c687498ea910d3f8086d
346	Atlantis The Palm (أتلانتس النخلة)	12	9.40000000000000036	25.130450973997565	55.116965284977866	Atlantis The Palm (Crescent Road, Palm Island)	\N	\N	https://foursquare.com/item/5240728311d2f5423a8e0c2c
347	Kite Surf Beach	12	9.40000000000000036	25.165239020746718	55.20926153619319	Nessnass St (Behind Sunset Mall, Sheikh Hamdan Villas)	\N	\N	https://foursquare.com/item/5229ba7c11d2c9c9ceb0d49a
348	The Cheesecake Factory (تشيز كيك فاكتوري)	12	9.40000000000000036	25.11850748273718	55.19862098555441	Mall Of the Emirates (Al Barsha Area)	\N	\N	https://foursquare.com/item/5107aa65e4b054404b0d1cfa
349	Aquaventure Waterpark	12	9.40000000000000036	25.132133720282052	55.11890709400177	Atlantis The Palm (Crescent Road, Palm Island)	\N	\N	https://foursquare.com/item/512676b3e4b03c62595093be
350	Roberto's	12	9.40000000000000036	25.21244819452602	55.28203337365594	DIFC Gate Village 1	\N	\N	https://foursquare.com/item/52642e10498eaec54974a1d8
351	Mall of the Emirates (مول الإمارات)	12	9.40000000000000036	25.11849265427231	55.20102618448692	Sheikh Zayed Rd. (at Umm Suqeim St.)	\N	\N	https://foursquare.com/item/51c7ed65498e3f125241fd35
352	Burj Park (حديقة البرج)	12	9.40000000000000036	25.19419621593019	55.27366690328274	Downtown Dubai (EMAAR Boulevard)	\N	\N	https://foursquare.com/item/5176e851498e23dcf4a60ef3
353	Jetty Lounge	12	9.40000000000000036	25.09711297486846	55.15038029194833	One & Only Royal Mirage (Al Sufouh Road)	\N	\N	https://foursquare.com/item/50a1cae6e4b04e5db44bae5d
354	Reel Cinemas (ريل سينما)	12	9.40000000000000036	25.196168180007888	55.28080264190182	The Dubai Mall	\N	\N	https://foursquare.com/item/50a2c3a6e4b008b721516ca0
355	Dolphin Bay	12	9.40000000000000036	25.135028873730523	55.12225606396399	Atlantis The Palm (Crescent Road, Palm Island)	\N	\N	https://foursquare.com/item/525b1e2611d205d465c048f6
356	The Cheesecake Factory	12	9.40000000000000036	25.19710866244674	55.2790267485461	The Dubai Mall	\N	\N	https://foursquare.com/item/503a85bde4b0b8a7fe4bf5f3
357	Kempinski Hotel (فندق كمبنسكي)	12	9.40000000000000036	25.11866748104462	55.19753705026807	Mall of the Emirates, Sheikh Zayed Road (مول الإمارات - شارع الشيخ زايد)	\N	\N	https://foursquare.com/item/5097345ae4b0147d2ef5e96a
358	Dar Al Masyaf	12	9.40000000000000036	25.13191354028402	55.182546716016546	Madinat Jumeirah (Al Sufouh Road)	\N	\N	https://foursquare.com/item/5151aa64e4b0cacc4845ccd8
359	Talise Ottoman Spa	12	9.40000000000000036	25.098424457412456	55.124759674072266	Jumeirah Zabeel Saray (The Palm Jumeirah)	\N	\N	https://foursquare.com/item/4fef4687e4b0562c836af482
360	Siddharta  Lounge By Buddha-Bar	12	9.40000000000000036	25.086613366283903	55.14341168879255	Grosvenor House Dubai (Al Sufouh road)	\N	\N	https://foursquare.com/item/52500bc211d2e7bb92b072fc
361	Oakwood Premier	13	9	23.132120374821756	113.323164470071	28 Tiyu Dong Road, Tianhe District	\N	\N	https://foursquare.com/item/52f8f06711d24ed482037845
362	Shamian Island 沙面岛	13	9	23.110614066104826	113.23760451635096	白鵝潭北岸, 荔灣區	\N	\N	https://foursquare.com/item/542d5011498eed5f9fbc9994
363	太古汇 Tai Koo Hui	13	8.90000000000000036	23.136461248731827	113.32679876770406	383 Tianhe E. Rd.	\N	\N	https://foursquare.com/item/4f2b1d62e4b05a27b90beade
364	Huacheng Plaza (花城广场)	13	8.90000000000000036	23.121843997790997	113.31920451662414	珠江新城珠江西路和珠江东路 (btw 金穗路&花城大道), 天河区	\N	\N	https://foursquare.com/item/55d702fb498eedd858d26eb3
365	The Ritz-Carlton, Guangzhou	13	8.90000000000000036	23.118811684922456	113.32191467285156	天河区珠江新城兴安路3号	\N	\N	https://foursquare.com/item/4fd214cde4b0006b634b9529
366	大头虾越式风味餐厅 Tiger Prawn Vietnamese Rest.	13	8.80000000000000071	23.12408849	113.262113	惠福东路548号	\N	\N	https://foursquare.com/item/518cc557498eb5cf715d383e
367	广州大剧院 Guangzhou Opera House	13	8.80000000000000071	23.117864427356658	113.31697940826416	天河区珠江新城珠江西路1号	\N	\N	https://foursquare.com/item/4e0adc571520ee0fba8d90ee
368	Osotto Spa	13	8.69999999999999929	23.1757892976367	113.25185265392867	广州	\N	\N	https://foursquare.com/item/52219d2111d2a495676a36a3
369	方所 Fangsuo Commune	13	8.69999999999999929	23.13659149163518	113.32599631650774	383 Tianhe Rd. (at MU35 of TaiKoo Hui)	\N	\N	https://foursquare.com/item/4ed0c3705c5c9528f9a9fa1b
370	Sultan Turkish Restaurant	13	8.69999999999999929	23.140748380151393	113.2814762039669	No:367, HuangShi Dong Lu (Across the road from Garden Hotel)	\N	\N	https://foursquare.com/item/5163aa87e4b0fe302085caae
371	The Brew Panyu	13	8.69999999999999929	22.99628380200277	113.34547519683838	Main entrance of Huanan Country Garden, Panyu (广州番禺华南碧桂园正门右侧商业街11号)	\N	\N	https://foursquare.com/item/4fab7e4de4b0d7ccc921c8df
372	长隆国际大马戏 Chimelong International Circus	13	8.59999999999999964	23.00581055507281	113.32566486898969	中国	\N	\N	https://foursquare.com/item/531b119d498e2b3d2ece3c90
373	广州塔 Canton Tower	13	8.59999999999999964	23.108954451263017	113.31893121499859	222 Yuejiang West Road	\N	\N	https://foursquare.com/item/526f910b11d2854d009e9bb9
374	星巴克 Starbucks	13	8.59999999999999964	23.109896345197654	113.238425552845	50-52 Shamian St. (at Shamian Island)	\N	\N	https://foursquare.com/item/4b9da6de70c603bb3f6d94b4
375	Chimelong Safari Park (长隆野生动物世界)	13	8.59999999999999964	23.00296531820421	113.31031924868662	中国	\N	\N	https://foursquare.com/item/53e67279498e7cd4f41e2987
376	Element Fresh (新元素)	13	8.59999999999999964	23.11719913397827	113.33435222779819	珠江新城清风街42号首层(凯旋新世界), 天河区	\N	\N	https://foursquare.com/item/55441fee498e5f4efc7b53c7
377	Le Saint Tropez Cocktail Bar	13	8.59999999999999964	23.133809	113.279381	建设六马路｜Jiansheliuma Rd (Dongfeng Road)	\N	\N	https://foursquare.com/item/51e64756498e9c6df70f1574
378	bombay grill	13	8.5	23.138906507930052	113.28483741270988	中国	\N	\N	https://foursquare.com/item/55be2d97498e642628dba0ba
379	Element Fresh (新元素)	13	8.5	23.136513553644967	113.32751399512148	天河区天河路383号太古汇广场L302号铺 / 3/F Garden, Tai Koo Hui Shopping Center, 383 Tianhe Lu	\N	\N	https://foursquare.com/item/510cbdfae4b0dc1da2e1a71f
380	沙面公园 Shamian Park	13	8.5	23.10796222544435	113.23929727077484	at Shamian Island	\N	\N	https://foursquare.com/item/5235497c498eb85f17aae0b4
381	Sultan Restaurant Turkish BBQ (苏坦土耳其餐厅)	13	8.40000000000000036	23.123078431809557	113.3276244773363	兴盛路, 天河区	\N	\N	https://foursquare.com/item/5447679a498e9d140fea3b63
382	摩天轮 Bubble Tram	13	8.40000000000000036	23.10912088534091	113.31911147778555	222 Yuejiang W Rd	\N	\N	https://foursquare.com/item/5639b1bccd10e24397fe9c86
383	Starbucks	13	8.30000000000000071	23.13613742469503	113.35600018501282	天河区中山大道西186号东方都会广场1楼 (天河公园店 - Tianhe Park)	\N	\N	https://foursquare.com/item/4bef695670c603bb9fad9bb4
384	Apple Parc Central (Apple Store, 天环广场)	13	8.30000000000000071	23.135	113.31916	天河区天河路 218 号	\N	\N	https://foursquare.com/item/57935493498e86a4cbefb8d1
385	Panda Centre @Chimelong Safari Park	13	8.30000000000000071	23.00335968933083	113.30996453330037	中国	\N	\N	https://foursquare.com/item/57d9377d498e4f8450c54632
386	Bosphorus Turkish Restaurant 铂斯土耳其西餐厅	13	8.30000000000000071	23.122980074489938	113.32594398270017	兴盛路11，17号越和兴盛汇G层G区9号铺, 天河区	\N	\N	https://foursquare.com/item/52ce78b5498e1a35aa3023e6
387	Social & Co	13	8.30000000000000071	23.118661635798322	113.3122323825117	112-113 Shop No 6 Huajiu Road	\N	\N	https://foursquare.com/item/551e2b3f498e1cb7c924065e
388	Roku Roku (六绿)	13	8.30000000000000071	23.143941799573852	113.31669827834742	天河北路177号祥龙花园首层 (中国市长大厦旁)	\N	\N	https://foursquare.com/item/4e64d2d9cc3f7bb3743c898d
389	Bingsheng Restaurant (炳胜品味)	13	8.19999999999999929	23.108324007036252	113.280685328897	海珠区东晓路33号	\N	\N	https://foursquare.com/item/531313b7498e8927d1c2320c
390	长隆水上乐园 Chime Long Waterpark	13	8.19999999999999929	23.00295758734511	113.31891958513967	长隆乐园	\N	\N	https://foursquare.com/item/5354d54f498e098f0a70b6c0
391	Auditorio Nacional del Sodre Dra. Adela Reta	14	9.40000000000000036	-34.90455846964091	-56.19840949788935	Andes (Mercedes)	\N	\N	https://foursquare.com/item/4fe0e4fee4b0f9ff3caa3d5c
392	Escarmuza Librería y Café	14	9.30000000000000071	-34.906509	-56.171281	Pablo de María 1185 (Canelones)	\N	\N	https://foursquare.com/item/588406b0ca10706e674a1bb4
393	Lavender	14	9.30000000000000071	-34.88098	-56.062348	Mones Roses 6415 (Divina Comedia)	\N	\N	https://foursquare.com/item/51cf4341498eddc6c9261d7d
394	Gran Parque Central	14	9.30000000000000071	-34.88485489854485	-56.158721330455634	Calle Carlos Anaya 2900	\N	\N	https://foursquare.com/item/521e0f5e11d21b5fcada27c5
395	La Perdiz	14	9.30000000000000071	-34.9248681883622	-56.15696604365427	Guipuzcoa 350 (Baliñas)	\N	\N	https://foursquare.com/item/4e76ab33ae60c32851ad8bae
396	Teatro Solís	14	9.30000000000000071	-34.907472430764535	-56.200947761535645	Buenos Aires s/nº (e/ Liniers y Bartolomé Mitre)	\N	\N	https://foursquare.com/item/4ed43b080aafb9162664d00b
397	Rambla Armenia	14	9.19999999999999929	-34.90439235008172	-56.1321012419277	Uruguay	\N	\N	https://foursquare.com/item/51d1ea45498e00f51e01b136
398	Estrecho	14	9.19999999999999929	-34.907789	-56.205578	Sarandí 460 (e/ Misiones y Treinta y Tres)	\N	\N	https://foursquare.com/item/4ea6a3c7823194acfbc54d90
399	Museo Juan Manuel Blanes	14	9.19999999999999929	-34.853047714751305	-56.19738968277104	Av. Millan (Costanera Francisco Lavalleja)	\N	\N	https://foursquare.com/item/50ef3245e4b0a9d5bf1ec092
400	La Cocina de Pedro	14	9.19999999999999929	-34.91248240610757	-56.18316797418712	Gonzalo Ramírez 1483 (e/ Barrios Amorín y Martínez Trueba)	\N	\N	https://foursquare.com/item/5138ba6de4b0b1a5409e7947
401	Rambla República Argentina	14	9.19999999999999929	-34.915162	-56.182323	Rambla República Argentina (e/ Río Negro y Jackson)	\N	\N	https://foursquare.com/item/4e8e0687b63430010bcd3010
402	Pellegrin Boutique Gourmet	14	9.19999999999999929	-34.918487381718094	-56.16004943847656	Gregorio Suarez 2734 (Coronal Mora)	\N	\N	https://foursquare.com/item/4ff4b195e4b0fecb24bc65de
403	Rambla de Carrasco	14	9.19999999999999929	-34.89146554353708	-56.055951578909315	Rambla República de México (Rambla Tomas Berreta)	\N	\N	https://foursquare.com/item/57a90b8d498e6abef97d0ff7
404	Rambla Gran Bretaña	14	9.09999999999999964	-34.91063982044504	-56.200711727142334	Rambla Gran Bretaña (e/ Misiones y Convención)	\N	\N	https://foursquare.com/item/4f678c2ee4b0bf1014ae5a1e
405	Carrasco Lawn Tennis Club	14	9.09999999999999964	-34.88462841468517	-56.0603141784668	Couture 6401 (Alfredo Arocena)	\N	\N	https://foursquare.com/item/4e43ff07b61cac6fc74f7cbd
406	Estadio Campeón del Siglo	14	9.09999999999999964	-34.79644650915843	-56.06752331197301	Ruta Perimetral 102 (R. 8)	\N	\N	https://foursquare.com/item/54aed30e498efc96aea39ebf
407	La Pasionaria	14	9.09999999999999964	-34.908581	-56.202392	Reconquista 587 (esq Juan Carlos Gómez)	\N	\N	https://foursquare.com/item/4f78ca04e4b040208d8258d9
408	Sin Pretensiones	14	9.09999999999999964	-34.90847470917452	-56.2074028976902	Sarandi 366 (Alzaibar)	\N	\N	https://foursquare.com/item/55f2e404498ec86a9c4809a0
409	Instinto Crossfit	14	9.09999999999999964	-34.91719497405582	-56.157592927976474	21 De Setiembre 2745 (Luis De La Torre)	\N	\N	https://foursquare.com/item/52ff8bfb498eb13ce1daaca3
410	Candy Bar Palermo	14	9	-34.910154380141016	-56.184825607145186	Durazno 1402 (Santiago De Chile)	\N	\N	https://foursquare.com/item/55d94b03498ee85c370ba89c
411	Rambla Pocitos	14	9	-34.915206042258966	-56.14904586230431	Uruguay	\N	\N	https://foursquare.com/item/52d9e3b0498e5376e7f714d3
412	Ashot Shawarma	14	9	-34.90731405807303	-56.190218925476074	Zelmar Michelini 1295	\N	\N	https://foursquare.com/item/505293b1e4b021c8a6d267a4
413	La Madriguera Café	14	9	-34.888784518968585	-56.05771038834189	Cambará 1614 (Av. Arocena)	\N	\N	https://foursquare.com/item/56545db7498e9c30077927c8
414	Jacinto	14	9	-34.90829396762447	-56.207795594772556	Sarandí 349 (Alzaibar)	\N	\N	https://foursquare.com/item/514715f2e4b00b9d385bd3fe
415	Plaza Trouville	14	9	-34.919753910918224	-56.14862616066894	Rambla República del Perú (21 de Setiembre)	\N	\N	https://foursquare.com/item/4ed26da7cc219860f9d87588
416	Dulce Amor	14	9	-34.905345200721015	-56.14749243070742	Francisco Joaquín Muñoz 3150 (Lorenzo Justiniano Pérez)	\N	\N	https://foursquare.com/item/57436461cd107d041dae4d8a
417	Parque José Enrique Rodó	14	9	-34.91479435819343	-56.16587910222571	Av. Julio Herrera y Reissig (esq. Gonzalo Ramírez y Sarmiento)	\N	\N	https://foursquare.com/item/4f6b82fbe4b0ef1d48cc06d0
418	Tandory	14	9	-34.907730972207425	-56.15246350365168	Ramon Masini 1130 (Libertad)	\N	\N	https://foursquare.com/item/50aea9ade4b042e780326f40
419	Primuseum	14	9	-34.90846595435817	-56.21023362628014	Perez Castellano 1389 (Washington)	\N	\N	https://foursquare.com/item/56eaf1d1498e97fe6e892f4b
420	Doña Inés	14	9	-34.90979790529918	-56.14608073830799	Miguel Barreiro 3293 (Alejandro Chucarro)	\N	\N	https://foursquare.com/item/51fea4e0498eb8884bf5b011
421	Parque Bicentenario	15	9.5	-33.40111552116336	-70.60136730355696	Av. Bicentenario 3800 (Espoz)	\N	\N	https://foursquare.com/item/5155d188e4b07fe4e6cfa674
422	Centro Cultural Gabriela Mistral	15	9.5	-33.439366395649586	-70.63984711506914	Av. Libertador Bernardo O'Higgins 227 (José Victorino Lastarria)	\N	\N	https://foursquare.com/item/4e513ea215203aaed660ac12
423	Cerro San Cristóbal	15	9.40000000000000036	-33.415558419794635	-70.61730797746601	Pedro De Valdivia Norte (Parque Metropolitano de Santiago)	\N	\N	https://foursquare.com/item/526d550711d27af83de8ee71
424	CorpArtes	15	9.40000000000000036	-33.40452840071528	-70.57355703802654	Rosario Norte (660)	\N	\N	https://foursquare.com/item/550103a711d2605cb5f5cb18
425	Parque Araucano	15	9.40000000000000036	-33.403481247880805	-70.57497460310128	Av. Presidente Riesco 5698 (Rosario Norte)	\N	\N	https://foursquare.com/item/4f58e4fce4b0ad7e16293e2b
426	Museo Chileno de Arte Precolombino	15	9.30000000000000071	-33.43889049721424	-70.65223932266235	Bandera 361 (con Compañía de Jesús)	\N	\N	https://foursquare.com/item/51636780e4b0293e0def20f4
427	Barrio Bellas Artes	15	9.30000000000000071	-33.43663732825613	-70.64431415567346	Santiago de Chile	\N	\N	https://foursquare.com/item/5042bbfbe4b0b9943e8cb2e6
428	Teatro Municipal de Santiago	15	9.30000000000000071	-33.44056519939493	-70.64763100842247	Agustinas 794 (esq. San Antonio)	\N	\N	https://foursquare.com/item/4f62627ce4b0a9d091f6686b
429	Beervana	15	9.30000000000000071	-33.420718613299336	-70.60544550418854	Los Leones 106 (Avenida Providencia)	\N	\N	https://foursquare.com/item/5392657e498edb363c338538
430	Cumbre Cerro San Cristóbal	15	9.30000000000000071	-33.42624066300979	-70.63320166287683	Av. Pedro Bannen (Cerro San Cristobal)	\N	\N	https://foursquare.com/item/4f578bf6e4b03d89ebca19ce
431	Tiramisú	15	9.19999999999999929	-33.41445955293124	-70.59757957518136	Isidora Goyenechea 3141 (Augusto Leguía Norte)	\N	\N	https://foursquare.com/item/4cc9a5625c17b60c5f6c0a05
432	L' Provenza	15	9.19999999999999929	-33.48487411697453	-70.55734190087101	Mariano Sanchez de Fontecilla (Av. Los Presidentes)	\N	\N	https://foursquare.com/item/4e06659f52b165b7d7a81733
433	Bocanáriz	15	9.19999999999999929	-33.43838017841934	-70.64110279083252	Jose Victorino Lastarria 276 (Villavicencio)	\N	\N	https://foursquare.com/item/5494d6e6498ec012601db164
434	Museo Nacional de Historia Natural	15	9.19999999999999929	-33.441716769549124	-70.68180894927075	Matucana 520 (Interior del Parque Quinta Normal)	\N	\N	https://foursquare.com/item/50709067e4b008c20d8c63c6
435	Parque Forestal	15	9.19999999999999929	-33.436103994841815	-70.64078815954213	Av. Cardenal José María Caro (Ismael Valdés Vergara)	\N	\N	https://foursquare.com/item/4d95f35def7860fc42cf2f48
436	Cerro Santa Lucía	15	9.19999999999999929	-33.441164343622766	-70.64372745957283	Av. Libertador Bernardo O'Higgins (Victoria Subercaseaux)	\N	\N	https://foursquare.com/item/4f57b086e4b0377eef1ef3ca
437	Patio Bellavista	15	9.19999999999999929	-33.43403787076385	-70.63507318496704	Bellavista (Constitución y Pío Nono)	\N	\N	https://foursquare.com/item/4eb93c534fc6167a83d5a34b
438	Viña Concha y Toro	15	9.19999999999999929	-33.63496612185231	-70.57600872591536	Av. Virginia Subercasaux 210	\N	\N	https://foursquare.com/item/513be6afe4b0334da7890c90
439	Bike Park Reserva El Durazno	15	9.09999999999999964	-33.32102578448955	-70.51664829254149	Av. La Dehesa S/N	\N	\N	https://foursquare.com/item/531baf1711d2d3eb448c127a
440	Baco	15	9.09999999999999964	-33.42062938035522	-70.61022071515231	Nueva de Lyon  113 (Av. Andres Bello)	\N	\N	https://foursquare.com/item/52a8f14111d25bb0371972d9
441	Cajón del Maipo	15	9.09999999999999964	-33.58731577789167	-70.46724005047217	Metropolitana de Santiago de Chile	\N	\N	https://foursquare.com/item/521ad7de11d20329d02b7ea0
442	Carrer Nou	15	9.09999999999999964	-33.445548	-70.616773	Miguel Claro 1802 (Santa Isabel)	\N	\N	https://foursquare.com/item/4ec69e927ee537da7d7f5beb
443	Fuente Alemana	15	9.09999999999999964	-33.425651954781536	-70.6115394183974	Av. Pedro de Valdivia 210 (Barcelona)	\N	\N	https://foursquare.com/item/51040214e4b07c0045d23686
444	Café Forastero	15	9.09999999999999964	-33.44549632842146	-70.66770590537745	Av. Ricardo Cumming 54 (Erasmo Escala)	\N	\N	https://foursquare.com/item/56102639498e4bc2e3a7d8e5
445	Trufa Cafetería Gourmet	15	9.09999999999999964	-33.448248315598335	-70.58116768874247	Simon Bolivar 4744 (Entre General Gorostiaga y Coventry)	\N	\N	https://foursquare.com/item/5500d053498eb6f2753b273b
446	Palacio Las Majadas de Pirque	15	9.09999999999999964	-33.63260706462511	-70.53434584259398	José Julio Nieto s/n, Loteo Parque Las Majadas	\N	\N	https://foursquare.com/item/57607a54498eb626d9a8c101
447	La Picá Árabe	15	9.09999999999999964	-33.44355240687902	-70.59232783036275	Echeñique 3707 (Regina Pacis)	\N	\N	https://foursquare.com/item/501d837ae4b04e60b8a1fbee
448	Parque de las Esculturas	15	9.09999999999999964	-33.42038963261798	-70.61318343556708	Av. Santa María 2205 (btw Pedro de Valdivia and Padre Letelier)	\N	\N	https://foursquare.com/item/4f57af8ee4b0b1792ee18739
449	Biblioteca Nacional de Chile	15	9.09999999999999964	-33.442454967126295	-70.64576637069796	Alameda 651 (Mac-Iver)	\N	\N	https://foursquare.com/item/522dbc0911d25f697be541e4
450	Prince of Wales Country Club	15	9.09999999999999964	-33.43511164451311	-70.57142487318224	Las Arañas 1901	\N	\N	https://foursquare.com/item/4fb7c714e4b0e5da45964c06
451	Foz do Douro	16	9.59999999999999964	41.14963687309979	-8.673802932575141	Avenida Dom Carlos I (Rua Dom Luis Filipe)	\N	\N	https://foursquare.com/item/516b32e4e4b08b60e3b6e69e
452	Parque da Cidade	16	9.5	41.16935071760144	-8.679156303405762	Av. da Boavista	\N	\N	https://foursquare.com/item/526aaaa811d23d7f90637527
453	Avenida dos Aliados	16	9.5	41.148302294633744	-8.61104001015237	Av. dos Aliados	\N	\N	https://foursquare.com/item/4c994e2eb8e9224b7a57443d
454	A Sandeira do Porto	16	9.5	41.145265309794624	-8.61272561586799	R. dos Caldeireiros, 85	\N	\N	https://foursquare.com/item/5332ee37498ecf1f7c17f838
455	Brick	16	9.5	41.14569051075151	-8.615119884274497	Rua Campo Mártires da Pátria, 103	\N	\N	https://foursquare.com/item/563e547dcd100e5879ef45a0
456	Essência	16	9.40000000000000036	41.16550235521069	-8.629234712324898	R. Pedro Hispano, 1190	\N	\N	https://foursquare.com/item/4e97735c4690641441ee9be8
457	Jardins do Palácio de Cristal	16	9.40000000000000036	41.14773932269897	-8.626233280657345	R. D. Manuel II, 15	\N	\N	https://foursquare.com/item/4e4ac237483b16676e42f080
458	Parque de Serralves	16	9.40000000000000036	41.15851948354566	-8.657773733139038	R. D. João de Castro (R. de Serralves)	\N	\N	https://foursquare.com/item/522728ad11d2fb89350a5827
459	Fundação Serralves	16	9.30000000000000071	41.15958136343416	-8.657767627482604	Rua D. João de Castro, 210	\N	\N	https://foursquare.com/item/52992890498e793d0ec87deb
460	Taberna dos Mercadores	16	9.30000000000000071	41.141339	-8.612992	Rua dos Mercadores 36	\N	\N	https://foursquare.com/item/547bc48a498ec1e1d5fb40cb
461	Casa da Música	16	9.30000000000000071	41.15875373498798	-8.630833625793457	Av. da Boavista, 604-610	\N	\N	https://foursquare.com/item/512ce3ade4b0d87b09554d49
462	Yuko	16	9.30000000000000071	41.176337831615555	-8.585679907953969	R. Costa Cabral, 2331	\N	\N	https://foursquare.com/item/4d54881896ed54818ce4fe6f
463	Casa Guedes	16	9.30000000000000071	41.14617116717532	-8.603428408210613	Praça dos Poveiros, 130 (Rua de Santo Ildefonso)	\N	\N	https://foursquare.com/item/50a394dfe4b084ec464aa264
464	Baixa do Porto	16	9.30000000000000071	41.147315217275356	-8.612875926469181	R. Cândido dos Reis	\N	\N	https://foursquare.com/item/5236024b11d2d03b9c6cf795
465	O Paparico	16	9.30000000000000071	41.176458006272604	-8.585583314208124	R. de Costa Cabral, 2343	\N	\N	https://foursquare.com/item/5210a348498e147a8170fda7
466	Aduela	16	9.19999999999999929	41.14914734216948	-8.615023253150884	R. das Oliveiras, 36	\N	\N	https://foursquare.com/item/52024f63498e4ad90f516d5e
467	Sé Catedral do Porto	16	9.19999999999999929	41.14309513286508	-8.611415778896472	Lg. do Terreiro da Sé	\N	\N	https://foursquare.com/item/4c29edb79eb19521c4d22959
468	Praça da Liberdade	16	9.19999999999999929	41.146396544786384	-8.611319152470935	Pç. da Liberdade	\N	\N	https://foursquare.com/item/4f48a863e4b0a644ecf73113
469	Jardim do Passeio Alegre	16	9.19999999999999929	41.1475169333306	-8.672277150946853	R. do Passeio Alegre	\N	\N	https://foursquare.com/item/4f7db12fe4b0fcf30bfac250
470	Mesa 325	16	9.19999999999999929	41.1482787615065	-8.597422328702775	Avenida de Camilo, 325	\N	\N	https://foursquare.com/item/5864d5ba7220e61ff5cd22d9
471	Santini	16	9.19999999999999929	41.14555067546518	-8.612306895042776	Largo dos Lóios, 17	\N	\N	https://foursquare.com/item/559fce9b498ea9ab2d89ff50
472	Torre dos Clérigos	16	9.19999999999999929	41.14565052342069	-8.61452579498291	R. de S. Filipe de Nery	\N	\N	https://foursquare.com/item/5309d5b411d2a9634efcde68
473	Museu de Serralves	16	9.19999999999999929	41.15928698094948	-8.659223290403187	R. D. João de Castro, 210 (Av. Marechal Gomes da Costa)	\N	\N	https://foursquare.com/item/4c9162d94c19ef3b2c9e84e1
474	Terra	16	9.09999999999999964	41.15670020684744	-8.679755920434344	R. do Padrão, 103	\N	\N	https://foursquare.com/item/4d7d469b73ca54819d076e7c
475	Pausa	16	9.09999999999999964	41.14847587287472	-8.614405890531401	Rua José Falcão, 82	\N	\N	https://foursquare.com/item/565a8c5438fa6fde4c121158
476	Padaria Ribeiro	16	9.09999999999999964	41.14750575074688	-8.61476557075369	Pç. Guilherme Gomes Fernandes	\N	\N	https://foursquare.com/item/53e4abed498e9667132f7cb6
477	Gazela	16	9.09999999999999964	41.144835399131004	-8.607309263915228	Tv. Cimo de Vila, 4	\N	\N	https://foursquare.com/item/4f70a900e4b0e0075d6ef913
478	Bonaparte	16	9.09999999999999964	41.153746	-8.679078	Av. Brasil, 130	\N	\N	https://foursquare.com/item/4c9a8ec3bdaf9c743cc269ba
479	Museu FC Porto / FC Porto Museum	16	9.09999999999999964	41.16066666212106	-8.582776782873397	Via Futebol Clube do Porto	\N	\N	https://foursquare.com/item/529b6a4111d22599efd8101b
480	Jimão	16	9.09999999999999964	41.14076708757516	-8.613031605618772	Praça da Ribeira, 11/12 (Rua dos Mercadores)	\N	\N	https://foursquare.com/item/51e72124498eb9f9c5347acd
481	Drift	17	9.30000000000000071	12.93507260443838	100.88264793205362	Pattaya Sai Nueng Rd. (at Hilton Pattaya)	\N	\N	https://foursquare.com/item/50793ffbe4b0112fc3483b8a
563	Prague Castle View Point	19	9.40000000000000036	50.089205414026864	14.398422327886177	Ke Hradu	\N	\N	https://foursquare.com/item/51bf723ee4b0111e5c39b7cf
482	Pattaya View Point (จุดชมวิวเขาพระตำหนัก)	17	9.09999999999999964	12.922043733109314	100.86613297462463	ถ.พระตำหนัก	\N	\N	https://foursquare.com/item/4dcfbd30fa7664b7c6c80f31
483	CentralFestival Pattaya Beach (เซ็นทรัลเฟสติวัล พัทยา บีช)	17	9	12.934794581471342	100.88364596096476	333/99 Moo 9 (Pattaya Sai Nueang Rd)	\N	\N	https://foursquare.com/item/526f2cdf498e4c1ef6592f50
484	Café des Amis	17	9	12.913175928822163	100.87337493896484	391/6, Moo 10, Soi 11, Thappraya Road	\N	\N	https://foursquare.com/item/5200e215498e7c47cce32003
485	Mantra Restaurant & Bar	17	9	12.94885396503056	100.88466054251704	240 Moo 5 Pattaya Sai Nueng Rd (at Amari Orchid Pattaya)	\N	\N	https://foursquare.com/item/520c6a4b11d2bcced392a511
486	Surf & Turf Pattaya	17	8.90000000000000036	12.964272	100.884303	Naklua Soi16, Pattaya (Naklua Soi16)	\N	\N	https://foursquare.com/item/56515e35498e4b05411b4833
487	Nong Nooch Garden & Resort (สวนนงนุช)	17	8.90000000000000036	12.767408270115205	100.93345039196097	34/1 Moo 7 (Sukhumvit Rd)	\N	\N	https://foursquare.com/item/5194d0e7498eac3d5f30fef7
488	UNIQLO (ยูนิโคล่) ユニクロ	17	8.90000000000000036	12.93536835610951	100.88255970900687	CentralFestival Pattaya Beach (G Fl, Sunken Zone)	\N	\N	https://foursquare.com/item/516e6475498e616e4e55ce48
489	BAR ITALIA by Gie Gie	17	8.80000000000000071	12.935262628923356	100.88259830657977	CentralFestival Pattaya Beach (2nd Fl)	\N	\N	https://foursquare.com/item/551521e7498e88bb2529c8c0
490	Blue Olive	17	8.80000000000000071	12.909887	100.880199	Soi 8, Thepprasit Road	\N	\N	https://foursquare.com/item/546a09ef498ef3956e18f724
491	The Glass House (เดอะ กลาสเฮ้าส์)	17	8.80000000000000071	12.84880989	100.901642	5/22 Moo 2 (Na Jomtien 10)	\N	\N	https://foursquare.com/item/4df32eba7d8b18e1722e1aae
492	Rimpa Lapin (ริมผา ลาภิน)	17	8.80000000000000071	12.80538263020302	100.91327177806997	Na Chom Thian 36 (Sukhumvit Rd., km 160)	\N	\N	https://foursquare.com/item/4bc303c570c603bb109697b4
493	Beefeater	17	8.80000000000000071	12.930720008383272	100.88219578980342	Soi Diana (2nd St)	\N	\N	https://foursquare.com/item/4d57dd77577aa09311f24ab9
494	Club Insomnia	17	8.69999999999999929	12.925862446148557	100.87149939254742	Walking Street (Soi 16)	\N	\N	https://foursquare.com/item/50fc5e1be4b0096f9222ee1d
495	Savanna Massage Therapy Pattaya	17	8.69999999999999929	12.920463764322857	100.8628163467661	บางละมุง	\N	\N	https://foursquare.com/item/514f2920e4b01bb283b98291
496	Radius @ Cape Dara	17	8.69999999999999929	12.954299894429557	100.8828298923458	บางละมุง	\N	\N	https://foursquare.com/item/518f1c79498e36d159370101
497	Horizon	17	8.69999999999999929	12.935013506429568	100.8828188644394	333/101 Moo 9 Nong Prue (Pattaya Sai1)	\N	\N	https://foursquare.com/item/519108c8498e6b6a97277925
498	Livv Pattaya	17	8.69999999999999929	12.90802291126627	100.91315594813645	Khao Talo (Soi 14)	\N	\N	https://foursquare.com/item/5741ae0a498e96f54084ec71
499	Hot Tuna Bar	17	8.69999999999999929	12.92555148688938	100.87154349893197	Walking Street	\N	\N	https://foursquare.com/item/51684216e4b0133161c4b8cb
500	Big Buddha Mountain	17	8.69999999999999929	12.914773343878066	100.86839545713184	Soi Wat Sarn Sen (Pratamnak Road)	\N	\N	https://foursquare.com/item/4fe75568e4b005c24e766b75
501	iBar by Club Insomnia	17	8.69999999999999929	12.925950401369876	100.87146079947773	Walking Street (Soi 16)	\N	\N	https://foursquare.com/item/4f5076efe4b07af68d9361d9
502	The Sky Gallery	17	8.69999999999999929	12.921584129333496	100.85944366455078	Kasetsin 9	\N	\N	https://foursquare.com/item/56488f61498e4d1cca6664e5
503	The Million Years Stone Park & Pattaya Crocodile Farm (อุทยานหินล้านปีและฟาร์มจระเข้พัทยา)	17	8.69999999999999929	12.958013669759463	100.94049453735352	22/1 Moo 1, Nongplalai (Sukhumvit)	\N	\N	https://foursquare.com/item/520e0d3c11d22911e7c55209
504	XZYTE Sport Club	17	8.69999999999999929	12.9456292360848	100.89713416201282	3/290, Moo6, Naklua	\N	\N	https://foursquare.com/item/5433dba7498ed90705fe6912
505	Bacco Beach	17	8.59999999999999964	12.848891994055206	100.90150748412341	Moo 2	\N	\N	https://foursquare.com/item/555f218c498edaa2d6a689df
506	Loaf	17	8.59999999999999964	12.933367580070692	100.89889890845916	Welcome Town (Pattaya Klang)	\N	\N	https://foursquare.com/item/55c0c2f8498edd1b8e95a3f5
507	Coffee Mania	17	8.59999999999999964	12.953057655398236	100.88882446289062	170/10 Pattaya-Na Kluea Rd. (at GardenLodge Hotel)	\N	\N	https://foursquare.com/item/4f0ffc7ee4b0aabf162b6f4f
508	Oasis Spa	17	8.59999999999999964	12.906174281969239	100.87019826340938	Banglamung Chonburi,322 Chateau Dale Hotel Thappa (btw Thappraya and Thepprasit)	\N	\N	https://foursquare.com/item/580eda3838fa410c36f46422
509	Welcome World Beach Resort & Spa	17	8.59999999999999964	12.900415256248369	100.86618472302673	439/8-9 M.12, Thup Phraya Rd.	\N	\N	https://foursquare.com/item/5264cb6b11d2901914786ffe
510	Greta Farm	17	8.59999999999999964	12.802486845313698	100.92713377413628	ประเทศไทย	\N	\N	https://foursquare.com/item/57aec5ae498e7850b2e5e8bd
511	Xiangshan Hiking Trail (象山登山步道)	18	9.40000000000000036	25.027864527104505	121.57052816687268	信義路五段150巷	\N	\N	https://foursquare.com/item/56fce0b7498ef7cb06e4b63c
512	Eslite Bookstore (誠品書店)	18	9.40000000000000036	25.03957128205317	121.56543731689453	松高路11號	\N	\N	https://foursquare.com/item/4fa2461ee4b08fa9e9026b06
513	Eslite Bookstore (誠品書店)	18	9.30000000000000071	25.039444915568602	121.54935479164125	敦化南路一段245號 (安和路)	\N	\N	https://foursquare.com/item/4c9e1429e9a7ef3bdedc3f16
514	蔣記家薌麵	18	9.30000000000000071	25.02641222146172	121.54713858592723	四維路208巷18-1號	\N	\N	https://foursquare.com/item/546025b1498e0b566b78242c
515	Din Tai Fung (鼎泰豐)	18	9.30000000000000071	25.033262519339715	121.56435370445251	市府路45號B1	\N	\N	https://foursquare.com/item/4fb322f1e4b0947c3d430def
516	鼎泰豐 Din Tai Fung	18	9.30000000000000071	25.03987862125413	121.56668225893463	信義區松高路19號B2	\N	\N	https://foursquare.com/item/55b9c6d3498ef9a0d28cf283
517	Din Tai Fung (鼎泰豐)	18	9.30000000000000071	25.033505543942546	121.530042886734	信義路二段194號 (永康街)	\N	\N	https://foursquare.com/item/4b6baab070c603bb2f8a91b4
518	Regent Taipei (臺北晶華酒店)	18	9.30000000000000071	25.054190033297452	121.52423322200775	中山北路二段41號	\N	\N	https://foursquare.com/item/4bc81b1870c603bb860398b4
519	象山頂 Top of Xiangshan	18	9.19999999999999929	25.027034991816713	121.57413985800696	信義快速道路	\N	\N	https://foursquare.com/item/55c4ea93498e2de3d6fd0c21
520	藍家割包	18	9.19999999999999929	25.01575515874314	121.53243682178392	羅斯福路三段316巷8弄3號	\N	\N	https://foursquare.com/item/5130c10ae4b0d576b6656c52
521	Daan Forest Park (大安森林公園)	18	9.19999999999999929	25.029792075492566	121.5359115600586	新生南路二段1號 (信義路)	\N	\N	https://foursquare.com/item/4c1ba9103855c9b6b35ecc71
522	SunnyHills (微熱山丘)	18	9.19999999999999929	25.057802278367383	121.55717283457496	民生東路五段36巷4弄1號	\N	\N	https://foursquare.com/item/5347ac0d498e92738c1d1b3a
523	三二行館 Villa 32	18	9.19999999999999929	25.137835670581666	121.51067898545278	中山路32號	\N	\N	https://foursquare.com/item/505a9243e4b009bdc3ff4d4d
524	Din Tai Fung (鼎泰豐)	18	9.09999999999999964	25.04107794933853	121.54316425323486	忠孝東路三段300號B2 (復興南路)	\N	\N	https://foursquare.com/item/4cb545f8e262b60c8b9c66e0
525	華山1914文創園區 Huashan1914	18	9.09999999999999964	25.04446416259353	121.5295040483177	1 Sec 1 Bādé Rd.	\N	\N	https://foursquare.com/item/4dbfd513fc60e867310686ec
526	一品山西刀削麵之家	18	9.09999999999999964	25.118840262026605	121.5282885422473	天母西路40巷	\N	\N	https://foursquare.com/item/4c78f01b2d3ba143287c8cd0
527	Taipei Fine Arts Museum (臺北市立美術館)	18	9.09999999999999964	25.07246682667902	121.52457503556722	中山北路三段181號	\N	\N	https://foursquare.com/item/5034dbc5e4b0cb2df78e38cf
528	Orange Shabu Shabu House (橘色涮涮屋)	18	9.09999999999999964	25.038579787677545	121.54603958129883	大安路一段135號	\N	\N	https://foursquare.com/item/4cd957acda85224b061451ca
529	陽明山 Yangmingshan	18	9.09999999999999964	25.116083428845233	121.53943391513532	士林, 臺北市 111	\N	\N	https://foursquare.com/item/526d3fc911d27d0e9c7c6506
530	華山藝文公園	18	9.09999999999999964	25.044189779396472	121.52959325926439	臺灣	\N	\N	https://foursquare.com/item/5842718c52a05123f983ae85
531	施家麻油腰花	18	9	25.037728656325058	121.57792891151529	松山路540巷538-2號	\N	\N	https://foursquare.com/item/4cf486b72eb25941df2bbda1
532	Dahu Park (大湖公園)	18	9	25.082820732910967	121.60269493995551	成功路五段	\N	\N	https://foursquare.com/item/51de95ba498e1c16f5098e36
533	八拾捌茶輪番所 Rinbansyo	18	9	25.040393982874697	121.50722928281539	中華路一段174號 (貴陽街二段)	\N	\N	https://foursquare.com/item/53ea0a3b498ee187be89e454
534	Ri Xing Type Foundry (日星鑄字行)	18	9	25.05219610317621	121.51647850481086	太原路97巷13號	\N	\N	https://foursquare.com/item/572953d2498e9802eff9877c
535	天瓏電腦書局	18	9	25.04301386745533	121.51319958180572	重慶南路一段107號 (沅陵街)	\N	\N	https://foursquare.com/item/4cbd31d3035d236a06c3e94e
536	一禾堂麵包本舖	18	9	25.040479636434622	121.55125830905418	敦化南路一段233巷34號	\N	\N	https://foursquare.com/item/54fbe56c498ea4ea7bec4f2e
537	北門鳳李冰	18	9	25.03935500087533	121.55354440212251	忠孝東路四段216巷33弄9號	\N	\N	https://foursquare.com/item/510f7520e4b0c180cfa412ac
538	Din Tai Fung (鼎泰豐)	18	9	25.105191314673615	121.5248371037991	中山北路六段77號B1	\N	\N	https://foursquare.com/item/4fb72c4fe4b093a90eb01288
539	野草居食屋 Fireweeds	18	9	25.024801436883745	121.5218149188636	同安街28巷1號	\N	\N	https://foursquare.com/item/5166d433e4b0ac12881583c1
540	太鼓判關東煮	18	9	25.07353408204067	121.60344160046334	金湖路377號	\N	\N	https://foursquare.com/item/54949feb498e3522a5d0f831
541	Stromovka	19	9.69999999999999929	50.10450286502869	14.422640471784245	Královská obora	\N	\N	https://foursquare.com/item/50a15d34e4b03f3cc3ba64ea
542	Havlíčkovy sady (Grébovka)	19	9.59999999999999964	50.0687645866736	14.443674087524414	Havlíčkovy sady	\N	\N	https://foursquare.com/item/5072d5e6498e62f9b61a6ebe
543	Naše maso	19	9.59999999999999964	50.09067219444903	14.426940555325606	Dlouhá 727/39	\N	\N	https://foursquare.com/item/531769bf11d2d3eb43a58d2e
544	VNITROBLOCK	19	9.59999999999999964	50.103098677895865	14.449360370635986	Dělnická 32 (Komunardů)	\N	\N	https://foursquare.com/item/588469235e78964248540e92
545	Vyšehrad	19	9.59999999999999964	50.06406151170566	14.419817819862093	V Pevnosti 159/5b	\N	\N	https://foursquare.com/item/4b6bcb8070c603bbae8b91b4
546	Riegrovy sady	19	9.59999999999999964	50.07986433030965	14.441485404968262	Riegrovy sady	\N	\N	https://foursquare.com/item/4f7c8134e4b02cdb83064a1d
547	Letenské sady	19	9.5	50.096468891315084	14.423551967416321	Letenské sady	\N	\N	https://foursquare.com/item/4fdef4ede4b044e8235d0664
548	Divoká Šárka	19	9.5	50.09530325188077	14.331115494169504	Divoká Šárka	\N	\N	https://foursquare.com/item/4ebe6e7793ad36d7a86c2ae6
549	Kampa	19	9.5	50.08349053618999	14.40812463002291	U Sovových mlýnů	\N	\N	https://foursquare.com/item/501d6eece4b0825080357518
550	Zoo Praha	19	9.5	50.11702837585993	14.408354759216309	U Trojského zámku 3/120	\N	\N	https://foursquare.com/item/50e70295e4b0092c6f11c6e9
551	Můj šálek kávy	19	9.5	50.09344081547644	14.45501384027034	Křižíkova 105 (Šaldova)	\N	\N	https://foursquare.com/item/522d92ee11d26a5c10fe4918
552	Pražský hrad | Prague Castle (Pražský hrad)	19	9.5	50.089803727290224	14.39899126067836	Pražský hrad	\N	\N	https://foursquare.com/item/50508ad4e4b02c1144d4aeac
553	Karlův most | Charles Bridge (Karlův most)	19	9.5	50.08647983883716	14.41144219015166	Karlův most	\N	\N	https://foursquare.com/item/51920030498e36e1d9c77040
554	Hemingway Bar	19	9.5	50.083968634580515	14.414260237995345	Karolíny Světlé 26	\N	\N	https://foursquare.com/item/4f91a995e4b047933dd302a9
555	Obora Hvězda	19	9.5	50.08203990937156	14.332866668701172	Obora Hvězda (Na Vypichu)	\N	\N	https://foursquare.com/item/51c62451498ef321163be41f
556	Angelato	19	9.5	50.08207073839282	14.404604048935031	Újezd 24 (Říční)	\N	\N	https://foursquare.com/item/5406fe79498e5840033c5588
557	Malešický park	19	9.5	50.084683518129665	14.498820304870605	Malešická	\N	\N	https://foursquare.com/item/5251911f498e9b7efc4b592a
558	Sansho	19	9.40000000000000036	50.09166491951128	14.43454890009289	Petrská 25	\N	\N	https://foursquare.com/item/5245fa3f498e6b94d59a9dac
559	Papelote	19	9.40000000000000036	50.07827733457252	14.41481351852417	Vojtěšská 9 (Šitkova)	\N	\N	https://foursquare.com/item/4e70b37b185061bd1ee8cb0d
560	Prokopské údolí	19	9.40000000000000036	50.039226209040564	14.361276626586914	Prokopské údolí	\N	\N	https://foursquare.com/item/529dd70611d20dcae65b2614
561	EMA espresso bar	19	9.40000000000000036	50.088734	14.43343	Na Florenci 1420/3	\N	\N	https://foursquare.com/item/5226f3d0498e04af98a1c59c
562	Wine Food Market	19	9.40000000000000036	50.06310043884741	14.4102063428292	Strakonická 1 (U Královské louky)	\N	\N	https://foursquare.com/item/4f5db808e4b070e048f6b68b
564	Místo	19	9.40000000000000036	50.09921413707221	14.404358158371824	Bubenečská 284/12 (Jaselská)	\N	\N	https://foursquare.com/item/55ac035c498ee719fc4b48dd
565	Petřínské sady | Petřín Gardens (Petřínské zahrady)	19	9.40000000000000036	50.083072586395	14.402604103088379	Újezd	\N	\N	https://foursquare.com/item/4fe0c609e4b0502602176017
566	Café Lounge	19	9.40000000000000036	50.080668942790155	14.40559941131665	Plaská 615/8	\N	\N	https://foursquare.com/item/4f327f6fe4b0d8fc0b4cfabc
567	DOX Centre for Contemporary Art (DOX Centrum současného umění)	19	9.40000000000000036	50.1070025690165	14.447414634086893	Poupětova 1	\N	\N	https://foursquare.com/item/4f94085be4b0d0d98967ab4a
568	Mozzarellart	19	9.40000000000000036	50.06556548275074	14.439652718674523	Bělehradská 11	\N	\N	https://foursquare.com/item/55c59c16498ecf2d7f50d7a6
569	Katedrála sv. Víta | Saint Vitus' Cathedral (Katedrála sv. Víta)	19	9.40000000000000036	50.09055191125546	14.400081676780724	III. nádvoří 48/2	\N	\N	https://foursquare.com/item/4f339532e4b0a3e7224663c7
570	Ladronka	19	9.40000000000000036	50.07900715258551	14.359726309776306	Tomanova (Podbělohorská)	\N	\N	https://foursquare.com/item/4e54e5c11850048f642e25d4
571	The Bund (外滩)	20	9.5	31.23931586181669	121.48606538772583	中山东一路 | Zhongshan Rd. East-1 (guangdong rd)	\N	\N	https://foursquare.com/item/4f641adce4b02ac2c4be087f
572	Pirates of the Caribbean Battle for the Sunken Treasure (加勒比海盗——沉落宝藏之战)	20	9.30000000000000071	31.14750397998809	121.65756697244102	Treasure Cove 宝藏湾 (Shanghai Disneyland上海迪士尼乐园)	\N	\N	https://foursquare.com/item/586fa2736ad5a10f30a6be6e
573	TRON Lightcycle Power Run – Presented by Chevrolet (创极速光轮－雪佛兰呈献)	20	9.30000000000000071	31.144310461020954	121.6527214769369	Tomorrowland 明日世界 (Shanghai Disneyland 上海迪士尼乐园)	\N	\N	https://foursquare.com/item/57650709498eb21b67e0a7f0
574	The Cannery	20	9.09999999999999964	31.220395688215458	121.42381853076044	1107 Yuyuan Road (Jiangsu Road)	\N	\N	https://foursquare.com/item/5780bdef498e153df125b73a
575	Mercato	20	9.09999999999999964	31.23634990188346	121.48644051661402	6/F, Three on the Bund, 3 Zhongshan Rd. East-1 (at Guangdong Rd.)	\N	\N	https://foursquare.com/item/518b6866498e37ef3930e9ad
576	West Bund Art Center	20	9.09999999999999964	31.169364907601302	121.45734872896483	2555 Longteng Avenue | 龙腾大道2555号 (Longlan Road | 龙兰路)	\N	\N	https://foursquare.com/item/583494b22e9fde4e362a589a
577	Din Tai Fung (鼎泰豐)	20	9.09999999999999964	31.221279536743932	121.47072315216064	兴业路123弄新天地广场南里6号楼2楼-11A单元 (马当路、黄陂南路间)	\N	\N	https://foursquare.com/item/4ca2e6afd7c33704bc649c62
578	Din Tai Fung (鼎泰豐)	20	9.09999999999999964	31.22887612990235	121.44636869430542	南京西路1376号上海商城A104室 (西康路口)	\N	\N	https://foursquare.com/item/4b0f8ce970c603bbe21b8fb4
579	La Parisienne	20	9	31.22695351130993	121.50539224516143	88 Zhangyang Road (Puming Road)	\N	\N	https://foursquare.com/item/5617bcd2498e1a3e7262be05
580	CHAR Bar	20	9	31.22822248797292	121.49558213187858	30/F, Hotel Indigo, 585 Zhongshan Rd. E-2 (at Dongmen Rd.)	\N	\N	https://foursquare.com/item/4e89d9517ee67a2b75f59edd
581	静安雕塑公园 Jing'an Sculpture Park	20	9	31.236194561575896	121.45887741599577	石门二路128号 | 128 Shimen Er Road (北京西路)	\N	\N	https://foursquare.com/item/4f8a7c5de4b057e2817363cf
582	The Union Trading Co.	20	9	31.21356096975006	121.44962129672314	64 Fenyang Road (Front Entrance on Middle Fuxing Rd.) (Fuxing)	\N	\N	https://foursquare.com/item/5406b045498e1f312ef48154
583	Shanghai Grand Theater (上海大剧院)	20	9	31.231029885841885	121.46726251773205	300 Renmin Blvd	\N	\N	https://foursquare.com/item/4f8c3c75e4b018320868b97a
584	The Commune Social	20	9	31.23776992420834	121.44637952676887	511 Jiangning Rd (Kanding Rd)	\N	\N	https://foursquare.com/item/518dfc74498e88aaffdc72dc
585	Bund Plaza, Nanjing East Road	20	9	31.239210664450134	121.47974140994484	233 Nanjing Dong Road (He'nan Zhong Road)	\N	\N	https://foursquare.com/item/56c409d6498eafa127f5f720
586	The Nest	20	8.90000000000000036	31.242816365977024	121.48314400244418	Beijing Lu 130 6f	\N	\N	https://foursquare.com/item/5513a5a2498ee5426bbd8d2e
587	Z&B Fitness	20	8.90000000000000036	31.216464964202796	121.43851743839353	14th Flr, 1219 Changle Lu (Wulumuqi Lu)	\N	\N	https://foursquare.com/item/57975cae498e39dc1da325ac
588	Fat Cow Burgers	20	8.90000000000000036	31.19288862863204	121.38143573214403	Hongmei lu (pedestrian st) (Yan an lu), Hongqiao, Shanghai, Shanghai Shi	\N	\N	https://foursquare.com/item/534e76ac498e87390a3e9622
589	Farine	20	8.90000000000000036	31.208274313509897	121.43460572468744	武康路378号1楼 | 1/F, 378 Wukang Rd. (近泰安路 | at Tai'An Rd.)	\N	\N	https://foursquare.com/item/518b5dd3498e8caf85e339b3
590	elEFANTE	20	8.90000000000000036	31.218174481131097	121.45034105774266	20 Donghu Rd. (at Huaihai Rd. Middle)	\N	\N	https://foursquare.com/item/5065b3e6e4b08f044ce0a41d
591	Café del Volcán	20	8.90000000000000036	31.212779349899577	121.45333722400933	80 Yongkang Lu (Xiangyang Nan Lu)	\N	\N	https://foursquare.com/item/50878f4de4b07d1b9b2b8c36
592	Lost Heaven Yunnan Restaurant (花马天堂云南餐厅)	20	8.90000000000000036	31.234435568338707	121.48638725280762	1-2/F, 17 Yan'an Rd. East (at Sichuan Rd. South)	\N	\N	https://foursquare.com/item/4ca3743fa73cb60cebf11878
593	Din Tai Fung (鼎泰豐)	20	8.90000000000000036	31.22541425949042	121.44500690828966	Jing An Kerry Centre (N4-15) (Nanjing West Road)	\N	\N	https://foursquare.com/item/55227a07498e1b2ca11b59bc
594	滨江大道 Pudong Riverside Promenade	20	8.90000000000000036	31.237745841571595	121.4921631747552	Riverside Promenade (along Huangpu River)	\N	\N	https://foursquare.com/item/5709f05e498e81eea6547a1e
595	Din Tai Fung (鼎泰豐)	20	8.90000000000000036	31.197147685648474	121.43328876990499	虹桥路1号港汇恒隆广场503室 (华山路口)	\N	\N	https://foursquare.com/item/5274866a11d2b7e99d884409
596	el Ocho	20	8.90000000000000036	31.230424	121.45534	99, Taixing Lu (Wujiang Lu)	\N	\N	https://foursquare.com/item/56999fca498eae563e2b034d
597	Din Tai Fung (鼎泰豐)	20	8.90000000000000036	31.217657511659624	121.45308057221573	淮海中路999号环贸广场L3-318&319室 (襄阳路、陕西路间)	\N	\N	https://foursquare.com/item/56bb78a0498e37164c6a7a52
598	Shanghai Disneyland (上海迪士尼乐园)	20	8.90000000000000036	31.147263409794128	121.65611743927002	Shanghai Disney Resort 上海迪士尼度假区, Pudong, Shanghai, Shanghai Shi	\N	\N	https://foursquare.com/item/5764ab15498eb21b67692de1
599	Ultraviolet by Paul Pairet	20	8.90000000000000036	31.242307801032148	121.46401008557626	195 Guangfu Rd (Meeting Point at Bund 18)	\N	\N	https://foursquare.com/item/50ad4c5de4b0f339d485a171
600	新大陆 Xindalu	20	8.80000000000000071	31.24730083581257	121.48869395256042	黄浦路199号上海外滩茂悦大酒店1楼大堂 (at Hyatt on the Bund)	\N	\N	https://foursquare.com/item/4fc6067ae4b01c7a8972def5
601	Encore Beach Club	21	9.59999999999999964	36.12940027183192	-115.16608357429504	3121 Las Vegas Blvd S	\N	\N	https://foursquare.com/item/50972390e4b0b538e6688448
602	Fountains of Bellagio	21	9.59999999999999964	36.11259120609958	-115.17322863208764	3600 Las Vegas Blvd S (at Bellagio Hotel & Casino)	\N	\N	https://foursquare.com/item/4d24fee42f77a090b9b10af1
603	Garden of the Gods Pool Oasis	21	9.5	36.116002201611956	-115.17718310229742	3570 Las Vegas Blvd S (Caesars Palace Hotel & Casino)	\N	\N	https://foursquare.com/item/4f0357c2e5faf2869f13b159
604	Red Rock Canyon National Conservation Area	21	9.5	36.14908210357755	-115.3746055408376	1000 Scenic Dr.	\N	\N	https://foursquare.com/item/4f3ea6d1e4b0ea210a006965
605	Bellagio Hotel & Casino	21	9.5	36.113152175794376	-115.175029282747	3600 Las Vegas Blvd S (at W Flamingo Rd)	\N	\N	https://foursquare.com/item/4bbc13da70c603bbe5ff96b4
606	Encore Las Vegas	21	9.5	36.129230417709756	-115.16478686072121	3121 Las Vegas Blvd S (at E Desert Inn Rd)	\N	\N	https://foursquare.com/item/4e457421922ee4def29242db
607	Joe's Seafood Prime Steak & Stone Crab	21	9.5	36.118914260633275	-115.17356157302856	3500 Las Vegas Blvd South	\N	\N	https://foursquare.com/item/4da3d2f2d686b60c416cd428
608	Total Wine & More	21	9.5	36.056609	-115.048332	501 N Stephanie Street (in Stephanie Street Power Center)	\N	\N	https://foursquare.com/item/4c951a2ef7cfa1cd9f53ba15
609	Venetian Resort & Casino	21	9.5	36.12226049942403	-115.1704957923254	3355 Las Vegas Blvd S (at Sands Ave)	\N	\N	https://foursquare.com/item/4e4573a9922ee4def2924229
610	Wynn Las Vegas	21	9.40000000000000036	36.12692769707455	-115.16658755911467	3131 Las Vegas Blvd S (at Sands Ave)	\N	\N	https://foursquare.com/item/4e457431922ee4def29242ef
611	The Cosmopolitan of Las Vegas	21	9.40000000000000036	36.10959311502471	-115.17418975235752	3708 Las Vegas Blvd S (at W Harmon Ave)	\N	\N	https://foursquare.com/item/4e4572a5922ee4def292404d
612	House Of Blues	21	9.40000000000000036	36.09297920159505	-115.17581462860106	3950 Las Vegas Blvd S (Mandalay Bay Hotel & Casino)	\N	\N	https://foursquare.com/item/4edfbf23f5b93f54c47a4910
613	Moorea Beach Club	21	9.40000000000000036	36.090098174010194	-115.17519718855895	3950 Las Vegas Blvd S (Mandalay Bay)	\N	\N	https://foursquare.com/item/4f4da5f44fc612cedf340710
614	O Theatre	21	9.40000000000000036	36.11388782183642	-115.17707888555839	3600 Las Vegas Blvd S (at the Bellagio)	\N	\N	https://foursquare.com/item/4da89933432d8e307529a940
615	The Beatles LOVE (Cirque Du Soleil)	21	9.40000000000000036	36.12037025336111	-115.17452716827393	The Mirage (3400 South Las Vegas Blvd.)	\N	\N	https://foursquare.com/item/4da89868432d8e307529a4ba
616	Raku	21	9.40000000000000036	36.12695507354479	-115.20994019848972	5030 Spring Mountain Rd #2	\N	\N	https://foursquare.com/item/4f8d9685e4b013a984502277
617	Sunrise Coffee	21	9.40000000000000036	36.071870310496344	-115.10702669620514	3130 E Sunset Rd Ste A (btwn McLeod Dr & Pecos Rd)	\N	\N	https://foursquare.com/item/4cdd8b5bc4f6a35d7d1bc46c
618	Rain Nightclub	21	9.40000000000000036	36.11467894242752	-115.19347523157882	4321 W Flamingo Rd (at Palms Casino Resort)	\N	\N	https://foursquare.com/item/4f58e44ee4b017e9a1c0ec08
619	Original Sunrise Cafe	21	9.40000000000000036	36.02637838543012	-115.11926230457902	8975 S Eastern Ave (Pebble)	\N	\N	https://foursquare.com/item/4c8d1f338018a1cda2a6f2d2
620	ARIA Resort & Casino	21	9.30000000000000071	36.10749081507173	-115.17606566548119	3730 Las Vegas Blvd S (at Harmon Ave)	\N	\N	https://foursquare.com/item/4e455a8c922ee4def2922a98
621	Mastro's Ocean Club	21	9.30000000000000071	36.10764673746366	-115.17438769340515	3720 Las Vegas Blvd S (City Center)	\N	\N	https://foursquare.com/item/5033fc6de4b082303da7bf6a
622	I Love Sushi	21	9.30000000000000071	35.991636106047665	-115.1028960943222	11041 S Eastern Ave	\N	\N	https://foursquare.com/item/4fdd5f6ee4b090d3f60aa919
623	Lotus of Siam	21	9.30000000000000071	36.14350652358316	-115.14289974737514	953 E Sahara Ave Ste A5 (btwn Market & State St.)	\N	\N	https://foursquare.com/item/4b60c3f870c603bbb2f590b4
624	Spa & Salon at Encore	21	9.30000000000000071	36.12920321212683	-115.16525585388672	3121 Las Vegas Blvd S (Inside Encore, Spa Level)	\N	\N	https://foursquare.com/item/4cbf068c0d22ef3b9a6d2c70
625	Comedy Pet Theater	21	9.30000000000000071	36.11084567021754	-115.16965046002103	3663 Las Vegas Blvd S Ste 360	\N	\N	https://foursquare.com/item/560ff21e498e31be8b50278e
626	The Palazzo Resort Hotel & Casino	21	9.30000000000000071	36.12438065931935	-115.16913515361135	3325 Las Vegas Blvd S (at Sands Ave)	\N	\N	https://foursquare.com/item/4e45740c922ee4def29242d0
627	IKEA	21	9.30000000000000071	36.06863480116738	-115.28130733194023	6500 IKEA Way (W Sunset Rd)	\N	\N	https://foursquare.com/item/576c2da0498e852cf495a150
628	Downtown Summerlin	21	9.30000000000000071	36.1500158364264	-115.33334766645066	1980 Festival Plaza Dr	\N	\N	https://foursquare.com/item/54a9ccaf498ec01260edcb73
629	Michael Jackson ONE Theater	21	9.30000000000000071	36.092892771634986	-115.176575170838	3950 Las Vegas Blvd S	\N	\N	https://foursquare.com/item/51ef1140498eeccee7575ce0
630	Qua Baths & Spa	21	9.30000000000000071	36.1153088291053	-115.17615795135498	3570 Las Vegas Blvd S (in Caesar's Palace)	\N	\N	https://foursquare.com/item/4f035829be7bbcd4f6e5569c
631	The Wynwood Walls	22	9.69999999999999929	25.80114403241427	-80.19943036689367	167 NW 25th St (off NW 2nd Ave)	\N	\N	https://foursquare.com/item/512fc33fe4b005337087e2e5
632	Wynwood Art Walk	22	9.59999999999999964	25.799147151342524	-80.19909258834711	NW 2nd Ave (btwn NW 20th & NW 36th St)	\N	\N	https://foursquare.com/item/4d28fd96c406721e4af976b6
633	Wynwood Arts District	22	9.59999999999999964	25.80085299612466	-80.19905990002967	Miami, FL 33127	\N	\N	https://foursquare.com/item/52a3841511d21860c5fde0c0
634	Adrienne Arsht Center for the Performing Arts	22	9.59999999999999964	25.78718841502643	-80.18998146057129	1300 Biscayne Blvd (NE 13th St.)	\N	\N	https://foursquare.com/item/4e4ef9ac6365e1419d027241
635	Vizcaya Museum and Gardens	22	9.5	25.745232207188238	-80.21119185269913	3251 S Miami Ave	\N	\N	https://foursquare.com/item/4bbf62c470c603bb8b4497b4
636	specialTEA Lounge & Cafe	22	9.5	25.746095549705398	-80.36905109882355	10766 SW 24th St (108th Ave and Coral Way)	\N	\N	https://foursquare.com/item/4ba940d970c603bb897795b4
637	ChillN Nitrogen Ice Cream	22	9.5	25.65601841328912	-80.32719401454413	8271 SW 124th St	\N	\N	https://foursquare.com/item/5133d98ae4b01507f6fe530c
638	Lagniappe House	22	9.40000000000000036	25.809149703389966	-80.1910508846805	3425 NE 2nd Ave	\N	\N	https://foursquare.com/item/51cb3748498ee221240b0ea9
639	Mandolin Aegean Bistro	22	9.40000000000000036	25.815916	-80.19169270992279	4312 NE 2nd Ave	\N	\N	https://foursquare.com/item/50854c9fe4b0a0ddb49e1c60
640	Bayfront Park	22	9.40000000000000036	25.77554704201281	-80.18633365631104	301 Biscayne Blvd	\N	\N	https://foursquare.com/item/515843a0e4b09dec1335f6e9
641	Mandarin Oriental, Miami	22	9.40000000000000036	25.765150958447286	-80.18532514572144	500 Brickell Key Dr	\N	\N	https://foursquare.com/item/523458a911d20a4072722cd4
642	Saks Fifth Avenue	22	9.40000000000000036	25.68970021856466	-80.31485559603477	7687 N Kendall Dr (at Dadeland Mall)	\N	\N	https://foursquare.com/item/4dee688b1520454e63d5058d
643	Whole Foods Market	22	9.40000000000000036	25.77171799583215	-80.18935091530659	299 Se 3rd Ave (SE 3 Ave)	\N	\N	https://foursquare.com/item/55ae2eef498e923ff5ac856a
644	Zuma	22	9.40000000000000036	25.769636252435024	-80.1894326453783	270 Biscayne Boulevard Way	\N	\N	https://foursquare.com/item/50f6d340e4b023d2f49f29b4
645	Wood Tavern	22	9.40000000000000036	25.801305254984253	-80.19885832179511	2531 NW 2nd Ave (NW 26 St.)	\N	\N	https://foursquare.com/item/4ed844d60e61d46ad571ed89
646	The River Oyster Bar	22	9.40000000000000036	25.76742633389278	-80.19335014834977	650 S Miami Ave (SW 7th St)	\N	\N	https://foursquare.com/item/4ede2fa361af8a14bac192cc
647	Key Biscayne Bridge - Run Bound	22	9.40000000000000036	25.74619646813005	-80.19566569486709	Florida	\N	\N	https://foursquare.com/item/50f6b1d4e4b0da51ce49a43f
648	Crandon Park	22	9.40000000000000036	25.686376485908006	-80.1617979762035	Key Biscayne	\N	\N	https://foursquare.com/item/54dac8ae498e7ec45d1ea354
649	American Airlines Arena	22	9.40000000000000036	25.781379577827348	-80.18907303247737	601 Biscayne Blvd	\N	\N	https://foursquare.com/item/51b0d171498e657aa4de60ef
650	Trader Joe's	22	9.40000000000000036	25.683438544707	-80.31357765197754	9205 S Dixie Hwy (Datran Dr)	\N	\N	https://foursquare.com/item/52628d9a11d2e304273b52fd
651	Sugarcane Raw Bar Grill	22	9.40000000000000036	25.807082373331536	-80.19310891628265	3252 NE 1st Ave	\N	\N	https://foursquare.com/item/4ce985b375c62c0f0e8de757
652	Finka Table & Tap	22	9.40000000000000036	25.742661508050162	-80.43168230481754	14690 SW 26th St	\N	\N	https://foursquare.com/item/53b60a2a498e9b093f1e63de
653	Kennedy Park	22	9.40000000000000036	25.734099194642397	-80.2312572606535	S. Bayshore Dr. (at Kirk St.)	\N	\N	https://foursquare.com/item/4cea971ad27560fcc1369a3a
654	Il Gabbiano	22	9.40000000000000036	25.771754467265758	-80.1851335374026	335 S Biscayne Blvd	\N	\N	https://foursquare.com/item/51770f29e4b0d7121cc8e795
655	The Melting Pot	22	9.40000000000000036	25.70054	-80.37951	11520 Sunset Dr	\N	\N	https://foursquare.com/item/53f3861a498e7f380044ce24
656	Panther Coffee	22	9.30000000000000071	25.799926	-80.199245	2390 NW 2nd Ave	\N	\N	https://foursquare.com/item/526e8d33498e8c34565c3c36
657	NIU Kitchen	22	9.30000000000000071	25.77590799220654	-80.19037525988163	134 NE 2nd Ave (NE 2nd Street)	\N	\N	https://foursquare.com/item/53fe3006498eedd5b6f7dd9b
658	Publix	22	9.30000000000000071	25.841832473977455	-80.36827638846455	7550 NW 104th Ave	\N	\N	https://foursquare.com/item/5707bd53498ef5166fe3cc69
659	Versailles Restaurant	22	9.30000000000000071	25.76501598452117	-80.25288054940789	3555 SW 8th St (SW 36th Ave)	\N	\N	https://foursquare.com/item/4d2fd0b10558594168885b37
660	O Cinema Wynwood	22	9.30000000000000071	25.803728785762228	-80.19689699517919	90 NW 29th St (at NW 1st Ave)	\N	\N	https://foursquare.com/item/4eaaf5557beb32cb142d8087
661	Parc de la Ciutadella	23	9.59999999999999964	41.38866109453803	2.1859340722624534	Parc de la Ciutadella	\N	\N	https://foursquare.com/item/518a65bf498ed2c9b1e9d6a7
662	Muntanya de Montjuïc	23	9.59999999999999964	41.36263780816235	2.158384323120117	Montjuïc	\N	\N	https://foursquare.com/item/5151bbf3e4b06114b138b2e4
663	Strip Club Barcelona	23	9.5	41.36183658508655	2.1414488554000854	Carrer del Gaia 5 (4-3)	\N	\N	https://foursquare.com/item/57b8aea0cd10c2b6b9762818
664	Spice Café	23	9.5	41.373973615934105	2.163748622339496	C. Margarit, 13	\N	\N	https://foursquare.com/item/53e35725498e6a2c73eeffd5
665	NAPA Restaurant	23	9.5	41.39269380513361	2.1535689558401088	Aribau 151	\N	\N	https://foursquare.com/item/54cd5ad1498e9b579564ce3a
666	Barri Gòtic	23	9.5	41.38366049614543	2.1772899008766218	08002 Barcelona Cataluña	\N	\N	https://foursquare.com/item/4d03361b0e49721e52ae697f
667	Casa Batlló	23	9.5	41.391802498442054	2.1651064051653224	Pg. de Gràcia, 43 (C. d'Aragó)	\N	\N	https://foursquare.com/item/519b97a0498eb49cb2e6f315
668	Palau de la Música Catalana	23	9.5	41.3875955955081	2.17529833316803	C. Palau de la Música, 4-6 (Sant Pere més Alt)	\N	\N	https://foursquare.com/item/51938911498e7c9872f99c48
669	Baluard Barceloneta	23	9.5	41.380089643723295	2.1890686540551565	C. del Baluard, 38-40 (C. d'Escuder)	\N	\N	https://foursquare.com/item/50a7859ce4b0a916aad4700b
670	Casa Lolea	23	9.5	41.38889645618769	2.1771411262189964	C. de Sant Pere Més Alt, 49	\N	\N	https://foursquare.com/item/57051c6c498e7ad05a5c5738
671	Granja Elena	23	9.5	41.362615	2.137123	Pg. Zona Franca, 228	\N	\N	https://foursquare.com/item/56a21bb038fa901e4275552a
672	Canons del Carmel	23	9.40000000000000036	41.419357	2.161688	C. Marià Lavèrnia	\N	\N	https://foursquare.com/item/50b229fbe4b09dc7a678a0a5
673	Usagui	23	9.40000000000000036	41.40208281933464	2.146282196044922	C. Santjoanistes, 28 (Balmes)	\N	\N	https://foursquare.com/item/50df13c3e4b0c73e69f9eb81
674	Sant Pau Recinte Modernista	23	9.40000000000000036	41.41131643837895	2.174271311276456	Sant Antoni Maria Claret, 167 (Cartagena)	\N	\N	https://foursquare.com/item/5314c689498e8dc134ba7d5e
675	Fabra i Coats	23	9.40000000000000036	41.433104	2.191091	C. de Sant Adrià, 20	\N	\N	https://foursquare.com/item/507334c3e4b009deeeecae8d
676	La Central	23	9.40000000000000036	41.39214372944576	2.1598434259948425	C. de Mallorca, 237 (C. de Balmes)	\N	\N	https://foursquare.com/item/4f674d85e4b04103a038ad35
677	Arc de Triomf (Arco del Triunfo)	23	9.40000000000000036	41.39107213594376	2.180452678427143	Passeig de Lluís Companys (Passeig de Sant Joan)	\N	\N	https://foursquare.com/item/51545106e4b0af7ddc33e74e
678	La Alcoba Azul	23	9.40000000000000036	41.38279951	2.17551921	C. San Domenec del Call, 14	\N	\N	https://foursquare.com/item/4cdbd2ff9dd55941adfddb2e
679	Vila Viniteca	23	9.40000000000000036	41.38262895405061	2.181687355041504	Carrer dels Agullers, 7	\N	\N	https://foursquare.com/item/50e74df8e4b0cacd9c06e068
680	Camp Nou	23	9.40000000000000036	41.380540778431055	2.122828085491728	C. Arístides Maillol, 12 (Av. Joan XIII)	\N	\N	https://foursquare.com/item/4c762edd8d70b71354d3ddad
681	La Flauta	23	9.40000000000000036	41.3870429468818	2.1610139898056278	C. Aribau, 23 (C. del Consell de Cent)	\N	\N	https://foursquare.com/item/4d0fc1a8a3d9721ee7e7d0fd
682	Lo Pinyol	23	9.40000000000000036	41.3986201307056	2.1611195339416347	C. Torrent de L'Olla, 7 (Còrsega)	\N	\N	https://foursquare.com/item/534eee7911d22c65ce9d1675
683	Plaça de la Vila de Gràcia	23	9.40000000000000036	41.40024556705286	2.1576127227630146	Plaça de la Vila de Gràcia	\N	\N	https://foursquare.com/item/4e50ee09b61cf637a5098919
684	Tickets	23	9.40000000000000036	41.37521680088662	2.1564950141575445	Av. Paral·lel, 164	\N	\N	https://foursquare.com/item/50b374aae4b0f4fa8ac9bef2
685	Copasetic	23	9.30000000000000071	41.380157566475546	2.153148651123047	C. Diputació, 55	\N	\N	https://foursquare.com/item/55056144498e913aa7b0139b
686	Can Dendê	23	9.30000000000000071	41.39830186585012	2.1986801701030454	Ciutat de Granada, 44	\N	\N	https://foursquare.com/item/55bcd1b9498e642626b0a73b
687	Museu Nacional d'Art de Catalunya (MNAC)	23	9.30000000000000071	41.368532	2.153567	Parc de Montjuïc, s/n (Mirador del Palau Nacional)	\N	\N	https://foursquare.com/item/50a4f88de4b0d699caaade89
688	El Petit Bangkok	23	9.30000000000000071	41.40377910602387	2.1482018128742735	Vallirana, 29	\N	\N	https://foursquare.com/item/50113a15e4b0befd11e3884a
689	Plaça Reial (Plaza Real)	23	9.30000000000000071	41.38010926480547	2.1752822399139404	Plaça Reial	\N	\N	https://foursquare.com/item/5162df1ce4b085a8d8453073
690	Parking Pizza	23	9.30000000000000071	41.393584039504034	2.1513891220092773	C. Londres, 98	\N	\N	https://foursquare.com/item/56bdd71f498eafa1226f60df
691	Palace Theatre	24	9.19999999999999929	42.991152521062794	-71.46120697259902	80 Hanover St (btw Elm St & Chestnut St)	\N	\N	https://foursquare.com/item/4bb5ea3d70c603bbad7f96b4
692	Red Arrow Diner	24	9.19999999999999929	42.993532189429864	-71.46139114926736	61 Lowell St (at Kosiuszko St.)	\N	\N	https://foursquare.com/item/4c07c283b0a2e0def37f9dba
693	The Gyro Spot	24	9.09999999999999964	42.99329027496727	-71.46308396459213	1073 Elm St	\N	\N	https://foursquare.com/item/5032b1b5e4b0df902ffdf514
694	Barnes & Noble	24	9.09999999999999964	42.95067447848119	-71.43589496612549	1741 S Willow St	\N	\N	https://foursquare.com/item/4edfee47f9ab28df818f8873
695	Bagel Café	24	9.09999999999999964	42.990651861164764	-71.4504746159776	373 Hanover St (at Lincoln St.)	\N	\N	https://foursquare.com/item/4cb604507abcbfb7a345a61f
696	Mr. Mac's Macaroni & Cheese	24	9	43.0140275	-71.451537	497 Hooksett Rd	\N	\N	https://foursquare.com/item/4d1b73a102a66dcb6e1a6965
697	Purple Finch Cafe	24	9	42.95334439645473	-71.47911071777344	124 S River Rd	\N	\N	https://foursquare.com/item/4e623ce77d8b8540898de520
698	Puritan Backroom	24	9	43.01053583621979	-71.453962	245 Hooksett Rd	\N	\N	https://foursquare.com/item/4be6ed0d70c603bb10d79ab4
699	900 Degrees Neapolitan Pizzeria	24	9	42.99689481000902	-71.46533489227295	50 Dow St (at Canal St)	\N	\N	https://foursquare.com/item/4e7530f22271ffa4e6d50c1b
700	Hanover Street Chophouse	24	8.90000000000000036	42.99068775841471	-71.4596229602711	149 Hanover St (Chestnut St.)	\N	\N	https://foursquare.com/item/572dd3b1498e1aa2156c44bf
701	The Bakeshop on Kelley Street	24	8.90000000000000036	42.99528633496895	-71.47948414419278	171 Kelley St (in the Rimmon Heights Neighborhood)	\N	\N	https://foursquare.com/item/51919605498e450a32c666ac
702	Tucker's NH	24	8.90000000000000036	43.055869	-71.441241	New Hampshire	\N	\N	https://foursquare.com/item/54b28068498e9fcf5b9041f3
703	Massabesic Lake	24	8.80000000000000071	43.003432312333175	-71.39005374360151	Massabesic Lake	\N	\N	https://foursquare.com/item/4fc0d0dbe4b0c1dd099f6307
704	Texas Roadhouse	24	8.80000000000000071	42.95391025	-71.43801919	1525 S Willow St	\N	\N	https://foursquare.com/item/529ddd3611d22c43ba397073
705	Currier Museum of Art	24	8.69999999999999929	42.99794997161686	-71.45567493936039	150 Ash St	\N	\N	https://foursquare.com/item/4bc46c9170c603bb3ab297b4
706	The Bridge Cafe on Elm	24	8.69999999999999929	42.994181316590165	-71.46330426188396	1117 Elm St (corner of Bridge St)	\N	\N	https://foursquare.com/item/4eea34ba0e01a148bde0e73e
707	Republic Café & Bistro	24	8.69999999999999929	42.993322089668695	-71.4629158428828	1069 Elm St (Spring St)	\N	\N	https://foursquare.com/item/4fd65fd6e4b0dde4975c431a
708	Cafe la Reine	24	8.69999999999999929	42.991268	-71.463009	915 Elm St	\N	\N	https://foursquare.com/item/51f92b28498e9281d90ff364
709	Bagel Cafe	24	8.69999999999999929	42.964284143564356	-71.48037108877412	S River Rd	\N	\N	https://foursquare.com/item/57a1db4e498ead64f8709eaa
710	Whole Foods Market	24	8.69999999999999929	42.95460509793392	-71.4767305438959	Bedford, NH	\N	\N	https://foursquare.com/item/5861fbbc01f433018d8a8734
711	Double Midnight Comics	24	8.69999999999999929	42.981732592869896	-71.45208477973938	245 Maple St #11 (Valley St)	\N	\N	https://foursquare.com/item/4ea5f49fbe7bbf593af8b83a
712	Derryfield Park	24	8.59999999999999964	42.99902914891922	-71.44044399261475	Manchester, NH 03104	\N	\N	https://foursquare.com/item/4e11136ce4cdef074b70fc2f
713	New England's Tap House Grille	24	8.59999999999999964	43.05122430570222	-71.43874027472961	1292 Hooksett Rd	\N	\N	https://foursquare.com/item/51706708498e787e487c5111
714	Panera Bread	24	8.59999999999999964	42.96387421263297	-71.48246380539933	7 Colby Ct	\N	\N	https://foursquare.com/item/4e3804c6d164374eb68c3824
715	Hannaford	24	8.59999999999999964	42.95760239634388	-71.48065514245043	Kilton Rd	\N	\N	https://foursquare.com/item/5779de1b498e1acf792a353f
716	Livingston Park	24	8.59999999999999964	43.012580817304446	-71.45471836383005	Hooksett Rd (btw Webster St & Red Coat Ln)	\N	\N	https://foursquare.com/item/51f6f27c498eeac8866a9ab2
717	Verizon Wireless Arena	24	8.59999999999999964	42.986708598166466	-71.46232008934021	555 Elm St (at Lake Ave)	\N	\N	https://foursquare.com/item/4bcc6c8370c603bb8b6c98b4
718	Nadeau's Subs Salads and Wraps	24	8.59999999999999964	42.96237965	-71.444349	100 Cahill Ave	\N	\N	https://foursquare.com/item/520e88b211d22aa0636cc56b
719	Livingston Park Trail around Dorrs Pond	24	8.59999999999999964	43.012927735566066	-71.45474735100505	Manchester, NH	\N	\N	https://foursquare.com/item/5299f75d11d208de58930b6e
720	Chipotle Mexican Grill	24	8.59999999999999964	42.96312961490516	-71.44181303963575	928 S Willow St	\N	\N	https://foursquare.com/item/4e165f401f6eb653a5e69998
721	Great Wall at Mutianyu (慕田峪长城)	25	9.30000000000000071	40.43149763551818	116.55841827392578	Mutianyu Rd (At Huairou)	\N	\N	https://foursquare.com/item/51beddda498edfddfe7d9673
722	The Opposite House (瑜舍)	25	9.30000000000000071	39.93612353995134	116.44861936569214	Bldg 1, 11 Sanlitun Rd (At Gongti N Rd)	\N	\N	https://foursquare.com/item/54e1706f498edbef2d71154e
723	Jingshan Park (景山公园)	25	9.19999999999999929	39.92353591625474	116.39057636260986	44 Jingshan W St (North of Forbidden City)	\N	\N	https://foursquare.com/item/4bd115de70c603bb44dd98b4
724	Summer Palace (颐和园)	25	9.19999999999999929	39.9970493055294	116.27247972056173	Beiqing Rd	\N	\N	https://foursquare.com/item/4c090cefcd09d13a6703d309
725	Temple of Heaven (天坛)	25	9.19999999999999929	39.88181567751363	116.40666961669922	Tiantan N Rd (Tiantan East Rd)	\N	\N	https://foursquare.com/item/535f770011d227f2164e36a8
726	Great Leap Brewing 大跃啤酒	25	9.09999999999999964	39.935959886381966	116.3930347099839	6 Doujiao Hutong (#6, The Original)	\N	\N	https://foursquare.com/item/5356359a498e72e165c2d000
727	鼎泰丰 Din Tai Fung	25	9.09999999999999964	39.909209536859834	116.47376775741577	87 Jianguo Rd (At 6/F of Shin Kong Place)	\N	\N	https://foursquare.com/item/4ba2d1b170c603bb2fe894b4
728	什刹海公园 Shichahai Park	25	9.09999999999999964	39.93244621864724	116.3857913017273	West bank of Qianhai (At Di'anmen W Ave)	\N	\N	https://foursquare.com/item/5289352f11d2d4b09eecaa63
729	Temple Restaurant Beijing	25	9.09999999999999964	39.92650216435024	116.39719049683467	23 Shatan N St (at Wusi St)	\N	\N	https://foursquare.com/item/51ef1213498ef4a369ff09c2
730	Yonghegong Lama Temple (雍和宫)	25	9.09999999999999964	39.945910354882905	116.41088505680857	Yonghegong Ave (At North 2nd Ring E Rd)	\N	\N	https://foursquare.com/item/4ee8f625722e12349516ee26
731	Haidilao Hot Pot (海底捞火锅)	25	9.09999999999999964	39.98836621022325	116.47778034210205	9 Wangjing St. (At 4/F of Wangjing Int'l Shopping Center)	\N	\N	https://foursquare.com/item/50d6459ee4b0db4f33e7b993
732	Great Wall at Juyongguan (居庸关长城)	25	9.09999999999999964	40.28851862020052	116.06750386374195	昌平区南口镇居庸关村	\N	\N	https://foursquare.com/item/4d14192225cda143274b5ed6
733	鼎泰丰 Din Tai Fung	25	9	39.94517139916442	116.43857722758933	24 Xinyuanxili M St (At NW of Yu Yang Hotel)	\N	\N	https://foursquare.com/item/55744376498ee88619a3184e
734	Forbidden City (Palace Museum) (故宫（博物院）)	25	9	39.91394967016644	116.39098405838014	4 Jingshan Front St	\N	\N	https://foursquare.com/item/52e344d0498e7b69ab148031
735	鼎泰丰 Din Tai Fung	25	8.90000000000000036	39.917842534883675	116.4429454350577	9 Dongdaqiao Rd (At LG2/F of Parkview Green)	\N	\N	https://foursquare.com/item/51f7abfa498e93fbe263602d
736	Din Tai Fung (鼎泰豐)	25	8.90000000000000036	39.913620638805675	116.40589378113212	138 Wangfujing Ave (At 6/F of apm Mall)	\N	\N	https://foursquare.com/item/580073a9cd105d2833b78f59
737	Mao Mao Chong (毛毛虫)	25	8.90000000000000036	39.933511592687104	116.40096187591553	12 Banchang Hutong (at Jiaodaokou S St)	\N	\N	https://foursquare.com/item/539d64fd498e259a6b58a7da
738	东方大班 Oriental Taipan	25	8.90000000000000036	39.91782622632404	116.44807422934196	6 Chaoyangmen Outer Ave (At Bldg 25, Block 3 of 新城国际公寓)	\N	\N	https://foursquare.com/item/4cc705561e596dcbe828e267
739	小云南 Little Yunnan	25	8.90000000000000036	39.925535	116.4006	东皇城根北街28号 (近美术馆), 东城区	\N	\N	https://foursquare.com/item/4fdeb5d8e4b0d263e86a5973
740	Lily Nails	25	8.90000000000000036	39.93588876286217	116.44858133999325	三里屯街 (Sanlitun Rd.) (3.3服飾大廈)	\N	\N	https://foursquare.com/item/507a9fc7e4b03bba60fa6b89
741	Great Leap Brewing (大跃啤酒)	25	8.90000000000000036	39.93507252642042	116.43587443061269	12 Xinzhong St (#12, Xinzhong Brewpub)	\N	\N	https://foursquare.com/item/539d6172498eedc986b810bb
742	Zarah Café	25	8.90000000000000036	39.939454803861956	116.39999748503413	46 Gulou Dongdajie 鼓楼东大街46号 (Jiaodaokou)	\N	\N	https://foursquare.com/item/54f025cd498e68f7f6ba15d4
743	八达岭长城 Great Wall at Badaling	25	8.80000000000000071	40.35615947439847	116.00815773010254	216 Provincial Road, Yanqing	\N	\N	https://foursquare.com/item/4f531202e4b0c416052252ed
744	Pizza+	25	8.80000000000000071	39.93726606738963	116.4328546377795	东至门外十字坡街8号铂晶豪庭1层112/115室 (112/115 Bo Jing Hao Ting, 8 Shizipo Street)	\N	\N	https://foursquare.com/item/51061f45e4b09faec6fcad7d
745	Modernista	25	8.80000000000000071	39.943126624462764	116.39349006327237	44 Baochao Hutong (Fengsiting Hutong)	\N	\N	https://foursquare.com/item/53563253498e743272b7db3c
746	馅老满酒家 • Xian'r Lao Man	25	8.80000000000000071	39.94167512487345	116.402291467135	252 Andingmen Inner St (Jiaodaokou E Rd)	\N	\N	https://foursquare.com/item/4ccd474f09b1b7138b07dca6
747	北海公园 Beihai Park	25	8.80000000000000071	39.92612767506002	116.38257265090942	1 Wenjin St	\N	\N	https://foursquare.com/item/4dfce54dd4c001cca36e0cdc
748	京A (Jing-A) Taproom	25	8.80000000000000071	39.93040810033189	116.4522117592351	1949 The Hidden City, Courtyard 4, Gongti Bei Lu, Chaoyang district (at 1949 The Hidden City)	\N	\N	https://foursquare.com/item/5468fdea498ee2db5200afaf
749	Slow Boat Brewery Taproom	25	8.80000000000000071	39.930800820752765	116.41406178474425	东四八条56号 56 Dongsi Batiao (Dongsi Bei Dajie)	\N	\N	https://foursquare.com/item/5144a499e4b075ebc89f86f0
750	嘉里健身俱乐部 Kerry Sports Center	25	8.80000000000000071	39.91268655927048	116.45316257403604	光华路1号嘉里中心大酒店内	\N	\N	https://foursquare.com/item/4e9d09755c5c1734ef62a7de
751	Santa Monica State Beach	26	9.59999999999999964	34.011907320047186	-118.49672018979797	1432 Palisades Beach Rd (at Colorado Ave.)	\N	\N	https://foursquare.com/item/5336454011d22c65ce8bf349
752	J Paul Getty Museum	26	9.59999999999999964	34.07760491989963	-118.47459381751833	1200 Getty Center Dr	\N	\N	https://foursquare.com/item/4cb5c0a5eec4199c43712a6b
753	Los Angeles County Museum of Art (LACMA)	26	9.59999999999999964	34.06334933057001	-118.35885576938075	5905 Wilshire Blvd (at Fairfax Ave.)	\N	\N	https://foursquare.com/item/53a064fd11d28fdc974a753d
754	Griffith Park	26	9.59999999999999964	34.13294317759108	-118.28438758850098	4730 Crystal Springs Dr (Crystal Springs Drive)	\N	\N	https://foursquare.com/item/51030e01e4b05ec850c0c051
755	Silver Lake Wine	26	9.59999999999999964	34.09996284231069	-118.2594484090805	2395 Glendale Blvd (Silver Lake Blvd)	\N	\N	https://foursquare.com/item/510091f9e4b017637bb0d33c
756	The Getty Center	26	9.59999999999999964	34.087680137838504	-118.4757752137908	1200 Getty Center Dr	\N	\N	https://foursquare.com/item/57b71426cd10cd81a4d507da
757	Amoeba Music	26	9.5	34.09775400505154	-118.32916083276535	6400 W Sunset Blvd (btwn Ivar & Cahuenga Blvd)	\N	\N	https://foursquare.com/item/4cd9892bb97060fca74af47b
758	Annenberg Space for Photography	26	9.5	34.05896101513455	-118.41379727524347	2000 Avenue of the Stars Ste 10 (at Olympic Blvd)	\N	\N	https://foursquare.com/item/50ef9acce4b0d7ed4ae8b509
759	Gjusta	26	9.5	33.995133217811755	-118.47452059799896	320 Sunset Ave	\N	\N	https://foursquare.com/item/5476a80c498e5483aff39fe1
760	Universal Studios Hollywood	26	9.5	34.1376475	-118.3551653	100 Universal City Plz (btwn Barham Blvd & Lankershim Blvd)	\N	\N	https://foursquare.com/item/4b60d5db70c603bb04f790b4
761	Los Angeles School of Gymnastics	26	9.5	34.02201999205596	-118.3794559484001	8450 Higuera St	\N	\N	https://foursquare.com/item/514ba2eae4b004f77b0e60b4
762	Bestia	26	9.5	34.033650501826834	-118.22923403303977	2121 E 7th Pl (at Santa Fe Ave)	\N	\N	https://foursquare.com/item/51dda433498e603ba31f9604
763	The Last Bookstore	26	9.5	34.04757889449746	-118.24979854211897	453 S Spring St (at 5th St)	\N	\N	https://foursquare.com/item/51dca531498ea9db8af3f6c7
764	Walt Disney Concert Hall	26	9.5	34.05549932951772	-118.24929602311812	111 S Grand Ave (btwn 1st & 2nd St)	\N	\N	https://foursquare.com/item/511badb6e4b0a101382d4ae5
765	Griffith Park Trail	26	9.5	34.111115473577826	-118.30727010723771	Griffith Park	\N	\N	https://foursquare.com/item/5116b509e4b046a902ea98f4
766	The Roxy	26	9.5	34.09074855448929	-118.38794066203201	9009 W Sunset Blvd (at Hammond St)	\N	\N	https://foursquare.com/item/4ccde44f09b1b7135077dca6
767	Temescal Canyon	26	9.5	34.049637076756156	-118.52943420410156	15601 W Sunset Blvd (Temescal canyon)	\N	\N	https://foursquare.com/item/4ee056396c2524fcdd4a70f9
768	Larchmont Village Wine & Cheese	26	9.5	34.07531591264147	-118.32375548495219	223 N Larchmont Blvd (Beverly Blvd)	\N	\N	https://foursquare.com/item/4fe68a14e4b01b7b6c18e8c7
769	Pantages Theatre	26	9.5	34.10165550422268	-118.32568476300347	6233 Hollywood Blvd (btwn Vine & Argyle Ave)	\N	\N	https://foursquare.com/item/4bcd34b470c603bb6a8098b4
770	The Broad Museum	26	9.5	34.054372472711286	-118.25023824503518	221 S Grand Ave (at 2nd Street)	\N	\N	https://foursquare.com/item/5617d16c498e14f52fb3a0dd
771	Natural History Museum of Los Angeles County	26	9.5	34.016828819509556	-118.28882932662964	900 Exposition Blvd (at Vermont Ave)	\N	\N	https://foursquare.com/item/50e6053be4b01db803365f74
772	Guisados	26	9.5	34.070245220997705	-118.25038100547948	1261 W Sunset Blvd	\N	\N	https://foursquare.com/item/50e4f0e4e4b02f236fd564b3
773	Mr. Speedy Plumbing & Rooter Inc.	26	9.5	34.042538	-118.233864	418 Molino St	\N	\N	https://foursquare.com/item/51dce92a498ed180853906ac
774	Hollywood Farmer's Market	26	9.5	34.09976876556957	-118.32865284015999	Ivar Ave (btwn Sunset & Hollywood)	\N	\N	https://foursquare.com/item/4c1b9a563b2ab713102e3325
775	Griffith Observatory	26	9.5	34.11902476980262	-118.30057389229705	2800 E Observatory Ave (at Griffith Park)	\N	\N	https://foursquare.com/item/4bb2c6de70c603bba64296b4
776	Mendocino Farms	26	9.5	33.97863435332267	-118.43798160552979	4724 Admiralty Way (btwn Mindanao Way & Fiji Way)	\N	\N	https://foursquare.com/item/4be9c80c70c603bb131c9bb4
777	Runyon Canyon Park	26	9.5	34.11017008909879	-118.35086345672607	N. Fuller Ave. (at Hillside Ave.)	\N	\N	https://foursquare.com/item/4c3e3c60d13aef3bbb879339
778	STAPLES Center	26	9.5	34.043084694520346	-118.26719093124382	1111 S Figueroa St (at Chick Hearn Ct)	\N	\N	https://foursquare.com/item/50c11139e4b0fe2a3acf99c0
779	Will Rogers State Historic Park	26	9.5	34.05430619740901	-118.5124685150894	1501 Will Rogers State Park Rd	\N	\N	https://foursquare.com/item/4d1cdbbec50e6ea8382cd6b8
780	Hermosa Beach - The Strand	26	9.5	33.86207328247521	-118.40060702168985	The Strand, Hermosa Beach, CA (Pier Avenue)	\N	\N	https://foursquare.com/item/54720168498e6339c831ad5a
781	Normafa	27	9.59999999999999964	47.50290714229824	18.966375417699577	Budapest	\N	\N	https://foursquare.com/item/4e1ab86fc65b6bfb5923f1f7
782	Margitsziget	27	9.59999999999999964	47.52423412212993	19.04627638793987	Budapest	\N	\N	https://foursquare.com/item/4c78c9a42dc1952120dca277
783	Bors Gasztrobár	27	9.5	47.49670127362633	19.06363061026055	Budapest	\N	\N	https://foursquare.com/item/505c4e86e4b017c6443894d9
784	Culinaris	27	9.5	47.53653649853766	19.041342437267303	Budapest	\N	\N	https://foursquare.com/item/564f3df0498e5a4ab657a391
785	Zeller Bistro	27	9.5	47.505186	19.070667	Budapest	\N	\N	https://foursquare.com/item/528734be11d2c9e89ff4041a
786	Müpa Budapest	27	9.5	47.469899147403815	19.071698733655246	Budapest	\N	\N	https://foursquare.com/item/4c267818136d20a1086de561
787	Espresso Embassy	27	9.5	47.50195306402895	19.049735069274902	Budapest	\N	\N	https://foursquare.com/item/510b9306e4b06de8280284fc
788	Halászbástya | Fisherman's Bastion (Halászbástya)	27	9.5	47.502366199939	19.034661054611206	Budapest	\N	\N	https://foursquare.com/item/4c951c55f7cfa1cdfc6aba15
789	Erzsébet-kilátó	27	9.5	47.51824134578612	18.95931399690885	Budapest	\N	\N	https://foursquare.com/item/509a6722e4b00d5fa6b89d14
790	Kerkyra Görög Ételbár	27	9.5	47.504717789500916	19.06592943526223	Budapest	\N	\N	https://foursquare.com/item/54631e1a498ec5da6668cefc
791	Katona József Színház	27	9.5	47.49391294359005	19.054733777170863	Budapest	\N	\N	https://foursquare.com/item/506f2cdde4b0a368e7b56743
792	Gellért-hegy	27	9.40000000000000036	47.48680517596828	19.047111358934348	Budapest	\N	\N	https://foursquare.com/item/4f637681e4b075c7123e2091
793	La Delizia	27	9.40000000000000036	47.50701036145155	19.059401494783117	Budapest	\N	\N	https://foursquare.com/item/4f6b3600e4b082bd4b54b626
794	Gelarto Rosa	27	9.40000000000000036	47.50022800527574	19.05312269926071	Budapest	\N	\N	https://foursquare.com/item/500d68a7e4b02b2a80323cda
795	Római part	27	9.40000000000000036	47.57270405541254	19.064884185791016	Budapest	\N	\N	https://foursquare.com/item/4df38a0718386ecb4e30aea7
796	Spider Club	27	9.40000000000000036	47.53542665391707	19.041860584733307	Budapest	\N	\N	https://foursquare.com/item/51d07496498e7eb24b746a2a
797	Mad Dog Cafe Haus	27	9.40000000000000036	47.53523357247859	19.060003667885503	Budapest	\N	\N	https://foursquare.com/item/52ea6f1611d29dd261d393e3
798	Buddies Burger	27	9.40000000000000036	47.49032290409974	19.060845122312458	Budapest	\N	\N	https://foursquare.com/item/57a98c5c498e62d8c455515a
799	Kopaszi-gát	27	9.40000000000000036	47.46624078419933	19.063344642297427	Budapest	\N	\N	https://foursquare.com/item/4dfccc1a18a8eee4fe3dc88e
800	A38 Hajó	27	9.40000000000000036	47.47662960110782	19.06276524066925	Budapest	\N	\N	https://foursquare.com/item/5073fd77e4b06ca75bfef51d
801	Szimpla Kert	27	9.40000000000000036	47.4968925081949	19.062914031379552	Budapest	\N	\N	https://foursquare.com/item/4e14644431515b10e2c50d4b
802	Budavári Palota	27	9.40000000000000036	47.496197815204255	19.03954267501831	Budapest	\N	\N	https://foursquare.com/item/4dd697e7b3adc64ae0713cc3
803	Városliget	27	9.40000000000000036	47.51352506380488	19.082213271151655	Budapest	\N	\N	https://foursquare.com/item/5272856211d24c0efdefacc0
804	Hai Nam Pho Bistro	27	9.40000000000000036	47.47359458260371	19.051430619922268	Budapest	\N	\N	https://foursquare.com/item/52b84522498ec2b830c5504a
805	Ázsia Bolt	27	9.40000000000000036	47.48754143885424	19.058561779937655	Budapest	\N	\N	https://foursquare.com/item/4e884dbf0039ce62bf44523f
806	Hősök Tere | Heroes Square (Hősök Tere)	27	9.30000000000000071	47.51457451527398	19.07801531237385	Budapest	\N	\N	https://foursquare.com/item/51ffa199498e319de840beb5
807	Pizzica	27	9.30000000000000071	47.50412207618708	19.059493468226442	Nagymező u. 21.	\N	\N	https://foursquare.com/item/536d451d11d2228b33555360
808	The Goat Herder	27	9.30000000000000071	47.50305694013112	19.077630405586625	Budapest	\N	\N	https://foursquare.com/item/55361334498e7aa0f8b135f7
809	Szent István Bazilika	27	9.30000000000000071	47.50072088498916	19.05374765396118	Budapest	\N	\N	https://foursquare.com/item/4cc2f11938aaa09383630962
810	Tamp & Pull Espresso Bar	27	9.30000000000000071	47.484611015735666	19.06076066977697	Budapest	\N	\N	https://foursquare.com/item/505b252ee4b07c8ee3df1bc0
811	Burggarten	28	9.5	48.20428131101831	16.365519232185786	Opernring (Goethegasse)	\N	\N	https://foursquare.com/item/51936830498edd6f4deb9be2
812	Stephansplatz	28	9.5	48.2082381827127	16.371907880727903	Stephansplatz	\N	\N	https://foursquare.com/item/4f48dad6e4b0426dbb503a4c
813	Schlosspark Schönbrunn	28	9.5	48.181596956831996	16.310577392578125	Hietzinger Tor	\N	\N	https://foursquare.com/item/4f5f1c4de4b0a91e31004323
814	Schloss Schönbrunn	28	9.5	48.18626221794323	16.31336649523146	Schönbrunner Schloßstr. 47	\N	\N	https://foursquare.com/item/4ec22c5e0cd6d2a16f94850f
815	MuseumsQuartier	28	9.40000000000000036	48.20341231530758	16.358870566226845	Museumsplatz 1	\N	\N	https://foursquare.com/item/4db98f6ccda10f31e62ef509
816	Augarten	28	9.40000000000000036	48.22595921450094	16.374478340148926	Obere Augartenstr. 1	\N	\N	https://foursquare.com/item/4def821231515b40632bef78
817	Türkenschanzpark	28	9.40000000000000036	48.23502143339605	16.33469581604004	Hasenauerstr.	\N	\N	https://foursquare.com/item/4c97786dbc279c74ed056f53
818	Rathausplatz	28	9.40000000000000036	48.21056375739514	16.359568669019925	Rathausplatz	\N	\N	https://foursquare.com/item/5213049311d25916795dbf4d
819	Musikverein	28	9.40000000000000036	48.20058334025845	16.3723898844505	Bösendorferstr. 12	\N	\N	https://foursquare.com/item/4f255170e4b0acaff915618c
820	Schlossgarten Belvedere	28	9.30000000000000071	48.19530158712393	16.380057334899902	Prinz-Eugen-Str. 27	\N	\N	https://foursquare.com/item/51c862ba498e31c14faa60fa
821	Tiergarten Schönbrunn	28	9.30000000000000071	48.18213006196686	16.30522648944738	Maxingstr. 13b	\N	\N	https://foursquare.com/item/51889a20498e1f88b7fa36ee
822	Mochi	28	9.30000000000000071	48.213538452303276	16.38204486468344	Praterstraße 15	\N	\N	https://foursquare.com/item/4f4e1685e4b027287367954e
823	Albertina	28	9.30000000000000071	48.204606055973905	16.36851786358611	Albertinaplatz 1	\N	\N	https://foursquare.com/item/4efb7084469012b8c48fb6a1
824	Kunsthistorisches Museum Wien	28	9.30000000000000071	48.20391159880771	16.3616681098938	Maria-Theresien-Platz	\N	\N	https://foursquare.com/item/5467e08f498e332caeee2156
825	Kahlenberg	28	9.30000000000000071	48.27445893605229	16.33686204929815	Am Kahlenberg	\N	\N	https://foursquare.com/item/522c361f11d2094ec75e4c20
826	Yume	28	9.30000000000000071	48.201691871198456	16.257131622112418	Bergmillergasse 3	\N	\N	https://foursquare.com/item/508af2e2e4b0645d66437ca4
827	Augustin	28	9.30000000000000071	48.19664706616521	16.323129731919792	Märzstr. 67	\N	\N	https://foursquare.com/item/54551713498e8f12a2c818d1
828	Stadtpark	28	9.30000000000000071	48.20483497342122	16.37984753913406	Parkring (Am Stadtpark)	\N	\N	https://foursquare.com/item/4e4236b6185012258bbb9609
829	Hofburg	28	9.30000000000000071	48.20733739810464	16.36528626741876	Heldenplatz	\N	\N	https://foursquare.com/item/4e500e0bd4c0b6da5d8747c1
830	Heldenplatz	28	9.30000000000000071	48.20640682863227	16.363346271111823	Heldenplatz	\N	\N	https://foursquare.com/item/4daa8decb3dccb44d380f620
831	Stephansdom	28	9.30000000000000071	48.20860141811007	16.37241659577143	Stephansplatz 3	\N	\N	https://foursquare.com/item/4bc239da70c603bb238797b4
832	Gartenbaukino	28	9.30000000000000071	48.20558480522166	16.37837290763855	Parkring 12 (Liebenberggasse)	\N	\N	https://foursquare.com/item/4eaea2e07beb1696037b6b14
833	Naturhistorisches Museum	28	9.30000000000000071	48.205184384730245	16.359801292419434	Burgring 7	\N	\N	https://foursquare.com/item/4d9851af61a3a1cda3ceca42
834	Cha No Ma	28	9.30000000000000071	48.199	16.365213	Faulmanngasse 7	\N	\N	https://foursquare.com/item/52a845e6498e782584f98b25
835	Wiener Staatsoper	28	9.30000000000000071	48.20278214810592	16.369473340665053	Opernring 2	\N	\N	https://foursquare.com/item/51445a56e4b08f777c8e7e1e
836	phil	28	9.19999999999999929	48.200244	16.361222299999998	Gumpendorfer Str. 10-12	\N	\N	https://foursquare.com/item/4b1a2ae570c603bb903f8fb4
837	Wiener Eistraum	28	9.19999999999999929	48.21046110356832	16.359479427337646	Rathausplatz	\N	\N	https://foursquare.com/item/512338bae4b0dd57c0ba9799
838	Kolar	28	9.19999999999999929	48.210587	16.370007	Kleeblattgasse 5	\N	\N	https://foursquare.com/item/4cf6993f64e3721e082722c8
839	BeerLovers Craft Beer Store	28	9.19999999999999929	48.19884945684821	16.35821721084157	Gumpendorferstrasse 35	\N	\N	https://foursquare.com/item/5859fdfd0b7e93345a12dc50
840	Volksgarten	28	9.19999999999999929	48.20801851247569	16.36148291919829	Doktor-Karl-Renner-Ring (Heldenplatz)	\N	\N	https://foursquare.com/item/4f6c7728e4b0ca47aff345e2
841	Concerto Records	29	9.59999999999999964	52.363323	4.898443	Utrechtsestraat 52-60 (Keizersgracht)	\N	\N	https://foursquare.com/item/4a742d5b70c603bb344a8eb4
842	Vondelpark	29	9.59999999999999964	52.36032513337471	4.873915259772422	Vondelpark	\N	\N	https://foursquare.com/item/4e369f8218a82fdd65826241
843	Amsterdamse Grachten | Amsterdam Canals (Amsterdamse Grachten)	29	9.59999999999999964	52.36649951267262	4.888021874385231	Prinsengracht, Keizersgracht, Herengracht & Singel	\N	\N	https://foursquare.com/item/4f86f8d8e4b0fa91a1cbc261
844	Amsterdamse Bos	29	9.59999999999999964	52.323717632885625	4.845879270082659	Bosbaanweg 5	\N	\N	https://foursquare.com/item/51f192a0498e19dadb23f30d
845	Dignita Restaurant	29	9.5	52.35189519741233	4.857311798337728	Koninginneweg 218HS	\N	\N	https://foursquare.com/item/55ddc334498e3841c59de04f
846	HPS	29	9.5	52.37170189338733	4.907627105712891	Rapenburg 18	\N	\N	https://foursquare.com/item/50184663e4b07b4e9e2c72c4
847	Gartine	29	9.5	52.3691573761686	4.891585402736774	Taksteeg 7 (Kalverstraat)	\N	\N	https://foursquare.com/item/5040ca21e4b0af4f726390d6
848	Back to Black	29	9.5	52.36098861694336	4.888422012329102	Weteringstraat 48	\N	\N	https://foursquare.com/item/54f98e97498efdb2b9b350e6
849	Brouwerij 't IJ	29	9.40000000000000036	52.36672171292559	4.9263811111450195	Funenkade 7 (Zeeburgerpad)	\N	\N	https://foursquare.com/item/52935a1411d2c28e5a1cd823
850	Westerpark	29	9.40000000000000036	52.38593674919591	4.875295069377467	Haarlemmerweg	\N	\N	https://foursquare.com/item/4d4a9e6bf2cc6a312d8fbf88
851	EYE	29	9.40000000000000036	52.384122836878994	4.901005240759131	IJpromenade 1	\N	\N	https://foursquare.com/item/4fe9fe02e4b0474956235892
852	Paradiso	29	9.40000000000000036	52.36221602667733	4.883864273904673	Weteringschans 6-8 (Leidseplein)	\N	\N	https://foursquare.com/item/527a6524498e62051cb5b1dd
853	The American Book Center	29	9.40000000000000036	52.36896703972043	4.889495372772216	Spui 12	\N	\N	https://foursquare.com/item/5261508e11d272f70c67e609
854	Koffieschenkerij De Oude Kerk	29	9.40000000000000036	52.374177854365286	4.898373484611511	Oudekerksplein 23 (Oudezijds Voorburgwal)	\N	\N	https://foursquare.com/item/551026e1498ed9ad827892c8
855	Porem	29	9.40000000000000036	52.375527129164155	4.902428984642029	Geldersekade 17	\N	\N	https://foursquare.com/item/56adeb86498e40a7c53c9492
856	Winkel 43	29	9.40000000000000036	52.37910316294599	4.886308908462524	Noordermarkt 43 (at Westerstraat)	\N	\N	https://foursquare.com/item/524895cd498e5bdb5bfaec61
857	Bocca	29	9.40000000000000036	52.36441041752952	4.886841191471899	Kerkstraat 96-98	\N	\N	https://foursquare.com/item/56733318498e8b6e8d8a8941
858	Het Concertgebouw	29	9.40000000000000036	52.356151185800115	4.8794529897790975	Concertgebouwplein 2-6 (Van Baerlestraat)	\N	\N	https://foursquare.com/item/4b3c6a9a70c603bbafaf8fb4
859	Beatrixpark	29	9.40000000000000036	52.3435496773721	4.88428548457242	Boerenweteringpad	\N	\N	https://foursquare.com/item/51d1cec0498ec004dce139ca
860	Koninklijk Theater Carré	29	9.40000000000000036	52.362389021805356	4.90393976086156	Amstel 115 -125	\N	\N	https://foursquare.com/item/4e5808c8483b0fb7715e6d2c
861	Delight Yoga	29	9.40000000000000036	52.36156422539996	4.885765158297943	Weteringschans 53	\N	\N	https://foursquare.com/item/4f677649e4b03be105ce27a0
862	Rijksmuseum	29	9.40000000000000036	52.36005324069954	4.8852429532373804	Museumstraat 1 (Stadhouderskade / Museumplein)	\N	\N	https://foursquare.com/item/52079da711d2f88520a27a50
863	Café Brecht	29	9.40000000000000036	52.35959739113188	4.890296175318057	Weteringschans 157	\N	\N	https://foursquare.com/item/4d30cc87c129a35dbafa4d71
864	Foodware	29	9.40000000000000036	52.3688249	4.8819837	Looiersgracht 12 (Prinsengracht)	\N	\N	https://foursquare.com/item/4e441fc6d22de4060ef1d241
865	Le Fournil de Sébastien	29	9.40000000000000036	52.346505	4.867787	Olympiaplein 119 (Stadionweg)	\N	\N	https://foursquare.com/item/4ab23a2770c603bb25788eb4
866	Caffènation	29	9.40000000000000036	52.354812	4.849417	Theophile de Bockstraat 37	\N	\N	https://foursquare.com/item/54a426c1498e4fc15fdfef27
867	Omelegg - De Pijp	29	9.40000000000000036	52.351797462363756	4.891480207443237	Ferdinand Bolstraat 143 (Van Ostadestraat)	\N	\N	https://foursquare.com/item/5258445711d25ff1f9ba89b0
868	GlouGlou	29	9.40000000000000036	52.352507	4.894983	Tweede van der Helststraat 3	\N	\N	https://foursquare.com/item/57817882498e75cfdf59abd8
869	De Ceuvel	29	9.40000000000000036	52.393238031932746	4.910636849534262	Korte Papaverweg 4	\N	\N	https://foursquare.com/item/53e490e3498e335f684abc78
870	Pisa IJs	29	9.40000000000000036	52.34441128027196	4.890289306640625	Scheldeplein 10 (Scheldestraat)	\N	\N	https://foursquare.com/item/4e499488d4c0dae7bfc1a78a
871	Народен театър "Иван Вазов" (Ivan Vazov National Theatre)	30	9.59999999999999964	42.69429632651061	23.326324224472046	ул. Дякон Игнатий 5 (ул. Славянска)	\N	\N	https://foursquare.com/item/509d698de4b057cac3609c12
872	Южен Парк (South Park) (Южен Парк)	30	9.59999999999999964	42.66947518437351	23.30663462992467	София	\N	\N	https://foursquare.com/item/4d9033c6accf2d435cffc2d6
873	Витоша (Vitosha) (Витоша)	30	9.59999999999999964	42.632706232229005	23.241482235904414	Vitosha Mountain	\N	\N	https://foursquare.com/item/4e514df1922e36d08cacdb84
874	Градинката пред Народен театър (National Theater Garden)	30	9.5	42.6951660642827	23.325474429807077	ул. Дякон Игнатий 5 (ул. Славянска)	\N	\N	https://foursquare.com/item/4f78a9dce4b0f75aef447054
875	Докторска градина	30	9.5	42.69424802591223	23.338798624441566	Krakra St. (btwn Oborishte St. & Shipka St.)	\N	\N	https://foursquare.com/item/515858aae4b0bf32ff115621
876	Парк Заимов (Zaimov Park)	30	9.40000000000000036	42.69763415759587	23.34158410593888	бул. Янко Сакъзов (ул. Васил Априлов)	\N	\N	https://foursquare.com/item/4deaa4571850bae7b8cca227
877	Вила Росиче	30	9.40000000000000036	42.6903507943708	23.317763076494433	ул. Неофит Рилски 26 (м/у Цар Асен и Княз Борис I)	\N	\N	https://foursquare.com/item/52c1a2ae498ed044d24507c3
878	Ашурбанипал	30	9.40000000000000036	42.70218132834661	23.3204984664917	ул. Княз Борис I 174 (м/у Цар Симеон и Лозенград)	\N	\N	https://foursquare.com/item/558562f7498e68c3568f9250
879	Фабрика ДЪГА	30	9.40000000000000036	42.698838209834754	23.325862884521484	ул. Веслец 10	\N	\N	https://foursquare.com/item/54390ca7498ea965d84d44cd
880	Млекарницата на Добрев	30	9.40000000000000036	42.68527374343218	23.321560061137795	Бул. Фритьоф Нансен 31 (Ул. Д-р Петър Берон)	\N	\N	https://foursquare.com/item/51e62e14498e2f0f902adac0
881	Franco's Pizza	30	9.40000000000000036	42.68972256666954	23.319554328918457	бул. Витоша 65 (ул. Хан Аспарух 37)	\N	\N	https://foursquare.com/item/5890ace90b7e93429af7e286
882	Борисова градина	30	9.40000000000000036	42.687332734099584	23.338523239041315	бул. Цариградско шосе (бул. Евлоги Георгиев)	\N	\N	https://foursquare.com/item/4eb3217c0cd678e5f10b331d
883	ХлеБар	30	9.30000000000000071	42.694397678766094	23.341893138294836	ул. Оборище 16 (ул. Васил Априлов)	\N	\N	https://foursquare.com/item/517421a7e4b0ecc0b06aa638
884	Ciccione Panini Bar & Bakery	30	9.30000000000000071	42.69429528449671	23.321756727399485	ул. Христо Белчев 6 (ул. Алабин)	\N	\N	https://foursquare.com/item/50938016e4b02645de5791d3
885	Bread Land	30	9.30000000000000071	42.67609978838978	23.28856685043033	бул. Г.Делчев 32 (ул. С.Тошев)	\N	\N	https://foursquare.com/item/5246c81211d21d984b0e7e24
886	100 Beers	30	9.30000000000000071	42.68935327895765	23.330560484993686	ул “Юрий Венелин” 1 (ул. " Цар Шишман")	\N	\N	https://foursquare.com/item/54e9e396498ed89045b3f3ab
887	+ това	30	9.30000000000000071	42.69538307040356	23.343997293212244	ул. Марин Дринов 30 (ул. Проф. Асен Златаров)	\N	\N	https://foursquare.com/item/4ecbce2f2c5be0e01ca4715f
888	Слънце Луна	30	9.30000000000000071	42.68970032995864	23.32527327541955	ул. 6-ти септември 39 (Малките пет кьошета)	\N	\N	https://foursquare.com/item/5144cc41e4b0702d2487c473
889	Чай във фабриката (Tea House)	30	9.30000000000000071	42.69860166161197	23.328588008880615	ул. Георги Бенковски 11 (бул. Дондуков)	\N	\N	https://foursquare.com/item/4df0ba0a1f6ea135c65c0d25
890	Greenwich Book Center	30	9.30000000000000071	42.6922381762636	23.320144414901733	Бул. Витоша 37 (ул. Солунска)	\N	\N	https://foursquare.com/item/53144195498e230cd3291854
891	Златните Мостове	30	9.30000000000000071	42.622905845487836	23.239070146484934	България	\N	\N	https://foursquare.com/item/5228411811d23105b88b6580
892	Elephant Bookstore	30	9.30000000000000071	42.69025501424865	23.32862013500436	31 Shishman St.	\N	\N	https://foursquare.com/item/515be6fbe4b0afecf1aba14f
893	Софийска опера и балет (Sofia Opera and Ballet)	30	9.19999999999999929	42.69793143675372	23.330401182174683	бул. Дондуков 30 (ул. Врабча 1)	\N	\N	https://foursquare.com/item/4f8268e3e4b0fc8b1a5b6af8
894	Veda House	30	9.19999999999999929	42.692151432801275	23.31526279449463	ул. Гладстон 2 (бул. Христо Ботев)	\N	\N	https://foursquare.com/item/4c8a27ce6418a143dc0cddce
895	Supa Star	30	9.19999999999999929	42.69270943065322	23.331285566171285	ул. Иван Шишман 8 (ул. Хаджи Димитър)	\N	\N	https://foursquare.com/item/4d52a66abfc260fcccaecd26
896	Chucky's	30	9.19999999999999929	42.69171081709989	23.32092402307312	Hristo Belchev 29 (Solunska)	\N	\N	https://foursquare.com/item/55b2453b498ef682449b4283
897	JoVan The Dutch Baker	30	9.19999999999999929	42.68925097720074	23.32162436825456	ул.Ангел Кънчев 37	\N	\N	https://foursquare.com/item/5568211a498e12cabcf4ba4a
898	Преди 10 (Before 10)	30	9.19999999999999929	42.698027414272424	23.347032917404906	ул. Професор Милко Бичев 1 (ул. Силистра)	\N	\N	https://foursquare.com/item/50ba44e5e4b0cbe6424ca2eb
899	Езерото с лилиите (The Lily Lake)	30	9.19999999999999929	42.685289431786714	23.342166908963183	Борисова градина	\N	\N	https://foursquare.com/item/4f85a00ee4b019ac20caeaf4
900	Gelateria Naturale	30	9.19999999999999929	42.69245863115991	23.330965370153535	12a Shishman Str.	\N	\N	https://foursquare.com/item/55b4f880498e61432a0ce047
901	Parque del Retiro	31	9.69999999999999929	40.41423123602168	-3.6832523345947266	Pl. de la Independencia, 7 (C. Alcalá)	\N	\N	https://foursquare.com/item/4e75bcf51838f91889f9e1f6
902	Running Company Madrid	31	9.5	40.40673966912915	-3.687162600832506	Paseo Infanta Isabel 21	\N	\N	https://foursquare.com/item/50eeef48e4b0e73fdb406880
903	Yoka Loka	31	9.5	40.411669931669714	-3.6986562682161477	C. Santa Isabel, 5 (mercado de Antón Martín,  pto. 81 planta baja)	\N	\N	https://foursquare.com/item/517bcc5fe4b031458df0d739
904	Vinoteca Moratín	31	9.5	40.412591206336806	-3.695589383393728	C. Moratín, 36	\N	\N	https://foursquare.com/item/52c60030498e6de72ca1facd
905	Restaurante Lakasa	31	9.5	40.440864068483386	-3.700697422027588	Plaza Descubridor Diego de Ordás, 1 (Santa Engracia, 120)	\N	\N	https://foursquare.com/item/4ffd6c0be4b06558f2f4e635
906	Matadero Madrid	31	9.5	40.39227020881504	-3.697500228881836	P. de la Chopera, 14 (Pl. de Legazpi, 8)	\N	\N	https://foursquare.com/item/51dbdb66498e98e7dd22633f
907	La Castela	31	9.5	40.420438309487785	-3.6765283318278335	C. Doctor Castelo, 22 (C. Narváez)	\N	\N	https://foursquare.com/item/50cf8fa3e4b0b76ce9a2ac1b
908	Piccola Napoli	31	9.40000000000000036	40.44963573046068	-3.7003062201530654	C. Palencia, 30	\N	\N	https://foursquare.com/item/4cd170ef9d87224bbed25a3b
909	Puerta de Alcalá	31	9.40000000000000036	40.41988089427612	-3.689352141222696	Pl. de la Independencia	\N	\N	https://foursquare.com/item/4e75d5a5922ef20af5a63917
910	Plaza de Oriente	31	9.40000000000000036	40.418325668437966	-3.712196052074432	Pl. de Oriente	\N	\N	https://foursquare.com/item/53778d7411d21c7e8faad772
911	Plaza de Cibeles	31	9.40000000000000036	40.41926626563951	-3.6931716795694247	Pl. de Cibeles	\N	\N	https://foursquare.com/item/4fb4550ce4b06449f8f994e1
912	1862	31	9.40000000000000036	40.42425769051178	-3.7066340119935237	C. Pez, 27	\N	\N	https://foursquare.com/item/51f218f4498ee48f010a1f9b
913	Palacio Real de Madrid	31	9.40000000000000036	40.41769034259746	-3.713324393550414	C. Bailén, s/n (Pl. de Oriente)	\N	\N	https://foursquare.com/item/51dc1392498e5e72a9858630
914	Museo Nacional del Prado	31	9.40000000000000036	40.41430837388798	-3.692542501008022	C. de Ruiz de Alarcón, 23 (P. del Prado)	\N	\N	https://foursquare.com/item/505c3de5e4b067ab6b43d2e7
915	Toma Café	31	9.40000000000000036	40.426553	-3.705958	C. Palma, 49	\N	\N	https://foursquare.com/item/51875f4c498ef53a1a25642d
916	El Landó	31	9.40000000000000036	40.41197271910801	-3.7149153476632457	Plaza Gabriel Miró, 8	\N	\N	https://foursquare.com/item/567f3041498e50be28ea43a6
917	De María	31	9.30000000000000071	40.46337541958804	-3.688366340940912	C. Félix Boix, 5	\N	\N	https://foursquare.com/item/4e652247814d386f761e3548
918	Panta Rhei	31	9.30000000000000071	40.423487	-3.700155	Hernan Cortés 7 (Fuencarral)	\N	\N	https://foursquare.com/item/4bd5d6c270c603bb925099b4
919	El Paraguas	31	9.30000000000000071	40.42389299636042	-3.685800378078885	C. Jorge Juan, 16	\N	\N	https://foursquare.com/item/4c9f49e6d3c2b60ca906d3bc
920	Gelateria La Romana	31	9.30000000000000071	40.45122313268238	-3.6864096586276687	P. de la Habana, 27	\N	\N	https://foursquare.com/item/51bb367c498ee2e3ecd8aa90
921	Miyama	31	9.30000000000000071	40.43548281616766	-3.6894321441650395	P. de la Castellana, 45	\N	\N	https://foursquare.com/item/4e39badf1520141bebf6a6d3
922	Plaza de Santa Ana	31	9.30000000000000071	40.41469276555161	-3.7008368968963623	Pl. de Santa Ana	\N	\N	https://foursquare.com/item/4c07664670c603bb4e399eb4
923	Parque Dehesa de la Villa	31	9.30000000000000071	40.45880570263439	-3.7173539163577205	Carretera Dehesa de la Villa,  1	\N	\N	https://foursquare.com/item/4c1934ef6e02b71386b6627b
924	Parque de las Siete Tetas	31	9.30000000000000071	40.397811329712745	-3.655429875522588	C. Ramón Pérez de Ayala	\N	\N	https://foursquare.com/item/536e3fad498e6e39869e9fd4
925	Templo de Debod	31	9.30000000000000071	40.424220494713936	-3.7164369611089327	C. Ferraz, 1	\N	\N	https://foursquare.com/item/4e75e60c8998ed82a4cc3f0d
926	LUSH	31	9.30000000000000071	40.41902081017415	-3.704939255653483	Calle del Carmen 24	\N	\N	https://foursquare.com/item/583f0e86e612f2032cfeaffe
927	Jardines de Sabatini	31	9.30000000000000071	40.42032149776728	-3.7131261473175723	C. Bailén, 2	\N	\N	https://foursquare.com/item/5198d949498e8ad745c1d7c0
928	Mercado de San Miguel	31	9.30000000000000071	40.41536259038864	-3.7090417742729187	Pl. de San Miguel	\N	\N	https://foursquare.com/item/4c0be68a6a3bb71304a872c7
929	Hotel Eurostars Madrid Tower	31	9.30000000000000071	40.47646419977281	-3.687758445739746	P. de la Castellana, 259	\N	\N	https://foursquare.com/item/51c97162498e43f3482c5b77
930	Museo Thyssen-Bornemisza	31	9.30000000000000071	40.41635928605382	-3.6948908136558845	P. del Prado, 8	\N	\N	https://foursquare.com/item/5072a586e4b09a19d8909ef9
931	Universal Studios Florida	32	9.69999999999999929	28.475052914170274	-81.46719214098208	6000 Universal Blvd (at Universal Orlando Resort)	\N	\N	https://foursquare.com/item/4d94be91cf7e6a3155f65773
932	The Wizarding World Of Harry Potter - Diagon Alley	32	9.59999999999999964	28.479634531004653	-81.46953555268423	Diagon Alley (Universal Studios Florida)	\N	\N	https://foursquare.com/item/53b989a3498e5511b6eaab2e
933	Universal's Islands of Adventure	32	9.59999999999999964	28.472054239537314	-81.4692567065859	6000 Universal Blvd (at Universal Orlando Resort)	\N	\N	https://foursquare.com/item/4c393e533849c928ad12c1b1
934	Universal Orlando Resort	32	9.59999999999999964	28.474056384860503	-81.46332025820716	6000 Universal Blvd	\N	\N	https://foursquare.com/item/50febae0e4b03727c6f695d8
935	Total Wine & More	32	9.5	28.552512	-81.348464	2712 East Colonial Drive (in Colonial Plaza)	\N	\N	https://foursquare.com/item/4c752fbd8d70b7134125d6ad
936	Lake Eola Park	32	9.5	28.5434092624052	-81.37307409174699	195 N Rosalind Ave (N Eola Dr)	\N	\N	https://foursquare.com/item/4b06be6370c603bbb8f58eb4
937	Dr. Phillips Center for the Performing Arts	32	9.5	28.537622342535606	-81.37720227241516	445 S Magnolia Ave	\N	\N	https://foursquare.com/item/4fabb446e4b0af50a846f5e8
938	Mako	32	9.5	28.409435729356645	-81.45989867885834	SeaWorld	\N	\N	https://foursquare.com/item/5882e42dd25ded6a665af820
939	The Wizarding World Of Harry Potter - Hogsmeade	32	9.5	28.472823105945576	-81.47284409039302	Islands of Adventure (at Universal Orlando Resort)	\N	\N	https://foursquare.com/item/4c86d6594a339521ba92ad07
940	Harry Potter and the Forbidden Journey / Hogwarts Castle	32	9.5	28.47217741924342	-81.47340711723828	Wizarding World (at Islands of Adventure)	\N	\N	https://foursquare.com/item/4d99c1a79079b1f726cd480a
941	The Amazing Adventures of Spider-Man	32	9.5	28.470611765161085	-81.46993026137352	Marvel Superhero Island (at Islands of Adventure)	\N	\N	https://foursquare.com/item/4c697f1c1a6620a118b5638c
942	Pom Pom's Teahouse & Sandwicheria	32	9.40000000000000036	28.543550702737143	-81.35152816772461	67 Bumby Ave (at Kilgore St)	\N	\N	https://foursquare.com/item/4c2f4cfb6f1fef3b3d81eb3d
943	Hogsmeade Station	32	9.40000000000000036	28.473796	-81.472501	6000 Universal Blvd	\N	\N	https://foursquare.com/item/4f96bb3ce4b0266a4fb98a1c
944	The Incredible Hulk Coaster	32	9.40000000000000036	28.4712155671972	-81.46947656609535	Marvel Superhero Island (at Islands of Adventure)	\N	\N	https://foursquare.com/item/4d94bebacf7e6a3183f75773
945	Harry P Leu Gardens	32	9.40000000000000036	28.569170150718243	-81.35630414244304	1920 N Forest Ave	\N	\N	https://foursquare.com/item/4bd74ca970c603bb7b7299b4
946	Revenge Of The Mummy	32	9.40000000000000036	28.47672651005747	-81.4693924849903	New York (Universal Studios Florida)	\N	\N	https://foursquare.com/item/4d273e99b818a35d01bd898a
947	Discovery Cove	32	9.40000000000000036	28.40569	-81.460919	6000 Discovery Cv Wy	\N	\N	https://foursquare.com/item/4bd5fd4f70c603bbab5499b4
948	Marvel Superhero Island	32	9.40000000000000036	28.470868075093254	-81.46978758577295	Islands of Adventure (at Universal Orlando Resort)	\N	\N	https://foursquare.com/item/4db4727b5da3a76f443ecf55
949	Publix	32	9.40000000000000036	28.4539279937744	-81.4897155761719	7524 Dr Phillips Blvd (at Sand Lake Rd)	\N	\N	https://foursquare.com/item/52b364aa498e0de68b36e05f
950	Whole Foods Market	32	9.40000000000000036	28.4492550221815	-81.4769299614126	8003 Turkey Lake Rd (at W Sand Lake Rd)	\N	\N	https://foursquare.com/item/4d7c28e1ea35236a52505423
951	Carter's	32	9.40000000000000036	28.476028	-81.450818	4967 International Dr Ste 3A21	\N	\N	https://foursquare.com/item/50551a6de4b01f3aa5a68059
952	The Cheesecake Factory	32	9.40000000000000036	28.486118390829144	-81.43115238086126	4200 Conroy Rd (Mall at Millenia)	\N	\N	https://foursquare.com/item/51a94510498e976a502f5bec
953	Seito Sushi	32	9.40000000000000036	28.567826165324984	-81.32644414901733	4898 New Broad St	\N	\N	https://foursquare.com/item/4c75c4ab604a3704d3ce8349
954	NYPD Pizza of Lake Cay	32	9.30000000000000071	28.428021	-81.44421246	9900 Universal Blvd (Destination Parkway)	\N	\N	https://foursquare.com/item/4cb9e349f50e224b0143f0fb
955	Dandelion Communitea Café	32	9.30000000000000071	28.552089724236357	-81.36562660551792	618 N Thornton Ave (btw Concord & Colonial)	\N	\N	https://foursquare.com/item/4d3b590e63052d43fc8aabc5
956	Harry Potter and the Escape from Gringotts	32	9.30000000000000071	28.47980745072599	-81.47013614078786	Diagon Alley (Universal Studios Florida)	\N	\N	https://foursquare.com/item/53bc9f6f498e90a9096cdcbe
957	King's Cross Station	32	9.30000000000000071	28.47916966887864	-81.46961598886766	Orlando, FL	\N	\N	https://foursquare.com/item/54e34fa2498e04e7e23977b8
958	Jeremiah's Italian Ice	32	9.30000000000000071	28.557213035149587	-81.20560759067592	877 (877 North Alafaya Blvd.)	\N	\N	https://foursquare.com/item/52b4807711d2045f26254aaf
959	Black Bean Deli	32	9.30000000000000071	28.55322951810368	-81.3573431968689	1835 E Colonial Dr (at Meridale Avenue)	\N	\N	https://foursquare.com/item/5240e065498ef0b3d79be7a0
960	The Gnarly Barley	32	9.30000000000000071	28.45845170214803	-81.3654923615348	7431 S Orange Ave (at Perkins Rd)	\N	\N	https://foursquare.com/item/4fc74d02e4b06a23e2ebee45
961	Pizza 4P's	33	9.19999999999999929	10.781877947389962	106.7050552368164	8/15 Le Thanh Ton St. Dist 1	\N	\N	https://foursquare.com/item/4ebd78bff790ce9dc916d4c0
962	La Villa Restaurant	33	9.09999999999999964	10.803969023602267	106.732842	14 Ngo Quang Huy Street Thao Dien Ward District 2	\N	\N	https://foursquare.com/item/4faa78aee4b0061d16c18ac1
963	Village Thaodien	33	9.09999999999999964	10.816345843502518	106.73374088848432	Thao Dien	\N	\N	https://foursquare.com/item/57c3f003498e295cc5edbfa0
964	...hum vegetarian	33	9	10.778735	106.692174	32 Võ Văn Tần St., District 3 (Tran Quoc Thao St.)	\N	\N	https://foursquare.com/item/56699102498eb47b0f080e2d
965	Pizza 4P's	33	9	10.773296	106.697586	8 Thủ Khoa Huân, District 1	\N	\N	https://foursquare.com/item/588431c6ca10706e677b8c16
966	AAA Spa	33	9	10.766450624071341	106.69195632730482	133 Bui Vien (Pham Ngu Lao)	\N	\N	https://foursquare.com/item/5285f80d498e107ab6ffefb2
967	Golden Lotus Spa & Massage Club	33	8.90000000000000036	10.77924511853333	106.70436533082275	15 Thái Văn Lung, Quan 1	\N	\N	https://foursquare.com/item/50c575e6e4b065e8ed369b16
968	Quán Ụt Ụt	33	8.90000000000000036	10.793493372627138	106.70300059408409	60 Truong Sa	\N	\N	https://foursquare.com/item/571ceab9498e190e6cc6e7df
969	Pasteur Street Brewing Company	33	8.90000000000000036	10.775058	106.700799	144 Pasteur	\N	\N	https://foursquare.com/item/55f59db3498e6913fcf7bf45
970	Bánh Mì Huỳnh Hoa	33	8.90000000000000036	10.771315151964101	106.69240545767141	26 Le Thi Rieng	\N	\N	https://foursquare.com/item/52575f4111d257ef863a48e4
971	Gem Center	33	8.80000000000000071	10.790045917290428	106.70228655798081	8 Nguyen Binh Khiem St., Dakao Ward, Dist 1	\N	\N	https://foursquare.com/item/587066a432b0721b93369622
972	The Vintage Emporium	33	8.80000000000000071	10.790130104556813	106.6992939582633	95b Nguyen Van Thu st (Phan Ke Binh)	\N	\N	https://foursquare.com/item/545ca84e498e4387faa677aa
973	Baba's Kitchen	33	8.80000000000000071	10.76668309979967	106.6922787797827	164 Bui Vien, District 1	\N	\N	https://foursquare.com/item/51d4277c498ee2747af58e6c
974	Annam Gourmet	33	8.80000000000000071	10.727371131522272	106.70871296627517	SB2-1 Mỹ Khánh 4, Nguyễn Đức Cảnh	\N	\N	https://foursquare.com/item/4c878b29b231b60c821b1aec
975	L'Usine: Cafe, Bistro & Lifestyle Shop	33	8.80000000000000071	10.775841116348696	106.70317334510226	151/1 Dong Khoi St., 1st Flr., Dist. 1	\N	\N	https://foursquare.com/item/4df80e0db3adc73dcf328a12
976	Manmaru	33	8.80000000000000071	10.788188662482957	106.69586033734765	71 (Mac Dinh Chi)	\N	\N	https://foursquare.com/item/5735e2bd498e825f0fda4d7a
977	Trois Gourmands Restaurant	33	8.80000000000000071	10.80612723810711	106.74070383041331	39 Tran Ngoc Dien (Thao Dien, Dist 2)	\N	\N	https://foursquare.com/item/567a972a498eafe35ae61296
978	Ngoc Chau Garden	33	8.80000000000000071	10.773113739871496	106.70311576141447	116 Ho Tung Mau	\N	\N	https://foursquare.com/item/5881a62104ab1a1578b27d8f
979	The Deck Saigon	33	8.80000000000000071	10.80709465160352	106.74449927293742	38 Nguyen U Di St., An Phu Ward, Dist. 2	\N	\N	https://foursquare.com/item/4db2c94e93a017099db40c49
980	Cục Gạch	33	8.80000000000000071	10.793049540174604	106.68900489807129	10 Đặng Tất st., dist. 1 (Trần Nhật Duật)	\N	\N	https://foursquare.com/item/53e2a013498e7865a68a6b98
981	Cuc Gach Quan	33	8.80000000000000071	10.790807811447456	106.69145537528738	92B Thach Thi Thanh,Q1	\N	\N	https://foursquare.com/item/51650a42e4b061c02749ba79
982	Ride Cafe	33	8.80000000000000071	10.772121008283385	106.68764357094497	382/4 Nguyễn Thị Minh Khai	\N	\N	https://foursquare.com/item/506168a1498e317f7b463e7c
983	...Hum Vegetarian	33	8.69999999999999929	10.776586059472251	106.70574159289433	2 Thi Sach St., Dist. 1	\N	\N	https://foursquare.com/item/545cc38e498ec0160686ed5f
984	Curry Shika	33	8.69999999999999929	10.769838868383866	106.69230757020553	1/4 Nguyễn Văn Tráng St, District 1 (Le Lai St.)	\N	\N	https://foursquare.com/item/5145b28ae4b086ca84ee8958
985	Pacey Cupcakes	33	8.69999999999999929	10.780140859820104	106.70081818456603	53G Nguyễn Du, quận 1 (Phạm thế hiển)	\N	\N	https://foursquare.com/item/4e663c4f1f6ef7d07c4dbeda
986	Temple Leaf Spa	33	8.69999999999999929	10.778171847245927	106.70354188106084	74/1 Hai Bà Trưng	\N	\N	https://foursquare.com/item/583c460d6119f46ba2f38a4b
987	Phở Quỳnh	33	8.69999999999999929	10.767403613473324	106.69067228017069	323 Pham Ngu Lao, District 1 (Do Quang Dau)	\N	\N	https://foursquare.com/item/4e24352c62e1964dbb824d91
988	Dolphy Cafe	33	8.69999999999999929	10.8041720308672	106.73701787857674	31 Thảo Điền Street, District 2	\N	\N	https://foursquare.com/item/572f3729cd105a13b166aa31
989	Le Méridien Saigon	33	8.69999999999999929	10.779791132179442	106.70752823352814	3C Ton Duc Thang Street	\N	\N	https://foursquare.com/item/55abdf61498e04cbed0c60b2
990	MAD House	33	8.69999999999999929	10.80526898659314	106.74164836543008	6/1/2 Nguyen U Di	\N	\N	https://foursquare.com/item/5573908a498e6b2e3dc704ee
991	Malecón Cisneros	34	9.40000000000000036	-12.120543909049886	-77.04343914985657	Malecón de Miraflores	\N	\N	https://foursquare.com/item/514fc448e4b0f2f19bc1f4a4
992	Club de Regatas "Lima"	34	9.40000000000000036	-12.166350559608615	-77.03244230320934	Av. Chachi Dibos 1201	\N	\N	https://foursquare.com/item/51736357e4b04648de87f9c4
993	Museo Larco Herrera	34	9.40000000000000036	-12.072676749933471	-77.07091845936995	Av. Bolívar 1515	\N	\N	https://foursquare.com/item/51c004a0498e8d96e9c8d99c
994	Parque María Reiche	34	9.40000000000000036	-12.115519911129853	-77.04811196708458	Malecón de la Marina	\N	\N	https://foursquare.com/item/4e790b7145dd919c60f2bb50
995	La Mar Cebichería	34	9.40000000000000036	-12.113347899098205	-77.04539179801941	Av. La Mar 770	\N	\N	https://foursquare.com/item/538136b2498e70147c30a7f0
996	Microsoft Perú	34	9.40000000000000036	-12.096941110505258	-77.03651905059814	Av. Víctor Andrés Belaunde 147 Torre Real 1	\N	\N	https://foursquare.com/item/52efb013498e5feaf8b7714f
997	Faro de la Marina	34	9.40000000000000036	-12.123351266354996	-77.03995972238799	Malecón Cisneros cdra. 7 (entre Ca Francia & Av de la Aviación)	\N	\N	https://foursquare.com/item/4fae925ee4b0c8d2883e6c89
998	Blu: il gelato del barrio	34	9.40000000000000036	-12.150454447137575	-77.02063951881401	Jr. 28 De Julio 202	\N	\N	https://foursquare.com/item/5600d8ec498ed1e5822b15cd
999	Maido	34	9.30000000000000071	-12.125429866151867	-77.03059801829829	Ca. San Martín 399 (esq. Colón)	\N	\N	https://foursquare.com/item/4c354e023896e21e9b1ded90
1000	Restaurante Central	34	9.30000000000000071	-12.132711647508877	-77.02782869338989	Ca. Santa Isabel 376	\N	\N	https://foursquare.com/item/524fa88811d2534f0b722a00
1001	Malecón de Barranco	34	9.30000000000000071	-12.143070403165936	-77.02448581219699	Perú	\N	\N	https://foursquare.com/item/51034aa5e4b0700e0834a66b
1002	Gran Teatro Nacional	34	9.30000000000000071	-12.087289642890443	-77.0031159710741	Av. Javier Prado Este 2225 (Av. Aviación)	\N	\N	https://foursquare.com/item/51315270e4b021edca6b3df9
1003	Malecón Armendáriz	34	9.30000000000000071	-12.134354202965554	-77.02634143637124	Malecón de Miraflores	\N	\N	https://foursquare.com/item/51e2e8fe498e3bbfffae4c99
1004	Punta Hermosa	34	9.30000000000000071	-12.334077969902454	-76.8265481516411	Alt. Km 40 Panamericana Sur	\N	\N	https://foursquare.com/item/4f678806e4b09ff9bf4b86b5
1005	Bosque El Olivar	34	9.30000000000000071	-12.102159318000073	-77.03525928167852	Av. La República y Av. Los Incas (Av. Paz Soldán y Ca. Manuel Roauld Paz y Soldán)	\N	\N	https://foursquare.com/item/50572f72e4b0f42fb815330b
1006	Crem dela Crem	34	9.30000000000000071	-12.149816383365271	-77.02165733640312	Parque Municipal 109 Barranco	\N	\N	https://foursquare.com/item/5613ead3498ee97d549d15e0
1007	Naruto Japanese Food	34	9.30000000000000071	-12.073639517452666	-77.06260473631096	Av. Antonio De Sucre 187	\N	\N	https://foursquare.com/item/55943be8498e6ece05e1ccfe
1008	Edo Sushi Bar	34	9.30000000000000071	-12.10051837983863	-77.00038969516754	Av. San Borja Sur 663	\N	\N	https://foursquare.com/item/51959706498e8335037eab8a
1009	Tomyko Spa	34	9.30000000000000071	-12.088181356582869	-77.02077447854411	Esteban Campodonico 640	\N	\N	https://foursquare.com/item/5250414a498ea7bdae623aa7
1010	Cremoladas Yayo	34	9.30000000000000071	-12.052804123391928	-77.05525175682142	Av. Tingomaria 655 (Breña)	\N	\N	https://foursquare.com/item/50d7badde4b0ca3042cad0a3
1011	MATE Asociación Mario Testino	34	9.19999999999999929	-12.15401220098909	-77.02298442273496	Av. Pedro De Osma 409	\N	\N	https://foursquare.com/item/5006e15ee4b0e4c2aa740c7f
1012	Librería El Virrey	34	9.19999999999999929	-12.123585895712758	-77.03589677810669	Ca. Bolognesi 510 (Óvalo Bolognesi)	\N	\N	https://foursquare.com/item/4e97649ea17ca8a0d3343524
1013	Panchita	34	9.19999999999999929	-12.117701193610454	-77.0312511920929	Calle 2 de Mayo 298 (Esq. con Coronel Inclán)	\N	\N	https://foursquare.com/item/5185ba5f498e43b27e3a1ea7
1014	Deli France	34	9.19999999999999929	-12.106497872683203	-76.9712233543396	Av. La Encalada 980	\N	\N	https://foursquare.com/item/5217610e11d2b80bd7664f11
1015	Hanzo	34	9.19999999999999929	-12.109989805127622	-76.97309061617356	Av. Primavera 1494	\N	\N	https://foursquare.com/item/5119a3ffe4b0590ae145d12e
1016	Malecón de La Punta	34	9.19999999999999929	-12.073700479549444	-77.16439271626956	La Punta	\N	\N	https://foursquare.com/item/51c4851d498e7b8d3db9e884
1017	Larcomar	34	9.19999999999999929	-12.1314739325368	-77.03013694267781	Malecón de la Reserva 610	\N	\N	https://foursquare.com/item/4e7d09f4a17c03c4fc91cceb
1018	Origen - Tostadores de Cafe	34	9.19999999999999929	-12.103134	-77.021156	Las Tiendas 295	\N	\N	https://foursquare.com/item/561d1bbd498ed978f0249a98
1019	La Bodega De La Trattoria	34	9.09999999999999964	-12.11181326	-77.033146	General Borgoño 784	\N	\N	https://foursquare.com/item/4fde76b1e4b090d3f67949c5
1020	Maras	34	9.09999999999999964	-12.091800669001081	-77.02482461929321	The Westin Lima Hotel	\N	\N	https://foursquare.com/item/516df7cbe4b03e302c7f1b5c
1021	Tempelhofer Feld	35	9.59999999999999964	52.4769254944947	13.396797180175781	Tempelhofer Damm (Columbiadamm)	\N	\N	https://foursquare.com/item/571ea031498e02cf60ee98be
1022	Sammlung Boros	35	9.59999999999999964	52.523381168352785	13.384263013818234	Reinhardtstr. 20	\N	\N	https://foursquare.com/item/5177a6e2498e807a84a00210
1023	pro qm	35	9.5	52.527071	13.409929275512306	Almstadtstr. 45	\N	\N	https://foursquare.com/item/4e20eca381dc35f05c5359a4
1024	Viktoriapark	35	9.5	52.488477378543585	13.380188941955566	Kreuzbergstr. (Katzbachstr.)	\N	\N	https://foursquare.com/item/4ff067fde4b00d073ba3d8ce
1025	Tiergarten	35	9.5	52.51462778550934	13.357207775115967	Straße des 17. Juni	\N	\N	https://foursquare.com/item/4dcaa5f2fa7684db0905d5ef
1026	C/O Berlin	35	9.5	52.50676671509579	13.33081318576767	Hardenbergstr. 22-24	\N	\N	https://foursquare.com/item/545e50e8498e0b566b6579af
1027	Gendarmenmarkt	35	9.5	52.51339852513194	13.392733322686228	Gendarmenmarkt	\N	\N	https://foursquare.com/item/4e20401a922e11c006640ccb
1028	Modulor	35	9.5	52.503392385352065	13.41024993669407	Prinzenstr. 85 (Moritzplatz)	\N	\N	https://foursquare.com/item/4eccca989a528a8ec71f5553
1029	CAFÉ gestern, heute & morgen	35	9.5	52.54682417250985	13.41257929801941	Gaudystr. 1 (Schönhauser Allee)	\N	\N	https://foursquare.com/item/5891da1c4988da1a1c1610fa
1030	Dussmann das KulturKaufhaus	35	9.5	52.51839819531867	13.388788104057312	Friedrichstr. 90	\N	\N	https://foursquare.com/item/4e204e25922e11c0066413a5
1031	Markthalle Neun	35	9.5	52.50202476100858	13.431494235992432	Eisenbahnstr. 42 / 43	\N	\N	https://foursquare.com/item/517a51f2e4b020d118f2131f
1032	Brandenburger Tor	35	9.5	52.516246979489246	13.377785682678223	Pariser Platz	\N	\N	https://foursquare.com/item/522123b311d20413101fdf75
1033	Volkspark Friedrichshain	35	9.5	52.52763175555536	13.434479179076968	Landsberger Allee (Danziger Str.)	\N	\N	https://foursquare.com/item/4e410cd51fc7d4be92987fef
1034	Treptower Park	35	9.5	52.48873869829603	13.469152450561523	Am Treptower Park (Puschkinallee)	\N	\N	https://foursquare.com/item/518ab66a498ee27086f8ee23
1035	Bonanza Roastery	35	9.40000000000000036	52.504155208906184	13.4201276518078	Adalbertstr. 70	\N	\N	https://foursquare.com/item/586fa3d8040d535b9403dba6
1036	Pomodorino	35	9.40000000000000036	52.52229557755754	13.449684977531431	Straßmannstr. 21	\N	\N	https://foursquare.com/item/51e952ec498e291d8314b0e1
1037	Körnerpark	35	9.40000000000000036	52.47148940104489	13.437624343426899	Schierker Str. (Wittmannsdorfer Str.)	\N	\N	https://foursquare.com/item/5118cd18e4b0cd2374a09688
1038	BEN RAHIM	35	9.40000000000000036	52.525105	13.401886	Sophienstr. 7	\N	\N	https://foursquare.com/item/5606875f498e94f0f13628c6
1039	Rogacki	35	9.40000000000000036	52.512891003064624	13.305221199989319	Wilmersdorfer Str.145-146 (Spielhagenstr.)	\N	\N	https://foursquare.com/item/514d5755e4b0f713a89d39f0
1040	do you read me?!	35	9.40000000000000036	52.52727425323455	13.397788079606842	Auguststr. 28	\N	\N	https://foursquare.com/item/5415410f498e555aef6b05c2
1041	Zeit für Brot	35	9.40000000000000036	52.527858520308946	13.40874718172153	Alte Schönhauser Str. 4	\N	\N	https://foursquare.com/item/4f816797e4b00084db438adb
1042	CAMON Coffee	35	9.40000000000000036	52.48652953874885	13.429325474064326	Sonnenallee 27	\N	\N	https://foursquare.com/item/57d3305acd10c6dbee10894c
1043	Hokey Pokey	35	9.40000000000000036	52.54674101142049	13.417634790290453	Stargarder Str. 72-73	\N	\N	https://foursquare.com/item/4ebe8c81e5fae16463e493e5
1044	Lerchen und Eulen	35	9.40000000000000036	52.50219573573515	13.430588972743095	Pücklerstr. 33	\N	\N	https://foursquare.com/item/4f242bfce4b0b2f98f263cfa
1045	Chapter One	35	9.40000000000000036	52.4897447648475	13.39581549167633	Mittenwalder Str. 30	\N	\N	https://foursquare.com/item/50456f0ae4b00cac6f295553
1046	Reichstagskuppel	35	9.40000000000000036	52.51863648740562	13.376047611236572	Platz der Republik 1	\N	\N	https://foursquare.com/item/4e2046a3922e11c006640f68
1047	Philharmonie	35	9.40000000000000036	52.51002377628939	13.36915328577859	Herbert-von-Karajan-Str. 1 (Tiergartenstr.)	\N	\N	https://foursquare.com/item/4e8e8f23b63430010bff1c31
1048	Berta Block	35	9.40000000000000036	52.56384288345948	13.409993648529053	Mühlenstr. 62	\N	\N	https://foursquare.com/item/53f1bf34498e1f1189f69b22
1049	BRLO Brwhouse	35	9.40000000000000036	52.50007847969667	13.373526334762573	Schöneberger Str. 16	\N	\N	https://foursquare.com/item/577673ac498e52ba948cf05a
1050	Populus Coffee	35	9.40000000000000036	52.493718	13.427157	Maybachufer 20 (Bürknerstr.)	\N	\N	https://foursquare.com/item/56cdb670498e198627706d90
1051	Taiyaki Wakaba (たいやき わかば)	36	9.59999999999999964	35.686004	139.72684800000002	若葉1-10	\N	\N	https://foursquare.com/item/520b4c0d11d2bdc4d7598bc1
1052	Aigre Douce (エーグル ドゥース)	36	9.59999999999999964	35.722390409498196	139.70065794825427	下落合3-22-13	\N	\N	https://foursquare.com/item/54699cf8498eacc105266d41
1053	Shinjuku Gyoen (新宿御苑)	36	9.59999999999999964	35.68504754570482	139.70957815647125	内藤町11	\N	\N	https://foursquare.com/item/4e5774eb6365d314184c14d7
1054	shiva curry wara	36	9.59999999999999964	35.64606092692241	139.66971625881217	太子堂4-28-6 (サダン大田 2F)	\N	\N	https://foursquare.com/item/57a226ef498ec735357b10df
1055	Nui. | HOSTEL & BAR LOUNGE	36	9.5	35.70388526685761	139.79361507181764	蔵前2-14-13	\N	\N	https://foursquare.com/item/533c37d4498e513bed1b719c
1056	Gohanya Isshin (ごはんや 一芯 代官山)	36	9.5	35.64734910400587	139.7018051147461	猿楽町30-3 (ツインビル代官山A棟 B1F)	\N	\N	https://foursquare.com/item/57063d6e498e6141aa29eeac
1057	Himitsudo (ひみつ堂)	36	9.5	35.7273531782387	139.7665697336197	谷中3-11-18	\N	\N	https://foursquare.com/item/51f4bb11498eb42cc57da9ed
1058	Saya no Yudokoro (前野原温泉 さやの湯処)	36	9.5	35.77083028340486	139.69238630223276	前野町3-41-1	\N	\N	https://foursquare.com/item/50f2b686e4b04eb64493249c
1059	Blue Note Tokyo	36	9.5	35.661129621679365	139.71617370843887	南青山6-3-16 (ライカビル B2F)	\N	\N	https://foursquare.com/item/4b79667070c603bbd04e92b4
1060	Maruka (丸香)	36	9.5	35.696708664949284	139.76013511419296	神田小川町3-16-1 (ニュー駿河台ビル 1F)	\N	\N	https://foursquare.com/item/520453e7498eaa7f051a2d97
1061	Jomon (ジョウモン 六本木店)	36	9.5	35.66139218604258	139.73280319394547	六本木5-9-17 (藤森ビル 1F)	\N	\N	https://foursquare.com/item/525022e111d2160fb4c93639
1062	21_21 DESIGN SIGHT	36	9.5	35.667477492825796	139.73035991191864	赤坂9-7-6 (東京ミッドタウン ガーデン内)	\N	\N	https://foursquare.com/item/4e57743e6365d314184c1489
1063	TSUTAYA BOOKS (代官山 蔦屋書店)	36	9.40000000000000036	35.64905190280918	139.69973050902777	猿楽町17-5 (代官山T-SITE 蔦屋書店 1-3号館)	\N	\N	https://foursquare.com/item/4f017ed129c201c6fed78daa
1064	FUGLEN TOKYO	36	9.40000000000000036	35.66663201080257	139.69242006540298	富ヶ谷1-16-11	\N	\N	https://foursquare.com/item/4faf5f0fe4b01d7a9060d58c
1065	Meiji Jingu Shrine (明治神宮)	36	9.40000000000000036	35.67620199564515	139.69936966896057	代々木神園町1-1	\N	\N	https://foursquare.com/item/4e57740e6365d314184c1461
1066	Top of Mt. Takao (高尾山 山頂)	36	9.40000000000000036	35.62511993216723	139.24365766346455	高尾町 (高尾山)	\N	\N	https://foursquare.com/item/4b6ee39770c603bbabb991b4
1067	Inokashira Park (井の頭恩賜公園)	36	9.40000000000000036	35.699917970910036	139.57785426133182	御殿山1-18-31	\N	\N	https://foursquare.com/item/4df02c73d22d4336871680ec
1068	Gyuzo (焼肉問屋 牛蔵)	36	9.40000000000000036	35.73609834511769	139.6291183668992	貫井3-10-2	\N	\N	https://foursquare.com/item/53e5a6f2498e7cd4f411e066
1069	Tensuke (天すけ)	36	9.40000000000000036	35.705895053151664	139.64874873366043	高円寺北3-22-7 (プラザ高円寺 1F)	\N	\N	https://foursquare.com/item/56c4794d498ef80b9422a2a5
1070	Little Nap COFFEE STAND	36	9.40000000000000036	35.67212312601507	139.6906015276909	代々木5-65-4	\N	\N	https://foursquare.com/item/523f317911d2a15c3f2021b5
1071	Oniyamma (おにやんま)	36	9.40000000000000036	35.625569126355785	139.72379378282707	西五反田1-6-3	\N	\N	https://foursquare.com/item/51b4735d498e2b54b44031f6
1072	Onibus Coffee 中目黒	36	9.40000000000000036	35.6432349	139.6980934	上目黒2-14-1	\N	\N	https://foursquare.com/item/56a49003498e48f84943da8c
1073	Ramen Jiro (ラーメン二郎 ひばりヶ丘駅前店)	36	9.40000000000000036	35.74994154	139.54345155	谷戸町3-27-24 (ひばりヶ丘プラザ 1F)	\N	\N	https://foursquare.com/item/524e69e2498ea6675164c080
1074	Bar Trench	36	9.40000000000000036	35.64847030721434	139.70802811650245	恵比寿西1-5-8 (1F)	\N	\N	https://foursquare.com/item/5265fe11498ebbf99c3a7182
1075	Harajuku Gyoza Lou (原宿餃子楼)	36	9.40000000000000036	35.66753472567976	139.70619795522765	神宮前6-2-4 (岡島ビル)	\N	\N	https://foursquare.com/item/52230ad411d2b60cd9422719
1076	Tonkatsu Tonki (とんかつ とんき 目黒本店)	36	9.40000000000000036	35.633609808690444	139.71428006887436	下目黒1-1-2	\N	\N	https://foursquare.com/item/4e4b1f7a6365dbba614df103
1077	Yamabe (とんかつ 山家 上野店)	36	9.40000000000000036	35.70869064331055	139.77389526367188	上野4-5-1	\N	\N	https://foursquare.com/item/535de00111d2ba5e33884a92
1078	Tokyo Tower (東京タワー)	36	9.40000000000000036	35.65866812492017	139.74566118686639	芝公園4-2-8	\N	\N	https://foursquare.com/item/5192f208498eabb16bd4611e
1079	Nezu Museum (根津美術館)	36	9.40000000000000036	35.662230129840125	139.71706688404083	南青山6-5-1	\N	\N	https://foursquare.com/item/51e02f5b498edf2d7f3bc721
1080	Ginza Kyubey (銀座 久兵衛 銀座本店)	36	9.40000000000000036	35.66837606643376	139.76145683186596	銀座8-7-6	\N	\N	https://foursquare.com/item/4d148a5d6d103704fb2622bd
1081	Łazienki Królewskie	37	9.69999999999999929	52.21402307157453	21.03203773498535	ul. Agrykoli 1 (Al. Ujazdowskie & Szwoleżerów)	\N	\N	https://foursquare.com/item/51854110498efea86bd1ed7b
1082	Park Szczęśliwicki	37	9.5	52.20594122984681	20.96061491411133	Szczęśliwicka (Rokosowska)	\N	\N	https://foursquare.com/item/517407cfe4b04c635fc84f14
1083	SOHO Factory	37	9.5	52.249969911782976	21.061308966526493	Mińska 25	\N	\N	https://foursquare.com/item/4f894ec3e4b0b1c4af9602a7
1084	Park Skaryszewski	37	9.40000000000000036	52.24200508610695	21.055147647857666	Aleja Jerzego Waszyngtona 3	\N	\N	https://foursquare.com/item/4ef07d304690b5157462000f
1085	Pole Mokotowskie	37	9.40000000000000036	52.21013126818195	20.995173454284668	Warszawa	\N	\N	https://foursquare.com/item/4fa021f4e4b02548288bac26
1086	Stare Miasto | Old Town	37	9.40000000000000036	52.2471427616625	21.013565864531444	Warszawa	\N	\N	https://foursquare.com/item/4ef07496be7ba3ed7ba46fc6
1087	Biblioteka Uniwersytecka	37	9.40000000000000036	52.24236007526886	21.024790933431582	Dobra 56/66 (at Lipowa)	\N	\N	https://foursquare.com/item/4ef0772c29c22c6c76b09237
1088	Ogród Botaniczny BUW	37	9.40000000000000036	52.242851736136465	21.024425718729816	Dobra 56/66 (Lipowa)	\N	\N	https://foursquare.com/item/51cb2595498e275f08859594
1089	Restauracja Polska Różana	37	9.40000000000000036	52.2085109542455	21.023578587535667	Chocimska 7	\N	\N	https://foursquare.com/item/525308b011d26d1aa6c5c77f
1090	Handroll	37	9.40000000000000036	52.235387512142914	21.053595346807256	Francuska 32	\N	\N	https://foursquare.com/item/55625fec498e4d4c316e3acd
1091	Park Kępa Potocka	37	9.30000000000000071	52.27799957225221	20.990712874019074	Warszawa	\N	\N	https://foursquare.com/item/51af72f5498e0b805286e08c
1092	Park Królikarnia	37	9.30000000000000071	52.189230898923746	21.026301491089296	Puławska (Woronicza)	\N	\N	https://foursquare.com/item/4f0311a2d3e364d5ff661d6b
1093	Pałac w Wilanowie	37	9.30000000000000071	52.16511383842093	21.088585435226946	Stanisława Kostki-Potockiego 10/16	\N	\N	https://foursquare.com/item/4ef07580e5fa467841d5ec7f
1094	Plac Zamkowy	37	9.30000000000000071	52.246729966311264	21.01362614159861	Plac Zamkowy	\N	\N	https://foursquare.com/item/538fad42498ea718c15b8006
1095	Las Kabacki	37	9.30000000000000071	52.129048298692396	21.071272474270284	Warszawa	\N	\N	https://foursquare.com/item/4ffc6778e4b0a2df6264555c
1096	Curry House	37	9.30000000000000071	52.277704507751515	20.939761081124715	Żeromskiego 81 (Reymonta)	\N	\N	https://foursquare.com/item/4f787d9fe4b06336488fb48a
1097	Green Caffè Nero	37	9.30000000000000071	52.164930243343356	21.069667037051815	Al. Rzeczypospolitej 27	\N	\N	https://foursquare.com/item/575d640d498eb0bc2f0a87dd
1098	Sushi Zushi	37	9.30000000000000071	52.229046	21.018614	Żurawia 6/12	\N	\N	https://foursquare.com/item/51cc449d498ebb786e3423bb
1099	AleWino	37	9.30000000000000071	52.225206040999126	21.021797846827873	Mokotowska 48	\N	\N	https://foursquare.com/item/5129fc6fe4b03513099f186f
1100	Butchery & Wine	37	9.30000000000000071	52.228613467012785	21.015813904880844	Żurawia 22	\N	\N	https://foursquare.com/item/4d973addb188721e4bdd0937
1101	Relaks	37	9.30000000000000071	52.20253024342814	21.021808666371403	Puławska 48 (at Dąbrowskiego)	\N	\N	https://foursquare.com/item/4fd607b2e4b0aa9a73502d1b
1102	Weles Bar	37	9.19999999999999929	52.229424917838	21.018010030432897	Wejście od ul.Nowogrodzkiej 11	\N	\N	https://foursquare.com/item/552a465a498ee4388e6976e5
1103	Lodziarnia Ulica Baśniowa	37	9.19999999999999929	52.26204751687715	20.98048544553647	plac Grunwaldzki	\N	\N	https://foursquare.com/item/53821f77498e6092bfacd589
1104	Ogród Saski	37	9.19999999999999929	52.240617515366324	21.00889162444046	Marszałkowska (Królewska)	\N	\N	https://foursquare.com/item/4ef07c7eb63454a9fd91e6de
1105	Bułkę przez Bibułkę	37	9.19999999999999929	52.23260684753594	21.0137436220574	Zgoda 3	\N	\N	https://foursquare.com/item/554f3a54498ed9c28be35e68
1106	Opasły Tom	37	9.19999999999999929	52.233689909207456	21.020559122539744	ul. Foksal 17	\N	\N	https://foursquare.com/item/513220c9e4b041d1cec1f3b7
1107	BrewDog Warszawa	37	9.19999999999999929	52.23154	21.015141	ul. Widok, 8	\N	\N	https://foursquare.com/item/575569b2498efd11f9c05e18
1108	Green Caffè Nero	37	9.19999999999999929	52.23325767614568	20.99867857376394	Rondo ONZ	\N	\N	https://foursquare.com/item/58852d41809a7731c074e152
1109	Pizzeria Ciao Tutti	37	9.19999999999999929	52.21708822255329	21.004235413515076	al. Niepodległości 217	\N	\N	https://foursquare.com/item/50ec4887e4b037ada9f82e14
1110	MEZZE hummus & falafel	37	9.19999999999999929	52.20333071540097	21.02274544346397	Różana 1 (Puławska)	\N	\N	https://foursquare.com/item/56003283498e040057a506ed
1111	Sathyam Cinemas	38	9.40000000000000036	13.055687857317821	80.25809632255645	8, Thiru-vi-ka Road (Royapettah)	\N	\N	https://foursquare.com/item/4bf8e0af70c603bbe3a29cb4
1112	Escape Cinemas	38	9.19999999999999929	13.058725377915014	80.26413380533735	Express Avenue (Whites Road, Royapettah)	\N	\N	https://foursquare.com/item/50f954c7e4b0f3ee6455b8b0
1113	The Leela Palace	38	9.19999999999999929	13.017329822346978	80.27382880840328	MRC Nagar	\N	\N	https://foursquare.com/item/51bf77ca498edd0511720a0c
1114	Anna Nagar Tower Park	38	9.09999999999999964	13.086571414111077	80.21362675131819	6th & 3rd Main Rd (Anna Nagar)	\N	\N	https://foursquare.com/item/50f95eb2e4b0d191544246cf
1115	Light House	38	9.09999999999999964	13.039609885273194	80.27947425476668	Marina Beach (Triplicane)	\N	\N	https://foursquare.com/item/514babf9e4b0fa33e5b0b74d
1116	Subway	38	9.09999999999999964	13.082488866633406	80.21093038293611	AC112, Shanthi Colony (Anna Nagar)	\N	\N	https://foursquare.com/item/526a99e511d24d85864b883e
1117	Shree Mithai	38	9.09999999999999964	13.07216623109889	80.24782780359305	T.V Rd	\N	\N	https://foursquare.com/item/4ef77799490124bf9983aa13
1118	Thiruvanmiyur Beach	38	9.09999999999999964	12.980722245625548	80.26800155639648	Waterland Drive Road (Thiruvanmiyur)	\N	\N	https://foursquare.com/item/4fc1a34de4b08acaf4bba41e
1119	Fruit Shop On Greams Road	38	9.09999999999999964	13.059830557287585	80.25482654571533	11 Greams Road	\N	\N	https://foursquare.com/item/4b9e3dfc70c603bb1d8594b4
1120	Alliance Francaise	38	9	13.06669649549547	80.24570425380709	College Rd	\N	\N	https://foursquare.com/item/4ce0df060de52c0fb217a10c
1121	Sandy's Chocolate Laboratory	38	9	13.060998600015344	80.24838862966645	#16, Wallace Garden 2nd St (Nungambakkam)	\N	\N	https://foursquare.com/item/52345f0011d29538cc5ea2d3
1122	Luxe Cinemas	38	9	12.991146143801636	80.2169058559768	Phoenix Market City (Velachery)	\N	\N	https://foursquare.com/item/53499879498e7b69ab083b39
1123	Marina Beach | மெரினா கடற்கரை (Marina Beach)	38	9	13.047662900808886	80.2806979251197	Santhome High Rd (Kamaraj Salai)	\N	\N	https://foursquare.com/item/514a5cf2e4b05ed6e69a6e01
1124	DakshinaChitra	38	9	12.82292887147814	80.24200152710299	East Coast Rd., Muttukadu	\N	\N	https://foursquare.com/item/5051c665e4b08416d81fe95e
1125	Serene Sathyam	38	8.90000000000000036	13.055620295310622	80.25802010271201	India	\N	\N	https://foursquare.com/item/5259a092498e3a024c3bdc2b
1126	Ottimo Cucina Italiana, ITC Grand Chola	38	8.90000000000000036	13.010448477239114	80.22077852285983	#63 Mount Rd. (Guindy)	\N	\N	https://foursquare.com/item/513761d3e4b0b066877c5e4d
1127	Basil - With a Twist	38	8.90000000000000036	13.049546	80.242176	58A, Habibullah Road, T Nagar, Chennai, 600017	\N	\N	https://foursquare.com/item/57948994498e0eef27cc0e48
1128	Palazzo	38	8.90000000000000036	13.05029938745061	80.20947594272806	Forum Vijaya Mall (Vadapalani)	\N	\N	https://foursquare.com/item/56892554498e5a576fa23f17
1129	Fruit Shop On Greams Road	38	8.90000000000000036	13.00139723468384	80.26749261537404	3rd Ave. (Besant Nagar)	\N	\N	https://foursquare.com/item/4c81f66b309aef3b9f45c081
1130	Blur	38	8.80000000000000071	13.055333737286327	80.25794388279904	Levels 4, 5, 6,Sathyam Cinemas,8, Thiruvika Rd.	\N	\N	https://foursquare.com/item/4f476a7ce4b0a69abaeab450
1131	Besant Nagar Beach (Edward Elliot's Beach)	38	8.80000000000000071	13.000506258411747	80.27084040530782	6th Avenue, Besant Nagar (6th Avenue)	\N	\N	https://foursquare.com/item/4ea8312c49011f90219f2811
1132	Express Avenue	38	8.80000000000000071	13.058705499328816	80.26420457580393	No. 2, Club House Rd., (Mount Rd.)	\N	\N	https://foursquare.com/item/4c5d382bfff99c74b4a53fd3
1133	gabbana.life	38	8.80000000000000071	13.060752800963758	80.25076801556713	No 20b, Khader Nawaz Khan Road	\N	\N	https://foursquare.com/item/50e45489e4b01580be966ca4
1134	The Marina	38	8.69999999999999929	13.067318341841032	80.25185695710678	39 (College Road)	\N	\N	https://foursquare.com/item/52c8b7fe498e3ffb0c546179
1135	Z The Tapas Bar & Restaurant	38	8.69999999999999929	13.04571521263665	80.25809632255645	Cathedral Rd. (TTK Rd.)	\N	\N	https://foursquare.com/item/4c45b78e56a7ef3b0babce21
1136	Amethyst	38	8.69999999999999929	13.056816776366452	80.25874963269774	Royapettah (Whites Rd)	\N	\N	https://foursquare.com/item/5017cd6be4b02848f728efff
1137	Amadora Gourmet Ice Cream	38	8.69999999999999929	13.061068846184208	80.24943948795982	Wallace Garden 3Rd St, Thousand Lights, Chennai, Tamil Nadu 600006 (oppo to Tuscana on KNK)	\N	\N	https://foursquare.com/item/538985ff498e51658c86939b
1138	Bombay Brassiere	38	8.69999999999999929	13.006955096562216	80.25639224824536	Adyar	\N	\N	https://foursquare.com/item/560145a6498e768fb6ab39a7
1139	Kabab Corner	38	8.69999999999999929	13.060250445915365	80.25445947075423	Greams Rd, Thousand Lights East, Thousand Lights	\N	\N	https://foursquare.com/item/5343a429498e0a9626b49c44
1140	Little Italy Ristorante	38	8.69999999999999929	13.060889617909076	80.24726152884568	Eldorado No. 112 (Nungambakkam High Rd)	\N	\N	https://foursquare.com/item/52e67b9d11d230f52c28d635
1141	Wekalet Al-Ghouri Arts Center (وكالة السلطان الغوري)	39	9.59999999999999964	30.04567566848748	31.260884598410605	3 Mohamed Abdo St	\N	\N	https://foursquare.com/item/50d89451e4b0260d14ddbc89
1142	NOLA Cupcakes	39	9.5	30.061250969543476	31.222657983830015	12 Brazil St (26 of July St)	\N	\N	https://foursquare.com/item/4db97d281e7206c23d1e07da
1143	Pinkberry (پنكبيري)	39	9.40000000000000036	30.07346556282549	31.344516116570894	City Stars, Phase 2	\N	\N	https://foursquare.com/item/52ab3d3511d2a16d226ec634
1144	Katameya Heights Golf Resort	39	9.30000000000000071	29.99257186263911	31.40367007211638	New Cairo	\N	\N	https://foursquare.com/item/509d8111e4b044f763b38ad8
1145	Sultan Hassan Mosque (مسجد السلطان حسن)	39	9.30000000000000071	30.032340231578896	31.256290681546982	Salah Al Dine Sq.	\N	\N	https://foursquare.com/item/4f229123e4b012e02d2532fc
1146	Fairmont Nile City	39	9.30000000000000071	30.071842277035007	31.22792959213257	Nile City Towers - 2005 B, Corniche El Nil, Ramlet Boulac	\N	\N	https://foursquare.com/item/500d5682e4b0ba42c2f3c0f5
1147	Sequoia	39	9.30000000000000071	30.073313528295593	31.222512633123106	Abou Al Feda St.	\N	\N	https://foursquare.com/item/4c3240463896e21e053ae890
1148	El Moez St (شارع المعز لدين الله)	39	9.19999999999999929	30.050482085745507	31.261851421837317	Al-Mu'izz ledin Illah Street	\N	\N	https://foursquare.com/item/4fba249fe4b08ee511b28513
1149	Bayt El Suhaymi (بيت السحيمى)	39	9.19999999999999929	30.052144533649493	31.262058198071596	El Moez St.	\N	\N	https://foursquare.com/item/50456531e4b0bf160517b272
1150	Cairo Opera House (دار الأوبرا المصرية)	39	9.19999999999999929	30.043267865180223	31.22271947830607	El Gezira (Off Opera Sq.)	\N	\N	https://foursquare.com/item/4f870f21e4b039b142f6bba2
1151	Heliopolis Sporting Club (نادى هليوبوليس الرياضي)	39	9.19999999999999929	30.088689527022275	31.316399792498817	Merghany St (Ahram St)	\N	\N	https://foursquare.com/item/51c20093498eef4516759b74
1152	Zööba (زووبا)	39	9.19999999999999929	30.06122788504218	31.219225423273567	26 of July St. (btw Shagaret El Durr & El Saleh Ayoub)	\N	\N	https://foursquare.com/item/501c611ee4b04dbcf07765b7
1153	Al Azhar Mosque (الجامع الأزهر)	39	9.19999999999999929	30.045969886817048	31.262538811699812	Azhar St. (القاهرة الفاطمية)	\N	\N	https://foursquare.com/item/4e774e0e152037f9e17dd9c2
1154	Al Haakem Mosque (جامع الحاكم بامر الله)	39	9.19999999999999929	30.05452432583057	31.263617390956583	Al Moez st. (Al Muizz)	\N	\N	https://foursquare.com/item/5319c6a7498eadeb2d1c9901
1155	Naguib Mahfouz Cafe (مقهى نجيب محفوظ)	39	9.09999999999999964	30.047772219421613	31.26221626996994	Al Husain	\N	\N	https://foursquare.com/item/4f9691c0e4b087d33ee2339e
1156	Il Mulino	39	9.09999999999999964	29.969854	31.275064	7, Road 261, Maadi	\N	\N	https://foursquare.com/item/5020205ce4b0997f80697a96
1157	Diwan Bookstore (مكتبة ديوان)	39	9.09999999999999964	30.05925140815715	31.224002838134766	159 26th Of July St	\N	\N	https://foursquare.com/item/4ede787c6c2547bc676c7f9d
1158	Diwan Bookstore (مكتبة ديوان)	39	9.09999999999999964	30.09560364059631	31.341188549995422	105, Abu Bakr El Seddiq St. (Orouba)	\N	\N	https://foursquare.com/item/50f5e3e4e4b0da51c9953d8e
1159	The Platform	39	9.09999999999999964	29.974344107380006	31.234319000413976	Corniche El Maadi	\N	\N	https://foursquare.com/item/52c42ae2498e8f9bf4199f11
1160	The Saladin Citadel of Cairo (قلعة صلاح الدين)	39	9.09999999999999964	30.029360254297842	31.261730790138245	Salah Salem Rd. (Salah Salem Rd)	\N	\N	https://foursquare.com/item/50218e6ee4b018f53e1284cb
1161	Gezira Sporting Club (نادي الجزيرة الرياضي)	39	9	30.05324440403166	31.22396613215141	15 Sarayah El Gezira Street	\N	\N	https://foursquare.com/item/506ec4ede4b0748e04dd698a
1162	Bubblicious	39	9	30.065052606785844	31.21726311670449	6A Ismail Mohamed St. (Bahgat Ali)	\N	\N	https://foursquare.com/item/50845244e4b0d5064c204e10
1163	Nile City Sky Pool	39	9	30.071797288061852	31.227795457487385	Nile City Tower - 2005 B Corniche El Nil - Ramlet Beaulac	\N	\N	https://foursquare.com/item/51a0b91e498e30596387c8cd
1164	Zawya Art House Cinema (Zawya Art House Cinema | زاوية)	39	9	30.050047438553626	31.238852287188497	4 Abd El Hamid Said St. (Talaat Harb St.)	\N	\N	https://foursquare.com/item/5363cede498e537317435d81
1165	KidZania Cairo	39	9	30.031193475996897	31.4051213246491	The Ring Road, Taha Hussein St. South of The Police Academy 5th District, New Cairo	\N	\N	https://foursquare.com/item/53c908b3498e3cd402718c7f
1166	NOLA Cupcakes | نولا (نولا)	39	9	29.958720868588678	31.259532150010997	84, Rd 9 (Rd 81)	\N	\N	https://foursquare.com/item/502677d7e4b0dd4acc35f04b
1167	Khan Al-Khalili (خان الخليلي)	39	9	30.047091750692303	31.261991135548918	Islamic Cairo - Cairo, Egypt	\N	\N	https://foursquare.com/item/52de413911d22d96051dc485
1168	Cairo Jazz Club	39	9	30.061940258728466	31.211834458042194	187, 26th of July street (Sphinx Sq. Agouza)	\N	\N	https://foursquare.com/item/4ff1920ce4b0ccc7764144c7
1169	El Abd (العبد)	39	9	30.04951715469273	31.239609026230337	Talaat Harb St.	\N	\N	https://foursquare.com/item/4da32081573d145668771e7d
1170	Mori Sushi	39	9	30.057988518777446	31.217479705810547	19 El Gabalaya St.	\N	\N	https://foursquare.com/item/50fd7cd6e4b0ba414f6d5a1a
1171	Garden City Mall	40	9.09999999999999964	-1.2325161767219814	36.87878823272929	Kenya	\N	\N	https://foursquare.com/item/56482a29498e283ea804ddc3
1172	About Thyme	40	9	-1.2523998002251637	36.802942586018595	Peponi Rd	\N	\N	https://foursquare.com/item/4e4a430281dcc9223b922c1f
1173	Spur Steak Ranches	40	9	-1.263585376293131	36.807953715928655	Holiday Inn (Cnr Mpaka Rd & Parklands Rd)	\N	\N	https://foursquare.com/item/4dde6a0552b155583e010f39
1174	G Pot	40	9	-1.2918877948079988	36.791204800927105	Chaka Road	\N	\N	https://foursquare.com/item/5814a20a38fa80a1d7136d54
1175	Jaffery Sports Club	40	9	-1.2769045805821309	36.769296650191876	James Gichuru Road	\N	\N	https://foursquare.com/item/4f6c91fae4b068929ea42436
1176	Fogo Gaucho Brazilian BBQ	40	8.90000000000000036	-1.264175627239925	36.80090228049114	Waiyaki Way	\N	\N	https://foursquare.com/item/5161622ce4b0397c006cdb54
1177	Tribe The Village Market Hotel Nairobi	40	8.90000000000000036	-1.2265531114640806	36.805466597390065	The Village Market 9/418 Limuru Rd, Gigiri (Limuru Rd)	\N	\N	https://foursquare.com/item/52c9d48411d29c97fc19c9de
1178	Subway,Kenyatta Avenue	40	8.69999999999999929	-1.2845076309250982	36.82189685500619	Kenyatta Avenue	\N	\N	https://foursquare.com/item/54049305498e622f43d6b6a0
1179	Emerald Garden	40	8.69999999999999929	-1.2325966002763638	36.81223367739066	UN Ave.	\N	\N	https://foursquare.com/item/516acafa498e2c65450d6d62
1180	Karura forest	40	8.69999999999999929	-1.2405882273286093	36.81622948633925	Nairobi	\N	\N	https://foursquare.com/item/52d13f6d498e67744e0d64eb
1181	Asmara Bar & Restaurant	40	8.69999999999999929	-1.2695869758488731	36.83955333266895	Juja Rd	\N	\N	https://foursquare.com/item/4daaf400a86e771ea72e62e2
1182	Zen Garden	40	8.69999999999999929	-1.2444613558861075	36.76965438634423	Lower Kabete Road (lower kabete road)	\N	\N	https://foursquare.com/item/508d0efbe4b0a533e1b693b4
1183	The Hub	40	8.59999999999999964	-1.3201708933719096	36.703828203614044	Langata Road	\N	\N	https://foursquare.com/item/5878a19dfd2716635bee9ad8
1184	Art Caffe, The Oval	40	8.59999999999999964	-1.258745713941978	36.80544030604926	Ring Road Parklands (Jalaram Rd)	\N	\N	https://foursquare.com/item/5336addb498e513bed02774c
1185	KFC Mombasa Road	40	8.59999999999999964	-1.3260809851457618	36.84992762929256	Nairobi	\N	\N	https://foursquare.com/item/56f90fb6cd10791a2184e9e5
1186	Sankara Rooftop Bar	40	8.59999999999999964	-1.262150475639255	36.80235363762817	05 woodvale grove. Westlands (Woodvale Grove)	\N	\N	https://foursquare.com/item/4e5d46e918a8463c4d9530f8
1187	Nairobi Giraffe Centre	40	8.59999999999999964	-1.3761305772521952	36.746113300323486	P.O. Box 15124 - 00509	\N	\N	https://foursquare.com/item/519b1670498eb6c19699b4b5
1188	3D Restaurant	40	8.59999999999999964	-1.2985845737169361	36.77924948779896	Elgeyo Marakwet Road (100M from Adams Arcade Round About)	\N	\N	https://foursquare.com/item/56d534be498e6258ede96d48
1189	Ocean Basket @The Oval	40	8.59999999999999964	-1.2587169941962708	36.80553495483237	Ring Road Parklands	\N	\N	https://foursquare.com/item/56f1e306498e8880d165fcd1
1190	Sno-Cream (Kenya House)	40	8.59999999999999964	-1.2817211424932935	36.817422929446046	Koinange Street (Koinange Street)	\N	\N	https://foursquare.com/item/511f80dce4b0b9b4fe6f0880
1191	Osteria del Chianti	40	8.59999999999999964	-1.2889006455945644	36.78997411877439	Btw Lenana Rd & Nyangum Ave	\N	\N	https://foursquare.com/item/4de7e36b45dda9e8a3376282
1192	For You	40	8.59999999999999964	-1.2901948214799936	36.774346882956394	Gitanga Road (Ole odume Road)	\N	\N	https://foursquare.com/item/4f3b9641e4b08082ae489f93
1193	Carnivore	40	8.5	-1.3292071271802626	36.80102322800771	Langata Road	\N	\N	https://foursquare.com/item/4de12bf8b0fbe2cfa618f65e
1194	The Juniper Social	40	8.5	-1.260071845600193	36.78448839333439	Kenya	\N	\N	https://foursquare.com/item/5650cecd498ece9f5a80eb72
1195	IMAX XX Century - 20th Century	40	8.5	-1.2855345391839474	36.82263810203361	Mama Ngina Street (Mama Ngina St.)	\N	\N	https://foursquare.com/item/51d2bb34498e5252348c379f
1196	Java House Upperhill	40	8.5	-1.2982208982063652	36.81144500534159	Mara Road	\N	\N	https://foursquare.com/item/516564ace4b0cdde2c94a2d9
1197	The David Sheldrick Wildlife Trust	40	8.5	-1.3769004256450799	36.773284258418244	Magadi Road	\N	\N	https://foursquare.com/item/536f768b498ece4982720ba0
1198	Westgate Shopping Mall	40	8.5	-1.2573117351331624	36.80308982238289	Mwanzi Rd (Off Ring Rd)	\N	\N	https://foursquare.com/item/4c023ff370c603bb769a9db4
1199	Brew Bistro	40	8.5	-1.299236518847768	36.765403747558594	Piedmont Plaza , 671 Ngong Road (Opp. K.S.T.C)	\N	\N	https://foursquare.com/item/4e5e21d0d4c08cf7f588921d
1200	Big Square	40	8.5	-1.3227852084428495	36.70767190419943	Karen (Off Langata Rd.)	\N	\N	https://foursquare.com/item/530c67e4498e95ae1d944af1
1201	Piazza del Duomo	41	9.5	45.46419037150217	9.189527034759521	Piazza del Duomo	\N	\N	https://foursquare.com/item/505c8cfce4b047526271a132
1202	Parco Sempione	41	9.5	45.47323372707457	9.175860897761977	Parco Sempione	\N	\N	https://foursquare.com/item/4bf9157970c603bbc5a69cb4
1203	Villa Necchi Campiglio	41	9.5	45.46833861408376	9.201631213017587	Via Mozart 14	\N	\N	https://foursquare.com/item/4ddceef0cc3f0f51d1d7f374
1204	Galleria Vittorio Emanuele II	41	9.5	45.46551343498854	9.19000832250743	Piazza Del Duomo	\N	\N	https://foursquare.com/item/4bebcc4470c603bbc94d9bb4
1205	Ostello Bello	41	9.40000000000000036	45.46085264926285	9.181219047676874	Via Medici 4	\N	\N	https://foursquare.com/item/50e4a6b4e4b05b3db8e15080
1206	Piazza Gae Aulenti	41	9.40000000000000036	45.48371322128777	9.189663867627216	Piazza Gae Aulenti, 1	\N	\N	https://foursquare.com/item/522b5b68498e5a056c511729
1207	Temakinho Brera	41	9.40000000000000036	45.474675239939515	9.183306849660843	Corso Garibaldi, 59	\N	\N	https://foursquare.com/item/51eb8ca8498e899940e4e8e3
1208	La Gelateria della Musica	41	9.40000000000000036	45.446615	9.155093	Via Pestalozzi, 4	\N	\N	https://foursquare.com/item/4fb56521e4b08a63576d89fe
1209	Palazzo Reale	41	9.40000000000000036	45.46288600140357	9.191428481482584	Piazza del Duomo 12	\N	\N	https://foursquare.com/item/4bebcfb870c603bb104e9bb4
1210	Ceresio 7 Pools & Restaurant	41	9.40000000000000036	45.483924468605245	9.180045921467912	Via Ceresio, 7	\N	\N	https://foursquare.com/item/524a6823498e78b2cefb9974
1211	Dolce&Gabbana	41	9.40000000000000036	45.46788610623695	9.19846157971343	Corso Venezia, 15	\N	\N	https://foursquare.com/item/587d26b0ca10706e67fe5a4b
1212	Castello Sforzesco	41	9.30000000000000071	45.46954541745923	9.180423646008808	Piazza Castello, 3	\N	\N	https://foursquare.com/item/50194461e4b0974ccfd29d68
1213	Louis Vuitton	41	9.30000000000000071	45.467115614076015	9.196526417818413	Via Montenapoleone, 2	\N	\N	https://foursquare.com/item/534968db11d21c8aa77115e8
1214	Giardini Indro Montanelli	41	9.30000000000000071	45.474407246592456	9.200103438151187	Corso Porta Venezia (Via Palestro)	\N	\N	https://foursquare.com/item/4ec229760cd6d2a16f9431e3
1215	Pavè	41	9.30000000000000071	45.479076067808386	9.20278787612915	Via Felice Casati 27	\N	\N	https://foursquare.com/item/4fb5f964e4b0467a1d64ac6f
1216	Pizza Am	41	9.30000000000000071	45.45552783113018	9.196826418174808	Corso di Porta Romana, 83	\N	\N	https://foursquare.com/item/52b4a393498ed984502a848b
1217	Terrazze del Duomo	41	9.30000000000000071	45.464214764709915	9.191797483565292	Duomo di Milano (Piazza Duomo, 18)	\N	\N	https://foursquare.com/item/4ec664ff4690116a8ac3f5fd
1218	Hangar Bicocca	41	9.30000000000000071	45.52096484042963	9.21912300490383	Via Privata Chiese, 2	\N	\N	https://foursquare.com/item/4e9b0064775b2c05ae0a9b94
1219	El Porteño	41	9.30000000000000071	45.452703	9.184406	Viale Gian Galeazzo 25	\N	\N	https://foursquare.com/item/4dc810ee18387d1bd57e3b67
1220	Piccolo Teatro Strehler	41	9.30000000000000071	45.47204046155733	9.182545240103906	Largo Antonio Greppi, 1	\N	\N	https://foursquare.com/item/50b22b2ee4b0fca7e96a003a
1221	Arco della Pace	41	9.30000000000000071	45.47572835143987	9.172446727752686	Piazza Sempione	\N	\N	https://foursquare.com/item/4c9c98f319fb9c7445891c5e
1222	Cimitero Monumentale	41	9.30000000000000071	45.48533695765722	9.179249720330828	Piazzale Cimitero Monumentale	\N	\N	https://foursquare.com/item/4e590f87b993732579e29c4a
1223	La Triennale di Milano	41	9.30000000000000071	45.4722426198106	9.173506680837344	Viale Emilio Alemagna 6	\N	\N	https://foursquare.com/item/4da607afb94e82acad7c2a0a
1224	Gucci	41	9.30000000000000071	45.467910272590245	9.1955143728104	Via Montenapoleone 5-7	\N	\N	https://foursquare.com/item/4d38448eb8d5a0903667ff1f
1225	Antica Osteria il Ronchettino	41	9.30000000000000071	45.40444717943721	9.174031800926223	Via Lelio Basso 9	\N	\N	https://foursquare.com/item/50b9e3e8e4b06d86d960df2e
1226	Langosteria 10 Bistrot & Bottega	41	9.30000000000000071	45.4555661699644	9.171582996605142	Via Privata Bobbio, 2	\N	\N	https://foursquare.com/item/522f841511d2afe047e583fc
1227	Dolce&Gabbana Martini Bar	41	9.30000000000000071	45.46838197811214	9.198548342841043	Corso Venezia 15	\N	\N	https://foursquare.com/item/4d5a32509b302d4337d52934
1228	Iyo	41	9.30000000000000071	45.48673369126891	9.159765243530273	Via Piero della Francesca 74 (Via Biondi)	\N	\N	https://foursquare.com/item/4bc2087170c603bbb68197b4
1229	Gallerie d'Italia	41	9.30000000000000071	45.46730619570427	9.190381032339165	Piazza della Scala, 6 (Via Manzoni, 2)	\N	\N	https://foursquare.com/item/5129e63be4b03a5323cd9a91
1230	Musei Castello Sforzesco	41	9.30000000000000071	45.47051254094319	9.179648599351927	Piazza Castello, 3	\N	\N	https://foursquare.com/item/4e5546ce7d8b47a8d26e4b00
1231	Golden Gate Park	42	9.69999999999999929	37.76878957103581	-122.4819052219391	501 Stanyan St (btwn Fulton St & Lincoln Way)	\N	\N	https://foursquare.com/item/512520dce4b07a4d99d469ec
1232	Lands End	42	9.69999999999999929	37.78315503056424	-122.51118555665016	El Camino Del Mar (at Point Lobos Ave)	\N	\N	https://foursquare.com/item/4dd54524b3adf8876d22066a
1233	Flora Grubb Gardens	42	9.69999999999999929	37.73961925	-122.39023187	1634 Jerrold Ave	\N	\N	https://foursquare.com/item/50d11dcde4b01474e0c84488
1234	Neighbor Bakehouse	42	9.69999999999999929	37.759746	-122.38823	2343 3rd St (at 20th St)	\N	\N	https://foursquare.com/item/5512f334498e4a0186f5b0aa
1235	Twin Peaks Summit	42	9.69999999999999929	37.754571271323236	-122.44711362168285	100 Christmas Tree Point Rd	\N	\N	https://foursquare.com/item/4ee235060e61689f53b80baf
1236	Bernal Heights Park	42	9.69999999999999929	37.74326497795579	-122.41495681987165	10 Bernal Heights Blvd (at Anderson St)	\N	\N	https://foursquare.com/item/554bc2d8498e9fd13b47fbe6
1237	Lands End Lookout	42	9.69999999999999929	37.7800419794306	-122.51151363121903	22 Merrie Way (at Point Lobos Ave)	\N	\N	https://foursquare.com/item/52deec3311d2b85aa18f3ec6
1238	Green Apple Books	42	9.59999999999999964	37.782960004647364	-122.46485710144043	506 Clement St (btwn 6th & 7th Ave.)	\N	\N	https://foursquare.com/item/4d8cc70e62f1dcb325c26912
1239	Presidio of San Francisco	42	9.59999999999999964	37.79642406344077	-122.46150970458984	Golden Gate National Recreation Area	\N	\N	https://foursquare.com/item/4ebab0afc2ee8d9019815f40
1240	Crissy Field	42	9.59999999999999964	37.805558685723746	-122.46099080942564	1199 East Beach (Golden Gate National Recreation Area)	\N	\N	https://foursquare.com/item/4e5eb8a581dc82bf11cc579a
1241	Good Vibrations	42	9.59999999999999964	37.763086	-122.421665	603 Valencia St (at 17th St)	\N	\N	https://foursquare.com/item/4dd5513db3adf8876d224daa
1242	Palace of Fine Arts	42	9.59999999999999964	37.80288814426483	-122.44841247797011	3301 Lyon St (btwn Bay & Jefferson St)	\N	\N	https://foursquare.com/item/5226201411d251d99e9c2792
1243	The Olympic Club	42	9.59999999999999964	37.78810265888637	-122.41105198708772	524 Post St (at Taylor St)	\N	\N	https://foursquare.com/item/4b8d8f8370c603bbce6993b4
1244	Golden Gate Overlook	42	9.59999999999999964	37.80410459983463	-122.47678756713866	Lincoln Blvd & Merchant Rd (Presidio of San Francisco)	\N	\N	https://foursquare.com/item/4ff39b29e4b01ead00ad0d26
1245	K&L Wine Merchants	42	9.5	37.77963176565572	-122.40074157714844	855 Harrison St (btwn 4th and 5th St)	\N	\N	https://foursquare.com/item/51739cafe4b0cb9cbc0e0b41
1246	Mission Cliffs	42	9.5	37.76078380755669	-122.412539822924	2295 Harrison St (at 19th St)	\N	\N	https://foursquare.com/item/51c22e57498e965129c2bf30
1247	Mission Dolores Park	42	9.5	37.759248086750034	-122.42685847400037	Dolores St (btwn 18th & 20th St)	\N	\N	https://foursquare.com/item/4e3eb3c72271d21e870667de
1248	Kokkari Estiatorio	42	9.5	37.79693592834394	-122.39975702239228	200 Jackson St (at Front St)	\N	\N	https://foursquare.com/item/4e4aad54636576bfab294615
1249	Dog Eared Books	42	9.5	37.75850137297435	-122.42142677307129	900 Valencia St (at 20th St)	\N	\N	https://foursquare.com/item/4ca0d304604c76b0248c977b
1250	California Academy of Sciences	42	9.5	37.76982548539413	-122.46624265135708	55 Music Concourse Dr (at Martin Luther King Jr Dr)	\N	\N	https://foursquare.com/item/4cfeaf0c2c6459410f80464a
1251	Baker Beach	42	9.5	37.79154574416933	-122.48357738463181	1504 Pershing Dr (at Lincoln Blvd)	\N	\N	https://foursquare.com/item/4d796118b5222d433ba70f2c
1252	Haus of Hipstamatic	42	9.5	37.776574526831226	-122.40893358224552	74 Langton St (btwn Folsom & Howard, 7th and 8th)	\N	\N	https://foursquare.com/item/5109b7efe4b0b12f3467f81e
1253	Ferry Building (Ferry Building Marketplace)	42	9.5	37.79541372002993	-122.39354482797171	1 Ferry Building (at The Embarcadero)	\N	\N	https://foursquare.com/item/4b60ad0a70c603bb11f490b4
1254	Ocean Beach	42	9.5	37.76806118678047	-122.51056320347324	Point Lobos Ave (at Great Hwy)	\N	\N	https://foursquare.com/item/52354e4411d23a55abfe02f2
1255	Vive La Tarte	42	9.5	37.777089059825975	-122.4109966767992	1160 Howard St (at 8th St)	\N	\N	https://foursquare.com/item/555e42d7498ef6dbf536c102
1256	Glen Canyon Park	42	9.5	37.73736184098628	-122.44080469835735	Glen Canyon Park (at O'Shaughnessy Blvd)	\N	\N	https://foursquare.com/item/4ea778cd2c5b8e25be171e8d
1257	Mollusk Surf Shop	42	9.5	37.762307	-122.506217	4500 Irving St (at 46th Ave)	\N	\N	https://foursquare.com/item/51100411e4b077917d6c733b
1258	Castro Theatre	42	9.5	37.761991717624404	-122.43496924638747	429 Castro St (btwn 18th & Market)	\N	\N	https://foursquare.com/item/4db9d51d0f2c919d3959b553
1259	Lafayette Park	42	9.5	37.791246594951375	-122.42808063995858	2000 Sacramento St (at Gough St)	\N	\N	https://foursquare.com/item/4bd528a870c603bb5b4199b4
1260	Fort Funston	42	9.5	37.714986930252145	-122.50263342459404	500 Skyline Blvd (at John Muir Dr)	\N	\N	https://foursquare.com/item/4dd54762b3adf8876d2213aa
1261	El Ateneo Grand Splendid	43	9.5	-34.59636250384755	-58.39427387172241	Av. Santa Fe 1860 (e/ Av. Callao & Riobamba)	\N	\N	https://foursquare.com/item/4bdf6c9270c603bb1f309ab4
1262	El Rosedal	43	9.5	-34.57154406030677	-58.41763393925991	Av. Infanta Isabel (e/ Av. Iraola y Av. Pres. Pedro Montt)	\N	\N	https://foursquare.com/item/5175edede4b06f7377cb602a
1263	Teatro Colón	43	9.40000000000000036	-34.601389925767236	-58.3833589203373	Cerrito 628 (e/ Juan José Viamonte y Tucumán)	\N	\N	https://foursquare.com/item/4e2072576365a09600e4362c
1264	Chori	43	9.40000000000000036	-34.587774	-58.430502	Thames 1653 (esq. Santa Rosa)	\N	\N	https://foursquare.com/item/58666d5413c223497955a2bd
1265	Elena Restaurante	43	9.30000000000000071	-34.59068251376443	-58.3826994895935	Four Seasons	\N	\N	https://foursquare.com/item/543f3e3e11d2907492dcc907
1266	Rapa Nui	43	9.30000000000000071	-34.5721358529439	-58.45896043773002	Av. Elcano 3127 (esq. Gral. Ramón Freire)	\N	\N	https://foursquare.com/item/55f5fbfd498e90732b856aad
1267	Cosi Mi Piace	43	9.30000000000000071	-34.59006	-58.426357	El Salvador 4618 (esq. Malabia)	\N	\N	https://foursquare.com/item/570bb513498e8d1c1f4858d9
1268	Rapanui	43	9.30000000000000071	-34.594149667608924	-58.3996286543378	Arenales 2302 (esq. Azcuénaga)	\N	\N	https://foursquare.com/item/4fe23117e4b0dd0925003bf7
1269	El Burladero	43	9.30000000000000071	-34.59144570910577	-58.39688158034865	Pte. José E. Uriburu 1488 (Peña)	\N	\N	https://foursquare.com/item/51ef6523498e01dfa3f918b6
1270	Museo de Arte Latinoamericano de Buenos Aires (MALBA)	43	9.30000000000000071	-34.577079680370225	-58.403674364089966	Av. Figueroa Alcorta 3415 (e/ Jerónimo Salguero y San Martín de Tours)	\N	\N	https://foursquare.com/item/4e73bea81fc7c4fd880eb561
1271	La Calle Bar	43	9.30000000000000071	-34.59128260385462	-58.43317839431157	Niceto Vega 4942 (Serrano y Gurruchaga)	\N	\N	https://foursquare.com/item/57a648ae498e95e96fcb9f2b
1272	Circuito El Rosedal - Pista de entrenamiento	43	9.19999999999999929	-34.57304102418563	-58.420632310246745	Av. Dorrego (Av. Infanta Isabel)	\N	\N	https://foursquare.com/item/535bdc4b498e0e59106a10ce
1273	Museo Nacional de Bellas Artes (MNBA) (Museo Nacional de Bellas Artes)	43	9.19999999999999929	-34.58433273501481	-58.39283074244899	Av. del Libertador 1473 (e/ Av. Pueyrredón y Austria)	\N	\N	https://foursquare.com/item/4df28cc51520a5483e6b8fd3
1274	Florería Atlántico	43	9.19999999999999929	-34.59154722714978	-58.3796428388492	Arroyo 872 (Suipacha)	\N	\N	https://foursquare.com/item/5438de81498ea93e103ad2d8
1275	El Cuartito	43	9.19999999999999929	-34.597849431235545	-58.385570798696016	Talcahuano 937 (e/ Paraguay y Marcelo T. de Alvear)	\N	\N	https://foursquare.com/item/4ccb0531e10876b0d6375688
1276	Sarkis	43	9.19999999999999929	-34.591415590249305	-58.436161279678345	Thames 1101 (esq. Jufré)	\N	\N	https://foursquare.com/item/4c8ee5d0daa93704abb050b1
1277	CELCIT	43	9.19999999999999929	-34.61138281199908	-58.37246417999267	Moreno 431 (Defensa)	\N	\N	https://foursquare.com/item/4ccd3636c566199cfdb0c88c
1278	Boûlan	43	9.19999999999999929	-34.57316444864016	-58.422443632056606	Sinclair 3196	\N	\N	https://foursquare.com/item/57de1fc3498e93e6babe9cd4
1279	Libros del Pasaje	43	9.19999999999999929	-34.58693822	-58.42966	Thames 1762 (esq. Russel)	\N	\N	https://foursquare.com/item/524c90ce498e1b0afd47e2da
1280	Parrilla Don Julio	43	9.19999999999999929	-34.586318	-58.424416	Guatemala 4691 (esq. Gurruchaga)	\N	\N	https://foursquare.com/item/526348b811d2b06b452dd7f8
1281	NEGRO. Cueva de café	43	9.19999999999999929	-34.60098673015061	-58.37967626632635	Suipacha 637 (esq. Viamonte)	\N	\N	https://foursquare.com/item/55959f50498e80daeb6f077b
1282	Rapa Nui	43	9.19999999999999929	-34.627801	-58.448776	Pedro Goyena 1515 (esq. Miró)	\N	\N	https://foursquare.com/item/56ec375a498e6146affe8328
1283	Happening	43	9.19999999999999929	-34.54391919113309	-58.43307249089246	Av. Rafael Obligado Costanera 7030 (La Pampa)	\N	\N	https://foursquare.com/item/52e40b89498ec25546fc25fa
1284	Tancat	43	9.09999999999999964	-34.597658017320036	-58.37627	Paraguay 645 (e/Florida y Maipú)	\N	\N	https://foursquare.com/item/4bc5f66570c603bb01d397b4
1285	Tufic Helados	43	9.09999999999999964	-34.58705381806884	-58.42350257198527	Guatemala 4597 (esq. Armenia)	\N	\N	https://foursquare.com/item/501d68b9e4b09ed244c9461b
1286	Cachita	43	9.09999999999999964	-34.555037613783945	-58.46719519293203	Moldes 3102 (esquina Ibera)	\N	\N	https://foursquare.com/item/55a27b3f498e7a7c3454764e
1287	Rapa Nui	43	9.09999999999999964	-34.593143335225946	-58.387509709869036	Uruguay 1274	\N	\N	https://foursquare.com/item/58665e7013c22349794016a1
1288	Bien de Bien	43	9.09999999999999964	-34.59222301723547	-58.50083169774128	Helguera 4102 (esq. Av. Salvador María del Carril)	\N	\N	https://foursquare.com/item/51eaded7498ec4ccf97f143e
1289	Roux	43	9.09999999999999964	-34.5905870823032	-58.39744436292078	Peña 2300 (Azcuenaga)	\N	\N	https://foursquare.com/item/5464a5ee498e500758ac0023
1290	The New Brighton	43	9.09999999999999964	-34.604481496891985	-58.375960305408206	Sarmiento 645 (esq. Maipú)	\N	\N	https://foursquare.com/item/562565a4498e56f966e87cb1
1291	Isola di Burano	44	9.5	45.48543575414882	12.417513436409754	Burano	\N	\N	https://foursquare.com/item/519e14cd498e63cfe816ec0f
1292	Al Bottegon	44	9.5	45.430947722346765	12.326553611810041	Dorsoduro 2104	\N	\N	https://foursquare.com/item/4e6232cdaeb7360314ccbb0e
1293	Libreria Acqua Alta	44	9.40000000000000036	45.43790867766161	12.342229120647332	Castello 5167 (Calle Longa S. Maria Formosa)	\N	\N	https://foursquare.com/item/53f47216498e533ebff652fe
1294	Piazza San Marco	44	9.40000000000000036	45.43423207965384	12.338721864397442	Piazza San Marco	\N	\N	https://foursquare.com/item/50c46a6ce4b0794e9a6b5988
1295	Bacareto da Lele	44	9.40000000000000036	45.437651193663584	12.321275817034273	Fondamenta Tolentini	\N	\N	https://foursquare.com/item/5040f78ce4b0591b226cfbb6
1296	Palazzo Ducale	44	9.40000000000000036	45.43383192564214	12.340285882505288	Piazza San Marco	\N	\N	https://foursquare.com/item/4bbaf53b70c603bb9fe696b4
1297	Dal Moro‘s	44	9.30000000000000071	45.43616322515624	12.339794933795929	Calle de la Casseleria, 5324 (Calle de la Passion)	\N	\N	https://foursquare.com/item/50ca6384e4b044ef590cfb02
1298	Basilica di Santa Maria della Salute	44	9.30000000000000071	45.43099550746958	12.334634931410857	Campo della Salute (Dorsoduro 1)	\N	\N	https://foursquare.com/item/4bbafcec70c603bbefe696b4
1299	Collezione Peggy Guggenheim	44	9.30000000000000071	45.430545708404416	12.33166999093952	Dorsoduro 701	\N	\N	https://foursquare.com/item/4bbaeddf70c603bb34e696b4
1300	Campanile Di San Marco	44	9.30000000000000071	45.434012	12.339052	Piazza San Marco	\N	\N	https://foursquare.com/item/4bbaffe070c603bb0fe796b4
1301	La Dispensa Del Forte	44	9.30000000000000071	45.47611203239544	12.261514663696289	via Forte Marghera, 30 (Forte Marghera)	\N	\N	https://foursquare.com/item/50780be7e4b047ff2af0db29
1302	Giardini della Biennale	44	9.30000000000000071	45.429057791975424	12.357344627380371	Venezia Veneto	\N	\N	https://foursquare.com/item/4dfb6a63814dec2320a34ad0
1303	I Tre Mercanti	44	9.19999999999999929	45.43627615197136	12.339341640472412	Castello, 5364 (btw Campo della guerra)	\N	\N	https://foursquare.com/item/54f633ea498e0be2a88f763b
1304	Bigoi venezia	44	9.19999999999999929	45.43564439949248	12.325825102975983	Dorsoduro 3829 san pantalon	\N	\N	https://foursquare.com/item/5606cbef498e858cc61ea848
1305	Basilica di San Marco	44	9.19999999999999929	45.434508821408464	12.339920997619629	Calle Canonica (San Marco 328)	\N	\N	https://foursquare.com/item/4e8454c5d5fb77e2a81d74e1
1306	Punta Della Dogana	44	9.09999999999999964	45.43093482047838	12.336108225259082	Venezia Veneto	\N	\N	https://foursquare.com/item/4da1b1b363b5a35df965ed19
1307	Teatro La Fenice	44	9.09999999999999964	45.43377487546317	12.333933879536364	Campo San Fantin 1965	\N	\N	https://foursquare.com/item/4d381fbf2a7b594117fcfc47
1308	SuSo	44	9.09999999999999964	45.43769978960398	12.337342848135513	Sestiere San Marco, 5453/A	\N	\N	https://foursquare.com/item/533085b411d25a7984f55e4b
1309	Arsenale di Venezia	44	9.09999999999999964	45.43466371830822	12.3500399563326	Campiello dell'Arsenale	\N	\N	https://foursquare.com/item/51e661f2498efc97bfbf1268
1310	Cantina Do Spade	44	9.09999999999999964	45.43930978291447	12.333302564077515	San Polo 860 (Calle delle Do Spade, 19)	\N	\N	https://foursquare.com/item/4d6bc94ac27aa35da9d40512
1311	Giardini di Castello Venezia	44	9.09999999999999964	45.432034740545525	12.354805364079283	Venezia Veneto	\N	\N	https://foursquare.com/item/4e663258c65b2dc8a133c9d9
1312	La Bottega Ai Promessi Sposi	44	9	45.44072867409806	12.33601532606244	Sestiere Cannaregio, 4367 (Calle dell'Oca)	\N	\N	https://foursquare.com/item/5197cd04498e5d44cc0738bf
1313	Bacaro Da Fiore	44	9	45.43381995249172	12.330448248010178	San Marco 3450	\N	\N	https://foursquare.com/item/4fe64c85e4b0d55eff300366
1314	Laguna di Venezia	44	9	45.42630811582829	12.362697926556292	Venezia Veneto	\N	\N	https://foursquare.com/item/520fdff211d25708989b0a43
1315	La Biennale di Venezia	44	9	45.429239327137225	12.35811298543204	Venezia Veneto	\N	\N	https://foursquare.com/item/527174cd11d23594e59dbcab
1316	Pasticceria Tonolo	44	9	45.43592607810892	12.325184941291809	Dorsoduro 3764 (Crosera)	\N	\N	https://foursquare.com/item/5417758c498e30f1704d2649
1317	Casa dei Tre Oci	44	9	45.42674670717393	12.338216348359076	Venezia Veneto	\N	\N	https://foursquare.com/item/534967e8498e19613d25677d
1318	Osteria all'Arco	44	9	45.438837160529495	12.334180803950801	Sestiere San Polo, 436 (Calle dell'Occhialer)	\N	\N	https://foursquare.com/item/51c31122498e3c1e4acb7b03
1319	Campo San Polo	44	9	45.43736057476222	12.330169372824574	Campo San Polo	\N	\N	https://foursquare.com/item/4f3e7223e4b0a3644e3e2097
1320	La Zucca	44	9	45.44072365947566	12.328334137493195	Santa Croce 1762	\N	\N	https://foursquare.com/item/4dda08651f6ee14683616acf
1321	Frederiksberg Have	45	9.69999999999999929	55.67459587081172	12.52565860748291	Frederiksberg Runddel 1A (btwn Søndre Fasanvej & Pile Allé)	\N	\N	https://foursquare.com/item/4ddf813dcc3fe78cb3179b1f
1322	Ved Stranden 10 - Vinhandel & Bar	45	9.59999999999999964	55.67714265066378	12.581525418809331	Ved Stranden 10	\N	\N	https://foursquare.com/item/4e2d92b46284b96d7b906341
1323	Torvehallerne	45	9.5	55.68384351787219	12.569834950329765	Frederiksborggade (Rømersgade og Linnésgade)	\N	\N	https://foursquare.com/item/4fe58f3ae4b050ddde33b024
1324	Kihoskh	45	9.5	55.66638377174744	12.552628219127655	Sønder Blvd. 53	\N	\N	https://foursquare.com/item/4bd7154270c603bb7b6c99b4
1325	Amager Strandpark	45	9.5	55.65666574906402	12.637903964685075	Amager Strandvej (Amager Strand)	\N	\N	https://foursquare.com/item/4fc8fc2ae4b03938347e2da7
1326	Koncerthuset	45	9.5	55.65802166379129	12.588894367218018	Emil Holms Kanal 20 (DR Byen)	\N	\N	https://foursquare.com/item/4f3d5b12e4b0a92483049436
1327	Landbohøjskolens Have	45	9.5	55.68098624238777	12.541841679418345	Grønnegårdsvej 15 (Thorvaldsensvej)	\N	\N	https://foursquare.com/item/4f243e91e4b0d609c654f362
1328	Empire Bio	45	9.5	55.691929	12.556017	Guldbergsgade 29 F	\N	\N	https://foursquare.com/item/4c9e381d542b224b12d0f19f
1329	Noma	45	9.40000000000000036	55.677743208714055	12.596321403980255	Strandgade 93 (Nordatlantens brygge)	\N	\N	https://foursquare.com/item/4e3ab673091a8068d76094ac
1330	Mikkeller Bar	45	9.40000000000000036	55.67205	12.557593	Viktoriagade 8 B-C	\N	\N	https://foursquare.com/item/50e72f15e4b0470998c5d414
1331	Det Kongelige Bibliotek - Den Sorte Diamant	45	9.40000000000000036	55.673279212051106	12.582298130769733	Søren Kierkegaards Plads 1	\N	\N	https://foursquare.com/item/4f6b5c18e4b07199a9338459
1332	Ismageriet	45	9.40000000000000036	55.63349962234497	12.58782148361206	Kongelundsvej 116	\N	\N	https://foursquare.com/item/4c3b6893d94dc9b6b2c5ffe7
1333	The Coffee Collective	45	9.40000000000000036	55.68367074921025	12.569702722606271	Linnesgade 17, Stade C1 og D1 (Torvehallerne)	\N	\N	https://foursquare.com/item/5200ea9e498e2b39e1e7eda0
1334	Höst	45	9.40000000000000036	55.683237116502596	12.566059545475929	Nørre Farimagsgade 41 (Ahlefeldtsgade)	\N	\N	https://foursquare.com/item/50d178cbe4b01341b5ec144a
1335	Det Kongelige Teater	45	9.40000000000000036	55.679741525931746	12.586000481728206	Kongens Nytorv 9	\N	\N	https://foursquare.com/item/53fa14f811d2c163d301acda
1336	Dyrehaven	45	9.40000000000000036	55.7769738957869	12.577115389689185	Jægersborg Dyrehave	\N	\N	https://foursquare.com/item/52d5537f11d2cb5bd3de976d
1337	Kongens Have	45	9.40000000000000036	55.68436102531068	12.580098631672168	Gothersgade	\N	\N	https://foursquare.com/item/4f243df3e4b03bdcfc9e6545
1338	Fermentoren	45	9.40000000000000036	55.667967	12.556168	Halmtorvet 29	\N	\N	https://foursquare.com/item/50e979e1e4b0b2f934b543ed
1339	Ørsted Ølbar	45	9.30000000000000071	55.681229025264145	12.564546852910365	Nørre Farimagsgade 13 (Turesensgade)	\N	\N	https://foursquare.com/item/4e42bae418a8f06e90d0fd03
1340	Botanisk Have (Botanical Garden) (Botanisk Have)	45	9.30000000000000071	55.68616904012055	12.573246129512716	Øster Farimagsgade 2B	\N	\N	https://foursquare.com/item/4f243b90e4b0020c2e8e6e64
1341	ROAST Coffee	45	9.30000000000000071	55.66824295191281	12.579710483551025	Vestmannagade 4	\N	\N	https://foursquare.com/item/57c5e973498e4bca8178e830
1342	Østre Gasværk Teater	45	9.30000000000000071	55.70995	12.58197	Nyborggade 17	\N	\N	https://foursquare.com/item/5857db018cfe5402b3f64bfb
1343	MAD & KAFFE	45	9.30000000000000071	55.66591977428593	12.550350110392245	Sønder Boulevard 68	\N	\N	https://foursquare.com/item/55c71708498e5f62a96ae653
1344	The Coffee Collective	45	9.30000000000000071	55.687030049020436	12.533209539776923	Godthåbsvej 34B	\N	\N	https://foursquare.com/item/51f538ea498ed2c2ea28aefe
1345	Ruby	45	9.30000000000000071	55.676630485439354	12.576860818299727	Nybrogade 10, st.	\N	\N	https://foursquare.com/item/4b5867e970c603bba58c90b4
1346	Juul's Vin og Spiritus	45	9.30000000000000071	55.674199	12.549893	Værnedamsvej 15	\N	\N	https://foursquare.com/item/5214481811d29adf5dabc6a3
1347	HAY House	45	9.30000000000000071	55.678926	12.579948	Østergade 61 (Amagertorv)	\N	\N	https://foursquare.com/item/53f7bc93498ee05ba8800e61
1348	Bastard Café	45	9.30000000000000071	55.676475622539314	12.574946876400228	Rådshusstræde 13	\N	\N	https://foursquare.com/item/5594fe29498ea7b68f0936f1
1349	Søernes Ølbar	45	9.30000000000000071	55.69623040614408	12.575021982192993	Sortedam Dossering 83 (Kroghsgade)	\N	\N	https://foursquare.com/item/516859bde4b00bf2bf4094f2
1350	Paludan Bogcafé	45	9.30000000000000071	55.68037381485304	12.573134847641846	Fiolstræde 10-12	\N	\N	https://foursquare.com/item/50781895e4b0109f349ad910
1351	Hillside Beach Club	46	9.40000000000000036	36.61374489985261	29.076205713248722	Kalemya Koyu, Fethiye	\N	\N	https://foursquare.com/item/505072fbe4b044b024e3bed5
1352	Kleopatra Koyu	46	9.40000000000000036	36.641056537628174	28.85509729385376	Göcek - Dalaman	\N	\N	https://foursquare.com/item/51f4ede9498ed1d5f8d95487
1353	Lacivert Koy	46	9.40000000000000036	36.99743419791542	28.223300077457292	Gökova	\N	\N	https://foursquare.com/item/51fcea6a498e2ccc83aa6b17
1354	Akvaryum Koyu	46	9.40000000000000036	36.66759866584056	28.903956041555656	Göcek	\N	\N	https://foursquare.com/item/51bb0d20498e4c49535de0c3
1355	Akvaryum Koyu	46	9.30000000000000071	36.54055734591527	29.0534563123768	Ölüdeniz (Fethiye)	\N	\N	https://foursquare.com/item/520eb68c11d2e753e0dc06fe
1356	Tavşan Burnu	46	9.30000000000000071	36.989157010750155	27.48244130553975	Tavşan Burnu	\N	\N	https://foursquare.com/item/4e4e13ddb0fb088f3c089ff6
1357	palmarin yatch clup	46	9.30000000000000071	37.10334422592341	27.286971690043245	Yalıkavak Bodrum	\N	\N	https://foursquare.com/item/550f17db498e604e17fc9c6a
1358	Ören Sahil	46	9.30000000000000071	37.031423124629306	27.972684302494223	Muğla	\N	\N	https://foursquare.com/item/519dd178498eeb82913fc99b
1359	Beybaba Meyhanesi	46	9.30000000000000071	37.03011754123923	27.379632956939428	Begamut Caddesi No:44 (Bitez - Bodrum)	\N	\N	https://foursquare.com/item/564e2e67498edd3420e3ed46
1360	Kitesurf Beach	46	9.19999999999999929	37.03768211020332	28.329685947114285	Akcapinar Mahallesi Kitesurf Sahili	\N	\N	https://foursquare.com/item/57da6ee2cd10a84e836b8ee2
1361	mavi sürgün	46	9.19999999999999929	37.035604	27.431372	Çarşı Mahallesi, 1037sk, No:1 Manavlar,  Bodrum (Cevat Şakir)	\N	\N	https://foursquare.com/item/588db608809a7775668d8f0b
1362	Balbadem Bungalov	46	9.19999999999999929	36.68661880493164	27.558712005615234	Mesudiye - Ovabükü	\N	\N	https://foursquare.com/item/55b0b0b2498ed081a1d07d8b
1363	Voyage Bodrum	46	9.19999999999999929	37.027841619008555	27.4163818359375	Bardakçı Koyu, Bodrum	\N	\N	https://foursquare.com/item/4ff9f0fce4b0903669705417
1364	Boynuzbükü	46	9.19999999999999929	36.710818637143966	28.899741474668414	Gocek	\N	\N	https://foursquare.com/item/502018f6e4b0997f8065b85b
1365	Ness Wear	46	9.19999999999999929	37.215511376708	28.36151510319451	emirbeyazıt mah. çınar sok (dominos pizza karşısı)	\N	\N	https://foursquare.com/item/51962243498e0b9f32c79611
1366	Ferhat Kuaför	46	9.09999999999999964	36.7238623576088	27.685385942459103	İskele Mah. Bademli Cad no:5/c-d	\N	\N	https://foursquare.com/item/51409902e4b016127d0c1fe7
1367	Pasha on the Bay	46	9.09999999999999964	36.613749	29.073722	Hillside Beach Club (Kalemya Koyu, Fethiye)	\N	\N	https://foursquare.com/item/5029563fe4b0db2acbb972b1
1368	Fethiye Marina	46	9.09999999999999964	36.62232472281735	29.108079838434907	Fevzi Çakmak Cd. Fethiye	\N	\N	https://foursquare.com/item/4dc14dc352b1877d85b05895
1369	Karacasögüt	46	9.09999999999999964	36.93868580137389	28.18764063686147	Marmaris	\N	\N	https://foursquare.com/item/52a60f4511d2c1fa52dca966
1370	Sait Balık Restaurant	46	9.09999999999999964	37.03523855869916	27.422448140741476	Bodrum (Neyzen Tevfik)	\N	\N	https://foursquare.com/item/57c2a400498e21cd5ad9244d
1371	Çiftlik Koyu	46	9.09999999999999964	36.716336330169746	28.237446426467553	Marmaris	\N	\N	https://foursquare.com/item/4ff2cefbe4b08dd52d1b480b
1372	Beach Bar & Restaurant	46	9.09999999999999964	36.61463202357766	29.07604694366455	Hillside Beach Club (Kalemya Koyu, Fethiye)	\N	\N	https://foursquare.com/item/4ffb04fae4b0d48ad4636cfb
1373	Kekik Kafe	46	9.09999999999999964	37.10415491483118	27.289130030004674	Çökertme Cad. No 23 B5 Yalıkavak (Özkan Sk)	\N	\N	https://foursquare.com/item/55d0d7cf498e7dd54f1bbeca
1374	ODA SANAT	46	9.09999999999999964	36.72277021990665	27.687971591949463	Atatürk Caddesi 71/A, Datça (Datça Liman)	\N	\N	https://foursquare.com/item/51f61ddae4b079110a1837c2
1375	Nazar Lugga	46	9.09999999999999964	37.16847	28.38229	Üniversite caddesi 06 (Üniversite caddesi)	\N	\N	https://foursquare.com/item/58011bf1498e3260e1331cff
1376	The Kalamata	46	9.09999999999999964	37.03561527461994	27.43149418240516	Meyhaneler Sokağı	\N	\N	https://foursquare.com/item/58a348c1fc5a5f6db2219854
1377	Akvaryum Koyu	46	9	36.55523340381228	29.05246762518444	Fethiye	\N	\N	https://foursquare.com/item/53fb13d4498e92daaec3d138
1378	Akbük Koyu	46	9	37.030042866877686	28.09841394424438	Gökova	\N	\N	https://foursquare.com/item/4fdf4b7de4b06540469c3851
1379	Academy Sport Center	46	9	37.17030224115951	28.37643740958013	Üniversite Kampüs	\N	\N	https://foursquare.com/item/541d4336498e27759288c306
1380	Mabolla Performance Club	46	9	37.21700674257684	28.359808797268826	Recai Gureli Cad. No: 29	\N	\N	https://foursquare.com/item/51090901e4b07566ddfcdcfb
1381	Taj Mahal Palace & Tower	47	9.5	18.922354859453687	72.83346856352783	Apollo Bunder (P. Jetha Singh Ramchandani Marg)	\N	\N	https://foursquare.com/item/4f0163fce5faf2869d2edb77
1382	Prithvi Theatre	47	9.40000000000000036	19.106020521599856	72.8260087966919	Church Road (Juhu)	\N	\N	https://foursquare.com/item/5098d1d7498e20f69f3719a9
1383	Nariman Point	47	9.40000000000000036	18.92918335830556	72.82223224639893	Nariman Point (Dorabji Tata Road)	\N	\N	https://foursquare.com/item/4f6875a2e4b0f8b5d45aa427
1384	Hard Rock Café Mumbai	47	9.40000000000000036	19.007120453676198	72.8292795707588	Pandurang Budhkar Marg (Bombay Dyeing Mill Compound)	\N	\N	https://foursquare.com/item/4b1219db70c603bb82248fb4
1385	Marine Drive	47	9.30000000000000071	18.94178483611529	72.82277668061836	Marine Drive	\N	\N	https://foursquare.com/item/4b4f39de70c603bba24f90b4
1386	The Westin Mumbai Garden City	47	9.30000000000000071	19.17263507417028	72.86040679581922	International Business Park, Oberoi Garden City (Off Western Express Highway)	\N	\N	https://foursquare.com/item/4fcdb69ae4b0ac5f60431c5f
1387	Worli Sea Face	47	9.30000000000000071	19.009216497075652	72.8150224685669	Worli (Khan Abdul Gaffar Khan Road)	\N	\N	https://foursquare.com/item/4f687331e4b05eede50de473
1388	Jehangir Art Gallery	47	9.30000000000000071	18.92757321510909	72.83151832515472	161 Mahatma Gandhi Road (Kala Ghoda)	\N	\N	https://foursquare.com/item/5151ea56e4b02da134241626
1389	Candies	47	9.19999999999999929	19.06115067399369	72.82672921212136	Union Park, Pali Hill (St. Andrews Rd.)	\N	\N	https://foursquare.com/item/517bd5b6e4b03ec765a20316
1390	Narayan Dosa	47	9.19999999999999929	18.957440451574335	72.81329611473541	Parmanand Building, French Bridge (Opera House)	\N	\N	https://foursquare.com/item/5205b2b1498e7bbf3e5cef2f
1391	Bandstand Promenade	47	9.19999999999999929	19.046946970470685	72.81991481781006	Bandra West (Byramji Jeejobhoy Rd)	\N	\N	https://foursquare.com/item/517eb3df498e0a550b10e282
1392	Jogger's Park	47	9.19999999999999929	19.059728381291716	72.82205540884804	Carter Road (Bandra West)	\N	\N	https://foursquare.com/item/5115962ce4b034f50b7c7d98
1393	Starbucks	47	9.19999999999999929	18.932225624611906	72.83378013862767	10, Elphinstone Building, Veer Nariman Rd. (Horniman Circle)	\N	\N	https://foursquare.com/item/508836a9e4b09049870acc03
1394	Natural's Ice Cream Parlour	47	9.19999999999999929	18.93469714763862	72.82414997618469	Marine Drive	\N	\N	https://foursquare.com/item/5239189511d2373871958abf
1395	Café Zoe	47	9.19999999999999929	19.000519856775945	72.83026047083173	Todi/Mathuradas Mills Compound (NM Joshi Marg, Lower Parel)	\N	\N	https://foursquare.com/item/4f88820ce4b047d84944cf49
1396	Candies	47	9.19999999999999929	19.070344638889228	72.82630799648008	Union Park, Bandra West (Near Carter Road)	\N	\N	https://foursquare.com/item/4ed56e556c2528aaaec06bd1
1397	Mahalaxmi Race Course (Royal Western India Turf Club)	47	9.19999999999999929	18.980534507963622	72.81858750447056	Mahalaxmi Race Course	\N	\N	https://foursquare.com/item/5106ed0ae4b0120cec17bf5f
1398	High Street Phoenix	47	9.09999999999999964	18.994966958554343	72.82503247261047	Senapati Bapat Marg (Lower Parel)	\N	\N	https://foursquare.com/item/4da291b37c1d4eb9712319c6
1399	Café Mondegar	47	9.09999999999999964	18.924053150474474	72.83211350440979	Metro House, 5-A Shahid Bhagat Singh Road (Near Regal Cinema)	\N	\N	https://foursquare.com/item/500ea9d2e4b0878eb5b847a9
1400	Mahesh Lunch Home	47	9.09999999999999964	19.103710205271224	72.82686769381735	Juhu Tara Rd, Juhu (next to tulip star)	\N	\N	https://foursquare.com/item/53649abc498e0a332f83ea25
1401	Ram Ashraya	47	9.09999999999999964	19.028008003189164	72.85174190998077	Near Matunga Central Railway Station, Matunga (Bhandarkar Road, L. Napoo Road)	\N	\N	https://foursquare.com/item/50014dffe4b0a4b26cc3f291
1402	Doolally Tap Room	47	9.09999999999999964	19.049346395784823	72.82899684000584	Shop 5&6, Geleki (ONGC Colony)	\N	\N	https://foursquare.com/item/5597d600498e16dee2344d39
1403	PVR Cinemas	47	9.09999999999999964	19.173972270272255	72.86033756452709	Oberoi Mall, Off Western Express Highway (Goregaon (East))	\N	\N	https://foursquare.com/item/4d592f3323e0a0935ac14149
1404	National Centre for the Performing Arts (NCPA)	47	9.09999999999999964	18.92563130239702	72.81986117362976	Nariman Point (NCPA Marg)	\N	\N	https://foursquare.com/item/52a1ca8411d279d3c1f7416d
1405	Smoke House Deli	47	9.09999999999999964	19.065414158769478	72.82985080128074	Pali Naka	\N	\N	https://foursquare.com/item/52dbc4b211d2344fc56c9960
1406	Theobroma	47	9.09999999999999964	18.919122848967582	72.82933150086151	Shop 24, Cusrow Baug, Colaba Causeway (Shahid Bhagat Singh Road)	\N	\N	https://foursquare.com/item/4be47fef70c603bbae9a9ab4
1407	Indigo Deli	47	9.09999999999999964	19.061760051790852	72.82998351121061	Pali Hill (Bandra)	\N	\N	https://foursquare.com/item/52519f69498eb2e6085f1f3a
1408	Café Madras	47	9.09999999999999964	19.02768681379751	72.85522593283493	38 - II Circle House	\N	\N	https://foursquare.com/item/50015891e4b034c293796d72
1409	Britannia & Co.	47	9.09999999999999964	18.93474562063126	72.83998270817887	11 Sprott Rd., Ballard Estate (Shiv Sagar Ram Gulam Marg)	\N	\N	https://foursquare.com/item/4f016b175c5c51dd2fd14556
1410	Escobar	47	9.09999999999999964	19.060229963616486	72.83638812199374	199 V N  Sphere Mall, 4th floor (Linking Road, Bandra West)	\N	\N	https://foursquare.com/item/4dda3cce814d52408627a982
1411	The Big Chill Cafe	48	9.30000000000000071	28.528232416618536	77.21762049672157	DLF Place Saket (Saket)	\N	\N	https://foursquare.com/item/5139a102e4b0753d624d5f2b
1412	Hauz Khas Village	48	9.19999999999999929	28.55431076151011	77.19513960172755	Haus Khas (Near Greenpark Market)	\N	\N	https://foursquare.com/item/510ebcbae4b0eaed22ad050d
1413	Qutub Minar | क़ुतुब मीनार (Qutub Minar)	48	9.19999999999999929	28.525265048263833	77.18659304744011	Lado Sarai	\N	\N	https://foursquare.com/item/50e746e0e4b0651ebcacb0c4
1414	Select Citywalk	48	9.19999999999999929	28.528677890971235	77.21913628745303	A-3, District Centre, Saket (Saket)	\N	\N	https://foursquare.com/item/4c47ce59699476b0075bb321
1415	The Big Chill Cafe	48	9.09999999999999964	28.60004658289927	77.22736358642578	68A (Khan Market)	\N	\N	https://foursquare.com/item/568c9e04498eaebe417a5404
1416	The Big Chill Cafe	48	9.09999999999999964	28.552711167130397	77.24179223274022	HS-5 (Kailash Colony Market)	\N	\N	https://foursquare.com/item/4cdf6c0c825e721e05057145
1417	Connaught Place | कनॉट प्लेस (Connaught Place)	48	9	28.6327309443951	77.22001768275413	Connaught Place (Many streets meet here)	\N	\N	https://foursquare.com/item/5102ed05e4b0e45ff171d45b
1418	Olive Bar & Kitchen	48	9	28.52607623591485	77.18395371110424	One Style Mile, Mehrauli	\N	\N	https://foursquare.com/item/568fbcf4498efc0aad9f2e25
1419	PCO	48	9	28.561652242877145	77.1557035249911	Vasant Vihar	\N	\N	https://foursquare.com/item/523a0640498e98a555b2238b
1420	Humayun’s Tomb | हुमायूँ का मकबरा (Humayun’s Tomb)	48	9	28.593197068556787	77.24604675390611	Bharat Scouts and Guides Marg	\N	\N	https://foursquare.com/item/50e749dbe4b0abc5b9b2f835
1421	Bukhara	48	9	28.59694007056306	77.1734013952011	ITC Maurya (Sardar Patel Marg)	\N	\N	https://foursquare.com/item/51e2e97e498eb19e336fc189
1422	Hard Rock Café	48	8.90000000000000036	28.52745931981494	77.2168345235042	DLF Courtyard (M 110, Multiplex Building, 1st Floor)	\N	\N	https://foursquare.com/item/5082d847e4b05bd7eec0a4fa
1423	Cafe Wink	48	8.90000000000000036	28.65733897917181	77.31701503310322	G-1 Sikka Galaxy (Shrestha vihar)	\N	\N	https://foursquare.com/item/5224cc4f11d255bcd3982f78
1424	Khan Market | खान मार्केट (Khan Market)	48	8.90000000000000036	28.600342223094003	77.22692265405401	KHAN MARKET	\N	\N	https://foursquare.com/item/510688d5e4b05cc1cf672ee8
1425	PVR Director's Cut	48	8.90000000000000036	28.541024183093437	77.15500701420676	3rd Flr., Ambience Mall, Nelson Mandela Rd., Vasant Kunj (None)	\N	\N	https://foursquare.com/item/4fa64dbae4b0e7038befca82
1426	Lodhi Gardens (लोधी बाग़) (Lodhi Gardens)	48	8.90000000000000036	28.591424087968747	77.22089907148106	Lodhi Rd	\N	\N	https://foursquare.com/item/50e74192e4b08cc1f4d098b3
1427	Big Yellow Door	48	8.90000000000000036	28.693290555001127	77.20496007827575	Hudson Lane (opposite NDPL)	\N	\N	https://foursquare.com/item/51f916da498e36c130ae44e0
1428	Thai High	48	8.90000000000000036	28.522233	77.181832	Ambawatta Complex (Mehrauli Market)	\N	\N	https://foursquare.com/item/5298ac8211d277dbc656629c
1429	India Gate | इंडिया गेट (India Gate)	48	8.80000000000000071	28.61279643474231	77.22920738085976	India Gate C-Hexagon (Rajpath)	\N	\N	https://foursquare.com/item/4b9fdf1470c603bbd39894b4
1430	Fitness First Platinum, Select City Walk	48	8.80000000000000071	28.52837019734996	77.21852997349325	5th & 6th Floor, The Dome, Select Citywalk (Saket)	\N	\N	https://foursquare.com/item/520e496f11d29375836bf4e0
1431	Starbucks Coffee | स्टारबक्स कॉफी	48	8.80000000000000071	28.552808651251425	77.08575694338177	Terminal 3 - Domestic, Opp. Gate 27, Indira Gandhi International Airport	\N	\N	https://foursquare.com/item/536b11cb498e55c122f6ca03
1432	Indian Accent	48	8.80000000000000071	28.57049625830494	77.25673850651376	77 Friends Colony	\N	\N	https://foursquare.com/item/508aa4d5e4b07020052dc714
1433	Tamra	48	8.80000000000000071	28.62059425954847	77.21823242939375	19, Ashoka Rd (Windsor Pl)	\N	\N	https://foursquare.com/item/55058ad4498ec870ea697461
1434	Varq | वर्क	48	8.80000000000000071	28.604612590816057	77.22373968084912	Taj Mahal Hotel,  Lower Lobby Level (1 Mansingh Road)	\N	\N	https://foursquare.com/item/527a619211d2cf6e32bcec8d
1435	Starbucks	48	8.69999999999999929	28.534174248684735	77.24292042548417	M-Block Market, GK 2,	\N	\N	https://foursquare.com/item/55961f9c498e6d6c0d872f1e
1436	Gulati Restaurant	48	8.69999999999999929	28.60798858654076	77.22997643128618	Pandara Road	\N	\N	https://foursquare.com/item/528f15e811d2bc42ced07987
1437	Imperfecto	48	8.69999999999999929	28.554661	77.19497	1A/1, Hauz Khas Village	\N	\N	https://foursquare.com/item/51506850e4b01bb28d432f15
1438	Wenger's	48	8.69999999999999929	28.633142304019763	77.21828699111938	A 16, Inner Circle, Connaught Place (Connaught Place)	\N	\N	https://foursquare.com/item/4f16ab6be4b0380207d6dbcf
1439	DLF Emporio	48	8.69999999999999929	28.54321514883739	77.15685500566174	Nelson Mandela Road, Vasant Kunj	\N	\N	https://foursquare.com/item/4e684199c65be3a564e285de
1440	Hotel Sarvana Bhavan	48	8.69999999999999929	28.632363835402455	77.21640223600714	P-13/90, Connaught Circus	\N	\N	https://foursquare.com/item/53d946fd498ee45dc55254c4
1441	Byblos Toronto	49	9.5	43.64762859470953	-79.38841344599565	11 Duncan St. 1st Floor	\N	\N	https://foursquare.com/item/537f91fa498efef2814c1de3
1442	Simit & Chai Co.	49	9.5	43.64307885407135	-79.40672009940096	787 King St. West (at Niagara St)	\N	\N	https://foursquare.com/item/56e05405498e6c27f8b11857
1443	Distillery Sunday Market	49	9.5	43.65009536621226	-79.36119415932626	1 Trinity St	\N	\N	https://foursquare.com/item/4cf6c1b22d032c0fc41d75d3
1444	Pizzeria Libretto	49	9.40000000000000036	43.648937282541574	-79.42062633273785	221 Ossington Ave (at Dundas St W)	\N	\N	https://foursquare.com/item/4d47509f11618cfadc91c723
1445	Steam Whistle Brewing	49	9.40000000000000036	43.641094701528715	-79.3851145645301	255 Bremner Blvd. (btwn Rees St. & Simcoe St.)	\N	\N	https://foursquare.com/item/4d907c30d4ec8cfa0263a389
1446	Trinity Bellwoods Park	49	9.40000000000000036	43.64707192840234	-79.4137559260075	1053 Dundas St. W. (at Gore Vale Ave.)	\N	\N	https://foursquare.com/item/509ec9c0e4b0c4d83c4625c7
1447	SOMA chocolatemaker	49	9.40000000000000036	43.64541538053652	-79.39558260941624	443 King St. W	\N	\N	https://foursquare.com/item/4ea9bdef7beb32cb1407ae03
1448	Downtown Toronto	49	9.40000000000000036	43.65323167517444	-79.38529600606677	Toronto ON	\N	\N	https://foursquare.com/item/540c9143498eb1388006b3a2
1449	Bellwoods Brewery	49	9.40000000000000036	43.64707222155943	-79.41993381893113	124 Ossington Ave (at Argyle St)	\N	\N	https://foursquare.com/item/4f88c712e4b0e6f347f2ee4e
1450	Toronto Islands	49	9.40000000000000036	43.62211231383369	-79.37849521636963	Toronto Islands	\N	\N	https://foursquare.com/item/51e71bfa498eaefba363eaed
1451	St. Lawrence Market (South Building)	49	9.40000000000000036	43.64877797631841	-79.37163741282026	93 Front St E (at Lower Jarvis St)	\N	\N	https://foursquare.com/item/4bd2755970c603bbd7fe98b4
1452	High Park	49	9.40000000000000036	43.647379730216116	-79.46273803710938	1873 Bloor St. W (at Parkside Dr.)	\N	\N	https://foursquare.com/item/4b06083770c603bbbff18eb4
1453	Riverdale Park East	49	9.30000000000000071	43.66995145540962	-79.35549259185791	550 Broadview Ave	\N	\N	https://foursquare.com/item/57131322498ecfc33f5abf88
1454	Banh Mi Boys	49	9.30000000000000071	43.64865945303586	-79.39679757359775	392 Queen St. W	\N	\N	https://foursquare.com/item/4ef2bcc7b634355dee0e713f
1455	Pai	49	9.30000000000000071	43.64780109452793	-79.38856739092513	18 Duncan St (Adelaide and Duncan)	\N	\N	https://foursquare.com/item/53e9416f498e54445b830f7d
1456	Richmond Station	49	9.30000000000000071	43.65146981055386	-79.37946220765025	1 Richmond Street West (Yonge Street)	\N	\N	https://foursquare.com/item/5185d039498e95d7f0d201fc
1457	Rasa	49	9.30000000000000071	43.662833	-79.404041	196 Robert Street	\N	\N	https://foursquare.com/item/54f4a6fe498e0458a416b70c
1458	Alo	49	9.30000000000000071	43.648692526838474	-79.39623132530984	163 Spadina Ave (Queen Street)	\N	\N	https://foursquare.com/item/5663254d498ea5c718a29cb2
1459	Union Restaurant	49	9.30000000000000071	43.64581839000229	-79.41953259823528	72 Ossington Ave. (Queen St. W)	\N	\N	https://foursquare.com/item/4c33a7b809a99c749ce90b2a
1460	Cedarvale Park	49	9.30000000000000071	43.692534923091934	-79.42870527613704	100 glen cedar (Strathearn)	\N	\N	https://foursquare.com/item/55711552498eac6e55d5b897
1575	Tamarama Beach	53	9.40000000000000036	-33.89991425856976	151.2699580192566	Tamarama Marine Dr. (Pacific Ave.)	\N	\N	https://foursquare.com/item/4b06e85570c603bb23f78eb4
1461	Colette Grand Café	49	9.30000000000000071	43.642863007794034	-79.40121748955754	550 Wellington St. W (Bathurst st.)	\N	\N	https://foursquare.com/item/56a03fe5498ec487e8628f91
1462	Porchetta & Co	49	9.30000000000000071	43.64475559543455	-79.39874368204332	545 King St W	\N	\N	https://foursquare.com/item/56b2773a498e511e5901fe44
1463	Seven Lives Tacos Y Mariscos	49	9.30000000000000071	43.654480528015284	-79.40060179254405	69 Kensington Ave (Baldwin St)	\N	\N	https://foursquare.com/item/526001a211d27a7b2979386a
1464	Fahrenheit Coffee	49	9.30000000000000071	43.65231394404868	-79.37280320067421	120 Lombard St (at Jarvis St)	\N	\N	https://foursquare.com/item/528bc51f498ed10476d4931e
1465	Body Blitz Spa West	49	9.30000000000000071	43.645889	-79.399911	471 Adelaide St W (btwn Portland St & Maud St)	\N	\N	https://foursquare.com/item/4b6ce8d170c603bb3e9d91b4
1466	Black Camel	49	9.30000000000000071	43.676824562673154	-79.38927113591218	4 Crescent Rd (Yonge)	\N	\N	https://foursquare.com/item/4c2e1ee98a3495215857cc9f
1467	Ed's Real Scoop	49	9.30000000000000071	43.660655	-79.341978	920 Queen St. E (btwn Logan Ave. & Morse St.)	\N	\N	https://foursquare.com/item/4fa2d52fe4b0b4fd55a17f05
1468	TIFF Bell Lightbox	49	9.30000000000000071	43.64643833819674	-79.39012331994117	350 King St. W (at John St.)	\N	\N	https://foursquare.com/item/4d08e795c26ba143e3111c17
1469	Art Gallery of Ontario	49	9.30000000000000071	43.65404924089138	-79.39267982492319	317 Dundas St W (at Beverley St)	\N	\N	https://foursquare.com/item/4f05d2189adf79d87398ecf8
1470	Royal Ontario Museum	49	9.30000000000000071	43.668367065616046	-79.3948129405877	100 Queen's Pk (at Bloor St. W.)	\N	\N	https://foursquare.com/item/4b9bbec570c603bb5d4894b4
1471	Trasnocho Cultural	50	9.5	10.477917710718817	-66.85822602279357	Av. Principal de Las Mercedes (C.C. Paseo Las Mercedes)	\N	\N	https://foursquare.com/item/4d4aa0a7b480a1435ef730ec
1472	Centro de Arte Los Galpones	50	9.40000000000000036	10.503272452667362	-66.83164553988763	Octava Transversal con Avenida Ávila, Los Chorros (Av. Ávila)	\N	\N	https://foursquare.com/item/4f5dbec1e4b01219ad36d68a
1473	La Praline Chocolatier	50	9.40000000000000036	10.500966949052453	-66.8458092212677	Avenida Andres Bello, Los Palos Grandes (3° Transversal)	\N	\N	https://foursquare.com/item/4ee3db97823180a98acdea8b
1474	La Cuadra Gastronómica	50	9.40000000000000036	10.505380433773952	-66.84318495716334	Entre 3 y 4 avenida, Los Palos Grandes (6ta transversal)	\N	\N	https://foursquare.com/item/4edad9d3e300851bfa219e8a
1475	Pastas Morandi	50	9.30000000000000071	10.483191124355255	-66.9376802444458	Av. Páez, El Pinar (Av. A-2 del Pinar)	\N	\N	https://foursquare.com/item/4d654f3f4e1ea1cd8e154fb9
1476	Sabas Nieves	50	9.09999999999999964	10.512538519000508	-66.85459077963596	Transversal 10, Altamira	\N	\N	https://foursquare.com/item/4da0f6aae8ff2c0f2d169fcd
1477	Parque Nacional El Ávila	50	9.09999999999999964	10.51306964772547	-66.85446863577664	Sector Sabas Nieves	\N	\N	https://foursquare.com/item/53685a73498ead83b9bad5b3
1478	Centro Cultural BOD	50	9.09999999999999964	10.498377	-66.85281	Av. Principal De La Castellana (Con Plaza La Castellana)	\N	\N	https://foursquare.com/item/4df2b407b3ad984432d95002
1479	Via Appia Express	50	9.09999999999999964	10.497735072064211	-66.85304362557929	Av Blandin	\N	\N	https://foursquare.com/item/4f1b457de4b0e6badb780a83
1480	Plaza Los Palos Grandes	50	9.09999999999999964	10.50001	-66.843846	Avenida 3, Los Palos Grandes (c/ 2da Transversal)	\N	\N	https://foursquare.com/item/4f5da9d7e4b0c4b68acb5602
1481	MTS Training Zone	50	9	10.46695760134113	-66.84184139668042	San Luis, El Cafetal	\N	\N	https://foursquare.com/item/53b2fa59498e02e4b5c96c5f
1482	Pizzeria Pipoka	50	9	10.502839260853039	-66.90528220756663	Miguelacho a Misericordia (La Candelaria)	\N	\N	https://foursquare.com/item/4f451ea6e4b0b5bea51c70e7
1483	Café Casa Veroes	50	9	10.508306727232544	-66.91328612188099	Boulevard Panteón Nacional (Veroes a Jesuitas)	\N	\N	https://foursquare.com/item/4d63f438a5be236ad6a9c7db
1484	Café Noisette	50	9	10.492523566821582	-66.83290183855185	Av. Principal de La Carlota, Edif. Marco Aurelio, PB, Local B (Calle A)	\N	\N	https://foursquare.com/item/4e43f91d814d44eea0fe4850
1485	Libreria Kalathos	50	9	10.503023902537116	-66.83163972369515	Centro de Arte Los Galpones	\N	\N	https://foursquare.com/item/51d8a661498e81058c850a11
1486	Quinta Anauco	50	8.90000000000000036	10.511497672103273	-66.89928514361992	Av. Panteón, San Bernardino	\N	\N	https://foursquare.com/item/4f5db649e4b02415441f8b5d
1487	Teatro Teresa Carreño	50	8.90000000000000036	10.498804366207564	-66.8981122970581	Final Av. Libertador, Bellas Artes	\N	\N	https://foursquare.com/item/4f5db2bae4b053fd69be82b6
1488	Altamira Tennis Club	50	8.90000000000000036	10.504158810530189	-66.85319485102063	3ra Avenida, Altamira (Entre 6ta y 7ma transversal)	\N	\N	https://foursquare.com/item/54b56ba5498eb0057599e7aa
1489	Ávila Burger	50	8.90000000000000036	10.505236687095062	-66.84324905276299	Cuadra Gastronómica, 6 transversal entre 4 y 3 ave (Los Palos Grandes)	\N	\N	https://foursquare.com/item/4da0f283e8ff2c0fb4009fcd
1490	Centro Comercial Altamira Village	50	8.90000000000000036	10.502311365544488	-66.84847779514797	Av Luis Roche con Transversal 5, Altamira, Caracas	\N	\N	https://foursquare.com/item/5403ca7f498e622f43cf1b23
1491	Pasteleria Tivoli	50	8.90000000000000036	10.49947628576079	-66.88206784245779	Av. Las Palmas	\N	\N	https://foursquare.com/item/4fe5f446e4b0b3b973579b98
1492	Franca	50	8.90000000000000036	10.498719972424004	-66.8472146987915	1a Ave., entre 1ª y 2ª Transversal, Los Palos Grandes	\N	\N	https://foursquare.com/item/527d24c1498e7654f4eb26dc
1493	El Barquero	50	8.90000000000000036	10.501770286010437	-66.84839055025644	Av. Luís Roche (5ta. Transversal, Altamira)	\N	\N	https://foursquare.com/item/5092dcb3e4b076702b529db5
1494	KKO REAL	50	8.90000000000000036	10.48595397712174	-66.82077515758519	Av. Francisco de Miranda (C.C. Líder)	\N	\N	https://foursquare.com/item/4e6794bab3ad5d91973898be
1495	Fugu	50	8.80000000000000071	10.483888908725591	-66.85986625035889	Calle La Trinidad Las Mercedes, Edif. Canaima	\N	\N	https://foursquare.com/item/519cecb5498e340945d3caec
1496	Restaurante Urrutia	50	8.80000000000000071	10.493697560626961	-66.87379669793746	Av. Francisco Solano (Esquina Calle Los Manguitos)	\N	\N	https://foursquare.com/item/525077a511d224a70d9a3d98
1497	Club Táchira	50	8.80000000000000071	10.479129442490091	-66.87738418579102	Calle Caurimare, Colinas de Bello Monte	\N	\N	https://foursquare.com/item/518fc4cc498ed2166235fb21
1498	Amazonia Grill Restaurant	50	8.80000000000000071	10.48247607275885	-66.85752223832212	Calle Madrid, Qta. Risueña.	\N	\N	https://foursquare.com/item/515c81a0e4b0bf0becc07442
1499	El Alazán	50	8.80000000000000071	10.503245556558841	-66.84772968292236	Av. Luis Roche (5ta Transversal de Altamira)	\N	\N	https://foursquare.com/item/50469c51e4b04db6008dd08e
1500	Gourmet Market	50	8.80000000000000071	10.488318262268665	-66.86580777168274	Av. Ppal de Las Mercedes (Con Calle Guaicaipuro)	\N	\N	https://foursquare.com/item/4e7016efae602b2e7224e559
1501	Mouse House	51	9.59999999999999964	59.93350569616452	30.43835163116455	Заневский просп., 67	\N	\N	https://foursquare.com/item/58978289d8e5594974bc6b7c
1502	Feromon Komenda	51	9.5	60.007034	30.264624	Комендантский проспект 11	\N	\N	https://foursquare.com/item/589b35e67b88a77e1566d56d
1503	Palace Square (Дворцовая площадь)	51	9.5	59.938629866448245	30.31489333967436	Дворцовая пл. (Невский просп.)	\N	\N	https://foursquare.com/item/4ed367e299114b488b8a9cb3
1504	Saint Isaac’s Square (Исаакиевская площадь)	51	9.5	59.933503997213705	30.307563373665722	Исаакиевская пл.	\N	\N	https://foursquare.com/item/4fd8572fe4b004e184420a89
1505	Peter and Paul Fortress (Петропавловская крепость)	51	9.5	59.95130798083107	30.318636216297403	Заячий о.	\N	\N	https://foursquare.com/item/518f47c6498eb480420d7edc
1506	Таврический сад	51	9.5	59.944484146671385	30.37175155516356	Потёмкинская ул., 4	\N	\N	https://foursquare.com/item/50cba681e4b0b76ccf4d891d
1507	Парк 300-летия Санкт-Петербурга	51	9.40000000000000036	59.98436506413223	30.203538424722034	Приморский просп., 74	\N	\N	https://foursquare.com/item/51f40e73498ee994151656b6
1508	Mariinsky Theatre (Мариинский театр)	51	9.40000000000000036	59.925706329324214	30.295980940623252	Театральная пл., 1	\N	\N	https://foursquare.com/item/510d699ee4b0faae33ad7272
1509	Spit of Vasilievsky Island (Стрелка Васильевского острова)	51	9.40000000000000036	59.94400071449119	30.305687214330117	Биржевая пл.	\N	\N	https://foursquare.com/item/4f6057dce4b0a0bd3759866f
1510	Hot Yoga Studio	51	9.40000000000000036	59.96152243311833	30.401900441201438	Свердловская наб. 38 (БЦ Зима)	\N	\N	https://foursquare.com/item/513080f8e4b0637883c6226a
1511	ЦПКиО им. Кирова / Елагин остров	51	9.40000000000000036	59.9787939265321	30.25812202438186	Елагин о.	\N	\N	https://foursquare.com/item/507adf6fe4b069ffd85fc70a
1512	Аэротруба «FlyStation»	51	9.40000000000000036	60.09214665796673	30.49650677697893	7-8 км Токсовского ш.	\N	\N	https://foursquare.com/item/5133b479e4b018c1c7ee94a4
1513	Mikhailovsky Theatre (Михайловский театр)	51	9.40000000000000036	59.937785570802745	30.329413252921718	пл. Искусств, 1 (Инженерная ул.)	\N	\N	https://foursquare.com/item/4dd933d77d8b3226641a4998
1514	Колоннада Исаакиевского собора	51	9.40000000000000036	59.93415301796584	30.306245417736516	Исаакиевская пл., 4	\N	\N	https://foursquare.com/item/52568fd411d200eb121fd5d2
1515	Дегтярные бани	51	9.40000000000000036	59.93047896039087	30.370000828217385	Дегтярная ул., 1	\N	\N	https://foursquare.com/item/51d04c7d498e3b4466ddbec9
1516	Olymp	51	9.30000000000000071	60.02346637646587	30.32516241073608	просп. Тореза, 114, корп. 2, стр. 1	\N	\N	https://foursquare.com/item/58a185ace6160c1b22fd0c4b
1517	Magic Thai	51	9.30000000000000071	59.94688911732938	30.379370540527294	Тверская ул., 1	\N	\N	https://foursquare.com/item/509f8275e4b047ee295d9162
1518	#Sekta	51	9.30000000000000071	59.93651944955919	30.329692184750858	Итальянская ул., 5	\N	\N	https://foursquare.com/item/5458ea44498ee98cbe7ef214
1519	The Russian Museum (Benois Wing) (Русский музей (Корпус Бенуа))	51	9.30000000000000071	59.938331004084255	30.328106706935714	наб. Канала Грибоедова, 2 (Инженерная ул.)	\N	\N	https://foursquare.com/item/518ccec3498e10abb44758a6
1520	Hermitage Museum (Государственный Эрмитаж)	51	9.30000000000000071	59.940769431180456	30.313973530485914	Дворцовая наб., 34 (Дворцовая пл.)	\N	\N	https://foursquare.com/item/50e4b86be4b01e906b96a175
1521	Подписные издания + Знакомьтесь, Джо!	51	9.30000000000000071	59.93441199571926	30.34799036607893	Литейный просп., 57	\N	\N	https://foursquare.com/item/505096b5e4b0fb6d8fea6464
1522	Петербургский теннисный клуб им. В.И.Никифорова	51	9.30000000000000071	59.97443156721874	30.254215988632023	наб. Мартынова, 40	\N	\N	https://foursquare.com/item/4e6cd89045dd435bc134bad8
1523	Атланты Эрмитажа	51	9.30000000000000071	59.941031742683926	30.317732979800898	Миллионная ул., 35, город Санкт-Петербург, Россия	\N	\N	https://foursquare.com/item/508a41b6e4b032d8bd628e5a
1524	SportLife	51	9.30000000000000071	60.05348718778956	30.32504603012293	Апарт-отель «Ye's» (ул. Хошимина, 16)	\N	\N	https://foursquare.com/item/571fc352498ed94f1f13d787
1525	El Copitas	51	9.30000000000000071	59.92900499142059	30.34848782473602	Колокольная ул., 2	\N	\N	https://foursquare.com/item/55150fac498e4147d030c358
1526	Smoke Me	51	9.19999999999999929	59.93773033236808	30.359333753585815	ул. Восстания, 20 (Ковенский пер., 16)	\N	\N	https://foursquare.com/item/564bb610498e145275cb68da
1527	Primokarting	51	9.19999999999999929	59.984715733535324	30.320064384714076	Вазаский пер., 4	\N	\N	https://foursquare.com/item/5704bc26498e4a0fbe13cde1
1528	Абажур	51	9.19999999999999929	59.940729174967984	30.277657806873325	9-я линия В.О., 30	\N	\N	https://foursquare.com/item/4ff5bea9e4b04f76773d4e0c
1529	Alexander Park (Александровский парк)	51	9.19999999999999929	59.95614529545526	30.318145262795902	Кронверкский просп. (Кронверская наб.)	\N	\N	https://foursquare.com/item/51af2bc5498e74c936b5735a
1530	Mops Day Spa	51	9.19999999999999929	59.93120798913728	30.34579350500725	Ул. Рубинштейна	\N	\N	https://foursquare.com/item/51095dd0e4b02843808232e9
1531	Mорска градина (Sea Garden)	52	9.5	42.49558023492323	27.482707500457764	бул. Демокрация	\N	\N	https://foursquare.com/item/5184aff0498e2061ec7c2df0
1532	The Coffee Room	52	9	42.495941	27.476753	Tzar Simeon 37	\N	\N	https://foursquare.com/item/56978257498e40cbeb047f05
1533	Bar Celona	52	8.90000000000000036	42.49244497514984	27.4730797500693	ул. "Александровска" 16 (ул. "Милин Камък")	\N	\N	https://foursquare.com/item/529faf2311d2fab0c7627755
1534	Флората (The Floral Fair)	52	8.90000000000000036	42.50423975543085	27.48239929351195	Морска градина	\N	\N	https://foursquare.com/item/517806b8e4b0dd98392af5cb
1535	Терасата (The Therrace)	52	8.80000000000000071	42.494358021872124	27.482616305351257	Морска градина (до КЦ "Морско казино")	\N	\N	https://foursquare.com/item/5204cfbc498e8adbdb451bb2
1536	Barbossa	52	8.69999999999999929	42.496581417545514	27.46989229889415	ул. "Сердика" (в Tria City Centre)	\N	\N	https://foursquare.com/item/5104506be4b0fc9c2ac8aa5c
1537	Площад Тройката (Troykata Square)	52	8.69999999999999929	42.4975420544728	27.470669746398926	ул. "Александровска" (ул. "Княз Борис I")	\N	\N	https://foursquare.com/item/4e3e5ccf6365a251c703b967
1538	Helikon (Хеликон)	52	8.69999999999999929	42.49735751099473	27.470487595910495	пл. Тройката 4	\N	\N	https://foursquare.com/item/5162ada9e4b089c4e210345e
1539	Ti Bar	52	8.69999999999999929	42.49501253772984	27.472268879916033	ул. Александровска (ул. Силистра 2)	\N	\N	https://foursquare.com/item/5375f277498ec88a7f07b14f
1540	La Toscana	52	8.69999999999999929	42.50938332535905	27.469969401264734	ул. Карлово 28 (ул. Калофер)	\N	\N	https://foursquare.com/item/56f6d1e1498ea11c94591f9e
1541	Pelican	52	8.69999999999999929	42.494539173277346	27.480214527915336	Oborishte 1 Str.	\N	\N	https://foursquare.com/item/55aab06f498e0af29d3f3721
1542	Млекарница "Добрев" (Dobrev’s Cheese Store)	52	8.59999999999999964	42.492518292326444	27.471693602642667	ул. "Конт Андрованти" 9 (зад Община Бургас)	\N	\N	https://foursquare.com/item/51e63d48498e18eeb3d3937f
1543	Ул. Александровска (Главната)	52	8.59999999999999964	42.49425255616206	27.472197296223467	Ул. "Александровска"	\N	\N	https://foursquare.com/item/5398aad6498eb60a3009bb02
1544	Happy Bar & Grill	52	8.59999999999999964	42.493133	27.473555	8000 Бургас	\N	\N	https://foursquare.com/item/511d2526e4b0207e5f458ac7
1545	Часовникът (The City Clock)	52	8.59999999999999964	42.49354212327111	27.472754138538935	бул. "Алеко Богориди" 2 (ул. "Александровска")	\N	\N	https://foursquare.com/item/508ec23ae4b0bbdbaf057f54
1546	Централен Плаж Бургас (Burgas Central Beach)	52	8.5	42.50061207277091	27.482605919815953	8000 Burgas	\N	\N	https://foursquare.com/item/5229b3cd11d20359fbf0ee11
1547	Lidl	52	8.5	42.53136980065016	27.46255874633789	ул. Транспортна	\N	\N	https://foursquare.com/item/5666f16b498e6b4a01603465
1548	8 mama's	52	8.5	42.49279474170581	27.479078924575973	35 Bulair str.	\N	\N	https://foursquare.com/item/569c95ea498e20b70cbd3377
1549	Incanto	52	8.5	42.49790598603959	27.47279040154184	пл. Баба Ганка 4	\N	\N	https://foursquare.com/item/4ec22d056da15b4de010d948
1550	Grand Hotel & Spa "Primoretz"	52	8.5	42.4907471082838	27.479785382505753	ул. "Ал. Батенберг" 2	\N	\N	https://foursquare.com/item/51b34210498edca481634b52
1551	City's Café	52	8.5	42.500502466045816	27.470988929271698	бул. Стефан Стамболов 52 (ул. Пробуда 4)	\N	\N	https://foursquare.com/item/4ecd0b248b81fbfbaaf2f528
1552	Tea House (Чай във фабриката)	52	8.40000000000000036	42.49715038596853	27.470875507455077	пл. "Тройката" 4	\N	\N	https://foursquare.com/item/4ef974d777c8e88f497a3b83
1553	Километър Нула (Kilometer Zero)	52	8.30000000000000071	42.49530830447386	27.47169703245163	ул. "Александровска"	\N	\N	https://foursquare.com/item/53f0ad56498ee78b84459323
1554	Moka Bar	52	8.30000000000000071	42.49353956726323	27.475095748248094	Konstantin Fotinov 14	\N	\N	https://foursquare.com/item/55f2d0cd498e26c68d024bcc
1555	Subway	52	8.30000000000000071	42.512815674716144	27.45477984246729	бул. "Янко Комитов" 6 (в Mall Galleria Burgas)	\N	\N	https://foursquare.com/item/51cff164498effd01795158b
1556	Северен Плаж (North Beach)	52	8.30000000000000071	42.50771050803928	27.484067443214382	ул. "Димитър Димов"	\N	\N	https://foursquare.com/item/5034c5d2e4b0ab0c739b6392
1557	Club 5	52	8.30000000000000071	42.500008651319455	27.478320528312942	бул. "Демокрация" 5	\N	\N	https://foursquare.com/item/5116c5b3e4b0003774a8f9a1
1558	Сладко И Солено ООД	52	8.30000000000000071	42.494838210722904	27.471978649904415	ул. "Александровска" 40	\N	\N	https://foursquare.com/item/552253a1498e056e4e501c00
1559	Южен плаж Бургас (South Beach)	52	8.30000000000000071	42.49225898452118	27.48208194493767	8000 Бургас	\N	\N	https://foursquare.com/item/52175b4a11d2321da0c2f186
1560	Пивоварната | The Brewery	52	8.19999999999999929	42.49161561120821	27.47224551736585	ул. Хан Крум 6 (ул. Александровска)	\N	\N	https://foursquare.com/item/55a34d78498e3204a1bb7947
1561	Mrs. Macquarie's Point	53	9.59999999999999964	-33.85939545280097	151.22220396995544	Mrs Macquaries Rd.	\N	\N	https://foursquare.com/item/52ce23d811d2ce588d818253
1562	Bondi - Bronte Coastal Walk	53	9.59999999999999964	-33.89887505022551	151.27379652318672	Sydney NSW 2026	\N	\N	https://foursquare.com/item/4f7d6ba2e4b02118212d8935
1563	Shelly Beach	53	9.59999999999999964	-33.8002974270289	151.29772424697876	Bower St.	\N	\N	https://foursquare.com/item/4b82df9c70c603bbc6d592b4
1564	Sydney Opera House	53	9.5	-33.85778259475834	151.2142881924619	2 Macquarie St	\N	\N	https://foursquare.com/item/510ebe19e4b0b0ec73378684
1565	Bondi Beach	53	9.5	-33.89131820326304	151.27585207244724	Queen Elizabeth Dr. (btwn Notts Ave. & Ramsgate Ave.)	\N	\N	https://foursquare.com/item/4b4419b270c603bb210890b4
1566	Gelato Messina	53	9.5	-33.8855429265338	151.2140035988581	389 Crown St (at Foveaux St)	\N	\N	https://foursquare.com/item/501f727fe4b0abe610b344b7
1567	Royal Botanic Garden	53	9.5	-33.86414397991936	151.21599197387695	Macquarie St (Cahill Express Way)	\N	\N	https://foursquare.com/item/4e4c6edc18a822288dd318bf
1568	Manly Beach	53	9.5	-33.79671333499523	151.28849744796753	North Steyne (at The Corso)	\N	\N	https://foursquare.com/item/4e33d6ca52b11c746226d530
1569	Hyde Park	53	9.40000000000000036	-33.87332386902665	151.21120322505263	Park St. (Park St)	\N	\N	https://foursquare.com/item/4bb4229370c603bbd35e96b4
1570	Rose Bay Beach	53	9.40000000000000036	-33.869901637624714	151.2683360650594	Rose Bay	\N	\N	https://foursquare.com/item/52ca4765498ea8a3e84c9be3
1571	Bronte Beach	53	9.40000000000000036	-33.90490622307707	151.26776668496865	Bronte Rd.	\N	\N	https://foursquare.com/item/4e5e05d7814d9e0233dffabd
1572	Coogee Beach	53	9.40000000000000036	-33.92042321028122	151.25734169454356	Arden St. (Coogee Bay Rd.)	\N	\N	https://foursquare.com/item/4e5e0780814d9e0233dffbbe
1573	Centennial Park	53	9.40000000000000036	-33.89806198291596	151.23418807983398	Grand Dr. (Oxford St.)	\N	\N	https://foursquare.com/item/5143135de4b03340b3902ce3
1574	White Rabbit Gallery	53	9.40000000000000036	-33.88654269035889	151.20008759543956	30 Balfour St. (Wellington St.)	\N	\N	https://foursquare.com/item/4d7ae7ee060ea35d12e59e90
1663	Restaurante Parreirinha	56	8.80000000000000071	-26.239493	28.053943	9 6th St	\N	\N	https://foursquare.com/item/4c03986a70c603bb98c09db4
1576	Balmoral Beach	53	9.40000000000000036	-33.82478475338026	151.25113029564417	The Esplanade	\N	\N	https://foursquare.com/item/4b0cc02a70c603bb9c128fb4
1577	The Rocks	53	9.40000000000000036	-33.85982813529284	151.20861349251595	George St. (Playfair St.)	\N	\N	https://foursquare.com/item/4e69d5d2d164c37bf44da029
1578	Art Gallery Of NSW	53	9.40000000000000036	-33.86872298483739	151.21718287467957	Art Gallery Rd. (btwn Hospital Rd. & Mrs Macquaries Rd.)	\N	\N	https://foursquare.com/item/4b5295c170c603bbbf7890b4
1579	Barrenjoey Lighthouse	53	9.40000000000000036	-33.58022276642511	151.32982394414145	Palm Beach NSW	\N	\N	https://foursquare.com/item/4d3f5db41bd2a14308f1e77c
1580	Sydney Harbour National Park	53	9.30000000000000071	-33.840835355770494	151.27723217010498	Pacific St.	\N	\N	https://foursquare.com/item/501383cae4b06fc7cec471d9
1581	BodyMindLife Yoga	53	9.30000000000000071	-33.883144354242646	151.2093186378479	84 Mary St (Foxeaux)	\N	\N	https://foursquare.com/item/4e1cde63b0fb93d2d05d9881
1582	Social Brew Cafe	53	9.30000000000000071	-33.871551513671875	151.1949920654297	224 Harris Street	\N	\N	https://foursquare.com/item/52fd53c5498eb13ce1cee1e5
1583	Nomad Restaurant	53	9.30000000000000071	-33.879796	151.210247	16 Foster St	\N	\N	https://foursquare.com/item/52a7892711d21c35ba2619f4
1584	Darling Harbour	53	9.30000000000000071	-33.87166929465029	151.20135677531968	Darling Harbour NSW 2000	\N	\N	https://foursquare.com/item/4e4c74ccb61c258863260564
1585	Grandma's Bar	53	9.30000000000000071	-33.87209716304252	151.20560262594572	Basement 275 Clarence St.	\N	\N	https://foursquare.com/item/4d660757f75c37045157d39a
1586	Bourke Street Bakery	53	9.30000000000000071	-33.88954589506866	151.2149941921234	633 Bourke St. (at Devonshire St.)	\N	\N	https://foursquare.com/item/4bb4231470c603bbdc5e96b4
1587	Rushcutters Bay Park	53	9.30000000000000071	-33.87463382174573	151.23068164583105	New Beach Rd. (New South Head Rd.)	\N	\N	https://foursquare.com/item/4d11b94b1483b1f786a4903e
1588	Mrs Macquarie's Chair	53	9.30000000000000071	-33.85953354690481	151.2225392460823	Mrs Macquaries Rd.	\N	\N	https://foursquare.com/item/50b1d213e4b07e0dfbf15563
1589	The Tea Cosy	53	9.30000000000000071	-33.8573877617544	151.20856226746426	33 George Street	\N	\N	https://foursquare.com/item/546dc466498ee748a95c2999
1590	Bourke Street Bakery	53	9.30000000000000071	-33.920983439374666	151.19362233494877	474 Gardeners Rd. (at Ellis Ave.)	\N	\N	https://foursquare.com/item/4e4a7397ae6014a2fdd1de78
1591	Djerbahood	54	8.40000000000000036	33.82079528726985	10.85453098032572	Erriadh Djerba	\N	\N	https://foursquare.com/item/55d0fc9c498ecf2c7b93503c
1592	RAMA Waffle House: Gauffres De Bruxelles	54	8	33.877889783810964	10.87330777109218	Corniche d’Houmt Souk	\N	\N	https://foursquare.com/item/5228da79498e8fd30fb96c16
1593	Café Ben Daamech	54	8	33.876235	10.858789	تونس	\N	\N	https://foursquare.com/item/5309e00911d2a9634eff36ae
1594	El Sofra	54	7.79999999999999982	33.879132	10.859434	Rue 2 Mars (2 Mars 1934)	\N	\N	https://foursquare.com/item/516561aee4b03b18630287ba
1595	Haroun	54	7.79999999999999982	33.88647516278033	10.85465225126626	Route Du port	\N	\N	https://foursquare.com/item/57af9b5c498e6a715b78ffcd
1596	Park Inn by Radisson Ulysse Resort & Thalasso Djerba	54	7.79999999999999982	33.87017125	10.96263053	Route Touristique Bp 239	\N	\N	https://foursquare.com/item/5209e3ac11d295a4127e9fb9
1597	La Taverne	54	7.70000000000000018	33.85181432440291	10.986614741093776	Zone Touristique	\N	\N	https://foursquare.com/item/525a73fb498eb6864e196059
1598	Café Restaurant Palm	54	7.70000000000000018	33.853244043417	10.980123515192295	Zone Touristique	\N	\N	https://foursquare.com/item/55e4ba59498e88e113690909
1599	Ben Yedder	54	7.70000000000000018	33.8758905996915	10.858318014191454	Houmt-souk	\N	\N	https://foursquare.com/item/53033dc5498eb13ce1ef52b8
1600	Brik Ishak	54	7.59999999999999964	33.865217160937625	10.867943382632921	Hara Kbira	\N	\N	https://foursquare.com/item/5214fb4e11d2ca41a08de5cc
1601	Marché au poisson Houmt souk Djerba	54	7.59999999999999964	33.87508329618277	10.858794450759888	Houmt Souk (Djerba)	\N	\N	https://foursquare.com/item/52c13489498ecaf11d57a28b
1602	Carrefour Market	54	7.40000000000000036	33.8680000943498	10.859729232843602	Houmt Souk	\N	\N	https://foursquare.com/item/514b4859e4b00662a65cdf0a
1603	Souk Couvert  سوق الربعْ	54	7.20000000000000018	33.87651964542943	10.858172178268433	Houmt Souk (Djerba)	\N	\N	https://foursquare.com/item/4fb1704ee4b038224a769158
1604	7ara - Youna	54	7.09999999999999964	33.86503850044471	10.867072318320938	تونس	\N	\N	https://foursquare.com/item/51d1f62f498e3bb083b9709c
1605	L'île aux flamands roses | Ras Rmal | Flamingo Island	54	7	33.910154479442255	10.898137092590332	DJERBA (Djerba)	\N	\N	https://foursquare.com/item/53e9e99b498e693d4598d993
1606	Maazim - Marina Djerba	54	6.90000000000000036	33.88604013111466	10.857182439413753	Marina Djerba	\N	\N	https://foursquare.com/item/532a110f498e874c0ba97942
1607	La Vague	54	6.79999999999999982	33.8846442733135	10.85556178825985	تونس	\N	\N	https://foursquare.com/item/5472df8b498e4c2b1b1101de
1608	El Fondouk	54	6.79999999999999982	33.87766870742116	10.859113633632658	Fondouk Jomni	\N	\N	https://foursquare.com/item/55b69568498e16989a4f8ec5
1609	Magasin Général Maxi	54	6.59999999999999964	33.868135032968624	10.870370864868164	Houmet-Souk	\N	\N	https://foursquare.com/item/52b57ea4498e0e64db44bf8a
1610	Freeday Tea Lounge	54	6.5	33.84623718261719	10.987405776977539	zone touristique	\N	\N	https://foursquare.com/item/54a6cc50498e4fc15ff84d36
1611	Dolce Vita Djerba	54	6.5	33.88384406535616	10.855820870089453	DJERBA (Avenue Habib Bourguiba Route de la Marina)	\N	\N	https://foursquare.com/item/52b80aea498ed649e2924f8d
1612	Café Pâtisserie Hadji	54	6.40000000000000036	33.87565760833768	10.858119563250803	Place Farhat Hached (Avenue Habib Bourguiba)	\N	\N	https://foursquare.com/item/50069449e4b0aba26d745bc7
1613	ElFlouka	54	6.40000000000000036	33.87573367912059	10.889099463929972	Houmt Souk (Rte Zone Touristique)	\N	\N	https://foursquare.com/item/520aaa3811d2989a332de0e2
1614	Salon de thé Le Galion	54	6.40000000000000036	33.88649669034524	10.854508931080453	Houmt Souk	\N	\N	https://foursquare.com/item/4e25fd6c7d8bbc620ea01fca
1615	Café Esskifa	54	6.29999999999999982	33.886597958905725	10.853235595857296	Boulevard de l'environnement	\N	\N	https://foursquare.com/item/539ef8a9498eedc986fe08b0
1616	Nespresso Club	54	6.20000000000000018	33.87657721767251	10.855506664557563	Houmet Souk	\N	\N	https://foursquare.com/item/528ba48211d2388b8bd43293
1617	L'esquina	54	6.09999999999999964	33.87225962232542	10.857397425829252	Rue Taha Hssine (Av. UMA)	\N	\N	https://foursquare.com/item/52fea2c5498e2b04bca23650
1618	Splash	54	5.90000000000000036	33.873159332226116	10.858499927918132	Houmt Souk (Habib Bourguiba)	\N	\N	https://foursquare.com/item/4f45e55be4b00441a2f30e29
1619	Lalla Hadria Museum	54	5.90000000000000036	33.81979150452107	11.044906320813642	Route touristique de Midoun, BP 353	\N	\N	https://foursquare.com/item/55526ab0498e431699a721fb
1620	Café El Medina	54	5.79999999999999982	33.877212178536965	10.860760097225066	Avenue Abdelahmid El Kadhi	\N	\N	https://foursquare.com/item/519b3990498e7ad8a960d097
1621	Englischer Garten	55	9.59999999999999964	48.16579918419036	11.606583595275879	Englischer Garten	\N	\N	https://foursquare.com/item/5176e108e4b01b0f5a9a8c94
1622	Eisbachwelle	55	9.59999999999999964	48.14346078730616	11.587759852409363	Prinzregentenstr. 1 (Lerchenfeldstr.)	\N	\N	https://foursquare.com/item/4e74eed4d1643f93b1b1e690
1623	Hofgarten	55	9.5	48.14250686435078	11.57991069588053	Odeonsplatz	\N	\N	https://foursquare.com/item/4e20307c922e11c0066404b9
1624	Marienplatz	55	9.5	48.13731243735584	11.574947086177028	Marienplatz	\N	\N	https://foursquare.com/item/4e20338e922e11c006640688
1625	Westpark	55	9.5	48.12251642164937	11.517534255981445	Am Westpark	\N	\N	https://foursquare.com/item/5225f01611d25c1a166c25d5
1626	Isarufer an der Reichenbachbrücke	55	9.5	48.12667017148517	11.576478481292725	Reichenbachbrücke	\N	\N	https://foursquare.com/item/4db2dcdffc607e0aa2276101
1627	Viktualienmarkt	55	9.40000000000000036	48.135263070239425	11.576178073883057	Viktualienmarkt 6	\N	\N	https://foursquare.com/item/4f5e5ef9e4b0241544c43fcc
1628	Olympiapark	55	9.40000000000000036	48.169004922955274	11.550407409667969	Spiridon-Louis-Ring 21	\N	\N	https://foursquare.com/item/51cc885f498e3b5c118e279e
1629	Olympiaturm	55	9.40000000000000036	48.17439984337476	11.553733348846436	Spiridon-Louis-Ring 7	\N	\N	https://foursquare.com/item/4b89368e70c603bb582d93b4
1630	Man versus Machine Coffee Roasters	55	9.40000000000000036	48.13125916211425	11.571193390875662	Müllerstr. 23 (Kolosseumstr.)	\N	\N	https://foursquare.com/item/54175c6b498ed93cf31b7c47
1631	True&12	55	9.40000000000000036	48.13138731319113	11.590118321868715	Rosenheimer Str. 14	\N	\N	https://foursquare.com/item/53afffd0498e9f26ded5f255
1632	TRAM Café München	55	9.40000000000000036	48.144030457050256	11.548860810678361	Wredestr. 10 (Postpalast)	\N	\N	https://foursquare.com/item/5690fbeb498efc717ed16bf5
1633	Türkitch	55	9.30000000000000071	48.120252326473796	11.573414496094644	Humboldstr. 20	\N	\N	https://foursquare.com/item/53eb9c43498e7440c0f06200
1634	BMW Museum	55	9.30000000000000071	48.17692369381622	11.558456282742045	Am Olympiapark 2 (Petuelring)	\N	\N	https://foursquare.com/item/4d41dad35605a09025eac554
1635	Schlosspark Nymphenburg	55	9.30000000000000071	48.15776675819899	11.501659509935305	Schloss Nymphenburg 1	\N	\N	https://foursquare.com/item/537f0745498e70147bc86d06
1636	Kreta Grill	55	9.30000000000000071	48.158507	11.574804	Nordendstr. 60	\N	\N	https://foursquare.com/item/51a74cf7498efdaf92d8fc91
1637	Joon	55	9.30000000000000071	48.15082222487646	11.56513481873259	Theresienstr. 114	\N	\N	https://foursquare.com/item/5491fb43498e5aa0c064c074
1638	ELEMENTS	55	9.30000000000000071	48.143434707361116	11.53663780330501	Erika-Mann-Str. 61	\N	\N	https://foursquare.com/item/51041f19e4b05d0d30471457
1639	Bayerische Staatsoper	55	9.30000000000000071	48.139562082292365	11.578909933231628	Max-Joseph-Platz 2	\N	\N	https://foursquare.com/item/4fb2401fe4b09a5434e56571
1640	Anh-Thu	55	9.30000000000000071	48.156381	11.576135158538483	Kurfürstenstr. 31	\N	\N	https://foursquare.com/item/52d45e78498e9245452c2c6e
1641	Luitpoldpark	55	9.30000000000000071	48.17073796031864	11.568359172274741	Karl-Theodor-Straße	\N	\N	https://foursquare.com/item/4bae316c70c603bbc6de95b4
1642	Gärtnerplatz	55	9.30000000000000071	48.13169361147063	11.576014459133148	Gärtnerplatz	\N	\N	https://foursquare.com/item/4f495ef8e4b0570c8e1417f8
1643	Bar Centrale	55	9.30000000000000071	48.136753	11.579530835151672	Ledererstr. 23	\N	\N	https://foursquare.com/item/52df541711d2344fc57824b4
1644	Gelato Naturale	55	9.30000000000000071	48.12782503001275	11.556035610501748	Adlzreiterstr. 1	\N	\N	https://foursquare.com/item/51c2ddf3498ea69f8d359832
1645	Königsplatz	55	9.30000000000000071	48.14590269605444	11.565099067039846	Königsplatz	\N	\N	https://foursquare.com/item/4f6c99e7e4b0d4a5afb67036
1646	Olympiaberg	55	9.30000000000000071	48.16986356895713	11.551555395126343	Olympiapark	\N	\N	https://foursquare.com/item/4c9a6611292a6dcb368cce76
1647	Preysinggarten	55	9.30000000000000071	48.13239354625073	11.59923657423705	Preysingstr. 69 (Walserstr.)	\N	\N	https://foursquare.com/item/4e8d6bd049016b5c6ab0e67c
1648	Tierpark Hellabrunn	55	9.30000000000000071	48.09989922143517	11.553472830126566	Tierparkstr. 30	\N	\N	https://foursquare.com/item/4ba9a9a170c603bb478195b4
1649	Flaucher	55	9.19999999999999929	48.10949796964131	11.558775901794434	Isarauen	\N	\N	https://foursquare.com/item/4f495f23e4b0570c8e144ec4
1650	Vorhoelzer Forum	55	9.19999999999999929	48.148378789217524	11.567734479904175	Arcisstr. 21	\N	\N	https://foursquare.com/item/50ad06f8e4b0aee59c9c2869
1651	Arts on Main	56	9.30000000000000071	-26.204483	28.057946	The Maboneng Precinct (264 Fox Street)	\N	\N	https://foursquare.com/item/4c82f64088e6199c3122bbd4
1652	Neighbourgoods Market	56	9.09999999999999964	-26.194337564704824	28.035011887550354	Cnr Juta St. & de Beer St. (Braamfontein)	\N	\N	https://foursquare.com/item/511917a2e4b063144e6488fd
1653	Origin Coffee	56	9.09999999999999964	-26.204279	28.057547	The Maboneng Precint (Cnr Berea & Fox St.)	\N	\N	https://foursquare.com/item/52f4c83e498eb13ce1a347d8
1654	Market On Main	56	9	-26.20450387250581	28.057861425385774	The Maboneng Precinct (245 Main Street)	\N	\N	https://foursquare.com/item/4faf82cfe4b0ffee0c70f6bf
1655	Dosa Hut	56	9	-26.205239287701836	28.021950895599144	48 Central Road (Main Road)	\N	\N	https://foursquare.com/item/4f5c83a2e4b06784f88f7319
1656	Licorish	56	9	-26.052644822193766	28.020601464450444	Nicolway Shopping Centre (Cnr William Nicol Dr & Wedgewood Link)	\N	\N	https://foursquare.com/item/524188ae11d244aa79579b44
1657	Fishmonger	56	9	-26.129693	28.049826	29 Rudd Rd.	\N	\N	https://foursquare.com/item/4d34c3ba5c2db60c3e94d66c
1658	The Saxon Boutique Hotel	56	8.90000000000000036	-26.112303976203656	28.03596493109904	36 Saxon Road	\N	\N	https://foursquare.com/item/4c167169127f952159392525
1659	Bean There Coffee Roastery	56	8.90000000000000036	-26.18550689	28.019197	44 Stanley Avenue (Owl Street)	\N	\N	https://foursquare.com/item/4ea6d4726da1ce8765931f6a
1660	Cramers Coffee	56	8.90000000000000036	-26.206944252041882	28.04042448939114	17 Harrison St. Marshalltown (at Main St.)	\N	\N	https://foursquare.com/item/51d28afe498ec9022d60e834
1661	Fresh Earth	56	8.80000000000000071	-26.162472	28.011909	103 Komatie Rd, Emmarentia	\N	\N	https://foursquare.com/item/53496cef498e19613d2589a6
1662	44 Stanley Ave	56	8.80000000000000071	-26.185321524634425	28.01885426044464	44 Stanley Ave (Cnr Owl St & Stanley Ave)	\N	\N	https://foursquare.com/item/4d83882e353060fc39d9f6e2
1665	Wakaberry	56	8.80000000000000071	-26.14513309908953	28.043237383703616	Shop FF03,The Zone @ Rosebank (177 Oxford Rd. Rosebank)	\N	\N	https://foursquare.com/item/50df47fbe4b0f6dd0b7c234f
1666	Daleahs	56	8.80000000000000071	-26.194817439109443	28.035021548593285	6 De Beer St.	\N	\N	https://foursquare.com/item/5255542c498e5ba28aa0e7d4
1667	Signature	56	8.80000000000000071	-26.08243087703406	28.059913725187858	Morningside Shopping Centre (cnr Rivonia Rd. & Outspan Rd.)	\N	\N	https://foursquare.com/item/4f59fd88e4b04e4607f58c71
1668	Father Coffee	56	8.69999999999999929	-26.194339971456312	28.034867048263546	73 Juta St. (at De Beer St.)	\N	\N	https://foursquare.com/item/53d79c43498e2691cd24adc0
1669	Dukes Burgers	56	8.69999999999999929	-26.14642498375879	28.009668406617966	14 Gleneagles Rd	\N	\N	https://foursquare.com/item/4d518a3c9b27721e19dfb846
1670	The Smokehouse and Grill	56	8.59999999999999964	-26.1944779357343	28.034832871488636	Cnr. Juta & De Beer Street, Braamfontein	\N	\N	https://foursquare.com/item/541d4a39498e943eba7d451e
1671	Tashas	56	8.59999999999999964	-26.183651097835067	28.135406970977783	Shop 12, Village View Shopping Centre (cnr Van Buuren Rd & Kloof Rd)	\N	\N	https://foursquare.com/item/4de1fddac65b7a3e21104b4d
1672	Melrose Arch	56	8.59999999999999964	-26.132901080075946	28.067944049835205	30 Melrose Blvd. Birnam (at Collins Rd.)	\N	\N	https://foursquare.com/item/4f75c023e4b07c4ad7f3a6cd
1673	The Leopard	56	8.59999999999999964	-26.175241490756427	28.005728452504215	4th Ave	\N	\N	https://foursquare.com/item/5620ec03498e26a1f7895b66
1674	70 Juta Street	56	8.59999999999999964	-26.194327380168026	28.03482143650613	70 Juta St. Braamfontein (at de Beer St.)	\N	\N	https://foursquare.com/item/4cfa16ce7945224b0bfc7de7
1675	Apartheid Museum	56	8.59999999999999964	-26.237496800966788	28.009148040326526	Cnr Northern Park Wy & Gold Reef Rd (at Gold Reef Rd)	\N	\N	https://foursquare.com/item/4eee127ee30021559430c40e
1676	Living Room	56	8.59999999999999964	-26.204390131860865	28.059267103672028	5th Floor 20 Kruger St (Fox St)	\N	\N	https://foursquare.com/item/5207abce11d2b194aa5df3a8
1677	Spar	56	8.59999999999999964	-26.00089306271098	27.982996244474236	Broadacres Shopping Centre (Cnr Cedar Rd & Valley Rd)	\N	\N	https://foursquare.com/item/5266f9c711d2db45983238a3
1678	Walter Sisulu National Botanical Gardens	56	8.59999999999999964	-26.08744048294355	27.84407565779096	Malcolm Rd (Cnr Beacon Rd)	\N	\N	https://foursquare.com/item/513b719be4b0fce93a8c41af
1679	Double Shot Tea & Coffee	56	8.5	-26.1942270500362	28.035867734345995	15 Melle St. Braamfontein (at Juta St.)	\N	\N	https://foursquare.com/item/50a24420e4b0d2d42943bbb8
1680	Little Addis Café	56	8.5	-26.204090825659662	28.059164838613118	280 Fox Street (at Kruger St.)	\N	\N	https://foursquare.com/item/5416dcfa498ee2d5485c177b
1681	Eski Camii	57	9.59999999999999964	41.676801800711765	26.55566644572785	Sabuni Mah. Talat Paşa Cad.	\N	\N	https://foursquare.com/item/51b0a009498ea660640d2fdf
1682	Sultan II. Beyazıt Külliyesi Sağlık Müzesi	57	9.40000000000000036	41.685795063881564	26.54332828690504	Yeniimaret Mah.	\N	\N	https://foursquare.com/item/513dc854e4b012e81ae3d53e
1683	Kada Cafe & Restorant	57	9.40000000000000036	41.662769	26.581177	Margi arkası (Haşim işcan cad.)	\N	\N	https://foursquare.com/item/583095ca4c531271cf34fb31
1684	Üç Şerefeli Camii	57	9.30000000000000071	41.67786002877394	26.553356691407988	Babademirtaş Mah. Hükümet Cad.	\N	\N	https://foursquare.com/item/5144b9c5e4b0b3bba2ea437a
1685	Dar-ül Hadis Camii	57	9.30000000000000071	41.67147093349934	26.548604630065885	Darül Hadis Cad.	\N	\N	https://foursquare.com/item/51446bbbe4b02dd31e74e34b
1686	Tarihi Edirne Tren İstasyonu	57	9.30000000000000071	41.65226480019226	26.521639865188327	Karaağaç	\N	\N	https://foursquare.com/item/55e262cb498e73393f669115
1687	Taner'in Yeri	57	9.19999999999999929	40.87034453348819	26.632301336094194	Keşan	\N	\N	https://foursquare.com/item/5138dad4e4b07895fb3d4c0c
1688	Fratello Pizza & Cafe	57	9.19999999999999929	41.66567	26.58383	Şükrüpaşa mah. İlhami ertem caddesi (İlhami ertem cad.)	\N	\N	https://foursquare.com/item/589df507966e5544683b18c1
1689	Yeniköy Et Lokantası (İsmail'in Yeri)	57	9.19999999999999929	41.34764605364639	26.768776669297036	Yeniköy Beldesi (Uzunköprü)	\N	\N	https://foursquare.com/item/531b6b4c498e45104c3fd52f
1690	Ali İlte Kıyık Et Lokantası	57	9.19999999999999929	41.67789310601807	26.56708239623356	Edirne	\N	\N	https://foursquare.com/item/523491fe11d299d4b980ba27
1691	Eda Edirne Tava Ciğer ve Kahvaltı Evi	57	9.19999999999999929	40.85352366332309	26.632710155143204	Keşan	\N	\N	https://foursquare.com/item/57de901e498e0b80d084943e
1692	Aydın Tava Ciğer	57	9.19999999999999929	41.67586189559912	26.55448565153381	Tahmis Çarşısı No:12 (Şube 1)	\N	\N	https://foursquare.com/item/4fe08c8fe4b096aa57fe8e99
1693	EdrinEt Restaurant	57	9.09999999999999964	41.54760995925033	26.81056186518144	Varos Mah. Telleralti Mevkii No.4 Havsa	\N	\N	https://foursquare.com/item/57a4a10a498e99756f09c2f3
1694	Sezen Restaurant	57	9.09999999999999964	41.67583068108555	26.55224500586256	Alipaşa orta kapı dominos pizza yanı (Orhaniye cad.)	\N	\N	https://foursquare.com/item/562a8247498e05d54d56ee0f
1695	Taşhangar Spor Salonu	57	9.09999999999999964	41.66274432285625	26.579736041849603	Cevat Ağaoğulları Spor Tesisleri Talatpaşa Cad. No:64	\N	\N	https://foursquare.com/item/51594bc4e4b09338534571f7
1696	Öz-En Et Lokantası	57	9.09999999999999964	40.85783929965266	26.693696492144735	Yenimuhacir, Keşan	\N	\N	https://foursquare.com/item/509fe8d2e4b0383a0ed82233
1697	Keyif Pes Cafe	57	9.09999999999999964	41.665464303540915	26.580893668598524	Zübeydede (ZÜBEYDE HANIM CAD.)	\N	\N	https://foursquare.com/item/54186d4d498e30f17056a212
1698	Agop'un Yeri	57	9.09999999999999964	41.55098960919477	26.822781750267193	Havsa	\N	\N	https://foursquare.com/item/51cab334498e21ec39a27479
1699	Komagene	57	9.09999999999999964	40.85295630602589	26.631181240081787	Keşan	\N	\N	https://foursquare.com/item/527961d511d2d0a4bbeebe0d
1700	Vargo Restaurant & Bar	57	9.09999999999999964	41.66588827375157	26.574811743149255	RYS Hotel (Talatpaşa Cad. No: 82)	\N	\N	https://foursquare.com/item/519f9b1b498ee63ea3284e43
1701	Rys LiveLife Fitness & Spa	57	9.09999999999999964	41.66617966694252	26.574385541550328	Rys Hotel (Talatpaşa Caddesi No:82)	\N	\N	https://foursquare.com/item/52794b8411d2afc8cf8c1ab4
1702	Yuvam Cafe - Patisserie	57	9	40.851007403469254	26.63340687322768	Hastane Cad. Şehitlik Karşısı Yıldız Apt. No: 6 Keşan	\N	\N	https://foursquare.com/item/51176aeee4b01c59468b521d
1703	Dalmans Bar	57	9	40.85875358681051	26.630078729460767	Kurtuluş Cad. Keşan	\N	\N	https://foursquare.com/item/53012fb711d262c185bff7f5
1704	Biralem Pub	57	9	40.85267842739415	26.631046084254926	Keşan	\N	\N	https://foursquare.com/item/52eea303498e883559accd3b
1705	Tuna kuaför	57	9	41.665902992961705	26.580260142248598	Zübeyde hanım cad	\N	\N	https://foursquare.com/item/50e94c85e4b0aa6e039fcf85
1706	Rumeli Meyhanesi	57	9	41.67896434453464	26.574022693617337	Kıyık Caddesi No:218	\N	\N	https://foursquare.com/item/56636855498ecaa03837857d
1707	Keçecizade	57	9	41.67654432147857	26.556380679268745	Eski Camii Karşısı Belediye Çarşısı	\N	\N	https://foursquare.com/item/5599947d498eca91be2023c1
1708	Adalı Restaurant	57	9	41.65308926004788	26.52310310568169	Karaağaç (Karaağaç)	\N	\N	https://foursquare.com/item/528a61a611d2ae8b1d6432db
1709	Sisler Bulvarı	57	9	41.652811588767015	26.521881818979896	Karaağaç Mah. İstasyon Cad. No:12	\N	\N	https://foursquare.com/item/551853b0498e445b94c36b16
1710	Şükrüpaşa Atletizm Sahası	57	9	41.66882103870713	26.57216236898612	Ayşekadın	\N	\N	https://foursquare.com/item/53790eb0498e90583b393fbd
1711	Harry Sasson	58	9.5	4.658995865493796	-74.05444482794609	Kr 9 75-70 (KR 9)	\N	\N	https://foursquare.com/item/4e67723c62e1706d8298b01b
1712	Museo Nacional de Colombia	58	9.5	4.6155448214597765	-74.06830072402954	Carrera 7 #28-66 (Calles 28 y 29)	\N	\N	https://foursquare.com/item/518b63d9498e4bb1c8280b6d
1713	Parque El Virrey	58	9.40000000000000036	4.673457325964844	-74.05498410499858	Bogotá, Bogotá D.C.	\N	\N	https://foursquare.com/item/4e5e49b9b61cebc23b6ddad9
1714	Fantasías Del Mar	58	9.40000000000000036	4.625782072867145	-74.14741863739808	Colombia	\N	\N	https://foursquare.com/item/4f86374de4b0c69e7d03f499
1715	Casa San Isidro	58	9.30000000000000071	4.604138923352566	-74.05533406056301	Montserrate	\N	\N	https://foursquare.com/item/519ad4a7498e6a565c2bad05
1716	Koller Koyomad	58	9.30000000000000071	4.702256982494939	-74.05200085101532	Calle 122 (Kr 21)	\N	\N	https://foursquare.com/item/50d4f9b1e4b0b0945dbc4e2f
1717	Gaira	58	9.30000000000000071	4.680732701591784	-74.04755115509033	Cra. 13 # 96 - 11	\N	\N	https://foursquare.com/item/5059f3dde4b0badb9138ec64
1718	Museo Botero	58	9.30000000000000071	4.596906459734501	-74.07322109185324	Cll. 11 (4 - 41)	\N	\N	https://foursquare.com/item/52f5cd6211d262c18583eb7e
1719	Parque de la 93	58	9.30000000000000071	4.676790913075317	-74.04842088430463	Bogotá, Bogotá D.C.	\N	\N	https://foursquare.com/item/4e5e4a1722718258c48c0693
1720	WOK Zona T	58	9.30000000000000071	4.667583540876539	-74.05437598395663	Carrera 13 No. 82-74 (Zona T)	\N	\N	https://foursquare.com/item/520443d6498e738ca2ecd2f2
1721	Wok	58	9.30000000000000071	4.71976827413761	-74.0374625539152	Calle 140 # 11	\N	\N	https://foursquare.com/item/56218c59498e0f047c7f327a
1722	Central Cevichería	58	9.30000000000000071	4.6692696537302165	-74.05351638793945	Kr 13 85-14 (Esquina Cll 85)	\N	\N	https://foursquare.com/item/50ae7471e4b09d9e06741add
1723	Black Bear	58	9.30000000000000071	4.671851785536075	-74.04940767674306	Calle 89 No. 11A -10	\N	\N	https://foursquare.com/item/53ffed56498e8490f7f736a9
1724	Burger Music	58	9.30000000000000071	4.692010516746125	-74.04476052801785	Colombia	\N	\N	https://foursquare.com/item/5643d254498eb3a2f0d902ba
1725	Criterión	58	9.30000000000000071	4.651732539077245	-74.05585527420044	Cll 69A No. 5-75	\N	\N	https://foursquare.com/item/4e669fefaeb7e985aa671f36
1726	Monserrate	58	9.30000000000000071	4.604477299412573	-74.05563811979121	Cerro de Monserrate	\N	\N	https://foursquare.com/item/52ade45f498ebee9c4a4b710
1727	Al Agua Patos - Tostadas & Café	58	9.19999999999999929	4.674848531449621	-74.0484725189199	Calle 93 # 11A -11	\N	\N	https://foursquare.com/item/543cac23498e261799d3939b
1728	Parque Usaquén	58	9.19999999999999929	4.695003040375665	-74.03109954765824	Cra 6 Cll 118	\N	\N	https://foursquare.com/item/4fb85c8ee4b0e055b57b1338
1729	La biferia	58	9.19999999999999929	4.693824073319421	-74.04749719603645	Calle 109 N.17-14 (Media Cuadra De Norberto)	\N	\N	https://foursquare.com/item/55eb4b62498e5f7c11d51b04
1730	La Brasserie	58	9.19999999999999929	4.669590450529867	-74.05362367630005	Carrera 13#85-35	\N	\N	https://foursquare.com/item/4ce33784ce766dcb479022e3
1731	Gurús	58	9.19999999999999929	4.6737349216322475	-74.10858859558529	Calle 53 Carrera 73A	\N	\N	https://foursquare.com/item/53e59a51498e335f685d3276
1732	La Calera	58	9.19999999999999929	4.670322239062849	-74.0156415490068	La Calera, Cundinamarca	\N	\N	https://foursquare.com/item/51df3c74498e12912ce4dfc5
1733	La Divina Comedia Trattoria	58	9.19999999999999929	4.653590187757849	-74.05511605553318	Calle 71 # 5-93	\N	\N	https://foursquare.com/item/5206976611d2d5245906d260
1734	Andrés D.C.	58	9.19999999999999929	4.666361089386578	-74.05439615249634	Cll 82 # 12 - 21	\N	\N	https://foursquare.com/item/513c14a5e4b012e80efd0c40
1735	Primi	58	9.19999999999999929	4.670354372317747	-74.05332037298845	Carrera 13 # 85 - 85	\N	\N	https://foursquare.com/item/53aa2c3111d258938c8f3462
1736	Di Lucca	58	9.19999999999999929	4.669597262034362	-74.05345806170885	Cra.13 No. 85-32	\N	\N	https://foursquare.com/item/4b9bfbfd70c603bb245394b4
1737	La Puerta De Alcalá	58	9.19999999999999929	4.694371683984391	-74.03002085644191	Calle 118 # 5 - 13	\N	\N	https://foursquare.com/item/5206ddcd11d20dd333698001
1738	Starbucks Coffee	58	9.19999999999999929	4.683836650396786	-74.12001306860809	Av. Calle 26 # 92 - 32 Mod. G3	\N	\N	https://foursquare.com/item/55bbe68a498eeb9634967e0b
1739	Museo del Oro del Banco de la República	58	9.09999999999999964	4.60186446043451	-74.07197054619503	Santander Park (at Corner Cr 5 and 16th Street)	\N	\N	https://foursquare.com/item/4f5786b5e4b01cdf1e655e8d
1740	Teatro Colón - Bogotá	58	9.09999999999999964	4.596527884468354	-74.07444298267365	Calle 10 # 5-32	\N	\N	https://foursquare.com/item/57ace0ae498e6a7156e3b817
1741	Parcul Herăstrău	59	9.59999999999999964	44.47483332679881	26.08166502952811	Bd. Aviatorilor/Șos. Nordului (Șos. Kiseleff/Șos. București-Ploiești)	\N	\N	https://foursquare.com/item/51603828e4b06882e7bde2fe
1742	Parcul Alexandru Ioan Cuza (IOR)	59	9.40000000000000036	44.42596506969181	26.15621566772461	Câmpia Libertății/Baba Novac/Constantin Brâncuși (Nicolae Grigorescu/Liviu Rebreanu)	\N	\N	https://foursquare.com/item/4d3b88bcd625224b4ec988fa
1743	Madame Lucie	59	9.40000000000000036	44.45954587932036	26.097164154052734	Str. Tudor Ștefan nr. 26	\N	\N	https://foursquare.com/item/4e2c8e7bfa76bbf847e55441
1744	Grădina Cișmigiu	59	9.40000000000000036	44.43673351982323	26.091039839143512	Bd. Regina Elisabeta (Bd. Schitu Măgureanu)	\N	\N	https://foursquare.com/item/54bbab36498e810feb3700bc
1745	STEAM	59	9.40000000000000036	44.46508210120278	26.085201501846313	Str. Uruguay nr. 22 (Str. Popa Savu)	\N	\N	https://foursquare.com/item/549294a8498e64b154a43bc8
1746	Stejarii Country Club	59	9.30000000000000071	44.515988205165726	26.069816110498394	Str. Jandarmeriei nr. 14	\N	\N	https://foursquare.com/item/52cda171498e5989a05a2f37
1747	Cărturești	59	9.30000000000000071	44.44302073054671	26.099185118611008	Str. Arthur Verona nr. 13-15 (Bd. G-ral Gh. Magheru)	\N	\N	https://foursquare.com/item/4e0e266281dc70f10d7401ce
1748	Camera din față	59	9.30000000000000071	44.444183352389345	26.09655220474413	Str. D. I. Mendeleev nr. 22	\N	\N	https://foursquare.com/item/514c49dee4b0c9592f078b3e
1749	Ceainăria Infinitea	59	9.30000000000000071	44.427878	26.071862	Str. Dr. Grigore Romniceanu nr. 7	\N	\N	https://foursquare.com/item/50fd6a3ce4b0c9eeb9fed60a
1750	Cofetăria Maria	59	9.30000000000000071	44.479200196792576	26.093857934932203	Șos. Pipera	\N	\N	https://foursquare.com/item/4de260742271bfb8449969b2
1751	Paul	59	9.30000000000000071	44.46062559865541	26.094342470169067	Str. Av. Radu Beller nr. 1 (P-ța Dorobanți)	\N	\N	https://foursquare.com/item/4da6d4a86e81162ae785cd0a
1752	Grand Cinema Digiplex	59	9.30000000000000071	44.50625604744321	26.09016726636977	Băneasa Shopping City (Șos. București-Ploiești, nr. 42D)	\N	\N	https://foursquare.com/item/54e9f662498ea7ea5ba1fe95
1753	STEAM	59	9.19999999999999929	44.446637259180335	26.09482329187721	Str. Visarion nr. 2 (Bd. Dacia)	\N	\N	https://foursquare.com/item/558328d8498e6945b8365964
1754	Origo	59	9.19999999999999929	44.43324548655463	26.09539121389389	Str. Lipscani nr. 9 (Str. Ion Brezoianu)	\N	\N	https://foursquare.com/item/51601c17e4b01c5e8208407b
1755	Ateneul Român	59	9.19999999999999929	44.440993597360325	26.09678543587789	Str. Benjamin Franklin nr. 1-3 (Calea Victoriei)	\N	\N	https://foursquare.com/item/4f5775b6e4b084fcb1f24b90
1756	Hard Rock Cafe București	59	9.19999999999999929	44.475532873108364	26.076436042785645	Șos. Kiseleff nr. 32, sect. 1	\N	\N	https://foursquare.com/item/53ee715e498e51b6352db319
1757	French Revolution	59	9.19999999999999929	44.44166826259936	26.09716415405273	Str. Constantin Esarcu nr. 1	\N	\N	https://foursquare.com/item/53f78f0d498ee29eee7a32dd
1758	OSHO	59	9.19999999999999929	44.468244327065506	26.089847087860107	Bd. Primăverii nr. 19-21	\N	\N	https://foursquare.com/item/4d81d17014874eb92f581b8b
1759	Arena Națională (National Arena)	59	9.19999999999999929	44.437145	26.152502	Bd. Basarabia nr. 37-39	\N	\N	https://foursquare.com/item/51390492e4b071615c7a6255
1760	F64 Studio Store	59	9.19999999999999929	44.42671594652015	26.11325740814209	Bd. Unirii nr. 45	\N	\N	https://foursquare.com/item/4fbca04de4b015d26795f64c
1761	Green Tea	59	9.19999999999999929	44.43418587942097	26.1184823513031	Str. Dr. Burghelea nr. 24	\N	\N	https://foursquare.com/item/4de10b3ab0fbe2cfa61506b9
1762	Teatrul Național "I. L. Caragiale"	59	9.19999999999999929	44.43657	26.103638	Bd. Nicolae Bălcescu nr. 2	\N	\N	https://foursquare.com/item/518f754e498e9842aa022d33
1763	Parcul Circului	59	9.19999999999999929	44.45709537838145	26.111626625061035	Bd. Lacul Tei (Aleea Circului)	\N	\N	https://foursquare.com/item/50713953e4b0b4d368cb4131
1764	Starbucks	59	9.19999999999999929	44.452285971329374	26.082959175109863	America House (Bd. Nicolae Titulescu nr. 4-8)	\N	\N	https://foursquare.com/item/4dd21961fa767fb7078b4eda
1765	Animaletto Pizza Bar	59	9.19999999999999929	44.44814284701439	26.095140693664117	Str. Visarion nr. 10	\N	\N	https://foursquare.com/item/575d5506498e435f008d47c9
1766	Cărturești Carusel	59	9.09999999999999964	44.43184638283952	26.10136799071691	Str. Lipscani nr. 55	\N	\N	https://foursquare.com/item/5555308d498e05f2e8a827dc
1767	Orygyns	59	9.09999999999999964	44.44408302674455	26.099263082797034	Str. Jules Michelet, nr. 12	\N	\N	https://foursquare.com/item/56d9c280498e0ae648709a26
1768	Starbucks	59	9.09999999999999964	44.4214902567546	26.126818656921387	București Mall (Calea Vitan nr. 55-59)	\N	\N	https://foursquare.com/item/4e67f760b61cf40ed6e0a624
1769	Băneasa Shopping City	59	9.09999999999999964	44.506827578355136	26.088942036824264	Șos. București-Ploiești nr. 42D	\N	\N	https://foursquare.com/item/526eb79611d27290a76f83b9
1770	Parcul Carol I	59	9.09999999999999964	44.41347458153626	26.096391677856445	Str. Constantin Istrati (Str. Candiano Popescu)	\N	\N	https://foursquare.com/item/4f58a3b8e4b0c4529b9068ff
1771	Palacio del Generalife	60	9.5	37.177053634023586	-3.5854933747007394	Alhambra de Granada	\N	\N	https://foursquare.com/item/5190bfa7498ec5ec2c0ff185
1772	Palacios Nazaríes	60	9.5	37.17734297121476	-3.5897470023055575	La Alhambra	\N	\N	https://foursquare.com/item/4f6c56e0e4b0a6b7705a2ebb
1773	La Alhambra y el Generalife	60	9.5	37.17562008717067	-3.5864353179931636	C. Real de la Alhambra, s/n	\N	\N	https://foursquare.com/item/508bb9e6e4b0702005c6a263
1774	Paseo de los Tristes	60	9.40000000000000036	37.178885581132576	-3.5895252227783203	Paseo de los Tristes	\N	\N	https://foursquare.com/item/50674374e4b0058e9cf3e04f
1775	Museo de La Alhambra	60	9.30000000000000071	37.17659462108737	-3.590211868286133	Planta Baja Palacio de Carlos V	\N	\N	https://foursquare.com/item/4fb682a0e4b080cd6f8ea5ce
1776	Altamura	60	9.30000000000000071	37.18590974807739	-3.608532	Avda Andaluces 2	\N	\N	https://foursquare.com/item/50e73c75e4b0e26343618b09
1777	Bohemia Jazz Cafe	60	9.19999999999999929	37.177070452142985	-3.6031501222024773	Pl. de los Lobos, 44	\N	\N	https://foursquare.com/item/4bf57f7770c603bb9c469cb4
1778	Patio de los Leones	60	9.19999999999999929	37.17707760911515	-3.589270412921905	Palacios Nazaries	\N	\N	https://foursquare.com/item/516d2b67e4b01921483d561b
1779	Carmen de los Mártires	60	9.19999999999999929	37.17193127697156	-3.5869765374809504	Paseo de los Mártires	\N	\N	https://foursquare.com/item/4fe18fc0e4b0b93c90842dd7
1780	Bar Ávila	60	9.09999999999999964	37.17003070034038	-3.5990456475899433	C. de Verónica de la Virgen, 16	\N	\N	https://foursquare.com/item/5203f56f498ed5024a304fc8
1781	Jardines Bajos del Generalife	60	9	37.17622854146467	-3.5849446366738604	El Generalife	\N	\N	https://foursquare.com/item/516d2ea4e4b02ea27bf35172
1782	Alcazaba	60	9	37.17701799293206	-3.590654772047739	Alhambra	\N	\N	https://foursquare.com/item/5186504d498ee26c2cf6a58f
1783	Mirador San Miguel Alto	60	9	37.18371071986603	-3.588380527701028	Granada Andalucía	\N	\N	https://foursquare.com/item/5455d7b2498e2d47a65a71a4
1784	Mirador de San Cristóbal	60	9	37.18313906844375	-3.595984818050887	Carretera de Murcia	\N	\N	https://foursquare.com/item/56edf4a2498e824d146b168c
1785	Parque de las Ciencias	60	8.90000000000000036	37.16258369061486	-3.606844436152113	Avenida de la Ciencia s/n	\N	\N	https://foursquare.com/item/4f2e6a9fe4b07ca31639f9c4
1786	Los Italianos	60	8.90000000000000036	37.17610339938835	-3.5977500879167086	Gran Vía de Colón 4	\N	\N	https://foursquare.com/item/4bafd3e470c603bb470496b4
1787	Siete Gatos	60	8.90000000000000036	37.17659984810543	-3.6049650992556845	C/ Carril del picon 22	\N	\N	https://foursquare.com/item/587ea907fd2716635b3a9344
1788	Fuente de Las Batallas	60	8.90000000000000036	37.17214927655574	-3.5987305641174316	Acera Del Darro	\N	\N	https://foursquare.com/item/4fa4dc3ae4b04193757c7c8c
1789	Saint Germain	60	8.90000000000000036	37.17844040459799	-3.5994115750786855	Postigo de Velutti, 4	\N	\N	https://foursquare.com/item/51484945e4b0bc739653478a
1790	Los Diamantes	60	8.80000000000000071	37.17372199351843	-3.5983187454889642	C. Navas, 28	\N	\N	https://foursquare.com/item/51484877e4b0e01e8d2c3bcf
1791	Cafe 4 Gatos	60	8.80000000000000071	37.179114245905815	-3.5949164628982544	Placeta de la Cruz Verde, 6 Local (on Cuesta San Gregorio)	\N	\N	https://foursquare.com/item/571225d4498ecfc33e13a4ea
1792	Bosque de La Alhambra	60	8.80000000000000071	37.17418196689395	-3.5845244359372597	Cuesta de Gomérez s/n	\N	\N	https://foursquare.com/item/5224d3be11d254b78d4a685c
1793	Poë bar	60	8.80000000000000071	37.174402970689265	-3.6034350120462477	C. Verónica de la Magdalena, 40	\N	\N	https://foursquare.com/item/4dc23636d4c07da169f42616
1794	Los Diamantes	60	8.80000000000000071	37.17675018310547	-3.596149444580078	Pl. Nueva, 13	\N	\N	https://foursquare.com/item/51b4b174498ef03525b123d4
1795	Plaza Nueva	60	8.80000000000000071	37.17685821718118	-3.596217216978186	Plaza Nueva	\N	\N	https://foursquare.com/item/508d26c6e4b09ddc7f39fc18
1796	El Quinteto	60	8.80000000000000071	37.17234054947241	-3.60312045009795	Solarillo de Gracia n4 bajo	\N	\N	https://foursquare.com/item/53611ffd498ea75653cec685
1797	Oum Kalsum	60	8.80000000000000071	37.174036452022364	-3.603461680358312	C. Jardines	\N	\N	https://foursquare.com/item/4d1bc98e5f7c6a312b9fecef
1798	Potemkin	60	8.80000000000000071	37.17448311504656	-3.5946469008922577	Placeta del Hospicio Viejo	\N	\N	https://foursquare.com/item/52e05b45498e1488ece0bc55
1799	Domo Electra Instalaciones Técnicas	60	8.69999999999999929	37.20267155555609	-3.609631061553955	C/ Joaquina Eguaras n.84, local 15	\N	\N	https://foursquare.com/item/4f8ea7e4e4b0634d37297e10
1800	Casa Torcuato	60	8.69999999999999929	37.18393741539657	-3.593623638153076	Placeta de Carniceros	\N	\N	https://foursquare.com/item/55194fa4498ef43520961daf
1801	Amber Fort	61	9.19999999999999929	26.98641885200645	75.85091311000025	Amer Fort	\N	\N	https://foursquare.com/item/50eac7b2e4b05e344d2d0bb6
1802	Tapri - The Tea House & Jizo	61	9	26.905677795410156	75.8111572265625	India	\N	\N	https://foursquare.com/item/50f6c3ffe4b0a61af3452d35
1803	Naturals Ice-Cream	61	8.90000000000000036	26.911066357588815	75.79563878400397	Chomu House Circle	\N	\N	https://foursquare.com/item/4fc5c466e4b05ab8c3b8c334
1804	Jaipur | जयपुर | جے پور (Jaipur)	61	8.90000000000000036	26.918635115731313	75.79798298696886	302001	\N	\N	https://foursquare.com/item/515005a9e4b02f70e938f1e2
1805	Peacock Rooftop	61	8.80000000000000071	26.91637323695081	75.79560472750312	51, Hathroi Fort, Hari Kishan Somani Marg (Ajmer Rd)	\N	\N	https://foursquare.com/item/4e72b25918386b4648d2b1b2
1806	Anokhi Cafe	61	8.59999999999999964	26.910849826114795	75.79860166850264	Ashok Nagar Jaipur, Rajasthan 302005 - 0141 400724	\N	\N	https://foursquare.com/item/4cbed602ca4aa1cd965316b4
1807	Tapri - The Tea House	61	8.59999999999999964	26.89147257634832	75.80350561812735	43, Everest Colony, Lal Kothi (Tonk Road)	\N	\N	https://foursquare.com/item/513c495ee4b06b290567a356
1808	Replay Lounge	61	8.59999999999999964	26.89223092268427	75.80697914717963	India	\N	\N	https://foursquare.com/item/513cded0e4b017814a6055ef
1809	OTH	61	8.5	26.905365067741148	75.79455464807701	E-145,  Behind Talwalkars, C-Scheme (Ramesh Marg)	\N	\N	https://foursquare.com/item/53a2c15c11d2956c99c5fd2c
1810	Birla Temple	61	8.40000000000000036	26.92177824347738	75.79645613758922	J. L. N. Road (Moti Dungri Road)	\N	\N	https://foursquare.com/item/4ce6a88cd8be6a31a1b25642
1811	Raj Mandir Theatre	61	8.40000000000000036	26.915624273108932	75.80982828597934	Panch Batti Circle	\N	\N	https://foursquare.com/item/4d45a28314aa8cfa465a743d
1812	Statue Circle	61	8.40000000000000036	26.90796463625221	75.80463509191607	Statue Cir	\N	\N	https://foursquare.com/item/5310b18011d2929c6675878a
1813	Saffron	61	8.40000000000000036	26.84194479498217	75.79595664428714	Jaipur Marriott Hotel	\N	\N	https://foursquare.com/item/54e76c51498ead7c66277296
1814	Tablu	61	8.40000000000000036	26.846594	75.800848	Hotel Clarks Amer (JLN Marg)	\N	\N	https://foursquare.com/item/4c8c5012b3739521e97707c0
1815	Barbeque Nation	61	8.30000000000000071	26.84019825002163	75.79406650041943	Tonk Road	\N	\N	https://foursquare.com/item/4d626f67d979ba7a366bddc7
1816	Jantar Mantar	61	8.30000000000000071	26.925042515042616	75.82438524766799	Near City Palace (Tulsi Marg)	\N	\N	https://foursquare.com/item/54322b7d498e37ca77135482
1817	Sawai Mansingh Stadium	61	8.30000000000000071	26.89444790752775	75.80343750886944	3020005	\N	\N	https://foursquare.com/item/515aba05e4b03f6bd3f6d5c2
1818	Cinepolis	61	8.30000000000000071	26.85298296105366	75.80489049932254	World Trade Park	\N	\N	https://foursquare.com/item/517ecb9b498eaeaa1abf5b97
1819	Doorbeen	61	8.30000000000000071	26.88796105043057	75.80332966914457	Jaipur	\N	\N	https://foursquare.com/item/547f1fc4498e96f632542770
1820	World Trade Park	61	8.19999999999999929	26.85351772596379	75.80480575561523	JLN Marg	\N	\N	https://foursquare.com/item/4d6ad4a87e3eba7ab8a9ee4c
1821	Palladio	61	8.19999999999999929	26.897990209978136	75.81432890119812	Narain Niwas Palace Hotel (Narain Singh Road)	\N	\N	https://foursquare.com/item/544bd58c498e08bd849652d6
1822	Rambagh Golf Club	61	8.19999999999999929	26.899365713809193	75.80254073394234	India	\N	\N	https://foursquare.com/item/4e315e1ea809ef7b4ecc5bea
1823	NIBS- The Chocolate Workshop	61	8.19999999999999929	26.915598970319	75.79512793563897	India	\N	\N	https://foursquare.com/item/51a85b64498e1b741627d3e9
1824	City Palace	61	8.19999999999999929	26.925489271497494	75.82434552309178	Opposite Hawa Mahal (Johari Bazaar Road)	\N	\N	https://foursquare.com/item/50ff9829e4b09cb49856ab3f
1825	Pizza Hut	61	8.09999999999999964	26.8559805558071	75.80649104199428	Crystal court (malviya nagar)	\N	\N	https://foursquare.com/item/501e94f0e4b0bd21efdc6256
1826	Jaipur Inn	61	8.09999999999999964	26.928573535009573	75.79819299843214	B-17 (12) Shiv Marg, Bani Park	\N	\N	https://foursquare.com/item/4f4601dfe4b02a6145f5ce99
1827	Jaipur Literary Festival	61	8.09999999999999964	26.909836012690402	75.8125865613432	Diggi Palace	\N	\N	https://foursquare.com/item/52d94557498ea7145a579c6b
1828	The Forresta Kitchen & Bar	61	8.09999999999999964	26.92136152247911	75.79322075227549	Devraj Niwas Hotel, Bani Park (Khasa Kothi Crossing)	\N	\N	https://foursquare.com/item/4d803182094114565151c939
1829	Taruveda	61	8.09999999999999964	26.91150004401321	75.78900896554542	Jacob Road (Civil Lines)	\N	\N	https://foursquare.com/item/52f65e6e498e2b04bc780e50
1830	ITC Rajputana	61	8	26.919757183729477	75.7913930110073	Palace Road	\N	\N	https://foursquare.com/item/51c1deb5498e2f6f72336f93
1831	AB Ancienne Belgique	62	9.69999999999999929	50.847381992970455	4.3488026006475895	Boulevard Anspachlaan 110 (Steenstraat 23 Rue des Pierres)	\N	\N	https://foursquare.com/item/4cc876bf7151721e782e6137
1832	Grand Place / Grote Markt (Grote Markt)	62	9.59999999999999964	50.84682859346192	4.352450460194504	Grote Markt	\N	\N	https://foursquare.com/item/514b9dcbe4b09281666b76ba
1833	Ter Kamerenbos / Bois de la Cambre (Ter Kamerenbos)	62	9.59999999999999964	50.806321743168624	4.375214016740363	Terhulpensesteenweg / Chaussée de la Hulpe	\N	\N	https://foursquare.com/item/4e44fb9081dc729d850482e8
1834	Parc de Woluwepark (Woluwepark)	62	9.5	50.82968607835879	4.4300737380981525	Tervurenlaan / Avenue de Tervueren	\N	\N	https://foursquare.com/item/4dd942361838b8561d147404
1835	Kunstberg / Mont des Arts (Kunstberg)	62	9.5	50.843823375669125	4.3569910526275635	Albertinaplein / Place de l'Albertine	\N	\N	https://foursquare.com/item/5403886c498e2d22bd58d784
1836	Le Botanique	62	9.5	50.85472016370727	4.365117279349226	Koningsstraat 236 Rue Royale	\N	\N	https://foursquare.com/item/4ce6c3339f776ea882c65322
1837	Noordzee - Mer du Nord (De Noordzee)	62	9.40000000000000036	50.85027571455164	4.347732067108154	Sint-Katelijnestraat 45	\N	\N	https://foursquare.com/item/4bd03a3f70c603bb2ec498b4
1838	Pizza Liloo	62	9.40000000000000036	50.83280322411446	4.386806488037109	Waversesteenweg 580 Chaussée de Wavre	\N	\N	https://foursquare.com/item/52f34251498ef8019567e9ed
1839	Mary Chocolaterie	62	9.40000000000000036	50.847461241539705	4.3546887469716635	Koninginnegalerij 36 Galerie de la Reine	\N	\N	https://foursquare.com/item/5571333c498ea105e1ca3727
1840	BOZAR	62	9.40000000000000036	50.844221729495764	4.359407255240104	Rue Ravensteinstraat 23 (Koningsstraat / Rue Royale)	\N	\N	https://foursquare.com/item/4c3db4667ea895212caa2247
1841	Peck 47	62	9.40000000000000036	50.8485687258879	4.350891709327698	Kiekenmarkt 47 Rue du Marché aux Poulets	\N	\N	https://foursquare.com/item/537d110f11d255114e33dc5a
1842	La Truffe Noire	62	9.40000000000000036	50.816300315203165	4.37656044960022	Terkamerenlaan 12 Bld. de la Cambre	\N	\N	https://foursquare.com/item/4ecbc15df790bc9a818804ee
1843	Étangs d'Ixelles / Vijvers van Elsene (Vijvers van Elsene)	62	9.40000000000000036	50.82409975731973	4.37292488201534	Avenue du Gén. de Gaullelaan	\N	\N	https://foursquare.com/item/4dc9d4af31510397610f2b18
1844	Lilicup	62	9.40000000000000036	50.82271838571428	4.358256	Edelknaapstraat 65 Rue du Page	\N	\N	https://foursquare.com/item/4c94cc5e533aa0935176c245
1845	Parc Tenboschpark (Tenboschpark)	62	9.40000000000000036	50.820295140338565	4.36438047099347	Parc Tenboschpark	\N	\N	https://foursquare.com/item/4bdc10b670c603bb54e299b4
1846	Le Pigeon Noir	62	9.40000000000000036	50.79222477183768	4.348226626313929	Rue Geleytsbeekstraat 2	\N	\N	https://foursquare.com/item/4e95c5ad0cd60d94b55d5e6e
1847	Brussels Beer Project	62	9.30000000000000071	50.8528	4.34191	Rue Antoine Dansaert 188	\N	\N	https://foursquare.com/item/562c9de2498ec210ef18d5d0
1848	Bar Bik	62	9.30000000000000071	50.855260847621594	4.352066516876221	Arduinkaai 3 Quai aux Pierres de Taille	\N	\N	https://foursquare.com/item/4f071cd0e4b03321183e72b8
1849	La Crèche des Artistes	62	9.30000000000000071	50.834249	4.368164	Kribbestraat 21 Rue de la Crèche	\N	\N	https://foursquare.com/item/52eff03b498e19bd8be8767d
1850	La Braise	62	9.30000000000000071	50.831013	4.3460665999999994	Moskoustraat 32 Rue de Moscou	\N	\N	https://foursquare.com/item/5011b852e4b080ff6a3d9c29
1851	OR Coffee Bar	62	9.30000000000000071	50.84877295182925	4.3486597797190765	Rue Auguste Ortsstraat 9 I	\N	\N	https://foursquare.com/item/4f5b74a8e4b01219ab20d782
1852	Het Goudblommeke in Papier / La Fleur en Papier Doré (Het Goudblommeke in Papier)	62	9.30000000000000071	50.842902041290465	4.350838473105269	Cellebroersstraat 53 Rue des Alexiens	\N	\N	https://foursquare.com/item/4eadc7e330f855f5b3767959
1853	Jubelpark / Parc du Cinquantenaire (Jubelpark)	62	9.30000000000000071	50.84065361162879	4.3921894543526925	Parc du Cinquantenaire / Jubelpark	\N	\N	https://foursquare.com/item/55eb52b9498ec537dc0caacc
1854	Saco Pizza Bar	62	9.30000000000000071	50.852646500000006	4.395245	Av. Milcampslaan 154	\N	\N	https://foursquare.com/item/5613adb3498ee97d54310794
1855	Les Tartes de Françoise	62	9.30000000000000071	50.820319836089105	4.376678466796875	Renbaanlaan 75 Av. de l'Hippodrome	\N	\N	https://foursquare.com/item/4cf7f8579d11b1f7dbe3c8ed
1856	Moeder Lambic	62	9.30000000000000071	50.84508681727177	4.3468040227890015	Place Fontainasplein 8	\N	\N	https://foursquare.com/item/5613ac87498e7d471df94eae
1857	Pastelaria Forcado	62	9.30000000000000071	50.824622418479954	4.354586948932557	Chaussée de Charleroi 196-198	\N	\N	https://foursquare.com/item/547a0408498e421aec17afd0
1858	OR Espresso Bar	62	9.30000000000000071	50.83766882123976	4.381503847237318	Place Jourdanplein 13a	\N	\N	https://foursquare.com/item/5345ba67498e451b2ad76fd4
1859	Monk	62	9.30000000000000071	50.850158869104945	4.3474531173706055	Sint-Katelijnestraat 42 Rue Sainte-Catherine	\N	\N	https://foursquare.com/item/525da56d11d2d2d490d2e08b
1860	Pierre Marcolini	62	9.30000000000000071	50.84132518332477	4.353630244731903	Minimenstraat 1 Rue des Minimes	\N	\N	https://foursquare.com/item/541f465e498e9f5c60367732
1861	Déli Bo.	63	9.40000000000000036	43.700760419089484	7.281757593154907	5 rue Bonaparte (Rue Boyer)	\N	\N	https://foursquare.com/item/54494ca6498e3da1e6a6327a
1862	Colline du Château	63	9.30000000000000071	43.695531454304344	7.279719715687668	Quai des États-Unis (Quai Lunel)	\N	\N	https://foursquare.com/item/4ea32be5d3e32e68684e10a4
1863	Oliviera	63	9.30000000000000071	43.69821474067365	7.2770587351722495	8 rue de Collet	\N	\N	https://foursquare.com/item/57e577e8498ea711c3a12377
1864	Place Masséna	63	9.30000000000000071	43.69731349105142	7.2703724955644145	Place Masséna	\N	\N	https://foursquare.com/item/538f5130498e8507749c7ce2
1865	Le Séjour Café	63	9.19999999999999929	43.699032229786	7.264998692343871	11 rue Grimaldi (Rue Maréchal Joffre)	\N	\N	https://foursquare.com/item/560d51de498e00d75f6d253f
1866	Promenade des Anglais	63	9.19999999999999929	43.69491695539126	7.265499175584206	Promenade des Anglais	\N	\N	https://foursquare.com/item/5631cdbd498ecaf6ff9a5b36
1867	Bagelstein	63	9.19999999999999929	43.698254	7.273795	10 avenue Felix Faure	\N	\N	https://foursquare.com/item/581e6dc2d67cfccd63c58cba
1868	Promenade du Paillon	63	9.19999999999999929	43.697923611659164	7.272985793435717	Théâtre de Verdure à Esplanade de la Bourgada	\N	\N	https://foursquare.com/item/52a864ff11d22c05a3f3ff8a
1869	Fenocchio	63	9.19999999999999929	43.69724688966219	7.276299979704322	2 place Rossetti	\N	\N	https://foursquare.com/item/4e2ee7058130c05c18cebbd7
1870	Mont Boron	63	9.09999999999999964	43.697944588566415	7.298001634819337	Route Forestière du Mont-Boron	\N	\N	https://foursquare.com/item/51b82e08498ef1f76381e956
1871	Hyatt Regency Nice Palais de la Mediterranee	63	9	43.69510567	7.263057232	13 Promenade des Anglais	\N	\N	https://foursquare.com/item/4e6d18fe6365bae5f1f90840
1872	Marché Libération	63	9	43.709677865963684	7.262101230633158	Avenue Malausséna	\N	\N	https://foursquare.com/item/4e57c2f6b9935d203cfd488d
1873	Café de Turin	63	9	43.700760975563654	7.279804025691385	5 place Garibaldi	\N	\N	https://foursquare.com/item/503bc8a5e4b0bd2ec5b113d2
1874	Restaurant Les Garçons	63	8.90000000000000036	43.697343584535936	7.276548743247985	3 rue Centrale	\N	\N	https://foursquare.com/item/564716c5498e8230ebc5fd76
1875	movida	63	8.90000000000000036	43.695045	7.277131	France	\N	\N	https://foursquare.com/item/576a90f3cd1060892b6bd893
1876	Panorama de la Baie des Anges	63	8.90000000000000036	43.69425100549311	7.279382476723137	Quai Rabau Capeu	\N	\N	https://foursquare.com/item/50164984e4b0f164343a820c
1877	Plage de Nice	63	8.80000000000000071	43.69471780297892	7.273979187011719	Quai des États-Unis	\N	\N	https://foursquare.com/item/50313922e4b0a20c89cbb982
1878	Emilie's Cookies	63	8.80000000000000071	43.69701779218611	7.273533940315247	1 rue de la Préfecture	\N	\N	https://foursquare.com/item/51c6bd35498ee2e847b67068
1879	Emilie's Cookies	63	8.80000000000000071	43.69928278808691	7.272031903266907	9 rue Alberti	\N	\N	https://foursquare.com/item/4bffae9770c603bbf34f9db4
1880	Wayne's	63	8.80000000000000071	43.69675793273331	7.274526357650757	15 rue de la Préfecture	\N	\N	https://foursquare.com/item/518ff678498e5714b197b2d3
1881	Olive & Artichaut	63	8.80000000000000071	43.696501950678744	7.2759586572647095	6 rue Sainte-Reparate	\N	\N	https://foursquare.com/item/53db82ca498ef9a7e0874353
1882	Acchiardo	63	8.80000000000000071	43.69664214400875	7.2770271201912	38 rue Droite	\N	\N	https://foursquare.com/item/55a8ee81498e106cf5698da5
1883	Cours Saleya	63	8.80000000000000071	43.69561764062765	7.274987697601318	Cours Saleya	\N	\N	https://foursquare.com/item/4ea32b47b6347b99681de63d
1884	Attimi	63	8.80000000000000071	43.696736511692336	7.271157528063481	10 place Masséna	\N	\N	https://foursquare.com/item/51e6d1cd498e2dededf2d0b3
1885	Café Marché	63	8.69999999999999929	43.695885	7.276881	2 rue Barillerie	\N	\N	https://foursquare.com/item/51ab22ce498e407e96de853d
1886	Parc des Arènes de Cimiez	63	8.69999999999999929	43.72008027299236	7.2758310309269225	184 av des Arènes de Cimiez	\N	\N	https://foursquare.com/item/51b73420498e28962297196e
1887	La Villa d'Este	63	8.69999999999999929	43.69771613188108	7.267901546720992	6 rue Massena	\N	\N	https://foursquare.com/item/51438c31e4b0c4e4e617403f
1888	Musée Marc Chagall	63	8.69999999999999929	43.70916011751574	7.269564270973206	1 avenue Docteur Ménard	\N	\N	https://foursquare.com/item/4d550471b00160fc8b00cc85
1889	Apple Cap 3000	63	8.69999999999999929	43.658902	7.197018	Avenue Eugène Donadeï (Niveau 1)	\N	\N	https://foursquare.com/item/4c7df231724976b0bd6ba50a
1890	Jardin Albert 1er	63	8.69999999999999929	43.69616837594126	7.268554837847027	Avenue de Verdun (Avenue des Phocéens)	\N	\N	https://foursquare.com/item/51b73622498e8cc180d7ce04
1891	Teatro Centro de Arte Leon Febres-Cordero	64	9.09999999999999964	-2.1611332609177394	-79.92605209350586	Km 4.5 via a la Costa	\N	\N	https://foursquare.com/item/5137ea88e4b0a75b6a7d85df
1892	Riviera	64	9.09999999999999964	-2.1675047470975506	-79.91109035794256	Victor Emilio Estrada (Ficus)	\N	\N	https://foursquare.com/item/50e630f3e4b0ee6667931dcd
1893	Il Buco	64	9.09999999999999964	-2.129919	-79.864354	Plaza Nova (Via a Samborondon)	\N	\N	https://foursquare.com/item/52b54394498e31ed158f029d
1894	Wyndham Guayaquil	64	9.09999999999999964	-2.1791447780640825	-79.87585723400116	Calle Numa Pompilio Llona S/N (Ciudad del Río - Puerto Santa Ana)	\N	\N	https://foursquare.com/item/516303cbe4b09bcdac69c3c5
1895	cevicheria Pepe 3	64	9	-2.134386964168908	-79.90361771008885	Ecuador	\N	\N	https://foursquare.com/item/52a21f5c11d2005b75e20087
1896	Parque Samanes	64	9	-2.103923843133024	-79.90386486053467	Av. Francisco de Orellana (Av. Paseo del Parque)	\N	\N	https://foursquare.com/item/5166d270e4b06b5f87dfc037
1897	Sweet & Coffee	64	9	-2.1712151654032836	-79.89022876459757	Av. Carlos Luis Plaza Dañín (Ave. Las Américas)	\N	\N	https://foursquare.com/item/518c2343498e6814988cdf75
1898	Teatro Sanchez Aguilar	64	9	-2.142971431449633	-79.8675799369812	vía Samborondón km 1.5	\N	\N	https://foursquare.com/item/4fc96bd4e4b092e3b956c4ca
1899	La Casa Di Carlo	64	9	-2.1597270903645835	-79.8926289747322	Cdla. Guayaquil Norte (Mz. 19 Villa 9)	\N	\N	https://foursquare.com/item/4fe6762ce4b0daa8b60518cf
1900	Red Crab	64	9	-2.1299887505446806	-79.86434169978436	Plaza Nova (Via samborondon)	\N	\N	https://foursquare.com/item/53815bd9498e6092bf8d1989
1901	FrutaBar	64	9	-2.1690905184081744	-79.91004630273848	Victor Emilio Estrada #608 (Las Monjas)	\N	\N	https://foursquare.com/item/51f1e5a5498edf6fd0a945ca
1902	Supermaxi	64	8.90000000000000036	-2.152429297135905	-79.90533970071682	Av. Rodrigo de Chávez (Urdesa Norte)	\N	\N	https://foursquare.com/item/5273d95a498ed63844e6f5b2
1903	Shawarma cafeteria Javivi	64	8.90000000000000036	-2.165722866970878	-79.91116141883992	Guayacanes (Victor Emilio Estrada)	\N	\N	https://foursquare.com/item/4ff92fb6e4b042cc2b32315b
1904	Malecón 2000	64	8.90000000000000036	-2.1911083576056325	-79.87962112893203	Malecon Simon Bolivar	\N	\N	https://foursquare.com/item/4ec658089a52756c54458368
1905	Dolce Incontro	64	8.90000000000000036	-2.1557933738083124	-79.89188540866763	Torres Del Sol (Joaquín Orrantia)	\N	\N	https://foursquare.com/item/51bcdd0a498e4bed53884cd6
1906	Las Peñas	64	8.80000000000000071	-2.1831906580268745	-79.87576050700925	Guayaquil	\N	\N	https://foursquare.com/item/563eba66cd108c2081feaf42
1907	Red Crab	64	8.80000000000000071	-2.1618111281457706	-79.91580211742044	Victor Emilio Estrada (Laureles)	\N	\N	https://foursquare.com/item/4c61b2d358810f47b571051e
1908	Malecón del Salado	64	8.80000000000000071	-2.186144629378362	-79.89582733056146	Blvd. 9 de Octubre (Tungurahua)	\N	\N	https://foursquare.com/item/4d49853d19ab2d433895aa95
1909	Naturissimo	64	8.80000000000000071	-2.1634599117451008	-79.91344080324203	Victor Emilio Estrada	\N	\N	https://foursquare.com/item/51a41b7a498e1d8e3e16ae53
1910	Guayaquil Tennis Club	64	8.80000000000000071	-2.1869068179359155	-79.89712715148926	Centro (Av. Nueve de Octubre)	\N	\N	https://foursquare.com/item/50edeb8de4b0f379557c8604
1911	Marrecife	64	8.80000000000000071	-2.1575683596436557	-79.89627017065514	Miguel H. Alcívar 13 (Av. Francisco de Orellana, Mz. AG)	\N	\N	https://foursquare.com/item/5372731311d25e11fdfbd5c8
1912	Kabushop Tech To Go	64	8.69999999999999929	-2.15833	-79.899453	Cdla. Kennedy Norte Mz.109 S.19 (Luis Orrantia)	\N	\N	https://foursquare.com/item/514a10e0e4b0257f24b2846b
1913	Hometown Gym	64	8.69999999999999929	-2.1773244401805525	-79.94120954850092	Piazza Ceibos	\N	\N	https://foursquare.com/item/4d95fcb2942ba09359ea478c
1914	Ropa Gallardo	64	8.69999999999999929	-2.1704392382349043	-79.91150379180908	Circunvalación 615 (Av. Las Monjas)	\N	\N	https://foursquare.com/item/517195bce4b070092ec51974
1915	Las Menestras del Vecino	64	8.69999999999999929	-2.139988063462598	-79.90331157488562	Ecuador	\N	\N	https://foursquare.com/item/53e7042b498edc282792c758
1916	Sweet & Coffee	64	8.69999999999999929	-2.229079926281054	-79.89785016218326	Mall Del Sur (Av.25 de Julio & Ernesto Alban)	\N	\N	https://foursquare.com/item/587072f4f84085303fc77516
1917	Dulcería La Palma	64	8.69999999999999929	-2.192050162614084	-79.88365108758532	Gregorio Escobedo 1308 (Entre Velez y Luque)	\N	\N	https://foursquare.com/item/4e230a48c65b2b5e3556f4d6
1918	Isao sushi	64	8.69999999999999929	-2.175078276297808	-79.90541076627095	Balsamos (V.E.E.)	\N	\N	https://foursquare.com/item/4fe60a94e4b00cda58f9a713
1919	Lo Nuestro	64	8.69999999999999929	-2.164571974073338	-79.91240224215473	V.E.Estrada	\N	\N	https://foursquare.com/item/4e5d8412b61cc7d93849d4a8
1920	Chili's	64	8.59999999999999964	-2.141429892422513	-79.86450030446366	CC Riocentro Entrerios	\N	\N	https://foursquare.com/item/51b3d7f9498edca487c3a178
1921	Englischer Garten	55	9.59999999999999964	48.16579918419036	11.606583595275879	Englischer Garten	\N	\N	https://foursquare.com/item/5176e108e4b01b0f5a9a8c94
1922	Eisbachwelle	55	9.59999999999999964	48.14346078730616	11.587759852409363	Prinzregentenstr. 1 (Lerchenfeldstr.)	\N	\N	https://foursquare.com/item/4e74eed4d1643f93b1b1e690
1923	Hofgarten	55	9.5	48.14250686435078	11.57991069588053	Odeonsplatz	\N	\N	https://foursquare.com/item/4e20307c922e11c0066404b9
1924	Marienplatz	55	9.5	48.13731243735584	11.574947086177028	Marienplatz	\N	\N	https://foursquare.com/item/4e20338e922e11c006640688
1925	Westpark	55	9.5	48.12251642164937	11.517534255981445	Am Westpark	\N	\N	https://foursquare.com/item/5225f01611d25c1a166c25d5
1926	Isarufer an der Reichenbachbrücke	55	9.5	48.12667017148517	11.576478481292725	Reichenbachbrücke	\N	\N	https://foursquare.com/item/4db2dcdffc607e0aa2276101
1927	Viktualienmarkt	55	9.40000000000000036	48.135263070239425	11.576178073883057	Viktualienmarkt 6	\N	\N	https://foursquare.com/item/4f5e5ef9e4b0241544c43fcc
1928	Olympiapark	55	9.40000000000000036	48.169004922955274	11.550407409667969	Spiridon-Louis-Ring 21	\N	\N	https://foursquare.com/item/51cc885f498e3b5c118e279e
1929	Olympiaturm	55	9.40000000000000036	48.17439984337476	11.553733348846436	Spiridon-Louis-Ring 7	\N	\N	https://foursquare.com/item/4b89368e70c603bb582d93b4
1930	Man versus Machine Coffee Roasters	55	9.40000000000000036	48.13125916211425	11.571193390875662	Müllerstr. 23 (Kolosseumstr.)	\N	\N	https://foursquare.com/item/54175c6b498ed93cf31b7c47
1931	True&12	55	9.40000000000000036	48.13138731319113	11.590118321868715	Rosenheimer Str. 14	\N	\N	https://foursquare.com/item/53afffd0498e9f26ded5f255
1932	TRAM Café München	55	9.40000000000000036	48.144030457050256	11.548860810678361	Wredestr. 10 (Postpalast)	\N	\N	https://foursquare.com/item/5690fbeb498efc717ed16bf5
1933	Türkitch	55	9.30000000000000071	48.120252326473796	11.573414496094644	Humboldstr. 20	\N	\N	https://foursquare.com/item/53eb9c43498e7440c0f06200
1934	BMW Museum	55	9.30000000000000071	48.17692369381622	11.558456282742045	Am Olympiapark 2 (Petuelring)	\N	\N	https://foursquare.com/item/4d41dad35605a09025eac554
1935	Schlosspark Nymphenburg	55	9.30000000000000071	48.15776675819899	11.501659509935305	Schloss Nymphenburg 1	\N	\N	https://foursquare.com/item/537f0745498e70147bc86d06
1936	Kreta Grill	55	9.30000000000000071	48.158507	11.574804	Nordendstr. 60	\N	\N	https://foursquare.com/item/51a74cf7498efdaf92d8fc91
1937	Joon	55	9.30000000000000071	48.15082222487646	11.56513481873259	Theresienstr. 114	\N	\N	https://foursquare.com/item/5491fb43498e5aa0c064c074
1938	ELEMENTS	55	9.30000000000000071	48.143434707361116	11.53663780330501	Erika-Mann-Str. 61	\N	\N	https://foursquare.com/item/51041f19e4b05d0d30471457
1939	Bayerische Staatsoper	55	9.30000000000000071	48.139562082292365	11.578909933231628	Max-Joseph-Platz 2	\N	\N	https://foursquare.com/item/4fb2401fe4b09a5434e56571
1940	Anh-Thu	55	9.30000000000000071	48.156381	11.576135158538483	Kurfürstenstr. 31	\N	\N	https://foursquare.com/item/52d45e78498e9245452c2c6e
1941	Luitpoldpark	55	9.30000000000000071	48.17073796031864	11.568359172274741	Karl-Theodor-Straße	\N	\N	https://foursquare.com/item/4bae316c70c603bbc6de95b4
1942	Gärtnerplatz	55	9.30000000000000071	48.13169361147063	11.576014459133148	Gärtnerplatz	\N	\N	https://foursquare.com/item/4f495ef8e4b0570c8e1417f8
1943	Bar Centrale	55	9.30000000000000071	48.136753	11.579530835151672	Ledererstr. 23	\N	\N	https://foursquare.com/item/52df541711d2344fc57824b4
1944	Gelato Naturale	55	9.30000000000000071	48.12782503001275	11.556035610501748	Adlzreiterstr. 1	\N	\N	https://foursquare.com/item/51c2ddf3498ea69f8d359832
1945	Königsplatz	55	9.30000000000000071	48.14590269605444	11.565099067039846	Königsplatz	\N	\N	https://foursquare.com/item/4f6c99e7e4b0d4a5afb67036
1946	Olympiaberg	55	9.30000000000000071	48.16986356895713	11.551555395126343	Olympiapark	\N	\N	https://foursquare.com/item/4c9a6611292a6dcb368cce76
1947	Preysinggarten	55	9.30000000000000071	48.13239354625073	11.59923657423705	Preysingstr. 69 (Walserstr.)	\N	\N	https://foursquare.com/item/4e8d6bd049016b5c6ab0e67c
1948	Tierpark Hellabrunn	55	9.30000000000000071	48.09989922143517	11.553472830126566	Tierparkstr. 30	\N	\N	https://foursquare.com/item/4ba9a9a170c603bb478195b4
1949	Flaucher	55	9.19999999999999929	48.10949796964131	11.558775901794434	Isarauen	\N	\N	https://foursquare.com/item/4f495f23e4b0570c8e144ec4
1950	Vorhoelzer Forum	55	9.19999999999999929	48.148378789217524	11.567734479904175	Arcisstr. 21	\N	\N	https://foursquare.com/item/50ad06f8e4b0aee59c9c2869
1951	By the Wine	66	9.59999999999999964	38.709153616201576	-9.14359651924959	Rua das Flores, 41-43	\N	\N	https://foursquare.com/item/54b08e2c498e245e8ec10ba4
1952	Miradouro de São Pedro de Alcântara	66	9.59999999999999964	38.71493809640005	-9.144142411863053	R. de São Pedro de Alcântara	\N	\N	https://foursquare.com/item/4fc129c9e4b021b6dfbeb0c3
1953	Miradouro da Senhora do Monte	66	9.59999999999999964	38.718934175109425	-9.132556915283203	R. Senhora do Monte	\N	\N	https://foursquare.com/item/4d1866e6b15cb1f7f2f6ba21
1954	Jardim da Fundação Calouste Gulbenkian	66	9.5	38.73679354227765	-9.1535150497306	Av. de Berna, 45A (R. do Marquês de Sá Bandeira 56)	\N	\N	https://foursquare.com/item/4d6faecc27316ea8369bb3aa
1955	Largo do Chiado	66	9.5	38.71049477074252	-9.14222627878189	Lg. do Chiado	\N	\N	https://foursquare.com/item/51bca75c498e40021f762157
1956	Miradouro Sophia de Mello Breyner Andresen	66	9.5	38.71637682165282	-9.131666421890259	Largo da Graça	\N	\N	https://foursquare.com/item/4e37b683ae6076788f1676f0
1957	Nannarella	66	9.5	38.71404122087727	-9.153290390968321	R. Nova da Piedade, 68 (R. de São Bento)	\N	\N	https://foursquare.com/item/5206574411d24061041f8d53
1958	Miradouro de Santa Luzia	66	9.5	38.7117175174786	-9.130420558203571	Santa Luzia	\N	\N	https://foursquare.com/item/4c49c90593249c7479f2164d
1959	Taqueria Pistola y Corazon	66	9.40000000000000036	38.708572141392835	-9.147671886621488	R. da Boavista, 16	\N	\N	https://foursquare.com/item/5449b956498e7799c4e9d7c7
1960	Jardim da Estrela	66	9.40000000000000036	38.7146034474489	-9.159650559401827	Av. Álvares Cabral (Estrela)	\N	\N	https://foursquare.com/item/4f05cecd0e0199f87c328ee6
1961	Praça do Comércio (Terreiro do Paço)	66	9.40000000000000036	38.70788649542561	-9.13633271854228	Pç. do Comércio	\N	\N	https://foursquare.com/item/546124ac498efd8a424bd234
1962	Santini	66	9.40000000000000036	38.71112370553906	-9.139691591262817	R. do Carmo, 9	\N	\N	https://foursquare.com/item/4ceceed8d29b2d43edc5ebbb
1963	Centro Cultural de Belém (CCB)	66	9.40000000000000036	38.695458337973925	-9.208345413208008	Pç. do Império (R. Bartolomeu Dias)	\N	\N	https://foursquare.com/item/51570a71e4b03e8de750e078
1964	Frade dos Mares	66	9.40000000000000036	38.708513865176755	-9.152952876745463	Av. D. Carlos I, 55	\N	\N	https://foursquare.com/item/4f8c1c5ee4b0ab5c8a5edc98
1965	Manteigaria	66	9.40000000000000036	38.71067257228431	-9.143780284664157	Rua do Loreto, 2	\N	\N	https://foursquare.com/item/54fb6e3b498e6be5cce1b1b8
1966	Jardim do Torel	66	9.40000000000000036	38.71913722388372	-9.141434604877611	R. Júlio de Andrade	\N	\N	https://foursquare.com/item/4e7ca0a0a80949b571e8b087
1967	Time Out Market Lisbon	66	9.40000000000000036	38.70715	-9.145941	Mercado da Ribeira	\N	\N	https://foursquare.com/item/582242e80df1d63442d1e367
1968	Jardim Vasco da Gama	66	9.30000000000000071	38.696331017116606	-9.202755534122616	Pç. do Império	\N	\N	https://foursquare.com/item/54612a29498e420ffca794cd
1969	Fundação Calouste Gulbenkian	66	9.30000000000000071	38.73714883720705	-9.154439400426023	Av. de Berna, 45 (217823000)	\N	\N	https://foursquare.com/item/4f81f299e4b0bf6ccaee55b0
1970	Casa Nepalesa	66	9.30000000000000071	38.738533	-9.151437	Av. Elias Garcia, 172A	\N	\N	https://foursquare.com/item/5126b94be4b01d957502bfe9
1971	Jardim do Príncipe Real	66	9.30000000000000071	38.716453797659454	-9.14854752313128	Pç. do Príncipe Real (R. D. Pedro V)	\N	\N	https://foursquare.com/item/4bd07c3970c603bbdacb98b4
1972	Cervejaria Ramiro	66	9.30000000000000071	38.72031836570974	-9.13551666309633	Av. Almirante Reis, 1	\N	\N	https://foursquare.com/item/5061eff1e4b05cb4c77dd2ae
1973	Ler Devagar	66	9.30000000000000071	38.702731958431826	-9.178557367900005	R. Rodrigues Faria, 103	\N	\N	https://foursquare.com/item/4d1c6df0aff260fc8e722934
1974	La Brasserie de L'Entrecôte	66	9.30000000000000071	38.71029489180326	-9.143167734146118	R. do Alecrim, 117	\N	\N	https://foursquare.com/item/5146e117e4b027a90daf7fab
1975	Gelato Davvero	66	9.30000000000000071	38.70764809296727	-9.144666688471847	Lisboa	\N	\N	https://foursquare.com/item/564b7f10498ede5d4e14c69f
1976	Rossio	66	9.30000000000000071	38.71373581818702	-9.139375435748326	Pç. Dom Pedro IV	\N	\N	https://foursquare.com/item/54612073498e0b566b81f974
1977	LX Factory	66	9.30000000000000071	38.703091475236064	-9.178833136409638	R. Rodrigues Faria 103	\N	\N	https://foursquare.com/item/51a64959498eabc8e91bb4a6
1978	Casanova	66	9.30000000000000071	38.71366868968222	-9.121715426445007	Av. Infante D. Henrique, Cais da Pedra à Bica do Sapato, Loja 7	\N	\N	https://foursquare.com/item/4ce2e4af3468236ac3e75b36
1979	Fábrica dos Pastéis de Belém	66	9.30000000000000071	38.697405183151275	-9.20327603816986	R. de Belém, 84-92	\N	\N	https://foursquare.com/item/5061f0cfe4b0fb3a321a1b75
1980	São Luiz Teatro Municipal	66	9.30000000000000071	38.709252582101506	-9.142422080039978	R. António Maria Cardoso, 38	\N	\N	https://foursquare.com/item/50ad4ff7e4b0a47cb5bbee5c
1981	Guidos Restaurante	67	9.09999999999999964	20.51370081794205	-86.94718994246347	Rafael E. Melgar (6 y 8)	\N	\N	https://foursquare.com/item/52c8f9d5498e63f80dbbdc07
1982	Malecón	67	9.09999999999999964	20.51056453078555	-86.95097489230082	Av. Rafael E Melgar	\N	\N	https://foursquare.com/item/53b239ad498ec733ab6c2c6b
1983	Marisquería El Pezcozón	67	8.90000000000000036	20.50951636057673	-86.93968273401013	Calle 40 Con 10	\N	\N	https://foursquare.com/item/54a98eb9498edb9d1db2b595
1984	Chankanaab Park	67	8.90000000000000036	20.443673667068317	-86.9937866673532	Rafael E. Melgar	\N	\N	https://foursquare.com/item/523e186911d26067bc92bfe8
1985	Frenchies	67	8.80000000000000071	20.510072105298963	-86.94778655638179	10a Av. Entre Juárez y 2 Norte (Col. Centro)	\N	\N	https://foursquare.com/item/534b776111d22c65ce894708
1986	La Choza	67	8.80000000000000071	20.507957369188514	-86.94998222753117	10 avenida sur (entre Adolfo Rosado Salas y 3 sur)	\N	\N	https://foursquare.com/item/4e1213b5d4c07597ff8656ad
1987	The Money Bar	67	8.80000000000000071	20.457781782370446	-86.98633070993888	Carretera Costera Sur	\N	\N	https://foursquare.com/item/51a91bf8498eedaf0985b2d8
1988	La Cocay Cozumel	67	8.80000000000000071	20.512087834873025	-86.94515705108643	8 st  nt (between 10 and 15 ave)	\N	\N	https://foursquare.com/item/5426e39f498e602b7c8f7e89
1989	Burger House	67	8.69999999999999929	20.507622957229614	-86.9515997171402	5a Av. Sur 337	\N	\N	https://foursquare.com/item/53535227498ed12fd0c43aa1
1990	New Especias	67	8.69999999999999929	20.507835293592095	-86.95118026866257	3 Sur 115 (5ta Av.)	\N	\N	https://foursquare.com/item/553f1a49498e4e4a4235ec11
1991	MARISCOS CAMILO‘S	67	8.69999999999999929	20.511414576560306	-86.94810748100281	5A AVE NTE (2 Y 4 NTE)	\N	\N	https://foursquare.com/item/4fea05bfe4b0b581af06ea3c
1992	Parque Benito Juárez	67	8.69999999999999929	20.51035946429572	-86.94957733154297	Rafael E. Melgar (1 sur)	\N	\N	https://foursquare.com/item/4fd78858e4b0884f34d48fb8
1993	The Thirsty Cougar	67	8.69999999999999929	20.508949	-86.952049	Melgar (3)	\N	\N	https://foursquare.com/item/523c4f6f11d22b1b606a2fc3
1994	Rolandi's	67	8.69999999999999929	20.505290730388555	-86.95765895390934	Av. Rafel E. Melgar (11 av)	\N	\N	https://foursquare.com/item/4fff925be4b09d519ccb8c69
1995	No Name Bar	67	8.59999999999999964	20.505865107066548	-86.95710092782974	628 Avenida Rafael Melgar (btwn 7 St. and 11 St. South)	\N	\N	https://foursquare.com/item/4f6b7428e4b08858d670ba9c
1996	La Cuisine by Nutribalance	67	8.59999999999999964	20.503501	-86.955316	11Avenida	\N	\N	https://foursquare.com/item/5130c867e4b0e80cceab3cb1
1997	Wet Wendy's Margarita House and Restaurant	67	8.59999999999999964	20.511119408679065	-86.94846629601535	5a Avenue Norte, No. 53	\N	\N	https://foursquare.com/item/4fe9f94de4b043efa9c26c78
1998	La Internacional	67	8.59999999999999964	20.506631116921497	-86.95590857250723	México	\N	\N	https://foursquare.com/item/54a822a1498e3522a6941a63
1999	Playa Mia Grand Beach & Water Park	67	8.59999999999999964	20.39593283782113	-87.01903352387666	Carretera Costera Sur Km. 15	\N	\N	https://foursquare.com/item/52e57fc2498ec2554700c67c
2000	La Cucina Italiana	67	8.59999999999999964	20.511532913675094	-86.94528268444093	Calle 6 (15 av)	\N	\N	https://foursquare.com/item/523a2008498e630ad4681058
2001	Del sur	67	8.59999999999999964	20.508134239748358	-86.95113625951598	5ta avenida (Por Rosado Salas y 3sur)	\N	\N	https://foursquare.com/item/56b6acc2498ef9f210285000
2002	Corazón Contento	67	8.59999999999999964	20.510588275577287	-86.94750292117867	Calle 2 nte esquina 10 ave	\N	\N	https://foursquare.com/item/50dc68ebe4b0992ed7fa62b8
2003	Mr. Sanchos	67	8.5	20.389834142696564	-87.0214212492983	Calle 3 (e/ Rafael E. Melgar y 5)	\N	\N	https://foursquare.com/item/4f80b363e4b0a458ba482b8c
2004	Playa Azul	67	8.5	20.54756623505394	-86.9291364314085	San Juan (Zona Hotelera N.)	\N	\N	https://foursquare.com/item/4ff9dab7e4b03e295911ce0d
2005	Isla de la Pasión	67	8.5	20.54736144290676	-86.86357639300071	Zona Norte de Cozumel	\N	\N	https://foursquare.com/item/503d43aae4b0533d48460a81
2006	Le Chef Cozumel	67	8.5	20.507088	-86.952101	5a Av. Sur esquina con calle 5 sur (Esquina calle 5 sur)	\N	\N	https://foursquare.com/item/50fb1434e4b03e4ea68f6b2e
2007	Parque Ecoturístico Punta Sur	67	8.5	20.29259310288992	-87.00262873192601	Carretera costera Sur Km. 25	\N	\N	https://foursquare.com/item/55bc3d62498eea6ec732753e
2008	Taqueria  "El Sitio"	67	8.5	20.510846006881412	-86.94748825034684	Calle 2 (Entre 5 y 10)	\N	\N	https://foursquare.com/item/4e60d571ae60e9edf507da96
2009	Starbucks	67	8.40000000000000036	20.510002286952776	-86.95086242392183	Av. Rafael E Melgar Sur (Entre Calle 1 Sur Y Av Benito Juarez)	\N	\N	https://foursquare.com/item/586e5a754e31c56e49608d14
2010	Los Careycitos	67	8.40000000000000036	20.504307501406803	-86.93743765354156	65 Avenida Norte (Calle 4)	\N	\N	https://foursquare.com/item/4ff10b44e4b0d01fb3112352
2011	Maison Arabe	68	9.40000000000000036	31.630724793404667	-7.996103795293415	1 Derb Assehbe	\N	\N	https://foursquare.com/item/53fb7315498ea6cd3f30942a
2012	La Mamounia	68	9.30000000000000071	31.620871936398835	-7.997211138795032	1 Avenue Bab Jdid	\N	\N	https://foursquare.com/item/5092dce9e4b0abc854e88eae
2013	La Sultana Marrakech	68	9.19999999999999929	31.617054367459577	-7.98852	403 rue de la Kasbah	\N	\N	https://foursquare.com/item/4fe490a3e4b0f148de310a62
2014	Mama Afrika	68	9.19999999999999929	31.631057548726442	-8.004190988691352	Rue Oum Errabia	\N	\N	https://foursquare.com/item/4faf02a5e4b01d7a90446992
2015	Le Pointbar	68	9.09999999999999964	31.639094397814713	-8.014781845155696	مراكش	\N	\N	https://foursquare.com/item/520d5c1511d2cd2f3f0ebf6d
2016	Epicurien	68	9.09999999999999964	31.621416233877056	-8.004781990995431	Rue Ibrahim El Mazini	\N	\N	https://foursquare.com/item/525efa9d11d243acf66a016e
2017	Maison de la Photographie	68	9.09999999999999964	31.631944	-7.984167	46 Ahal Fès (46 Ahal Fès)	\N	\N	https://foursquare.com/item/5092db8be4b08ccc266b24e1
2018	Jardin de Majorelle (حديقة ماجوريل)	68	9.09999999999999964	31.64139909702912	-8.002455280199406	Rue Yves Saint Laurent	\N	\N	https://foursquare.com/item/5092db6ae4b087ea423570f1
2019	Dino Gelato Italiano	68	8.90000000000000036	31.631077055236428	-8.005932063416726	Avenue Mohamed V (@ Rue Sabou)	\N	\N	https://foursquare.com/item/5358e30b498ebf19224517e9
2020	Palais Jad Mahal	68	8.90000000000000036	31.622299	-8.000135	10 Rue Haroune Erracid - Hivernage	\N	\N	https://foursquare.com/item/51d60f75498e0209652a9f39
2021	Grand Café de la Poste	68	8.90000000000000036	31.63308610952808	-8.009902238845825	Boulevard El Mansour Eddahbi (Gueliz) (Av. Imam Malik)	\N	\N	https://foursquare.com/item/50bb99f9e4b09e576337aac8
2022	Nomad	68	8.80000000000000071	31.6286715515487	-7.987463906255973	, Derb Aarjan	\N	\N	https://foursquare.com/item/5609ac7d498e13266b3ce375
2023	Atay	68	8.80000000000000071	31.632608263708743	-7.988496592611409	المغرب	\N	\N	https://foursquare.com/item/588f68e54745862b8ed98829
2024	Pâtisserie Amoud	68	8.80000000000000071	31.653445385986004	-8.019361580709285	Rue Abdelkrim El Khettabi	\N	\N	https://foursquare.com/item/4f5e14e5e4b0c83984f18737
2025	Café des Épices	68	8.80000000000000071	31.629045350501517	-7.987352121507975	75 place Rahba-Kedima	\N	\N	https://foursquare.com/item/513a1b0be4b00e6c42126cdd
2026	Roti d'Or	68	8.80000000000000071	31.626602	-7.986333	المغرب	\N	\N	https://foursquare.com/item/587f8a3604f4d745f08443be
2027	Fogo de chão	68	8.80000000000000071	31.686592619056324	-7.970405433199752	Palmeraie Golf Palace (Circuit de la Palmeraie)	\N	\N	https://foursquare.com/item/516bdbece4b03c7539984524
2028	La Trattoria de Giancarlo	68	8.69999999999999929	31.63386428935031	-8.01520785481077	179 rue Mohamed Beqal (Gueliz)	\N	\N	https://foursquare.com/item/57cdc218498ef0483725f2d1
2029	Les Bains de L'alhambra	68	8.69999999999999929	31.62399597980002	-7.98435529034681	Marrakesh	\N	\N	https://foursquare.com/item/53677734498e0a332ffa53d0
2030	Al Fassia	68	8.69999999999999929	31.636037683425876	-8.013349406133312	55 Boulevard Mohammed Zerktouni	\N	\N	https://foursquare.com/item/4d02a4060e49721e4201667f
2031	Comptoir Darna	68	8.69999999999999929	31.62364025631132	-8.003153800964355	Avenue Echouhada Hivernage	\N	\N	https://foursquare.com/item/51d35c6b498ec834e735dafe
2032	Le Jardin	68	8.69999999999999929	31.63211298197086	-7.988704196295602	32, Souk El Jeld Sidi Abdelaziz-Medina (Souk El Jeld Sidi Abdelaziz-Medina)	\N	\N	https://foursquare.com/item/509403f0e4b0a70261d6e68d
2033	Palais Bahia	68	8.69999999999999929	31.6215091571799	-7.9842062504906375	مراكش	\N	\N	https://foursquare.com/item/4f5a7f84e4b024154138121d
2034	Lotus Club	68	8.59999999999999964	31.624681239782237	-8.004286826573768	Rue Ahmed Chawki	\N	\N	https://foursquare.com/item/547bb881498eac0ff5e0b7eb
2035	Marrakech Medina	68	8.59999999999999964	31.625724158054037	-7.989342980616474	Marrakech-Medina	\N	\N	https://foursquare.com/item/5206f7b111d2f941074da45a
2036	Fayrouz Charwama Loubnane	68	8.59999999999999964	31.639999	-8.018438	Marrakesh	\N	\N	https://foursquare.com/item/53613052498e18687f0a3938
2037	Le monte cristo	68	8.5	31.638720106560516	-8.01632081689962	Marrakesh	\N	\N	https://foursquare.com/item/52dc10fe498e8db73751d9d4
2038	Café Lobo	68	8.5	31.620607804002464	-8.013131081493038	Avenue Mohamed 6, Residence des Oliviers	\N	\N	https://foursquare.com/item/504a7829e4b086b597fa8a30
2039	MARIISNKI CLUB	68	8.5	31.686755714764914	-7.970714099735248	CIRCUIT DE LA PALMERAIE	\N	\N	https://foursquare.com/item/52d2153311d2269699336cc9
2040	16 Café	68	8.5	31.632839	-8.007751	Marrakech Plazza c18 Place du 16 Novembre (Avenue Mohammed 5)	\N	\N	https://foursquare.com/item/5234c00f11d2d42278fcb559
2041	Penny Jakarta	69	9.40000000000000036	-6.250650988404458	106.79186224937439	JL. Radio Dalam Raya 7C	\N	\N	https://foursquare.com/item/529bfc7f498ea9008642e68f
2042	BLOWFISH Kitchen & Bar	69	9.30000000000000071	-6.235892373768076	106.8236826571779	City Plaza at Wisma Mulia (Jalan Jenderal Gatot Subroto Kav. 42)	\N	\N	https://foursquare.com/item/4b612f0f70c603bbfffb90b4
2043	Pondok Indah Golf & Country Club	69	9.30000000000000071	-6.269094709642783	106.78469231499108	Jalan Metro Pondok Indah	\N	\N	https://foursquare.com/item/4d5e0ccb618aa090399fe6e1
2044	Grand Indonesia Shopping Town	69	9.30000000000000071	-6.195122791016753	106.82137231427369	Jalan Mohammad Husni Thamrin No. 1 (Menteng)	\N	\N	https://foursquare.com/item/4f58aa8ee4b0ad7e15f0e2bc
2045	Holycow! Steakhouse	69	9.19999999999999929	-6.291891998110349	106.80139258087202	Cilandak Town Square. Jalan Letnan Jenderal TB Simatupang Kav. 17	\N	\N	https://foursquare.com/item/55ddb1b1498e79e058bda428
2046	Plaza Senayan	69	9.19999999999999929	-6.225639674356958	106.79934170516543	Jalan Asia Afrika No. 8 (Gelora)	\N	\N	https://foursquare.com/item/4bfa07a770c603bb57c19cb4
2047	Marugame Udon	69	9.19999999999999929	-6.145397705154565	106.89185700231236	Mal Artha Gading, Lt. 1 Unit 1F/A (Jalan Artha Gading Selatan No. 1)	\N	\N	https://foursquare.com/item/583841ee1e1de544a83f0a1c
2048	Plaza Senayan XXI	69	9.19999999999999929	-6.225474177148894	106.79969887880189	Plaza Senayan, 5th Floor (Jalan Asia Afrika No. 8)	\N	\N	https://foursquare.com/item/4e7b7089b9939f7f6b35cc98
2049	Plaza Indonesia	69	9.19999999999999929	-6.193387547175869	106.82179866006315	Jalan Mohammad Husni Thamrin Kav. 28-30	\N	\N	https://foursquare.com/item/4c3b262a17689c747c6aaa08
2050	UNION	69	9.19999999999999929	-6.224107999868622	106.7987540981604	Plaza Senayan, Courtyard, GF (Jalan Asia Afrika No. 8)	\N	\N	https://foursquare.com/item/4fb16568e4b0a5d4c19a9161
2051	St. Moritz XXI	69	9.09999999999999964	-6.187815041618333	106.7388378096395	Lippo Mall Puri, Lt. 1 (Jalan Raya Puri Indah Blok U1)	\N	\N	https://foursquare.com/item/5525350b498efdab2f3ab307
2052	DJAKARTA WAREHOUSE PROJECT #DWP13	69	9.09999999999999964	-6.126175096183297	106.83375835418701	Ancol Eco-Park	\N	\N	https://foursquare.com/item/52ab5b7d11d2058aa1537be1
2053	ZARA	69	9.09999999999999964	-6.222673250556149	106.84280582810132	Kota Kasablanka, UG Floor (Jl. Casablanca Raya Kav. 88)	\N	\N	https://foursquare.com/item/57b88b85498e43507b3153a2
2054	Sushi Tei	69	9.09999999999999964	-6.175998784899098	106.79126512397528	Central Park, Lt. 1 #113 (Jalan Letnan Jenderal S Parman Kav. 28)	\N	\N	https://foursquare.com/item/4bf10a7f70c603bb30d59bb4
2055	Starbucks	69	9.09999999999999964	-6.11637543403528	106.7576023990459	Jl. Pantai Indah Utara 2, The Gallery Blok 8	\N	\N	https://foursquare.com/item/56e814ba498e0ce8b2708f97
2056	Por Qué No?	69	9.09999999999999964	-6.198017807301445	106.82875281920018	Jalan HOS Cokroaminoto No. 91	\N	\N	https://foursquare.com/item/55a7450a498edfc7fa0eb2d0
2057	DRAGONFLY	69	9.09999999999999964	-6.229640410139684	106.82045459747314	Graha BIP (Jalan Jendral Gatot Subroto Kav. 23)	\N	\N	https://foursquare.com/item/4b78f34070c603bbc34a92b4
2058	Le Quartier	69	9.09999999999999964	-6.237512009244081	106.80724574476825	Jalan Gunawarman No. 34 (Kebayoran Baru)	\N	\N	https://foursquare.com/item/51ee9c7a498e4a52e56fda4e
2059	Sate Padang Ajo Ramon	69	9.09999999999999964	-6.239708528399909	106.8125796318054	Pasar Santa (Jalan Cipaku 1)	\N	\N	https://foursquare.com/item/4c4c3f1d46240f47b3ac82f4
2060	E&O Jakarta	69	9.09999999999999964	-6.2267021650782794	106.82613706231412	Menara Rajawali 1st Fl. Mega Kuningan (Jl. Dr Ide Anak Agung Gde Agung Lot 5.1)	\N	\N	https://foursquare.com/item/5187a8a3498e8cc9b03c0ebb
2061	Gandaria XXI - IMAX	69	9.09999999999999964	-6.243377370881352	106.78339719772339	Gandaria City, Level 2 (Jalan Sultan Iskandar Muda)	\N	\N	https://foursquare.com/item/50b09f16e4b0be4ddeeb864f
2062	Jet Ski Cafe	69	9.09999999999999964	-6.103185995267072	106.79015636444092	Jalan Pantai Mutiara Blok R No. 57 (Pantai Mutiara)	\N	\N	https://foursquare.com/item/4c38cc162c8020a1dc828b00
2063	Pacific Place	69	9.09999999999999964	-6.224738886878404	106.80986704371506	Sudirman Central Business District (Jalan Jenderal Sudirman Kav. 52-53)	\N	\N	https://foursquare.com/item/4e75e92cae60c3285153cdcb
2064	SKYE	69	9.09999999999999964	-6.196859029813991	106.82258695363998	Menara BCA, Level 56 (Jl. Mohammad Husni Thamrin No. 1)	\N	\N	https://foursquare.com/item/4ff009dee4b04bc47bdbe01d
2065	Taman Impian Jaya Ancol (Ancol Dreamland)	69	9.09999999999999964	-6.125577712106186	106.8400239944458	Jalan Lodan Raya (Ancol, Pademangan)	\N	\N	https://foursquare.com/item/50523fdfe4b0118b88f163e5
2066	BART - Bar at The Rooftop	69	9	-6.188952689726908	106.82476758956909	ARTOTEL Thamrin, 7th Floor (Jalan Sunda No. 3)	\N	\N	https://foursquare.com/item/56f139b0498e9be5c639f52b
2067	All Fresh	69	9	-6.249623020412886	106.79784964724482	Jl. Panglima Polim IX No. 24 (Kebayoran Baru)	\N	\N	https://foursquare.com/item/5168c968e4b05caebd301407
2068	Pagi Sore	69	9	-6.27749424013018	106.79924368858337	Jalan Cipete Raya (Gandaria Selatan)	\N	\N	https://foursquare.com/item/520cf0a611d21b7a2227f4f3
2069	SOCIAL HOUSE	69	9	-6.195936760393364	106.82282995928873	Grand Indonesia East Mall Lt. 1 Unit 12 (Jalan Mohammad Husni Thamrin No. 1)	\N	\N	https://foursquare.com/item/534a574311d22c65ce8360a3
2070	Amped Trampoline Park	69	9	-6.17319390749338	106.89329780929347	Jl. Kirana Avenue No. 88 (Jl. Bukit Heading Raya 1)	\N	\N	https://foursquare.com/item/5688fbb0498e4d05448ffafb
2071	City Center Cinema (سينما السيتي سنتر)	70	9.5	26.233022166215264	50.554362512969384	City Center	\N	\N	https://foursquare.com/item/51d75700498ea1a3f4f66687
2072	City Centre (سيتي سنتر)	70	9.5	26.23330323670397	50.553811310768666	Seef District	\N	\N	https://foursquare.com/item/51f9a76e498e6f1dca4092d9
2073	Café Lilou	70	9.5	26.233147182628567	50.54084300994873	Al Aali Complex (Al Aali Shopping Complex)	\N	\N	https://foursquare.com/item/51b088cf498e19ab1e2660f2
2074	The Meat Co. (ذا ميت كومباني)	70	9.40000000000000036	26.21556176413107	50.59182028675328	3809 Rd.	\N	\N	https://foursquare.com/item/523b165611d20392f20aefc9
2075	Café Lilou	70	9.40000000000000036	26.21479627814436	50.592690606467194	Bldg108, Road 3803, Block 338	\N	\N	https://foursquare.com/item/50df7973e4b0c6dcbf1ab499
2076	Bushido Restaurant	70	9.40000000000000036	26.240286398393753	50.54266694815219	Building 52, Road 38, Block 428, Seef Area, Kingdom of Bahrain (near The Ritz-Carlton Hotel)	\N	\N	https://foursquare.com/item/5226418611d2e179595cf598
2077	Lilou Artisan Patisserie, Adliya	70	9.30000000000000071	26.214784094233682	50.59090444016126	Adliya, Po Box 54123, Kingdom Of Bahrain	\N	\N	https://foursquare.com/item/4ff4a3a3e4b009b18e13ca4f
2078	The Orangery	70	9.30000000000000071	26.20878469804949	50.5961973082774	Shaikh Isa Ave (Shaikh Isa Ave)	\N	\N	https://foursquare.com/item/5714cfa5cd102b825bc42ab6
2202	Restaurante Piqueo	74	9.19999999999999929	6.210893297622093	-75.56454536526624	Cra 35 # (10b - 50)	\N	\N	https://foursquare.com/item/53b2f754498e03772d06369f
2079	P.F. Chang's (بي أف تشانغز)	70	9.30000000000000071	26.233175536410847	50.553927619083716	Bahrain City Centre, 2nd Level	\N	\N	https://foursquare.com/item/5247258511d2851502c86e07
2080	Masso	70	9.30000000000000071	26.208476873575208	50.59580260472755	Shaik Isa Ave	\N	\N	https://foursquare.com/item/540b18ab498e3a2c39b2a063
2081	Maki (ماكي)	70	9.30000000000000071	26.239459285833238	50.58042629043179	Moda Mall	\N	\N	https://foursquare.com/item/51bd95f3498e3371a9ac3af8
2082	Trader Vic's	70	9.19999999999999929	26.24568849898804	50.53819762842761	The Ritz-Carlton Bahrain Hotel & Spa (Seef Area)	\N	\N	https://foursquare.com/item/51d6f47d498e147aaf3dc0cf
2083	Meisei	70	9.19999999999999929	26.212509434849416	50.59377346305602	Building 951, Road 3830	\N	\N	https://foursquare.com/item/5245b53f498e73134a996de8
2084	Ritz Carlton Pool	70	9.19999999999999929	26.244408467499287	50.539072255094254	البحرين	\N	\N	https://foursquare.com/item/5237988c11d24de301b7a418
2085	Mirai	70	9.19999999999999929	26.215495908457882	50.59233134511426	1 Rd No 3803, Adliya (Rd No 3803)	\N	\N	https://foursquare.com/item/4e085c4daeb74c3991158dc1
2086	City Centre Cinema 20	70	9.19999999999999929	26.234099945623854	50.552107166024165	البحرين	\N	\N	https://foursquare.com/item/5380b7a811d2e2f8b11f97f2
2087	Elie & Jean	70	9.09999999999999964	26.234695856854753	50.57425456835009	Regency	\N	\N	https://foursquare.com/item/525a48cb11d2435cb45f9721
2088	Dessange Bahrain	70	9.09999999999999964	26.219447101192817	50.589492747157074	Hassan bin Thabit Avenue, 54123 Al `Adliyah, Al Manamah, Bahrain	\N	\N	https://foursquare.com/item/52345a2c11d2aea45b475365
2089	Moda Mall	70	9.09999999999999964	26.239594947112387	50.5815052986145	King Faisal Hwy (Palace Ave)	\N	\N	https://foursquare.com/item/533413ad498e641d92b0e3d3
2090	Ritz-Lobby cafe	70	9.09999999999999964	26.244046937010843	50.53878913760169	Seef district	\N	\N	https://foursquare.com/item/51dabec6498eb1cf2d137516
2091	Bushido Lounge	70	9.09999999999999964	26.240154979620232	50.54275289975512	Seef Area (near the Ritz-Carlton Hotel)	\N	\N	https://foursquare.com/item/51480e26e4b03c1c53121e99
2092	The Spa @ Four Season Hotel Bahrain Bay	70	9.09999999999999964	26.246917203429856	50.581519052420646	king faisal Highway	\N	\N	https://foursquare.com/item/55f4612e498e1b1bb5b7e2f5
2093	Madeleine	70	9.09999999999999964	26.215114	50.59177	Adliya 338 (R 3819)	\N	\N	https://foursquare.com/item/587f44659538394f1029bdfc
2094	Monsoon Restaurant	70	9.09999999999999964	26.214139162815137	50.5915166897086	Po Box 54123, Kingdom Of Bahrain	\N	\N	https://foursquare.com/item/503bb54ce4b0124e4503b688
2095	The Ritz Gourmet Lounge	70	9.09999999999999964	26.244029461807816	50.5389256405176	Bahrain,Manama	\N	\N	https://foursquare.com/item/5093e82fe4b07ba8c568ad2e
2096	David's Stir Fry Crazy	70	9.09999999999999964	26.20975921247181	50.59014040163117	Adliya Ave	\N	\N	https://foursquare.com/item/51acdcee498e877bd28f931f
2097	Coco's (كوكوز)	70	9.09999999999999964	26.215049826643437	50.59252362558113	Sh Isa Ave	\N	\N	https://foursquare.com/item/524c5380498e6b626e4efe4c
2098	Oliveto	70	9	26.21109845661972	50.5935052771972	Shaikh Isa Avenue	\N	\N	https://foursquare.com/item/53ad9a31498ed8451ce4dfc9
2099	Blaze Burgers & More	70	9	26.215065938738366	50.591850646538994	Building 577 Road 3819 Block 338 (Manuella, Behind Coco's)	\N	\N	https://foursquare.com/item/4e71dafd52b16b24918ae361
2100	Al Bindaira Cafe (مقهى البنديرة)	70	9	26.232912177381735	50.53977499872486	Al A'ali Mall (King Faisal Rd.)	\N	\N	https://foursquare.com/item/51c3f33e498e8dcd907866fd
2101	Sofitel Legend Metropole Hanoi	71	9.30000000000000071	21.025550449995745	105.85599321989015	15 Ngô Quyền (Lê Phụng Hiếu)	\N	\N	https://foursquare.com/item/4d2c8290888af04d570ae9af
2102	Pizza 4P's	71	9.09999999999999964	21.029726	105.848943	2 ngõ Huyện (24-26 Lý Quốc Sư)	\N	\N	https://foursquare.com/item/56402ca6cd1007ed0817fc58
2103	Nhạc Cafe - Music Cafe	71	9	21.032576309050818	105.85535287857056	7 Hàng Thùng	\N	\N	https://foursquare.com/item/562c32e3498ee9e8275f6095
2104	Nộm Hàm Long	71	8.90000000000000036	21.019355850468315	105.85287953923648	25 Hàm Long	\N	\N	https://foursquare.com/item/4f7b09e7e4b0be4638c907c6
2105	Phở Gia Truyền Bát Đàn	71	8.80000000000000071	21.03372291263949	105.84649622440338	49 Bát Đàn	\N	\N	https://foursquare.com/item/536d012411d2b89770e5db76
2106	Phở 10 Lý Quốc Sư	71	8.80000000000000071	21.03044330248281	105.84876537322998	10 Lý Quốc Sư (Chân Cầm)	\N	\N	https://foursquare.com/item/4ed29dc830f81894b0fa95d7
2107	Bánh Mì 25	71	8.80000000000000071	21.03616880390801	105.8486071228981	25 Hàng Cá (Thuốc Bắc)	\N	\N	https://foursquare.com/item/5504525a498e89be27cb52ce
2108	L's Place	71	8.80000000000000071	21.024377085247803	105.84651231765747	63 Lý Thường Kiệt (near Dã Tượng)	\N	\N	https://foursquare.com/item/524ad739498efb69134a3699
2109	Gelato Italia - Italian Artisan Gelato	71	8.80000000000000071	21.068444583817996	105.82426249403744	31 Tô Ngọc Vân	\N	\N	https://foursquare.com/item/53b52913498e92f3eabd5081
2110	Bún Bò Nam Bộ Hàng Điếu	71	8.69999999999999929	21.032257137710285	105.8468243534252	67 Hàng Điếu (btwn Hàng Nón & Yên Thái)	\N	\N	https://foursquare.com/item/4ed29d6561af476c0b3d66de
2111	Duong's Restaurant & Cooking Class	71	8.69999999999999929	21.029434369725973	105.8485695719719	27 Ngõ Huyện	\N	\N	https://foursquare.com/item/584d7d35fad9dc212c44f116
2112	El Gaucho	71	8.69999999999999929	21.0246000880686	105.85643475892448	11 Tràng Tiền	\N	\N	https://foursquare.com/item/5440eb8e498e12b2bd428266
2113	Sofitel Plaza Hotel	71	8.69999999999999929	21.050128683051508	105.83981681782097	1 Thanh Niên (Yên Phụ)	\N	\N	https://foursquare.com/item/53e2a010498e871f21884902
2114	SF Spa	71	8.59999999999999964	21.032959997602084	105.85291394426348	Hanoi Lakeview Hotel, 7 Chợ Cầu Gỗ	\N	\N	https://foursquare.com/item/57f93fdbcd1021717f363ac7
2115	Cộng Càphê	71	8.59999999999999964	21.035043955178615	105.8533096025302	54 Mã Mây	\N	\N	https://foursquare.com/item/55d19d79498edf4cbfc06fcc
2116	Bia Hơi Corner	71	8.59999999999999964	21.034719298985724	105.8521556854248	Tạ Hiện (Lương Ngọc Quyến)	\N	\N	https://foursquare.com/item/4ed28cd60e61efa333a1490c
2117	L'Espace - Institut Français de Hanoï (Trung Tâm Văn Hóa Pháp tại Hà Nội)	71	8.59999999999999964	21.02474544580154	105.85583266050045	24 Tràng Tiền (Trang Tien Alley)	\N	\N	https://foursquare.com/item/4fa9e17fe4b04f8c940361b4
2118	Cafe Giảng	71	8.59999999999999964	21.03351415169256	105.85467434328454	39 Nguyễn Hữu Huân	\N	\N	https://foursquare.com/item/5159bd6ee4b020def7093034
2119	Bookworm	71	8.59999999999999964	21.045154269408346	105.84246084252874	44 Châu Long	\N	\N	https://foursquare.com/item/548c38b9498e52202922f603
2443	Chef's Garden	82	9.19999999999999929	25.309692	51.432879	The club - Shaqab	\N	\N	https://foursquare.com/item/5632052f498e4afd33ed31fb
2120	Orchid Cooking Class & Restaurant	71	8.59999999999999964	21.03389973679935	105.85329813416284	25 Hàng Bạc	\N	\N	https://foursquare.com/item/52cbf24b498eebe58337e660
2121	The Hanoi Social Club	71	8.5	21.029081366825846	105.84609925746918	6 Hội Vũ	\N	\N	https://foursquare.com/item/4fd21808e4b0d4674d707538
2122	Phở Cuốn Hương Mai	71	8.5	21.04598900962956	105.84116298118033	25 Ngũ Xã	\N	\N	https://foursquare.com/item/56d5b57c498efff4434b0fa6
2123	Chả Cá Thăng Long	71	8.5	21.03314859730768	105.84617068036486	21 Đường Thành (Hàng Điếu)	\N	\N	https://foursquare.com/item/4e56a289cc3f386311e6eb9b
2124	Quan An Ngon 18 Phan Boi Chau	71	8.5	21.02638249432632	105.84349751472473	18 Phan Boi Chau (Nam Ngư)	\N	\N	https://foursquare.com/item/4dc2f9a9d4c0ad9c0f4a9602
2125	Yakushi Center for Holistic Health	71	8.5	21.061511642850142	105.83187645693263	6 ngõ 28 Xuân Diệu	\N	\N	https://foursquare.com/item/570e7919498ecd32f9479f50
2126	Phở Hạnh (Nộm Gà Phố Cổ)	71	8.40000000000000036	21.035398854125706	105.84848148225437	65 Lãn Ông	\N	\N	https://foursquare.com/item/4e69ffb5b993d5439efd5ca6
2127	Bánh Cuốn Thanh Vân	71	8.40000000000000036	21.036127541324557	105.84712825483992	14 Hàng Gà	\N	\N	https://foursquare.com/item/51585f5ce4b0edb016f2318e
2128	Starbucks	71	8.40000000000000036	21.025274999330865	105.856996719207	59A Lý Thái Tổ	\N	\N	https://foursquare.com/item/5401931d498ef788117877b3
2129	Cafe Đinh	71	8.40000000000000036	21.03178591460252	105.85214556684016	Tầng 2, 13 Đinh Tiên Hoàng	\N	\N	https://foursquare.com/item/51346a74e4b02e8715f82044
2130	Công Viên Cầu Giấy (Yên Hoà)	71	8.40000000000000036	21.029338854197004	105.78991181952057	Yên Hoà (Trần Thái Tông)	\N	\N	https://foursquare.com/item/56f56406498e7c23ff0db3e9
2131	Ono Seafood	72	9.40000000000000036	21.281093	-157.81384	747 Kapahulu Ave Apt 4 (btwn Winham Ave. & Hunter St.)	\N	\N	https://foursquare.com/item/4cdc45cb4e15a090c245e82b
2132	Leonard's Bakery	72	9.40000000000000036	21.28497574866321	-157.81343758106232	933 Kapahulu Ave (at Charles St)	\N	\N	https://foursquare.com/item/4cdc45604e15a0907a45e82b
2133	Helena's Hawaiian Food	72	9.30000000000000071	21.330874790901106	-157.8652482457923	1240 N School St	\N	\N	https://foursquare.com/item/4d40a2b8cb84b60c46df87ab
2134	Lucky Belly	72	9.30000000000000071	21.311731264428754	-157.86245382864655	50 N Hotel St (Smith)	\N	\N	https://foursquare.com/item/4ffd041fe4b001c1ca54718e
2135	Waikīkī Beach	72	9.30000000000000071	21.2757679454901	-157.82527678592976	Kalākaua Ave	\N	\N	https://foursquare.com/item/4b3044a370c603bb98888fb4
2136	The Kahala Hotel & Resort	72	9.30000000000000071	21.271823334576695	-157.7737505162185	5000 Kahala Avenue	\N	\N	https://foursquare.com/item/4df8c90f814dd2985fdd331d
2137	Hanauma Bay Nature Preserve	72	9.30000000000000071	21.273298807845077	-157.6956081390381	100 Hanauma Bay Rd (off Kalanianaole Hwy)	\N	\N	https://foursquare.com/item/4c3b8bd817f2ef3b90b880f4
2138	Waikiki Pier	72	9.30000000000000071	21.27172795969695	-157.822756036557	2571-2599 Kalakaua Ave	\N	\N	https://foursquare.com/item/52a9e768498efc74a0fd1a37
2139	USS Arizona Memorial	72	9.30000000000000071	21.36495489568263	-157.94974020663477	1 Arizona Memorial Pl	\N	\N	https://foursquare.com/item/4c3b8b6d17f2ef3b73b880f4
2140	Nico's at Pier 38	72	9.30000000000000071	21.31760724306399	-157.87754954506926	1129 N Nimitz Hwy	\N	\N	https://foursquare.com/item/4f10b4a6e4b0a6addf7abf03
2141	Hanauma Beach	72	9.30000000000000071	21.27210223613234	-157.69671122945311	100 Hanauma (كويت)	\N	\N	https://foursquare.com/item/587021d13ef0f6788e624445
2142	Honolulu Museum of Art	72	9.30000000000000071	21.303686562615777	-157.84859823030283	900 S Beretania St (btwn Ward Ave & Victoria St)	\N	\N	https://foursquare.com/item/4e8f8f707ee60278a57f4125
2143	Alan Wong's Honolulu	72	9.19999999999999929	21.295304773044595	-157.8317038377134	1857 S King St (btw Punahou & McCully)	\N	\N	https://foursquare.com/item/4cf7de0587a5594163216c2c
2144	Musubi Cafe IYASUME	72	9.19999999999999929	21.276458071643013	-157.82370507717133	2427 Kuhio Ave (Aqua Pacific Monarch Hotel)	\N	\N	https://foursquare.com/item/4ef709d70e61a0846d2a2546
2145	Morning Glass Coffee + Cafe	72	9.19999999999999929	21.31032943725586	-157.80880737304688	2955 East Manoa Rd	\N	\N	https://foursquare.com/item/4e31f5a0d4c06d6c71da8f50
2146	Sandy Beach Park	72	9.19999999999999929	21.286017916349795	-157.67215765905829	8808 Kalanianaole Hwy	\N	\N	https://foursquare.com/item/521111a211d2db6dd94ff3b7
2147	Fort DeRussy Beach Park	72	9.19999999999999929	21.27913739410871	-157.83433198928833	Kalakaua Ave & Saratoga Rd (Saratoga Rd)	\N	\N	https://foursquare.com/item/4c3b8e0317f2ef3b52b980f4
2148	Roy's Waikiki	72	9.09999999999999964	21.278615231493617	-157.83173044347413	226 Lewers St (At Embassy Suites)	\N	\N	https://foursquare.com/item/52903f3e498e1383ca16e6ea
2149	Diamond Nails	72	9.09999999999999964	21.344823716666667	-157.913733	848 Ala Lilikoi St (Salt Lake Shopping Center)	\N	\N	https://foursquare.com/item/5283daf911d281aaedb4b83d
2150	Livestock Tavern	72	9.09999999999999964	21.311792	-157.862615	49 North Hotel Street, (Corner of Smith & Hotel Streets) (Smith Street)	\N	\N	https://foursquare.com/item/54b996b4498e696744386da2
2151	USS Missouri Memorial	72	9.09999999999999964	21.36260263138508	-157.95377479485583	63 Cowpens St	\N	\N	https://foursquare.com/item/5162dcb3e4b0b09dc67710a4
2152	Hālona Blowhole Lookout	72	9.09999999999999964	21.282353011520147	-157.67692514383396	8480 Kalanianaole Hwy	\N	\N	https://foursquare.com/item/4e3f002fc65b4ec275f7b786
2153	The Pig and the Lady	72	9.09999999999999964	21.311504410627546	-157.8635075563586	83 N King St	\N	\N	https://foursquare.com/item/52d22c3e11d226969a13dfb0
2154	JJ Dolan's	72	9.09999999999999964	21.310950616762007	-157.86048352718353	1147 Bethel St (at Pauahi St)	\N	\N	https://foursquare.com/item/4f00157da69d45461ddb400b
2155	Royal Kitchen	72	9.09999999999999964	21.314874520737753	-157.8605675990987	100 N Beretania St Ste 175	\N	\N	https://foursquare.com/item/4e4a6653d164a7c8b6a54696
2156	Kapiolani Regional Park	72	9.09999999999999964	21.265220381866396	-157.81868934631348	3840 Paki Ave (at Monsarrat Ave.)	\N	\N	https://foursquare.com/item/4c3b8d5217f2ef3b15b980f4
2157	Kuhio Beach Park	72	9.09999999999999964	21.274584	-157.824783	Kalakaua Ave	\N	\N	https://foursquare.com/item/51369b71e4b08286c75ab2f8
2158	Diamond Head Beach	72	9.09999999999999964	21.25589430085009	-157.80635668901633	Honolulu, HI	\N	\N	https://foursquare.com/item/4dfbe5d91520af6936707c3c
2159	Diamond Head State Monument	72	9.09999999999999964	21.262176	-157.806479	off Diamond Head Rd. (btwn Makapu'u & 18th Ave.)	\N	\N	https://foursquare.com/item/4dc09401ae606fe8b719b37f
2160	UFC GYM Honolulu	72	9.09999999999999964	21.29755354949104	-157.85836117834432	805 Pohukaina St	\N	\N	https://foursquare.com/item/50f63ee5e4b0d8574daf5662
2161	Becky's Kitchen	73	9.30000000000000071	14.564487982648416	120.99896013736725	1061 Pablo Ocampo Sr. (cor. Bautista St.)	\N	\N	https://foursquare.com/item/4bc44aca70c603bb2cb097b4
2162	Coco Bango Cafe	73	9.09999999999999964	14.589657	120.975495	Maynila	\N	\N	https://foursquare.com/item/5531bb22498e97915d1dddb8
2163	Wai Ying fastfood (嶸嶸小食館)	73	9.09999999999999964	14.607246233445789	120.97840906861714	Masangkay St (btwn. La Torre St. & Luzon St.)	\N	\N	https://foursquare.com/item/515fae52e4b0d50582ea8706
2164	Cathedral-Basilica of the Immaculate Conception of Manila (Manila Cathedral)	73	9.09999999999999964	14.591567966182167	120.9735918045044	Gen. Antonio Luna St., Intramuros	\N	\N	https://foursquare.com/item/55dd8487498ebfd008ad3e64
2165	Bulalohan sa Ramirez	73	9.09999999999999964	14.614787852532432	121.00461423397064	Nicanor Ramirez St. (corner V. Illustre St.)	\N	\N	https://foursquare.com/item/4d6b5a732ea9b1f74cd0cf28
2166	Wai Ying Fastfood (嶸嶸小食館)	73	9.09999999999999964	14.601914174103213	120.97596019506454	810 Benavidez St, Binondo (Salazar St.)	\N	\N	https://foursquare.com/item/4bdd8d1c70c603bbfa039ab4
2167	San Agustin Church	73	9	14.589385260046807	120.97499751204731	Gen. Antonio Luna St, Intramuros	\N	\N	https://foursquare.com/item/50069998e4b0f0499db28586
2168	Manila Hotel	73	9	14.583220043994443	120.97397804260252	One Rizal Park, (cor. Roxas Blvd)	\N	\N	https://foursquare.com/item/50a492b9e4b0bf59ea09ac1b
2169	Minor Basilica of St. Lorenzo Ruiz of Manila (Binondo Church)	73	9	14.600149294778785	120.97430846681519	Plaza Lorenzo Ruiz (btwn Ongpin St & Norberto Ty St)	\N	\N	https://foursquare.com/item/4ee2ca300e61681b94a94e8b
2170	Ying Ying Tea House	73	8.90000000000000036	14.59783694011496	120.97679013172477	Dasmariñas St., Binondo (at Yuchengco St.)	\N	\N	https://foursquare.com/item/519e63d7498ef21310911312
2171	98B	73	8.90000000000000036	14.599018637123669	120.97929415301112	Escolta St. (Mezzanine Level, First United Building)	\N	\N	https://foursquare.com/item/53e32db6498eaf8ffcf3e88c
2172	Exile On Main Street	73	8.90000000000000036	14.565545873689459	120.99481008964294	2824 Leon Guinto St	\N	\N	https://foursquare.com/item/508a0a0ee4b032d8bd4c9abb
2173	Acustica Bistro & Lounge	73	8.80000000000000071	14.60947921946614	120.99255844153869	2nd floor, Didache Building, 1508 España Street (Corner Valencia Street)	\N	\N	https://foursquare.com/item/54fdbb35498e45bcdd64e3b6
2174	The French Baker	73	8.80000000000000071	14.590215240327549	120.98315931931477	Upper Ground Flr, SM City Manila (at Natividad Almeda-Lopez St & San Marcelino St)	\N	\N	https://foursquare.com/item/524c0a2211d23081d8793565
2175	H&M	73	8.80000000000000071	14.574431897061242	120.98463253144254	Robinson's Place Manila	\N	\N	https://foursquare.com/item/562f9641498ecaf6fa296ad9
2176	Café Pression	73	8.80000000000000071	14.58869030208068	120.97824661571701	IntraMall	\N	\N	https://foursquare.com/item/56af7109498ef068b7a9fa3f
2177	Korean Palace	73	8.80000000000000071	14.570162136194568	120.98611132713758	Pilipinas	\N	\N	https://foursquare.com/item/510b7d56e4b0355d98c77cdb
2178	S&R New York Style Pizza	73	8.80000000000000071	14.603593991227998	120.97356339724469	3/F Lucky Chinatown Mall, Reina Regente St. (Reina Regente St.)	\N	\N	https://foursquare.com/item/57e4aee4498e403247501010
2179	Dairy Queen	73	8.80000000000000071	14.617676250810979	120.9857192239755	SM City San Lazaro (Arsenio H Lacson Ave)	\N	\N	https://foursquare.com/item/52f88f50498ec085e3d205e7
2180	Elorde Boxing Gym- Manila	73	8.80000000000000071	14.621517766961684	120.9912813687926	1555 A. Maceda Street Sampaloc	\N	\N	https://foursquare.com/item/4fe9849ee4b07ebaf31d8261
2181	The Aristocrat	73	8.80000000000000071	14.568288518508078	120.98400950431824	432 San Andres St. (at Roxas Blvd.)	\N	\N	https://foursquare.com/item/4d1f037290662d43a7c7f105
2182	Lam Tin Tea House	73	8.80000000000000071	14.618303714949219	121.00847591118793	E. Rod	\N	\N	https://foursquare.com/item/5764db10498e8156c46aa11d
2183	Jamba Juice	73	8.80000000000000071	14.5744122273393	120.98453170380658	Ground Flr, Robinsons Place Manila (Midtown Wing) (Pedro Gil St)	\N	\N	https://foursquare.com/item/513498a4e4b08f94ab3e398b
2184	Pepper Lunch Express	73	8.69999999999999929	14.603269060430343	120.973699092865	4th Flr, Lucky Chinatown Mall (Reina Regente St.)	\N	\N	https://foursquare.com/item/5470708f498e02332c73f687
2185	Bistro Remedios	73	8.69999999999999929	14.56979614439257	120.98639140004842	Adriatico St	\N	\N	https://foursquare.com/item/4f0837ace4b0e8ed374a6b41
2186	Samgyupsalamat	73	8.69999999999999929	14.565553256145932	120.99498932351459	Kapitan Tikong St	\N	\N	https://foursquare.com/item/51a1d96f498ef682435b2648
2187	Casa Roces	73	8.69999999999999929	14.5934826549318	120.99301213519496	1153 JP Laurel corner Aguado St., San Miguel	\N	\N	https://foursquare.com/item/50ba346fe4b03e068905ea5a
2188	The Barn Manila	73	8.69999999999999929	14.567416943131262	120.99210474618356	Fidel A. Reyes	\N	\N	https://foursquare.com/item/52e46a52498e2936451b04bb
2189	Paradise Dynasty	73	8.69999999999999929	14.531508	120.980249	2nd Floor, S Maison (Conrad)	\N	\N	https://foursquare.com/item/58666df20b7e93345a03ff58
2190	Tanabe Japanese Restaurant	73	8.69999999999999929	14.570388311510756	120.98643061020431	Remedios Circle Malate	\N	\N	https://foursquare.com/item/4d1195923b71a0906c310475
2191	El Tesoro Parque Comercial	74	9.5	6.1971775167435945	-75.55918988824342	Carrera 25A # 1A Sur - 45 (Tr. Superior)	\N	\N	https://foursquare.com/item/4e791f93922ee2d3df0ed7eb
2192	Parque Explora	74	9.40000000000000036	6.269933050679652	-75.56578874588013	Carrera 52 # 73-75	\N	\N	https://foursquare.com/item/4da9ce88b3dccb44d37db083
2193	Il Castello	74	9.40000000000000036	6.210484890067031	-75.56753002144919	Calle 10A	\N	\N	https://foursquare.com/item/50d26cc5e4b0bf2ab1424c22
2194	Urbania Café No. 8	74	9.30000000000000071	6.2096765107288405	-75.57267485863956	Calle 8 #43B - 132	\N	\N	https://foursquare.com/item/556d009f498ec0271aba207b
2195	Mundo Verde	74	9.30000000000000071	6.207988842837984	-75.56702974042786	Medellín, Antioquia	\N	\N	https://foursquare.com/item/4e922f2bdab4ec3b1e7be05c
2196	Malevo Restaurante	74	9.30000000000000071	6.213510513305664	-75.57331848144531	Calle 11A (# 43E 32)	\N	\N	https://foursquare.com/item/54022101498e7bcfadbb89e8
2197	The Market Delicatessen	74	9.30000000000000071	6.198472098175964	-75.5660689687163	Cra 32 #2 Sur 47 (L223)	\N	\N	https://foursquare.com/item/4fd7b6e8e4b078270f343861
2198	Pergamino Café	74	9.19999999999999929	6.208296872359921	-75.56701837038496	Cra 37 (8a - 37)	\N	\N	https://foursquare.com/item/50d65b25e4b0ca3039eda747
2199	Amars	74	9.19999999999999929	6.2387324378052895	-75.60426761302185	Calle 33 # 81 A 41	\N	\N	https://foursquare.com/item/531ce1ec498e03aaf810961c
2200	Valentina	74	9.19999999999999929	6.18606	-75.562009	Mall Complex de la Superior	\N	\N	https://foursquare.com/item/540223d6498e67869a9664cb
2203	Asados Familia García	74	9.19999999999999929	6.273276148145565	-75.58140077469467	Medellín, Antioquia	\N	\N	https://foursquare.com/item/505cb9b0e4b0bcb213406022
2204	El Teatrico Medellín	74	9.19999999999999929	6.242786605313408	-75.59318420513625	Transversal 39 B circular 2 - 46. Av. Nutibara (circular 2 - 46)	\N	\N	https://foursquare.com/item/50663964e4b0bb47b198b5df
2205	Chef Burger	74	9.09999999999999964	6.211377632617196	-75.56909907366358	Calle 11A # 42-05	\N	\N	https://foursquare.com/item/507fa8b7e4b0d17b70b458ed
2206	Crepes & Waffles	74	9.09999999999999964	6.220061404844883	-75.56664884351443	Carrera 38 No. 18-101 (Palmagrande)	\N	\N	https://foursquare.com/item/5664a315498ecaa03a52f994
2207	Carmen	74	9.09999999999999964	6.210017357493215	-75.56583588114647	Carrera 36 # 10A-27	\N	\N	https://foursquare.com/item/4cdcaa78fc973704462ed705
2208	SINKO Bar	74	9.09999999999999964	6.198902195007566	-75.57351052245372	C.C. Rio Sur (Local 301)	\N	\N	https://foursquare.com/item/510d5341e4b0607ce99ee365
2209	La Charcu	74	9.09999999999999964	6.245711969142032	-75.58912576388103	Carrera 70 (Circular 3)	\N	\N	https://foursquare.com/item/519ec4bd498e44bd9916f77f
2210	Teatro Aguila Descalza	74	9.09999999999999964	6.254947494633243	-75.56065100896356	Cra 45D (59-01)	\N	\N	https://foursquare.com/item/4f484f6ee4b06a7741e6a39f
2211	Jardín Botánico Joaquín Antonio Uribe	74	9.09999999999999964	6.270374715066654	-75.56444303312836	Cll. 73 # 51D - 14	\N	\N	https://foursquare.com/item/4e67dbfe8130df3ec0e7b404
2212	Planetario de Medellín	74	9.09999999999999964	6.2689522761787275	-75.56587567661124	Carrera 52 # 71 - 117 (Parque de los Deseos)	\N	\N	https://foursquare.com/item/5120fa63e4b0b8daf02e3a17
2213	Chuscalito	74	9.09999999999999964	6.215660112160346	-75.55268573612038	Las Palmas Km 7	\N	\N	https://foursquare.com/item/4d69835d4c463704b68da3b3
2214	Chef Burger Artesanal	74	9.09999999999999964	6.204455228814303	-75.57194151710978	Calle 3 # 43 - 37	\N	\N	https://foursquare.com/item/55d232f2498ee535bf56e839
2215	Museo El Castillo	74	9.09999999999999964	6.190298711441119	-75.56971873099806	Cll 9 Sur (32-269)	\N	\N	https://foursquare.com/item/52b0cbc2498e22eaeeb6373c
2216	Il Forno Lleras	74	9	6.207423741822074	-75.56779503822327	Cr 37A No. 8 - 09	\N	\N	https://foursquare.com/item/4d51eef871548cfa0d3c219a
2217	Saludpan	74	9	6.246525659008569	-75.58996701859824	Circular 4 No. 70-78	\N	\N	https://foursquare.com/item/4f568cfce4b071452e4d7083
2218	Tea Market	74	9	6.2080320327158525	-75.56581882594399	Carrera 35 8A-69, Barrio Provenza	\N	\N	https://foursquare.com/item/51afb67d498e2beb1c97f2fc
2219	Café Zorba	74	9	6.208572973032264	-75.57053735688515	Calle 8 # 42 - 33 (Parque Lineal de la Presidenta, El Poblado)	\N	\N	https://foursquare.com/item/5091cae7e4b07a066c7c083c
2220	Restaurante El Cielo	74	9	6.2106135557971465	-75.56744474639487	Carrera 40 #10A - 22	\N	\N	https://foursquare.com/item/51830e53498e4de31d551e01
2221	Depot Eatery	75	9.40000000000000036	-36.84897251173474	174.76235926151276	86 Federal St	\N	\N	https://foursquare.com/item/4e519607922e36d08cacfcd2
2222	Auckland Domain	75	9.40000000000000036	-36.86111174031875	174.77503254171353	Domain Dr.	\N	\N	https://foursquare.com/item/4b97391870c603bb63f493b4
2223	Piha Beach	75	9.40000000000000036	-36.95269785478148	174.4685030332834	Piha Beach	\N	\N	https://foursquare.com/item/514806d2e4b06d5da3daf8a8
2224	Ebisu	75	9.30000000000000071	-36.84431480803014	174.76972057538782	116-118 Quay St.	\N	\N	https://foursquare.com/item/4e8a53ee93ad2e858a6c4946
2225	Giapo Ice Cream	75	9.30000000000000071	-36.85112312900929	174.76417779922485	279 Queen St (279 Queen St.)	\N	\N	https://foursquare.com/item/4ca155d3d3c2b60c4c26e5bc
2226	Mount Eden - Maungawhau	75	9.30000000000000071	-36.87750940966855	174.76439237594604	Mount Eden	\N	\N	https://foursquare.com/item/4b5756d470c603bb2f8690b4
2227	Ceremony	75	9.30000000000000071	-36.86063706013632	174.7670692205429	7 Park Road, Grafton	\N	\N	https://foursquare.com/item/556ce6b7498ec2851d44ffda
2228	Takapuna Beach	75	9.19999999999999929	-36.787804773202325	174.77441062879055	The Strand (Gibbons Rd.)	\N	\N	https://foursquare.com/item/4ba8534e70c603bbce5c95b4
2229	Cornwall Park	75	9.19999999999999929	-36.89658528738681	174.78707313537598	Cornwall Park	\N	\N	https://foursquare.com/item/4e59a1c6b993732579ecd79a
2230	Coco's Cantina	75	9.19999999999999929	-36.857957	174.756645	376 Karangahape Rd (at Day St)	\N	\N	https://foursquare.com/item/4bcea52470c603bbf6a098b4
2231	Auckland Zoo	75	9.19999999999999929	-36.863980968053895	174.71987007973584	99 Motions Rd	\N	\N	https://foursquare.com/item/51415ed2e4b09364e082d73c
2232	Mount Victoria Reserve	75	9.19999999999999929	-36.8267035797158	174.79853791651473	26 Kerr St.	\N	\N	https://foursquare.com/item/4da0405e784f3704d90f95af
2233	Pandoro Panetteria	75	9.09999999999999964	-36.84556860695582	174.76642201356876	75 Queen St.	\N	\N	https://foursquare.com/item/5847336c01f0774334cb8b61
2234	Sky Tower	75	9.09999999999999964	-36.848455	174.762185	93 Federal St. (at Victoria St. W)	\N	\N	https://foursquare.com/item/503443f3e4b04e46b752add7
2235	Brothers Beer	75	9.09999999999999964	-36.85007681992739	174.7587586221878	City Works Depot, Shed 3D	\N	\N	https://foursquare.com/item/50fe290de4b0c3b221c087f9
2236	El Sizzling Chorizo	75	9.09999999999999964	-36.85624617851673	174.74620332782047	Ponsonby Central	\N	\N	https://foursquare.com/item/51e8f105498ec9b0c4341fa8
2237	Elliott Stables	75	9.09999999999999964	-36.85044172498553	174.76349036517018	39 Elliott St (at Wellesley St W)	\N	\N	https://foursquare.com/item/51ef9627498e4c2d020c7d83
2238	Albert Park	75	9	-36.85107064977784	174.7674773701518	Princes St.	\N	\N	https://foursquare.com/item/4f8e250de4b0d7a44123b51d
2239	St Heliers Beach	75	9	-36.850480924677726	174.85745743008368	Tamaki Dr	\N	\N	https://foursquare.com/item/4d1fe3e9f7a9a1438209289f
2240	White's & Co.	75	9	-36.84489428346174	174.76999077370738	44 Te Ara Tahuhu Walking Street	\N	\N	https://foursquare.com/item/5171c8d7e4b09098b54e26a9
2241	Silo Park	75	9	-36.84015801272562	174.75487299713436	96 Jellicoe St. (at Beaumont St.)	\N	\N	https://foursquare.com/item/4f0fc2d7e4b07e9ec8b9f81b
2242	Ponsonby Central	75	9	-36.8562447646316	174.74626963027916	Ponsonby Road	\N	\N	https://foursquare.com/item/50d2a275e4b0abb8bf14f486
2243	Little And Friday	75	9	-36.867856104717696	174.77375302496728	11 McColl St	\N	\N	https://foursquare.com/item/4f909e5be4b0ff5a50d98780
2244	Cali All Day Eatery	75	9	-36.870652	174.778157	23-27 Nuffield Street	\N	\N	https://foursquare.com/item/57cb39f5498e4bca8c00254d
2245	Paradise	75	9	-36.892945	174.73652958869934	591 Sandringham Rd	\N	\N	https://foursquare.com/item/4e51902ad4c0b6da5d9c4ea5
2246	K-Mart	75	9	-36.72884587077189	174.7096845087946	Level 2, 219 Don McKinnon Dr (Westfield Albany)	\N	\N	https://foursquare.com/item/571b55ca498e147139d36930
2247	Clooney	75	9	-36.849365003189874	174.7546945171969	33 Sale St (btwn Union St & Centre St)	\N	\N	https://foursquare.com/item/4d39e0860edc5941b2cc8dec
2248	Jervois Steak House	75	8.90000000000000036	-36.846028	174.741948	70 Jervois Road	\N	\N	https://foursquare.com/item/50f4968de4b08acd57d49488
2249	Mission Bay	75	8.90000000000000036	-36.84799871644178	174.83138433477865	Tamaki Dr.	\N	\N	https://foursquare.com/item/4cb11b67dd619c746105e490
2250	Farro Fresh Food	75	8.90000000000000036	-36.85526529290232	174.73308412988405	34 Westmoreland Street West	\N	\N	https://foursquare.com/item/551f578e498ea5a9a572c7a2
2251	Bayon Temple	76	9.5	13.441299066241704	103.85895252227783	Angkor Thom	\N	\N	https://foursquare.com/item/4e9575bee5fa7b6a9f1c2794
2252	Ta Prohm	76	9.40000000000000036	13.435	103.889167	Petit Circuit Rd.	\N	\N	https://foursquare.com/item/513ec2e9e4b03cf1a0e6d905
2253	Angkor Wat (អង្គរវត្ត) (អង្គរវត្ត)	76	9.40000000000000036	13.412413363616244	103.8657546043396	Angkor Archaeological Park	\N	\N	https://foursquare.com/item/505d1534e4b04d802ade3396
2254	Angkor Thom (អង្គរធំ) (អង្គរធំ)	76	9.30000000000000071	13.441111236923927	103.85927438735962	The Bayon Complex	\N	\N	https://foursquare.com/item/4e95739de5fa7b6a9f1b7562
2255	Genevieve's	76	9.09999999999999964	13.354277508785243	103.85238014205893	Sok San Rd	\N	\N	https://foursquare.com/item/56e161e3498edc4b1cf2a4c4
2256	Gelato Lab	76	9.09999999999999964	13.354207790622524	103.85410132899464	Alley W	\N	\N	https://foursquare.com/item/5662b427498ee473643b83bc
2257	Angkor Archaelogical Park	76	9	13.388534120165948	103.86397361755371	Siĕmréab	\N	\N	https://foursquare.com/item/508b6812e4b0306b577cf780
2258	Sister Srey Cafe	76	9	13.353861327933988	103.85626416714787	Achar Hem Cheav (Hospital St.)	\N	\N	https://foursquare.com/item/526b75e8498e53a91619dd38
2259	Marum	76	9	13.364615459879476	103.86267361719548	8A B Phum Slorkram	\N	\N	https://foursquare.com/item/51826cb0498edcae389e74db
2260	Lilypop	76	8.90000000000000036	13.36118697216883	103.85380268096924	Taphul road	\N	\N	https://foursquare.com/item/5596723e498efc67ee4a7074
2261	Phare the Cambodian Circus Siem Reap	76	8.90000000000000036	13.354045518112382	103.84028715378628	Komay Road (in front of Angkor Century Resort) (Behind Angkor National Museum)	\N	\N	https://foursquare.com/item/5278bb7f11d293a0a9e4a821
2262	HAVEN Training Restaurant	76	8.80000000000000071	13.349730831445587	103.86068620242959	Chocolate Rd	\N	\N	https://foursquare.com/item/5103b1b2e4b0b83dbd979607
2263	Miss Wong	76	8.80000000000000071	13.355176596403913	103.85463354252256	The Lane	\N	\N	https://foursquare.com/item/52c7f863498edfbd416841ca
2264	l'Annexe "French Restaurant"	76	8.80000000000000071	13.354814	103.849307	Sok San Rd	\N	\N	https://foursquare.com/item/550d1c62498e003a0b0556de
2265	Bodia Spa	76	8.69999999999999929	13.354947680997183	103.85530730518879	Old market area (Above U-Care Pharmacy)	\N	\N	https://foursquare.com/item/519e38ae498e4f27e5649d95
2266	The Little Red Fox	76	8.59999999999999964	13.357356071472168	103.85655975341797	593 Hap Guan Street	\N	\N	https://foursquare.com/item/562b189c498e2216c668c5ba
2267	Georges Rhumerie	76	8.59999999999999964	13.347847229164513	103.85895927014118	Georges lane	\N	\N	https://foursquare.com/item/56d54c7f498ec998286bf506
2268	Asana Old Wooden House	76	8.59999999999999964	13.355434778340578	103.8545316291326	Siĕmréab	\N	\N	https://foursquare.com/item/52e685fd498eda40bba8676c
2269	Preah Khan	76	8.59999999999999964	13.462084601019276	103.8716983795166	Grand Circuit Rd.	\N	\N	https://foursquare.com/item/4db844196e81c67f61c9e423
2270	Madame Butterfly	76	8.59999999999999964	13.369445553573751	103.84504269489247	National Road 6 (Airport Road, opposite Ford Dealership)	\N	\N	https://foursquare.com/item/55fa8758498ea1d6f8262feb
2271	Il Forno Siem Reap	76	8.5	13.35491272	103.85440514	Bar Street Alley	\N	\N	https://foursquare.com/item/51696b0ae4b0befefc933749
2272	Angkor Thom South Gate	76	8.5	13.428060273916815	103.85958209565325	Angkor Archaelogical Park	\N	\N	https://foursquare.com/item/5411cd97498eb7d6db9c9482
2273	Chanrey Tree	76	8.5	13.356137	103.857464	Pokombo Ave.	\N	\N	https://foursquare.com/item/53c51ae5498eab69ebb0bdb6
2274	artillery cafe	76	8.5	13.3544046380917	103.85907817297334	កម្ពុជា	\N	\N	https://foursquare.com/item/55cff830498e53d438d79296
2275	Khmer Touch Cuisine	76	8.5	13.354829399037442	103.8537672811421	Sivutha Blvd, Old Market Area	\N	\N	https://foursquare.com/item/58524784e612f27f1336f9ff
2276	Bloom Cakes	76	8.40000000000000036	13.357155719897596	103.85525634823182	Mondul 1 Snagkat Svay Dangkum, Central Market (Behind Siem Reap Hospital), Siem Reap, Cambodia	\N	\N	https://foursquare.com/item/53fae0cd498e6c5bbff2e8a8
2277	Olive, Cuisine de Saison	76	8.40000000000000036	13.354521	103.85631	9th Street	\N	\N	https://foursquare.com/item/5869f495f84085303f7d28a2
2278	Temple Coffee n Bakery	76	8.40000000000000036	13.3550345863867	103.85801371322181	Street 26 at Street Achar Sva, Siem Reap Cambodia	\N	\N	https://foursquare.com/item/5815549c38fa102a36d834d2
2279	Nest	76	8.40000000000000036	13.360079158397255	103.85466751366954	Sivutha St	\N	\N	https://foursquare.com/item/5252d542498e0b521d72eb38
2280	Sombai Infused Cambodian Liqueur Workshop & Shop	76	8.30000000000000071	13.346434016467077	103.86223762913579	176 Sombai Road	\N	\N	https://foursquare.com/item/5591619f498e44b1ecbeca3f
2281	The Iron Bar	77	9.19999999999999929	35.891275	10.597472	سوسة	\N	\N	https://foursquare.com/item/55c2c8d6498e5352c31d5ee6
2282	Il Conte	77	9	35.84076194586163	10.629671366487324	Casino Europe (Blvd Hedi Chaker)	\N	\N	https://foursquare.com/item/56789223498e296e963311c8
2283	La Gondole	77	8.90000000000000036	35.84139852912231	10.627790689418989	Route touristique 14 Janvier 2011	\N	\N	https://foursquare.com/item/5457ff97498e7f351ccd20ca
2284	Casino Europe	77	8.90000000000000036	35.840689949709756	10.629770350547961	Avenue Hedi Chaker (Corniche Bou Jaafar)	\N	\N	https://foursquare.com/item/5644a4b1498eb8eddd00eb7f
2285	Tiziri 13 (تيزيري 13)	77	8.69999999999999929	35.82425876241919	10.637562927373088	سوسة	\N	\N	https://foursquare.com/item/531b5c74498e2b3d2ee0a401
2286	Passengers	77	8.69999999999999929	35.86666458788513	10.606132661315538	Bureau N3 Résidence Rossignol (Route Touristique)	\N	\N	https://foursquare.com/item/52b663e3498eeda0317e677b
2287	Jobi	77	8.59999999999999964	35.84492317547555	10.62412292903011	Résidence le Monaco	\N	\N	https://foursquare.com/item/562823a5498e2bad0b0c8598
2288	GOLF BRAÜ	77	8.59999999999999964	35.88972587995186	10.594266951084137	El Kantaoui	\N	\N	https://foursquare.com/item/51fec87e498e653ae10a606f
2289	ALI CHAPPATI (علي شباتي)	77	8.5	35.84423595031319	10.618833251502283	Sousse	\N	\N	https://foursquare.com/item/51f531ae498e2abc1ea69b5d
2290	Chaneb Sahloul (شناب سهلول)	77	8.5	35.83781139307318	10.596204323760864	Boulevard du leader Yasser Arafat	\N	\N	https://foursquare.com/item/53220839498e3f1e79f2ee38
2291	Urban Burger	77	8.5	35.845267715335176	10.624656312448712	Résidence Le Monaco	\N	\N	https://foursquare.com/item/56efb9dd498ed9e9c2155eb1
2292	Mado Café & Resto	77	8.40000000000000036	35.843494974374515	10.620680755266305	Avenue Taha Houssein	\N	\N	https://foursquare.com/item/57377935498e125f07912b4f
2293	Hard Rock Cafe Port El Kantaoui	77	8.40000000000000036	35.9071812683095	10.581022518208366	Zone touristique El Kantaoui (Route Touristique)	\N	\N	https://foursquare.com/item/568da4b2498e1a6191728fd6
2294	Aga Café Mövenpick	77	8.30000000000000071	35.842743746024	10.626756883192003	Centre Ville	\N	\N	https://foursquare.com/item/51eb1655498e687cd1d50260
2295	Le QG	77	8.30000000000000071	35.86837375958935	10.609590787820617	4 (Rue Du Kanal)	\N	\N	https://foursquare.com/item/56d2fc56498e689e1abb5489
2296	COCOTT Sandwich Café	77	8.30000000000000071	35.85241132116007	10.608300268650055	khzema	\N	\N	https://foursquare.com/item/519b61b4498e757f86f1beac
2297	Iceberg	77	8.19999999999999929	35.86743988816612	10.605181561755105	تونس	\N	\N	https://foursquare.com/item/524b22af11d27f662d4cc4ab
2298	Crousti Factory	77	8.19999999999999929	35.829333003891115	10.622671261876903	Cité Jawhara	\N	\N	https://foursquare.com/item/5162e47be4b0a964a2766df0
2299	Am Salem (عم سالم)	77	8.19999999999999929	35.83009783664924	10.640505249078473	Théatre Municipal	\N	\N	https://foursquare.com/item/50f17c0de4b054b5577af78f
2300	San Marino Pizza	77	8.19999999999999929	35.85244545206469	10.605472938037618	Cité Sidi Dhaher, Khzema	\N	\N	https://foursquare.com/item/51b3acb4498e9cd94c077049
2301	Medina Sousse (المدينة العربي سوسة)	77	8.19999999999999929	35.82742716782655	10.639042326063255	سوسة	\N	\N	https://foursquare.com/item/521f7a1e11d29b5cd7ba1035
2302	aecor Fitness Club	77	8.09999999999999964	35.85692431250546	10.607842466049997	Rue essanebil Khezema est (Rue des orangers)	\N	\N	\N
2303	Mil's	77	8.09999999999999964	35.84348383893029	10.624188914441218	1er étage du Casino Caraïbes	\N	\N	https://foursquare.com/item/584dbb5245005e5783fec101
2304	Fleur de Thé	77	8	35.911073261832456	10.577422565061147	Route Touristique	\N	\N	https://foursquare.com/item/509ee01f498ec5d3bfbad47f
2305	Le K-NOË Resto-Lounge	77	8	35.83615325601631	10.636787489899461	Boujaafer, Sousse	\N	\N	https://foursquare.com/item/52d4f122498e16c0783b3b46
2306	Café Le Saint Tropez	77	8	35.84670000026688	10.617124736309052	Rue Lamine Chebbi	\N	\N	https://foursquare.com/item/4fa039b0e4b0ad70a94e4d74
2307	Ci Gusta	77	8	35.83424672187769	10.592059585986892	Sahloul, Imm. Khadija (Boulevard Yaser Arafet)	\N	\N	https://foursquare.com/item/5470ad5a498e77bc5d893430
2308	Damido	77	8	35.83685436423808	10.63321286196518	Sousse	\N	\N	https://foursquare.com/item/5219e0c911d244e10376a817
2309	Caruso	77	8	35.8364605901712	10.636693997875968	Avenue Hedi Chaker	\N	\N	https://foursquare.com/item/53f8810e498e91728cbf3b63
2310	Bora Bora	77	7.90000000000000036	35.850898377658226	10.61882775303419	Hammam Sousse	\N	\N	https://foursquare.com/item/519bf0e3498ec97cc859ba9e
2311	Jo Bedu (جوبدو)	78	9.40000000000000036	31.95645890114227	35.92670917510986	10 Baouniyyeh Street	\N	\N	https://foursquare.com/item/500fd5f2e4b0c0d1a8fa33cd
2312	The Royal Automobile Museum (متحف السيارات الملكي)	78	9.30000000000000071	31.98313152756626	35.82666703349977	King Hussein Park	\N	\N	https://foursquare.com/item/517739b5498ee4f32db7cfae
2313	Gaia's Cocoon	78	9.30000000000000071	31.966932097346948	35.87337290178601	الأردن	\N	\N	https://foursquare.com/item/51d7f9b4498ebac67cd7101f
2314	Pinkberry (پنكبيري)	78	9.19999999999999929	31.980207939895077	35.83752067329877	City Mall, Main Entrance, Ground Level	\N	\N	https://foursquare.com/item/4f0dd971e4b0c6e46679ff58
2315	Wazzup Dog	78	9.19999999999999929	31.956970402350372	35.857338838813234	Next to Java U, 7th Circle	\N	\N	https://foursquare.com/item/5037bd67e4b0b4924be15a61
2316	Abu Jbara (أبوجبارة)	78	9.19999999999999929	31.987744743743736	35.86625084280968	189 Al Madeneh Al Monawra St. (Al-Madenah Al-Munawrah St.)	\N	\N	https://foursquare.com/item/4f945b38e4b03330aafd3db8
2317	Gerard (جيرارد)	78	9.19999999999999929	31.948367154636784	35.892149696609394	Abdoun Circle	\N	\N	https://foursquare.com/item/4d130a1680f6721e091c1ceb
2318	Oliva (أوليفا)	78	9.19999999999999929	31.956759343291196	35.9262004975114	Al Khadir Al Shanqiti Street, (Al Ba'ouniyah St.)	\N	\N	https://foursquare.com/item/522d93b811d22df747bcf44b
2319	Fakhr Al Din (مطعم فخر الدين)	78	9.19999999999999929	31.952243628840023	35.92015223547193	Al Koliyya Al Eilmiyya Al Islamiyya	\N	\N	https://foursquare.com/item/51990f3c498eb24c792fdde2
2320	Juicebangbang	78	9.09999999999999964	31.956838945884787	35.870583951473236	Swefieh	\N	\N	https://foursquare.com/item/4f0194fc6c25c5ce82dad071
2321	DIMITRI'S COFFEE	78	9.09999999999999964	31.974167485269742	35.84609389041074	Mamdouh Al Sarayrah St. (Makkah Al Mukarramah St.)	\N	\N	https://foursquare.com/item/5717d97e498e4af5a8083cff
2322	Zain HQ	78	9.09999999999999964	31.96321795725935	35.844837253319334	8th Circle	\N	\N	https://foursquare.com/item/4e38f5942271aebfead049f8
2323	Wild Jordan (برية الاردن)	78	9.09999999999999964	31.951069834002556	35.93074321746826	1st circle - Othman Bin Affan St.	\N	\N	https://foursquare.com/item/510fca76e4b0809a947d5f1f
2324	Sabaho فرن صباحو	78	9.09999999999999964	31.958627670041565	35.85858995344021	7th Circle (Wakalat Street)	\N	\N	https://foursquare.com/item/4ed326cccc219860fab1db80
2325	Yoshi Restaurant	78	9.09999999999999964	31.952690228645825	35.90426981449127	Jabal Amman	\N	\N	https://foursquare.com/item/51bd4631498e7aed16e65111
2326	Downtown (وسط البلد)	78	9.09999999999999964	31.952031162387087	35.93328015012839	عمان	\N	\N	https://foursquare.com/item/51bcb091498e55ee3f7433ea
2327	Daret Al Funoon دارة الفنون	78	9.09999999999999964	31.95401983434499	35.930189861743116	Jabal Al Lwebdeh (Nadeem Al-Mallah St.)	\N	\N	https://foursquare.com/item/51442245e4b075ebc4463adb
2328	TAJ Cinemas (سينما تاج مول)	78	9	31.941468332974363	35.88795085233577	Terrace 2 - Taj Lifestyle Center (Prince Hashem Bin Al-Hussein St.)	\N	\N	https://foursquare.com/item/51891bd3498ecd1cf08693b2
2329	Levant Restaurant	78	9	31.952353922602473	35.90719770952976	Jabal Amman 3rd Circle	\N	\N	https://foursquare.com/item/51b1789e498e70aa93ce02d9
2330	Gerard (جيرارد)	78	9	31.949230972519942	35.92765264951432	Rainbow street, Jabal Amman (Haleem Abu Rahmeh)	\N	\N	https://foursquare.com/item/4e48e76db3ade236d9009128
2331	The Boulevard	78	9	31.96452598927341	35.90543125998886	Abdali	\N	\N	https://foursquare.com/item/535ffe6a498e6815789dfa33
2332	Falafel Al-Quds (فلافل القدس)	78	9	31.94949832134612	35.92648241922815	Rainbow St. - Jabal Amman (Rainbow Street)	\N	\N	https://foursquare.com/item/5238a68c11d2ac8956977388
2333	Brisket	78	9	31.96300397101325	35.89836506576924	Abdullah bin Masood	\N	\N	https://foursquare.com/item/5433fb64498ec0bee0899c6d
2334	Starbucks (ستاربكس)	78	9	31.9422625820706	35.8897602676446	Prince Hashim Ben Al Hussein St (Opposite Taj Mall)	\N	\N	https://foursquare.com/item/51c329ee498ec874bc319d70
2335	Centro Restaurant	78	9	31.9582074776152	35.89832249641426	Fourth Circle (Behind Prime Ministry)	\N	\N	https://foursquare.com/item/51af2be9498e704aa684597e
2336	Da Esmat Italian Kitchen	78	9	31.94920144068339	35.928493076886745	Rainbow St	\N	\N	https://foursquare.com/item/5262f837498ed1165c7857a3
2337	MindHub	78	9	31.974281	35.885323	الأردن	\N	\N	https://foursquare.com/item/57487eb0cd10c7f56f85fc2a
2338	Wazzup Dog	78	9	31.948839468788965	35.92810124158859	Rainbow Street,Haleem Abu Rahmeh, Jabal Amman (Haleem Abu Rahmeh St.)	\N	\N	https://foursquare.com/item/50bf1829e4b009725399bd24
2339	Rumi Cafe (مقهى رومي)	78	9	31.956134311375124	35.92586006239349	14 Kulliyat Al Sharee'ah Street	\N	\N	https://foursquare.com/item/530e48a811d2bfb85c33f89d
2340	Amman Citadel (جبل القلعة)	78	8.90000000000000036	31.95412853252949	35.93651533126831	Downtown (King Ali Bn Al Hussain St.)	\N	\N	https://foursquare.com/item/51f876f7498ef1a66b6fe09b
2341	Stanley Park	79	9.69999999999999929	49.302488447038236	-123.14171791076662	Stanley Park Dr	\N	\N	https://foursquare.com/item/56b44dab498e0938e9ec3486
2342	English Bay Beach	79	9.69999999999999929	49.28661337371541	-123.14283944417532	Beach Ave (btwn Gilford & Bidwell)	\N	\N	https://foursquare.com/item/4be4b52d70c603bb70a09ab4
2343	Coal Harbour Seawall	79	9.59999999999999964	49.290289758268344	-123.12280309946958	W Cordova St.	\N	\N	https://foursquare.com/item/4f837096e4b013f8f46b1e39
2344	Revolver	79	9.5	49.28316389827263	-123.10934896828786	325 Cambie St (btwn Hastings & Cordova)	\N	\N	https://foursquare.com/item/4e6bf1458877ce9597c785bc
2345	Stanley Park English Bay Seawall	79	9.5	49.290230099593785	-123.14686775207518	Beach Ave (at Park Ln)	\N	\N	https://foursquare.com/item/5238844911d2e4d4a90a3467
2346	Sunset Beach	79	9.5	49.27918658110156	-123.13888549804686	1400 Beach Ave (at Broughton)	\N	\N	https://foursquare.com/item/4aa83add70c603bbaf6f8eb4
2347	Meat & Bread	79	9.5	49.28253209055286	-123.10937047004701	370 Cambie St (btwn Cordova & Hastings)	\N	\N	https://foursquare.com/item/4d4886934c9ef04d14a76b15
2348	Kitsilano Beach	79	9.40000000000000036	49.27355858778376	-123.15456984360358	Cornwall Ave (at Yew St)	\N	\N	https://foursquare.com/item/4bf2e49370c603bb3d029cb4
2349	False Creek Seawall	79	9.40000000000000036	49.27273179887483	-123.13379848089629	1689 Johnston St. (Anderson)	\N	\N	https://foursquare.com/item/4f2a0e91e4b00359239126ce
2350	Queen Elizabeth Park	79	9.40000000000000036	49.24156455524772	-123.11335520540814	4600 Cambie St	\N	\N	https://foursquare.com/item/51d671d0498e004fb46cedd5
2351	Medina Café	79	9.40000000000000036	49.28056540642322	-123.11685919761656	780 Richards St (btwn W Georgia & Robson)	\N	\N	https://foursquare.com/item/4ac0e0e170c603bb95858eb4
2352	Seaside Seawall	79	9.40000000000000036	49.272541366825045	-123.10406112544591	Quebec St	\N	\N	https://foursquare.com/item/5712ac55498e278747947d57
2353	33 Acres Brewing Company	79	9.40000000000000036	49.263876930742356	-123.10537934303285	15 W 8th Ave (btwn Manitoba & Ontario)	\N	\N	https://foursquare.com/item/528c0e3b498eedd5ee17225d
2354	Third Beach	79	9.40000000000000036	49.30338193650776	-123.1563403102008	7000 Stanley Park Dr (Pacific Ocean)	\N	\N	https://foursquare.com/item/4e50190252b1e893ad650772
2355	Bao Bei	79	9.40000000000000036	49.279525	-123.100518	163 Keefer St (btwn Columbia & Main)	\N	\N	https://foursquare.com/item/4d3123d8329e5481c9fda31d
2356	Blue Water Cafe + Raw Bar	79	9.40000000000000036	49.276233242973376	-123.12107367629896	1095 Hamilton St (at Helmcken St)	\N	\N	https://foursquare.com/item/4ac009f270c603bb0f858eb4
2357	Hawksworth Restaurant	79	9.30000000000000071	49.28334743659659	-123.11918735504149	801 West Georgia Street (at Howe Street)	\N	\N	https://foursquare.com/item/5253084c11d2df931d7b42e3
2358	Pacific Spirit Regional Park	79	9.30000000000000071	49.24926287964058	-123.21136951446533	Pacific Spirit Park	\N	\N	https://foursquare.com/item/505fa400e4b012986061264b
2359	Kingyo Izakaya 金魚居酒屋	79	9.30000000000000071	49.290587	-123.136965	871 Denman St (btwn Haro & Barclay)	\N	\N	https://foursquare.com/item/5252ff5911d20f02a9c19377
2360	Chambar	79	9.30000000000000071	49.279914781781855	-123.11012924267371	568 Beatty St (btwn W Pender & Dunsmuir)	\N	\N	https://foursquare.com/item/4ea734366d86f2edb66d0ba7
2361	Le Crocodile Restaurant	79	9.30000000000000071	49.28265806764619	-123.12528669834137	909 Burrard St (Smithe St)	\N	\N	https://foursquare.com/item/4ed94fd8d3e346be330319b4
2362	Bella Gelateria	79	9.30000000000000071	49.28786134028404	-123.11626374721527	1001 W Cordova St (at Burrard St)	\N	\N	https://foursquare.com/item/4e16369eb0fb42f9873096d5
2363	Spanish Banks	79	9.30000000000000071	49.27704618804818	-123.21901789332543	4707 NW Marine Dr	\N	\N	https://foursquare.com/item/4de58e3c1f6e9d90c7df3eb9
2364	Stanley Park Harbourfront Seawall	79	9.30000000000000071	49.29719336520892	-123.13067117445341	1999 Georgia St (Stanley Park Causeway Rd)	\N	\N	https://foursquare.com/item/4fb7b53de4b04e126fc0848a
2365	Granville Island Public Market	79	9.30000000000000071	49.27248788116003	-123.13528060913086	1661 Duranleau St (at Johnston St)	\N	\N	https://foursquare.com/item/4aad80fd70c603bb72748eb4
2366	Earnest Ice Cream	79	9.30000000000000071	49.249357426218694	-123.09005320072174	3992 Fraser St (at E 24th Ave)	\N	\N	https://foursquare.com/item/5218ca9f11d2aa1b2276d582
2367	Les Faux Bourgeois	79	9.19999999999999929	49.25711580388761	-123.08964306364238	663 E 15th Ave (at Fraser & Kingsway)	\N	\N	https://foursquare.com/item/4c8e38489c1ebfb7639865d2
2368	Gotham Steakhouse & Cocktail Bar	79	9.19999999999999929	49.282812039212075	-123.1157112121582	615 Seymour St. (btwn Dunsmuir & W Georgia)	\N	\N	https://foursquare.com/item/51d8ee64498ef1b3a74a0437
2369	La Mezcaleria	79	9.19999999999999929	49.27014172718591	-123.06946647880712	1622 Commercial Dr (btwn Graveley & E 1st)	\N	\N	https://foursquare.com/item/52b7d2d4498e82da9f496dfc
2370	Guu with Garlic	79	9.19999999999999929	49.29040234930696	-123.1338277811616	1698 Robson St (at Bidwell St)	\N	\N	https://foursquare.com/item/4fbf20fd6de47258d850c15a
2371	Sheikh Zayed Grand Mosque (مسجد الشيخ زايد)	80	9.5	24.411928757919632	54.475141230825244	Airport Rd. (شارع المطار)	\N	\N	https://foursquare.com/item/5125de75e4b0ca89ec2a5f94
2372	Jumeirah at Etihad Towers (جميرا أبراج الاتحاد)	80	9.5	24.458420862453103	54.321960584826726	Etihad Towers	\N	\N	https://foursquare.com/item/4eaf95cd6d86e4914a413208
2373	Yas Marina Circuit	80	9.5	24.470596032726114	54.60619948243406	Yas Leisure Dr.	\N	\N	https://foursquare.com/item/527534ff11d230003dc63afc
2374	Corniche (الكورنيش)	80	9.40000000000000036	24.482556949068044	54.35873366200148	Corniche Street	\N	\N	https://foursquare.com/item/50e9d251e4b00d69b8cd9f06
2375	Yas Viceroy (فندق ياس)	80	9.40000000000000036	24.46723855307912	54.60578441619873	Yas Marina, Yas Island (مرفأ ياس - جزيرة ياس)	\N	\N	https://foursquare.com/item/4b97793670c603bb1af793b4
2376	Saadiyat Beach Club	80	9.40000000000000036	24.55854971407333	54.44977796957369	Saadiyat Island	\N	\N	https://foursquare.com/item/51054816e4b04ee8adf5a00c
2377	Yas Mall (ياس مول)	80	9.30000000000000071	24.48927816099731	54.60865733094996	Yas Island	\N	\N	https://foursquare.com/item/546e1cde498ea1327b5f011c
2378	Umm Al Emarat Park (حديقة المشرف المركزية)	80	9.30000000000000071	24.45429247719496	54.38092307129645	Al Karamah St (Mohammed bin Khalifa St)	\N	\N	https://foursquare.com/item/550dce28498e604e17f007a2
2379	Yas Beach	80	9.30000000000000071	24.461955378318443	54.592223167419434	South Beach, Yas Island	\N	\N	https://foursquare.com/item/5253c839498e6b4a6b133820
2380	Yas Waterworld	80	9.30000000000000071	24.488861977288416	54.60033093142685	YAS Marina (Yas Island)	\N	\N	https://foursquare.com/item/51d2d5f6498e5aa513de4c85
2381	Fairmont, Bab Al Bahr	80	9.19999999999999929	24.415070927541045	54.490599632263184	Bain Al Jessrain, Abu Dhabi (Abu Dhabi - Alain Road)	\N	\N	https://foursquare.com/item/4e76f744fa76059701aca0eb
2382	Saadiyat Beach Golf Club	80	9.19999999999999929	24.542824088463977	54.43879058252434	Saadiyat Island	\N	\N	https://foursquare.com/item/5146cdb1e4b0b5c8a1681153
2383	Zuma	80	9.19999999999999929	24.500591554398994	54.38777440727138	The Galleria, Al Maryah Island	\N	\N	https://foursquare.com/item/533be4f2498e0a962692f980
2384	The Galleria (الغاليريا)	80	9.19999999999999929	24.50116863154698	54.38925504684448	Abu Dhabi Global Market Square (Al Maryah Island)	\N	\N	https://foursquare.com/item/5234be0b11d2133b3848c5b7
2385	Formula Rossa	80	9.19999999999999929	24.484577902666615	54.60901075314658	Ferrari World	\N	\N	https://foursquare.com/item/50bc77dae4b0f4ad3def3d61
2386	Al Muneera Island	80	9.19999999999999929	24.451498128323745	54.60512854756594	أبوظبي	\N	\N	https://foursquare.com/item/5297ed9d11d29a7dfc14e465
2387	Hakkasan	80	9.19999999999999929	24.461998090264164	54.318433604272364	Emirates Palace Hotel	\N	\N	https://foursquare.com/item/4e2a752a227197a112cf26b0
2388	najd palace	80	9.19999999999999929	24.430231	54.467115	الإمارات العربية المتحدة	\N	\N	https://foursquare.com/item/57f7b277498e9bee8c09f66a
2389	Corniche Public Beach	80	9.09999999999999964	24.47363470646063	54.340481758117676	Corniche Road (at Khaleej el Arabi 30th street)	\N	\N	https://foursquare.com/item/50af81d3e4b0caa69b7e7d18
2390	Beach Rotana Abu Dhabi	80	9.09999999999999964	24.494979851948944	54.38428725536104	Al Zahiyah (Tourist Club Area) (10th Street, next to Abu Dhabi Mall)	\N	\N	https://foursquare.com/item/510ac931e4b0987e6ab93def
2391	The Cheesecake Factory (ذي تشيزكيك فاكتوري)	80	9.09999999999999964	24.48974491447424	54.609374886702945	Yas Mall (Yas Leisure Dr)	\N	\N	https://foursquare.com/item/546ef54e11d2b99b54a88a74
2392	Al Farah Pastries & Grills	80	9.09999999999999964	24.49059291143004	54.365487008471426	Hamdan Street (Behind Crowne Plaza Hotel)	\N	\N	https://foursquare.com/item/588de9f99435a95cbd5122f7
2393	Cho Gao	80	9.09999999999999964	24.49132969845171	54.36536955411781	Crowne Plaza Abu Dhabi (at Hamdan Bin Mohammed St)	\N	\N	https://foursquare.com/item/509bd34be4b08cda2181dc52
2394	Observation Deck منارة الرؤية	80	9.09999999999999964	24.45838352370183	54.321603077455556	ابراج الاتحاد Etihad Towers	\N	\N	https://foursquare.com/item/524564b7498e974582f7814d
2395	Il Caffé Di Roma	80	9.09999999999999964	24.43450019077552	54.61695780057558	Ground Level, Siemens Building (Near Etihad Plaza)	\N	\N	https://foursquare.com/item/56134520498e60f52c60d33d
2396	Abu Dhabi Golf Club	80	9.09999999999999964	24.420279592068503	54.52680097834163	أبوظبي	\N	\N	https://foursquare.com/item/4c32ffb76f1fef3bad69ec3d
2397	Starbucks	80	9.09999999999999964	24.432715755192262	54.56645578281626	Gardens Plaza	\N	\N	https://foursquare.com/item/569150b0498e4d0553234f6b
2398	Ferrari World Abu Dhabi	80	9	24.483399199271453	54.60707187652588	Yas Leisure Dr., Yas Island	\N	\N	https://foursquare.com/item/52511c2211d250f3d7b4e3d2
2399	Mangroves	80	9	24.444885380279796	54.43904173665723	أبوظبي	\N	\N	https://foursquare.com/item/528dbdb311d2b278ff32086a
2400	Al Bateen Public Beach	80	9	24.428824653168224	54.37583968224897	أبوظبي	\N	\N	https://foursquare.com/item/51a78a78498e2b0ba5fc14c6
2401	Good Wine	81	9.59999999999999964	50.43811549575327	30.534338309055457	вул. Мечнікова, 9	\N	\N	https://foursquare.com/item/53e4e4b8498efcb6027fe39a
2402	Парк ім. Тараса Шевченка / Shevchenko Park (Парк ім. Т. Г. Шевченка)	81	9.5	50.441918536340076	30.51335424351388	вул. Володимирська (бул. Тараса Шевченка)	\N	\N	https://foursquare.com/item/5336ed94498e513bed03e0a9
2403	Lazer House	81	9.40000000000000036	50.445265381294476	30.509127530404896	вул. Леонтовича, 6 А	\N	\N	https://foursquare.com/item/528129cf498e6658a5392bce
2404	Маріїнський парк / Mariinsky Park (Маріїнський парк)	81	9.40000000000000036	50.446112109623165	30.539900288363473	вул. Грушевського	\N	\N	https://foursquare.com/item/518bea81498e4bb1cd64af3c
2405	Софійська площа / Sofiyska Square (Софійська площа)	81	9.40000000000000036	50.45344337510944	30.51628051206939	Софійська пл. (вул. Володимирська, вул. Софіївська)	\N	\N	https://foursquare.com/item/5186cc7b498e81820241dfa2
2406	Парк Вічної Слави / Vichnoi Slavy Рark (Парк Вічної Слави)	81	9.40000000000000036	50.438935030997996	30.55299997329712	вул. Івана Мазепи (Дніпровський узвіз)	\N	\N	https://foursquare.com/item/4ea65cb549015fc80b2e33e9
2407	Театр ім. Івана Франка / Ivan Franko Theater (Театр ім. Івана Франка)	81	9.40000000000000036	50.44586129265468	30.527717287648503	пл. Івана Франка, 3	\N	\N	https://foursquare.com/item/50580f52e4b079bf3aaaf549
2408	sndct	81	9.30000000000000071	50.473609	30.508392	Туровская 4	\N	\N	\N
2409	Fotovramke	81	9.30000000000000071	50.44962094670041	30.51342129707336	вул. Золотоворітська, 6a, оф. 3	\N	\N	https://foursquare.com/item/515f3ff7e4b03063fdadb1c8
2410	Бордшоп sporteventxtrem	81	9.30000000000000071	50.48902529917419	30.495690082431654	Панаса Мирного 11	\N	\N	https://foursquare.com/item/51ffbf15498e1a997838d1ce
2411	Мистецький Арсенал	81	9.30000000000000071	50.435111785149125	30.554068143997792	вул. Лаврська, 10-12	\N	\N	https://foursquare.com/item/517a6a89e4b0114745e1422a
2412	The Girls Hairdressers	81	9.30000000000000071	50.46874610767216	30.51878340081927	Хорива, 39/41	\N	\N	https://foursquare.com/item/572b2dd9498e8432eea02fa6
2413	Пейзажна алея	81	9.30000000000000071	50.45620458564699	30.51484892697434	Пейзажна алея	\N	\N	https://foursquare.com/item/50dc3db1e4b0cc60e2278d4a
2414	Квест комнаты «KADRooM» (Кадрум)	81	9.30000000000000071	50.446655	30.517922	вул. Пушкінська, 10Б	\N	\N	https://foursquare.com/item/55dc7329498ee85c3d3cdd64
2415	Михайлівська площа / Mykhailivska Square (Михайлівська площа)	81	9.30000000000000071	50.455084476346194	30.520666017265906	Михайлівська пл. (вул. Трьохсвятительська)	\N	\N	https://foursquare.com/item/517bc5e8e4b08d47003d1ae4
2416	Парк «Феофанія»	81	9.30000000000000071	50.34013499473137	30.488911775552076	вул. Академіка Лєбєдєва, 37	\N	\N	https://foursquare.com/item/50aa1e20e4b025015d00277a
2417	Школа вейкбординга sporteventxtrem	81	9.19999999999999929	50.4657694829614	30.557987613428335	ул. Трухановская	\N	\N	https://foursquare.com/item/5006a6b2e4b05210d87b68c6
2418	Міжнародна тенісна академія	81	9.19999999999999929	50.529539716952925	30.369683070849177	Україна	\N	\N	https://foursquare.com/item/55f4285c498e6913fa0bd336
2419	Obag Ukraine	81	9.19999999999999929	50.447338326368204	30.508778813372206	вул. Богдана Хмельницкого, 50 (Франко/Хмельницкого)	\N	\N	https://foursquare.com/item/5718ea2e498e376c9616945f
2420	Голосіївський парк ім. Максима Рильського	81	9.19999999999999929	50.392152164634076	30.50813441031284	просп. Голосіївський	\N	\N	https://foursquare.com/item/50a606dee4b05b355c6c47c7
2421	Планета Кіно (Планета Кіно IMAX & 4DX)	81	9.19999999999999929	50.48643332919646	30.519467022820862	просп. Степана Бандери, 34в	\N	\N	https://foursquare.com/item/5257da64498e883e8e723b8e
2422	Сирне королівство / Cheese Kingdom (Сирне королівство)	81	9.19999999999999929	50.50663229589946	30.498501217543527	Оболонський просп., 1Б	\N	\N	https://foursquare.com/item/547df710498eb328cc2b8fac
2423	Національний академічний театр російської драми імені Лесі Українки / Lesya Ukrainka National Academ	81	9.19999999999999929	50.445126160835414	30.51838458835614	вул. Богдана Хмельницького, 5 (вул. Пушкінська)	\N	\N	https://foursquare.com/item/515352cce4b0f8fdf1e1c230
2424	Батьківщина-мати / Mother Motherland (Батьківщина-Мати)	81	9.19999999999999929	50.42648330626823	30.56297779083252	парк Слави	\N	\N	https://foursquare.com/item/504b3da8e4b0a294ba0c5ec6
2425	Оглядовий майданчик в парку Слави	81	9.19999999999999929	50.43864719757257	30.55338131173243	парк Слави	\N	\N	https://foursquare.com/item/501052d5e4b0c5fcbc7cb7c8
2426	Валь-де-Валь	81	9.19999999999999929	50.44879949096067	30.49328175442679	вул. Бульварно-Кудрявська, 51	\N	\N	https://foursquare.com/item/5380d94d498e70147c1e1cd0
2427	Анабэна Йога	81	9.19999999999999929	50.477343267166916	30.43267653178683	44 улица Щусева	\N	\N	https://foursquare.com/item/510ab7b5e4b0d3070a327de1
2428	Lazerhouse	81	9.19999999999999929	50.42908455697879	30.51550667052043	вул. Велика Васильківська, 92	\N	\N	https://foursquare.com/item/513b43f6e4b09b144a0ff4cb
2429	11 silver space	81	9.19999999999999929	50.45248880165324	30.520179114447508	Малая Житомирская 9б	\N	\N	https://foursquare.com/item/56ea8716498ead43ef9ab8e6
2430	Парк КПI	81	9.19999999999999929	50.45101702033007	30.461611620578147	просп. Перемоги, 37	\N	\N	https://foursquare.com/item/51dde526498e3524e310f084
2431	AlJazeera Media Cafe (مقهى الجزيرة الاعلامي)	82	9.5	25.361341	51.527551	Katara | كتارا	\N	\N	https://foursquare.com/item/5735bb2fcd102e5612ff52f1
2432	Aspire Park (حديقة اسباير)	82	9.5	25.259290153278485	51.435585021972656	Al Waab str. (at Furousiya)	\N	\N	https://foursquare.com/item/524052c6498ed9c5f7b5b752
2433	Katara Cultural & Heritage Village (كتارا)	82	9.40000000000000036	25.358938613153853	51.5258166400269	P.O. Box 22899 (Lusail St.)	\N	\N	https://foursquare.com/item/51c5eb5f498e29aded32fe64
2434	Souq Waqif (سوق واقف)	82	9.40000000000000036	25.287846927138148	51.53262992194053	Al Souq St. (Abdullah Bin Jassim St.)	\N	\N	https://foursquare.com/item/51b75b8b498e1d8ce48c8f9a
2435	Corniche (الكورنيش)	82	9.40000000000000036	25.295652488664544	51.53109469017541	Al Corniche St. (Corniche | شارع الكورنيش)	\N	\N	https://foursquare.com/item/51a880c1498e56396c360243
2436	Hakkasan	82	9.40000000000000036	25.350683570285664	51.53090984861958	St. Regis Doha, Al Gassar Resort	\N	\N	https://foursquare.com/item/5209669511d2988dce4527ee
2437	Museum of Islamic Art (MIA) (متحف الفن الإسلامي)	82	9.40000000000000036	25.29537997959209	51.53939723968506	Corniche	\N	\N	https://foursquare.com/item/5176c5dfe4b0b45a8f4ec685
2438	Museum of Islamic Art Park (حديقة متحف الفن الإسلامي)	82	9.30000000000000071	25.295418780078442	51.543946266174316	Museum of Islamic Art (Corniche)	\N	\N	https://foursquare.com/item/5217818911d26dd8c5775676
2439	Mall of Qatar (قطر مول)	82	9.30000000000000071	25.324973711016863	51.352584318257044	Jahhaniya Interchange, Street 373, Zone 51	\N	\N	https://foursquare.com/item/58a20974e6160c1b22b85da4
2440	Spice Market	82	9.19999999999999929	25.328714717271904	51.530245542526245	W Doha Hotel & Residences	\N	\N	https://foursquare.com/item/543d0383498ed78fdecbd06d
2441	Market by Jean-Georges	82	9.19999999999999929	25.32888864896001	51.53055557041423	W Doha Hotel & Residences	\N	\N	https://foursquare.com/item/5205688a11d27a0c4f1104e1
2442	Sugar & Spice Aspire	82	9.19999999999999929	25.261485553130573	51.43964593596608	Aspire	\N	\N	https://foursquare.com/item/56c0652a498e0b84a1c98034
2444	Doha Golf Club	82	9.19999999999999929	25.380392855090363	51.50534507785327	Golf Course St.	\N	\N	https://foursquare.com/item/4f6c84bce4b08a0bb9431801
2445	L'wzaar Seafood Market	82	9.09999999999999964	25.358768244433836	51.52644217014313	Building 27, Katara Cultural Village	\N	\N	https://foursquare.com/item/4eda5a819a5286d91f463ea0
2446	InterContinental Hotel	82	9.09999999999999964	25.348557536824345	51.5295748971594	Al Isteqlal Road, West Bay Lagoon (Al Istiqlal St.)	\N	\N	https://foursquare.com/item/520bcc9011d2dd4f84e7715b
2447	Chapati & Karak (چباتي وكرك)	82	9.09999999999999964	25.358896966139504	51.525375110172554	Katara Cultural Village	\N	\N	https://foursquare.com/item/513141b6e4b077280c7219e0
2448	La Spiga by Paper Moon	82	9.09999999999999964	25.32854046326928	51.53011914334875	W Doha Hotel & Residences	\N	\N	https://foursquare.com/item/525ed34a498e9fa9ea18f1e9
2449	Katara Beach	82	9.09999999999999964	25.35855235648516	51.526227368118874	الدوحة	\N	\N	https://foursquare.com/item/52dab4d311d2344fc5693a4c
2450	NEO Restaurant	82	9	25.269616944535144	51.50580187152666	قطر	\N	\N	https://foursquare.com/item/508c3f41e4b0cc3703e2a52f
2451	Doha Film Institute	82	9	25.35965533783975	51.5253210067749	21/25/26, Katara Cultural & Heritage Village	\N	\N	https://foursquare.com/item/4f6abc25e4b08858d5baf8cd
2452	Villaggio Mall (ڤيلاجيو مول)	82	9	25.25967592552294	51.44392743987905	P.O. Box 63047 (Al Waab St.)	\N	\N	https://foursquare.com/item/524019ca11d2521819e250d5
2453	Nobu Doha	82	9	25.323157948394147	51.54103875160217	The Corniche, P.O. Box 24665	\N	\N	https://foursquare.com/item/56078253498e8712c7c0b738
2454	MONOPRIX (مونوبري)	82	9	25.317920146088774	51.52689480670778	Twin Palm Tower (Majlis al Taawon)	\N	\N	https://foursquare.com/item/526a40ea498e2e02cb2eeb75
2455	EDEM Cafe&Patisserie	82	9	25.279819	51.506849	الدوحة	\N	\N	https://foursquare.com/item/58a47f5d52e32d6a4b2cbc9d
2456	Qatar Tennis Federation	82	9	25.31257237771144	51.514435352578815	Majlis Al Taawon St.	\N	\N	https://foursquare.com/item/4f6c8447e4b0f577d0ff6faf
2457	Chac'Late	82	9	25.360284416651872	51.52590905362523	Building 15, Katara Cultural Village (Near Amphitheater)	\N	\N	https://foursquare.com/item/5275452d11d240e4e7a605f1
2458	Pinkberry (پنكبيري)	82	9	25.334207552029508	51.46764227141759	Landmark Mall, Ground Level, Opposite to Carrefour (Al Shamal Rd)	\N	\N	https://foursquare.com/item/4d7f8fb734468eec0df9da93
2459	Novo Cinemas (سينما نوڤو)	82	9	25.36648309237305	51.55043402254237	The Pearl	\N	\N	https://foursquare.com/item/54b6ca17498ed819f964847f
2460	Sukar Pasha Ottoman Lounge (سكر باشا)	82	9	25.357769650625798	51.526533365249634	Building 31, Katara Cultural Village	\N	\N	https://foursquare.com/item/527e2d90498e902833724027
2461	Piazzale Michelangelo	83	9.59999999999999964	43.76311869394607	11.26418327659324	Piazzale Michelangelo	\N	\N	https://foursquare.com/item/4cd960296e8b59415cad64d2
2462	Piazza del Duomo	83	9.59999999999999964	43.773162719232694	11.254939180484449	Piazza del Duomo	\N	\N	https://foursquare.com/item/520608a2498e55008cdea605
2463	Piazza della Signoria	83	9.5	43.76975350381904	11.255691647529602	Piazza della Signoria	\N	\N	https://foursquare.com/item/4ede3f762c5b50aba3174d5d
2464	Cattedrale di Santa Maria del Fiore	83	9.5	43.77313909442939	11.255643367767334	Piazza del Duomo (Piazza Del Duomo)	\N	\N	https://foursquare.com/item/4ca4b9e1f88a95217c69b449
2465	Ditta Artigianale	83	9.5	43.766928073360205	11.250832200158701	via dello Sprone 5/r	\N	\N	https://foursquare.com/item/576fd8a6498ed2a4ff61d82a
2466	All'Antico Vinaio	83	9.40000000000000036	43.76835892564196	11.257359981536865	Via de' Neri, 65r	\N	\N	https://foursquare.com/item/5084627be4b05bd7efc8d74a
2467	Palazzo Vecchio	83	9.40000000000000036	43.769227	11.256153	Piazza della Signoria	\N	\N	https://foursquare.com/item/4bd01bbe70c603bb44c298b4
2468	Ponte Vecchio	83	9.40000000000000036	43.76802895183095	11.253212235390325	Ponte Vecchio	\N	\N	https://foursquare.com/item/4ca4ba2af88a9521b16cb449
2469	Mercato Centrale Firenze	83	9.30000000000000071	43.77659421354724	11.25326156616211	Piazza del Mercato Centrale (Via dell'Ariento)	\N	\N	https://foursquare.com/item/4b1a381270c603bbbb3f8fb4
2470	Palazzo Strozzi	83	9.30000000000000071	43.77128750225783	11.251791715621948	Piazza degli Strozzi	\N	\N	https://foursquare.com/item/4d5d042d83f4ba7a43687ee6
2471	Gelateria Santa Trinita	83	9.30000000000000071	43.76850871459655	11.249771119078105	Piazza Frescobaldi 11r (Ponte Santa Trinita)	\N	\N	https://foursquare.com/item/5082df05e4b03eedbe4e449e
2472	Galleria degli Uffizi	83	9.30000000000000071	43.76877387805882	11.255703031188224	Via della Ninna, 5 (Piazza della Signoria)	\N	\N	https://foursquare.com/item/4bd0221870c603bb96c298b4
2473	Ditta Artigianale	83	9.30000000000000071	43.76812053855879	11.258664392130392	via dei Neri 32	\N	\N	https://foursquare.com/item/5396fab811d277a04d24a359
2474	Ladurée	83	9.30000000000000071	43.771262094538436	11.249941085408686	Via Della Vigna Nuova, 48r	\N	\N	https://foursquare.com/item/53ec549b498e1b460a042068
2475	Campanile di Giotto	83	9.30000000000000071	43.772813714182874	11.255686283111572	Piazza del Duomo	\N	\N	https://foursquare.com/item/4bd024dd70c603bbc3c298b4
2476	Cinema Teatro Odeon	83	9.30000000000000071	43.771124	11.252421	Piazza Strozzi, 1	\N	\N	https://foursquare.com/item/4d5d4ff783f4ba7ac9e580e6
2477	Piazza Santa Maria Novella	83	9.30000000000000071	43.77358842614516	11.249570846557615	Piazza Santa Maria Novella	\N	\N	https://foursquare.com/item/504b91aee4b05828d1135888
2478	Trattoria Pandemonio di Casa Brogi	83	9.30000000000000071	43.76794191942961	11.241617022116998	Via del Leone, 50/r	\N	\N	https://foursquare.com/item/513250b6e4b099a39e1ceee1
2479	Piazza della Repubblica	83	9.30000000000000071	43.771469565117144	11.253969669342041	Piazza della Repubblica	\N	\N	https://foursquare.com/item/4d1b768970d76ea844544e73
2480	Cupola del Duomo di Firenze	83	9.19999999999999929	43.77315458868269	11.256823539733887	Piazza del Duomo	\N	\N	https://foursquare.com/item/4fe09ab7e4b0f752585043a5
2481	Fuoco Matto	83	9.19999999999999929	43.77953787950744	11.25501036643982	via XXVII Aprile	\N	\N	https://foursquare.com/item/55c31364498e86b34ad98080
2482	Gelateria La Carraia	83	9.19999999999999929	43.76976728439331	11.246868	Lungarno Soderini, 1	\N	\N	https://foursquare.com/item/4d9f4611a77d816e60bafe08
2483	Gelateria dei Neri	83	9.19999999999999929	43.76783871276111	11.259101684703959	Via dei Neri 9	\N	\N	https://foursquare.com/item/4e4a22bcaeb7de71b392cf12
2484	Vivaldi Gelati	83	9.19999999999999929	43.76507408451135	11.259887709118173	Via dei Renai 15r	\N	\N	https://foursquare.com/item/54133022498eb608bc45061e
2485	Gelateria De' Medici	83	9.19999999999999929	43.785599050974824	11.25076174736023	Via dello Statuto 3-5/R	\N	\N	https://foursquare.com/item/4cb0e06ababebfb7a124a3ab
2486	Piazza Santa Croce	83	9.19999999999999929	43.768851	11.261405	Piazza Santa Croce	\N	\N	https://foursquare.com/item/4fc61fcee4b041bde3361e11
2487	Lì x Lì	83	9.19999999999999929	43.77923153815393	11.255570187164444	Via 27 Aprile 42	\N	\N	https://foursquare.com/item/50aa1e41e4b0b2e8c0c975d1
2488	Museo dell'Opera del Duomo	83	9.19999999999999929	43.773149616113585	11.2574632313212	V. della Canonica, 1	\N	\N	https://foursquare.com/item/52542c7711d2d5244c94b353
2489	Le volpi e l'uva	83	9.19999999999999929	43.76704	11.25266	Piazza dei Rossi, 1	\N	\N	https://foursquare.com/item/5092a97ee4b054e683d9d091
2490	Trattoria Zà Zà	83	9.19999999999999929	43.776437274232514	11.254269432177912	Piazza del Mercato Centrale 25	\N	\N	https://foursquare.com/item/5236f66411d2d4228e1f88da
2491	Pedra do Arpoador	84	9.69999999999999929	-22.98905115128132	-43.191350768783614	Rio de Janeiro, RJ	\N	\N	https://foursquare.com/item/5070c2c3e4b0dc1ac020f316
2492	Clube de Regatas do Flamengo	84	9.69999999999999929	-22.978515531102296	-43.219164429783504	Av. Borges de Medeiros, 997 (R. Gilberto Cardoso)	\N	\N	https://foursquare.com/item/4e9e3f96d22d38ff2b54d8d2
2493	Morro da Urca	84	9.69999999999999929	-22.951161706121745	-43.16348075866699	Morro da Urca	\N	\N	https://foursquare.com/item/4eeb7b1f2c5beea6208380fc
2494	Praia de Ipanema	84	9.59999999999999964	-22.98695552912901	-43.20283451268227	Av. Vieira Souto	\N	\N	https://foursquare.com/item/f0a4ed5011d21c8aa77e9dff
2495	Praia do Arpoador	84	9.59999999999999964	-22.988322605164075	-43.192594297770434	Av. Francisco Bhering	\N	\N	https://foursquare.com/item/4d5ee242b19fa143f8b9dfc8
2496	Morro do Pão de Açúcar	84	9.59999999999999964	-22.949776405734585	-43.15649226307869	Morro do Pão de Açúcar	\N	\N	https://foursquare.com/item/4d1aa90eeab1224b4031cce2
2497	Instituto Moreira Salles (IMS)	84	9.59999999999999964	-22.981893386298086	-43.23939800262451	R. Mq. de S. Vicente, 476	\N	\N	https://foursquare.com/item/4c264264f3859c74f3596588
2498	Igreja e Mosteiro de São Bento	84	9.59999999999999964	-22.896971602829545	-43.17781448364257	R. D. Gerardo, 68	\N	\N	https://foursquare.com/item/4e49dbcafa76a0c058c9e7b1
2499	Praia do Leblon	84	9.59999999999999964	-22.986780103151386	-43.2198732785798	Av. Delfim Moreira	\N	\N	https://foursquare.com/item/4ede291ef5b921398d04744e
2500	Theatro Municipal do Rio de Janeiro	84	9.5	-22.90971007297455	-43.176951019854684	Pç. Mal. Floriano, s/n	\N	\N	https://foursquare.com/item/4d9223b6d2c3a090e7b9c166
2501	Pedra Bonita	84	9.5	-22.989280684114558	-43.28264231409664	São Conrado	\N	\N	https://foursquare.com/item/4d4dcd9ab1fa236a6db79229
2502	Praia da Barra da Tijuca	84	9.5	-23.01073633891216	-43.33386279774357	Av. Lúcio Costa, s/n	\N	\N	https://foursquare.com/item/52d9a123498ed213828bddb2
2503	Livraria Cultura	84	9.5	-22.91086104549193	-43.17719696145121	R. Sen. Dantas, 45	\N	\N	https://foursquare.com/item/50ecb7afe4b0beb132c065ef
2504	Praia da Joatinga	84	9.5	-23.014600436228193	-43.289240045570075	Pr. da Joatinga	\N	\N	https://foursquare.com/item/4ee7cb54b63425225895ad7c
2505	Praia do Pepê	84	9.5	-23.014556412355454	-43.31129224509345	Av. do Pepê	\N	\N	https://foursquare.com/item/527e306111d2f7fdccf2ea35
2506	Prainha	84	9.5	-23.040383757898663	-43.504795084929675	Av. Estado da Guanabara, s/n	\N	\N	https://foursquare.com/item/4e498375483b16676e33951e
2507	.Org  Bistrô	84	9.5	-23.01345745164861	-43.3056378364563	Av. Olegário Maciel, 175, Lj. G	\N	\N	https://foursquare.com/item/4f2af078e4b09f1287014fd2
2508	Parque Lage	84	9.5	-22.9606649200928	-43.21225026701909	R. Jd. Botânico, 414	\N	\N	https://foursquare.com/item/520ff70511d21f2af72368d1
2509	Praia da Reserva	84	9.5	-23.01244671528012	-43.415777998690054	Av. Lúcio Costa, s/n	\N	\N	https://foursquare.com/item/4f215091e4b0926f76b28476
2510	Vista Chinesa	84	9.5	-22.973251734974436	-43.249461155672634	Parque Nacional da Tijuca	\N	\N	https://foursquare.com/item/4eb12be361afbb09a03bf734
2511	Mirante do Leblon	84	9.5	-22.98980484784934	-43.22763919830322	Av. Niemeyer	\N	\N	https://foursquare.com/item/51588bd7e4b0ac34490e2c07
2512	Parque Olímpico do Rio de Janeiro	84	9.5	-22.978070828750326	-43.393893241882324	Av. Emb. Abelardo Bueno, 3401	\N	\N	https://foursquare.com/item/5213727811d2afdbe1341d4f
2513	Cristo Redentor	84	9.5	-22.95187767942471	-43.21018008666451	Estr. do Corcovado, s/n (Pq. Nacional da Tijuca)	\N	\N	https://foursquare.com/item/4e5ac1ec1495a8911290d09e
2514	Pedra do Leme	84	9.5	-22.962776442469828	-43.16471390986915	Leme	\N	\N	https://foursquare.com/item/5122a1a2e4b0293c88080d3a
2515	Pista Cláudio Coutinho	84	9.5	-22.95380174636057	-43.16407524698902	Pç. Gen. Tibúrcio, s/n (Caminho do Bem-te-vi)	\N	\N	https://foursquare.com/item/4eaee7ae02d5cf33fb085a18
2516	Livraria da Travessa	84	9.40000000000000036	-22.951580591961307	-43.18452263266247	R. Voluntários da Pátria, 97	\N	\N	https://foursquare.com/item/5334890011d2cfa3279aa848
2517	Parque das Ruínas	84	9.40000000000000036	-22.917825539080358	-43.182351999333086	R. Murtinho Nobre, 169	\N	\N	https://foursquare.com/item/4e2f328f152010789d1427e2
2518	Mirante Dona Marta	84	9.40000000000000036	-22.945598749744136	-43.197166248601214	Estr. Mirante Da. Marta	\N	\N	https://foursquare.com/item/51378919e4b071feb442dce5
2519	Livraria da Travessa	84	9.40000000000000036	-22.99743796537784	-43.35804399033808	BarraShopping (Nível Américas C&A, Loja 220)	\N	\N	https://foursquare.com/item/4ff2fdfbe4b0a2a6432a7976
2520	Praia de Copacabana	84	9.40000000000000036	-22.971717135826125	-43.184688145526344	Av. Atlântica	\N	\N	https://foursquare.com/item/4ede2a0cf790c0454a18a39c
2521	Lune Croissanterie	85	9.5	-37.79598321371842	144.98018860816956	119 Rose St	\N	\N	https://foursquare.com/item/53505dd911d23b43db029e6c
2522	Boilermaker House	85	9.5	-37.81107908844046	144.96623067394475	209-211 Lonsdale St	\N	\N	https://foursquare.com/item/5696c290498e703a33fa45d9
2523	Royal Botanic Gardens	85	9.40000000000000036	-37.83093781796033	144.97987747192383	Birdwood Ave.	\N	\N	https://foursquare.com/item/50038428e4b0a74a534bdb7c
2524	School Of 7 Bells	85	9.40000000000000036	-37.855997	144.992551	33 Chapel St (btwn Maddock & Peel St)	\N	\N	https://foursquare.com/item/510ae5cae4b0ab888c98c8ef
2525	Small Victories	85	9.40000000000000036	-37.79070976887596	144.9715518951416	617 Rathdowne St	\N	\N	https://foursquare.com/item/50135a0fe4b0f16432fcec05
2526	Shrine of Remembrance	85	9.40000000000000036	-37.82996069396489	144.97320622954936	Birdwood Ave.	\N	\N	https://foursquare.com/item/4b7413ee70c603bb8b0092b4
2527	National Gallery Of Victoria	85	9.40000000000000036	-37.822565138020735	144.96915936470032	180 St Kilda Rd (at Southbank Blvd)	\N	\N	https://foursquare.com/item/4b05d1f070c603bbdcef8eb4
2528	Patricia Coffee Brewers	85	9.40000000000000036	-37.81470005527579	144.95830446481705	493-495 Little Bourke St (at Little William St)	\N	\N	https://foursquare.com/item/50038f58e4b0eed3b7ec8652
2529	Eau de Vie	85	9.30000000000000071	-37.81556245843195	144.97150629758835	1 Malthouse Ln	\N	\N	https://foursquare.com/item/4f501513e4b0fb02d2e299b4
2530	Naked For Satan	85	9.30000000000000071	-37.798759	144.978315	285 Brunswick St.	\N	\N	https://foursquare.com/item/4f507277e4b057e325368fcd
2531	The Local Taphouse	85	9.30000000000000071	-37.868287	144.990033	184 Carlisle St. (Chapel St.)	\N	\N	https://foursquare.com/item/4d831df25ad3a0935d27b4fd
2532	The Everleigh	85	9.30000000000000071	-37.805995	144.979614	Level 1, 150-156 Gertrude St (Napier St)	\N	\N	https://foursquare.com/item/4f501495e4b0056bed9dd48a
2533	Robert Burns Hotel	85	9.30000000000000071	-37.79767624820051	144.9845124828177	376 Smith St	\N	\N	https://foursquare.com/item/51c439dd498e6def77f06f3b
2534	Brother Baba Budan	85	9.30000000000000071	-37.81348377424225	144.9621132016182	359 Little Bourke St	\N	\N	https://foursquare.com/item/4b4faee070c603bbf24690b4
2535	Hercules Morse Kitchen And Bar	85	9.30000000000000071	-37.83323301681774	144.96072915958908	283 Clarendon St.	\N	\N	https://foursquare.com/item/513db4b9e4b0cb9997c08543
2536	Hell Of The North	85	9.30000000000000071	-37.80032307567793	144.98366257846797	135 Greeves St (at Smith St.)	\N	\N	https://foursquare.com/item/51cd880e498eb301caad32b1
2537	Chin Chin	85	9.30000000000000071	-37.815475089274386	144.9701405710382	125 Flinders Ln (at Higson Ln)	\N	\N	https://foursquare.com/item/4e0a4a59d4c09911614eb521
2538	Melbourne Recital Centre	85	9.30000000000000071	-37.82374552958854	144.9675644285959	31 Sturt St (at Southbank Blvd)	\N	\N	https://foursquare.com/item/4ed4125cf5b9832ade6c1cf9
2539	Pidapipó Gelateria	85	9.30000000000000071	-37.79835816822266	144.96733317123355	299 Lygon St	\N	\N	https://foursquare.com/item/52c91ba6498ece9a35e27f6a
2540	Melbourne Cricket Ground (MCG) (MCG)	85	9.30000000000000071	-37.81945667696008	144.98330217858015	Brunton Ave.	\N	\N	https://foursquare.com/item/4dc0ee99be4db3ba385844d4
2541	Monk Bodhi Dharma	85	9.30000000000000071	-37.86810341444657	144.99092817306519	202 Carlisle St. (Chapel St.)	\N	\N	https://foursquare.com/item/4d7b2b02da568cfafcf94bff
2542	Margaret Court Arena	85	9.19999999999999929	-37.82109049884058	144.97764587402344	Olympic Blvd (at Batman Ave)	\N	\N	https://foursquare.com/item/4b5571f570c603bb0bec8fb4
2543	Carlton Gardens	85	9.19999999999999929	-37.80537613476154	144.97146606445312	111 Carlton St. (btwn Nicholson St. & Rathdowne St.)	\N	\N	https://foursquare.com/item/5090a6cae4b021eeb486e322
2544	Flagstaff Gardens	85	9.19999999999999929	-37.81037504952484	144.95477631352887	309-311 William St (btwn La Trobe & Dudley St)	\N	\N	https://foursquare.com/item/4d8803dff607a093a542cf86
2545	Mr. Miyagi	85	9.19999999999999929	-37.854242287301	144.99287212557033	99 Chapel St	\N	\N	https://foursquare.com/item/5272599e11d2b4fe5827aff9
2546	Le Bon Ton	85	9.19999999999999929	-37.80482047191255	144.9885738530147	51 Gipps St (at Rokeby St)	\N	\N	https://foursquare.com/item/5335edf1498e8dee96781d2e
2547	Three Bags Full	85	9.19999999999999929	-37.80737663872851	144.99657422304153	60 Nicholson St	\N	\N	https://foursquare.com/item/4cbbbad79552b60ceadce18b
2548	The Colonial Tramcar Restaurant	85	9.19999999999999929	-37.82568381808715	144.9568748474121	City Rd. (Normanby Rd.)	\N	\N	https://foursquare.com/item/509681d5e4b0b6c7185005a2
2549	Shortstop Coffee & Donuts	85	9.19999999999999929	-37.811317565215475	144.96086897856546	12 Sutherland Street	\N	\N	https://foursquare.com/item/568dd901498e311a93186162
2550	Burch & Purchese Sweet Studio	85	9.19999999999999929	-37.837688782376105	144.99594937148618	647 Chapel St	\N	\N	https://foursquare.com/item/4e0edbefd22d8582bdc35b91
2551	The John F. Kennedy Center for the Performing Arts	86	9.59999999999999964	38.89616462195601	-77.05563403285953	2700 F St NW (at New Hampshire Ave.)	\N	\N	https://foursquare.com/item/50be51b9498ea82ed15f44c6
2552	Lincoln Memorial	86	9.59999999999999964	38.889262456559266	-77.0501983165741	2 Lincoln Memorial Circle NW (btwn Constitution Ave NW & Independence Ave SW)	\N	\N	https://foursquare.com/item/5221391b11d22078e53ee5e2
2553	The National Mall (National Mall)	86	9.59999999999999964	38.88952565282813	-77.02056079223533	National Mall (btwn Constitution Ave & Independence Ave)	\N	\N	https://foursquare.com/item/50fa080ce4b07787c9b1aff3
2554	a baked joint	86	9.59999999999999964	38.90228032532726	-77.01721519231796	440 K St NW (at 5th St NW)	\N	\N	https://foursquare.com/item/55c9e3ed498e30c648cf072d
2555	Georgetown Waterfront Park	86	9.59999999999999964	38.90247849737024	-77.06241923087543	33rd St. NW	\N	\N	https://foursquare.com/item/4e7b4293887750b4e4a3c3a2
2556	Washington Monument	86	9.59999999999999964	38.89034309972051	-77.0350906021799	100 Lenfant Plz SW (btwn Constitution Ave NW & Independence Ave SW)	\N	\N	https://foursquare.com/item/4bb3c72170c603bb875696b4
2557	National Gallery of Art	86	9.59999999999999964	38.89135015228416	-77.01988935470581	6th St and Constitution Ave NW (at Constitution Ave NW)	\N	\N	https://foursquare.com/item/50097314e4b00cbfbf5575fa
2558	Union Market	86	9.5	38.90837621069641	-76.99754794704579	1309 5th St NE (Neal Place NE)	\N	\N	https://foursquare.com/item/512f7d3de4b01bec23848be5
2559	World War II Memorial	86	9.5	38.88937728141871	-77.04051554203033	1750 Independence Ave SW (at 17th St SW)	\N	\N	https://foursquare.com/item/4feb0fdbe4b073f9ed6e58e8
2560	Eastern Market	86	9.5	38.886429355334315	-76.99647903442381	225 7th St SE (at North Carolina Ave. SE)	\N	\N	https://foursquare.com/item/4bb4c9a870c603bb626896b4
2561	Library of Congress	86	9.5	38.888607969672584	-77.00537685340446	101 Independence Ave SE (btwn 1st & 2nd St SE)	\N	\N	https://foursquare.com/item/4bb4bd2d70c603bb246796b4
2562	Renwick Gallery	86	9.5	38.89899564756158	-77.03926253937748	1661 Pennsylvania Ave. NW (17th St. NW)	\N	\N	https://foursquare.com/item/4ba42e9d70c603bb66fe94b4
2563	Newseum	86	9.5	38.892779235548	-77.01934614710976	555 Pennsylvania Ave NW (at 6th St NW)	\N	\N	https://foursquare.com/item/5023cd7de4b05507eb1e7139
2564	Rasika West End	86	9.5	38.905081485384436	-77.04806864261627	1190 New Hampshire Ave NW (at M St. NW)	\N	\N	https://foursquare.com/item/4fc0258be4b04422a0a843a2
2565	National Portrait Gallery	86	9.40000000000000036	38.89771307031185	-77.02285051345825	800 F St NW (at 8th St. NW)	\N	\N	https://foursquare.com/item/4b06bb2a70c603bb9ef58eb4
2566	National Air and Space Museum	86	9.40000000000000036	38.88816592257761	-77.01970604323125	600 Independence Ave SW (at 6th St SW)	\N	\N	https://foursquare.com/item/4bb4c1fe70c603bb9c6796b4
2567	National Museum of African American History and Culture	86	9.40000000000000036	38.891400256227584	-77.03287124633789	1400 Constitution Ave NW (btwn 12th & 14th St NW)	\N	\N	https://foursquare.com/item/4f46d143e4b06a774028950f
2568	Smithsonian National Museum of Natural History (National Museum of Natural History)	86	9.40000000000000036	38.89106528589434	-77.02601529842488	1000 Constitution Ave NW (at 10th St NW)	\N	\N	https://foursquare.com/item/4c2bf0ce7216952190337f8f
2569	Baked & Wired	86	9.40000000000000036	38.90400653762568	-77.06030756235123	1052 Thomas Jefferson St NW (at K St NW)	\N	\N	https://foursquare.com/item/4c558bdb1b46c9b62cc46ad0
2570	Meridian Hill Park	86	9.40000000000000036	38.92112730469107	-77.03561913048917	2500 16th St NW	\N	\N	https://foursquare.com/item/507f00f9e4b0fd19ff27c69f
2571	La Colombe	86	9.40000000000000036	38.90100494684031	-77.02011466026306	900 6th Street NW	\N	\N	https://foursquare.com/item/56c1f6b6498e0f8bfcb4af96
2572	Le Diplomate	86	9.40000000000000036	38.91123699641965	-77.03173945404362	1601 14th St NW (at Q St NW)	\N	\N	https://foursquare.com/item/51d37d66498eaad27e06d0f1
2573	National Gallery of Art - Sculpture Garden	86	9.40000000000000036	38.89128752230519	-77.02295780181885	Constitution Ave NW (at 7th St NW)	\N	\N	https://foursquare.com/item/4bd2061170c603bb5ef298b4
2574	Landmark's E Street Cinema	86	9.40000000000000036	38.89627478339372	-77.02669143676758	555 11th St NW (at E St NW)	\N	\N	https://foursquare.com/item/4a82da6270c603bb64558eb4
2575	Rock Creek Park	86	9.40000000000000036	38.956130054014835	-77.04586386680603	Beach Dr NW (at Park Dr NW)	\N	\N	https://foursquare.com/item/4bc46c3870c603bb2eb297b4
2576	Rock Creek Running Trail	86	9.40000000000000036	38.92052421330998	-77.04962991049345	Rock Creek Trail	\N	\N	https://foursquare.com/item/5251369f498e73ce155892f0
2577	Calvert Woodley Fine Wines & Spirits	86	9.40000000000000036	38.94512474	-77.063979	4339 Connecticut Ave NW (Windom Pl NW)	\N	\N	https://foursquare.com/item/4f638c10e4b0272f2b326ae1
2578	Rose's Luxury	86	9.40000000000000036	38.880712111767664	-76.99516880441755	717 8th St SE	\N	\N	https://foursquare.com/item/52b75d1311d248b7bd3ef86b
2579	Rasika	86	9.40000000000000036	38.89488970017137	-77.02131360769272	633 D St NW (at 7th St NW)	\N	\N	https://foursquare.com/item/4bd1139570c603bb08dd98b4
2580	La Colombe Torrefaction	86	9.40000000000000036	38.90644654121618	-77.02494263648987	924 N St NW Rear (Blagden Alley)	\N	\N	https://foursquare.com/item/539df248498eedc986d46838
2581	أحاجي Ahaji	87	9.5	24.812329	46.669219	الرياض	\N	\N	https://foursquare.com/item/58a057877b88a70fcffe436e
2582	Hamburgini (هامبرغيني)	87	9.5	24.53843722423196	46.659064292907715	Dirab road | طريق ديراب (Hamza bin abdulmutaleeb)	\N	\N	https://foursquare.com/item/5797e786498e0d702eba4b86
2583	Lusin (لوسين)	87	9.5	24.697664218735643	46.68359577655792	Olaya St (Tahliya St.)	\N	\N	https://foursquare.com/item/5151f5e0e4b03623547b5da9
2584	Danube (الدانوب)	87	9.5	24.8099824809656	46.734417650774006	Saeed Bin Zaid St	\N	\N	https://foursquare.com/item/54a83d2d498ec41098235295
2585	Lilou Artisan Patisserie (ليلو أرتيسان بتيسري)	87	9.40000000000000036	24.694887466631585	46.70227101936138	Dhabab St. (Tahliya St)	\N	\N	https://foursquare.com/item/519f8a9d498e1bf6ec760881
2586	King Fahad National Library Park (حديقة مكتبة الملك فهد الوطنية)	87	9.40000000000000036	24.686211542343013	46.68816089630127	الرياض - حي العليا (شارع العليا العام - مقابل أسواق الموسى)	\N	\N	https://foursquare.com/item/54a2c542498ef9273d050532
2587	Fiorenza La Piazza (فيورنزا لاپيازا)	87	9.40000000000000036	24.735664935244827	46.647441453051975	Takhassusi St	\N	\N	https://foursquare.com/item/5707a193498e1a5bd256b717
2588	Tamimi Markets (أسواق التميمي)	87	9.40000000000000036	24.757826641290706	46.71318090946233	Prince Muqrin bin Abdelaziz Street	\N	\N	https://foursquare.com/item/56e28fff498e22ec7162b281
2589	Tamimi Markets (أسواق التميمي)	87	9.40000000000000036	24.674294662185822	46.66854185336645	Arcadia Plaza (Prince Turki Bin Abdulaziz St)	\N	\N	https://foursquare.com/item/548f29ea498e895f1493fd82
2590	Chuck E. Cheese's (تشكي تشيز)	87	9.40000000000000036	24.752409613448666	46.58442440909541	King Khaled Rd (at Prince Saud St)	\N	\N	https://foursquare.com/item/57371489498ea74f074fa0df
2591	ميدان الملك عبدالعزيز للفروسية King abdulaziz equestrian club	87	9.40000000000000036	24.98387795561459	46.78426653965794	Aljunadria quarter	\N	\N	https://foursquare.com/item/510c0046e4b0a7d1336fc919
2592	AlNaqaa (حمص النقاء)	87	9.40000000000000036	24.667263562624534	46.73340257619954	Al Hazzani St (Alsteen)	\N	\N	https://foursquare.com/item/5135a1cce4b0c58b66a1decf
2593	The Roasting House (بيت التحميص)	87	9.40000000000000036	24.743606476610186	46.67440336364961	Hisham Ibn Abdulmalik Street	\N	\N	https://foursquare.com/item/53ed3b07498e8b4742a7a507
2594	روضة الخفس	87	9.40000000000000036	25.460715601334904	46.44937610519236	altoqi exit (Al Thumamah)	\N	\N	https://foursquare.com/item/52eba6c511d230f52c394ff4
2595	Marbella resort (منتجع ماربيلا)	87	9.40000000000000036	24.816862643911207	46.43409832409984	Al Amareya	\N	\N	https://foursquare.com/item/56acce9f498e48f8565e47ce
2596	King Abdullah's Palace (قصر الملك عبدالله)	87	9.40000000000000036	24.725456881624282	46.74515037051359	حي الملك عبدالله	\N	\N	https://foursquare.com/item/50a951cee4b0b9c7324973f5
2597	Pizza Roma (بيتزا روما)	87	9.40000000000000036	24.70089302401294	46.69216073113118	Abdullah Al-Hamdan St.	\N	\N	https://foursquare.com/item/5191360e498ec5ec3078aba6
2598	أنوش Anoosh	87	9.40000000000000036	24.591039791314522	46.62936989570277	طريق المدينة المنورة	\N	\N	https://foursquare.com/item/5254459511d2d42430a3cf2f
2599	Froz (فروز)	87	9.40000000000000036	24.689347273345145	46.7650967551184	المملكة العربية السعودية	\N	\N	https://foursquare.com/item/5751d1cc498e59ce2b6d625b
2600	dr.CAFE COFFEE   Ministry of Commerce & Industry 1, Prince Abdulrahman Bin Abdulaziz Road, Riyadh	87	9.40000000000000036	24.656537661720495	46.71555006646129	Prince Abdulrahman Bin Abdulaziz Road	\N	\N	https://foursquare.com/item/569c54f7498e42bee00c5a35
2601	Yummy Yogurt (يمي يوقرت)	87	9.40000000000000036	24.74566122648239	46.619976215173956	Turki bin Abdulaziz, Exit 2	\N	\N	https://foursquare.com/item/51718c1be4b0128d44deee33
2602	Tamimi Markets (أسواق التميمي)	87	9.30000000000000071	24.801625599068387	46.60312008214718	الملقا بلازا - حي الملقا - الرياض (تقاطع انس بن مالك مع محمد بن سعد بن عبدالعزيز)	\N	\N	https://foursquare.com/item/5586bc8d498ec4102064cc7c
2603	CRUST CORNER (ركن كرست)	87	9.30000000000000071	24.800866	46.673847	Abi Bakar As Sudiq Rd	\N	\N	https://foursquare.com/item/5758d3d7cd10c8152908455d
2604	Centria (سنتريا)	87	9.30000000000000071	24.69730260148473	46.683863612160266	Tahlia St. (Olaya St.)	\N	\N	https://foursquare.com/item/51c0963d498e19c8248ab1c2
2605	Ali Bin Ali (علي بن علي للمجوهرات)	87	9.30000000000000071	24.697095130034757	46.68501918295991	المملكة العربية السعودية	\N	\N	https://foursquare.com/item/54f97b89498efd68b4b077ba
2606	Tamimi Markets (أسواق التميمي)	87	9.30000000000000071	24.779693448738715	46.78827908605792	King Abdullah Rd (شارع الصحابة)	\N	\N	https://foursquare.com/item/51a52104498efd44eecc92ef
2607	Nozomi (نوزومي)	87	9.30000000000000071	24.700154526235433	46.70471987515236	Abdulaziz Bin Musa'ed Bin Jalawi St (at Sultan Bin Abdulaziz St)	\N	\N	https://foursquare.com/item/54005037498ef67a143a0e8f
2608	Hot Stone (هت ستون للسيدات)	87	9.30000000000000071	24.709669182620786	46.66336492460536	Takhassusi St. (Al Arouba St.)	\N	\N	https://foursquare.com/item/51a483c4498e1473d8afe740
2609	Ali Abo Alhoos (كنافة علي ابو الهوس)	87	9.30000000000000071	24.769670305085697	46.75819043210963	khalid Bin Al Waleed Rd	\N	\N	https://foursquare.com/item/50a701ebe4b02dc98c87c726
2610	Cartier (كارتييه)	87	9.30000000000000071	24.697052704788458	46.683882478407895	Olaya St (Tahlia St)	\N	\N	https://foursquare.com/item/51ac9791498e6e87d2f63e1e
2611	Christchurch Botanic Gardens	88	9.30000000000000071	-43.53109242617168	172.6260881510691	7 Riccarton Ave	\N	\N	https://foursquare.com/item/4ecdecd502d5feaa197bec88
2612	Sumner Beach	88	9.09999999999999964	-43.56704514223893	172.75912547003787	The Esplanade	\N	\N	https://foursquare.com/item/4e90bd4846908c033f464acb
2613	North Hagley Park	88	9.09999999999999964	-43.52801937637219	172.62249463645782	Park Terrace (btw Deans and Hagley Ave)	\N	\N	https://foursquare.com/item/58015ae4498e47aa8487810f
2614	C4 Coffee	88	8.90000000000000036	-43.53549350604449	172.6439262773778	278 Tuam Street (Madras Street)	\N	\N	https://foursquare.com/item/5452a32d498e6b5660a12c1d
2615	C1 Espresso	88	8.90000000000000036	-43.53521092720807	172.64069771674937	185 High St (at Tuam St)	\N	\N	https://foursquare.com/item/50d3cfc8e4b089584487385b
2616	BurgerFuel	88	8.90000000000000036	-43.53063832658579	172.57508054530766	Bush Inn Centre, 364 Riccarton Rd, Upper Riccarton (at Waimairi Rd)	\N	\N	https://foursquare.com/item/54cf0ecb498e9c3e0b877eb9
2617	Hello Sunday Cafe	88	8.80000000000000071	-43.546032172378	172.63407130275993	New Zealand	\N	\N	https://foursquare.com/item/578d7547498ed50a0c081c72
2618	New Brighton Beach	88	8.69999999999999929	-43.507010346051366	172.73091304132905	New Zealand	\N	\N	https://foursquare.com/item/54a57d23498e3522a67ab420
2619	Pomeroy's Old Brewery Inn	88	8.69999999999999929	-43.52673202927182	172.6497682929039	292 Kilmore St. (at Fitzgerald Ave.)	\N	\N	https://foursquare.com/item/4c5753fcb1369521ef6a735a
2620	The Brewery	88	8.69999999999999929	-43.55674360853291	172.68021067239155	3 Garlands Rd	\N	\N	https://foursquare.com/item/4e5b23861495a891129531ed
2621	Canterbury Farmers Market	88	8.69999999999999929	-43.526446174320874	172.59794180935853	16 Kahu Road	\N	\N	https://foursquare.com/item/54b82ab4498e6666e0062992
2622	Les Mills	88	8.69999999999999929	-43.53304044905347	172.64208912849426	203 Cashel St (Madras St)	\N	\N	https://foursquare.com/item/53642931498e9771d868d121
2623	Volstead Trading Company	88	8.69999999999999929	-43.529676	172.607261	55 Riccarton Road	\N	\N	https://foursquare.com/item/4f17b5c0e4b0259ede1af802
2624	Alice Cinematheque	88	8.59999999999999964	-43.53525739323757	172.64030204928676	Cnr Tuam St (High St)	\N	\N	https://foursquare.com/item/51c4e2a5498edcb7e356f3d4
2625	The Last Word	88	8.59999999999999964	-43.529193120149756	172.63865604798542	31 New Regent St	\N	\N	https://foursquare.com/item/52c92c7011d21cad1cd05d6e
2626	Cashel Mall Re:START	88	8.59999999999999964	-43.53344717442248	172.63440369396588	Cashel Mall	\N	\N	https://foursquare.com/item/5105bdaae4b0840c14301daf
2627	Addington Coffee Co-op	88	8.59999999999999964	-43.543525	172.611463	297 Lincoln Rd., Addington	\N	\N	https://foursquare.com/item/4ba5592070c603bb342395b4
2628	Dux Dine	88	8.59999999999999964	-43.528855652388195	172.6083469390869	28 Riccarton Rd	\N	\N	https://foursquare.com/item/52c48e3d11d2daecc15c8ab0
2629	Margaret Mahy Family Playground	88	8.5	-43.52846491025044	172.64080322768473	Armagh Street (Manchester Street)	\N	\N	https://foursquare.com/item/58662f1a00841a6cd0d84481
2630	Riccarton Sunday Market	88	8.40000000000000036	-43.52980075439788	172.54076906483937	New Zealand	\N	\N	https://foursquare.com/item/4e9bb7e4b63497cdaa5420c9
2631	Corsair Bay	88	8.40000000000000036	-43.607555821532735	172.69984245300293	Park Terrace	\N	\N	https://foursquare.com/item/54fc34ed498efd68b4d2d6e4
2632	Mama Hooch Cafe / Lounge	88	8.40000000000000036	-43.52576897822376	172.63664069738743	817 Colombo St. (Peterborough)	\N	\N	https://foursquare.com/item/58927f980593e10d79bbce47
2633	Mediterranean Foods	88	8.40000000000000036	-43.535540789408714	172.64685400644004	322 Tuam St (btw Fitzgerald & Barbadoes)	\N	\N	https://foursquare.com/item/51748e20498ed2640a440b7c
2634	Coffee Culture	88	8.40000000000000036	-43.48852815463997	172.53981807153247	Christchurch Airport	\N	\N	https://foursquare.com/item/578561d2498ea4d68f7475d8
2635	LUMES	88	8.30000000000000071	-43.53395352976929	172.65098953897706	107 Fitzgerald Ave (Lichfield st)	\N	\N	https://foursquare.com/item/50484aade4b0d6e661bc4f60
2636	Castle Rock Cafe	88	8.30000000000000071	-43.567949	172.690667	New Zealand	\N	\N	https://foursquare.com/item/512c54d0e4b05d7f4a2c614e
2637	Cafe Valentino	88	8.30000000000000071	-43.536482946657515	172.63544306553433	168 St Asaph Street	\N	\N	https://foursquare.com/item/534a6905498e19613d2b0364
2638	The Naked Baker	88	8.30000000000000071	-43.48640012158451	172.7112579345703	142 Beach Rd, North New Brighton (near Bower Ave)	\N	\N	https://foursquare.com/item/4c0c31d4bbc676b0e2c04cd5
2639	Dimitris Greek Food	88	8.30000000000000071	-43.534301133233186	172.6316759277436	111 Cashel Street (City Mall)	\N	\N	https://foursquare.com/item/4cc0d8c3e310224bba932c6f
2640	The Tannery - Boutique Retail & Arts Emporium	88	8.30000000000000071	-43.55727445232134	172.68023703482348	3 Garlands Road	\N	\N	https://foursquare.com/item/57229e25498e2ca31eef139a
2641	Kleinmarkthalle	89	9.59999999999999964	50.112647197840005	8.682205229375791	Hasengasse 5-7	\N	\N	https://foursquare.com/item/52f26a65498e5bd676172b71
2642	Aroma	89	9.40000000000000036	50.123885	8.681358	Oeder Weg 80a	\N	\N	https://foursquare.com/item/51825362498e43a0dbb43c98
2643	Kontrast	89	9.40000000000000036	50.11731812291334	8.727190347325402	Hanauer Landstr. 297	\N	\N	https://foursquare.com/item/507c54cbe4b03d34a55c0d73
2644	Mainufer	89	9.40000000000000036	50.107591264284125	8.681541330910816	60594 Frankfurt am Main	\N	\N	https://foursquare.com/item/51d2be67498e681142bd9d8b
2645	ANIIS	89	9.30000000000000071	50.11159665402628	8.704218864440918	Hanauer Landstr. 82	\N	\N	https://foursquare.com/item/55705393498e92552ae92bce
2646	da Cimino	89	9.19999999999999929	50.11950187009589	8.64584264453902	Adalbertstr. 29	\N	\N	https://foursquare.com/item/50e2a100e4b0a78b0c592b01
2647	Erzeugermarkt Konstablerwache	89	9.19999999999999929	50.11452415001019	8.68693470954895	Konstablerwache	\N	\N	https://foursquare.com/item/505464c9e4b0001ed3850c3b
2648	Rösterei Hoppenworth & Ploch	89	9.19999999999999929	50.124812623480956	8.691788471466749	Friedberger Landstr. 86	\N	\N	https://foursquare.com/item/5366403711d23054e1118d5d
2649	Zeit für Brot	89	9.19999999999999929	50.11936225293888	8.679728335522066	Oeder Weg 15	\N	\N	https://foursquare.com/item/4b5c429a70c603bb10bd90b4
2650	Trattoria i Siciliani	89	9.19999999999999929	50.104757493859736	8.684538254327554	Walter-Kolb-Strasse 17	\N	\N	https://foursquare.com/item/54319ca2498e86801d7d87c5
2651	Klassikstadt	89	9.19999999999999929	50.13189196586609	8.755632	Orber Str. 4a (Cassellastr.)	\N	\N	https://foursquare.com/item/5363e5dd11d2c66ffbe41dff
2652	Palmengarten	89	9.09999999999999964	50.12305449239508	8.657526969909668	Siesmayerstr. 61	\N	\N	https://foursquare.com/item/55b8c9ea498e2684f3c7559f
2653	Städel Museum	89	9.09999999999999964	50.10334040968083	8.673797537854988	Schaumainkai 63	\N	\N	https://foursquare.com/item/513a6da3e4b06af91ed063fc
2654	oheim Frankfurt	89	9.09999999999999964	50.10038036413775	8.680262187481441	Oppenheimer Landstr. 48 (Schwanthalerstr.)	\N	\N	https://foursquare.com/item/51253ccce4b0ae7cecc078cc
2655	Main Tower	89	9.09999999999999964	50.11233284494913	8.672134280204773	Neue Mainzer Str. 52-58	\N	\N	https://foursquare.com/item/5223620d11d26e33918b9c44
2656	Grüneburgpark	89	9.09999999999999964	50.125128790531164	8.66257547290169	August-Siebert-Strasse (btw August-Siebert-Str. & Siesmayerstr.)	\N	\N	https://foursquare.com/item/51bdccb4498e5d91e3415615
2657	Volkspark Niddatal	89	9.09999999999999964	50.14198091941027	8.635146617889404	60431 Frankfurt am Main	\N	\N	https://foursquare.com/item/50b63f3be4b02e5336be924b
2658	Römerberg	89	9.09999999999999964	50.110409780342884	8.682171106338501	Römerberg	\N	\N	https://foursquare.com/item/541a02ee498ef6139dda9a84
2659	Wackers Kaffee	89	9.09999999999999964	50.112055914644905	8.679306507110596	Kornmarkt 9	\N	\N	https://foursquare.com/item/50f56920e4b0e105807f6ec6
2660	English Theatre Frankfurt	89	9	50.10945541070418	8.672004039912595	Gallusanlage 7	\N	\N	https://foursquare.com/item/5146268de4b082071ce7118e
2661	MeridianSpa	89	9	50.10849021954152	8.654291065591595	Europa Allee 4	\N	\N	https://foursquare.com/item/52f248b5498e06e1ae398f8d
2662	roseli	89	9	50.111506755475155	8.678393703341172	Weißadlergasse 9	\N	\N	https://foursquare.com/item/55fd2897498eed98bc9de33d
2663	Schirn Kunsthalle Frankfurt	89	9	50.11033409464655	8.683533668518066	Römerberg	\N	\N	https://foursquare.com/item/530563eb498ec93755de49f1
2664	Deutsches Filmmuseum	89	9	50.105270018262324	8.677807192437719	Schaumainkai 41	\N	\N	https://foursquare.com/item/5133325be4b0680a88fca155
2665	Günthersburgpark	89	9	50.13015277977972	8.702888488769531	Hartmann-Ibach-Str. (Weidenbornstr.)	\N	\N	https://foursquare.com/item/53a70f25498e5ea973aa05cb
2666	Bar ohne Namen	89	9	50.117349465650925	8.679028662076666	Eschenheimer Tor 3	\N	\N	https://foursquare.com/item/4f63ca6ae4b02ac2c4730e4e
2667	REWE	89	9	50.12792802492254	8.707964885879731	Heidestr. 137	\N	\N	https://foursquare.com/item/52735e08498e54726a5bbdda
2668	Heidi und Paul	89	9	50.11486094753043	8.675808404577944	Meisengasse 12	\N	\N	https://foursquare.com/item/4fbd1cffe4b02a78b2cf6bd1
2669	Manufactum brot&butter	89	9	50.11589648801235	8.670762734218949	Bockenheimer Anlage 49-50	\N	\N	https://foursquare.com/item/4e9e6b56d22d38ff2b63ae08
2670	Kanonesteppel	89	9	50.10258740982142	8.68849801308212	Textorstr. 20	\N	\N	https://foursquare.com/item/4e80e20ec2ee9cbcb1e5d829
2671	Dresdner Zwinger	90	9.40000000000000036	51.053011523093325	13.734156360260831	Theaterplatz	\N	\N	https://foursquare.com/item/4e85ceeeb803a5a794afd968
2672	Brühlsche Terrasse	90	9.40000000000000036	51.05350457553928	13.741303142411398	Brühlsche Gasse (Terrassenufer)	\N	\N	https://foursquare.com/item/52a832a5498eed3afa5a987d
2673	Großer Garten	90	9.40000000000000036	51.037855564814066	13.762843608856201	Hauptallee 5 (Querallee)	\N	\N	https://foursquare.com/item/51ec0503498e6234f9232fcb
2674	Frauenkirche	90	9.40000000000000036	51.0518443154868	13.741164864680448	Neumarkt	\N	\N	https://foursquare.com/item/4e85cd1c2c5b35a33855903a
2675	Suppenbar	90	9.19999999999999929	51.065853	13.753593	Rothenburger Str. 37	\N	\N	https://foursquare.com/item/5515d9bd498eece8ee83eacc
2676	Elbwiesen	90	9.09999999999999964	51.05678248724445	13.740870172785163	Dresden	\N	\N	https://foursquare.com/item/518b39b3498e5e6968b73f80
2677	England, England	90	9	51.06463470294606	13.756142700992324	Martin-Luther-Str. 25	\N	\N	https://foursquare.com/item/527d210e11d2223e208dc174
2678	Theaterplatz	90	9	51.05383157515208	13.73589277267456	Theaterplatz	\N	\N	https://foursquare.com/item/51767dcc498e84eea12987c3
2679	Programmkino Ost	90	9	51.039472692470675	13.806366096985888	Schandauer Str. 73	\N	\N	https://foursquare.com/item/5612de9d498e36a09e7249b4
2680	Neumarkt	90	9	51.05145135744473	13.740826183684367	Neumarkt	\N	\N	https://foursquare.com/item/51ec15c6498edf542698f934
2681	Tanteleuk	90	9	51.06721597266031	13.750855952498126	Louisenstr. 24	\N	\N	https://foursquare.com/item/56a8c3f1498ef068af22a8d6
2682	Kunsthofpassage	90	9	51.06784383379028	13.754255267877749	Alaunstr. 70	\N	\N	https://foursquare.com/item/4e4ce8687d8bdc6f33571cb9
2683	Semperoper	90	9	51.05418226383019	13.735506534576416	Theaterplatz 2	\N	\N	https://foursquare.com/item/4e85cdfc6da1682fa3147b3f
2684	Schloßplatz	90	8.90000000000000036	51.05324909588677	13.738231566651804	Schloßplatz	\N	\N	https://foursquare.com/item/53669885498eb9416cb75a31
2685	Altes Wettbüro	90	8.90000000000000036	51.064472445226485	13.744556307792664	Antonstr. 8	\N	\N	https://foursquare.com/item/4f2da3dbe4b062ad2b497de0
2686	Sankt Pauli	90	8.90000000000000036	51.074899	13.749985	Tannenstr. 56	\N	\N	https://foursquare.com/item/4e57b1a2b9935d203cfc0930
2687	Schillergarten	90	8.80000000000000071	51.05235058820996	13.80913088250496	Schillerplatz 9	\N	\N	https://foursquare.com/item/4ffee7b8e4b0396b174c8cf2
2688	Deutsches Hygiene-Museum	90	8.80000000000000071	51.044146123076565	13.747007846832275	Lingnerplatz 1	\N	\N	https://foursquare.com/item/537897b6498e8233c1b7cb4e
2689	Hopfenkult - Craft Beer Store	90	8.80000000000000071	51.0678466553373	13.754717768233428	Görlitzer Str. 25	\N	\N	https://foursquare.com/item/543e6919498e57bc9dbdebd7
2690	Thalia	90	8.80000000000000071	51.06676673857281	13.754190575294341	Görlitzer Str. 6	\N	\N	https://foursquare.com/item/52ed439f498e19bd8bd96470
2691	Altmarkt	90	8.80000000000000071	51.04959612524969	13.73788833618164	Altmarkt	\N	\N	https://foursquare.com/item/513ce7b7e4b0d8fbfb43a867
2692	Alaunplatz	90	8.80000000000000071	51.070020277692876	13.755614162153995	Alaunplatz	\N	\N	https://foursquare.com/item/51daaf05498e54c6be7d988f
2693	Scheunecafé	90	8.69999999999999929	51.06636767174375	13.75129009071259	Alaunstr. 36-40	\N	\N	https://foursquare.com/item/513313f4e4b099a3a3baf97c
2694	Historisches Grünes Gewölbe	90	8.69999999999999929	51.052379815696504	13.737189753454885	Taschenberg 2 (im Residenzschloss)	\N	\N	https://foursquare.com/item/4d2a103adbc160fc321b45b6
2695	SonderBar	90	8.69999999999999929	51.031492	13.713191	Würzburger Str. 40	\N	\N	https://foursquare.com/item/55ef2b5e498edaf330f08a0e
2696	Little India	90	8.59999999999999964	51.066087321255374	13.754580931643016	Louisenstr. 48	\N	\N	https://foursquare.com/item/52a9b758498e18249447c11c
2697	Johanneum | Verkehrsmuseum	90	8.59999999999999964	51.05176147325837	13.739509466151574	Augustusstr. 1	\N	\N	https://foursquare.com/item/51a1ef96498e18310b75c2ef
2698	Café v-cake	90	8.59999999999999964	51.06393567931418	13.7525050565943	Rothenburger Str.	\N	\N	https://foursquare.com/item/550b517a498e6ec9414ed7b0
2699	KIF - Kino in der Fabrik	90	8.59999999999999964	51.03806615139402	13.705960133721605	Tharandter Str. 33	\N	\N	https://foursquare.com/item/53e3d59d498eaf8ffd04ca98
2700	B.liebig	90	8.59999999999999964	51.03281575612239	13.721762895584106	Liebigstr. 24	\N	\N	https://foursquare.com/item/575b15dbcd102c62dcb6957a
2701	Livraria Cultura	91	9.69999999999999929	-23.559243786493667	-46.66020150999045	Av. Paulista, 2073 (R. Augusta)	\N	\N	https://foursquare.com/item/4f7a2a53e4b0f9b696481a1d
2702	Parque Ibirapuera	91	9.69999999999999929	-23.588567359954396	-46.65744841800656	Av. Pedro Álvares Cabral, s/n (Av. Rep. do Líbano)	\N	\N	https://foursquare.com/item/5006c2a6e4b07ec2c1c3f840
2703	Sala São Paulo	91	9.59999999999999964	-23.534427494341386	-46.63962770530994	Pça. Júlio Prestes, 16 (Complexo Cultural Júlio Prestes)	\N	\N	https://foursquare.com/item/4e861acfe5e8a8835dc2901c
2704	Bacio di Latte	91	9.59999999999999964	-23.60545195924337	-46.65643490352709	Al. dos Anapurus, 623	\N	\N	https://foursquare.com/item/54abaab3498eb7cc0fd08d0d
2705	Theatro Municipal de São Paulo	91	9.59999999999999964	-23.54556820827847	-46.63900567423402	Pç. Ramos de Azevedo, s/n (R. Cel. Xavier de Toledo)	\N	\N	https://foursquare.com/item/4e051e07483b98d4170192af
2706	Bacio di Latte	91	9.59999999999999964	-23.561157305968244	-46.666799783706665	R. Bela Cintra, 1829 (Al. Tietê)	\N	\N	https://foursquare.com/item/52a4ad0411d2b5d5a198d28e
2707	youPIX office	91	9.59999999999999964	-23.573722628938985	-46.688793897628784	Av. Brg. Faria Lima, 1893 (R. Venceslau Flexa)	\N	\N	https://foursquare.com/item/4ff4d042e4b003534b0a7be4
2708	Parque da Independência	91	9.5	-23.58462053464441	-46.609548194376735	Av. Nazaré, S/N (R. dos Patriotas)	\N	\N	https://foursquare.com/item/5044f20be4b0364d86bb2f85
2709	Pinacoteca do Estado de São Paulo	91	9.5	-23.534824727099394	-46.63362448674121	Pç. da  Luz, 2 (Av. Tiradentes)	\N	\N	https://foursquare.com/item/52162249498edb9f76ebb49b
2710	Instituto Tomie Ohtake	91	9.5	-23.56107617201823	-46.69442653656006	R. dos Coropés, 88 (Av. Brig. Faria Lima)	\N	\N	https://foursquare.com/item/4e552fb8152089dbfb30014d
2711	Bacio di Latte	91	9.5	-23.56775357432705	-46.66373133659363	R. Oscar Freire, 136 (R. Peixoto Gomide)	\N	\N	https://foursquare.com/item/50636a39e4b0e1bb80bc8ee0
2712	Parque Villa-Lobos	91	9.5	-23.541923873945255	-46.73030391462816	Av. Prof. Fonseca Rodrigues, 2001	\N	\N	https://foursquare.com/item/4e2df766b3ad01b932b1f33c
2713	Bar do Luiz Fernandes	91	9.5	-23.488222278837476	-46.63291771890538	R. Augusto Tolle, 610	\N	\N	https://foursquare.com/item/5063cf52e4b01f36bf869347
2714	Armazém	91	9.5	-23.622701466286745	-46.69885980720969	MorumbiShopping (Piso Lazer, Loja 15F)	\N	\N	https://foursquare.com/item/5133c2ffe4b0680a8de5b33a
2715	Ordinario	91	9.5	-23.593031	-46.643221	R. Cap. Macedo, 364	\N	\N	https://foursquare.com/item/581f159d38fae20afb926565
2716	Instituto da Cerveja Brasil	91	9.5	-23.613653950576218	-46.666099483160906	Av. dos Carinas, 417	\N	\N	https://foursquare.com/item/52e70db1498e1b6081ea8cfe
2717	Centro Cultural Banco do Brasil (CCBB)	91	9.5	-23.547654562149095	-46.634722352640345	R. Álvares Penteado, 112 (R. Quitanda)	\N	\N	https://foursquare.com/item/4b59f7b070c603bb35a090b4
2718	Temakeria Paulista	91	9.5	-23.55180239606647	-46.567547370831484	R. Serra de Japi, 1436	\N	\N	https://foursquare.com/item/50e74687e4b08cc1f4f8bb18
2719	Lush	91	9.5	-23.562317401470303	-46.66987624890638	R. da Consolação, 3459	\N	\N	https://foursquare.com/item/5393cb13498ecd4383d55553
2720	Casa Santa Luzia	91	9.5	-23.564277804196564	-46.66553370014504	Al. Lorena, 1471 (R. Padre João Manuel)	\N	\N	https://foursquare.com/item/5040c3d5e4b043734a5496a8
2721	The Hairdresser	91	9.5	-23.598004	-46.633051	Rua Jorge Tibiriçá, 175 (Avenida Afonso Celso)	\N	\N	https://foursquare.com/item/52c6c39f498ed81f528262ad
2722	Bráz Pizzaria	91	9.5	-23.59984576303066	-46.672790353138154	R. Graúna, 125 (Av. Santo Amaro)	\N	\N	https://foursquare.com/item/4dace3ada86e7fc66e26657e
2723	Teatro Renault	91	9.5	-23.55409846490102	-46.638599038124084	Av. Brig. Luís Antônio, 411	\N	\N	https://foursquare.com/item/5161eba3e4b040e21a080d74
2724	Bacio di Latte	91	9.5	-23.566003790487255	-46.65098584807183	Top Center Shopping (Piso Paulista)	\N	\N	https://foursquare.com/item/55872212498effb2a449b107
2725	Mocotó Restaurante & Cachaçaria	91	9.5	-23.48676596874665	-46.58173084259033	Av. Ns. do Loreto, 1100	\N	\N	https://foursquare.com/item/4e497b08315100ba6f71e625
2726	Museu de Arte de São Paulo (MASP)	91	9.5	-23.56159247811787	-46.656028032302856	Av. Paulista, 1578 (R. Prof. Otávio Mendes)	\N	\N	https://foursquare.com/item/4e4bde8b1520f0462bd74243
2727	Vitrine da Pizza - Pizza em Pedaços	91	9.5	-23.550257863381706	-46.565101146698	R. Itapura, 1327 (R. Azevedo Soares)	\N	\N	https://foursquare.com/item/50723429e4b09fc3c31b0fdf
2728	Ideal Pilates - Tatuapé	91	9.5	-23.548232463477103	-46.57624402490485	R. Bonsucesso, 1119 (Na Academia: Shiva Nataraj)	\N	\N	https://foursquare.com/item/4f592f80e4b0aaabf419ac51
2729	Auditório Ibirapuera	91	9.5	-23.58489834023716	-46.657014725572054	Av. Pedro Álvares Cabral, s/n (Portão 1, 2 e 3 (carros))	\N	\N	https://foursquare.com/item/4d97b41577c18eec76126892
2730	Skye	91	9.5	-23.58183266091481	-46.66675014154978	Hotel Unique	\N	\N	https://foursquare.com/item/4e9340774fc667466719bf76
2731	Green Lake Loop	92	9.69999999999999929	47.68066602728803	-122.33453996244677	7201 E Green Lake Dr N (path around Green Lake)	\N	\N	https://foursquare.com/item/4e139410a809548274a4954d
2732	Discovery Park	92	9.59999999999999964	47.66018478503115	-122.41533279418945	3801 Discovery Park Blvd	\N	\N	https://foursquare.com/item/4bc3841870c603bb43a197b4
2733	Gas Works Park	92	9.59999999999999964	47.646154522688114	-122.33585825255801	2101 N Northlake Way	\N	\N	https://foursquare.com/item/4bbcc3e670c603bb3f0d97b4
2734	Elliott Bay Book Company	92	9.59999999999999964	47.61468356299946	-122.3197603225708	1521 10th Ave (btwn Pike & Pine)	\N	\N	https://foursquare.com/item/50132a02e4b00c78e3d7498f
2735	Kerry Park	92	9.5	47.62941760172463	-122.35993981361389	211 Highland Dr (at 3rd Ave W)	\N	\N	https://foursquare.com/item/4ccaf09c52af9c7448d2a864
2736	Ballard Farmer's Market	92	9.5	47.66746622660104	-122.3843155334636	5330 Ballard Ave NW (at 22nd Ave NW)	\N	\N	https://foursquare.com/item/49f6a66d70c603bbd4218eb4
2737	Volunteer Park	92	9.5	47.63017248200684	-122.31520671692458	1247 15th Ave E	\N	\N	https://foursquare.com/item/4a6be74070c603bbda428eb4
2738	Seward Park	92	9.5	47.550206931134966	-122.25733181932064	5895 Lake Washington Blvd. S (at S Juneau St.)	\N	\N	https://foursquare.com/item/50a192e4e4b0307538f8ceb4
2739	Seattle Bouldering Project	92	9.5	47.593461806910504	-122.31125114838062	900 Poplar Pl S	\N	\N	https://foursquare.com/item/517e230fe4b01798e057c954
2740	Il Corvo	92	9.5	47.60232908078651	-122.33196973800659	217 James St (btwn 2nd & 3rd Ave)	\N	\N	https://foursquare.com/item/4fb6a15ee4b00302db1e5b79
2741	Ellenos Real Greek Yogurt	92	9.5	47.60883900147261	-122.34067714338254	1500 Pike St, #12 (Pike Place & Pike Street)	\N	\N	https://foursquare.com/item/51d9cce2498eb59dddf5ec86
2742	Cinerama	92	9.5	47.61413027771513	-122.34123945236206	2100 4th Ave (at Lenora St)	\N	\N	https://foursquare.com/item/4a074fbe70c603bb06258eb4
2743	Bakery Nouveau	92	9.5	47.56004078389439	-122.38677604959217	4737 California Ave SW (at SW Alaska St)	\N	\N	https://foursquare.com/item/4db5b8db7abad708f2567a23
2744	Alki Beach Park	92	9.5	47.58095501418298	-122.40672826766968	1702 Alki Ave. SW	\N	\N	https://foursquare.com/item/4bc3990670c603bb18a397b4
2745	Alki Beach Path	92	9.5	47.58939981056733	-122.38349510595084	Alki Ave SW	\N	\N	https://foursquare.com/item/53b8bbf9498e5511b6e4e29c
2746	Pike Place Market	92	9.5	47.60938946792167	-122.3410820933266	85 Pike St (at Pine St)	\N	\N	https://foursquare.com/item/50607a54e4b05a5f2792281f
2747	Chihuly Garden and Glass	92	9.5	47.6205487502659	-122.35045552253723	305 Harrison St (at Seattle Center)	\N	\N	https://foursquare.com/item/4fbacac9e4b0182c6898baf2
2748	Green Lake Park	92	9.5	47.68110615923312	-122.32877096301544	7201 E Green Lake Dr N	\N	\N	https://foursquare.com/item/4bc3985a70c603bb07a397b4
2749	REI	92	9.5	47.62031	-122.329587	222 Yale Ave N (at Eastlake Ave E)	\N	\N	https://foursquare.com/item/4ab7193170c603bba57c8eb4
2750	Spinasse	92	9.40000000000000036	47.6150499	-122.31442	1531 14th Avenue (at Pine St)	\N	\N	https://foursquare.com/item/4e277f02aeb75df8caa33c5b
2751	Le Caviste	92	9.40000000000000036	47.61497072439597	-122.33686730824417	1919 7th Ave (Btwn Stewart And Westlake)	\N	\N	https://foursquare.com/item/5722bb4c498e5fb2b96c4586
2752	The Museum of Flight	92	9.40000000000000036	47.518627895985176	-122.2965398426986	9404 E Marginal Way S (at 96th Pl)	\N	\N	https://foursquare.com/item/4fdf6729e4b05c4e3c25075d
2753	Golden Gardens Park	92	9.40000000000000036	47.69058264501714	-122.40329577588459	8498 Seaview Pl NW	\N	\N	https://foursquare.com/item/50132667e4b0b96017a6edd2
2754	Bakery Nouveau	92	9.40000000000000036	47.61951461582449	-122.31303870677948	1435 E John St (at 15th Ave E)	\N	\N	https://foursquare.com/item/5211278511d23ab60e59ab70
2755	CenturyLink Field	92	9.40000000000000036	47.595566657112464	-122.33191010833427	800 Occidental Ave S	\N	\N	https://foursquare.com/item/509abc1ae4b064aadd219f8a
2756	Beecher's Handmade Cheese	92	9.40000000000000036	47.60977973258193	-122.3422908782959	1600 Pike Pl (at Pine St)	\N	\N	https://foursquare.com/item/4d387ffad60c6dcb7fd178bc
2757	Milstead & Co.	92	9.40000000000000036	47.649238758289876	-122.34696597634643	900 N 34th St (btwn Fremont & Troll Ave)	\N	\N	https://foursquare.com/item/53badba2498e40608fd53923
2758	Ada's Technical Books and Cafe	92	9.40000000000000036	47.62236385985822	-122.31280803680419	425 15th Ave E (btwn E Republican St & E Harrison St)	\N	\N	https://foursquare.com/item/4ece69da29c223f926914310
2759	Chuck's Hop Shop	92	9.40000000000000036	47.69080105470987	-122.36584605692941	656 NW 85th St (at 8th Ave NW)	\N	\N	https://foursquare.com/item/5187042c498ef53a17b50f41
2760	Tacos Chukis	92	9.40000000000000036	47.620478561854966	-122.32153228012649	219 Broadway E (btwn Thomas & John St.)	\N	\N	https://foursquare.com/item/4f2db0b2e4b062ad2b590909
2761	Eden Garden	93	9.19999999999999929	22.564541597977065	88.34329605102539	BBD Bagh	\N	\N	https://foursquare.com/item/525d22f311d2620bc6f8c512
2762	Victoria Memorial	93	9.09999999999999964	22.545844129353117	88.34289036897952	1, Queen's Way	\N	\N	https://foursquare.com/item/519e0c57498eb6f277a4cd03
2763	Peter Cat	93	9.09999999999999964	22.552240637568158	88.35258392817117	18, Park St	\N	\N	https://foursquare.com/item/4e771aa188775d593eacca27
2764	Royal Calcutta Golf Club (RCGC)	93	8.80000000000000071	22.494599652615197	88.35106648888241	18, Golf Club Rd	\N	\N	https://foursquare.com/item/50ced969e4b0f94b3ff67333
2765	Golden Joy	93	8.80000000000000071	22.545537663981865	88.38752031326294	50/1, Matherswartala Rd	\N	\N	https://foursquare.com/item/51acb7de498ed257e83c6351
2766	Starmark	93	8.69999999999999929	22.50172323665606	88.36167796422644	South City Mall	\N	\N	https://foursquare.com/item/4d04fd2ae8d85941996b2ea6
2767	The Blue Poppy	93	8.69999999999999929	22.548476519295296	88.35133678665171	4/1, Middleton St	\N	\N	https://foursquare.com/item/57db820e498e6a2a8f174e39
2768	Princep Ghat	93	8.69999999999999929	22.556159580665305	88.33067893981932	Strand Rd	\N	\N	https://foursquare.com/item/50bdc134e4b0732f1a225b51
2769	The Coffee Bean & Tea Leaf	93	8.69999999999999929	22.538635144217853	88.35137472304561	Forum Mall	\N	\N	https://foursquare.com/item/50bda94ce4b0c7b81be1679c
2770	Acropolis Mall	93	8.69999999999999929	22.514754629216785	88.39310829151978	1858/1, Rajdanga Main Rd	\N	\N	https://foursquare.com/item/588dcc4be309e179e6ef98d5
2771	Jai Hind Dhaba	93	8.59999999999999964	22.533002354389474	88.35317194461823	41/1A, Sarat Bose Rd	\N	\N	https://foursquare.com/item/4e05ff8eaeb74c399106ce6a
2772	Red Hot Chilli Pepper	93	8.59999999999999964	22.529058203445924	88.35561275482178	26/2, Ballygunge Circular Rd	\N	\N	https://foursquare.com/item/54d1182c498e47ac98ecd81b
2773	Taj Bengal	93	8.59999999999999964	22.53772924116422	88.3342570066452	34B, Belvedere Rd	\N	\N	https://foursquare.com/item/4c3f02998d99b71373041b06
2774	Girish Chandra Dey & Nakur Chandra Nandy	93	8.59999999999999964	22.59603964813232	88.36748519805334	56, Ramdulal Sarkar St	\N	\N	https://foursquare.com/item/5187970e498e9011586d5304
2775	Maidan	93	8.59999999999999964	22.54898441562954	88.34808361715235	Kolkata	\N	\N	https://foursquare.com/item/582022cd38faeb02717e0809
2776	Aqua	93	8.59999999999999964	22.55458571437324	88.35217612159236	The Park (at The Park hotel)	\N	\N	https://foursquare.com/item/5301148911d262c185bf388a
2777	Saltlake Swimming Pool	93	8.5	22.59604391328037	88.4176254272461	BF Block	\N	\N	https://foursquare.com/item/503f16fde4b075a92511a261
2778	Big Boss	93	8.5	22.546425041122074	88.38801995103512	54C, Matheswartala Rd	\N	\N	https://foursquare.com/item/524ecdbb11d21ea15ac63cfb
2779	Spaghetti Kitchen	93	8.5	22.538580631836147	88.35148378999273	Forum Mall	\N	\N	https://foursquare.com/item/5220374511d2b0341d350fe4
2780	Blue & Beyond	93	8.5	22.559265742236903	88.35312366485596	Hotel Lindsay	\N	\N	https://foursquare.com/item/5234cf7811d24ec6991f317d
2781	Beijing Restaurant	93	8.5	22.546462379048837	88.3871149784587	77/1, Christopher Rd	\N	\N	https://foursquare.com/item/4f7b1672e4b0ddbcd4c9e66b
2782	Deshapriya Park	93	8.5	22.518394558202573	88.35317730903624	5/2, Deshapriya Pk East	\N	\N	https://foursquare.com/item/55dabe49498e79e0530dc555
2783	INOX	93	8.40000000000000036	22.570840827748093	88.40109965901357	89C, Maulana Abdul Kalam Azad Sarani (at Swabhumi)	\N	\N	https://foursquare.com/item/4f8f9dbbe4b03376fccae1ad
2784	Flurys	93	8.40000000000000036	22.552696115512873	88.35270721777539	18, Park St (Sir William James Sarani)	\N	\N	https://foursquare.com/item/4d1cfd64c03c594138f645cc
2785	Novotel Kolkata Hotel and Residences	93	8.40000000000000036	22.579629926355153	88.46104502677916	CF 11, Action Area 1C, Rajarhat, New Town	\N	\N	https://foursquare.com/item/52e759e611d29dd261c94c49
2786	Tollygunge Club	93	8.30000000000000071	22.495643246926846	88.34323660490969	Kolkata	\N	\N	https://foursquare.com/item/4d7a4bdfe540f04d753f10dc
2787	South City Mall	93	8.30000000000000071	22.501753624460576	88.36177752337967	375, Prince Anwar Shah Rd	\N	\N	https://foursquare.com/item/4ca376ddc1f1ef3bef6890a4
2788	Arsalan	93	8.30000000000000071	22.541732599409258	88.36340188980103	28, Circus Ave	\N	\N	https://foursquare.com/item/53e35fbf498e871f2199a649
2789	Balwant Singh's Eating House	93	8.30000000000000071	22.53777878838665	88.34413826465607	10/B, Harish Mukherjee Rd	\N	\N	https://foursquare.com/item/5026ad80e4b0c75a158b80a9
2790	Opium	93	8.30000000000000071	22.568748294488813	88.43420043331902	J2, Block GP, Sector V, Salt Lake	\N	\N	https://foursquare.com/item/523463da11d2f50ad2743378
2791	玄武湖公园 Xuanwu Lake Park (玄武湖公园)	94	8.80000000000000071	32.07250638420666	118.78337812071423	1 Xuanwu Alley (None)	\N	\N	https://foursquare.com/item/53e30ee9498e991254bb19c7
2792	先锋书店 Librairie Avant-Garde	94	8.80000000000000071	32.052989723646625	118.76832246780394	173 Guangzhou Rd. (古南都饭店正对面)	\N	\N	https://foursquare.com/item/4e15307a3151684a3ca2c4b2
2793	Blue Frog 蓝蛙	94	8.80000000000000071	32.049462139874954	118.77892125264557	中山路100号 (艾尚天地1楼)	\N	\N	https://foursquare.com/item/508cd191e4b01167eb6cb58f
2794	Apple Nanjing IST (Apple 艾尚天地)	94	8.40000000000000036	32.047825059564715	118.77903509502319	100 Zhongshan Rd (at 1/F of IST Mall)	\N	\N	https://foursquare.com/item/56b0bd20498e0938e66d2291
2795	大渔铁板烧 Tairyo Teppanyaki	94	8.40000000000000036	32.04618999755123	118.79017417642447	36 Shipopo'an Rd.	\N	\N	https://foursquare.com/item/50af99ffe4b0e7b98e9796d1
2796	雕刻时光咖啡馆 S.I.T. Café	94	8.09999999999999964	32.023632	118.787834	32 Dashiba St. (at Pingjiangfu Rd. （夫子庙店）)	\N	\N	https://foursquare.com/item/4f7b0446e4b0118787d54964
2797	Nanjing University (南京大学)	94	8	32.054262430869166	118.77606947443715	22 Hankou Rd (鼓楼校区)	\N	\N	https://foursquare.com/item/511a27aee4b000378985067a
2798	Jimmy's Sports Bar & Restaurant 吉米来吧	94	7.90000000000000036	32.042556	118.767773	No. 193 Shigu Road	\N	\N	https://foursquare.com/item/4d2dfa6994013704c98fe1da
2799	虹悦城 Wonder City	94	7.79999999999999982	32.01160582512411	118.76019001007079	长虹路222号 (应天大街赛虹桥立交南)	\N	\N	https://foursquare.com/item/52d3bfff11d24756fea09ad9
2800	IKEA (IKEA 宜家家居)	94	7.79999999999999982	31.996555350819072	118.79171093253174	99 Mingchi Rd (at Tuchengtou Rd)	\N	\N	https://foursquare.com/item/4ec616ec9a52756c540388a7
2801	南京大牌档 Nanjing Impressions	94	7.79999999999999982	32.04515899254768	118.77934246903467	18 Zhongshan Rd (at 7F of Deji Plaza)	\N	\N	https://foursquare.com/item/510004d3e4b0b671f9d07ee6
2802	印象汇 SCPG INREACH	94	7.70000000000000018	32.14283623225796	118.71697322722896	浦口区大桥北路58号	\N	\N	https://foursquare.com/item/53526f2511d23ae3d6b9f01f
2803	Oasis 绿洲西餐吧	94	7.70000000000000018	32.04000278328065	118.7788074101863	明瓦廊133号	\N	\N	https://foursquare.com/item/53e4947f11d22533ef568b67
2804	Studio A Apple Store	94	7.70000000000000018	32.050425375149366	118.78512382507324	No.1 Zhujiang Rd. (Zhujiang Rd. & Tongren West Rd.)	\N	\N	https://foursquare.com/item/4d15bc07b15cb1f7680baa21
2805	西贡堤岸越南餐厅 PHO SAIGON	94	7.70000000000000018	32.0409524925322	118.77694607439173	环亚广场2楼 (石鼓路33号)	\N	\N	https://foursquare.com/item/54c0e48f498ec3f6768eea0a
2806	Finnegan's Wake 芬尼根酒吧	94	7.70000000000000018	32.02732553338764	118.77601255219477	熙南里街区6号 (近升州路)	\N	\N	https://foursquare.com/item/4caaf5322776b60cb996470d
2807	南京大牌档 Nanjing Impression	94	7.59999999999999964	32.02295023674506	118.78755596501738	大石坝街48号 (夫子庙)	\N	\N	\N
2808	Costa Coffee	94	7.59999999999999964	32.05254415052008	118.78027439117432	珠江路1号 (中山路)	\N	\N	https://foursquare.com/item/5528de80498e98ed36df78a6
2809	TajMahal 印度餐厅	94	7.59999999999999964	32.03742552725801	118.7756311726443	中国	\N	\N	https://foursquare.com/item/4ee47ab9b8f790fe3fd0c360
2810	新街口	94	7.59999999999999964	32.04385958801819	118.77886891365051	中山路 (汉中路)	\N	\N	https://foursquare.com/item/50276ec7e4b0d14d95ce266f
2811	麦德龙 Metro Supermarket	94	7.5	31.981123456360447	118.79798871089773	卡子门大街98号 (麦德龙路)	\N	\N	https://foursquare.com/item/4d73948c5f00370472f3f1a0
2812	五台山保龄球馆 Wutaishan Bowling Alley	94	7.5	32.050080122194444	118.76558661460876	拉萨路5号 (五台山体育中心南侧)	\N	\N	https://foursquare.com/item/511d0635e4b021215db9d2d6
2813	南京博物院	94	7.5	32.04305929367237	118.81999254226685	321 Zhongshan Rd. (E) (at Qingxi Rd.)	\N	\N	https://foursquare.com/item/5378655c498e72d3e1d14c55
2814	紫峰大厦	94	7.5	32.0623394507179	118.77830081025192	6~8 N Zhongshan Rd (at Zhongyang Rd)	\N	\N	https://foursquare.com/item/4c7de6a52079b713c2aee8f5
2815	Wagas 沃歌斯	94	7.5	32.04918864238804	118.77882599830627	A108, No.100 Zhongshan Rd. (艾尚天地购物中心（IST Mall）1楼)	\N	\N	https://foursquare.com/item/53e70f5e498e335f68722789
2816	总统府 Presidential Palace	94	7.5	32.04496621261164	118.79222318125396	292 Changjiang Rd. (at Taiping N. Rd.)	\N	\N	https://foursquare.com/item/4ec4cda97ee571eed65b6d28
2817	MUJI 無印良品	94	7.5	32.047564081193826	118.77927985585842	中山路18号 (德基广场二期B1-120~123)	\N	\N	https://foursquare.com/item/545a2225498e734b563cba5f
2818	迪卡侬 DECATHLON	94	7.5	31.98228492209908	118.79763584147429	卡子门大街98号（原: 宁溧路286号） (南京雨花店)	\N	\N	https://foursquare.com/item/514aeb60e4b0850eff7edc9c
2819	云中食品店 Skyways Bakery & Deli	94	7.40000000000000036	32.059441197490024	118.76916468143462	上海路160号 (近云南路)	\N	\N	https://foursquare.com/item/53e2ebfb498e0886a5499dda
2820	南京河西万达电影城 Wanda Int'l Cinema	94	7.40000000000000036	32.03447152735697	118.73095790080895	江东中路98号 (建邺万达广场4层)	\N	\N	https://foursquare.com/item/4c9445ff01dd76b0a231b648
2821	Central Park	95	9.80000000000000071	40.78885994449482	-73.96116256713867	59th St to 110th St (5th Ave to Central Park West)	\N	\N	https://foursquare.com/item/5150464ee4b02f70eb28eee4
2822	The Metropolitan Museum of Art (Metropolitan Museum of Art)	95	9.69999999999999929	40.77913186407382	-73.96291774473308	1000 5th Ave (btwn E 80th & E 84th St)	\N	\N	https://foursquare.com/item/512d1d4fe4b0ae1a14d17f5f
2823	Aire Ancient Baths	95	9.69999999999999929	40.71814377480724	-74.0049147605896	88 Franklin St (at Church St)	\N	\N	https://foursquare.com/item/51672662e4b0a1b862b1530c
2824	Bryant Park	95	9.59999999999999964	40.754068523120246	-73.98415362980316	E 42nd St (btwn 5th & 6th Ave)	\N	\N	https://foursquare.com/item/4ca509f2ae1eef3b8bfc2f47
2825	Minskoff Theatre	95	9.59999999999999964	40.75749442223194	-73.98568022741497	1515 Broadway (at W 45th St)	\N	\N	https://foursquare.com/item/4b2d716970c603bbca7e8fb4
2826	Equinox West 50th Street	95	9.59999999999999964	40.762177	-73.984548	1633 Broadway (at Paramount Plz)	\N	\N	\N
2827	High Line	95	9.59999999999999964	40.744638924089664	-74.00613316787314	btwn Gansevoort & W 34th St (btwn 10th & 12th Ave)	\N	\N	https://foursquare.com/item/4eaed5b72c5bb67b2435833e
2828	West Side Highway Running Path	95	9.59999999999999964	40.733218047025495	-74.00863511726843	West Side Highway (btwn Battery Park & W 72nd St)	\N	\N	https://foursquare.com/item/51f039a0498ef4a3724bbbed
2829	Central Park - Conservatory Garden	95	9.59999999999999964	40.79424530078437	-73.95197868347168	1231 5th Ave (at 105th St)	\N	\N	https://foursquare.com/item/4de6af768130690dbf1147ca
2830	Washington Square Park	95	9.59999999999999964	40.73077900590829	-73.99755972622535	W 4th St (btwn MacDougal St & University Pl)	\N	\N	https://foursquare.com/item/4c757e2c6f789c7494424c4c
2831	Strand Bookstore	95	9.59999999999999964	40.73320178975766	-73.99096009548717	828 Broadway (at E 12th St)	\N	\N	https://foursquare.com/item/4be21e8470c603bb5d639ab4
2832	New York Public Library - Schomburg Center for Research in Black Culture	95	9.59999999999999964	40.81413402921382	-73.94021987915039	515 Malcolm X Blvd (at W 135th St.)	\N	\N	https://foursquare.com/item/50cb8389e4b05e0e484daa63
2833	I Love Kickboxing - Midtown East 43rd	95	9.59999999999999964	40.75059241608557	-73.97161326199841	303 E 43rd Street, Lower Level (2nd Ave.)	\N	\N	https://foursquare.com/item/543882d611d24cd01f11a50f
2834	Elf Cosmetics	95	9.59999999999999964	40.72988079657862	-73.99235464508372	10 W 33rd St Rm 802 (5th Avenue)	\N	\N	https://foursquare.com/item/578e5afb498e144cd7cc8863
2835	Riverside Park	95	9.59999999999999964	40.806809433439135	-73.96865129470825	Riverside Dr. (btwn W 59th St. & St. Clair Pl.)	\N	\N	https://foursquare.com/item/51c0d794498efff55bf8dac9
2836	Lincoln Center for the Performing Arts	95	9.59999999999999964	40.77223354479133	-73.98289102110769	70 Lincoln Center Plz (btwn Columbus & 10th Ave)	\N	\N	https://foursquare.com/item/4be2234d70c603bbdd639ab4
2837	St. Patrick's Cathedral	95	9.59999999999999964	40.75874373368367	-73.97660654989457	14 E 51st St (at 5th Ave)	\N	\N	https://foursquare.com/item/4bf6e15e70c603bb556b9cb4
2838	Levain Bakery	95	9.59999999999999964	40.77984275934918	-73.98056030273438	167 W 74th St (at Amsterdam Ave)	\N	\N	https://foursquare.com/item/5110161ce4b03a1187a32fe3
2839	Murray's Cheese	95	9.59999999999999964	40.73109392616922	-74.00284500572215	254 Bleecker St (at Cornelia St)	\N	\N	https://foursquare.com/item/5155a2f8e4b065694633ed6b
2840	Equinox East 63rd Street	95	9.59999999999999964	40.764401	-73.966462	817 Lexington Avenue (at E 63rd St)	\N	\N	https://foursquare.com/item/5841f9ffc45ee347d5b8d11d
2841	Brooklyn Bridge	95	9.59999999999999964	40.70717813660742	-73.99691125083612	Brooklyn Bridge	\N	\N	https://foursquare.com/item/4bb155a870c603bb712496b4
2842	David H. Koch Theater	95	9.59999999999999964	40.77199437487606	-73.98347854614258	Lincoln Center Plaza (at W 63rd St & Columbus Ave)	\N	\N	https://foursquare.com/item/5050dce9e4b0e464efcdcb20
2843	Union Square Greenmarket	95	9.59999999999999964	40.73652697126574	-73.9905595779419	1 Union Sq W (btwn 15th & 17th St)	\N	\N	https://foursquare.com/item/4d93acf9a8a95941ce962978
2844	Hudson River Park	95	9.59999999999999964	40.73265337566474	-74.01070666068738	West St (btwn Battery Pl & W 59th St)	\N	\N	https://foursquare.com/item/4cbdfc6fee009521d0c5fb24
2845	Jacqueline Kennedy Onassis Reservoir	95	9.59999999999999964	40.78511988296314	-73.96247578387509	Central Park (btwn 85th & 96th St)	\N	\N	https://foursquare.com/item/4be2204270c603bb96639ab4
2846	L'Artusi	95	9.59999999999999964	40.733793607045456	-74.00506581253089	228 W 10th St (btwn Bleecker & Hudson St)	\N	\N	https://foursquare.com/item/4d4622693616b60cf345f5c2
2847	Bethesda Fountain	95	9.59999999999999964	40.77429373881737	-73.9708399772644	Terrace Dr (at Central Park)	\N	\N	https://foursquare.com/item/4ff31547e4b041a995485e27
2848	Rubirosa Ristorante	95	9.59999999999999964	40.722726166658305	-73.99599305184151	235 Mulberry St (btwn Prince & Spring St)	\N	\N	https://foursquare.com/item/4e8cbed9be7bc43c182e5487
2849	Top of The Rock Observation Deck	95	9.59999999999999964	40.75903357413162	-73.97933721542358	30 Rockefeller Plz (btwn 5th & 6th Ave)	\N	\N	https://foursquare.com/item/4e49771262e13240b6f23c6c
2850	Carl Schurz Park	95	9.59999999999999964	40.77511823969361	-73.94376326618595	599 E 86th St (at East End Ave)	\N	\N	https://foursquare.com/item/4cacdecbeabd76b0730f7ddf
2851	Apple West Lake (Apple 西湖)	96	8.59999999999999964	30.25425275084163	120.16340062540621	杭州市上城区平海路 100 号	\N	\N	https://foursquare.com/item/5526dacc498e007382637b6c
2852	白堤 Bai Causeway	96	8.5	30.25980577400129	120.14669224022629	西湖 Westlake	\N	\N	https://foursquare.com/item/4fd989dee4b0cbee318adbe0
2853	奎元館	96	8.40000000000000036	30.253013637598922	120.16573250832192	上城区解放路 154 号	\N	\N	https://foursquare.com/item/53eee403498ec45c98b22848
2854	Ellen's Bar	96	8.40000000000000036	30.27676659857488	120.1260589224066	58, xueyuan road	\N	\N	https://foursquare.com/item/5203f690498ec2a1a7394452
2855	Starbucks | 星巴克	96	8.30000000000000071	30.261365415649188	120.20045042037964	景昙路18-26号 | 18-26 Jingtan Rd. (银泰百货庆春店一楼 | 1F Intime QingChun Brch.)	\N	\N	\N
2856	Starbucks | 星巴克	96	8.09999999999999964	30.253154619242324	120.15837192535399	湖滨路1号 | 1 Hubin Rd. (解放路 | Jiefang Rd.)	\N	\N	https://foursquare.com/item/4bbaa2af70c603bb49e196b4
2857	Xie Xie coffee and tea house	96	8.09999999999999964	30.24091022917977	120.15377980071081	中国	\N	\N	https://foursquare.com/item/57eb6635498e5ca0455f5361
2858	West Lake Cultural Square 西湖文化广场	96	8	30.279693224582317	120.1603708369391	西湖文化广场	\N	\N	https://foursquare.com/item/53001168498e2b04bcaa93c5
2859	Jz Club	96	8	30.252056	120.157473	上城区南山路266号	\N	\N	https://foursquare.com/item/4d569a7458856dcbb7e9596d
2860	银泰城 INTIME CITY	96	8	30.301112269768485	120.10367631912231	拱墅区丰潭路 380 号 (萍水街)	\N	\N	https://foursquare.com/item/52365ae011d2994db9387c96
2861	Slim's New York Steak & Burger 纽约•牛排	96	7.90000000000000036	30.243913920302578	120.15412937627023	南山路202-2号	\N	\N	https://foursquare.com/item/54e5933d498e24f344d85d89
2862	雷峰塔 Leifeng Pagoda	96	7.90000000000000036	30.232793429839354	120.14492733954943	南山路15号 Nanshan Rd.	\N	\N	https://foursquare.com/item/502f24b9e4b08345ccb243b2
2863	Angelo's	96	7.90000000000000036	30.177462252286077	120.13688631416792	中国	\N	\N	https://foursquare.com/item/55575dd1498e56b4a8be2f60
2864	Starbucks | 星巴克	96	7.90000000000000036	30.25264694812253	120.21149804551811	富春路701号 | 701 Fuchun Rd. (万象城B1层B151 | B1 MIXC)	\N	\N	\N
2865	宜家家居 IKEA	96	7.79999999999999982	30.3461553368524	120.28066021415826	余杭区乔莫西路 5 号	\N	\N	https://foursquare.com/item/58393015a913305e43c872d4
2866	天街 | Paradise Walk	96	7.79999999999999982	30.31217879837715	120.32239343592536	中国	\N	\N	https://foursquare.com/item/564c86af498e778aa93fece1
2867	SOS Club	96	7.79999999999999982	30.271805922174654	120.13104978242079	Wenyi Lu	\N	\N	https://foursquare.com/item/54634808498e12b71f8bb955
2868	外婆家	96	7.79999999999999982	30.277188419635685	120.14486531386083	马塍路6-1号 (最高人民法院对面)	\N	\N	https://foursquare.com/item/52be4fcf498ed666314fe292
2869	西溪印象城 INCITY	96	7.70000000000000018	30.25028047939959	120.04628143230582	五常大道1号 (天目山西路)	\N	\N	https://foursquare.com/item/53ca512b498e188aab5f8377
2870	Starbucks | 星巴克	96	7.70000000000000018	30.276469263669544	120.13159275054932	教工路26号 | 26 Jiaogong Rd. (EAC | 世贸丽晶城欧美中心2号楼G区107,108室)	\N	\N	https://foursquare.com/item/509f1c30e4b0b11969702ecc
2871	Xihu Spring 西湖春天	96	7.70000000000000018	30.245652973029653	120.15486799257829	南山路101-17号	\N	\N	\N
2872	MixC (万象城)	96	7.70000000000000018	30.25346637506308	120.21063011862778	富春路701号 (钱江新城富春路江锦路口)	\N	\N	https://foursquare.com/item/507b6dd0e4b0109f3695472e
2873	Starbucks | 星巴克	96	7.70000000000000018	30.208696908063743	120.20450592041017	江南大道228号 | 228 JiangNan Ave. (星光国际广场1-101&1-201 | Star Avenue-Binjiang)	\N	\N	https://foursquare.com/item/5061a748e4b0f6295b302638
2874	85度C	96	7.70000000000000018	30.284479	120.112132	文二西路7号 (通普路口)	\N	\N	https://foursquare.com/item/525e9e0b11d2503d7d3118ca
2875	杭州动物园 Hangzhou Zoo	96	7.70000000000000018	30.215672478483082	120.13032795206149	虎跑路40号 Hupao Rd.	\N	\N	https://foursquare.com/item/4f64cb8ae4b05c1d59ab11df
2876	绿茶餐厅 Green Tea Restaurant	96	7.59999999999999964	30.234592897441345	120.11883453366143	西湖区龙井路 83 路	\N	\N	https://foursquare.com/item/4bf7ab6870c603bb0b819cb4
2877	金沙厅	96	7.59999999999999964	30.253784817551253	120.12468874454497	Four Seasons Hotel Hangzhou at West Lake	\N	\N	https://foursquare.com/item/563c2a51cd10acd46054cd94
2878	江南驛（天竺店）	96	7.59999999999999964	30.226330373870532	120.09653091430663	天竺路355号 (法喜寺)	\N	\N	https://foursquare.com/item/51440a10e4b0251c24c8e16a
2879	漫咖啡黄龙店 Maan Coffee	96	7.59999999999999964	30.272587597526062	120.1340103739096	杭州市	\N	\N	https://foursquare.com/item/5663f92e498e34f632e53664
2880	Starbucks 星巴克	96	7.59999999999999964	30.24909530383695	120.15541076660156	南山路147号6号楼	\N	\N	https://foursquare.com/item/4b9b67df70c603bb8d4a94b4
2881	Priceless Music Lounge By MasterCard	97	9.59999999999999964	19.49584371133633	-99.17397022247314	Av de las Granjas 800, Santa Barbara, Azcapotzalco	\N	\N	\N
2882	Museo Nacional de Arte (MUNAL)	97	9.59999999999999964	19.43616185591159	-99.13946628570557	Tacuba 8 (Marconi)	\N	\N	https://foursquare.com/item/5140c3f8e4b0c1e3ad739dbe
2883	Palacio de Bellas Artes	97	9.59999999999999964	19.434722279594045	-99.14138055776661	Av. Juárez s/n (Esq. con Eje Central Lázaro Cárdenas)	\N	\N	https://foursquare.com/item/4e15ce22b3ad47cbbb61e7b5
2884	Sala Nezahualcóyotl, Música UNAM	97	9.59999999999999964	19.31403651416847	-99.18461367858998	Centro Cultural Universitario (Av Universidad 3000, Colonia UNAM, CU)	\N	\N	https://foursquare.com/item/4f5e7e8ae4b06ca37cd43ef9
2885	Centro Cultural Universitario, CCU, Cultura UNAM	97	9.59999999999999964	19.31433237492593	-99.18517066580219	Avenida Insurgentes Sur 3000	\N	\N	https://foursquare.com/item/52cef851498e5c1a31d2123d
2886	Los Tulipanes	97	9.59999999999999964	19.337292112575703	-99.23683851957321	Av. Toluca 1070	\N	\N	https://foursquare.com/item/4bf6212170c603bb38589cb4
2887	Bosque de Chapultepec	97	9.5	19.421531868656658	-99.18494895198332	Av. Paseo de la Reforma s/n	\N	\N	https://foursquare.com/item/4e8e050cc2ee8a36be52c85f
2888	Museo Nacional de Antropología	97	9.5	19.42585140938993	-99.18505169733552	Av. Paseo de la Reforma s/n (Esq. con Clzd. Mahatma Gandhi)	\N	\N	https://foursquare.com/item/52febed811d24ed48221bed4
2889	Suntory	97	9.5	19.39260757825001	-99.17175726938058	Torres Adalid 14 (Av. Magdalena)	\N	\N	https://foursquare.com/item/5228229a11d2a73edb2c2660
2890	Auditorio Nacional	97	9.5	19.425609938584245	-99.19468871370698	Av. Paseo de la Reforma 50 (Entre Blvd. Manuel Ávila Camacho y Clzd. Chivatito)	\N	\N	https://foursquare.com/item/50d23e45e4b029cd7d50e978
2891	Los Tulipanes	97	9.5	19.426889105933004	-99.21328460398269	Prado Norte 540	\N	\N	https://foursquare.com/item/4d7bd39ff260a0935cea2eba
2892	Cineteca Nacional	97	9.5	19.360564283136657	-99.16453227393676	Eje 1 Pte (Av. México Coyoacán) 389 (Real Mayorazgo)	\N	\N	https://foursquare.com/item/51cf82c1498ebfd5d61a2dbd
2893	El Cardenal	97	9.5	19.347136	-99.18859	Av. De La Paz 32	\N	\N	https://foursquare.com/item/52bbc411498e72d59e00d3ef
2894	Museo de Arte Popular	97	9.5	19.433768159525545	-99.14630980441773	Revillagigedo 11 (Independencia)	\N	\N	https://foursquare.com/item/5137ca75e4b09f6210172a9f
2895	Aitana	97	9.5	19.424829483032227	-99.20331573486328	Pedregal 24	\N	\N	https://foursquare.com/item/58a08040d25ded216d22bfe6
2896	La Pantera Fresca	97	9.5	19.441933147849447	-99.2093519560969	Presa El Azúcar (Presa Cointzio)	\N	\N	https://foursquare.com/item/5689f1fc498e1a618b2060f7
2897	Quinta Casa de Correos	97	9.40000000000000036	19.436195058129375	-99.14058606944712	Tacuba 1 (Esq. con Eje Central Lázaro Cárdenas)	\N	\N	https://foursquare.com/item/4e08c7d9315117c55a213d51
2898	Nevería Roxy	97	9.40000000000000036	19.41429302984037	-99.17696766201597	Fernando Montes De Oca 809 (e/ Mazatlán)	\N	\N	https://foursquare.com/item/5044e740e4b08976eacee1e2
2899	Glace Helado	97	9.40000000000000036	19.414047131018357	-99.15616920815594	Mérida 215 (Chiapas)	\N	\N	https://foursquare.com/item/5232542311d2bbaf23bea5f6
2900	El Cardenal	97	9.40000000000000036	19.434985696216348	-99.14623953890083	Av. Juarez #70. Colonia Centro	\N	\N	https://foursquare.com/item/51b4955d498e29f997d3df18
2901	Nevería Roxy	97	9.40000000000000036	19.408722	-99.176487	Tamaulipas 161 (Esq. con Alfonso Reyes)	\N	\N	https://foursquare.com/item/4bf3399370c603bb340b9cb4
2902	Cluny	97	9.40000000000000036	19.34613228554028	-99.1895055770874	Av. de La Paz 57 (Insurgentes Sur & Revolución)	\N	\N	https://foursquare.com/item/50a68b7fe4b067f7a65d6f99
2903	Glorieta de la Cibeles	97	9.40000000000000036	19.420013640196093	-99.16636502090653	Av. Plaza Villa Madrid	\N	\N	https://foursquare.com/item/5653df02498e4b383118f156
2904	La Lonchera Bistró	97	9.40000000000000036	19.40145779093459	-99.14630439937578	Diagonal de San Antonio 1923 (Casas Grandes 8) (Casas Grandes)	\N	\N	https://foursquare.com/item/573fbd3e498e99432abb7eaa
2905	El Cardenal	97	9.40000000000000036	19.433595518996732	-99.13515457493625	Palma 23, Centro Histórico, Ciudad de México (e/ 5 de Mayo y 16 de Septiembre)	\N	\N	https://foursquare.com/item/4f57e1c7e4b08c9f86abf82c
2906	Parque Lincoln	97	9.40000000000000036	19.42964799206588	-99.19650051524245	Av. Emilio Castelar (Esq. con Luis G. Urbina)	\N	\N	https://foursquare.com/item/4fd606f5e4b02c7fc50d652e
2907	La Pantera Fresca	97	9.40000000000000036	19.43006566028681	-99.21730400093038	Av. Tecamachalco (Calle 5)	\N	\N	https://foursquare.com/item/53b9a4f4498e3f7f35d5eee7
2908	Antiguo Colegio de San Ildefonso	97	9.40000000000000036	19.435762216933124	-99.13093149662018	Justo Sierra 16 (República de Argentina y Carmen)	\N	\N	https://foursquare.com/item/505b39e1e4b0242158832837
2909	City Market	97	9.40000000000000036	19.443123992545534	-99.20302333863481	Plaza Carso (Lago Zurich 245)	\N	\N	https://foursquare.com/item/54f93898498e3c4eba1880e3
2910	Centro Histórico	97	9.40000000000000036	19.429997110938356	-99.1350248721135	Primer Cuadro de la Ciudad	\N	\N	https://foursquare.com/item/510d536ce4b0ee658534919a
2911	Guarantee	98	9.59999999999999964	37.96608884823017	23.72599348425865	Βείκου 41 (Στρατηγού Κοντούλη)	\N	\N	https://foursquare.com/item/5156d3bae4b0c70f5314f075
2912	Stavros Niarchos Foundation Cultural Center (ΚΠΙΣΝ - Κέντρο Πολιτισμού Ίδρυμα Σταύρος Νιάρχος)	98	9.59999999999999964	37.941680304099954	23.694874014719336	Δέλτα Φαλήρου (Λεωφ. Ποσειδώνος)	\N	\N	https://foursquare.com/item/530fc32a11d2929c6646f8d7
2913	Acropolis of Athens (Ακρόπολη Αθηνών)	98	9.59999999999999964	37.970043207397595	23.726114488833307	Ακρόπολη Αθηνών	\N	\N	https://foursquare.com/item/4e71f8d7b3adaac7d7ee0c4f
2914	Herod Atticus Odeon (Ωδείο Ηρώδου Αττικού)	98	9.59999999999999964	37.970793652529075	23.724589347839355	Διονυσίου Αρεοπαγίτου (Νότια κλιτύς Ακροπόλεως)	\N	\N	https://foursquare.com/item/4e23ed74cc3fee7eee22beee
2915	Acropolis Museum (Μουσείο Ακρόπολης)	98	9.59999999999999964	37.96891766134154	23.728369125414517	Διονυσίου Αρεοπαγίτου 15	\N	\N	https://foursquare.com/item/4e4a320f1fc7a73d0db41023
2916	Parthenon (Παρθενώνας)	98	9.59999999999999964	37.97167503904148	23.725998270195237	Ακρόπολη Αθηνών	\N	\N	https://foursquare.com/item/4c603e75048b95212a7e3478
2917	Κίτσουλας	98	9.59999999999999964	38.01622504333945	23.791680978008923	Φιλικής Εταιρείας 25	\N	\N	https://foursquare.com/item/5273a96c11d289616441583a
2918	Lycabettus Hill (Λόφος Λυκαβηττού)	98	9.5	37.98410502914355	23.745746612548828	Λόφος Λυκαβηττού	\N	\N	https://foursquare.com/item/4fde69e0e4b0f11e35e75e09
2919	MI-RO	98	9.5	37.97782096689135	23.742129175125704	Ηροδότου 31	\N	\N	https://foursquare.com/item/56869379498e8028ea9a7ac3
2920	Mount Ymittos (Όρος Υμηττός)	98	9.5	37.956156602689205	23.81765776587104	Όρος Υμηττός	\N	\N	https://foursquare.com/item/51b623ea498e71ddfef637a0
2921	National Theatre of Greece (Εθνικό Θέατρο)	98	9.5	37.98481638322396	23.725260281254457	Αγίου Κωνσταντίνου 22-24	\N	\N	https://foursquare.com/item/4fde6a63e4b04e7e2a1a6ed5
2922	Juicy Grill	98	9.5	37.99869246812795	23.800105711346934	Κεραμεικού 2	\N	\N	https://foursquare.com/item/503b8215e4b0e79b21e74255
2923	Flisvos Marina (Μαρίνα Φλοίσβου)	98	9.5	37.930386561453794	23.685389942501292	Λεωφ. Ποσειδώνος	\N	\N	https://foursquare.com/item/4e6deb933151d38bc2cfc0fc
2924	Onassis Cultural Center Athens (Στέγη του Ιδρύματος Ωνάση)	98	9.5	37.95821207065279	23.71907740483416	Λεωφ. Συγγρού 107 (Λεοντίου)	\N	\N	https://foursquare.com/item/513133b9e4b0feed23664211
2925	Dionysiou Areopagitou (Διονυσίου Αρεοπαγίτου)	98	9.40000000000000036	37.96949962694601	23.729630090695938	Διονυσίου Αρεοπαγίτου	\N	\N	https://foursquare.com/item/5448bcaf498e81c5564fcf88
2926	Καραμανλίδικα του Φάνη	98	9.40000000000000036	37.980128899625846	23.725852996862155	Σωκράτους 1 (Ευριπίδου 52)	\N	\N	https://foursquare.com/item/54839256498e64a91a6fbca8
2927	Celia Kritharioti	98	9.40000000000000036	37.9720055739287	23.7332153996718	Δαιδάλου 8	\N	\N	https://foursquare.com/item/55e39882498eeaa74e95b84f
2928	Museum of Cycladic Art (Μουσείο Κυκλαδικής Τέχνης)	98	9.40000000000000036	37.97577038772801	23.74237322685001	Νεοφύτου Δούκα 4 (Λεωφ. Βασιλίσσης Σοφίας)	\N	\N	https://foursquare.com/item/4efb3a9f8231c11159d451c2
2929	Κοσμικόν	98	9.40000000000000036	37.93275751775251	23.696887493133545	Αγίου Αλεξάνδρου 102 (Ζησιμοπούλου)	\N	\N	https://foursquare.com/item/53f1bcfd498edb0047f00c15
2930	Temple of Hephaistos (Ναός Ηφαίστου)	98	9.40000000000000036	37.97563981433231	23.7214994430542	Αδριανού 24	\N	\N	https://foursquare.com/item/5167e3bc498ed8b76a642181
2931	έξη	98	9.40000000000000036	37.93102274948267	23.754104375839233	Λεωφ. Σοφοκλή Βενιζέλου 88 (Πουσουλίδου)	\N	\N	https://foursquare.com/item/53f1e7e9498ec46db716eadb
2932	Espressaki	98	9.40000000000000036	37.98369013818928	23.760473416169166	Άγγελου Πυρρή 3 (Ευήνου)	\N	\N	https://foursquare.com/item/518baeb3498e299047b5d49d
2933	OAK Cava	98	9.40000000000000036	38.02039220554335	23.789101239182113	Λεωφ. Κηφισιάς 282	\N	\N	https://foursquare.com/item/5293261a11d2b2a69d2934ea
2934	Carpo	98	9.40000000000000036	38.00423718156699	23.775702660217487	Δημητρίου Βασιλείου 1	\N	\N	https://foursquare.com/item/52ffb80411d24ed482276028
2935	Ancient Agora (Αρχαία Αγορά)	98	9.40000000000000036	37.975726690729225	23.723906330394563	Αδριανού 24	\N	\N	https://foursquare.com/item/52e2229411d27496c2e121e9
2936	Philopappos Hill (Λόφος Φιλοπάππου)	98	9.40000000000000036	37.968747	23.719697	Λόφος Φιλοπάππου (Μουσών)	\N	\N	https://foursquare.com/item/4fde6ab6e4b0ef4c39a9bd94
2937	Yton The Music Show	98	9.40000000000000036	37.977462	23.682428	Πέτρου Ράλλη 38	\N	\N	\N
2938	Louis Vuitton	98	9.40000000000000036	37.97769489628692	23.736294507980347	Βουκουρεστίου 19	\N	\N	https://foursquare.com/item/514cbe8be4b0b8a7260cf143
2939	Panathenaic Stadium (Παναθηναϊκό Στάδιο (Καλλιμάρμαρο))	98	9.40000000000000036	37.96957032353222	23.740292972842205	Λεωφ. Βασιλέως Κωνσταντίνου (Λόφος Αρδηττού)	\N	\N	https://foursquare.com/item/4e4e3732922e36d08cab125e
2940	Ciné Paris	98	9.40000000000000036	37.971909545581305	23.73085968196392	Κυδαθηναίων 22	\N	\N	https://foursquare.com/item/505a12a3e4b09684f91646c4
2941	BVLGARI Hotel & Resort	99	9.30000000000000071	-8.844235356371978	115.1207158083413	Jln. Goa Lampeh (Banjar Dinas Kangin)	\N	\N	https://foursquare.com/item/4c70c9279a669c74242fe0bd
2942	Simply Brew	99	9.19999999999999929	-8.68422746745994	115.25902313892905	Jl. Bypass Ngurah Rai No. 127 Sanur	\N	\N	https://foursquare.com/item/581b14be38faeb026b7ce01c
2943	Massimo	99	9.09999999999999964	-8.704879123410977	115.26063680648804	Jalan Danau Tamblingan No. 228 (Jalan Danau Poso)	\N	\N	https://foursquare.com/item/4f8965bde4b01f95a2d54ab1
2944	Single Fin	99	9.09999999999999964	-8.815022232683653	115.08887887001039	Jalan Mamo (Labuan Sait)	\N	\N	https://foursquare.com/item/52a0e34511d269cbf82f81b3
2945	Suluban Beach	99	9.09999999999999964	-8.816217642394994	115.08880671572152	Jalan Pantai Suluban (Jalan Labuan Sait Pecatu)	\N	\N	https://foursquare.com/item/54560813498e2dc188993d9e
2946	9/11 Cafe & Concept Store	99	9	-8.681133862320175	115.18844988797464	Jl. Teuku Umar Barat No. 337	\N	\N	https://foursquare.com/item/567f5044498e10f16607afa4
2947	Fontana Hotel	99	9	-8.704157965673822	115.17759561538696	Jalan Dewi Sri	\N	\N	https://foursquare.com/item/50f62001e4b0d373e16bb425
2948	Warung pojok	99	9	-8.64088154980044	115.22201048730044	Jl nangka	\N	\N	https://foursquare.com/item/51297b6de4b01971f64e7a05
2949	Lilla Warung	99	9	-8.689723913575243	115.2627182006836	Jl. Bumi Ayu No. 6	\N	\N	https://foursquare.com/item/55d8439e498ebfd0fe80ef93
2950	Warung Kecil	99	9	-8.70291968409666	115.26185360965754	Jalan Duyung (Sanur)	\N	\N	https://foursquare.com/item/5253c68011d2e803506924c3
2951	Lilla Pantai	99	8.90000000000000036	-8.704883508303752	115.26401262212941	Indonesia	\N	\N	https://foursquare.com/item/571cc606498e9d3bb0b3c54c
2952	Goemerot Restaurant	99	8.90000000000000036	-8.674080209744664	115.22819280624391	JL Tukad Gangga 8	\N	\N	https://foursquare.com/item/58775a24a55db0742035beb9
2953	Pura Luhur Uluwatu (Uluwatu Temple)	99	8.90000000000000036	-8.829105239964123	115.08644381256121	Jalan Uluwatu (Uluwatu)	\N	\N	https://foursquare.com/item/514c3a38e4b0c9592e7b15c5
2954	Bali Nikmat Restaurant	99	8.90000000000000036	-8.707239599175942	115.18145595916106	Jalan Raya Kuta No 40 (Imam Bonjol)	\N	\N	https://foursquare.com/item/53a420ce11d2ac600b28fa11
2955	Siomay Pak Lebah, jln Dr. Muwardi Renon-Denpasar	99	8.80000000000000071	-8.670614691423063	115.23717150155998	Jln Dr Muwardi,Renon-Denpasar	\N	\N	https://foursquare.com/item/57e28343498e93e6c2e6e7be
2956	Blue Point Beach	99	8.80000000000000071	-8.814966571604138	115.08852481842041	Jalan Pantai Suluban (Jalan Labuan Sait Pecatu)	\N	\N	https://foursquare.com/item/4e6652a46365c919129eaa7b
2957	Warung Sate Plecing Mak Lukluk	99	8.80000000000000071	-8.673809570996486	115.2437705680462	Jalan Raya Puputan 210A	\N	\N	https://foursquare.com/item/533fa73411d2e09061b407b0
2958	Buka Baju	99	8.80000000000000071	-8.673669717269565	115.18037906569536	Teuku Umar Barat	\N	\N	\N
2959	Bali Wake Park	99	8.80000000000000071	-8.724230504648103	115.21486678480349	Jln Pelabuhan Benoa	\N	\N	https://foursquare.com/item/58170bc438fa80a1da05b8ba
2960	Warung Mak Beng	99	8.80000000000000071	-8.673698389161194	115.2630078792572	Jalan Hang Tuah No. 45 (Sanur)	\N	\N	https://foursquare.com/item/509c9ce4e4b0735b7d7a3e98
2961	Warung Babi Guling Sari Kembar 99	99	8.80000000000000071	-8.673653	115.17877	Jalan Marlboro No. 99 (Jalan Teuku Umar Barat)	\N	\N	https://foursquare.com/item/50b9ef02e4b0802eb8d4d2ab
2962	Kecak Dance Uluwatu	99	8.69999999999999929	-8.830720972725484	115.08545100688934	Pura Luhur Uluwatu (Uluwatu Temple) (Jalan Uluwatu - Pecatu)	\N	\N	https://foursquare.com/item/51f4ed8c498e0d9f1e839685
2963	Warung Sari Manis	99	8.69999999999999929	-8.667023694951203	115.23471707636044	Jalan Tjok Agung Tresna No.99X (Renon)	\N	\N	https://foursquare.com/item/524a64dc11d2324e1f000892
2964	The Bar at BVLGARI Hotels & Resorts	99	8.69999999999999929	-8.845533328320077	115.12121961090733	Jalan Goa Lampeh (Jalan Goa Lempeh, Banjar Dinas Kangin)	\N	\N	https://foursquare.com/item/4e7165b5e4cd7aa6d6cf9ba5
2965	Warung Krishna	99	8.69999999999999929	-8.698993163037121	115.25349140167236	Jalan Kutat Lestari No. 4 (Sanur)	\N	\N	https://foursquare.com/item/4e7767faaeb780be0b13bf6d
2966	Royal Gym Fitness & Aerobic Center	99	8.69999999999999929	-8.636566229981554	115.21811446871611	Gatot Subroto 4 No. 6 X	\N	\N	https://foursquare.com/item/5878a7a4d25ded6a66761276
2967	Warung Coconut Tree	99	8.69999999999999929	-8.694368439978808	115.26387370488895	Jl. Danau Tamblingan	\N	\N	https://foursquare.com/item/5112228ee4b0e45707e3a6ba
2968	Pizzeria Italia	99	8.69999999999999929	-8.826864599213502	115.12348741292955	Jl. Labuhan Sait No. 69	\N	\N	https://foursquare.com/item/560bd8ac498ebfcf3e4eb285
2969	Bebek Goreng H.Slamet	99	8.69999999999999929	-8.670900020631656	115.1912694166169	Jalan Mahendradata No 78	\N	\N	https://foursquare.com/item/56b6fa8438faad31308e2c76
2970	Lapangan Niti Mandala Renon	99	8.69999999999999929	-8.672324959067744	115.23431186280024	Jalan Puputan Niti Mandala Raya (Renon)	\N	\N	https://foursquare.com/item/50af399ae4b0f706cef97e60
2971	Puerto Madero	100	9.40000000000000036	21.09330910639892	-86.77087783813477	Blvd. Kukulcan Km. 14	\N	\N	https://foursquare.com/item/4fb419b1e4b0c2c27f2d3e59
2972	Isla Holbox	100	9.40000000000000036	21.52331595442039	-87.37913684859609	77310 Cancún, Quintana Roo	\N	\N	https://foursquare.com/item/4f093317e4b0ef60ee6371e4
2973	NIZUC Resort & Spa	100	9.40000000000000036	21.03220810634133	-86.78823347814607	Blvd. Kukulcan Km 21 (Punta Nizuc)	\N	\N	https://foursquare.com/item/517031dde4b0cac941ada691
2974	Nomads Cocina & Barra	100	9.40000000000000036	21.161865	-86.824015	Av. Nader (Mero)	\N	\N	https://foursquare.com/item/5898fbc754386d21df358585
2975	Caribbean Sea	100	9.40000000000000036	21.082279455321263	-86.7727072095421	Cancún, Quintana Roo	\N	\N	https://foursquare.com/item/50e6fc3be4b0ee666cb49da5
2976	Caban Spa	100	9.40000000000000036	21.139842152225846	-86.85326825981906	Gran Plaza (Sm 51)	\N	\N	https://foursquare.com/item/53e3f2ed498e57f27cae6efc
2977	Live Aqua Cancún	100	9.30000000000000071	21.107163	-86.762612	Blvd. Kukulcan Km. 12.5	\N	\N	https://foursquare.com/item/4e4ad83522713bd908b6e8d0
2978	Playa Delfines (El Mirador)	100	9.30000000000000071	21.0607131137873	-86.7795467376709	Blvd. Kukulcan km 18.5 (Ruinas Del Rey)	\N	\N	https://foursquare.com/item/4ebee1c261af06192ad8f9f6
2979	Playa Punta Cancún	100	9.30000000000000071	21.1339506591597	-86.74346182074754	Punta Cancun	\N	\N	https://foursquare.com/item/558a0899498e2a5fcbc55338
2980	RIU Palace Las Américas	100	9.30000000000000071	21.138851161194275	-86.75032675603832	Blvd Kukulcan Km 8.5 Lote 4 Hotel Zone	\N	\N	https://foursquare.com/item/52a8c342498eef0888d733f9
2981	Navios	100	9.30000000000000071	21.045313131752884	-86.7835918185848	Blvd Kukulcan km 19.5	\N	\N	https://foursquare.com/item/525b42e411d2558325a53bd0
2982	Hard Rock Hotel Cancun	100	9.30000000000000071	21.089124885654783	-86.76950454711914	Blvd. Kukulcan Km. 14.5 (Zona Hotelera)	\N	\N	https://foursquare.com/item/5239c9ae498e74304e472e27
2983	Zona Hotelera	100	9.30000000000000071	21.142984958533486	-86.77452802341736	Blvd. Kukulcán	\N	\N	https://foursquare.com/item/51f2d3fc498e3ca18f1d7778
2984	Le Blanc Spa Resort	100	9.30000000000000071	21.125558890255306	-86.75270323287475	Blvd. Kukulcan Km. 10	\N	\N	https://foursquare.com/item/51f7b860498e37339bcd7c5c
2985	La Isla Shopping Village	100	9.30000000000000071	21.110431197403585	-86.76379356620583	Blvd. Kukulcan Km 12.5	\N	\N	https://foursquare.com/item/4fa80508e4b028d55bdf9fab
2986	Coco Bongo	100	9.30000000000000071	21.132548822174172	-86.7472086824553	Blvd. Kukulcán Km. 9.5	\N	\N	https://foursquare.com/item/4dc58c6c81dc60ffd76ee7c7
2987	Häagen-Dazs	100	9.19999999999999929	21.132649086574087	-86.74741001289767	Forum by the Sea	\N	\N	https://foursquare.com/item/5036e7c1e4b03e0136910c40
2988	Playa Marlin	100	9.19999999999999929	21.103550661878742	-86.7631848659942	Blvd. Kukulcan Km. 13	\N	\N	https://foursquare.com/item/4fb2d8b4e4b02d8458711f1a
2989	Harry's Prime Steakhouse & Raw Bar	100	9.19999999999999929	21.092772016705293	-86.77113664164479	Boulevard Kukulcán Km. 14.2 Zona Hotelera CP 77500, Cancún, Quintana Roo	\N	\N	https://foursquare.com/item/50e857e4e4b066549634fb72
2990	Playa/Beach	100	9.19999999999999929	21.083211149429165	-86.77166180591104	Gran Melia Cancún (Zona Hotelera)	\N	\N	https://foursquare.com/item/512538a0e4b0f396ac2d94c7
2991	Fashion Harbour	100	9.19999999999999929	21.108426675673837	-86.76396537537622	La Isla Shopping Village	\N	\N	https://foursquare.com/item/5886ad5825911e7f08217a95
2992	Irori	100	9.19999999999999929	21.151680695222954	-86.82447373867035	Viento local c (Tulum)	\N	\N	https://foursquare.com/item/5233d23611d29538c776e244
2993	Thai Lounge	100	9.19999999999999929	21.108932575337086	-86.7644539475441	La Isla Shopping Village	\N	\N	https://foursquare.com/item/4d0513c17d9ba35d9b586923
2994	Secrets The Vine Cancún	100	9.19999999999999929	21.09046156516261	-86.7699930400909	Boulevard Kukulcán Km. 14.5 (Manzana 13, Lote 38,Retorno del Rey, Zona Hotelera)	\N	\N	https://foursquare.com/item/516358af498ea7a811a3249a
2995	Casa Rolandi	100	9.19999999999999929	21.097533247971462	-86.76881790161133	Blvd. Kukulcan Km. 13 (Zona Hotelera)	\N	\N	https://foursquare.com/item/54a77654498ee4679f5f1c41
2996	Puerto Cancún Golf Club	100	9.19999999999999929	21.165237253052616	-86.81565734394316	Av. Bonampak (Blvd Kukulkan)	\N	\N	https://foursquare.com/item/5713dba7cd10e5c01125061f
2997	sportlife Athletic Center	100	9.19999999999999929	21.150775637121104	-86.83352285234436	México	\N	\N	\N
2998	La Tlayudería	100	9.19999999999999929	21.16264188178014	-86.83914810419081	Av. Palenque #42 SM 29 M3 L1 (Entre playa caleta y playa carey)	\N	\N	https://foursquare.com/item/5294431111d2a01eabb80833
2999	Bovino's Churrascaria	100	9.19999999999999929	21.148182	-86.834204	Av. Yaxchilan Smz. 17 Mz. 2 (Bacalar)	\N	\N	https://foursquare.com/item/4dbeb497fc60916573874af2
3000	Rolandi's	100	9.09999999999999964	21.15706508556017	-86.82436913251877	Av. Coba 12 sm 5 mza 1 L6 (Av. Tulum)	\N	\N	https://foursquare.com/item/52db866f498ea7145a5e3a1a
3001	Supermercado Nacional	101	9.19999999999999929	18.559209683378477	-68.3695936203003	Calle Palma Cana	\N	\N	https://foursquare.com/item/514cfc03e4b06e0e37ccb9ef
3002	Wendy's	101	8.5	18.55934699027842	-68.37214708328247	Boulevard Punta Cana	\N	\N	https://foursquare.com/item/505f3eeae4b0adefc40f8924
3003	Baskin Robbins	101	8.40000000000000036	18.555376850622533	-68.36974388614564	Boulevard Punta Cana	\N	\N	https://foursquare.com/item/4d45da71bf61a1cd0f5417ac
3004	Coco Bongo	101	9.30000000000000071	18.63530856733034	-68.3952109975429	Downtown Punta Cana (Boulevard Turistico del Este)	\N	\N	https://foursquare.com/item/5475d32c498ea4c0d76cf0fd
3005	Punta Cava. Wine, Tapas and More	101	8.09999999999999964	18.559436391957053	-68.37108303470733	Punta Cana Village	\N	\N	https://foursquare.com/item/52719e7711d2aff708c293a9
3006	La Tavernetta	101	8.80000000000000071	18.63806860995689	-68.40053847875431	Av. Estados Unidos	\N	\N	https://foursquare.com/item/5297e37911d2d1318a5339b8
3007	Noah Restaurant & Lounge	101	9	18.640537013748315	-68.39947074651718	Carretera Barcelo	\N	\N	https://foursquare.com/item/50b00842e4b04cb0a1c8f9ad
3008	Downtown Punta Cana	101	8.40000000000000036	18.63512351746013	-68.39642107486725	Boulevard del Atlántico (Boulevard Turistico del Este)	\N	\N	https://foursquare.com/item/52ea7440498e1b6081f593a0
3009	Playa Blanca Restaurant	101	9	18.540638243066127	-68.35423887600787	PUNTACANA Resort & Club	\N	\N	https://foursquare.com/item/50afff96e4b0211a31ccfcd7
3010	CrossFit Punta Cana	101	8	18.555304239734795	-68.36974388614564	Calle Amapola	\N	\N	\N
3011	La Cana Golf Clubhouse	101	9.09999999999999964	18.526391756300296	-68.36392732361928	PUNTACANA Resort & Club	\N	\N	https://foursquare.com/item/501d64c7e4b05e0d9589c572
3012	Mamma Luisa Bar Trattoria	101	7.79999999999999982	18.55951654149142	-68.36993020246675	Galerias de Punta Cana	\N	\N	https://foursquare.com/item/55aae68a498eb163c8e544af
3013	Brot Bagels & More	101	7.79999999999999982	18.55946265761922	-68.37037270373007	23000 Punta Cana	\N	\N	https://foursquare.com/item/51587f31e4b0226aba6f1e8c
3014	Ruta 01	101	8.09999999999999964	18.635361375223148	-68.3967888636207	Avenida Barcelo, Punta Cana (Boulevard)	\N	\N	https://foursquare.com/item/55d0d65d498ee535bc46db5a
3015	Quiksilver Surf & Crepes	101	8.19999999999999929	18.640675156974797	-68.39912946192149	Plaza Paseo San Juan	\N	\N	https://foursquare.com/item/5332e330498e366386e3cf21
3016	Il Cielo at Alsol Luxury Village	101	7.79999999999999982	18.536244516573973	-68.38520193086879	Cap Cana	\N	\N	https://foursquare.com/item/5302a749498e2b04bcb93709
3017	Punto Italia	101	8.09999999999999964	18.64078635613039	-68.39982232557604	Av. Barcelo	\N	\N	https://foursquare.com/item/517d69d8e4b010efe9afda52
3018	Imagine Disco	101	7.90000000000000036	18.636428280783228	-68.40485868710441	Av. Estados Unidos	\N	\N	https://foursquare.com/item/4f1bba8fe4b0e6badbf3543e
3019	la mar	101	7.79999999999999982	18.629933448419546	-68.39442497567958	Carretera Veron	\N	\N	https://foursquare.com/item/536959a711d2aaa8add1f4fd
3020	Club Med Beach, Punta Cana	101	8	18.54505311409144	-68.35039610277107	República Dominicana	\N	\N	https://foursquare.com/item/5155a3cbe4b0c678e7e021b0
3021	Cielo Bar	101	8	18.545538739591763	-68.35063482049321	Carretera De Servicio Punta Cana	\N	\N	https://foursquare.com/item/50f985b0e4b04bfe9ca64d27
3022	Bamboo Restaurant at Tortuga Bay	101	8.19999999999999929	18.517362	-68.369377	Tortuga Bay	\N	\N	https://foursquare.com/item/4fb6f35de4b085b06e7c5789
3023	Api Beach	101	9	18.501529831842316	-68.3768122616549	Marina Cap Cana	\N	\N	https://foursquare.com/item/4ff0f7d8e4b0c63565ca0351
3024	Mathilda	101	7.79999999999999982	18.641239	-68.399339	Av. Barcelo	\N	\N	https://foursquare.com/item/57af1346498e575ea7083709
3025	Cocotal Palma Real	101	9.5	18.668181076086032	-68.42352524118671	Bávaro	\N	\N	https://foursquare.com/item/5287aa3611d2ab3ea3b43e87
3026	Gran Teatro Bávaro	101	8.69999999999999929	18.66363123387539	-68.39593297317082	Barcelo Bovaro Palace Deluxe	\N	\N	https://foursquare.com/item/51d5b58b498e0485c157f43e
3027	Barceló Bávaro Beach	101	8.90000000000000036	18.668037705825544	-68.39975245697269	Carretera Bávaro, Km. 1	\N	\N	https://foursquare.com/item/510bd176e4b040b58c40ef46
3028	Pearl Beach Club	101	8.5	18.64373398478834	-68.34756642450814	Carretera Cabeza de Toro	\N	\N	https://foursquare.com/item/5619bdd6498ee0005fe4d5e8
3029	19 Hole Golf Bar	101	8.40000000000000036	18.661027584787263	-68.39693442321965	Carretera Bávaro Km. 1	\N	\N	https://foursquare.com/item/506dbb18e4b0a9ca4bb7c22a
3030	Palm Beach	101	8.59999999999999964	18.643348536477497	-68.34497546413547	República Dominicana	\N	\N	\N
\.


--
-- Name: places_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('places_place_id_seq', 3030, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tags (tag_id, tag_name) FROM stdin;
1	Garden
2	Trail
3	Multiplex
4	Theme Park Ride / Attraction
5	Non-Profit
6	Art Gallery
7	Café
8	Mountain
9	Thai Restaurant
10	Zoo
11	Theme Park
12	Scenic Lookout
13	Park
14	Dumpling Restaurant
15	Coffee Shop
16	Japanese Restaurant
17	Monument / Landmark
18	Yoga Studio
19	Taiwanese Restaurant
20	Club House
21	Wine Bar
22	Harbor / Marina
23	Greek Restaurant
24	Bookstore
25	Botanical Garden
26	Hotel
27	Theater
28	Beach
29	Resort
30	Cocktail Bar
31	Ice Cream Shop
32	Spanish Restaurant
33	Cosmetics Shop
34	Accessories Store
35	Reservoir
36	Climbing Gym
37	Art Museum
38	Clothing Store
39	Scandinavian Restaurant
40	City Hall
41	History Museum
42	French Restaurant
43	Nature Preserve
44	Asian Restaurant
45	Pizza Place
46	Pub
47	Middle Eastern Restaurant
48	Arts & Crafts Store
49	Cheese Shop
50	Steakhouse
51	Concert Hall
52	Market
53	Indian Restaurant
54	Event Space
55	Street Food Gathering
56	Record Shop
57	Seafood Restaurant
58	Latin American Restaurant
59	Hotel Bar
60	Historic Site
61	Italian Restaurant
62	Restaurant
63	Caribbean Restaurant
64	Bar
65	Peruvian Restaurant
66	Plaza
67	Bakery
68	Sandwich Place
69	Nightclub
70	Lounge
71	Building
72	Shopping Mall
73	Museum
74	Golf Course
75	Beer Garden
76	Food Truck
77	Supermarket
78	Pet Store
79	Jewelry Store
80	Stationery Store
81	Mosque
82	Malay Restaurant
83	Pool
84	Cuban Restaurant
85	Waterfront
86	Opera House
87	Castle
88	Pedestrian Plaza
89	Jazz Club
90	Factory
91	Sporting Goods Shop
92	BBQ Joint
93	Gym / Fitness Center
94	Waterfall
95	Gastropub
96	Frozen Yogurt Shop
97	Go Kart Track
98	Bike Trail
99	Arcade
100	Tattoo Parlor
101	Dessert Shop
102	Soccer Stadium
103	Music Venue
104	Church
105	Cultural Center
106	Indie Movie Theater
107	Canal
108	Boutique
109	Furniture / Home Store
110	Science Museum
111	Electronics Store
112	Forest
113	Gym
114	Hookah Bar
115	Tech Startup
116	Fountain
117	Bridge
118	Sushi Restaurant
119	Neighborhood
120	Athletics & Sports
121	Shoe Store
122	Surf Spot
123	American Restaurant
124	Water Park
125	Fishing Spot
126	Spa
127	Vietnamese Restaurant
128	Turkish Restaurant
129	Sports Bar
130	Modern European Restaurant
131	Exhibit
132	Chinese Restaurant
133	Tea Room
134	South American Restaurant
135	Deli / Bodega
136	Tennis Court
137	Design Studio
138	Comfort Food Restaurant
139	Falafel Restaurant
140	General Entertainment
141	Liquor Store
142	Food Court
143	Winery
144	Racetrack
145	City
146	Mediterranean Restaurant
147	Sculpture Garden
148	Library
149	Other Great Outdoors
150	Tapas Restaurant
151	Vegetarian / Vegan Restaurant
152	Portuguese Restaurant
153	Nightlife Spot
154	Hot Dog Joint
155	Badminton Court
156	Farm
157	Hotpot Restaurant
158	Butcher
159	Paper / Office Supplies Store
160	Gourmet Shop
161	Dim Sum Restaurant
162	Department Store
163	Burger Joint
164	Yunnan Restaurant
165	Casino
166	Wine Shop
167	Hotel Pool
168	Breakfast Spot
169	Comedy Club
170	Performing Arts Venue
171	Grocery Store
172	Track
173	Basketball Stadium
174	Transportation Service
175	Coworking Space
176	Gluten-free Restaurant
177	Diner
178	Bagel Shop
179	Mac & Cheese Joint
180	Lake
181	Bistro
182	Comic Shop
183	Stadium
184	Mexican Restaurant
185	Temple
186	Brewery
187	Buddhist Temple
188	Massage Studio
189	Nail Salon
190	Music Store
191	Gymnastics Gym
192	Rock Club
193	Taco Place
194	Construction & Landscaping
195	Farmers Market
196	Observatory
197	Island
198	Soup Place
199	Palace
200	Austrian Restaurant
201	Skating Rink
202	Beer Store
203	Cupcake Shop
204	Argentinian Restaurant
205	Kids Store
206	Beer Bar
207	Convention Center
208	Japanese Curry Restaurant
209	Office
210	Lighthouse
211	Snack Place
212	Wagashi Place
213	Hostel
214	Hot Spring
215	Udon Restaurant
216	Yakitori Restaurant
217	Shrine
218	Tempura Restaurant
219	Ramen Restaurant
220	Tonkatsu Restaurant
221	College Library
222	Polish Restaurant
223	Movie Theater
224	Juice Bar
225	Chocolate Shop
226	Eastern European Restaurant
227	Gaming Cafe
228	Men's Store
229	North Indian Restaurant
230	Arts & Entertainment
231	Sports Club
232	Bubble Tea Shop
233	Roof Deck
234	Flea Market
235	African Restaurant
236	Brazilian Restaurant
237	Fried Chicken Joint
238	New American Restaurant
239	Cemetery
240	Lombard Restaurant
241	Flower Shop
242	Adult Boutique
243	Board Shop
244	Fast Food Restaurant
245	Outdoors & Recreation
246	Public Art
247	Convenience Store
248	Bed & Breakfast
249	Salon / Barbershop
250	Beach Bar
251	Bay
252	Speakeasy
253	Field
254	Candy Store
255	National Park
256	Soccer Field
257	Bath House
258	Cafeteria
259	Pie Shop
260	Street Art
261	Fish Market
262	Creperie
263	Doner Restaurant
264	Cretan Restaurant
265	German Restaurant
266	Bathing Area
267	Ethiopian Restaurant
268	Meyhane
269	Cigkofte Place
270	Pastry Shop
271	Camera Store
272	Moroccan Restaurant
273	Cricket Ground
274	Indie Theater
275	Fish & Chips Shop
276	Women's Store
277	Salad Place
278	Music Festival
279	Padangnese Restaurant
280	Fruit & Vegetable Store
281	Noodle House
282	Hawaiian Restaurant
283	Volcano
284	Filipino Restaurant
285	Korean Restaurant
286	Food
287	Planetarium
288	Circus
289	Cambodian Restaurant
290	Health & Beauty Service
291	Racecourse
292	Whisky Bar
293	Tennis Stadium
294	Australian Restaurant
295	Donut Shop
296	Stables
297	Campground
298	Playground
299	Food & Drink Shop
300	Northeastern Brazilian Restaurant
301	Bike Shop
302	Dhaba
303	Indian Sweet Shop
304	Mughlai Restaurant
305	University
306	Jiangsu Restaurant
307	Bowling Alley
308	Martial Arts Dojo
309	Post Office
310	Taverna
311	Meze Restaurant
312	Other Nightlife
313	Track Stadium
314	Indonesian Restaurant
315	Churrascaria
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tags_tag_id_seq', 315, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, name, lastname, city_id, email, password, picture) FROM stdin;
1	Kenneth	Allen	102	kallen0@slashdot.org	DlmIEn8	\N
2	Annie	Mason	103	amason1@bravesites.com	lJ6unx	\N
3	Joe	Lawrence	104	jlawrence2@ezinearticles.com	YWzHDz0RHE	\N
4	Adam	Burns	105	aburns3@hugedomains.com	10f5gAUPq	\N
5	Paula	Cooper	106	pcooper4@fotki.com	KP3Ufx	\N
6	Kelly	Schmidt	107	kschmidt5@nytimes.com	KMGbVwHT3	\N
7	Brenda	Wheeler	108	bwheeler6@purevolume.com	0hrowGKucWy	\N
8	Shawn	Kennedy	109	skennedy7@dyndns.org	zPbHSYvuVD	\N
9	Barbara	Sanders	110	bsanders8@house.gov	fvb6zBWAk	\N
10	Jose	Ross	111	jross9@seesaa.net	5hDLzheMQ	\N
11	Bonnie	Kelly	112	bkellya@jiathis.com	j3nTHHHY	\N
12	Pamela	Stanley	113	pstanleyb@rambler.ru	yex0IdVnf	\N
13	Andrea	Walker	114	awalkerc@delicious.com	kgqXMb	\N
14	Jean	Long	21	jlongd@plala.or.jp	F854s8N6CiCR	\N
15	Phillip	Frazier	115	pfraziere@exblog.jp	Oqohelhza	\N
16	Ashley	Gray	116	agrayf@furl.net	5Ihe20j	\N
17	Patricia	Schmidt	117	pschmidtg@sourceforge.net	PI8MKw	\N
18	Margaret	Sanchez	118	msanchezh@seattletimes.com	G3ZoYE	\N
19	Marie	Gardner	119	mgardneri@google.nl	mr4BaT	\N
20	Carl	Webb	120	cwebbj@prnewswire.com	44s8oW9Ss5aB	\N
21	Kathleen	Moore	121	kmoorek@opensource.org	gvGVs9iC	\N
22	Mary	Russell	122	mrusselll@dropbox.com	etq7kDfaqmq	\N
23	Stephanie	Johnston	123	sjohnstonm@purevolume.com	lg5mmVRZZa7	\N
24	Patricia	Perez	124	pperezn@springer.com	RJWGahcw	\N
25	Joan	Johnston	125	jjohnstono@simplemachines.org	HxCEbJ7bLiv	\N
26	Karen	Simpson	126	ksimpsonp@usgs.gov	dM9MJkcWL	\N
27	Justin	Dixon	127	jdixonq@cnet.com	mpEFxlVV	\N
28	David	Andrews	128	dandrewsr@jiathis.com	DLAHmt1S	\N
29	Dorothy	Russell	129	drussells@yellowbook.com	DgcpLS	\N
30	Edward	Ryan	130	eryant@upenn.edu	PrdbGxvtiIEu	\N
31	Sara	Oliver	131	soliveru@globo.com	3HA7oRQVSTl	\N
32	Theresa	Foster	132	tfosterv@dailymail.co.uk	uxZwkl	\N
33	Michelle	Thomas	133	mthomasw@latimes.com	9Q1gP5	\N
34	Christopher	Ford	134	cfordx@weibo.com	4DT60x5	\N
35	Kathryn	Mitchell	135	kmitchelly@foxnews.com	CrsL0AEuUl	\N
36	Adam	Hunt	136	ahuntz@cyberchimps.com	Elnuzg	\N
37	Timothy	Riley	137	triley10@cdbaby.com	hu2yye	\N
38	Rebecca	Vasquez	138	rvasquez11@hatena.ne.jp	KtqAHbOkUr	\N
39	Jason	Burton	139	jburton12@sogou.com	QriQIl2ZfPG	\N
40	Jean	Vasquez	140	jvasquez13@bbc.co.uk	nAXHGEpqPJ	\N
41	Linda	Freeman	141	lfreeman14@sohu.com	PFIhsA	\N
42	Nancy	Howard	142	nhoward15@flavors.me	oLtntY	\N
43	Lawrence	Hawkins	143	lhawkins16@kickstarter.com	PyzR7A8y9W	\N
44	Virginia	Larson	144	vlarson17@berkeley.edu	qPFdell9	\N
45	Gary	Banks	145	gbanks18@intel.com	ylB7KOXwEs	\N
46	Jimmy	Warren	146	jwarren19@yellowpages.com	IQf8tt	\N
47	Terry	Burns	147	tburns1a@paypal.com	RvKHGvz	\N
48	Kevin	Palmer	148	kpalmer1b@163.com	mIcGJSM7c	\N
49	Sean	Hansen	149	shansen1c@reddit.com	uFOuGS	\N
50	Nancy	Moreno	150	nmoreno1d@dedecms.com	FbSgUyM6Rq	\N
51	Edward	Lee	151	elee1e@about.com	zQtijO	\N
52	Jeremy	Dixon	152	jdixon1f@skype.com	uDWy1DhaQs	\N
53	Cheryl	Martinez	153	cmartinez1g@unblog.fr	SmUDITfF	\N
54	Carlos	Hudson	154	chudson1h@acquirethisname.com	CidV6q11vn	\N
55	Christopher	Kim	155	ckim1i@slashdot.org	BzFhPbEm	\N
56	Martha	Patterson	156	mpatterson1j@nhs.uk	4QgNALX15	\N
57	John	Chapman	157	jchapman1k@merriam-webster.com	QS0x2d	\N
58	Bobby	Carroll	158	bcarroll1l@squidoo.com	b9wzVq0daKw	\N
59	Janice	Rogers	159	jrogers1m@booking.com	ja1YHyJ	\N
60	Thomas	Gardner	160	tgardner1n@wikipedia.org	vNKBySlX	\N
61	Tammy	Armstrong	161	tarmstrong1o@rambler.ru	Aawvyk	\N
62	Henry	Oliver	162	holiver1p@va.gov	WQDat21tC0x9	\N
63	Lillian	Garza	163	lgarza1q@arstechnica.com	PPdkdzL6	\N
64	Ruby	Banks	164	rbanks1r@themeforest.net	wgjLu8	\N
65	Jessica	Griffin	165	jgriffin1s@house.gov	fhp0AgsSZ	\N
66	Benjamin	Garza	166	bgarza1t@unc.edu	JfqCwJ	\N
67	Eugene	Miller	167	emiller1u@studiopress.com	gYaVJSctm75l	\N
68	Kathryn	Phillips	168	kphillips1v@google.nl	GpAl2I3XfX	\N
69	Sharon	Nelson	169	snelson1w@blogtalkradio.com	ScMKPIvIqJK	\N
70	Ryan	Wagner	170	rwagner1x@live.com	bEOVCprhvFu	\N
71	Philip	Olson	171	polson1y@stumbleupon.com	zVG36rdu	\N
72	Maria	Hayes	172	mhayes1z@nifty.com	4kAyrEt2eNmZ	\N
73	Patrick	Hernandez	173	phernandez20@tripod.com	F4j9aQxiO4f	\N
74	David	Campbell	174	dcampbell21@bluehost.com	GBSbMy	\N
75	Diane	Walker	175	dwalker22@wikispaces.com	wj5gq7A13LE	\N
76	Donald	Bell	176	dbell23@issuu.com	imivPsniHxz	\N
77	Russell	Garrett	177	rgarrett24@sbwire.com	zgwmkjeKTO	\N
78	Mary	Harris	178	mharris25@disqus.com	tja2BBQ	\N
79	Bonnie	Hernandez	179	bhernandez26@walmart.com	7BEKmH	\N
80	Paul	Stone	180	pstone27@va.gov	AQgV8l8EqHN	\N
81	Jason	Bowman	181	jbowman28@techcrunch.com	L5IFfvTLWnD	\N
82	Howard	Dixon	182	hdixon29@howstuffworks.com	p2WnkER3d	\N
83	Kelly	Johnson	183	kjohnson2a@indiegogo.com	ZntUK6	\N
84	Nicholas	Lewis	184	nlewis2b@timesonline.co.uk	AoJHxMQDzzyC	\N
85	Andrea	Patterson	185	apatterson2c@yelp.com	MF5yZ2FF	\N
86	Scott	Owens	186	sowens2d@oracle.com	Ad5Gw6605sR	\N
87	Samuel	Hughes	187	shughes2e@multiply.com	CtQvLw8l	\N
88	Brandon	Fields	188	bfields2f@sbwire.com	ke6j7qXtu	\N
89	Julia	Bowman	189	jbowman2g@imgur.com	E9zYuU3	\N
90	Wanda	Lawson	190	wlawson2h@accuweather.com	zwdjx2hED	\N
91	Fred	Gardner	191	fgardner2i@youtube.com	OsHLOOmQXvW	\N
92	Aaron	Harvey	192	aharvey2j@hostgator.com	zq4T3Yqr	\N
93	Maria	Jordan	193	mjordan2k@linkedin.com	T7TNuP8DPg	\N
94	Catherine	Moore	194	cmoore2l@berkeley.edu	VetYM9YEmyMF	\N
95	Katherine	Bell	195	kbell2m@blogger.com	yM8DKDVN44z	\N
96	Peter	Torres	196	ptorres2n@usnews.com	NcDHZXvARZ	\N
97	Lawrence	Lawson	197	llawson2o@disqus.com	NJ2ThUi7WE	\N
98	Judith	Frazier	198	jfrazier2p@cisco.com	uzUsOktQWta7	\N
99	Jean	Oliver	199	joliver2q@infoseek.co.jp	SwsZk1fiPIqF	\N
100	Thomas	Martinez	200	tmartinez2r@businesswire.com	rOW32lyyuk7o	\N
101	Tammy	Oliver	201	toliver2s@exblog.jp	7GWVDm	\N
102	Paul	Murray	202	pmurray2t@icio.us	9SsaIvxuhr	\N
103	Elizabeth	Gray	203	egray2u@meetup.com	e7cZvJ	\N
104	Harry	Allen	26	hallen2v@wp.com	XT2pTxCSbjk	\N
105	Martha	Parker	204	mparker2w@smugmug.com	ZuAkzNt	\N
106	Aaron	Bennett	205	abennett2x@ed.gov	wgLSiFsbg	\N
107	David	Woods	206	dwoods2y@t.co	UZYpAt9pUuj	\N
108	Joan	Howell	207	jhowell2z@economist.com	xZddG7FuD	\N
109	Johnny	Fernandez	208	jfernandez30@ebay.co.uk	xsNIlj	\N
110	Ernest	Coleman	209	ecoleman31@ucsd.edu	S8r83hZ4c9	\N
111	Sara	Walker	210	swalker32@ucoz.ru	oJcLTf	\N
112	Paula	Stewart	211	pstewart33@123-reg.co.uk	E3DbdQrDr	\N
113	Debra	Snyder	212	dsnyder34@google.it	uEfkK9xQVW3	\N
114	Justin	Bowman	213	jbowman35@upenn.edu	vjitdGI	\N
115	Anna	Hansen	214	ahansen36@mozilla.org	bD43ehv	\N
116	Kenneth	Lewis	215	klewis37@sogou.com	5gfUZXvwqUUf	\N
117	Albert	Lawrence	216	alawrence38@ovh.net	mBAx78t	\N
118	Denise	Jackson	217	djackson39@dedecms.com	NwJKBr	\N
119	Roy	Porter	218	rporter3a@tinypic.com	Py0l3ZO	\N
120	Randy	Washington	219	rwashington3b@loc.gov	8RDMHWM6Ug	\N
121	Martin	Oliver	220	moliver3c@ustream.tv	wvRJm23Kl8f	\N
122	Catherine	Wheeler	221	cwheeler3d@netlog.com	HrvscqudPS6	\N
123	Deborah	Collins	222	dcollins3e@shinystat.com	f563v6jxmyQ	\N
124	Lillian	Austin	223	laustin3f@webnode.com	ck2FNpwn4cd	\N
125	Melissa	Burke	224	mburke3g@upenn.edu	vBcPwiY9oeI	\N
126	Susan	Harris	225	sharris3h@de.vu	FiPzbtL	\N
127	Jacqueline	Crawford	226	jcrawford3i@slideshare.net	bZq2ySPV	\N
128	Randy	Stone	227	rstone3j@weather.com	ooUR3Wb0T3	\N
129	Craig	Oliver	228	coliver3k@npr.org	ZluAnm6Bh7	\N
130	Christopher	Hunter	229	chunter3l@engadget.com	tHIYlH6jKM	\N
131	Joyce	Warren	230	jwarren3m@buzzfeed.com	1AN6Hh0	\N
132	Chris	Black	231	cblack3n@cnbc.com	MV3PeTBUq4	\N
133	Gary	Perkins	232	gperkins3o@amazon.com	FsKWKSnmmt	\N
134	Cheryl	Murray	233	cmurray3p@narod.ru	NWbFmVeLO	\N
135	Steven	Lewis	234	slewis3q@de.vu	WNFTOhT	\N
136	Eugene	Rivera	235	erivera3r@uol.com.br	ThUe093IFHqA	\N
137	Keith	Gibson	236	kgibson3s@yahoo.com	qY87c6	\N
138	Raymond	Stephens	237	rstephens3t@typepad.com	C6edf5	\N
139	Brandon	Howell	238	bhowell3u@merriam-webster.com	Ea55SMUtgD	\N
140	Janice	Kim	239	jkim3v@whitehouse.gov	2ynjhhFd	\N
141	Terry	Kennedy	240	tkennedy3w@examiner.com	ePkXnV8QB	\N
142	Lisa	Kelley	241	lkelley3x@wiley.com	B5BcWqptlBU5	\N
143	Steven	Hudson	242	shudson3y@geocities.jp	X8NeuvT	\N
144	Adam	Wright	243	awright3z@google.com	HdyjM2BA	\N
145	Benjamin	Jenkins	244	bjenkins40@disqus.com	0UnJ3IJ8y	\N
146	Martha	Rice	245	mrice41@go.com	KImDaafyiVCd	\N
147	Anne	Hall	246	ahall42@quantcast.com	dW18jpn8dlI	\N
148	Stephanie	Gutierrez	247	sgutierrez43@mozilla.org	VG4lfI5V	\N
149	Bruce	Duncan	248	bduncan44@baidu.com	6ngIkz7	\N
150	Sarah	Ross	249	sross45@uiuc.edu	rfyvwXzVmg	\N
151	Brenda	Elliott	250	belliott46@nps.gov	0Oile5R	\N
152	Donna	Shaw	251	dshaw47@dagondesign.com	SK7JsuOUDKe6	\N
153	Fred	Rogers	252	frogers48@wix.com	xONi3TolzXue	\N
154	Keith	Jenkins	253	kjenkins49@reverbnation.com	6Ze17Z	\N
155	Gloria	Wallace	254	gwallace4a@geocities.jp	1T813O	\N
156	Jeffrey	Phillips	255	jphillips4b@dmoz.org	rS0zOZ	\N
157	Jeffrey	White	256	jwhite4c@yellowpages.com	0vyzUcu	\N
158	Rachel	Gomez	257	rgomez4d@hibu.com	dgkyI2	\N
159	Gloria	Perkins	258	gperkins4e@ask.com	5q26RIcvvB	\N
160	Rebecca	Torres	259	rtorres4f@newsvine.com	LqNYMqiI	\N
161	Dennis	Hudson	260	dhudson4g@is.gd	4XRFM9KaCmw	\N
162	Gary	Wallace	261	gwallace4h@etsy.com	k2PDNj0Gf7u7	\N
163	Rachel	Ramirez	262	rramirez4i@zdnet.com	yrQYXvtURf2	\N
164	Carol	Hill	110	chill4j@pcworld.com	yFUf27	\N
165	Sharon	Henry	263	shenry4k@friendfeed.com	8uP4emVwME	\N
166	Alice	Freeman	264	afreeman4l@nih.gov	GobVWoe4	\N
167	Jennifer	Moreno	265	jmoreno4m@soundcloud.com	2LFkRNddQ	\N
168	Jason	Reed	266	jreed4n@twitter.com	BJlISn57mmN7	\N
169	Martha	Johnston	267	mjohnston4o@twitter.com	hIGnc6Xmc	\N
170	Arthur	Ferguson	268	aferguson4p@auda.org.au	1YGS4d8A5jx	\N
171	George	Alexander	269	galexander4q@independent.co.uk	R7q9JgbZWw	\N
172	Todd	Murphy	270	tmurphy4r@wordpress.com	PH312E	\N
173	Billy	Ford	271	bford4s@seesaa.net	AkOoy0xGt3wa	\N
174	Christopher	Armstrong	272	carmstrong4t@usatoday.com	lktcOa	\N
175	Beverly	Hamilton	273	bhamilton4u@census.gov	gog8NftMIpVc	\N
176	Brian	Hansen	274	bhansen4v@cornell.edu	i1ZKC7iVcE	\N
177	Russell	Harvey	275	rharvey4w@fastcompany.com	26As18fgV6	\N
178	Judy	Murray	276	jmurray4x@army.mil	XGMnrPf33KR	\N
179	Paula	Simmons	277	psimmons4y@addtoany.com	wNIvCz	\N
180	Elizabeth	Foster	278	efoster4z@fastcompany.com	5jHpM3NCERx	\N
181	Phyllis	Armstrong	279	parmstrong50@oaic.gov.au	CcIvEZ6fQoE	\N
182	Ernest	Henderson	280	ehenderson51@moonfruit.com	YHxW8EPEXTV	\N
183	Sean	Carpenter	281	scarpenter52@ycombinator.com	g5dAARBkEGc	\N
184	Douglas	Brown	282	dbrown53@who.int	wcVfU7Rq	\N
185	Tammy	Morales	283	tmorales54@163.com	uNDjuAG6b5Vp	\N
186	Nancy	Holmes	284	nholmes55@diigo.com	HWDpOsglKIX8	\N
187	Joe	Ward	285	jward56@digg.com	OaZGPu	\N
188	Jesse	Fernandez	286	jfernandez57@phoca.cz	t9cMr5HALz	\N
189	Henry	Ray	154	hray58@uiuc.edu	s3nmaZth	\N
190	Willie	Burton	287	wburton59@oakley.com	Ym2CItOv	\N
191	Christopher	Vasquez	288	cvasquez5a@chronoengine.com	miR9D51	\N
192	Todd	Day	289	tday5b@apple.com	N3Sd5M95bcDh	\N
193	Russell	Stone	290	rstone5c@wunderground.com	FKzE5aP3f	\N
194	Diana	Ryan	291	dryan5d@sitemeter.com	d9hTgHSIa	\N
195	Deborah	Mason	292	dmason5e@flickr.com	ZTrBTbG	\N
196	Ryan	Fowler	293	rfowler5f@hugedomains.com	qJL7uaW3G	\N
197	Joseph	Arnold	294	jarnold5g@newsvine.com	bwn2qt3T	\N
198	Brenda	Edwards	295	bedwards5h@bluehost.com	CCfJCyJEhG	\N
199	Julie	Meyer	296	jmeyer5i@discuz.net	bf6m6j	\N
200	Matthew	Ryan	297	mryan5j@g.co	5u56ZJg	\N
201	Jennifer	Collins	298	jcollins5k@google.co.uk	ugY48ReRJO	\N
202	Arthur	Lawrence	299	alawrence5l@ezinearticles.com	lyj9ZrPr8A	\N
203	Donald	Roberts	300	droberts5m@bloglines.com	arjbsz4rizBb	\N
204	Carol	Bryant	301	cbryant5n@dmoz.org	r5MJ1g7hOzGE	\N
205	Irene	Rice	302	irice5o@4shared.com	WX3Ka44	\N
206	Albert	Bradley	303	abradley5p@mashable.com	guNRsVnR	\N
207	Richard	Grant	304	rgrant5q@usatoday.com	kiGn1uv51S9	\N
208	Andrew	Murphy	305	amurphy5r@thetimes.co.uk	gk9ZWFnGCTEp	\N
209	Steven	Cole	306	scole5s@gov.uk	88DAcBg	\N
210	Jacqueline	Henderson	307	jhenderson5t@plala.or.jp	OeyCuil	\N
211	Aaron	Simmons	308	asimmons5u@mediafire.com	mF8Y0iU7R	\N
212	Gregory	Franklin	309	gfranklin5v@skyrock.com	nbVWnoY	\N
213	Keith	Watson	310	kwatson5w@irs.gov	h7ItvUh	\N
214	Martin	Holmes	311	mholmes5x@timesonline.co.uk	MyWuHWkNDBy	\N
215	Pamela	Wood	312	pwood5y@state.tx.us	tGnnIT375	\N
216	Joan	Sanchez	313	jsanchez5z@yelp.com	2K7PQifcczw	\N
217	Gregory	Ramos	314	gramos60@eepurl.com	ZERDLU	\N
218	Cynthia	Frazier	315	cfrazier61@chicagotribune.com	AMRHNjjC0xC	\N
219	Julia	Holmes	316	jholmes62@vistaprint.com	t4elKROl	\N
220	John	Harris	72	jharris63@blogspot.com	nPWVUK4agI6	\N
221	Judith	Wells	317	jwells64@noaa.gov	B6uqyRNAW	\N
222	Judy	Mcdonald	318	jmcdonald65@bandcamp.com	Fpb1w8	\N
223	Dennis	Wells	319	dwells66@opensource.org	OmSip1T3N	\N
224	Ralph	Hall	320	rhall67@slideshare.net	3e7w6ZYK9	\N
225	William	Burton	321	wburton68@facebook.com	LoDG8e	\N
226	Kenneth	Rogers	322	krogers69@plala.or.jp	Io0lTt	\N
227	Evelyn	Knight	323	eknight6a@ted.com	amM0Hacv	\N
228	Kimberly	Howard	324	khoward6b@zdnet.com	HaUhx1	\N
229	Walter	Andrews	325	wandrews6c@rambler.ru	WEIh48	\N
230	Kenneth	Rose	326	krose6d@digg.com	8YQevfkVikiF	\N
231	Amanda	Walker	327	awalker6e@marriott.com	9jHAT55AHzWn	\N
232	Jean	Ryan	328	jryan6f@hostgator.com	JoIIoLJ89	\N
233	Shirley	Diaz	329	sdiaz6g@hostgator.com	rVeC934bXB	\N
234	Judy	Gilbert	330	jgilbert6h@blogs.com	AXbQM6vq6liT	\N
235	Martin	Powell	331	mpowell6i@prweb.com	MlSJgJ	\N
236	Julie	Howell	332	jhowell6j@cpanel.net	a4YfXIlQor	\N
237	Anna	Woods	333	awoods6k@pen.io	avJW5vQK51k0	\N
238	Steven	Smith	334	ssmith6l@sogou.com	DSNTxtMDW	\N
239	Dennis	Reynolds	335	dreynolds6m@java.com	g7ekY5	\N
240	Jennifer	Butler	336	jbutler6n@imgur.com	74jaSou	\N
241	Janet	Walker	337	jwalker6o@unesco.org	vhFWIk2I3Cf	\N
242	Brenda	Fields	338	bfields6p@buzzfeed.com	PvPNuikYV8	\N
243	Jesse	Hanson	339	jhanson6q@domainmarket.com	VejJJdZ	\N
244	Catherine	George	340	cgeorge6r@huffingtonpost.com	KSNRKaU	\N
245	Shawn	Stephens	341	sstephens6s@scientificamerican.com	RibJF2fQ	\N
246	Dennis	Stephens	342	dstephens6t@china.com.cn	1waykeL9	\N
247	Patrick	Duncan	343	pduncan6u@census.gov	8LHMyLS8xPIV	\N
248	Kenneth	Ramirez	344	kramirez6v@seesaa.net	crkGeM4J	\N
249	Jonathan	Torres	345	jtorres6w@wp.com	HmrSOoZd	\N
250	Antonio	Little	346	alittle6x@google.es	FyUD7b	\N
251	Beverly	Reynolds	347	breynolds6y@mapquest.com	eT8lghQZMP1	\N
252	Ernest	Wallace	348	ewallace6z@rediff.com	Iy3GskGbO	\N
253	Janet	Garcia	349	jgarcia70@vimeo.com	u8R0q41NPPI	\N
254	Aaron	Gordon	350	agordon71@craigslist.org	fQKEd9EIyF	\N
255	Jeffrey	Mcdonald	351	jmcdonald72@telegraph.co.uk	D9d4jrDV5YqX	\N
256	Roger	Gibson	352	rgibson73@statcounter.com	2SrGtDxs	\N
257	Albert	Stanley	353	astanley74@apple.com	t4j4qVEy0Rk	\N
258	Jeremy	Snyder	354	jsnyder75@mlb.com	yWafb6KHg	\N
259	Lori	Shaw	355	lshaw76@freewebs.com	Tc7hMkJJ	\N
260	Bruce	Brooks	356	bbrooks77@weather.com	rSWsAbjflS8	\N
261	Frank	Wallace	357	fwallace78@alexa.com	3tDMMj85xG	\N
262	Albert	Allen	358	aallen79@vinaora.com	r01rKTUr0	\N
263	Larry	Grant	359	lgrant7a@un.org	vsSHpneGE	\N
264	Kathryn	Olson	360	kolson7b@prweb.com	7jyUKtGAbh8	\N
265	Gregory	Murphy	361	gmurphy7c@forbes.com	sgd5Bvo2vDQp	\N
266	Jesse	Wells	362	jwells7d@sciencedirect.com	hcgSj9q	\N
267	Patrick	Owens	363	powens7e@cdbaby.com	yrQ3eviw1MfE	\N
268	Jason	Allen	364	jallen7f@t.co	rhaEWie4w	\N
269	Amy	Wheeler	365	awheeler7g@admin.ch	AZc98HI8XJYt	\N
270	Mildred	Davis	366	mdavis7h@123-reg.co.uk	ZulRahB	\N
271	Amanda	Martin	367	amartin7i@xrea.com	4vj5Ma	\N
272	Peter	Burke	193	pburke7j@dell.com	UlwlN9TGDR	\N
273	Helen	Brown	368	hbrown7k@blogspot.com	DdnJIY	\N
274	Lillian	Chapman	369	lchapman7l@amazon.co.jp	Bc5FGrW6	\N
275	Kathryn	Reid	370	kreid7m@weibo.com	6aW5ZnGG	\N
276	Joyce	Palmer	371	jpalmer7n@wikipedia.org	TnGOzU	\N
277	Kathleen	Ortiz	372	kortiz7o@latimes.com	Dfk6bbkOhn	\N
278	Rebecca	Johnson	373	rjohnson7p@upenn.edu	uQtGs6WMgPx	\N
279	Lisa	Perkins	374	lperkins7q@comsenz.com	MToVxM1mCg3v	\N
280	Thomas	Wright	375	twright7r@mashable.com	3uR3zP	\N
281	Bobby	Stephens	376	bstephens7s@theatlantic.com	p4iFG5	\N
282	Louise	Ramirez	377	lramirez7t@paypal.com	pGi0Rc	\N
283	Philip	Foster	378	pfoster7u@imdb.com	HaUYknW	\N
284	Janet	Evans	379	jevans7v@yahoo.com	yoDieU	\N
285	Judy	Ortiz	380	jortiz7w@nymag.com	B0oHL61pMG9	\N
286	Philip	Frazier	381	pfrazier7x@amazonaws.com	lmO659b3GK	\N
287	Kathryn	Gray	382	kgray7y@1und1.de	YNcyr6	\N
288	Bonnie	Snyder	383	bsnyder7z@mlb.com	BbV04qkp0	\N
289	Fred	Mccoy	384	fmccoy80@forbes.com	4QtrFB	\N
290	Angela	Rivera	385	arivera81@amazonaws.com	0M3e6EP9GS	\N
291	Frank	Fisher	386	ffisher82@dropbox.com	bX1d04RiPlj	\N
292	Jean	Williamson	387	jwilliamson83@artisteer.com	ziZon3pp	\N
293	Anna	Hunter	388	ahunter84@army.mil	qDfkWTH2faN	\N
294	Ronald	Turner	389	rturner85@etsy.com	vvbndeFJB1	\N
295	Patricia	Dunn	390	pdunn86@elegantthemes.com	1gMSpBPJpn	\N
296	Willie	Morgan	391	wmorgan87@behance.net	IzsIjuQOH	\N
297	Rachel	Simpson	392	rsimpson88@miibeian.gov.cn	VKOiHuLh6	\N
298	Benjamin	Ramos	393	bramos89@sciencedirect.com	5yW4yleAO	\N
299	Betty	Moreno	394	bmoreno8a@cdc.gov	qozuIazKuQ	\N
300	Sandra	Graham	395	sgraham8b@stumbleupon.com	yTuOigDgNdN	\N
301	Ronald	Rodriguez	376	rrodriguez8c@tripod.com	z7xAYQv	\N
302	Emily	Woods	396	ewoods8d@senate.gov	rLJFlMoO8Ms	\N
303	Janet	Arnold	397	jarnold8e@cyberchimps.com	uh5m2rkeEmK	\N
304	Brenda	Black	398	bblack8f@sbwire.com	wsbD7u6	\N
305	Walter	Hill	399	whill8g@upenn.edu	hh0eYVx1YtO	\N
306	Walter	Hudson	400	whudson8h@1688.com	YmIC7yikfQ	\N
307	Julia	Wells	401	jwells8i@un.org	DaeDNI6ba	\N
308	Paula	Porter	402	pporter8j@dion.ne.jp	T4eCGNYpuV	\N
309	Christine	Hansen	403	chansen8k@ox.ac.uk	i4P1vYeElPf	\N
310	Jerry	Reid	404	jreid8l@chronoengine.com	ad44YQnWNo	\N
311	Charles	Franklin	405	cfranklin8m@ucoz.com	3vLMOYxkrv	\N
312	Louise	King	406	lking8n@phoca.cz	tSpg0CwoTObx	\N
313	Frances	Chapman	407	fchapman8o@prnewswire.com	e8Dtgq	\N
314	Jessica	Daniels	408	jdaniels8p@linkedin.com	eIoX5fcHVrJI	\N
315	Ruby	Williams	409	rwilliams8q@omniture.com	hjt0pKOC9ocG	\N
316	Helen	Bishop	410	hbishop8r@live.com	IPt8ne57	\N
317	Andrea	Gordon	411	agordon8s@ca.gov	N2uPbLR651yf	\N
318	Howard	Hall	412	hhall8t@t-online.de	vVFOegpJTy	\N
319	Donna	Ryan	413	dryan8u@twitpic.com	brjeYsos6F2	\N
320	Brian	Carroll	414	bcarroll8v@ucsd.edu	pzSu65P7	\N
321	Robert	Duncan	3	rduncan8w@linkedin.com	KZbQaC0Ex	\N
322	Amy	Harrison	415	aharrison8x@auda.org.au	qtmX4VEepMR	\N
323	Sharon	Reynolds	416	sreynolds8y@npr.org	8ITR6B4iVAl	\N
324	Randy	Daniels	417	rdaniels8z@webs.com	8THCcJVCcWHF	\N
325	Johnny	Armstrong	418	jarmstrong90@a8.net	PF0gWuErE2	\N
326	Brenda	Nelson	419	bnelson91@cnbc.com	pmBmHJMkLT	\N
327	Kathryn	Edwards	420	kedwards92@bigcartel.com	llai0PMN	\N
328	Raymond	Hunter	421	rhunter93@dailymotion.com	bL039A	\N
329	Christina	Rose	422	crose94@census.gov	TwlFeB	\N
330	Joan	Campbell	423	jcampbell95@discovery.com	YSVM7l7h4	\N
331	Virginia	Rice	424	vrice96@pcworld.com	OpXlqX	\N
332	Patrick	Frazier	425	pfrazier97@chicagotribune.com	IuI89WWn7	\N
333	Henry	Bell	426	hbell98@flavors.me	xgAMnazgl	\N
334	Sean	Palmer	427	spalmer99@liveinternet.ru	SLgQKHk	\N
335	Joyce	Duncan	428	jduncan9a@taobao.com	yPMA16	\N
336	Donna	Ward	429	dward9b@usnews.com	v3F3uAu	\N
337	Benjamin	Johnston	430	bjohnston9c@barnesandnoble.com	13ICfG491	\N
338	Judy	Ryan	431	jryan9d@geocities.jp	SsJzLF	\N
339	Adam	Weaver	432	aweaver9e@histats.com	mqYOhAGbpNy	\N
340	William	Gray	433	wgray9f@huffingtonpost.com	G9lgTG6b0h	\N
341	Andrea	Evans	434	aevans9g@examiner.com	uVZ9ioW53HGa	\N
342	Ralph	Carr	435	rcarr9h@cam.ac.uk	J7lUUyn	\N
343	Denise	Holmes	436	dholmes9i@scribd.com	0IZwIjGNcg	\N
344	Nicholas	Griffin	437	ngriffin9j@ox.ac.uk	kzRVF0oR	\N
345	Frances	Harper	438	fharper9k@forbes.com	Gh1fTv	\N
346	Bobby	Lynch	439	blynch9l@multiply.com	pFrnh6mloGgk	\N
347	Emily	Patterson	440	epatterson9m@unesco.org	1GH1TcRCDRM	\N
348	Jeremy	Warren	441	jwarren9n@skyrock.com	fsv5dk991a	\N
349	Gregory	Stanley	442	gstanley9o@springer.com	sPmrp6UB	\N
350	Emily	Mason	443	emason9p@cloudflare.com	EKT37kCcR	\N
351	Donald	Bell	444	dbell9q@wunderground.com	X7EqIMa	\N
352	Tina	Garcia	445	tgarcia9r@jalbum.net	uivDCAOM	\N
353	Ruby	Dunn	446	rdunn9s@comsenz.com	DTvLZw	\N
354	Michelle	Lee	447	mlee9t@irs.gov	51Iloyarx	\N
355	Dennis	Gonzalez	448	dgonzalez9u@ezinearticles.com	N0NFYmI9ws1	\N
356	Rose	Wright	449	rwright9v@macromedia.com	ON0xkRZ	\N
357	Maria	George	450	mgeorge9w@cdc.gov	jtDwMyD	\N
358	Beverly	Simpson	451	bsimpson9x@istockphoto.com	o67CoUAv	\N
359	Brandon	Wagner	452	bwagner9y@ask.com	cgR3b4	\N
360	Billy	Gibson	453	bgibson9z@uol.com.br	Rv9eeK4Y	\N
361	Ruby	Edwards	395	redwardsa0@storify.com	43kF9BmN	\N
362	Amanda	Webb	454	awebba1@prnewswire.com	kPabaXZk	\N
363	Phillip	Porter	178	pportera2@51.la	XKdX2Qxn	\N
364	Wanda	Crawford	455	wcrawforda3@hao123.com	KSzVV9t	\N
365	Ralph	Reid	456	rreida4@bbc.co.uk	4Ufti9	\N
366	Todd	Hall	457	thalla5@ebay.com	WTQHgpgNSm33	\N
367	Jeremy	Brown	458	jbrowna6@taobao.com	N5wywf	\N
368	Norma	Rivera	459	nriveraa7@mail.ru	jBYFpPZNWHU	\N
369	Helen	Kelley	460	hkelleya8@zimbio.com	u8r9mAjrwA	\N
370	Harry	Ray	461	hraya9@dion.ne.jp	7KbbMIr	\N
371	Jean	Simmons	462	jsimmonsaa@issuu.com	4Gp7DX	\N
372	Lois	Franklin	198	lfranklinab@hibu.com	Bq0xLhm	\N
373	Denise	Diaz	463	ddiazac@desdev.cn	Bk9M36L	\N
374	Tina	Snyder	464	tsnyderad@imgur.com	nOG12j7cRYM	\N
375	Phyllis	Nelson	465	pnelsonae@quantcast.com	q7lwHEGHV0	\N
376	Craig	Sims	466	csimsaf@hexun.com	l1GFhVfywy7	\N
377	Anthony	Wallace	467	awallaceag@storify.com	YwStibC	\N
378	Earl	Powell	468	epowellah@godaddy.com	HVhDTv9itU	\N
379	Shirley	Fisher	469	sfisherai@youku.com	sOPa6OR9bM	\N
380	Kathryn	Jordan	470	kjordanaj@hc360.com	kbzAglX	\N
381	Jeffrey	Cunningham	471	jcunninghamak@google.co.jp	uI5PbVbRVR	\N
382	Jean	Bradley	472	jbradleyal@foxnews.com	lxCZ8de	\N
383	Terry	Nelson	473	tnelsonam@slideshare.net	wXylCbAdS	\N
384	Diana	Allen	474	dallenan@jigsy.com	LVo37hXa	\N
385	Charles	Anderson	475	candersonao@bbc.co.uk	p7F0hPj	\N
386	Jonathan	Gutierrez	476	jgutierrezap@cnn.com	d76gwjZG4Z	\N
387	Benjamin	Edwards	477	bedwardsaq@dmoz.org	Fig5aLzNG	\N
388	Judy	Henderson	478	jhendersonar@wired.com	YCMjqggxoemN	\N
389	Christine	Griffin	479	cgriffinas@myspace.com	ptgzL1YA4p	\N
390	Clarence	Martin	480	cmartinat@dell.com	dkGQC58jflZ5	\N
391	Evelyn	Harrison	481	eharrisonau@berkeley.edu	yHqcmslQuaJ	\N
392	William	Ford	482	wfordav@typepad.com	c9DNKNsqGJRW	\N
393	Victor	Davis	483	vdavisaw@dropbox.com	X0YzMiwFLcc	\N
394	Andrew	Elliott	484	aelliottax@odnoklassniki.ru	fBabhx9sv2	\N
395	Katherine	Young	485	kyoungay@huffingtonpost.com	CiT4vX	\N
396	Scott	Collins	486	scollinsaz@newsvine.com	2NtuUlwS8r	\N
397	Jerry	Peters	487	jpetersb0@yelp.com	Xcbuxp90sV	\N
398	Frank	Cruz	488	fcruzb1@digg.com	UFFh6tZwR	\N
399	Alan	Hicks	489	ahicksb2@hao123.com	5HBT8lYi3nO8	\N
400	Kelly	Greene	490	kgreeneb3@chron.com	8RKEF7MSBM	\N
401	Howard	Simpson	491	hsimpsonb4@spiegel.de	wLrnTEX	\N
402	Catherine	Porter	492	cporterb5@japanpost.jp	apMeB8	\N
403	Michelle	Lawrence	493	mlawrenceb6@craigslist.org	26qBtt	\N
404	Beverly	Nichols	494	bnicholsb7@odnoklassniki.ru	Uh6qrEi	\N
405	Helen	Lopez	370	hlopezb8@bbb.org	QcYzncGG	\N
406	Deborah	Gordon	495	dgordonb9@amazon.de	PrKmnkM	\N
407	Albert	Hart	496	ahartba@slideshare.net	N4SN2s9VErtQ	\N
408	Edward	Bishop	27	ebishopbb@ebay.com	K9GiKTYKvz6	\N
409	Joseph	Adams	497	jadamsbc@alibaba.com	EFjAadV	\N
410	Amy	Peterson	498	apetersonbd@miitbeian.gov.cn	gG7q2vb1LQX	\N
411	Marie	King	499	mkingbe@seattletimes.com	zmrXp9	\N
412	Laura	Cunningham	500	lcunninghambf@noaa.gov	PccCXLgA	\N
413	Helen	Kelly	501	hkellybg@bigcartel.com	M7aj49	\N
414	Joe	Ward	502	jwardbh@reverbnation.com	B34yJton	\N
415	Deborah	Scott	503	dscottbi@amazon.co.uk	rC2St84G	\N
416	Steve	Anderson	504	sandersonbj@prweb.com	qGXlt9sjy5O	\N
417	Bruce	Thompson	505	bthompsonbk@webmd.com	ch7WI5LcpSY	\N
418	Wayne	Willis	506	wwillisbl@shop-pro.jp	PeYe6xf7	\N
419	Steve	Mendoza	507	smendozabm@prweb.com	FBVOKPeFCSS	\N
420	Jane	Lawrence	508	jlawrencebn@slideshare.net	ZbcFlf6lfkVf	\N
421	Kenneth	Banks	509	kbanksbo@ameblo.jp	P6ZfA90aj9q5	\N
422	Phyllis	Sullivan	510	psullivanbp@tamu.edu	D676bS	\N
423	Evelyn	Thompson	511	ethompsonbq@economist.com	fO5Cfl3J	\N
424	Mildred	Carr	512	mcarrbr@weibo.com	dYcOaa0J9R	\N
425	John	Owens	513	jowensbs@friendfeed.com	tc141QfddynJ	\N
426	Johnny	Carter	514	jcarterbt@alibaba.com	WHLdz6TTc3lW	\N
427	Eugene	Stanley	515	estanleybu@joomla.org	oOBHdd0	\N
428	Diana	Cook	516	dcookbv@smugmug.com	7Lr7UUr	\N
429	Russell	Graham	517	rgrahambw@boston.com	0EOLSB4V	\N
430	Tammy	Jacobs	518	tjacobsbx@alexa.com	8BUz9kerBqjQ	\N
431	Frances	Mitchell	243	fmitchellby@nytimes.com	GWUwxANRQ6r	\N
432	Denise	Perry	519	dperrybz@123-reg.co.uk	n4eKho	\N
433	Barbara	Sanders	520	bsandersc0@symantec.com	jjZkpKjqXy	\N
434	Kimberly	Richardson	521	krichardsonc1@lulu.com	DD3gqUIC9zTr	\N
435	John	Owens	522	jowensc2@china.com.cn	8uOHTpz	\N
436	Nicholas	Richardson	523	nrichardsonc3@163.com	UvvxzKtNMQtw	\N
437	Adam	Moreno	524	amorenoc4@opera.com	yTtn6oWCd	\N
438	Maria	Coleman	525	mcolemanc5@nasa.gov	Er2cCTH61	\N
439	Jacqueline	Clark	526	jclarkc6@51.la	PIyhTPnRgEz	\N
440	Angela	Bishop	527	abishopc7@altervista.org	0KqufJ	\N
441	Virginia	Bell	528	vbellc8@amazon.co.jp	QUsdU14	\N
442	Ralph	Baker	356	rbakerc9@blogtalkradio.com	0i6QRRhUik8Q	\N
443	Anna	Cooper	529	acooperca@cornell.edu	yfBMaALVHqq	\N
444	Ruth	Chapman	530	rchapmancb@weibo.com	JpxqZ1KRxOVu	\N
445	Sarah	Riley	531	srileycc@amazonaws.com	YzaVXBXwog	\N
446	Julia	Roberts	532	jrobertscd@state.tx.us	kWyFyz	\N
447	Virginia	Riley	533	vrileyce@sohu.com	JGL6oRvpe	\N
448	Sean	Harvey	534	sharveycf@ustream.tv	xqyHeLWtLm	\N
449	Patricia	Kelley	535	pkelleycg@yahoo.com	ps56owZPkqb	\N
450	Willie	Howard	536	whowardch@flickr.com	TeTTZ93tg	\N
451	Evelyn	Gordon	537	egordonci@youtu.be	Jd0eDsq57	\N
452	Heather	Murray	538	hmurraycj@printfriendly.com	56sBa6atm1wd	\N
453	Alice	White	539	awhiteck@spiegel.de	7DQGxusTavn	\N
454	Rose	Duncan	540	rduncancl@edublogs.org	6VUtWarwa	\N
455	Maria	Harrison	541	mharrisoncm@cloudflare.com	Ne8xGz	\N
456	Benjamin	Myers	542	bmyerscn@about.me	ji2zznGv6S	\N
457	Phillip	Miller	543	pmillerco@google.com.hk	yUGR9v	\N
458	Donald	Welch	544	dwelchcp@last.fm	sJh1Xf	\N
459	David	Ray	545	draycq@phpbb.com	joyrD0	\N
460	James	Davis	546	jdaviscr@sphinn.com	70RYCZw	\N
461	Betty	Morales	547	bmoralescs@altervista.org	2GaF2wN1WLAd	\N
462	Barbara	Woods	548	bwoodsct@blogtalkradio.com	9mQ6RmX5lcv	\N
463	Christopher	Gray	549	cgraycu@ihg.com	9OlXka	\N
464	Janet	Marshall	550	jmarshallcv@wikispaces.com	loeZp8MiWcUb	\N
465	Evelyn	Stanley	551	estanleycw@wix.com	iDzT3Z48q0B	\N
466	Patrick	Russell	552	prussellcx@booking.com	vUpyjkxX	\N
467	Howard	Watson	553	hwatsoncy@tmall.com	tlTZIIfZsqLB	\N
468	Philip	Medina	554	pmedinacz@craigslist.org	UxQI17Osjzt6	\N
469	Ruth	Ross	555	rrossd0@cdc.gov	91DYlX0TQNIV	\N
470	Mary	Dixon	556	mdixond1@rambler.ru	RE3zQT	\N
471	Keith	Welch	557	kwelchd2@hibu.com	48NoDdGog9	\N
472	Marilyn	Simmons	558	msimmonsd3@histats.com	TGrdBI	\N
473	Sara	Burns	559	sburnsd4@jigsy.com	S7oyFKkh5B0R	\N
474	Alice	Olson	560	aolsond5@washingtonpost.com	0GlMQAfruJq	\N
475	Roger	George	561	rgeorged6@hao123.com	iLwFZT4TXA	\N
476	Linda	Stevens	562	lstevensd7@redcross.org	0Bsa3dejBfI	\N
477	Anthony	Allen	563	aallend8@pbs.org	s3EJoYbTv	\N
478	Robert	Ruiz	564	rruizd9@godaddy.com	1DHJUw	\N
479	Wanda	Griffin	565	wgriffinda@cocolog-nifty.com	zzwbtiTmUeL	\N
480	Steven	Berry	566	sberrydb@goo.gl	sJmyqx	\N
481	John	Olson	567	jolsondc@virginia.edu	6ZJqJ9x	\N
482	Sean	Roberts	568	srobertsdd@wiley.com	eQpegFX4aLO	\N
483	Antonio	Henderson	569	ahendersonde@sciencedaily.com	dPUvORrjba	\N
484	Richard	Wheeler	570	rwheelerdf@csmonitor.com	H8v9RAUOxEG	\N
485	Julia	King	571	jkingdg@wp.com	kLVIbB72nWz	\N
486	Sandra	Martinez	572	smartinezdh@nymag.com	ww8RbfB9Ck4z	\N
487	Jessica	Myers	35	jmyersdi@gmpg.org	rHreJB	\N
488	Howard	Webb	573	hwebbdj@archive.org	ommMGAk	\N
489	Deborah	Gonzales	574	dgonzalesdk@fotki.com	Kt8LE2MFra	\N
490	Kenneth	Ferguson	575	kfergusondl@zimbio.com	Wnx2s7XA	\N
491	Joan	Franklin	576	jfranklindm@berkeley.edu	Rsufcnn7ADN1	\N
492	Alice	Sanders	577	asandersdn@behance.net	wfBlZ1	\N
493	Martha	Martinez	578	mmartinezdo@house.gov	q9mbSkBVQ	\N
494	Willie	Brooks	579	wbrooksdp@woothemes.com	Rpw2uHUjJgu	\N
495	Bobby	Stone	580	bstonedq@marriott.com	273MUlHDPoNT	\N
496	Stephanie	Watkins	581	swatkinsdr@fotki.com	bQnbEWyo8mS	\N
497	Tammy	Morrison	582	tmorrisonds@rambler.ru	znbtxUcm1O	\N
498	Brandon	Murphy	583	bmurphydt@wix.com	Kpg5nbT	\N
499	Virginia	Bishop	584	vbishopdu@cocolog-nifty.com	Er3xhfOJ5	\N
500	Scott	Gardner	585	sgardnerdv@joomla.org	yMKiTnfrY	\N
501	Henry	Elliott	586	helliottdw@infoseek.co.jp	3QWIFDly	\N
502	Albert	Kelley	587	akelleydx@blogspot.com	ymrFO5OWipfm	\N
503	Joyce	Webb	588	jwebbdy@accuweather.com	lo2yrB	\N
504	Gerald	Gibson	589	ggibsondz@reuters.com	z0cz12W	\N
505	Walter	Castillo	590	wcastilloe0@dyndns.org	4sayxBA	\N
506	Mary	Hamilton	591	mhamiltone1@intel.com	LJJtQG0	\N
507	George	Gutierrez	592	ggutierreze2@deliciousdays.com	3ufLyMf	\N
508	Lois	Cox	593	lcoxe3@exblog.jp	RfL1kjeX	\N
509	Robin	Porter	594	rportere4@pagesperso-orange.fr	gANgEXcJR	\N
510	Ruth	Mcdonald	595	rmcdonalde5@webs.com	YTJpkfOlG	\N
511	Lois	Lane	596	llanee6@senate.gov	b8LyGck	\N
512	Sean	Griffin	597	sgriffine7@google.es	3fTbAMGao	\N
513	Louise	Wood	598	lwoode8@blog.com	vdfoYC1pa	\N
514	Anthony	Hernandez	599	ahernandeze9@biblegateway.com	FEtFFV	\N
515	Patricia	Stone	600	pstoneea@gravatar.com	vcxMZZM	\N
516	Phillip	Cook	601	pcookeb@bloglovin.com	696Fgr8S97jr	\N
517	Amanda	Ellis	602	aellisec@webnode.com	C3fr4L	\N
518	Alice	Castillo	603	acastilloed@godaddy.com	rEjB4ko9yYqR	\N
519	Denise	Wallace	604	dwallaceee@cornell.edu	nY6hbAr	\N
520	Christina	Hawkins	605	chawkinsef@last.fm	SjVgHoKq54V	\N
521	Philip	Johnston	606	pjohnstoneg@delicious.com	JoR69lrfK	\N
522	Lawrence	Larson	607	llarsoneh@dmoz.org	3CEo6Ski7	\N
523	Marilyn	Cooper	608	mcooperei@scribd.com	JI72Lj8iAzb	\N
524	Nancy	Turner	609	nturnerej@g.co	umPZPkKK	\N
525	Billy	Robertson	610	brobertsonek@theatlantic.com	4ykjUoQpd1Gn	\N
526	Scott	Hicks	611	shicksel@indiatimes.com	U59GGT	\N
527	Keith	Wright	612	kwrightem@seattletimes.com	1ax6p75A	\N
528	Elizabeth	Harrison	613	eharrisonen@list-manage.com	Gn5zD0xJ	\N
529	Peter	Allen	614	palleneo@skype.com	mgfqAaAc9	\N
530	Wanda	Russell	615	wrussellep@cdbaby.com	V6Ip6pw	\N
531	Lillian	Henry	616	lhenryeq@house.gov	q9nIr6PHn	\N
532	Brian	Parker	617	bparkerer@unesco.org	fSUsXK7	\N
533	Amy	Roberts	618	arobertses@people.com.cn	4XhbvrXrgH	\N
534	Heather	Hudson	619	hhudsonet@furl.net	X4FPfOnJ6YN	\N
535	Christopher	Chavez	620	cchavezeu@canalblog.com	ivJBKxxf	\N
536	Keith	Perez	621	kperezev@nature.com	7uQlFGrl1E	\N
537	Christine	Simmons	622	csimmonsew@edublogs.org	rBIcVHzDDi8	\N
538	Evelyn	Garza	623	egarzaex@bbb.org	CNwr2FlIYi	\N
539	Ashley	Hunt	624	ahuntey@free.fr	TnXkEU	\N
540	Gloria	Mitchell	625	gmitchellez@cyberchimps.com	toCeiP6	\N
541	Kathy	Frazier	626	kfrazierf0@virginia.edu	oFG5VFr	\N
542	Todd	Crawford	627	tcrawfordf1@timesonline.co.uk	M6RJe9a	\N
543	Gary	Chapman	628	gchapmanf2@1und1.de	yCgiueW63Gd	\N
544	Michael	Hudson	629	mhudsonf3@forbes.com	qlK723vaEiU	\N
545	Anthony	Miller	630	amillerf4@prnewswire.com	twqzDOAg	\N
546	Christine	Castillo	631	ccastillof5@mozilla.com	UgKcTNQR98	\N
547	Cheryl	Mendoza	632	cmendozaf6@japanpost.jp	xxY0y8AfPu	\N
548	Emily	George	633	egeorgef7@feedburner.com	RFMo13ldkaXG	\N
549	Nancy	Harvey	634	nharveyf8@squarespace.com	u84e5lwkg	\N
550	Jacqueline	Riley	635	jrileyf9@zimbio.com	GrOJNGX	\N
551	Kevin	Johnson	636	kjohnsonfa@indiatimes.com	OT4rvFbMDRP	\N
552	Dennis	Simmons	637	dsimmonsfb@globo.com	L4Jd7jCxgy	\N
553	Dorothy	Lewis	638	dlewisfc@hatena.ne.jp	e075AbZH	\N
554	Brian	Collins	639	bcollinsfd@ameblo.jp	Tn6zuFCgSP	\N
555	Evelyn	Sullivan	640	esullivanfe@narod.ru	pMNpxT	\N
556	Kathleen	Ramos	641	kramosff@cam.ac.uk	RBhHpSyKJtju	\N
557	Chris	Williamson	642	cwilliamsonfg@pagesperso-orange.fr	wiFlhn84Q65	\N
558	Maria	Cruz	643	mcruzfh@360.cn	Z7agVgosld0	\N
559	Kenneth	Turner	644	kturnerfi@mlb.com	Mtpg5Yc	\N
560	Roger	Cooper	645	rcooperfj@geocities.jp	adF825	\N
561	Harry	Moreno	461	hmorenofk@freewebs.com	bCN6wL	\N
562	Judy	Lopez	646	jlopezfl@buzzfeed.com	lh8lf7WJCBjd	\N
563	Justin	Hunt	647	jhuntfm@ucoz.ru	zmaW4XtzSI5l	\N
564	Brandon	Wright	648	bwrightfn@icio.us	t6M7kvXoXw	\N
565	Richard	Lawson	649	rlawsonfo@nih.gov	K76OQrdeRD	\N
566	Katherine	Bradley	650	kbradleyfp@ucla.edu	BhF47ivX7	\N
567	Laura	Freeman	651	lfreemanfq@behance.net	OVKTvQGC4hfk	\N
568	Scott	Howard	652	showardfr@miitbeian.gov.cn	HaK27n6iV	\N
569	Jason	Oliver	653	joliverfs@ow.ly	9Rr3KDrRo	\N
570	Betty	Berry	654	bberryft@wikia.com	CX60op5u	\N
571	Robin	Weaver	655	rweaverfu@facebook.com	uis8oVVDz	\N
572	Kevin	Walker	656	kwalkerfv@dailymail.co.uk	uaErGgh9HSRE	\N
573	Karen	Allen	657	kallenfw@altervista.org	zY6qM17zup2	\N
574	Fred	Weaver	658	fweaverfx@gnu.org	CCRbT1W	\N
575	Kelly	Hansen	659	khansenfy@studiopress.com	ZmVWnnFZs7P	\N
576	Donna	Collins	660	dcollinsfz@topsy.com	Z8K0EMy8K	\N
577	Wanda	Gomez	661	wgomezg0@homestead.com	qnQQ9M	\N
578	James	Cook	662	jcookg1@yelp.com	whuD4c	\N
579	Shirley	Robertson	663	srobertsong2@gmpg.org	0CP5xeb9Nhs8	\N
580	Henry	Vasquez	664	hvasquezg3@unesco.org	6IHbTP	\N
581	Kevin	Brooks	665	kbrooksg4@drupal.org	SJok9K4	\N
582	Robert	Dixon	666	rdixong5@blogs.com	Gke8TzF	\N
583	Johnny	Nichols	667	jnicholsg6@fema.gov	oGLWszdFrl	\N
584	William	George	668	wgeorgeg7@adobe.com	HPs8H9jzAfvx	\N
585	Angela	Hall	669	ahallg8@etsy.com	QHuEAI	\N
586	Kevin	Harvey	670	kharveyg9@g.co	mG8QpgFdcH	\N
587	Steven	King	671	skingga@multiply.com	gls1EvAAp	\N
588	Virginia	Daniels	672	vdanielsgb@washington.edu	7XIjHIgO	\N
589	Fred	Stephens	673	fstephensgc@flickr.com	whLTuv	\N
590	Matthew	Jenkins	674	mjenkinsgd@sun.com	sTe6EGYeRP	\N
591	Adam	Williamson	675	awilliamsonge@yahoo.co.jp	jtR1U0	\N
592	Kathleen	Russell	676	krussellgf@ft.com	RIzWsllGaqE	\N
593	Carolyn	Ford	677	cfordgg@merriam-webster.com	jo0o2WEMoNZ	\N
594	Linda	Larson	678	llarsongh@xrea.com	7i437uilRW	\N
595	Sandra	Lee	679	sleegi@stanford.edu	cqYzCxDZL	\N
596	Peter	Murray	680	pmurraygj@people.com.cn	tBegNgiJV8	\N
597	Carlos	Walker	681	cwalkergk@aol.com	qGmj7h6Cky	\N
598	Aaron	Ortiz	682	aortizgl@cdbaby.com	j1TrvUbc	\N
599	Brenda	Garcia	683	bgarciagm@issuu.com	SP04dPoJQqg	\N
600	Aaron	Fox	684	afoxgn@a8.net	fPNAEts0	\N
601	Douglas	Cook	685	dcookgo@mlb.com	e1MFSpN8MOt	\N
602	Sean	Sanchez	686	ssanchezgp@posterous.com	RgmQyk2guIhl	\N
603	Adam	Lopez	687	alopezgq@theguardian.com	yqYxsnWOhmx	\N
604	Jose	Robinson	688	jrobinsongr@constantcontact.com	mxSyHC	\N
605	Bobby	Welch	689	bwelchgs@google.com.hk	Xtg7wlYI8	\N
606	Jessica	Bell	690	jbellgt@latimes.com	WB2VWlanEqNh	\N
607	Steve	Peters	691	spetersgu@goo.ne.jp	sRmY21wN	\N
608	Louise	Hamilton	692	lhamiltongv@hostgator.com	hIjspt	\N
609	Rose	Hicks	693	rhicksgw@engadget.com	j6xe5afj	\N
610	Jennifer	Schmidt	694	jschmidtgx@google.es	eNHNkSy	\N
611	James	Rodriguez	695	jrodriguezgy@ezinearticles.com	d2wWLT7	\N
612	Mark	Graham	416	mgrahamgz@vk.com	TpFdz1wuJ	\N
613	Norma	Reid	696	nreidh0@wp.com	mXZhEqQS5d6	\N
614	Eric	Turner	697	eturnerh1@livejournal.com	DAt79vcI4vfN	\N
615	Jeremy	Ward	698	jwardh2@surveymonkey.com	ozv17no	\N
616	Sandra	Kelly	699	skellyh3@theatlantic.com	i8RGmw	\N
617	Denise	Meyer	700	dmeyerh4@google.ru	S99QV84tj	\N
618	Steven	Reyes	701	sreyesh5@tripod.com	SYAsmj0sd	\N
619	Randy	Martinez	702	rmartinezh6@trellian.com	G9p0tPDlqo4	\N
620	Raymond	Jackson	703	rjacksonh7@edublogs.org	6ETejzW	\N
621	Anne	Gardner	704	agardnerh8@blogs.com	fS1PoQec	\N
622	Paula	Hall	705	phallh9@un.org	dKiRsEnUy	\N
623	Sharon	Lee	706	sleeha@google.it	yowI1b8X	\N
624	James	Watson	707	jwatsonhb@whitehouse.gov	5IzSI4tQm2qi	\N
625	Terry	Gibson	708	tgibsonhc@nymag.com	o4byL3k4	\N
626	Anthony	Fernandez	709	afernandezhd@opera.com	svaF8n	\N
627	Henry	Snyder	710	hsnyderhe@alexa.com	IZAXjF0	\N
628	Clarence	James	711	cjameshf@tamu.edu	y63Keq6	\N
629	Kevin	Reynolds	712	kreynoldshg@exblog.jp	FS7DTxPmaNw	\N
630	Beverly	Wheeler	713	bwheelerhh@sitemeter.com	DTACd9wpll	\N
631	Ruby	Mitchell	714	rmitchellhi@yahoo.co.jp	LR7ZaPWPRmj	\N
632	Denise	Martinez	715	dmartinezhj@hp.com	RPDDyHqsAa1	\N
633	Todd	Meyer	716	tmeyerhk@live.com	LFVafKEpqza	\N
634	Martin	Stevens	717	mstevenshl@a8.net	2xrR848oltk5	\N
635	John	Gilbert	718	jgilberthm@techcrunch.com	AR16zPt3h	\N
636	Beverly	Bennett	719	bbennetthn@apple.com	nuPdEKRc9b	\N
637	Joe	Wells	720	jwellsho@cocolog-nifty.com	zJubjIsD	\N
638	Anna	Gibson	721	agibsonhp@g.co	Zls5FET	\N
639	Amy	Watson	722	awatsonhq@taobao.com	9cp1tyzdRXg	\N
640	Terry	Duncan	723	tduncanhr@cdbaby.com	yp68L3XX0	\N
641	Eric	Reed	724	ereedhs@soup.io	i3a06EU	\N
642	Sarah	West	725	swestht@sitemeter.com	MAiM8eLfvz	\N
643	Stephen	Sims	726	ssimshu@wired.com	LP69EL	\N
644	Janice	Morales	727	jmoraleshv@ucoz.com	Q3F4AY5XnLjv	\N
645	Jason	Dean	728	jdeanhw@state.tx.us	OB2sDg	\N
646	Harry	Riley	729	hrileyhx@umich.edu	0M8SVeWP	\N
647	Johnny	Wright	730	jwrighthy@alexa.com	SUFMpWJCz	\N
648	Roger	Arnold	731	rarnoldhz@nifty.com	VocQe99	\N
649	Christopher	Gutierrez	732	cgutierrezi0@squidoo.com	DY4yrDF1KY	\N
650	Matthew	Jordan	733	mjordani1@edublogs.org	VNNUnY	\N
651	Clarence	Boyd	734	cboydi2@upenn.edu	mlgIco	\N
652	Anne	Cook	735	acooki3@samsung.com	MhuxvJ	\N
653	Keith	Gonzalez	736	kgonzalezi4@last.fm	LwxZbiQhPlnp	\N
654	Ernest	Bell	737	ebelli5@biglobe.ne.jp	kBujSDeXu	\N
655	Daniel	Diaz	738	ddiazi6@ebay.co.uk	NKXIOr	\N
656	Sharon	Alexander	739	salexanderi7@networksolutions.com	X0R0MKssLO	\N
657	Frances	Walker	740	fwalkeri8@yahoo.co.jp	bPs5kbugP8	\N
658	Andrea	Morrison	741	amorrisoni9@yellowbook.com	VdZH36k5bSB0	\N
659	Richard	Frazier	3	rfrazieria@columbia.edu	1KAgT99W	\N
660	Judy	Stone	742	jstoneib@behance.net	D8jt40K	\N
661	Richard	Ramos	743	rramosic@disqus.com	MosChIkaml	\N
662	Peter	Turner	744	pturnerid@prweb.com	RbFQAcC	\N
663	Martin	Williams	745	mwilliamsie@jiathis.com	xMSPuMaObiL0	\N
664	Samuel	Johnston	746	sjohnstonif@wp.com	o8APdiYnmcM	\N
665	Annie	Nguyen	747	anguyenig@technorati.com	3fyhsy7	\N
666	Jane	Gonzales	748	jgonzalesih@china.com.cn	eHTBFQPrU	\N
667	Todd	Lee	749	tleeii@businessweek.com	2B3JZvWubv	\N
668	Andrea	Miller	750	amillerij@goo.gl	2lz9I1rau	\N
669	Joyce	Foster	751	jfosterik@bravesites.com	KTFZzY3Sdt3	\N
670	Michelle	Jackson	752	mjacksonil@purevolume.com	PlWR2pZ5LEbE	\N
671	Phyllis	Carpenter	753	pcarpenterim@yellowpages.com	sk9govvs	\N
672	Heather	Warren	754	hwarrenin@state.tx.us	P1CWw4NVcHCC	\N
673	Johnny	Shaw	755	jshawio@diigo.com	HW8yCpEpCcLI	\N
674	Teresa	Bell	244	tbellip@freewebs.com	NtQu6UxIvG	\N
675	Ruth	Cruz	756	rcruziq@youtu.be	r0SPwBLLZObK	\N
676	Alan	Davis	757	adavisir@cam.ac.uk	xOq9gleG	\N
677	Anna	Richards	758	arichardsis@google.com.hk	EEPE0fkB	\N
678	Juan	Harvey	759	jharveyit@blogtalkradio.com	I8saf2	\N
679	Edward	Anderson	760	eandersoniu@livejournal.com	G9SYiBI	\N
680	Johnny	Turner	761	jturneriv@spotify.com	HdqEYaIy	\N
681	Evelyn	Torres	762	etorresiw@gravatar.com	IcOg3DnKQZx	\N
682	Christine	Gomez	763	cgomezix@dmoz.org	0fPZlT	\N
683	Dorothy	Morris	764	dmorrisiy@yale.edu	XL8cHWLxjRUC	\N
684	Jacqueline	Wallace	765	jwallaceiz@pbs.org	AMfiK7JOmZrI	\N
685	Arthur	Boyd	766	aboydj0@wordpress.com	YbZfFykUo	\N
686	Joshua	Griffin	767	jgriffinj1@europa.eu	QYEphGeH2Eu	\N
687	Christopher	Cunningham	768	ccunninghamj2@51.la	fWPUEi	\N
688	Jessica	Hall	769	jhallj3@so-net.ne.jp	AcX4ebPX2k	\N
689	Virginia	Shaw	770	vshawj4@shareasale.com	WpTv2mer0j9J	\N
690	Theresa	Hill	771	thillj5@plala.or.jp	jHobUpufIah	\N
691	Ryan	Howell	772	rhowellj6@icq.com	OwJaiu	\N
692	John	Gardner	773	jgardnerj7@scribd.com	UyJ5mtts9POY	\N
693	Shawn	Kim	774	skimj8@scribd.com	hYXs4qV8	\N
694	Ronald	Simpson	775	rsimpsonj9@storify.com	Y3jcecOD1CA	\N
695	Randy	Gutierrez	776	rgutierrezja@mapy.cz	Zq7TYJ74	\N
696	Gary	Warren	777	gwarrenjb@parallels.com	guPgSAG5fkW	\N
697	Teresa	Ramirez	778	tramirezjc@studiopress.com	Mqa0JGORJ	\N
698	Harold	Miller	779	hmillerjd@craigslist.org	Eac8YE1zM	\N
699	Phyllis	Richards	780	prichardsje@disqus.com	Uf9AW9PJ69	\N
700	Joe	Harris	781	jharrisjf@cocolog-nifty.com	pVMwUNoO	\N
701	Samuel	Kelly	782	skellyjg@cnn.com	buAXs0bWUZU2	\N
702	Dennis	Perkins	783	dperkinsjh@sina.com.cn	b01Ycqf	\N
703	Sarah	Fields	784	sfieldsji@mediafire.com	uojCeCn	\N
704	Timothy	Morrison	785	tmorrisonjj@wikipedia.org	nsNXyuInTNX	\N
705	Helen	Elliott	786	helliottjk@4shared.com	bQmOeFJJsr4	\N
706	Carolyn	Moreno	787	cmorenojl@webs.com	qs9vJO	\N
707	Roy	Gutierrez	788	rgutierrezjm@unc.edu	sfGxD83ZZcjP	\N
708	Norma	Rice	780	nricejn@blinklist.com	TY5YuHao	\N
709	Antonio	Carter	789	acarterjo@icio.us	rXoK3lIbYzG	\N
710	Albert	Kim	790	akimjp@amazon.com	c8U18zdTD	\N
711	Roy	Sullivan	791	rsullivanjq@hp.com	JCvcZJ	\N
712	Mildred	Spencer	792	mspencerjr@ameblo.jp	a0NlV2f9iZe	\N
713	Jerry	Shaw	793	jshawjs@netvibes.com	70WkRP	\N
714	Ann	Morgan	794	amorganjt@google.co.jp	juM6ifUB	\N
715	Harry	Hughes	795	hhughesju@trellian.com	rFBvGzLGzlLN	\N
716	Russell	Cook	796	rcookjv@pen.io	LfDP4Im3nxZx	\N
717	Mark	Snyder	797	msnyderjw@vistaprint.com	1gnmMo99v	\N
718	Jonathan	Lawrence	798	jlawrencejx@deviantart.com	cQdseU8P	\N
719	Karen	Wood	799	kwoodjy@odnoklassniki.ru	W8kD1xB58w	\N
720	Anne	Hughes	800	ahughesjz@eepurl.com	8XjxzkfZJ	\N
721	Norma	Brown	801	nbrownk0@tuttocitta.it	hZWpjNqYmdmJ	\N
722	Beverly	Torres	802	btorresk1@yahoo.com	7kXWnG	\N
723	Carl	Ryan	803	cryank2@indiatimes.com	jycdWX	\N
724	Rose	Webb	804	rwebbk3@dailymail.co.uk	aVVMXHXyLM2A	\N
725	Diane	Evans	805	devansk4@phpbb.com	4nJH6JMy	\N
726	Mary	Griffin	806	mgriffink5@apple.com	EHNBOE2gMy	\N
727	Alice	Brown	807	abrownk6@state.tx.us	HGIK48KAOf	\N
728	Carolyn	Carpenter	808	ccarpenterk7@lulu.com	AnLSSCTD	\N
729	Brenda	Wagner	809	bwagnerk8@yelp.com	7rpUlgtQ	\N
730	Margaret	Morales	659	mmoralesk9@admin.ch	WRbJ6Z1G	\N
731	Martin	Richards	810	mrichardska@360.cn	SuLNE3IkM	\N
732	Paula	Butler	811	pbutlerkb@chronoengine.com	a1iVTyaC6pT	\N
733	Joan	Hughes	812	jhugheskc@yolasite.com	3KXo9e	\N
734	Jessica	Snyder	813	jsnyderkd@soup.io	rUD7oda	\N
735	James	Hayes	814	jhayeske@narod.ru	XHQ5Wz1	\N
736	Kevin	Fox	815	kfoxkf@oakley.com	0Q9SzhxFjQy	\N
737	Joyce	Lopez	816	jlopezkg@zdnet.com	mqXkmsyv	\N
738	Virginia	Harrison	817	vharrisonkh@woothemes.com	SG6fwedu	\N
739	Matthew	Washington	818	mwashingtonki@creativecommons.org	zqQHt28	\N
740	Clarence	Kennedy	819	ckennedykj@hatena.ne.jp	FuVxUw314	\N
741	Elizabeth	Ruiz	820	eruizkk@telegraph.co.uk	sUBslb	\N
742	Richard	Richards	821	rrichardskl@aboutads.info	pkOuP0	\N
743	Nancy	Butler	31	nbutlerkm@macromedia.com	I5zEq3GtEZ	\N
744	Randy	Wallace	822	rwallacekn@purevolume.com	mmhI5OdVyh	\N
745	Wayne	Mills	823	wmillsko@dyndns.org	iowcSh	\N
746	Louis	Dean	824	ldeankp@jimdo.com	yTGQ51jD	\N
747	Aaron	Greene	825	agreenekq@dailymail.co.uk	zfXXOiGInE6O	\N
748	Charles	Hunt	826	chuntkr@yolasite.com	OIlpOwqcbqBN	\N
749	Edward	Warren	827	ewarrenks@delicious.com	RI24lj	\N
750	Teresa	Matthews	828	tmatthewskt@upenn.edu	OMzlz8uxNeie	\N
751	Martha	Stanley	829	mstanleyku@jimdo.com	ipwiRaIw37GB	\N
752	James	Brown	830	jbrownkv@sciencedirect.com	LDTC951d	\N
753	Peter	Sanchez	831	psanchezkw@t-online.de	Zca54v	\N
754	Maria	Nichols	832	mnicholskx@geocities.jp	zWF1Otp2Xx5r	\N
755	Donna	Brooks	833	dbrooksky@behance.net	fzASGk	\N
756	John	Schmidt	834	jschmidtkz@imageshack.us	dt38BDd4	\N
757	Tina	Bradley	835	tbradleyl0@imgur.com	lB1vRg5	\N
758	Harold	Mason	836	hmasonl1@yellowbook.com	lEi8jed2LH7	\N
759	Albert	Knight	837	aknightl2@usnews.com	J1Cr25Vlqr	\N
760	Jeremy	Ward	838	jwardl3@dagondesign.com	CwSmly	\N
761	Stephanie	Nguyen	839	snguyenl4@w3.org	qRyZ9EL	\N
762	Shawn	Palmer	840	spalmerl5@chicagotribune.com	KeSfOw	\N
763	Fred	Kelly	841	fkellyl6@ehow.com	blmwYmw	\N
764	Margaret	Long	842	mlongl7@mac.com	74GjELkZ	\N
765	Paula	Dixon	843	pdixonl8@dmoz.org	EIQRvCf2Ivq	\N
766	Benjamin	Palmer	844	bpalmerl9@paypal.com	eVjcoMXo	\N
767	Jesse	Powell	845	jpowellla@cocolog-nifty.com	8V1Npk1Avj	\N
768	Gloria	Andrews	846	gandrewslb@imdb.com	7eVGR9pg	\N
769	Kevin	Kennedy	847	kkennedylc@cornell.edu	t1PgqMc7N	\N
770	Jessica	Turner	848	jturnerld@google.co.uk	Qdn4o3g	\N
771	Denise	Gomez	849	dgomezle@latimes.com	k3mAvhsr	\N
772	Justin	Murray	850	jmurraylf@webeden.co.uk	GKCCyXDUVM	\N
773	Debra	Holmes	851	dholmeslg@cbslocal.com	GPwe4f7	\N
774	Richard	Rice	852	rricelh@shinystat.com	D7PwXdi	\N
775	Shawn	Rodriguez	853	srodriguezli@t.co	ooJa8nh	\N
776	Roger	Palmer	854	rpalmerlj@jugem.jp	BGvhHSt	\N
777	Roy	Franklin	855	rfranklinlk@home.pl	dlYZCNA6Bv	\N
778	Kimberly	Sullivan	856	ksullivanll@alexa.com	VUFkylr	\N
779	Norma	Stevens	857	nstevenslm@ca.gov	RUrD0O	\N
780	Carol	Carroll	858	ccarrollln@ihg.com	2qx8hLzF	\N
781	Phillip	Henry	859	phenrylo@va.gov	ah1za1	\N
782	Susan	Alvarez	860	salvarezlp@studiopress.com	e3xpyiNo	\N
783	Michelle	Jenkins	861	mjenkinslq@adobe.com	ZU77y7zBBwDV	\N
784	Charles	Gordon	862	cgordonlr@dedecms.com	pXm3WFQ	\N
785	Jack	Wallace	863	jwallacels@tripadvisor.com	nWLr8hPjsNmR	\N
786	Shawn	Kennedy	864	skennedylt@ox.ac.uk	LW7pv1Ts	\N
787	Sean	Fowler	865	sfowlerlu@etsy.com	H7Qavt	\N
788	Roger	Wallace	866	rwallacelv@google.com.hk	cQfQDNFGgK5	\N
789	Jacqueline	Bradley	867	jbradleylw@wix.com	2C6LFHP74Ik	\N
790	Jonathan	Thomas	868	jthomaslx@printfriendly.com	Z83BbllvUw	\N
791	Emily	Stephens	869	estephensly@qq.com	EsLjX45TSHF8	\N
792	Deborah	Bowman	870	dbowmanlz@indiatimes.com	d6LZRI4	\N
793	Patrick	Lee	871	pleem0@businessweek.com	gesG9XLTHlO2	\N
794	Julie	Webb	872	jwebbm1@acquirethisname.com	HuIpOKMQP	\N
795	Mark	Carter	873	mcarterm2@spiegel.de	Qoce0D2lo	\N
796	Anna	Williamson	874	awilliamsonm3@live.com	k0Zf2Kvq	\N
797	Christopher	Greene	875	cgreenem4@sphinn.com	J44ysmsOYeQ	\N
798	Harold	Williamson	876	hwilliamsonm5@alexa.com	YWzg06sXWk	\N
799	Wanda	Riley	877	wrileym6@geocities.jp	sNGPNmW	\N
800	Stephanie	Cunningham	878	scunninghamm7@rambler.ru	oNXfnbdnstDY	\N
801	Sandra	Dunn	435	sdunnm8@de.vu	pH6QrMh0pQe	\N
802	Gary	Brown	879	gbrownm9@samsung.com	BTwdQfw7x	\N
803	Stephanie	Cooper	880	scooperma@si.edu	AjQzP7	\N
804	Willie	Carr	703	wcarrmb@buzzfeed.com	2lusejMKBi	\N
805	Billy	Grant	881	bgrantmc@npr.org	gfMYQWFE	\N
806	Douglas	Fisher	882	dfishermd@hc360.com	cjVDCak	\N
807	Rebecca	Burton	883	rburtonme@gmpg.org	OH4R2idF6F	\N
808	Margaret	Ryan	884	mryanmf@techcrunch.com	DtSO0ik7764e	\N
809	Chris	Allen	885	callenmg@webs.com	wxNNNlzSfer	\N
810	Stephen	Fernandez	886	sfernandezmh@mlb.com	HxFlCFhL	\N
811	Phillip	Bell	887	pbellmi@bigcartel.com	DWsDRsTuf33	\N
812	Katherine	Cole	888	kcolemj@blogtalkradio.com	jmN405w	\N
813	Matthew	Harrison	889	mharrisonmk@csmonitor.com	ABXFHMrvZE4	\N
814	Ashley	Kelley	890	akelleyml@sphinn.com	EgAXILXO1MvQ	\N
815	Maria	Johnston	891	mjohnstonmm@si.edu	s7SgQOrkAudG	\N
816	Billy	Nguyen	892	bnguyenmn@hud.gov	6e4baOs0JHy	\N
817	Jesse	Alexander	893	jalexandermo@nba.com	YogfO48f	\N
818	Jennifer	Parker	894	jparkermp@whitehouse.gov	sjHcrYbU	\N
819	Phillip	Henry	895	phenrymq@businesswire.com	RBjrgdPelbbU	\N
820	Rachel	Gordon	896	rgordonmr@gmpg.org	9hq8tqCbZ0	\N
821	Jessica	Harris	897	jharrisms@netscape.com	LDKUU2FAjgxT	\N
822	Janet	Graham	898	jgrahammt@jugem.jp	J5nk9Akt	\N
823	Johnny	Burns	899	jburnsmu@time.com	w0mIaLFVVe	\N
824	Laura	Hill	900	lhillmv@freewebs.com	8rxBLqiwgW	\N
825	Joe	Watson	901	jwatsonmw@mozilla.org	jvzkwPxamVqq	\N
826	Thomas	Fernandez	902	tfernandezmx@adobe.com	fuNp5Eu	\N
827	Julia	Lee	903	jleemy@google.it	Jxzi3k	\N
828	Margaret	Baker	904	mbakermz@economist.com	fkWRqBi	\N
829	Jonathan	Lewis	905	jlewisn0@issuu.com	bmNMocDEdz	\N
830	Laura	Austin	906	laustinn1@unblog.fr	GKNXmAH	\N
831	Peter	Rogers	907	progersn2@ox.ac.uk	6MxQvqoccgbs	\N
832	Randy	Martin	908	rmartinn3@ucoz.ru	Pyno7mHwX	\N
833	Christopher	Reed	909	creedn4@businessweek.com	UpxuXFR3	\N
834	Sara	Riley	910	srileyn5@nsw.gov.au	tvfYDki	\N
835	Jeremy	Mills	232	jmillsn6@yellowbook.com	2adRGFGhB	\N
836	Steve	Wilson	911	swilsonn7@digg.com	Qymmc9tc	\N
837	Jose	Sanchez	912	jsanchezn8@prlog.org	BOTgoaSiu1Mx	\N
838	Wayne	Stephens	913	wstephensn9@amazon.co.uk	mFql7GMu	\N
839	Juan	Jordan	914	jjordanna@reference.com	eRGsPLxpEYl	\N
840	Julia	Ortiz	915	jortiznb@gnu.org	YbCFrRDF3r	\N
841	Debra	Mcdonald	916	dmcdonaldnc@engadget.com	hyXOkkTd3jlM	\N
842	Joseph	Rivera	917	jriverand@parallels.com	zhU4ly	\N
843	Lois	Berry	918	lberryne@blinklist.com	K9YExHc	\N
844	Paula	Henderson	919	phendersonnf@cdbaby.com	pB7Du6G	\N
845	Susan	Castillo	920	scastillong@cdc.gov	Cndo1moYi	\N
846	Eugene	Stevens	921	estevensnh@indiegogo.com	0WsFpTo2XyS1	\N
847	Sandra	Perry	922	sperryni@a8.net	6SwKt1P	\N
848	Linda	Nichols	923	lnicholsnj@apache.org	8ClNM1FBuZ	\N
849	Tina	Burke	924	tburkenk@desdev.cn	ecetLC	\N
850	Thomas	Gutierrez	925	tgutierreznl@illinois.edu	oVA9XVGCr	\N
851	Mildred	Ford	926	mfordnm@sitemeter.com	7yvJjiQR	\N
852	Samuel	White	927	swhitenn@house.gov	rG8RY47	\N
853	Jason	Harvey	928	jharveyno@deliciousdays.com	Q2jaiN	\N
854	Judith	Wood	929	jwoodnp@ucla.edu	LkPm4exSay3Q	\N
855	Jason	Lane	930	jlanenq@cdbaby.com	NpmLwivPuDmG	\N
856	Norma	Brooks	931	nbrooksnr@unesco.org	QiaaTwWDOB	\N
857	Terry	Wells	932	twellsns@comsenz.com	uLUBtN	\N
858	Jeremy	Hunter	933	jhunternt@goodreads.com	HFcHLfaa	\N
859	Melissa	Burton	934	mburtonnu@intel.com	MpDzeqi	\N
860	Heather	Mcdonald	935	hmcdonaldnv@craigslist.org	EMxIjZH	\N
861	Peter	Cruz	936	pcruznw@bravesites.com	J4PcNUE6bIw	\N
862	Eric	Hayes	937	ehayesnx@slate.com	tMbr1MFTZ9	\N
863	Martha	Cruz	938	mcruzny@mayoclinic.com	Kq0QrYcUhC6E	\N
864	Mary	Jacobs	939	mjacobsnz@skyrock.com	E6I0aERe	\N
865	Jason	Tucker	940	jtuckero0@mayoclinic.com	niD3cx	\N
866	Philip	Hunter	941	phuntero1@google.com	u23hS2Gvs	\N
867	Janet	Romero	942	jromeroo2@wix.com	ZiCQNCJuKU	\N
868	Rebecca	Cruz	943	rcruzo3@nhs.uk	byNh5RNQ	\N
869	Russell	Cole	944	rcoleo4@google.nl	Z0F6Z6	\N
870	Cynthia	Hanson	945	chansono5@cargocollective.com	YOgnya	\N
871	Doris	Richardson	946	drichardsono6@hud.gov	XyLgKZA	\N
872	Brandon	Palmer	947	bpalmero7@xing.com	YZ9HJedb5qR	\N
873	Eugene	Kim	948	ekimo8@netscape.com	B3ORy3ei	\N
874	Kathy	Ferguson	949	kfergusono9@intel.com	dNcrLc	\N
875	Katherine	Mccoy	950	kmccoyoa@geocities.com	naD5paBZ	\N
876	Howard	Diaz	951	hdiazob@sciencedaily.com	AeqKqsIJ	\N
877	Earl	Oliver	952	eoliveroc@nyu.edu	29f8e7d	\N
878	Janice	Smith	953	jsmithod@ezinearticles.com	sBdTeXZJVhx	\N
879	Joseph	Lawrence	954	jlawrenceoe@vkontakte.ru	l5dmXL99U7	\N
880	Daniel	Castillo	955	dcastilloof@example.com	0dfbKF	\N
881	Ronald	Fisher	956	rfisherog@va.gov	ZZv3sbkh	\N
882	Debra	Spencer	957	dspenceroh@tmall.com	R8oLusdW	\N
883	Patrick	Armstrong	958	parmstrongoi@dagondesign.com	NdB3yN	\N
884	Ashley	Rice	959	ariceoj@blogtalkradio.com	EJIsEN9oYffu	\N
885	Michelle	Rodriguez	960	mrodriguezok@webmd.com	msGYhyOmwAr	\N
886	Judy	Spencer	961	jspencerol@macromedia.com	otOupytm	\N
887	Billy	Welch	962	bwelchom@ning.com	vtXm9mWrO	\N
888	Jose	Campbell	963	jcampbellon@msn.com	Qc0z1Eq9GP1	\N
889	Teresa	Wood	964	twoodoo@blogger.com	CXodQ9ZvCI	\N
890	Ryan	Garza	965	rgarzaop@myspace.com	5DLurQ	\N
891	Joe	Carter	966	jcarteroq@edublogs.org	lF2kvnUI	\N
892	Lisa	Armstrong	967	larmstrongor@twitpic.com	AqjTnLtfLI	\N
893	Douglas	Brooks	968	dbrooksos@posterous.com	pVR6qxp	\N
894	Joe	Sanders	969	jsandersot@goo.ne.jp	i32FdZhjWUo	\N
895	Mildred	Ellis	970	mellisou@wikimedia.org	GzRU76t6h	\N
896	Phillip	Rogers	971	progersov@phpbb.com	sUCSXHhvS	\N
897	Benjamin	Burton	972	bburtonow@t.co	564Zgr	\N
898	Paul	Jenkins	973	pjenkinsox@cafepress.com	bCTfk1	\N
899	Kevin	Patterson	974	kpattersonoy@illinois.edu	UlIjVIBbv3Aq	\N
900	Kimberly	Baker	975	kbakeroz@soundcloud.com	rlhkaQfANmUx	\N
901	Brandon	Oliver	976	boliverp0@icq.com	8uEz6rbDEZ	\N
902	Roger	Diaz	977	rdiazp1@people.com.cn	PU9AGK	\N
903	Margaret	Kennedy	978	mkennedyp2@amazonaws.com	lGcNVpZ5	\N
904	Frances	Griffin	979	fgriffinp3@nhs.uk	WPv9jXiYW	\N
905	Diana	Harris	980	dharrisp4@bigcartel.com	7WCKVkwHY	\N
906	Carl	Oliver	981	coliverp5@bloomberg.com	JsXg4Qec3XV5	\N
907	Katherine	Taylor	982	ktaylorp6@deviantart.com	1LEVMtBt	\N
908	Louis	Cunningham	983	lcunninghamp7@wordpress.com	GqaGBrLOY	\N
909	Joe	Little	984	jlittlep8@dedecms.com	AqJlhaMY	\N
910	Sandra	Stanley	985	sstanleyp9@drupal.org	EtzdrKRON	\N
911	Julia	Gutierrez	986	jgutierrezpa@skype.com	oWTPA2H0qd	\N
912	Ashley	Little	987	alittlepb@wisc.edu	DyVXWEfvBJdK	\N
913	Jose	Thomas	988	jthomaspc@foxnews.com	VUZpLz7nN	\N
914	Ann	Garrett	989	agarrettpd@mashable.com	1j1iWyL	\N
915	Annie	Thompson	990	athompsonpe@xrea.com	2YZacv5qtNC	\N
916	Christopher	Baker	991	cbakerpf@cocolog-nifty.com	KomQkg	\N
917	Anne	Peters	992	apeterspg@ustream.tv	81QDRHdxPIv	\N
918	Ruth	Medina	993	rmedinaph@plala.or.jp	FkDP237	\N
919	Cynthia	George	994	cgeorgepi@wikispaces.com	d6cyK8oF	\N
920	Martin	Payne	995	mpaynepj@baidu.com	8IkYcs	\N
921	Gloria	Black	996	gblackpk@hugedomains.com	jO4kKw5QtP	\N
922	Lisa	Gardner	997	lgardnerpl@example.com	BIpDMV5fo	\N
923	Wayne	Stewart	998	wstewartpm@addtoany.com	AYmOqw4	\N
924	Jimmy	Wilson	999	jwilsonpn@creativecommons.org	KSJc4f	\N
925	Annie	Chavez	1000	achavezpo@t-online.de	zRkhNO	\N
926	Katherine	Hanson	1001	khansonpp@dagondesign.com	mSpEvBHvZ	\N
927	Janice	Reid	1002	jreidpq@stanford.edu	VQ4GLb3z15K	\N
928	Larry	Turner	1003	lturnerpr@cpanel.net	mq1G9Ogd6nc	\N
929	Andrea	Thompson	1004	athompsonps@163.com	g4P6IX	\N
930	Julie	Payne	1005	jpaynept@geocities.com	MwqD20T9Fcm	\N
931	Doris	Butler	1006	dbutlerpu@boston.com	WHgAH9	\N
932	Carl	Clark	1007	cclarkpv@ihg.com	w0KlIQ	\N
933	Ernest	Hayes	1008	ehayespw@irs.gov	i53zuTJTx	\N
934	Ann	Kelly	1009	akellypx@npr.org	5CQkjO	\N
935	Thomas	Little	1010	tlittlepy@admin.ch	SIFEc6zG0GB3	\N
936	Roy	Torres	1011	rtorrespz@multiply.com	1xNWPCLHGTbE	\N
937	Helen	Nguyen	1012	hnguyenq0@ycombinator.com	FqguDVV1B8fo	\N
938	Kelly	Griffin	1013	kgriffinq1@g.co	a4tXsBXwo	\N
939	Phillip	Bradley	1014	pbradleyq2@networkadvertising.org	RA5FSyW	\N
940	Louise	Hernandez	1015	lhernandezq3@yandex.ru	ayQUrfBgbizp	\N
941	Victor	Reynolds	1016	vreynoldsq4@amazon.co.uk	UeKdKsJ24	\N
942	Wayne	Banks	1017	wbanksq5@techcrunch.com	R6nZ9Ytdz70	\N
943	Kimberly	Harrison	1018	kharrisonq6@reuters.com	mpo4lh2W2bYu	\N
944	Ashley	Jackson	1019	ajacksonq7@mtv.com	psRbfR3	\N
945	Billy	Jones	1020	bjonesq8@technorati.com	4kPoWlqKH	\N
946	Pamela	Young	1021	pyoungq9@sogou.com	PFh6UF	\N
947	Tammy	Peters	1022	tpetersqa@storify.com	yCFDkRy4	\N
948	Billy	Wells	1023	bwellsqb@apache.org	rGMElmMzXMq	\N
949	Lois	Ramirez	1024	lramirezqc@studiopress.com	erPky9	\N
950	Nicholas	Willis	1025	nwillisqd@google.nl	gBgZIAQOk	\N
951	Julia	Hansen	1026	jhansenqe@amazonaws.com	GZB5Wn	\N
952	Mark	Elliott	1027	melliottqf@ebay.co.uk	Gs0rpc6	\N
953	Sandra	Davis	1028	sdavisqg@theatlantic.com	Dg6RHBTMb	\N
954	Annie	Fields	1029	afieldsqh@mac.com	1mic6pSsFl	\N
955	Justin	George	1030	jgeorgeqi@cargocollective.com	DE9BJFPVWOJ	\N
956	Kathy	Mason	1031	kmasonqj@state.gov	gebUwXfYvdQ6	\N
957	Carol	Gardner	1032	cgardnerqk@ebay.com	IsNUena	\N
958	Harry	Anderson	1033	handersonql@europa.eu	XD9JodV7	\N
959	Edward	Grant	1034	egrantqm@scribd.com	bbgzNtfw	\N
960	Roger	James	1035	rjamesqn@umn.edu	8yJY6n	\N
961	Arthur	Medina	1036	amedinaqo@columbia.edu	qyN1TSMm	\N
962	Pamela	Jackson	1037	pjacksonqp@hugedomains.com	uVMlxqqUXf	\N
963	Clarence	Cunningham	1038	ccunninghamqq@deliciousdays.com	JOaIX9	\N
964	Kenneth	Chapman	1039	kchapmanqr@omniture.com	jwSoSy91y0	\N
965	Philip	Patterson	1040	ppattersonqs@dion.ne.jp	VWFre3sfCy	\N
966	Jacqueline	Lawrence	1041	jlawrenceqt@de.vu	muXNkve	\N
967	Kelly	Wood	1042	kwoodqu@admin.ch	XUZPSw	\N
968	Annie	Black	1043	ablackqv@imageshack.us	ETgjI7yF0	\N
969	Jerry	Smith	1044	jsmithqw@desdev.cn	UQILiD	\N
970	Lois	Bishop	1045	lbishopqx@sourceforge.net	3RZMt5h	\N
971	Jeremy	Smith	1046	jsmithqy@pbs.org	g7eekPLvEOo	\N
972	Robert	Little	1047	rlittleqz@cmu.edu	yhlUSQepG	\N
973	Craig	Richardson	1048	crichardsonr0@delicious.com	FeV8XmX0nna	\N
974	Jesse	Myers	1049	jmyersr1@imdb.com	pvVnMokvIX6	\N
975	Brenda	Harper	1050	bharperr2@topsy.com	iwG8pTQbN	\N
976	Robert	Jordan	1051	rjordanr3@phoca.cz	yc5bQqcVyCK	\N
977	Anna	Nichols	1052	anicholsr4@drupal.org	GezZQ98fg	\N
978	Margaret	Cole	1053	mcoler5@imageshack.us	QANFyMKL	\N
979	Gerald	Matthews	1054	gmatthewsr6@senate.gov	QyXhEH	\N
980	Ernest	Price	1055	epricer7@phpbb.com	ay1KiJijwQn	\N
981	Robin	Freeman	1056	rfreemanr8@rakuten.co.jp	UYAMTp	\N
982	Jean	Baker	1057	jbakerr9@fc2.com	5ASAIIvjLG	\N
983	Jean	White	1058	jwhitera@mayoclinic.com	NIHn2Zm9	\N
984	Jennifer	Watkins	1059	jwatkinsrb@bloglines.com	xVFYo9	\N
985	Amy	Taylor	1060	ataylorrc@webs.com	drtKm9RUMk7	\N
986	Virginia	Pierce	462	vpiercerd@freewebs.com	FMmR7O	\N
987	Lisa	Rose	1061	lrosere@paypal.com	M7L6Yv485R0h	\N
988	George	Carpenter	1062	gcarpenterrf@dailymotion.com	eLx9reIYqN	\N
989	Andrew	Reynolds	1063	areynoldsrg@examiner.com	zlRtSPD	\N
990	Joan	Butler	1064	jbutlerrh@live.com	Qd6xhFBMT	\N
991	Chris	Freeman	1065	cfreemanri@hao123.com	CfqMmHW	\N
992	Ronald	Baker	1066	rbakerrj@wikimedia.org	aHvXJcz	\N
993	Carolyn	Riley	1067	crileyrk@archive.org	KTN4dd	\N
994	Michael	Grant	1068	mgrantrl@a8.net	8L5koMbSwVt	\N
995	Mildred	Campbell	1069	mcampbellrm@yelp.com	EOADQ4HYzS	\N
996	Dorothy	Cooper	1070	dcooperrn@dell.com	jsFFDpBUgg	\N
997	Harold	Franklin	1071	hfranklinro@uiuc.edu	XIxZPkCc8Z2	\N
998	Lawrence	Hansen	1072	lhansenrp@merriam-webster.com	JESMJ0	\N
999	Craig	Morgan	1073	cmorganrq@java.com	9tls5hOD	\N
1000	Jane	Black	1074	jblackrr@howstuffworks.com	JA3AgI3gVP0	\N
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 1000, true);


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
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


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
-- Name: cities_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(country_code);


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

