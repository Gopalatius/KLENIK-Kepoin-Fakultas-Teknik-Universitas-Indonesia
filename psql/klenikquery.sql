CREATE TYPE role AS ENUM ('mahasiswa', 'non-mahasiswa');

CREATE TABLE user_reg(
user_id bigserial PRIMARY KEY,
username varchar(36) UNIQUE NOT NULL,
password varchar(60) NOT NULL,
role role NOT NULL,
reg_time date
);

CREATE TABLE pertanyaan(
pertanyaan_id bigserial PRIMARY KEY,
text varchar(1000) NOT NULL
);

CREATE TABLE jawaban(
jawaban_id bigserial PRIMARY KEY,
text varchar(1000) NOT NULL
);


CREATE TABLE menjawab(
user_id bigserial,
jawaban_id bigserial,
FOREIGN KEY (user_id) REFERENCES user_reg,
FOREIGN KEY (jawaban_id) REFERENCES jawaban
);

CREATE TABLE bertanya(
user_id bigserial,
pertanyaan_id bigserial,
FOREIGN KEY (user_id) REFERENCES user_reg,
FOREIGN KEY (pertanyaan_id) REFERENCES pertanyaan
);

CREATE TABLE pertanyaan_dari(
jawaban_id bigserial,
pertanyaan_id bigserial,
FOREIGN KEY (jawaban_id) REFERENCES jawaban,
FOREIGN KEY (pertanyaan_id) REFERENCES pertanyaan
);

CREATE TABLE jurusan(
jurusan_id bigserial PRIMARY KEY,
nama varchar(29) UNIQUE NOT NULL,
daya_tampung smallint NOT NULL,
kuota_snmptn smallint,
kuota_sbmptn smallint,
kuota_simakui smallint,
kuota_ppkb smallint,
kuota_ts smallint
);




CREATE TABLE organisasi(
organisasi_id bigserial PRIMARY KEY,
nama varchar(40) UNIQUE NOT NULL
);

CREATE TABLE kegiatan(
kegiatan_id bigserial PRIMARY KEY,
nama varchar(40) UNIQUE NOT NULL
);

CREATE TABLE karir(
karir_id bigserial PRIMARY KEY,
nama varchar(40) UNIQUE NOT NULL
);


CREATE TABLE kurikulum(
kurikulum_id bigserial PRIMARY KEY,
nama varchar(40) UNIQUE NOT NULL
);

CREATE TABLE departemen(
departemen_id bigserial PRIMARY KEY,
nama varchar(40) UNIQUE NOT NULL
);




CREATE TABLE mewadahi(
departemen_id bigserial,
jurusan_id bigserial,
FOREIGN KEY (departemen_id) REFERENCES departemen,
FOREIGN KEY (jurusan_id) REFERENCES jurusan
);

CREATE TABLE punya_kurikulum(
jurusan_id bigserial,
kurikulum_id bigserial,
FOREIGN KEY (kurikulum_id) REFERENCES kurikulum,
FOREIGN KEY (jurusan_id) REFERENCES jurusan
);

CREATE TABLE berprospek(
jurusan_id bigserial,
karir_id bigserial,
FOREIGN KEY (karir_id) REFERENCES karir,
FOREIGN KEY (jurusan_id) REFERENCES jurusan
);

CREATE TABLE berkegiatan(
jurusan_id bigserial,
kegiatan_id bigserial,
FOREIGN KEY (kegiatan_id) REFERENCES kegiatan,
FOREIGN KEY (jurusan_id) REFERENCES jurusan
);

CREATE TABLE berisi_organisasi(
jurusan_id bigserial,
organisasi_id bigserial,
FOREIGN KEY (organisasi_id) REFERENCES organisasi,
FOREIGN KEY (jurusan_id) REFERENCES jurusan
);

ALTER TABLE jurusan ALTER COLUMN nama TYPE varchar(40);

\COPY jurusan(jurusan_id, nama, daya_tampung, kuota_snmptn, kuota_sbmptn, kuota_simakui, kuota_ppkb, kuota_ts) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\jurusan.csv' DELIMITER ',' CSV
\COPY berisi_organisasi(jurusan_id, organisasi_id) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\berorganisasi.csv' DELIMITER ',' CSV

\COPY organisasi(organisasi_id, nama) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\organisasi.csv' DELIMITER ',' CSV
\COPY departemen(departemen_id, nama) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\departemen.csv' DELIMITER ',' CSV
\COPY mewadahi(departemen_id, jurusan_id) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\mewadahi.csv' DELIMITER ',' CSV

\COPY kurikulum(kurikulum_id, nama) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\kurikulum.csv' DELIMITER ',' CSV
\COPY punya_kurikulum(jurusan_id, kurikulum_id) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\punya_kurikulum.csv' DELIMITER ',' CSV

\COPY karir(karir_id, nama) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\karir.csv' DELIMITER ',' CSV




\COPY berprospek(jurusan_id, karir_id) FROM 'D:\#KAKAK\UI\##Semester 4\SBD\Data Proyek CSV\berprospek.csv' DELIMITER ',' CSV

SELECT jurusan.nama, departemen.nama
FROM jurusan
INNER JOIN mewadahi ON (jurusan.jurusan_id = mewadahi.jurusan_id)
INNER JOIN departemen ON (mewadahi.departemen_id = departemen.departemen_id);

SELECT jurusan.nama as namjur, kurikulum.nama as nakur FROM jurusan INNER JOIN punya_kurikulum ON (jurusan.jurusan_id = punya_kurikulum.jurusan_id) INNER JOIN kurikulum ON (punya_kurikulum.kurikulum_id = kurikulum.kurikulum_id) WHERE (jurusan.jurusan_id = 7);
