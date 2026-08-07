# Step 09 — Data Profiling

## Tujuan
Memeriksa karakteristik semua 11 tabel: row count vs target spec,
kardinalitas, null/missing, distribusi kategori, dan proporsi dirty data
yang sengaja disisipkan generator — sebelum masuk ke Data Cleaning (Step 11).

## Input
- Database `fmcg.duckdb`, tabel `raw_*` (hasil Step 8)

## Proses Analisis
Query profiling per tabel: null count kolom kunci, kardinalitas/distinct
count, distribusi kategori, dan validasi proporsi dirty data (duplicate,
format tanggal campuran, nilai negatif, orphan FK). Lihat
`sql/step09_data_profiling.sql`.

## Temuan

### Dirty Data (sesuai desain, terverifikasi konsisten di semua versi generate)

| Jenis | Proporsi Target | Hasil Terverifikasi |
|---|---|---|
| Missing values | ~1% | Distributor_ID, Margin_Pct, Inventory_Value ~1% |
| Duplicate records | ~0,5% | Fact_Sales & Fact_Promotion ~0,5% |
| Invalid date format | ~0,5% | Order_Date, PO_Date (campuran DD/MM/YYYY & MM-DD-YYYY) |
| Negative values | ~0,2% | Qty, Net_Revenue, Closing_Stock |
| Orphan foreign key | ~0,5% | SKU_ID di Fact_Sales (0,501%), Distributor_ID di Fact_Delivery |
| Region mapping error | ~10% (sengaja dinaikkan di tabel kecil) | Region_Raw vs Region di Dim_Branch |

### Distribusi Bisnis Utama (hasil final setelah kalibrasi)

| Aspek | Hasil |
|---|---|
| ABC Class Pareto | Class A (19,4% SKU) → 75% revenue; B → 18%; C → 7% |
| Region coverage | 20/20 region punya minimal 1 cabang |
| Distributor Contract_Status | Active ~90% transaksi, Suspended ~6%, Terminated ~4% |
| Distributor Type hierarki | Master > Regional > Sub (rasio ~4x revenue/distributor) |
| Distributor OTIF variance | 109-120 distributor "Best" (>95%), 208-220 "At Risk" (<90%) dari 350 |
| Branch Tier hierarki | Tier 1 >> Tier 2 > Tier 3 (rasio ~6x revenue/cabang) |
| Inventory Stockout Rate | 5-8% (per Region Tier: A 3-5%, B 5-8%, C 8-12%) |
| Inventory Critical Rate | 10-15% (DOC 1-15 hari) |
| Inventory Dead Stock Rate | 5-8% overall, bervariasi per Category (Home Care ~10%, Snack ~3%) |
| Avg Days Of Cover | 45-55 hari |
| Inventory Turnover | 12-18x |

## Output
Profiling lengkap seluruh tabel, siap jadi acuan strategi cleaning di Step 11.

## Kesimpulan
Semua dirty data sesuai desain dan proporsional dengan target spec.
Distribusi bisnis (ABC Pareto, Branch Tier, Distributor performance,
Inventory health) sudah melalui proses kalibrasi berulang untuk
memastikan tidak ada atribut yang "flat"/tidak berpengaruh terhadap hasil
aktual — setiap atribut klasifikasi (Tier, ABC Class, Contract Status,
Category, Region Tier) terbukti berkorelasi nyata dengan metrik bisnis
terkait. Siap lanjut ke Step 10 — Dataset Overview.
