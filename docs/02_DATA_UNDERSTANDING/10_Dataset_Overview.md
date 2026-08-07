# Step 10 — Dataset Overview

## Tujuan
Melihat gambaran lintas tabel (relasi antar tabel, rentang tanggal, angka
bisnis level tinggi) sebelum masuk Data Cleaning, memastikan tidak ada
masalah struktural besar.

## Input
- Database `fmcg.duckdb` (hasil Step 8 & 9)

## Proses Analisis
Cek row count semua tabel, rentang Order_Date, relasi Fact_Sales →
Dim_Branch/Dim_Distributor, dan agregasi revenue per tahun. Lihat
`sql/step10_dataset_overview.sql`.

## Temuan

1. **Row count semua 11 tabel konsisten** dengan hasil Step 8-9.
2. **Rentang tanggal transaksi: 2024-01-01 s/d 2025-12-31** (lengkap 24
   bulan, termasuk hari terakhir — sempat ada bug off-by-one di generator
   yang memotong 31 Desember, sudah diperbaiki).
3. **Relasi Fact_Sales → Dim_Branch dan → Dim_Distributor: 0 unmatched.**
   Semua Branch_ID dan Distributor_ID valid — beda dengan SKU_ID yang
   memang sengaja punya orphan key (~0,5%, sesuai spec).
4. **Dim_Date diperpanjang** dari 731 baris (2024-2025) menjadi 790 baris
   (+59 hari sampai akhir Februari 2026), karena beberapa tanggal fact
   (Actual_Delivery_Date, End_Date promosi) "menjorok" keluar periode
   utama akibat lead time/durasi — perbaikan standar dalam Star Schema
   Date Dimension.
5. **Tren revenue tahunan**: Revenue 2024 ≈ Rp 23 T, 2025 ≈ Rp 25 T
   (YoY Growth ~9-10%), dengan pola musiman jelas (puncak Maret-April dan
   Desember, terendah Januari-Februari) — hasil kalibrasi tren pertumbuhan
   dan musiman di generator.

## Output
- Semua tabel tervalidasi struktural sehat
- Dim_Date final: 790 baris, mencakup seluruh tanggal yang muncul di fact table manapun

## Kesimpulan
Dataset secara struktural sehat dan punya pola bisnis realistis (tren +
musiman). Siap lanjut ke Step 11 — Data Cleaning.
