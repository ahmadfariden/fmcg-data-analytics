-- ============================================================
-- STEP 09 - Data Profiling
-- Jalankan setelah Step 08 (raw_* tables sudah ter-load).
-- ============================================================

-- 1. Null / missing per kolom kunci (Fact_Sales)
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Distributor_ID IS NULL THEN 1 ELSE 0 END) AS null_distributor,
    SUM(CASE WHEN Margin_Pct IS NULL THEN 1 ELSE 0 END) AS null_margin
FROM raw_fact_sales;

-- 2. Kardinalitas kolom kunci
SELECT
    COUNT(DISTINCT Sales_ID) AS distinct_sales_id,
    COUNT(DISTINCT Branch_ID) AS distinct_branch,
    COUNT(DISTINCT Distributor_ID) AS distinct_distributor,
    COUNT(DISTINCT SKU_ID) AS distinct_sku
FROM raw_fact_sales;

-- 3. Duplicate Sales_ID
SELECT Sales_ID, COUNT(*) c FROM raw_fact_sales GROUP BY Sales_ID HAVING COUNT(*) > 1 LIMIT 10;

-- 4. Format tanggal campuran
SELECT Order_Date FROM raw_fact_sales WHERE Order_Date NOT LIKE '____-__-__' LIMIT 10;

-- 5. Nilai negatif
SELECT COUNT(*) FROM raw_fact_sales WHERE TRY_CAST(Qty AS INTEGER) < 0;

-- 6. Orphan SKU
SELECT COUNT(*) AS orphan_rows
FROM raw_fact_sales
WHERE SKU_ID NOT IN (SELECT SKU_ID FROM raw_dim_product);

-- 7. Region mapping error (Dim_Branch)
SELECT COUNT(*) AS mismatch FROM raw_dim_branch WHERE Region != Region_Raw;

-- 8. Distribusi kategori (Sales_Channel)
SELECT Sales_Channel, COUNT(*) FROM raw_fact_sales GROUP BY 1 ORDER BY 2 DESC;

-- 9. Distribusi Dim_Product per kategori
SELECT Category, COUNT(*) FROM raw_dim_product GROUP BY 1 ORDER BY 2 DESC;

-- 10. Region coverage (semua 20 region harus punya minimal 1 cabang)
SELECT COUNT(DISTINCT Region) AS jumlah_region_terpakai FROM raw_dim_branch;

-- 11. Distributor Contract_Status distribusi transaksi
SELECT dd.Contract_Status, COUNT(*) AS jumlah_transaksi
FROM raw_fact_sales fs
JOIN raw_dim_distributor dd ON fs.Distributor_ID = dd.Distributor_ID
GROUP BY 1;

-- 12. Missing value tabel lain
SELECT SUM(CASE WHEN Inventory_Value IS NULL THEN 1 ELSE 0 END) AS null_inv_value FROM raw_fact_inventory;
SELECT SUM(CASE WHEN Actual_Lift IS NULL THEN 1 ELSE 0 END) AS null_actual_lift FROM raw_fact_promotion;
SELECT SUM(CASE WHEN Resolution_Days IS NULL THEN 1 ELSE 0 END) AS null_resolution_days FROM raw_fact_complaint;
SELECT SUM(CASE WHEN Competitor_Price IS NULL THEN 1 ELSE 0 END) AS null_competitor_price FROM raw_fact_competitor;
