---
title: KLENIK (Kepoin Fakultas Teknik Universitas Indonesia)
tags: Kepoin Fakultas Teknik Universitas Indonesia
description: Aplikasi berbasis web yang ditujukan untuk membantu mahasiswa maupun non-mahasiswa untuk mengetahui hal yang lebih banyak mengenai Fakultas Teknik Universitas Indonesia.
---

# KLENIK!
---

## Program ini akan:

- Menampilkan tabel data mengenai Jurusan pada FT UI beserta Departemen yang menaunginya, daya tampung, kuota SNMPTN, SBMPTN, SIMAK UI, PPKB dan kuota TS
- Menampilkan tabel data mengenai Jurusan pada FT UI beserta Kurikulum atau Mata Kuliah yang akan dipelajari serta Prospek Karir-nya
- User dapat menambahkan suatu jurusan sebagai jurusan yang ingin mereka ambil atau Wishlist 
- Terdapat forum diskusi dimana user dapat bertanya maupun menjawab serta membaca diskusi/thread yang ada
- User dapat melihat kembali Jurusan yang ingin mereka ambil pada laman Wishlist serta melihat mata kuliah yang akan dipelajari serta prospek karirnya

---

### List tabel dan deskripsinya:
  - Tabel User = untuk menyimpan akun dari user yang berisi username, password, dan role.
  - Tabel Pertanyaan = untuk menyimpan daftar pertanyaan dari user yang berisi pertanyaan_id, judul, text, dan timestamp.
  - Tabel Jawaban = untuk menyimpan daftar jawaban dari user yang berisi jawaban_id, judul, text, dan timestamp.
  - Tabel Departemen = untuk menyimpan daftar departemen di FTUI yang berisi departemen_id dan nama.
  - Tabel Jurusan = untuk menyimpan daftar jurusan di FTUI yang berisi jurusan_id, nama, daya_tampung, kuota snmptn, sbmptn, simak ui, ppkb, dan ts.
  - Tabel Organisasi = untuk menyimpan daftar organisasi di FTUI yang berisi organisasi_id dan nama.
  - Tabel Kegiatan = untuk menyimpan daftar kegiatan di FTUI yang berisi kegiatan_id dan nama.
  - Tabel Karir = untuk menyimpan daftar prospek karir dari suatu jurusan di FTUI yang berisi karir_id dan nama.
  - Tabel Kurikulum = untuk menyimpan daftar kurikulum atau mata kuliah yang dipelajari suatu jurusan di FTUI yang berisi kurikulum_id dan nama.