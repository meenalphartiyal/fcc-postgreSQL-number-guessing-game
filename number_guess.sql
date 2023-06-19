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
-- Name: game_play; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_play (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    game_played integer,
    best_game integer
);


ALTER TABLE public.game_play OWNER TO freecodecamp;

--
-- Name: game_play_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_play_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_play_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_play_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_play_game_id_seq OWNED BY public.game_play.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL
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
-- Name: game_play game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_play ALTER COLUMN game_id SET DEFAULT nextval('public.game_play_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_play; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_play VALUES (1, 1, 2, 571);
INSERT INTO public.game_play VALUES (3, 3, 2, 571);
INSERT INTO public.game_play VALUES (2, 2, 5, 571);
INSERT INTO public.game_play VALUES (5, 5, 2, 571);
INSERT INTO public.game_play VALUES (4, 4, 5, 571);
INSERT INTO public.game_play VALUES (7, 7, 2, 571);
INSERT INTO public.game_play VALUES (6, 6, 5, 571);
INSERT INTO public.game_play VALUES (9, 9, 2, 571);
INSERT INTO public.game_play VALUES (8, 8, 5, 571);
INSERT INTO public.game_play VALUES (11, 11, 2, 571);
INSERT INTO public.game_play VALUES (10, 10, 5, 571);
INSERT INTO public.game_play VALUES (13, 13, 2, 571);
INSERT INTO public.game_play VALUES (12, 12, 5, 571);
INSERT INTO public.game_play VALUES (15, 15, 2, 571);
INSERT INTO public.game_play VALUES (14, 14, 5, 460);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Meenal');
INSERT INTO public.users VALUES (2, 'user_1687160736363');
INSERT INTO public.users VALUES (3, 'user_1687160736362');
INSERT INTO public.users VALUES (4, 'user_1687161304857');
INSERT INTO public.users VALUES (5, 'user_1687161304856');
INSERT INTO public.users VALUES (6, 'user_1687161624320');
INSERT INTO public.users VALUES (7, 'user_1687161624319');
INSERT INTO public.users VALUES (8, 'user_1687161667231');
INSERT INTO public.users VALUES (9, 'user_1687161667230');
INSERT INTO public.users VALUES (10, 'user_1687161685263');
INSERT INTO public.users VALUES (11, 'user_1687161685262');
INSERT INTO public.users VALUES (12, 'user_1687161743367');
INSERT INTO public.users VALUES (13, 'user_1687161743366');
INSERT INTO public.users VALUES (14, 'user_1687161781132');
INSERT INTO public.users VALUES (15, 'user_1687161781131');


--
-- Name: game_play_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_play_game_id_seq', 15, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: game_play game_play_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_play
    ADD CONSTRAINT game_play_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: game_play game_play_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_play
    ADD CONSTRAINT game_play_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

