-- ============================================================
-- STEP 10 - Dataset Overview
-- ============================================================

-- 1. Ringkasan volume semua tabel
SELECT 'Fact_Sales' t, COUNT(*) row_count FROM raw_fact_sales
UNION ALL SELECT 'Fact_Inventory', COUNT(*) FROM raw_fact_inventory
UNION ALL SELECT 'Fact_Delivery', COUNT(*) FROM raw_fact_delivery
UNION ALL SELECT 'Fact_Target', COUNT(*) FROM raw_fact_target
UNION ALL SELECT 'Fact_Promotion', COUNT(*) FROM raw_fact_promotion
UNION ALL SELECT 'Fact_Complaint', COUNT(*) FROM raw_fact_complaint
UNION ALL SELECT 'Fact_Competitor', COUNT(*) FROM raw_fact_competitor
UNION ALL SELECT 'Dim_Product', COUNT(*) FROM raw_dim_product
UNION ALL SELECT 'Dim_Branch', COUNT(*) FROM raw_dim_branch
UNION ALL SELECT 'Dim_Distributor', COUNT(*) FROM raw_dim_distributor
UNION ALL SELECT 'Dim_Date', COUNT(*) FROM raw_dim_date;

-- 2. Rentang tanggal transaksi
SELECT MIN(Order_Date), MAX(Order_Date)
FROM raw_fact_sales
WHERE Order_Date LIKE '____-__-__';

-- 3. Relasi Fact_Sales -> Dim_Branch
SELECT COUNT(*) AS unmatched_branch
FROM raw_fact_sales s
LEFT JOIN raw_dim_branch b ON s.Branch_ID = b.Branch_ID
WHERE b.Branch_ID IS NULL;

-- 4. Relasi Fact_Sales -> Dim_Distributor
SELECT COUNT(*) AS unmatched_distributor
FROM raw_fact_sales s
LEFT JOIN raw_dim_distributor d ON s.Distributor_ID = d.Distributor_ID
WHERE d.Distributor_ID IS NULL AND s.Distributor_ID IS NOT NULL;

-- 5. Angka bisnis level tinggi
SELECT
    COUNT(*) AS total_transaksi,
    SUM(TRY_CAST(Net_Revenue AS DOUBLE)) AS total_net_revenue,
    SUM(TRY_CAST(Gross_Profit AS DOUBLE)) AS total_gross_profit,
    ROUND(SUM(TRY_CAST(Gross_Profit AS DOUBLE)) / NULLIF(SUM(TRY_CAST(Net_Revenue AS DOUBLE)),0) * 100, 2) AS overall_margin_pct
FROM raw_fact_sales;

-- 6. Revenue per tahun
SELECT
    SUBSTR(Order_Date, 1, 4) AS yr,
    COUNT(*) AS transaksi,
    SUM(TRY_CAST(Net_Revenue AS DOUBLE)) AS net_revenue
FROM raw_fact_sales
WHERE Order_Date LIKE '____-__-__'
GROUP BY 1
ORDER BY 1;

-- 7. Revenue per bulan (cek pola musiman)
SELECT
    SUBSTR(Order_Date, 1, 7) AS ym,
    SUM(TRY_CAST(Net_Revenue AS DOUBLE)) AS revenue
FROM raw_fact_sales
WHERE Order_Date LIKE '____-__-__'
GROUP BY 1
ORDER BY 1;
