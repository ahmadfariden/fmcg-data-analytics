-- ============================================================
-- STEP 08 - Data Collection
-- Load 11 CSV ke DuckDB sebagai tabel raw_*, verifikasi row count.
-- Jalankan: duckdb fmcg.duckdb < step08_data_collection.sql
-- ============================================================

CREATE OR REPLACE TABLE raw_fact_sales AS SELECT * FROM read_csv_auto('01_Fact_Sales.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_fact_inventory AS SELECT * FROM read_csv_auto('02_Fact_Inventory.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_fact_delivery AS SELECT * FROM read_csv_auto('03_Fact_Delivery.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_fact_target AS SELECT * FROM read_csv_auto('04_Fact_Target.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_fact_promotion AS SELECT * FROM read_csv_auto('05_Fact_Promotion.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_fact_complaint AS SELECT * FROM read_csv_auto('06_Fact_Complaint.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_fact_competitor AS SELECT * FROM read_csv_auto('07_Fact_Competitor.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_dim_product AS SELECT * FROM read_csv_auto('08_Dim_Product.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_dim_branch AS SELECT * FROM read_csv_auto('09_Dim_Branch.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_dim_distributor AS SELECT * FROM read_csv_auto('10_Dim_Distributor.csv', ALL_VARCHAR=TRUE);
CREATE OR REPLACE TABLE raw_dim_date AS SELECT * FROM read_csv_auto('11_Dim_Date.csv', ALL_VARCHAR=TRUE);

-- Verifikasi row count semua tabel
SELECT 'raw_fact_sales' AS table_name, COUNT(*) AS row_count FROM raw_fact_sales
UNION ALL SELECT 'raw_fact_inventory', COUNT(*) FROM raw_fact_inventory
UNION ALL SELECT 'raw_fact_delivery', COUNT(*) FROM raw_fact_delivery
UNION ALL SELECT 'raw_fact_target', COUNT(*) FROM raw_fact_target
UNION ALL SELECT 'raw_fact_promotion', COUNT(*) FROM raw_fact_promotion
UNION ALL SELECT 'raw_fact_complaint', COUNT(*) FROM raw_fact_complaint
UNION ALL SELECT 'raw_fact_competitor', COUNT(*) FROM raw_fact_competitor
UNION ALL SELECT 'raw_dim_product', COUNT(*) FROM raw_dim_product
UNION ALL SELECT 'raw_dim_branch', COUNT(*) FROM raw_dim_branch
UNION ALL SELECT 'raw_dim_distributor', COUNT(*) FROM raw_dim_distributor
UNION ALL SELECT 'raw_dim_date', COUNT(*) FROM raw_dim_date;

-- Cek struktur kolom (contoh Fact_Sales)
DESCRIBE raw_fact_sales;

-- Sample data
SELECT * FROM raw_fact_sales LIMIT 10;
