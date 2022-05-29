--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 14.2

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
-- Name: role; Type: TYPE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TYPE public.role AS ENUM (
    'mahasiswa',
    'non-mahasiswa'
);


ALTER TYPE public.role OWNER TO mraihanazhari_sbd;

--
-- Name: update_lastmodified_column(); Type: FUNCTION; Schema: public; Owner: kel_6
--

CREATE FUNCTION public.update_lastmodified_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    NEW.submit_time = (EXTRACT(EPOCH from NOW())*1000);
    RETURN NEW;
  END;
$$;


ALTER FUNCTION public.update_lastmodified_column() OWNER TO kel_6;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: berisi_organisasi; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.berisi_organisasi (
    jurusan_id bigint NOT NULL,
    organisasi_id bigint NOT NULL
);


ALTER TABLE public.berisi_organisasi OWNER TO mraihanazhari_sbd;

--
-- Name: berisi_organisasi_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.berisi_organisasi_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berisi_organisasi_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: berisi_organisasi_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.berisi_organisasi_jurusan_id_seq OWNED BY public.berisi_organisasi.jurusan_id;


--
-- Name: berisi_organisasi_organisasi_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.berisi_organisasi_organisasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berisi_organisasi_organisasi_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: berisi_organisasi_organisasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.berisi_organisasi_organisasi_id_seq OWNED BY public.berisi_organisasi.organisasi_id;


--
-- Name: berkegiatan; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.berkegiatan (
    jurusan_id bigint NOT NULL,
    kegiatan_id bigint NOT NULL
);


ALTER TABLE public.berkegiatan OWNER TO mraihanazhari_sbd;

--
-- Name: berkegiatan_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.berkegiatan_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berkegiatan_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: berkegiatan_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.berkegiatan_jurusan_id_seq OWNED BY public.berkegiatan.jurusan_id;


--
-- Name: berkegiatan_kegiatan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.berkegiatan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berkegiatan_kegiatan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: berkegiatan_kegiatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.berkegiatan_kegiatan_id_seq OWNED BY public.berkegiatan.kegiatan_id;


--
-- Name: berprospek; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.berprospek (
    jurusan_id bigint NOT NULL,
    karir_id bigint NOT NULL
);


ALTER TABLE public.berprospek OWNER TO mraihanazhari_sbd;

--
-- Name: berprospek_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.berprospek_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berprospek_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: berprospek_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.berprospek_jurusan_id_seq OWNED BY public.berprospek.jurusan_id;


--
-- Name: berprospek_karir_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.berprospek_karir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berprospek_karir_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: berprospek_karir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.berprospek_karir_id_seq OWNED BY public.berprospek.karir_id;


--
-- Name: bertanya; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.bertanya (
    user_id bigint NOT NULL,
    pertanyaan_id bigint NOT NULL
);


ALTER TABLE public.bertanya OWNER TO mraihanazhari_sbd;

--
-- Name: bertanya_pertanyaan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.bertanya_pertanyaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bertanya_pertanyaan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: bertanya_pertanyaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.bertanya_pertanyaan_id_seq OWNED BY public.bertanya.pertanyaan_id;


--
-- Name: bertanya_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.bertanya_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bertanya_user_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: bertanya_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.bertanya_user_id_seq OWNED BY public.bertanya.user_id;


--
-- Name: departemen; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.departemen (
    departemen_id bigint NOT NULL,
    nama character varying(40) NOT NULL
);


ALTER TABLE public.departemen OWNER TO mraihanazhari_sbd;

--
-- Name: departemen_departemen_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.departemen_departemen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departemen_departemen_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: departemen_departemen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.departemen_departemen_id_seq OWNED BY public.departemen.departemen_id;


--
-- Name: jawaban; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.jawaban (
    jawaban_id bigint NOT NULL,
    text character varying(1000) NOT NULL,
    submit_time bigint
);


ALTER TABLE public.jawaban OWNER TO mraihanazhari_sbd;

--
-- Name: jawaban_jawaban_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.jawaban_jawaban_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jawaban_jawaban_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: jawaban_jawaban_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.jawaban_jawaban_id_seq OWNED BY public.jawaban.jawaban_id;


--
-- Name: jurusan; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.jurusan (
    jurusan_id bigint NOT NULL,
    nama character varying(40) NOT NULL,
    daya_tampung smallint NOT NULL,
    kuota_snmptn smallint,
    kuota_sbmptn smallint,
    kuota_simakui smallint,
    kuota_ppkb smallint,
    kuota_ts smallint
);


ALTER TABLE public.jurusan OWNER TO mraihanazhari_sbd;

--
-- Name: jurusan_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.jurusan_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jurusan_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: jurusan_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.jurusan_jurusan_id_seq OWNED BY public.jurusan.jurusan_id;


--
-- Name: karir; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.karir (
    karir_id bigint NOT NULL,
    nama character varying(40) NOT NULL
);


ALTER TABLE public.karir OWNER TO mraihanazhari_sbd;

--
-- Name: karir_karir_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.karir_karir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karir_karir_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: karir_karir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.karir_karir_id_seq OWNED BY public.karir.karir_id;


--
-- Name: kegiatan; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.kegiatan (
    kegiatan_id bigint NOT NULL,
    nama character varying(40) NOT NULL
);


ALTER TABLE public.kegiatan OWNER TO mraihanazhari_sbd;

--
-- Name: kegiatan_kegiatan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.kegiatan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kegiatan_kegiatan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: kegiatan_kegiatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.kegiatan_kegiatan_id_seq OWNED BY public.kegiatan.kegiatan_id;


--
-- Name: kurikulum; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.kurikulum (
    kurikulum_id bigint NOT NULL,
    nama character varying(40) NOT NULL
);


ALTER TABLE public.kurikulum OWNER TO mraihanazhari_sbd;

--
-- Name: kurikulum_kurikulum_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.kurikulum_kurikulum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kurikulum_kurikulum_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: kurikulum_kurikulum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.kurikulum_kurikulum_id_seq OWNED BY public.kurikulum.kurikulum_id;


--
-- Name: menjawab; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.menjawab (
    user_id bigint NOT NULL,
    jawaban_id bigint NOT NULL
);


ALTER TABLE public.menjawab OWNER TO mraihanazhari_sbd;

--
-- Name: menjawab_jawaban_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.menjawab_jawaban_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menjawab_jawaban_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: menjawab_jawaban_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.menjawab_jawaban_id_seq OWNED BY public.menjawab.jawaban_id;


--
-- Name: menjawab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.menjawab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menjawab_user_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: menjawab_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.menjawab_user_id_seq OWNED BY public.menjawab.user_id;


--
-- Name: mewadahi; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.mewadahi (
    departemen_id bigint NOT NULL,
    jurusan_id bigint NOT NULL
);


ALTER TABLE public.mewadahi OWNER TO mraihanazhari_sbd;

--
-- Name: mewadahi_departemen_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.mewadahi_departemen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mewadahi_departemen_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: mewadahi_departemen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.mewadahi_departemen_id_seq OWNED BY public.mewadahi.departemen_id;


--
-- Name: mewadahi_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.mewadahi_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mewadahi_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: mewadahi_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.mewadahi_jurusan_id_seq OWNED BY public.mewadahi.jurusan_id;


--
-- Name: organisasi; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.organisasi (
    organisasi_id bigint NOT NULL,
    nama character varying(40) NOT NULL
);


ALTER TABLE public.organisasi OWNER TO mraihanazhari_sbd;

--
-- Name: organisasi_organisasi_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.organisasi_organisasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organisasi_organisasi_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: organisasi_organisasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.organisasi_organisasi_id_seq OWNED BY public.organisasi.organisasi_id;


--
-- Name: pertanyaan; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.pertanyaan (
    pertanyaan_id bigint NOT NULL,
    judul character varying(50),
    text text,
    submit_time bigint
);


ALTER TABLE public.pertanyaan OWNER TO mraihanazhari_sbd;

--
-- Name: pertanyaan_dari; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.pertanyaan_dari (
    jawaban_id bigint NOT NULL,
    pertanyaan_id bigint NOT NULL
);


ALTER TABLE public.pertanyaan_dari OWNER TO mraihanazhari_sbd;

--
-- Name: pertanyaan_dari_jawaban_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.pertanyaan_dari_jawaban_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pertanyaan_dari_jawaban_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: pertanyaan_dari_jawaban_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.pertanyaan_dari_jawaban_id_seq OWNED BY public.pertanyaan_dari.jawaban_id;


--
-- Name: pertanyaan_dari_pertanyaan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.pertanyaan_dari_pertanyaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pertanyaan_dari_pertanyaan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: pertanyaan_dari_pertanyaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.pertanyaan_dari_pertanyaan_id_seq OWNED BY public.pertanyaan_dari.pertanyaan_id;


--
-- Name: pertanyaan_pertanyaan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.pertanyaan_pertanyaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pertanyaan_pertanyaan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: pertanyaan_pertanyaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.pertanyaan_pertanyaan_id_seq OWNED BY public.pertanyaan.pertanyaan_id;


--
-- Name: punya_kurikulum; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.punya_kurikulum (
    jurusan_id bigint NOT NULL,
    kurikulum_id bigint NOT NULL
);


ALTER TABLE public.punya_kurikulum OWNER TO mraihanazhari_sbd;

--
-- Name: punya_kurikulum_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.punya_kurikulum_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.punya_kurikulum_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: punya_kurikulum_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.punya_kurikulum_jurusan_id_seq OWNED BY public.punya_kurikulum.jurusan_id;


--
-- Name: punya_kurikulum_kurikulum_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.punya_kurikulum_kurikulum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.punya_kurikulum_kurikulum_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: punya_kurikulum_kurikulum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.punya_kurikulum_kurikulum_id_seq OWNED BY public.punya_kurikulum.kurikulum_id;


--
-- Name: user_reg; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.user_reg (
    user_id bigint NOT NULL,
    username character varying(36) NOT NULL,
    password character varying(60) NOT NULL,
    role public.role NOT NULL,
    reg_time bigint
);


ALTER TABLE public.user_reg OWNER TO mraihanazhari_sbd;

--
-- Name: user_reg_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.user_reg_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_reg_user_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: user_reg_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.user_reg_user_id_seq OWNED BY public.user_reg.user_id;


--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TABLE public.wishlist (
    user_id bigint NOT NULL,
    jurusan_id bigint NOT NULL
);


ALTER TABLE public.wishlist OWNER TO mraihanazhari_sbd;

--
-- Name: wishlist_jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.wishlist_jurusan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlist_jurusan_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: wishlist_jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.wishlist_jurusan_id_seq OWNED BY public.wishlist.jurusan_id;


--
-- Name: wishlist_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mraihanazhari_sbd
--

CREATE SEQUENCE public.wishlist_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlist_user_id_seq OWNER TO mraihanazhari_sbd;

--
-- Name: wishlist_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mraihanazhari_sbd
--

ALTER SEQUENCE public.wishlist_user_id_seq OWNED BY public.wishlist.user_id;


--
-- Name: berisi_organisasi jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berisi_organisasi ALTER COLUMN jurusan_id SET DEFAULT nextval('public.berisi_organisasi_jurusan_id_seq'::regclass);


--
-- Name: berisi_organisasi organisasi_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berisi_organisasi ALTER COLUMN organisasi_id SET DEFAULT nextval('public.berisi_organisasi_organisasi_id_seq'::regclass);


--
-- Name: berkegiatan jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berkegiatan ALTER COLUMN jurusan_id SET DEFAULT nextval('public.berkegiatan_jurusan_id_seq'::regclass);


--
-- Name: berkegiatan kegiatan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berkegiatan ALTER COLUMN kegiatan_id SET DEFAULT nextval('public.berkegiatan_kegiatan_id_seq'::regclass);


--
-- Name: berprospek jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berprospek ALTER COLUMN jurusan_id SET DEFAULT nextval('public.berprospek_jurusan_id_seq'::regclass);


--
-- Name: berprospek karir_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berprospek ALTER COLUMN karir_id SET DEFAULT nextval('public.berprospek_karir_id_seq'::regclass);


--
-- Name: bertanya user_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.bertanya ALTER COLUMN user_id SET DEFAULT nextval('public.bertanya_user_id_seq'::regclass);


--
-- Name: bertanya pertanyaan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.bertanya ALTER COLUMN pertanyaan_id SET DEFAULT nextval('public.bertanya_pertanyaan_id_seq'::regclass);


--
-- Name: departemen departemen_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.departemen ALTER COLUMN departemen_id SET DEFAULT nextval('public.departemen_departemen_id_seq'::regclass);


--
-- Name: jawaban jawaban_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.jawaban ALTER COLUMN jawaban_id SET DEFAULT nextval('public.jawaban_jawaban_id_seq'::regclass);


--
-- Name: jurusan jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.jurusan ALTER COLUMN jurusan_id SET DEFAULT nextval('public.jurusan_jurusan_id_seq'::regclass);


--
-- Name: karir karir_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.karir ALTER COLUMN karir_id SET DEFAULT nextval('public.karir_karir_id_seq'::regclass);


--
-- Name: kegiatan kegiatan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.kegiatan ALTER COLUMN kegiatan_id SET DEFAULT nextval('public.kegiatan_kegiatan_id_seq'::regclass);


--
-- Name: kurikulum kurikulum_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.kurikulum ALTER COLUMN kurikulum_id SET DEFAULT nextval('public.kurikulum_kurikulum_id_seq'::regclass);


--
-- Name: menjawab user_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.menjawab ALTER COLUMN user_id SET DEFAULT nextval('public.menjawab_user_id_seq'::regclass);


--
-- Name: menjawab jawaban_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.menjawab ALTER COLUMN jawaban_id SET DEFAULT nextval('public.menjawab_jawaban_id_seq'::regclass);


--
-- Name: mewadahi departemen_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.mewadahi ALTER COLUMN departemen_id SET DEFAULT nextval('public.mewadahi_departemen_id_seq'::regclass);


--
-- Name: mewadahi jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.mewadahi ALTER COLUMN jurusan_id SET DEFAULT nextval('public.mewadahi_jurusan_id_seq'::regclass);


--
-- Name: organisasi organisasi_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.organisasi ALTER COLUMN organisasi_id SET DEFAULT nextval('public.organisasi_organisasi_id_seq'::regclass);


--
-- Name: pertanyaan pertanyaan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.pertanyaan ALTER COLUMN pertanyaan_id SET DEFAULT nextval('public.pertanyaan_pertanyaan_id_seq'::regclass);


--
-- Name: pertanyaan_dari jawaban_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.pertanyaan_dari ALTER COLUMN jawaban_id SET DEFAULT nextval('public.pertanyaan_dari_jawaban_id_seq'::regclass);


--
-- Name: pertanyaan_dari pertanyaan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.pertanyaan_dari ALTER COLUMN pertanyaan_id SET DEFAULT nextval('public.pertanyaan_dari_pertanyaan_id_seq'::regclass);


--
-- Name: punya_kurikulum jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.punya_kurikulum ALTER COLUMN jurusan_id SET DEFAULT nextval('public.punya_kurikulum_jurusan_id_seq'::regclass);


--
-- Name: punya_kurikulum kurikulum_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.punya_kurikulum ALTER COLUMN kurikulum_id SET DEFAULT nextval('public.punya_kurikulum_kurikulum_id_seq'::regclass);


--
-- Name: user_reg user_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.user_reg ALTER COLUMN user_id SET DEFAULT nextval('public.user_reg_user_id_seq'::regclass);


--
-- Name: wishlist user_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN user_id SET DEFAULT nextval('public.wishlist_user_id_seq'::regclass);


--
-- Name: wishlist jurusan_id; Type: DEFAULT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN jurusan_id SET DEFAULT nextval('public.wishlist_jurusan_id_seq'::regclass);


--
-- Data for Name: berisi_organisasi; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.berisi_organisasi (jurusan_id, organisasi_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
10	2
11	2
12	2
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
30	2
31	2
18	3
28	3
14	3
31	3
15	4
29	4
17	4
23	4
10	5
13	5
19	5
22	5
24	5
16	6
27	6
8	7
9	7
21	7
25	7
12	8
20	8
30	8
11	9
26	9
1	1
2	1
3	1
4	1
5	1
6	1
7	1
1	11
2	11
3	11
4	11
5	11
6	11
7	11
8	11
9	11
10	11
11	11
12	11
13	11
14	11
15	11
16	11
17	11
18	11
19	11
20	11
21	11
22	11
23	11
24	11
25	11
26	11
27	11
28	11
29	11
30	11
31	11
1	12
2	12
3	12
4	12
5	12
6	12
7	12
8	12
9	12
10	12
11	12
12	12
13	12
14	12
15	12
16	12
17	12
18	12
19	12
20	12
21	12
22	12
23	12
24	12
25	12
26	12
27	12
28	12
29	12
30	12
31	12
1	13
2	13
3	13
4	13
5	13
6	13
7	13
8	13
9	13
10	13
11	13
12	13
13	13
14	13
15	13
16	13
17	13
18	13
19	13
20	13
21	13
22	13
23	13
24	13
25	13
26	13
27	13
28	13
29	13
30	13
31	13
1	14
2	14
3	14
4	14
5	14
6	14
7	14
8	14
9	14
10	14
11	14
12	14
13	14
14	14
15	14
16	14
17	14
18	14
19	14
20	14
21	14
22	14
23	14
24	14
25	14
26	14
27	14
28	14
29	14
30	14
31	14
1	15
2	15
3	15
4	15
5	15
6	15
7	15
8	15
9	15
10	15
11	15
12	15
13	15
14	15
15	15
16	15
17	15
18	15
19	15
20	15
21	15
22	15
23	15
24	15
25	15
26	15
27	15
28	15
29	15
30	15
31	15
1	16
2	16
3	16
4	16
5	16
6	16
7	16
8	16
9	16
10	16
11	16
12	16
13	16
14	16
15	16
16	16
17	16
18	16
19	16
20	16
21	16
22	16
23	16
24	16
25	16
26	16
27	16
28	16
29	16
30	16
31	16
1	17
2	17
3	17
4	17
5	17
6	17
7	17
8	17
9	17
10	17
11	17
12	17
13	17
14	17
15	17
16	17
17	17
18	17
19	17
20	17
21	17
22	17
23	17
24	17
25	17
26	17
27	17
28	17
29	17
30	17
31	17
1	18
2	18
3	18
4	18
5	18
6	18
7	18
8	18
9	18
10	18
11	18
12	18
13	18
14	18
15	18
16	18
17	18
18	18
19	18
20	18
21	18
22	18
23	18
24	18
25	18
26	18
27	18
28	18
29	18
30	18
31	18
1	19
2	19
3	19
4	19
5	19
6	19
7	19
8	19
9	19
10	19
11	19
12	19
13	19
14	19
15	19
16	19
17	19
18	19
19	19
20	19
21	19
22	19
23	19
24	19
25	19
26	19
27	19
28	19
29	19
30	19
31	19
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
10	2
11	2
12	2
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
30	2
31	2
1	21
2	21
3	21
4	21
5	21
6	21
7	21
8	21
9	21
10	21
11	21
12	21
13	21
14	21
15	21
16	21
17	21
18	21
19	21
20	21
21	21
22	21
23	21
24	21
25	21
26	21
27	21
28	21
29	21
30	21
31	21
1	22
2	22
3	22
4	22
5	22
6	22
7	22
8	22
9	22
10	22
11	22
12	22
13	22
14	22
15	22
16	22
17	22
18	22
19	22
20	22
21	22
22	22
23	22
24	22
25	22
26	22
27	22
28	22
29	22
30	22
31	22
1	23
2	23
3	23
4	23
5	23
6	23
7	23
8	23
9	23
10	23
11	23
12	23
13	23
14	23
15	23
16	23
17	23
18	23
19	23
20	23
21	23
22	23
23	23
24	23
25	23
26	23
27	23
28	23
29	23
30	23
31	23
1	24
2	24
3	24
4	24
5	24
6	24
7	24
8	24
9	24
10	24
11	24
12	24
13	24
14	24
15	24
16	24
17	24
18	24
19	24
20	24
21	24
22	24
23	24
24	24
25	24
26	24
27	24
28	24
29	24
30	24
31	24
1	25
2	25
3	25
4	25
5	25
6	25
7	25
8	25
9	25
10	25
11	25
12	25
13	25
14	25
15	25
16	25
17	25
18	25
19	25
20	25
21	25
22	25
23	25
24	25
25	25
26	25
27	25
28	25
29	25
30	25
31	25
1	26
2	26
3	26
4	26
5	26
6	26
7	26
8	26
9	26
10	26
11	26
12	26
13	26
14	26
15	26
16	26
17	26
18	26
19	26
20	26
21	26
22	26
23	26
24	26
25	26
26	26
27	26
28	26
29	26
30	26
31	26
1	27
2	27
3	27
4	27
5	27
6	27
7	27
8	27
9	27
10	27
11	27
12	27
13	27
14	27
15	27
16	27
17	27
18	27
19	27
20	27
21	27
22	27
23	27
24	27
25	27
26	27
27	27
28	27
29	27
30	27
31	27
1	28
2	28
3	28
4	28
5	28
6	28
7	28
8	28
9	28
10	28
11	28
12	28
13	28
14	28
15	28
16	28
17	28
18	28
19	28
20	28
21	28
22	28
23	28
24	28
25	28
26	28
27	28
28	28
29	28
30	28
31	28
2	29
10	29
13	29
19	29
22	29
24	29
2	3
10	3
13	3
19	3
22	3
24	3
19	31
7	32
11	32
26	32
5	33
16	33
27	33
4	34
15	34
17	34
23	34
29	34
1	35
2	35
3	35
4	35
5	35
6	35
7	35
8	35
9	35
10	35
11	35
12	35
13	35
14	35
15	35
16	35
17	35
18	35
19	35
20	35
21	35
22	35
23	35
24	35
25	35
26	35
27	35
28	35
29	35
30	35
31	35
1	36
2	36
3	36
4	36
5	36
6	36
7	36
8	36
9	36
10	36
11	36
12	36
13	36
14	36
15	36
16	36
17	36
18	36
19	36
20	36
21	36
22	36
23	36
24	36
25	36
26	36
27	36
28	36
29	36
30	36
31	36
1	37
2	37
3	37
4	37
5	37
6	37
7	37
8	37
9	37
10	37
11	37
12	37
13	37
14	37
15	37
16	37
17	37
18	37
19	37
20	37
21	37
22	37
23	37
24	37
25	37
26	37
27	37
28	37
29	37
30	37
31	37
2	38
10	38
13	38
19	38
22	38
24	38
3	39
12	39
20	39
30	39
\.


--
-- Data for Name: berkegiatan; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.berkegiatan (jurusan_id, kegiatan_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
2	1
2	2
2	3
2	4
2	5
2	6
3	1
3	2
3	3
3	4
3	5
3	6
4	1
4	2
4	3
4	4
4	5
4	6
5	1
5	2
5	3
5	4
5	5
5	6
6	1
6	2
6	3
6	4
6	5
6	6
7	1
7	2
7	3
7	4
7	5
7	6
8	1
8	2
8	3
8	4
8	5
8	6
1	7
1	8
2	7
2	8
3	7
3	8
4	7
4	8
5	7
5	8
6	7
6	8
1	9
1	1
8	9
8	1
9	9
9	1
21	9
21	1
25	9
25	1
1	24
8	24
9	24
21	24
25	24
11	7
12	7
13	7
23	7
28	7
11	11
12	11
13	11
23	11
28	11
11	26
12	26
13	26
23	26
28	26
14	1
14	2
14	3
14	4
14	5
14	6
15	1
15	2
15	3
15	4
15	5
15	6
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
10	2
11	2
12	2
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
30	2
31	2
1	3
2	3
3	3
4	3
5	3
6	3
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
18	3
19	3
20	3
21	3
22	3
23	3
24	3
25	3
26	3
27	3
28	3
29	3
30	3
31	3
1	4
2	4
3	4
4	4
5	4
6	4
7	4
8	4
9	4
10	4
11	4
12	4
13	4
14	4
15	4
16	4
17	4
18	4
19	4
20	4
21	4
22	4
23	4
24	4
25	4
26	4
27	4
28	4
29	4
30	4
31	4
1	5
2	5
3	5
4	5
5	5
6	5
7	5
8	5
9	5
10	5
11	5
12	5
13	5
14	5
15	5
16	5
17	5
18	5
19	5
20	5
21	5
22	5
23	5
24	5
25	5
26	5
27	5
28	5
29	5
30	5
31	5
1	6
2	6
3	6
4	6
5	6
6	6
7	6
8	6
9	6
10	6
11	6
12	6
13	6
14	6
15	6
16	6
17	6
18	6
19	6
20	6
21	6
22	6
23	6
24	6
25	6
26	6
27	6
28	6
29	6
30	6
31	6
1	7
2	7
3	7
4	7
5	7
6	7
7	7
8	7
9	7
10	7
11	7
12	7
13	7
14	7
15	7
16	7
17	7
18	7
19	7
20	7
21	7
22	7
23	7
24	7
25	7
26	7
27	7
28	7
29	7
30	7
31	7
1	8
2	8
3	8
4	8
5	8
6	8
7	8
8	8
9	8
10	8
11	8
12	8
13	8
14	8
15	8
16	8
17	8
18	8
19	8
20	8
21	8
22	8
23	8
24	8
25	8
26	8
27	8
28	8
29	8
30	8
31	8
1	14
2	14
3	14
4	14
5	14
6	14
7	14
8	14
9	14
10	14
11	14
12	14
13	14
14	14
15	14
16	14
17	14
18	14
19	14
20	14
21	14
22	14
23	14
24	14
25	14
26	14
27	14
28	14
29	14
30	14
31	14
1	15
2	15
3	15
4	15
5	15
6	15
7	15
8	15
9	15
10	15
11	15
12	15
13	15
14	15
15	15
16	15
17	15
18	15
19	15
20	15
21	15
22	15
23	15
24	15
25	15
26	15
27	15
28	15
29	15
30	15
31	15
18	16
28	16
6	25
18	25
28	25
15	17
29	17
17	17
23	17
10	18
10	19
10	2
10	21
10	22
10	26
10	27
10	28
10	3
22	18
22	19
22	2
22	21
22	22
22	26
22	27
22	28
22	3
13	18
13	19
13	2
13	21
13	22
13	26
13	27
13	28
13	3
24	18
24	19
24	2
24	21
24	22
24	26
24	27
24	28
24	3
19	18
19	19
19	2
19	21
19	22
19	26
19	27
19	28
19	3
1	31
2	31
3	31
4	31
5	31
6	31
7	31
8	31
12	32
20	32
30	32
12	33
20	33
30	33
\.


--
-- Data for Name: berprospek; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.berprospek (jurusan_id, karir_id) FROM stdin;
1	1
1	3
1	4
8	1
8	3
8	4
21	1
21	3
21	4
9	1
9	2
9	4
25	1
25	2
25	4
2	5
2	6
2	7
2	8
2	9
2	12
10	5
10	6
10	7
10	8
10	9
10	12
22	5
22	6
22	7
22	8
22	9
22	12
13	5
13	9
13	11
13	12
13	16
24	5
24	9
24	11
24	12
24	16
19	12
19	13
19	14
19	15
7	17
7	18
7	19
11	17
11	18
11	19
26	17
26	18
26	19
3	21
3	22
12	21
12	22
30	21
30	22
20	23
20	24
20	25
5	26
5	27
5	28
16	26
16	27
16	28
27	26
27	27
27	28
4	28
4	29
4	31
15	28
15	29
15	31
29	28
29	29
29	31
17	28
17	32
17	33
17	34
23	28
23	32
23	33
23	34
6	35
6	36
6	37
6	38
18	35
18	36
18	37
18	38
28	35
28	36
28	37
28	38
14	39
14	4
14	41
31	39
31	4
31	41
3	20
12	20
30	20
4	30
15	30
29	30
\.


--
-- Data for Name: bertanya; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.bertanya (user_id, pertanyaan_id) FROM stdin;
11	1
8	31
\.


--
-- Data for Name: departemen; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.departemen (departemen_id, nama) FROM stdin;
1	Departemen Arsitektur
2	Departemen Teknik Elektro
3	Departemen Teknik Industri
4	Departemen Teknik Kimia
5	Departemen Teknik Metalurgi & Material
6	Departemen Teknik Mesin
7	Departemen Teknik Sipil
8	Program Internasional
\.


--
-- Data for Name: jawaban; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.jawaban (jawaban_id, text, submit_time) FROM stdin;
1	ada	1653712200722
5	Masuk Teknik Komputer aja bang. Nanti kerja di Tesla bareng Elon Musk terus dibayar pake DogeCoin auto to the moon jadi orang terkaya se-Indonesia aamiin!	1653724698417
38	Teriakasih	1653838906914
39	Tekkom	1653838924443
40	Gatau. BTW bang mau gua kasih video monyet viral di warnet ga? Saya email ke lu kalo mau :)	1653838997696
\.


--
-- Data for Name: jurusan; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.jurusan (jurusan_id, nama, daya_tampung, kuota_snmptn, kuota_sbmptn, kuota_simakui, kuota_ppkb, kuota_ts) FROM stdin;
1	Arsitektur KKI	40	0	0	16	0	24
2	Teknik Elektro KKI	30	0	0	12	0	18
3	Teknik Kimia KKI	25	0	0	10	0	15
4	Teknik Mesin KKI	30	0	0	12	0	18
5	Teknik Metalurgi dan Material KKI	36	0	0	14	0	22
6	Teknik Sipil KKI	30	0	0	12	0	18
7	Teknik Industri KKI	50	0	0	30	0	20
8	Arsitektur Reguler	60	12	18	30	0	0
9	Arsitektur Interior Reguler	50	10	15	25	0	0
10	Teknik Elektro Reguler	100	20	30	50	0	0
11	Teknik Industri Reguler	110	22	33	55	0	0
12	Teknik Kimia Reguler	90	18	27	45	0	0
13	Teknik Komputer Reguler	80	16	24	40	0	0
14	Teknik Lingkungan Reguler	70	14	21	35	0	0
15	Teknik Mesin Reguler	80	16	24	40	0	0
16	Teknik Metalurgi & Material Reguler	100	20	30	50	0	0
17	Teknik Perkapalan Reguler	60	12	18	30	0	0
18	Teknik Sipil Reguler	90	18	27	45	0	0
19	Teknik Biomedis Reguler	40	8	12	20	0	0
20	Teknik Bioproses Reguler	60	12	18	30	0	0
21	Arsitektur Paralel	16	0	0	8	8	0
22	Teknik Elektro Paralel	50	0	0	25	25	0
23	Teknik Perkapalan Paralel	36	0	0	18	18	0
24	Teknik Komputer Paralel	30	0	0	15	15	0
25	Arsitektur Interior Paralel	10	0	0	5	5	0
26	Teknik Industri Paralel	50	0	0	25	25	0
27	Teknik Metalurgi & Material Pararel	24	0	0	12	12	0
28	Teknik Sipil Parerel	40	0	0	20	20	0
29	Teknik Mesin Pararel	40	0	0	20	20	0
30	Teknik Kimia Pararel	36	0	0	18	18	0
31	Teknik Lingkungan Pararel	40	0	0	20	20	0
\.


--
-- Data for Name: karir; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.karir (karir_id, nama) FROM stdin;
1	Arsitek
2	Desainer Interior
3	Perencanaan Kota dan Wilayah
4	Drafter Arsitektur
5	Robotika
6	Ahli Listik
7	Ahli Teknik Sistem Solar Energi
8	Ahli Teknik Mekatronik
9	Programmer
10	Network Engineer
11	Database Administrator
12	AI Engineer
13	Peneliti Bioinformatika
14	Ahli Nanosistem
15	Ahli Biostatistik
16	Computer Architect
17	Teknisi Produksi Manufaktur
18	Operator Prabik dan Sistem
19	Manajer Prodksi Industri
20	Ahli Pertambangan & Perminyakan
21	Food Scientist
22	Pengendalia Mutu Produk
23	Konselor Genetis
24	Peneliti Tanah dan Tumbuhan
25	Ahli Biokimia
26	Ahli Pengeboran Bumi
27	Ahli Tambang dan Geologi
28	Perancang dan Teknisi Mesin
29	Spesialis Otomotif
30	Mekanik Mesin Industri
31	 Otomotif
32	Insinyur Perkapalan
33	Ahli Perkapalan
34	Manajer Transportasi
35	Teknisi Sipil
36	Pengawas Konstruksi dan Bangunan
37	Surveyor Tanah
38	Konsultan Properti
39	Bioteknologi
40	Tekniksi Konservasi Lingkungan 
41	Ahli Ekologi Industri
\.


--
-- Data for Name: kegiatan; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.kegiatan (kegiatan_id, nama) FROM stdin;
1	Freshmen Fest
2	OIM FTUI
3	Kanshow
4	Teknik Open House
5	Teknik Cup
6	AKSIOMA
7	Econeering FTUI
8	Center of Engineering Occupation FTUI
9	PSB Ganjil DA
10	PSB Genap DA
11	PSB Ganjil DTI
12	PSB Genap DTI
13	ISEEC (DTI)
14	Entrepreneruship Engineering Summit
15	Dongkrak Seni
16	National Summit
17	MMNE
18	Gladiator
19	PSB Ganjil DTE
20	PSB Genap DTE
21	RAMEN
22	Technoskill
23	Industrial Games
24	Ekskursi
25	Coarse
26	NEST
27	ECHA
28	Tanda Nyata Teknik Industri (TNTI)
29	PONSEL
30	Diskusi Elektro
31	PSB Night
32	PSB Ganjil DTK
33	PSB Genap DTK
\.


--
-- Data for Name: kurikulum; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.kurikulum (kurikulum_id, nama) FROM stdin;
1	Kalkulus
2	Aljabar Linear
3	Fisika Listrik
4	Fisika Mekanik
5	Perencanaan Kota
6	Tata Cahaya
7	Geomteri Arsitektur
8	Akustik
9	Teknologi Bangunan
10	Metode Perancangan
11	Perancangan Ars. Inerior
12	Anatomi Ruang
13	Sinyal dan Sistem
14	Rangkaian Listrik
15	Fisika Semikonduktor
16	Elektromagnetika
17	Divais Elektronika
18	Jaringan Komputer
19	Sistem Basis Data
20	Sistem Siber Fisik
21	Rekayasa Perangkat Lunak
22	Biomekanika
23	Bioinformatika
24	Biologi Teknik
25	Akutansi Biaya
26	Manajemen Inovasi
27	Pemasaran Industri
28	Ekonomi Sirkular
29	Biokimia
30	Rekayasa Genetika
31	Pengelolaan Gas Bumi
32	Perancangan Pabrik
33	Teknik Reaksi Kimia
34	Rekayasa Bioreaktor
35	Separasi
36	Simulasi Sistem Bioproses
37	Biomaterial
38	Karakterisasi Material
39	Metalurgi Ekstrasi
40	Pembuatan Besi dan Baja
41	Mekanika Kekuatan Material
42	Visualisasi Permodelan
43	Mekatronika
44	Proses Pemesinan Mikro
45	Optimasi Sistem Energi
46	Pmebangkit Daya Kapal
47	Proses Manufaktur Kapal
48	Struktur Kapal
49	Mekanika Tanah
50	pengolahan air limbah
51	Perencanaan Pelabuhan
52	Struktur Baja
53	Struktur Beton
54	Permodelan Kualias Lingkungan
55	Pengantar Ekonomi Lingkungan
56	Analisis Sitem Lingkungan
\.


--
-- Data for Name: menjawab; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.menjawab (user_id, jawaban_id) FROM stdin;
13	1
7	5
8	38
8	39
7	40
\.


--
-- Data for Name: mewadahi; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.mewadahi (departemen_id, jurusan_id) FROM stdin;
1	8
1	9
1	21
1	25
2	13
2	19
2	22
2	24
3	11
3	26
4	12
5	16
5	27
6	15
6	17
6	23
6	29
7	14
7	18
7	28
7	31
8	1
8	2
8	3
8	4
8	5
8	6
8	7
2	10
4	30
4	20
\.


--
-- Data for Name: organisasi; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.organisasi (organisasi_id, nama) FROM stdin;
1	BEM FTUI
2	MPM FTUI
3	IMS
4	IMM
5	IME
6	IMMt
7	IMA
8	IMTK
9	IMTI
10	IMPI
11	FUSI
12	KMK
13	PO
14	KAPA
15	TIS
16	BKST
17	ECORPS
18	TEKNIKA
19	NET-IC
20	CARTALA
21	HTW
22	AEROMODELLING
23	NANO
24	IATMI
25	SPE
26	SBE
27	SME
28	AIchE
29	IEEE
30	Exercise
31	ASBE
32	IISE SC UI
33	NACE SC UI
34	ASME UISS
35	UI SMV
36	UI SBT
37	AMV UI
38	UI Racing Team 
39	Chm-E-Car UI
\.


--
-- Data for Name: pertanyaan; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.pertanyaan (pertanyaan_id, judul, text, submit_time) FROM stdin;
1	Jurusan paling banyak duit?	Halo. Saya ingin bertanya. Jurusan apa yang paling banyak duitnya ya?	1653645459368
31	Kuota Masuk UI?	Apakah kuota masuk UI dispesialkan pada setiap daerah?	1653838553309
\.


--
-- Data for Name: pertanyaan_dari; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.pertanyaan_dari (jawaban_id, pertanyaan_id) FROM stdin;
1	1
5	1
38	31
39	1
40	31
\.


--
-- Data for Name: punya_kurikulum; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.punya_kurikulum (jurusan_id, kurikulum_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
8	1
8	2
8	3
8	4
8	5
8	6
8	7
8	8
8	9
21	1
21	2
21	3
21	4
21	5
21	6
21	7
21	8
21	9
2	1
2	2
2	3
2	4
2	13
2	14
2	15
2	16
2	17
10	1
10	2
10	3
10	4
10	13
10	14
10	15
10	16
10	17
22	1
22	2
22	3
22	4
22	13
22	14
22	15
22	16
22	17
13	1
13	3
13	4
13	18
13	19
13	21
24	1
24	3
24	4
24	18
24	19
24	21
19	1
19	2
19	3
19	4
19	13
19	14
19	22
19	23
19	24
7	1
7	2
7	3
7	4
7	25
7	26
7	27
7	28
11	1
11	2
11	3
11	4
11	25
11	26
11	27
11	28
26	1
26	2
26	3
26	4
26	25
26	26
26	27
26	28
3	1
3	2
3	3
3	4
3	29
3	3
3	31
3	32
3	33
12	1
12	2
12	3
12	4
12	29
12	3
12	31
12	32
12	33
30	1
30	2
30	3
30	4
30	29
30	3
30	31
30	32
30	33
20	1
20	2
20	3
20	4
20	29
20	3
20	34
20	35
20	36
4	1
4	2
4	3
4	4
4	41
4	42
4	43
4	44
4	45
15	1
15	2
15	3
15	4
15	41
15	42
15	43
15	44
15	45
29	1
29	2
29	3
29	4
29	41
29	42
29	43
29	44
29	45
17	1
17	2
17	3
17	4
17	46
17	47
17	48
17	42
23	1
23	2
23	3
23	4
23	46
23	47
23	48
23	42
6	1
6	2
6	3
6	4
6	49
6	5
6	51
6	52
6	53
18	1
18	2
18	3
18	4
18	49
18	5
18	51
18	52
18	53
28	1
28	2
28	3
28	4
28	49
28	5
28	51
28	52
28	53
14	1
14	2
14	3
14	4
14	49
14	54
14	55
14	56
9	1
9	2
9	3
9	4
9	6
9	8
25	1
25	2
25	3
25	4
25	6
25	8
31	1
31	2
31	3
31	4
31	49
31	54
31	55
31	56
5	1
5	2
5	3
5	4
5	38
5	39
5	40
5	41
16	1
16	2
16	3
16	4
16	38
16	39
16	40
16	41
27	1
27	2
27	3
27	4
27	38
27	39
27	40
27	41
13	13
13	14
13	2
24	13
24	14
24	2
\.


--
-- Data for Name: user_reg; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.user_reg (user_id, username, password, role, reg_time) FROM stdin;
5	register	$2b$10$FDZAJ8/QEexmKCzkU8WRA.N6AghYSW3MRsEobldSuOlPDMfY3tHaG	non-mahasiswa	1653642783197
6	halo	$2b$10$Q9SnXxNkeB/zXv5pyrRQOu7BzAzKbSuICvZWs.vbm4dMn4gYtY3F2	non-mahasiswa	1653642783197
7	jamal	$2b$10$478HhLQ63AfrvI75f8fwROs1G8og6U8Z3EDyU/EWzAret0X0NgacS	non-mahasiswa	1653642783197
9	ar	$2b$10$HzZ.GWc.LzP3Z7Ji8mu0tOMJJ3QK8G42p285nEbwZjImx.RvFAdrW	mahasiswa	1653642783197
11	b	$2b$10$q5onT9JPzaf3ALkmwa22w.zk6k.3ERRurS0BM3pOq4wiVg8CF4Kvy	mahasiswa	1653644951589
12	ha	$2b$10$BaXyZeD7dm8rn6fiDRywjuxQw/0bDB2W9at/PbW.WLujEzHiKfGhq	mahasiswa	1653651023875
13	anjani	$2b$10$TipFSf0VA9rfqWTAi62l8u0NjFQvb0CStpIjqD7t8KwyqWnn4rOfG	mahasiswa	1653653427928
14	ago	$2b$10$iBg.LLjbqskACXUXHiJwKOesdGnIu5urtrmkVsmH8OXyxUqRhFgOq	non-mahasiswa	1653817816053
15	tester	$2b$10$iXbQJM4W94RUljAL1GIXduMvNBvGilyKqSFOFLTpB3De1xd139YYq	non-mahasiswa	1653817844639
4	ElonMusk	$2b$10$.Tjiwco4BCdsx/wo9YlG4eUjyrNuangKL0RxH/DPoI7XQYRaModL6	mahasiswa	1653642783197
3	JeffBezos	$2b$10$V6x/wjhwSinYMcOcs//T4OpCvBv0uATSqq5u7j4ysZK3drBloaIRm	mahasiswa	1653642783197
8	az	$2b$10$IrHE9nyUc2xd7AKtNWw1Uen7JeaWg1.C3ykA9AyyDJT0slOMTxbUa	mahasiswa	1653642783197
\.


--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: mraihanazhari_sbd
--

COPY public.wishlist (user_id, jurusan_id) FROM stdin;
3	30
8	30
8	13
4	8
8	26
8	12
8	28
7	13
8	27
8	15
\.


--
-- Name: berisi_organisasi_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.berisi_organisasi_jurusan_id_seq', 1, false);


--
-- Name: berisi_organisasi_organisasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.berisi_organisasi_organisasi_id_seq', 1, false);


--
-- Name: berkegiatan_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.berkegiatan_jurusan_id_seq', 1, false);


--
-- Name: berkegiatan_kegiatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.berkegiatan_kegiatan_id_seq', 1, false);


--
-- Name: berprospek_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.berprospek_jurusan_id_seq', 1, false);


--
-- Name: berprospek_karir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.berprospek_karir_id_seq', 1, false);


--
-- Name: bertanya_pertanyaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.bertanya_pertanyaan_id_seq', 1, false);


--
-- Name: bertanya_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.bertanya_user_id_seq', 1, false);


--
-- Name: departemen_departemen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.departemen_departemen_id_seq', 1, false);


--
-- Name: jawaban_jawaban_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.jawaban_jawaban_id_seq', 40, true);


--
-- Name: jurusan_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.jurusan_jurusan_id_seq', 1, false);


--
-- Name: karir_karir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.karir_karir_id_seq', 1, false);


--
-- Name: kegiatan_kegiatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.kegiatan_kegiatan_id_seq', 1, false);


--
-- Name: kurikulum_kurikulum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.kurikulum_kurikulum_id_seq', 1, false);


--
-- Name: menjawab_jawaban_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.menjawab_jawaban_id_seq', 1, false);


--
-- Name: menjawab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.menjawab_user_id_seq', 1, false);


--
-- Name: mewadahi_departemen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.mewadahi_departemen_id_seq', 1, false);


--
-- Name: mewadahi_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.mewadahi_jurusan_id_seq', 1, false);


--
-- Name: organisasi_organisasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.organisasi_organisasi_id_seq', 1, false);


--
-- Name: pertanyaan_dari_jawaban_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.pertanyaan_dari_jawaban_id_seq', 1, false);


--
-- Name: pertanyaan_dari_pertanyaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.pertanyaan_dari_pertanyaan_id_seq', 1, false);


--
-- Name: pertanyaan_pertanyaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.pertanyaan_pertanyaan_id_seq', 31, true);


--
-- Name: punya_kurikulum_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.punya_kurikulum_jurusan_id_seq', 1, false);


--
-- Name: punya_kurikulum_kurikulum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.punya_kurikulum_kurikulum_id_seq', 1, false);


--
-- Name: user_reg_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.user_reg_user_id_seq', 17, true);


--
-- Name: wishlist_jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.wishlist_jurusan_id_seq', 1, false);


--
-- Name: wishlist_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mraihanazhari_sbd
--

SELECT pg_catalog.setval('public.wishlist_user_id_seq', 1, false);


--
-- Name: departemen departemen_nama_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.departemen
    ADD CONSTRAINT departemen_nama_key UNIQUE (nama);


--
-- Name: departemen departemen_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.departemen
    ADD CONSTRAINT departemen_pkey PRIMARY KEY (departemen_id);


--
-- Name: jawaban jawaban_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.jawaban
    ADD CONSTRAINT jawaban_pkey PRIMARY KEY (jawaban_id);


--
-- Name: jurusan jurusan_nama_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.jurusan
    ADD CONSTRAINT jurusan_nama_key UNIQUE (nama);


--
-- Name: jurusan jurusan_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.jurusan
    ADD CONSTRAINT jurusan_pkey PRIMARY KEY (jurusan_id);


--
-- Name: karir karir_nama_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.karir
    ADD CONSTRAINT karir_nama_key UNIQUE (nama);


--
-- Name: karir karir_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.karir
    ADD CONSTRAINT karir_pkey PRIMARY KEY (karir_id);


--
-- Name: kegiatan kegiatan_nama_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.kegiatan
    ADD CONSTRAINT kegiatan_nama_key UNIQUE (nama);


--
-- Name: kegiatan kegiatan_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.kegiatan
    ADD CONSTRAINT kegiatan_pkey PRIMARY KEY (kegiatan_id);


--
-- Name: kurikulum kurikulum_nama_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.kurikulum
    ADD CONSTRAINT kurikulum_nama_key UNIQUE (nama);


--
-- Name: kurikulum kurikulum_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.kurikulum
    ADD CONSTRAINT kurikulum_pkey PRIMARY KEY (kurikulum_id);


--
-- Name: organisasi organisasi_nama_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.organisasi
    ADD CONSTRAINT organisasi_nama_key UNIQUE (nama);


--
-- Name: organisasi organisasi_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.organisasi
    ADD CONSTRAINT organisasi_pkey PRIMARY KEY (organisasi_id);


--
-- Name: pertanyaan pertanyaan_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.pertanyaan
    ADD CONSTRAINT pertanyaan_pkey PRIMARY KEY (pertanyaan_id);


--
-- Name: user_reg user_reg_pkey; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.user_reg
    ADD CONSTRAINT user_reg_pkey PRIMARY KEY (user_id);


--
-- Name: user_reg user_reg_username_key; Type: CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.user_reg
    ADD CONSTRAINT user_reg_username_key UNIQUE (username);


--
-- Name: jawaban update_lastmodified_modtime; Type: TRIGGER; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TRIGGER update_lastmodified_modtime BEFORE UPDATE ON public.jawaban FOR EACH ROW EXECUTE FUNCTION public.update_lastmodified_column();


--
-- Name: pertanyaan update_lastmodified_modtime; Type: TRIGGER; Schema: public; Owner: mraihanazhari_sbd
--

CREATE TRIGGER update_lastmodified_modtime BEFORE UPDATE ON public.pertanyaan FOR EACH ROW EXECUTE FUNCTION public.update_lastmodified_column();


--
-- Name: berisi_organisasi berisi_organisasi_jurusan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berisi_organisasi
    ADD CONSTRAINT berisi_organisasi_jurusan_id_fkey FOREIGN KEY (jurusan_id) REFERENCES public.jurusan(jurusan_id);


--
-- Name: berisi_organisasi berisi_organisasi_organisasi_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berisi_organisasi
    ADD CONSTRAINT berisi_organisasi_organisasi_id_fkey FOREIGN KEY (organisasi_id) REFERENCES public.organisasi(organisasi_id);


--
-- Name: berkegiatan berkegiatan_jurusan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berkegiatan
    ADD CONSTRAINT berkegiatan_jurusan_id_fkey FOREIGN KEY (jurusan_id) REFERENCES public.jurusan(jurusan_id);


--
-- Name: berkegiatan berkegiatan_kegiatan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berkegiatan
    ADD CONSTRAINT berkegiatan_kegiatan_id_fkey FOREIGN KEY (kegiatan_id) REFERENCES public.kegiatan(kegiatan_id);


--
-- Name: berprospek berprospek_jurusan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berprospek
    ADD CONSTRAINT berprospek_jurusan_id_fkey FOREIGN KEY (jurusan_id) REFERENCES public.jurusan(jurusan_id);


--
-- Name: berprospek berprospek_karir_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.berprospek
    ADD CONSTRAINT berprospek_karir_id_fkey FOREIGN KEY (karir_id) REFERENCES public.karir(karir_id);


--
-- Name: bertanya bertanya_pertanyaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.bertanya
    ADD CONSTRAINT bertanya_pertanyaan_id_fkey FOREIGN KEY (pertanyaan_id) REFERENCES public.pertanyaan(pertanyaan_id);


--
-- Name: bertanya bertanya_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.bertanya
    ADD CONSTRAINT bertanya_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_reg(user_id);


--
-- Name: menjawab menjawab_jawaban_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.menjawab
    ADD CONSTRAINT menjawab_jawaban_id_fkey FOREIGN KEY (jawaban_id) REFERENCES public.jawaban(jawaban_id);


--
-- Name: menjawab menjawab_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.menjawab
    ADD CONSTRAINT menjawab_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_reg(user_id);


--
-- Name: mewadahi mewadahi_departemen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.mewadahi
    ADD CONSTRAINT mewadahi_departemen_id_fkey FOREIGN KEY (departemen_id) REFERENCES public.departemen(departemen_id);


--
-- Name: mewadahi mewadahi_jurusan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.mewadahi
    ADD CONSTRAINT mewadahi_jurusan_id_fkey FOREIGN KEY (jurusan_id) REFERENCES public.jurusan(jurusan_id);


--
-- Name: pertanyaan_dari pertanyaan_dari_jawaban_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.pertanyaan_dari
    ADD CONSTRAINT pertanyaan_dari_jawaban_id_fkey FOREIGN KEY (jawaban_id) REFERENCES public.jawaban(jawaban_id);


--
-- Name: pertanyaan_dari pertanyaan_dari_pertanyaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.pertanyaan_dari
    ADD CONSTRAINT pertanyaan_dari_pertanyaan_id_fkey FOREIGN KEY (pertanyaan_id) REFERENCES public.pertanyaan(pertanyaan_id);


--
-- Name: punya_kurikulum punya_kurikulum_jurusan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.punya_kurikulum
    ADD CONSTRAINT punya_kurikulum_jurusan_id_fkey FOREIGN KEY (jurusan_id) REFERENCES public.jurusan(jurusan_id);


--
-- Name: punya_kurikulum punya_kurikulum_kurikulum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.punya_kurikulum
    ADD CONSTRAINT punya_kurikulum_kurikulum_id_fkey FOREIGN KEY (kurikulum_id) REFERENCES public.kurikulum(kurikulum_id);


--
-- Name: wishlist wishlist_jurusan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_jurusan_id_fkey FOREIGN KEY (jurusan_id) REFERENCES public.jurusan(jurusan_id);


--
-- Name: wishlist wishlist_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mraihanazhari_sbd
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_reg(user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_pg_admin
--

REVOKE ALL ON SCHEMA public FROM azuresu;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO azure_pg_admin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- PostgreSQL database dump complete
--

