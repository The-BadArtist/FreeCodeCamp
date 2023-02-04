--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    galaxy_type text NOT NULL,
    distance_from_earth numeric NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    planet_id integer
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    fun_fact text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_type character varying(30) NOT NULL,
    distance_from_earth integer,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and Earth', 13610, 'spiral galaxy', 0.0267);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Closest big galaxy to the Milky Way', 10010, 'spiral galaxy', 2.537);
INSERT INTO public.galaxy VALUES (3, 'Condor Galaxy', 'The largest known galaxy', 5003, 'barred sprial galaxy', 212);
INSERT INTO public.galaxy VALUES (4, 'Antennae Galaxy', 'Shaped like an insects antennae', 300, 'spiral galaxy', 45);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'Similar in shape to a cigar', 13300, 'starburst galaxy', 11.42);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'Has a dark band of absorbing dust in front of its nucleus', 13280, 'spiral galaxy', 24.01);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths sole natural satellite and largest celestrial body', false, true, 4530, 0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars innermost and larger natural satellite', false, false, 4503, 48, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars smaller and outermost natural satellite', false, false, 4503, 48, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Known as Jupiter II, smalleset of the four Galileon moons', false, true, 4503, 390, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest and most massive of the Solar Systems moons', false, true, 4503, 390, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Known as Jupiter I, the innermost and third largest of the Galilean moons', false, true, 4503, 390, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Known as Jupiter IV, Said to be the oldeset moon in our Solar System', false, true, 4503, 390, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, and second largest in our Solar System', false, true, 4003, 746, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'One of the most reflective bodies of the Solar System', false, true, 1000, 790, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Is designated as Saturn I, looks like Star Wars DeathStar', false, true, 4100, 790, 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', 'Known as Saturn VII, Irregular shape with a spongelike appeareance', false, false, 4500, 10013, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 'Known as Uranus III, the largest of of Uranus moons', false, true, 4600, 1692, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'The darkest of the largest moon of Uranus', false, true, -1, -1, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Orbits and rotates in the equatorial plane of Uranus', false, true, 100, -1, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'The smallest and innermost of Uranus round natural satellite', false, true, 100, 1692, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 'The coldest surface in our Solar System', false, true, 4503, 2696, 8);
INSERT INTO public.moon VALUES (17, 'Thalassa', 'Unusual for an irregular moon', false, false, -1, -1, 8);
INSERT INTO public.moon VALUES (18, 'Hippocamp', 'Smallest known moon of Neptune', false, false, 4000, 3000, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Second largest Neptunian moon, and largest inner satellite', false, false, -1, -1, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Known as Pluto I, Largest known satellite relative to its parent body', false, true, -1, -1, 12);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Earth', 1, 'Earth is not flat, but its not perfectly round either');
INSERT INTO public.more_info VALUES (2, 'Mars', 4, 'Mars is known as the red planet');
INSERT INTO public.more_info VALUES (3, 'Pluto', 12, 'Pluto is smaller than earths moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet the host life', true, true, 4543, 'Terrestrial', 0, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Closest planet to the sun', false, true, 4503, 'Terrestrial', 96, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The hottest planet in our Solar System', false, true, 4503, 'Terrestrial', 139, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'We had more missions to Mars than any other planet', false, true, 4603, 'Terrestrial', 82, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The biggest planet in our Solar System', false, false, 4603, 'Gas Giant', 509, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet of our Solar System', false, false, 4503, 'Gas Giant', 1821, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The smallest of the Gas Giants', false, false, 4503, 'Gas Giant', 2848, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Has the most moons in our Solar System and known for its rings', false, false, 4503, 'Gas Giant', 1001, 1);
INSERT INTO public.planet VALUES (12, 'Pluto', 'A small planet in the Kuiper Belt, beyond the orbit of Neptune', false, true, 4600, 'dwarf', 33139, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'An exoplanet said to be orbiting in the habitable zone or Proxima Centauri', false, true, 4853, 'super Earth exoplanet', -1, 2);
INSERT INTO public.planet VALUES (10, 'Proxima d', 'An exoplanet closest to Proxima Centauri', false, true, 4853, 'candidate exoplanet', -1, 2);
INSERT INTO public.planet VALUES (11, 'Proxima c', 'An exoplanet closest to Proxima Centauri', false, true, 4853, 'candidate super Earth', -1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A small, low-mass star part of the Centaurus Constellation', 4853, 4.246, 1);
INSERT INTO public.star VALUES (1, 'Sun', 'The star in the center of our Solar System', 4603, 0.0001, 1);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 'The brightest star in the constellation of Andromeda when Beta Andromedae undergoes periodical dimming', 60, 96.87, 2);
INSERT INTO public.star VALUES (5, 'Beta Andromedae', 'The prominent star in the constellation of Andromeda', -1, 197, 2);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'One of the largest start with a visible naked eye', 10, 642.5, 1);
INSERT INTO public.star VALUES (7, 'Vega', 'The brightest star in the northern constellation of Lyra', 455, 25.05, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_info planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

