# Extract Transform Load with Pentaho

Pentaho adalah alat ETL populer yang menawarkan antarmuka yang mudah digunakan untuk mengotomatisasi proses integrasi data. Dengan kompatibilitas yang luas dan kemampuan fleksibel, Pentaho membantu mempercepat pengolahan data, menjadikannya pilihan tepat untuk meningkatkan efisiensi dan akurasi dalam pengambilan keputusan.

## Table of Contents:

- ETL
- ETL Automation
- Slow Changing Dimension
  
## ETL
![image](https://github.com/user-attachments/assets/82dae376-df53-4237-b7da-f12be92ec0cb)
Pentaho Data Integration, sering disebut sebagai Kettle, adalah alat yang sangat populer untuk proses ETL. PDI menyediakan antarmuka grafis yang memudahkan pengguna untuk membuat alur ETL tanpa perlu banyak menulis kode. Pengguna dapat merancang proses ETL dengan cara menghubungkan berbagai komponen, seperti input, transformasi, dan output, menggunakan metode drag-and-drop.
Proses ETL dalam Pentaho
1.	Extract (Ekstraksi)
- Pada tahap ini, data diambil dari satu atau lebih sumber data, seperti database, file CSV, XML, API, atau bahkan sumber data tidak terstruktur.
-	Komponen Pentaho seperti "Table Input", "CSV Input", atau "XML Input" digunakan untuk mengimpor data dari sumber-sumber tersebut.
2.	Transform (Transformasi)
-	Data yang telah diekstraksi sering kali perlu diubah sebelum dapat dimuat ke dalam Data Warehouse. Proses transformasi bisa meliputi pembersihan data, konversi tipe data, penggabungan beberapa sumber data, atau perhitungan baru.
-	Komponen Pentaho seperti "Filter Rows", "Calculator", "Join Rows", atau "Sort Rows" digunakan untuk melakukan transformasi ini.
3.	Load (Pemuatan)
-	Setelah data diubah, data tersebut dimuat ke dalam Data Warehouse atau sistem tujuan lain. Data bisa disimpan dalam database relasional, file, atau bahkan aplikasi cloud.
-	Komponen seperti "Table Output", "Excel Output", atau "Insert/Update" digunakan untuk memuat data ke sistem tujuan.

## ETL Automation
![image](https://github.com/user-attachments/assets/6909938b-1877-4a77-92cf-5f0d0e212cda)

Dalam dunia Business Intelligence, sering kali dilupakan bahwa dasbor bukanlah proyek manual yang diperbarui sesekali, melainkan produk real-time. Fungsinya tidak hanya untuk menampilkan data, tapi juga harus responsif terhadap perubahan data untuk memberikan wawasan yang akurat dan terkini.

Salah satu cara untuk membuat dasbor real-time adalah dengan menggunakan penjadwal ETL (Extract, Transform, Load). Penjadwal ETL memungkinkan gudang data diperbarui secara otomatis pada interval yang ditentukan, sehingga dasbor selalu menampilkan data terbaru tanpa perlu intervensi manual. Hal ini memastikan keputusan berbasis data dapat dibuat dengan cepat dan tepat.

Pada kesempatan ini, saya akan menunjukkan kepada Anda cara menggunakan Penjadwal Tugas di Windows untuk menjadwalkan proses ETL otomatis. Saya menggunakan Pentaho Data Integration yang menyediakan utilitas Kitchen untuk menjalankan pekerjaan ETL melalui baris perintah. Langkah-langkahnya:
-	Menyiapkan Pekerjaan ETL di Pentaho
-	Membuat Skrip Batch untuk menjalankan pekerjaan
-	Mengatur Penjadwal Tugas di Windows

Dengan cara ini, pekerjaan ETL akan berjalan secara otomatis sesuai jadwal, memastikan dasbor selalu terbarui dan pengambilan keputusan menjadi lebih efisien. Setalah dilakukan automatisasi ETL untuk data warehouse jangan lupa untuk menerapkan scheduler pada BI Tool Anda.


## Slow Changing Dimension
![image](https://github.com/user-attachments/assets/bc0d38f8-9780-4fd5-aa05-fe3fe7f9081a)

Perubahan pada master table database akan berdampak pada tabel dimensi di data warehouse. Contohnya, saat manajer John pindah dari cabang A ke cabang B, atau ketika nama karyawan direvisi dari "Jhon Doe" menjadi "John Doe." Jika kita masih menggunakan pipeline data yang lama, beberapa masalah mungkin muncul, seperti:

-	Sistem hanya mencatat John di cabang A tanpa merekam bahwa ia pernah berpindah ke cabang B.
-	Sistem tidak mencatat adanya koreksi kesalahan penulisan nama John Doe.
  
Masalah ini dapat memengaruhi kualitas laporan yang dihasilkan. Perubahan yang terjadi di database transaksional, jika tidak ditangani dengan baik, bisa mengurangi kualitas data dalam hal 5C: clean, consistent, conformed, current, and comprehensive. Untuk mengatasi hal ini, kita dapat menerapkan Slowly Changing Dimension (SCD). SCD adalah kerangka kerja yang digunakan untuk mengelola perubahan data yang bersifat lambat dalam data warehouse. Dalam praktik kali ini, saya akan menggunakan Pentaho Data Integration untuk menerapkan dua tipe SCD:

-	SCD Tipe 1: Mengganti data lama dengan data baru, misalnya saat memperbaiki penulisan nama karyawan.
-	SCD Tipe 2: Menambahkan catatan baru untuk menyimpan riwayat perubahan, seperti saat John pindah cabang.
  
Dengan menggunakan SCD, kita dapat memastikan bahwa perubahan data tercatat dengan baik, sehingga laporan yang dihasilkan tetap akurat dan lengkap.


