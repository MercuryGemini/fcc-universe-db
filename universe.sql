--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_count integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    contains_our_solar_system boolean,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    radius_in_km numeric NOT NULL,
    orbiting_type character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    notes text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric NOT NULL,
    radius_in_km numeric NOT NULL,
    is_in_our_solar_system boolean,
    is_terrestrial boolean NOT NULL,
    star_id integer NOT NULL,
    notes text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(60) NOT NULL,
    launch_date date NOT NULL,
    is_manned boolean,
    weight_in_kg numeric NOT NULL,
    mission_type text NOT NULL,
    notes text,
    planet_id integer NOT NULL
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_count integer NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    radius_in_km numeric NOT NULL,
    galaxy_id integer NOT NULL,
    notes text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200000, 13600, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000, 10000, false, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000, 12000, false, 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 100000, 13250, false, 'Notable dust lane');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100000, 400, false, 'Classic spiral structure');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 30000, 1100, false, 'Satellite of Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 1737, 'regular', 3, 'Earths only moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 11, 'regular', 4, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 6, 'regular', 4, 'Smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 4500, 1821, 'regular', 5, 'Most volcanic body');
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 1560, 'regular', 5, 'Subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 2634, 'regular', 5, 'Largest moon in solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 2410, 'regular', 5, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Titan', 4500, 2574, 'regular', 6, 'Thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500, 252, 'regular', 6, 'Water geysers');
INSERT INTO public.moon VALUES (10, 'Rhea', 4500, 763, 'regular', 6, 'Second largest Saturn moon');
INSERT INTO public.moon VALUES (11, 'Mimas', 4500, 198, 'regular', 6, 'Death Star lookalike');
INSERT INTO public.moon VALUES (12, 'Iapetus', 4500, 734, 'inclined', 6, 'Two-toned coloring');
INSERT INTO public.moon VALUES (13, 'Miranda', 4500, 235, 'inclined', 7, 'Extreme terrain');
INSERT INTO public.moon VALUES (14, 'Ariel', 4500, 578, 'regular', 7, 'Brightest Uranus moon');
INSERT INTO public.moon VALUES (15, 'Umbriel', 4500, 584, 'regular', 7, 'Darkest Uranus moon');
INSERT INTO public.moon VALUES (16, 'Triton', 4500, 1353, 'retrograde', 8, 'Captured moon');
INSERT INTO public.moon VALUES (17, 'Nereid', 4500, 170, 'eccentric', 8, 'Highly eccentric orbit');
INSERT INTO public.moon VALUES (18, 'Proxima b Moon 1', 4850, 400, 'regular', 9, 'Fictional moon');
INSERT INTO public.moon VALUES (19, 'Proxima b Moon 2', 4850, 250, 'inclined', 9, 'Fictional moon');
INSERT INTO public.moon VALUES (20, 'Triangulum Luna', 5000, 600, 'regular', 11, 'Fictional moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 4500, 2439, true, true, 1, 'Closest to Sun');
INSERT INTO public.planet VALUES (2, 'Venus', false, 4500, 6051, true, true, 1, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', true, 4500, 6371, true, true, 1, 'Our home');
INSERT INTO public.planet VALUES (4, 'Mars', false, 4500, 3389, true, true, 1, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 4500, 69911, true, false, 1, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 4500, 58232, true, false, 1, 'Famous rings');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 4500, 25362, true, false, 1, 'Tilted axis');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4500, 24622, true, false, 1, 'Windiest planet');
INSERT INTO public.planet VALUES (9, 'Proxima b', false, 4850, 7150, false, true, 2, 'In habitable zone');
INSERT INTO public.planet VALUES (10, 'Proxima c', false, 4850, 21000, false, false, 2, 'Outer planet');
INSERT INTO public.planet VALUES (11, 'Triangulum Prime', false, 5000, 8500, false, true, 6, 'Fictional planet');
INSERT INTO public.planet VALUES (12, 'Triangulum Secundus', false, 5000, 45000, false, false, 6, 'Fictional gas giant');


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', '1977-09-05', false, 825.5, 'Interstellar exploration', 'Farthest human-made object', 3);
INSERT INTO public.spacecraft VALUES (2, 'Apollo 11', '1969-07-16', true, 43900, 'Lunar landing', 'First humans on Moon', 3);
INSERT INTO public.spacecraft VALUES (3, 'Perseverance', '2020-07-30', false, 1025, 'Mars exploration', 'Searching for ancient life', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 4600, 696340, 1, 'Our star');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 4850, 107280, 1, 'Closest star to Sun');
INSERT INTO public.star VALUES (3, 'Sirius A', 0, 250, 1190000, 1, 'Brightest star in night sky');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 0, 10, 887720000, 1, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (5, 'Alpheratz', 0, 60, 1920000, 2, 'Brightest star in Andromeda');
INSERT INTO public.star VALUES (6, 'Triangulum Star 1', 3, 5000, 800000, 3, 'Fictional star for demo');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: spacecraft spacecraft_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

