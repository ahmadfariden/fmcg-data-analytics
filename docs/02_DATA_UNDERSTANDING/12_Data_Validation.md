# Step 12 — Data Validation

## Tujuan
Memastikan hasil Data Cleaning (Step 11) konsisten secara bisnis — tidak
ada distorsi angka signifikan, tidak ada anomali logis baru, dan relasi
antar tabel `clean_*` tetap valid — sebelum masuk PART 3 (Business
Framework) dan PART 4 (Analytics Pipeline).

## Input
- Tabel `raw_*` dan `clean_*` di `fmcg.duckdb`

## Proses Analisis
8 pengecekan: selisih total revenue raw vs clean, range Margin_Pct,
anomali logis (revenue nol padahal ada qty, profit lebih besar dari
revenue), validasi relasi FK ke semua dimensi (termasuk Fact_Target),
validasi Lead_Time_Days tidak negatif. Lihat `sql/step12_data_validation.sql`.

## Temuan

| Validasi | Hasil | Kesimpulan |
|---|---|---|
| Selisih revenue raw vs clean | ~0,1% | Wajar — dari 100rb baris duplicate yang dibuang |
| Range Margin_Pct | 2% – 50%, avg ~26-29% | Sesuai desain target margin per kategori |
| Revenue = 0 padahal Qty > 0 | 0 baris | Tidak ada anomali |
| Gross_Profit > Net_Revenue | 0 baris | Tidak ada margin >100% |
| Unmatched Branch/Distributor di Fact_Sales | 0 / 0 | Semua relasi FK utama valid |
| Unmatched Branch di Fact_Target | 0 | Target selalu merujuk branch valid |
| Lead_Time_Days negatif | 0 | Tidak ada delivery waktu tempuh negatif |
| Orphan SKU (flagged) | ~0,5% | Sesuai desain spec, tetap terpantau |

### Validasi Tambahan (hasil kalibrasi bisnis, lihat Step 15 Business Rules)

- ABC Class benar-benar berkorelasi Pareto dengan revenue (bukan cuma
  proporsional ke jumlah SKU)
- Branch Tier & Potential_Score berkorelasi nyata dengan revenue aktual
- Distributor Contract_Status & Distributor_Type berkorelasi nyata dengan
  volume transaksi
- Region_Tier & Branch_Difficulty berkorelasi nyata dengan Stockout Rate
- Category produk berkorelasi nyata dengan Dead Stock Rate
- Achievement % per cabang bervariasi wajar (45%-155%, rata-rata ~100%)
  tanpa nilai ekstrem yang tidak masuk akal

## Output
Data tervalidasi sehat secara struktural maupun bisnis, siap dipakai
untuk Data Modeling (Step 17) dan seterusnya.

## Kesimpulan
Tidak ditemukan masalah baru setelah cleaning dan seluruh iterasi
kalibrasi bisnis. Data siap lanjut ke PART 3 — Business Framework
(Step 13 KPI Design, Step 14 Business Rules, Step 15 Project
Architecture, Step 16 Data Dictionary).
