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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL,
    won boolean DEFAULT false
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 5, 1, false);
INSERT INTO public.games VALUES (2, 5, 32, false);
INSERT INTO public.games VALUES (3, 5, 33, false);
INSERT INTO public.games VALUES (4, 5, 32, false);
INSERT INTO public.games VALUES (5, 5, 32, false);
INSERT INTO public.games VALUES (6, 5, 32, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'KHANH');
INSERT INTO public.users VALUES (2, 'user_1750923123961');
INSERT INTO public.users VALUES (3, 'user_1750923123960');
INSERT INTO public.users VALUES (4, 'khanh');
INSERT INTO public.users VALUES (5, 'user_1750924434196');
INSERT INTO public.users VALUES (6, 'user_1750924434195');
INSERT INTO public.users VALUES (7, 'user_1750926203027');
INSERT INTO public.users VALUES (8, 'user_1750926203026');
INSERT INTO public.users VALUES (9, 'user_1750926964000');
INSERT INTO public.users VALUES (10, 'user_1750926963999');
INSERT INTO public.users VALUES (11, 'user_1750927942764');
INSERT INTO public.users VALUES (12, 'user_1750927942763');
INSERT INTO public.users VALUES (13, 'user_1750927951292');
INSERT INTO public.users VALUES (14, 'user_1750927951291');
INSERT INTO public.users VALUES (15, 'user_1750928727647');
INSERT INTO public.users VALUES (16, 'user_1750928727646');
INSERT INTO public.users VALUES (17, 'user_1750929067424');
INSERT INTO public.users VALUES (18, 'user_1750929067423');
INSERT INTO public.users VALUES (19, 'user_1750929129685');
INSERT INTO public.users VALUES (20, 'user_1750929129684');
INSERT INTO public.users VALUES (21, 'user_1750929254706');
INSERT INTO public.users VALUES (22, 'user_1750929254705');
INSERT INTO public.users VALUES (23, 'user_1750929332694');
INSERT INTO public.users VALUES (24, 'user_1750929332693');
INSERT INTO public.users VALUES (25, 'thanh');
INSERT INTO public.users VALUES (26, 'user_1750929847845');
INSERT INTO public.users VALUES (27, 'user_1750929847844');
INSERT INTO public.users VALUES (28, 'user_1750930174996');
INSERT INTO public.users VALUES (29, 'user_1750930174995');
INSERT INTO public.users VALUES (30, 'user_1750930229872');
INSERT INTO public.users VALUES (31, 'user_1750930229871');
INSERT INTO public.users VALUES (32, 'user_1750930737382');
INSERT INTO public.users VALUES (33, 'user_1750930737381');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 6, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

