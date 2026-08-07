# Step 11 — Data Cleaning

## Tujuan
Membersihkan seluruh dirty data yang teridentifikasi di Step 9-10 (missing
value, duplicate, invalid date format, negative value, orphan FK, region
mapping error) tanpa menghilangkan jejak audit — hasil akhirnya adalah 11
tabel `clean_*` yang siap dipakai di Data Modeling (Step 17).

## Input
- Database `fmcg.duckdb`, tabel `raw_*` (hasil Step 8)

## Proses Analisis
Lihat `sql/step11_data_cleaning.sql`. Strategi cleaning per jenis masalah:

| Masalah | Strategi | Alasan |
|---|---|---|
| Duplicate Sales_ID / Promo_ID | `ROW_NUMBER()` dedup, keep 1 | Baris ganda adalah kesalahan input |
| Format tanggal campuran | `TRY_STRPTIME` multi-format → `DATE` | Standardisasi tanpa kehilangan data |
| Missing Distributor_ID | Isi `'UNKNOWN'` | Transaksi tetap valid |
| Missing Margin_Pct | Recompute dari Gross_Profit/Net_Revenue | Bisa dihitung ulang |
| Missing Inventory_Value | Recompute rata-rata value/stock | Estimasi wajar |
| Missing Actual_Lift (promosi) | Pakai Expected_Lift | Estimasi terbaik tersedia |
| Missing Resolution_Days | Median per Severity | Representatif |
| Missing Competitor_Price | Recompute dari Our_Price + Price_Gap_Pct | Direkonstruksi dari kolom lain |
| Missing Actual_Delivery_Date | Dibiarkan NULL | Representasi "belum settle" |
| Missing Margin_Target | Rata-rata per Category | Estimasi wajar |
| Nilai negatif (Qty, Net_Revenue, Closing_Stock) | `ABS()` | Human error tanda minus |
| Orphan SKU_ID / Distributor_ID | **Tidak dihapus**, diberi kolom flag `Is_Orphan_*` | Bisa diaudit di Data Quality Monitoring |
| Region_Raw salah (Dim_Branch) | Kolom `Region` (benar) jadi master, `Region_Raw` disimpan untuk audit | Demo before/after cleaning |

## Temuan

| Tabel | Before | After | Perubahan |
|---|---:|---:|---|
| clean_fact_sales | 20.100.000 | 20.000.000 | -100.000 (dedup 0,5%) |
| clean_fact_inventory | 1.500.000 | 1.500.000 | tidak ada dedup |
| clean_fact_delivery | 4.000.000 | 4.000.000 | tidak ada dedup |
| clean_fact_target | 86.400 | 86.400 | tidak ada dedup |
| clean_fact_promotion | 120.600 | 120.000 | -600 (dedup 0,5%) |
| clean_fact_complaint | 500.000 | 500.000 | tidak ada dedup |
| clean_fact_competitor | 250.000 | 250.000 | tidak ada dedup |
| clean_dim_product | 4.000 | 4.000 | — |
| clean_dim_branch | 50 | 50 | +2 kolom baru (Region_Tier, Branch_Difficulty) |
| clean_dim_distributor | 350 | 350 | — |
| clean_dim_date | 731 | 790 | +59 (perpanjangan periode) |

Semua verifikasi pasca-cleaning menunjukkan **0 sisa masalah**: 0
duplicate, 0 tanggal gagal parse, 0 nilai negatif, 0 missing value di
kolom yang di-cleaning. Orphan SKU (~0,5%) dan orphan Distributor
dipertahankan dengan flag, bukan dihapus.

**Kolom tambahan hasil iterasi bisnis** (lihat Step 15 Business Rules
untuk detail): `Region_Tier` dan `Branch_Difficulty` di Dim_Branch,
`Potential_Lost_Sales_Value` di Fact_Inventory — ditambahkan untuk
mendukung kalibrasi Inventory & Operations yang lebih realistis.

## Output
11 tabel `clean_*` lengkap di `fmcg.duckdb`, semua tipe data proper
(DATE, INTEGER, DOUBLE — bukan VARCHAR).

## Kesimpulan
Data cleaning selesai untuk semua 11 tabel dengan 0 sisa masalah. Siap
lanjut ke Step 12 — Data Validation.
