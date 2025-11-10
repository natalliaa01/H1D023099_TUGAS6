# Tugas 6 Pertemuan 8

## Data Diri
-   **Nama:** `Natalia Nidya Fidelia`
-   **NIM:** H1D023099
-   **Shift Baru:** `E`
-   **Shift Asal:** `B`


---

## Deskripsi Aplikasi

Aplikasi ini dibuat menggunakan **Flutter** untuk memenuhi Tugas 6 Pemrograman Mobile.  

Fungsinya adalah:
- Menerima input data mahasiswa berupa:
  - Nama
  - NIM
  - Tahun lahir
- Menampilkan **kalimat perkenalan** pada halaman baru dengan format:

> "Nama saya [Nama], NIM [NIM], dan umur saya adalah [umur] tahun."

Umur dihitung secara otomatis dari:

> **umur = tahun sekarang – tahun lahir**

---

## Struktur Folder Utama

```text
lib/
 ├─ main.dart
 └─ ui/
     ├─ form_data.dart       // Halaman form input data
     └─ tampil_data.dart     // Halaman tampilan perkenalan / hasil