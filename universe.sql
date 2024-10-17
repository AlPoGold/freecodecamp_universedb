--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying NOT NULL,
    type text,
    number_of_stars integer NOT NULL,
    is_visible boolean NOT NULL,
    diameter numeric,
    description text
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
    name character varying NOT NULL,
    planet_id integer,
    diameter numeric,
    is_geologically_active boolean NOT NULL,
    discovered_year integer,
    description text
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
    name character varying NOT NULL,
    star_id integer,
    diameter numeric,
    has_life boolean NOT NULL,
    orbital_period numeric,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    orbital_distance numeric NOT NULL,
    orbital_period numeric,
    synchronous_rotation boolean NOT NULL,
    description text,
    name character varying(30)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    temperature integer,
    is_main_sequence boolean NOT NULL,
    description text
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
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, true, 100, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000, true, 220, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000, true, 60, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 800, false, 50, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 160000, true, 76, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 30000, true, 14, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 34, true, -4000, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 1877, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 1877, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 31, true, 1610, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 52, true, 1610, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 48, true, 1610, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 7, 51, true, 1655, NULL);
INSERT INTO public.moon VALUES (8, 'Triton', 8, 27, true, 1846, NULL);
INSERT INTO public.moon VALUES (9, 'Charon', 9, 12, false, 1978, NULL);
INSERT INTO public.moon VALUES (10, 'Io', 3, 36, true, 1610, NULL);
INSERT INTO public.moon VALUES (11, 'Enceladus', 7, 5, true, 1789, NULL);
INSERT INTO public.moon VALUES (12, 'Titania', 8, 15, false, 1787, NULL);
INSERT INTO public.moon VALUES (13, 'Oberon', 8, 15, false, 1787, NULL);
INSERT INTO public.moon VALUES (14, 'Mimas', 7, 3, false, 1789, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', 7, 15, false, 1672, NULL);
INSERT INTO public.moon VALUES (16, 'Iapetus', 7, 14, false, 1671, NULL);
INSERT INTO public.moon VALUES (17, 'Tethys', 7, 10, false, 1684, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', 8, 4, false, 1948, NULL);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 3, false, 1949, NULL);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 4, false, 1989, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 127, true, 1.0, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 68, false, 1.88, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 140, false, 11.86, NULL);
INSERT INTO public.planet VALUES (4, 'Proxima b', 4, 119, false, 0.05, NULL);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 2, 204, false, 289.9, NULL);
INSERT INTO public.planet VALUES (6, 'Gliese 581g', 4, 140, false, 36.6, NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 116, false, 29.46, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49, false, 164.8, NULL);
INSERT INTO public.planet VALUES (9, 'Pandora', 3, 103, false, 1.2, NULL);
INSERT INTO public.planet VALUES (10, 'Hoth', 3, 72, false, 0.5, NULL);
INSERT INTO public.planet VALUES (11, 'Vulcan', 2, 134, false, 0.3, NULL);
INSERT INTO public.planet VALUES (12, 'Dagobah', 5, 68, false, 0.4, NULL);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 1, 1, 384, 27.3, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (2, 2, 2, 94, 0.3, false, NULL, NULL);
INSERT INTO public.planet_moon VALUES (3, 2, 3, 234, 1.3, false, NULL, NULL);
INSERT INTO public.planet_moon VALUES (4, 3, 4, 671, 3.5, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (5, 3, 5, 1070, 7.2, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (6, 3, 6, 882, 16.7, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (7, 7, 7, 1222, 15.9, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (8, 8, 8, 355, 5.9, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (9, 9, 9, 20, 6.4, true, NULL, NULL);
INSERT INTO public.planet_moon VALUES (10, 3, 10, 422, 1.8, true, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 5778, true, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.1, 994, true, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 20.0, 350, false, NULL);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 0.123, 304, true, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 21.0, 1200, false, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 2, 2.14, 960, true, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet_moon planet_moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_description_key UNIQUE (description);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

