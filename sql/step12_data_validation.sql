-- ============================================================
-- STEP 12 - Data Validation
-- ============================================================

-- 1. Total revenue: clean vs raw
SELECT
    (SELECT SUM(TRY_CAST(Net_Revenue AS DOUBLE)) FROM raw_fact_sales) AS raw_total_revenue,
    (SELECT SUM(Net_Revenue) FROM clean_fact_sales) AS clean_total_revenue,
    ROUND(
        100.0 * (
            (SELECT SUM(TRY_CAST(Net_Revenue AS DOUBLE)) FROM raw_fact_sales) -
            (SELECT SUM(Net_Revenue) FROM clean_fact_sales)
        ) / (SELECT SUM(TRY_CAST(Net_Revenue AS DOUBLE)) FROM raw_fact_sales)
    , 3) AS pct_difference;

-- 2. Range Margin_Pct
SELECT MIN(Margin_Pct), MAX(Margin_Pct), AVG(Margin_Pct) FROM clean_fact_sales;

-- 3. Anomali: Net_Revenue = 0 padahal Qty > 0
SELECT COUNT(*) AS anomaly_zero_revenue
FROM clean_fact_sales
WHERE Net_Revenue = 0 AND Qty > 0;

-- 4. Anomali: Gross_Profit > Net_Revenue
SELECT COUNT(*) AS anomaly_margin_over_100
FROM clean_fact_sales
WHERE Gross_Profit > Net_Revenue;

-- 5. Relasi clean_fact_sales -> clean_dim_branch & clean_dim_distributor
SELECT COUNT(*) AS unmatched_branch
FROM clean_fact_sales s
LEFT JOIN clean_dim_branch b ON s.Branch_ID = b.Branch_ID
WHERE b.Branch_ID IS NULL;

SELECT COUNT(*) AS unmatched_distributor
FROM clean_fact_sales s
LEFT JOIN clean_dim_distributor d ON s.Distributor_ID = d.Distributor_ID
WHERE d.Distributor_ID IS NULL AND s.Distributor_ID != 'UNKNOWN';

-- 6. Relasi Fact_Target -> Dim_Branch
SELECT COUNT(*) AS unmatched_target_branch
FROM clean_fact_target t
LEFT JOIN clean_dim_branch b ON t.Branch_ID = b.Branch_ID
WHERE b.Branch_ID IS NULL;

-- 7. Sanity check Lead_Time_Days
SELECT COUNT(*) AS negative_lead_time
FROM clean_fact_delivery
WHERE Lead_Time_Days < 0;

-- 8. Persentase orphan SKU (untuk laporan Data Quality Monitoring)
SELECT ROUND(100.0 * SUM(Is_Orphan_SKU) / COUNT(*), 3) AS pct_orphan_sku_sales
FROM clean_fact_sales;

-- 9. Validasi tambahan: ABC Pareto (SKU_ID valid saja)
SELECT
    p.ABC_Class,
    COUNT(DISTINCT p.SKU_ID) AS jumlah_sku,
    SUM(s.Net_Revenue) AS revenue,
    ROUND(SUM(s.Net_Revenue) * 100.0 / SUM(SUM(s.Net_Revenue)) OVER (), 2) AS pct_revenue
FROM clean_fact_sales s
JOIN clean_dim_product p ON s.SKU_ID = p.SKU_ID
GROUP BY 1 ORDER BY 1;

-- 10. Validasi tambahan: Achievement % per branch (harus wajar, tidak ekstrem)
WITH sales_monthly AS (
    SELECT DATE_TRUNC('month', Order_Date) AS Month, Branch_ID, SUM(Net_Revenue) AS Revenue
    FROM clean_fact_sales GROUP BY 1,2
),
target_monthly AS (
    SELECT DATE_TRUNC('month', Month) AS Month, Branch_ID, SUM(Revenue_Target) AS Revenue_Target
    FROM clean_fact_target WHERE Target_Version = 'Original' GROUP BY 1,2
),
branch_achievement AS (
    SELECT s.Branch_ID, ROUND(SUM(s.Revenue)/SUM(t.Revenue_Target)*100,2) AS achievement_pct
    FROM sales_monthly s JOIN target_monthly t ON s.Month=t.Month AND s.Branch_ID=t.Branch_ID
    GROUP BY 1
)
SELECT MIN(achievement_pct), MAX(achievement_pct), ROUND(AVG(achievement_pct),1)
FROM branch_achievement;
