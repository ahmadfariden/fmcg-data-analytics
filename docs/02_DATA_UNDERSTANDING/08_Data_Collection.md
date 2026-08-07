# Step 08 — Data Collection

## Tujuan
Mengumpulkan seluruh data sintetis (7 fact table + 4 dimension table) hasil
generate Python ke dalam satu database DuckDB sebagai raw/staging layer,
tanpa mengubah nilai apa pun (termasuk dirty data), sebagai fondasi sebelum
Data Profiling (Step 9) dan Data Cleaning (Step 11).

## Input
- Folder `output_csv/` hasil `python main.py --scale 1.0` (11 file CSV)
- Script `load_to_duckdb.py`

## Proses Analisis
1. Jalankan generator Python untuk menghasilkan 11 CSV sesuai spesifikasi
   bisnis (20 juta transaksi sales, 24 bulan periode 2024-2025, 50 cabang,
   350 distributor, 4.000 SKU, 20 region).
2. Load seluruh CSV ke DuckDB sebagai tabel `raw_*`, semua kolom di-load
   sebagai VARCHAR terlebih dahulu supaya dirty data (format tanggal
   campuran, dll) tidak menyebabkan kegagalan load.
3. Verifikasi jumlah baris tiap tabel terhadap volume yang direncanakan di
   spesifikasi data.

## Temuan
Semua 11 tabel berhasil di-load tanpa error, dengan volume sesuai target:

| Tabel | Row Count | Target Spec | Status |
|---|---:|---:|---|
| raw_fact_sales | 20.100.000 (20.000.000 unik + 0,5% duplicate) | 20.000.000 | ✅ |
| raw_fact_inventory | 1.500.000 | 1.500.000 | ✅ |
| raw_fact_delivery | 4.000.000 | 4.000.000 | ✅ |
| raw_fact_target | 86.400 | 86.400 | ✅ |
| raw_fact_promotion | 120.600 (120.000 unik + 0,5% duplicate) | 120.000 | ✅ |
| raw_fact_complaint | 500.000 | 500.000 | ✅ |
| raw_fact_competitor | 250.000 | 250.000 | ✅ |
| raw_dim_product | 4.000 | 4.000 | ✅ |
| raw_dim_branch | 50 | 50 | ✅ |
| raw_dim_distributor | 350 | 350 | ✅ |
| raw_dim_date | 731 (base) + 59 (perpanjangan) = 790 | 731+ | ✅ |

Sepanjang proses generate-ulang berkali-kali (untuk kalibrasi bisnis di
step-step berikutnya), volume baris ini konsisten stabil — hanya nilai di
dalam kolom yang berubah, bukan struktur/jumlah baris.

## Output
Database `fmcg.duckdb` berisi 11 tabel `raw_*`, siap untuk profiling.

## Kesimpulan
Data collection berhasil 100%. Semua tabel ter-load lengkap sesuai volume
target, tidak ada kegagalan parsing meskipun ada dirty data (format
tanggal campuran) di beberapa kolom. Siap lanjut ke Step 9 — Data
Profiling.
