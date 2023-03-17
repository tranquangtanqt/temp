--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 11.2

-- Started on 2020-03-31 11:45:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2124 (class 0 OID 16676)
-- Dependencies: 187
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: test
--

INSERT INTO public.employees VALUES (68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL, 1001);
INSERT INTO public.employees VALUES (66928, ' BLAZE   ', ' MANAGER  ', 68319, '1991-05-01', 2750.00, NULL, 1003);
INSERT INTO public.employees VALUES (67832, ' CLARE   ', ' MANAGER  ', 68319, '1991-06-09', 2550.00, NULL, 1001);
INSERT INTO public.employees VALUES (65646, ' JONAS   ', ' MANAGER  ', 68319, '1991-04-02', 2957.00, NULL, 1002);
INSERT INTO public.employees VALUES (67858, ' SCARLET ', ' ANALYST  ', 65646, '1997-04-19', 3100.00, NULL, 1002);
INSERT INTO public.employees VALUES (69062, ' FRANK   ', ' ANALYST  ', 65646, '1991-12-03', 3100.00, NULL, 1002);
INSERT INTO public.employees VALUES (63679, ' SANDRINE ', ' CLERK    ', 69062, '1990-12-18', 900.00, NULL, 1002);
INSERT INTO public.employees VALUES (64989, ' ADELYN  ', ' SALESMAN ', 66928, '1991-02-20', 1700.00, 400.00, 1003);
INSERT INTO public.employees VALUES (65271, ' WADE    ', ' SALESMAN ', 66928, '1991-02-22', 1350.00, 600.00, 1003);
INSERT INTO public.employees VALUES (66564, ' MADDEN  ', ' SALESMAN ', 66928, '1991-09-28', 1350.00, 1500.00, 1003);
INSERT INTO public.employees VALUES (68454, ' TUCKER  ', ' SALESMAN ', 66928, '1991-09-08', 1600.00, 0.00, 1003);
INSERT INTO public.employees VALUES (68736, ' ADNRES  ', ' CLERK    ', 67858, '1997-05-23', 1200.00, NULL, 1002);
INSERT INTO public.employees VALUES (69000, ' JULIUS  ', ' CLERK    ', 66928, '1991-12-03', 1050.00, NULL, 1003);
INSERT INTO public.employees VALUES (69324, ' MARKER  ', ' CLERK    ', 67832, '1992-01-23', 1400.00, NULL, 1001);


-- Completed on 2020-03-31 11:45:11

--
-- PostgreSQL database dump complete
--

