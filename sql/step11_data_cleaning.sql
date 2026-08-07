-- ============================================================
-- STEP 11 - Data Cleaning (versi final, semua 11 tabel)
-- ============================================================

-- ------------------------------------------------------------
-- FACT_SALES
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_sales AS
WITH dedup AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Sales_ID ORDER BY Sales_ID) AS rn
    FROM raw_fact_sales
),
deduped AS (
    SELECT * EXCLUDE (rn) FROM dedup WHERE rn = 1
),
parsed AS (
    SELECT
        Sales_ID,
        COALESCE(
            TRY_STRPTIME(Order_Date, '%Y-%m-%d'),
            TRY_STRPTIME(Order_Date, '%d/%m/%Y'),
            TRY_STRPTIME(Order_Date, '%m-%d-%Y')
        )::DATE AS Order_Date,
        Branch_ID,
        COALESCE(Distributor_ID, 'UNKNOWN') AS Distributor_ID,
        SKU_ID,
        ABS(TRY_CAST(Qty AS INTEGER)) AS Qty,
        TRY_CAST(Unit_Price AS DOUBLE) AS Unit_Price,
        TRY_CAST(Gross_Revenue AS DOUBLE) AS Gross_Revenue,
        TRY_CAST(Discount_Amount AS DOUBLE) AS Discount_Amount,
        ABS(TRY_CAST(Net_Revenue AS DOUBLE)) AS Net_Revenue,
        TRY_CAST(COGS AS DOUBLE) AS COGS,
        TRY_CAST(Gross_Profit AS DOUBLE) AS Gross_Profit,
        TRY_CAST(Margin_Pct AS DOUBLE) AS Margin_Pct_Raw,
        Sales_Channel, Customer_Segment,
        TRY_CAST(Promo_Flag AS INTEGER) AS Promo_Flag,
        NULLIF(Promo_ID, '') AS Promo_ID,
        TRY_CAST(Return_Flag AS INTEGER) AS Return_Flag,
        TRY_CAST(Return_Qty AS INTEGER) AS Return_Qty,
        TRY_CAST(Cancel_Flag AS INTEGER) AS Cancel_Flag
    FROM deduped
)
SELECT
    Sales_ID, Order_Date, Branch_ID, Distributor_ID, SKU_ID,
    Qty, Unit_Price, Gross_Revenue, Discount_Amount, Net_Revenue,
    COGS, Gross_Profit,
    COALESCE(Margin_Pct_Raw, ROUND(Gross_Profit / NULLIF(Net_Revenue, 0) * 100, 2)) AS Margin_Pct,
    Sales_Channel, Customer_Segment, Promo_Flag, Promo_ID,
    Return_Flag, Return_Qty, Cancel_Flag,
    CASE WHEN SKU_ID NOT IN (SELECT SKU_ID FROM raw_dim_product) THEN 1 ELSE 0 END AS Is_Orphan_SKU,
    CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END AS Is_Invalid_Date
FROM parsed;

-- ------------------------------------------------------------
-- FACT_INVENTORY (skema final, termasuk Potential_Lost_Sales_Value)
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_inventory AS
SELECT
    TRY_STRPTIME(Snapshot_Date, '%Y-%m-%d')::DATE AS Snapshot_Date,
    Branch_ID, SKU_ID,
    TRY_CAST(Opening_Stock AS INTEGER) AS Opening_Stock,
    TRY_CAST(Inbound_Qty AS INTEGER) AS Inbound_Qty,
    TRY_CAST(Sales_Qty AS INTEGER) AS Sales_Qty,
    TRY_CAST(Return_Qty AS INTEGER) AS Return_Qty,
    TRY_CAST(Adjustment_Qty AS INTEGER) AS Adjustment_Qty,
    ABS(TRY_CAST(Closing_Stock AS INTEGER)) AS Closing_Stock,
    TRY_CAST(Safety_Stock AS INTEGER) AS Safety_Stock,
    TRY_CAST(Stockout_Flag AS INTEGER) AS Stockout_Flag,
    COALESCE(
        TRY_CAST(Inventory_Value AS DOUBLE),
        ABS(TRY_CAST(Closing_Stock AS INTEGER)) *
            (SELECT AVG(TRY_CAST(Inventory_Value AS DOUBLE) / NULLIF(ABS(TRY_CAST(Closing_Stock AS INTEGER)),0))
             FROM raw_fact_inventory WHERE Inventory_Value IS NOT NULL)
    ) AS Inventory_Value,
    TRY_CAST(Days_Of_Cover AS DOUBLE) AS Days_Of_Cover,
    TRY_CAST(Dead_Stock_Flag AS INTEGER) AS Dead_Stock_Flag,
    TRY_CAST(Potential_Lost_Sales_Value AS DOUBLE) AS Potential_Lost_Sales_Value,
    CASE WHEN SKU_ID NOT IN (SELECT SKU_ID FROM raw_dim_product) THEN 1 ELSE 0 END AS Is_Orphan_SKU
FROM raw_fact_inventory;

-- ------------------------------------------------------------
-- FACT_DELIVERY
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_delivery AS
SELECT
    Delivery_ID, Distributor_ID, Branch_ID,
    COALESCE(
        TRY_STRPTIME(PO_Date, '%Y-%m-%d'),
        TRY_STRPTIME(PO_Date, '%d/%m/%Y'),
        TRY_STRPTIME(PO_Date, '%m-%d-%Y')
    )::DATE AS PO_Date,
    TRY_STRPTIME(Requested_Date, '%Y-%m-%d')::DATE AS Requested_Date,
    TRY_STRPTIME(Actual_Delivery_Date, '%Y-%m-%d')::DATE AS Actual_Delivery_Date,
    TRY_CAST(Delivery_Qty AS INTEGER) AS Delivery_Qty,
    TRY_CAST(Received_Qty AS INTEGER) AS Received_Qty,
    TRY_CAST(Lead_Time_Days AS INTEGER) AS Lead_Time_Days,
    TRY_CAST(Late_Delivery_Days AS INTEGER) AS Late_Delivery_Days,
    TRY_CAST(OTIF_Flag AS INTEGER) AS OTIF_Flag,
    Delivery_Status,
    CASE WHEN Distributor_ID NOT IN (SELECT Distributor_ID FROM raw_dim_distributor) THEN 1 ELSE 0 END AS Is_Orphan_Distributor
FROM raw_fact_delivery;

-- ------------------------------------------------------------
-- FACT_TARGET
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_target AS
SELECT
    TRY_STRPTIME(Month, '%Y-%m-%d')::DATE AS Month,
    Branch_ID, Category_ID, Target_Version,
    TRY_CAST(Revenue_Target AS DOUBLE) AS Revenue_Target,
    TRY_CAST(Volume_Target AS INTEGER) AS Volume_Target,
    COALESCE(
        TRY_CAST(Margin_Target AS DOUBLE),
        (SELECT AVG(TRY_CAST(t2.Margin_Target AS DOUBLE))
         FROM raw_fact_target t2
         WHERE t2.Category_ID = raw_fact_target.Category_ID AND t2.Margin_Target IS NOT NULL)
    ) AS Margin_Target,
    TRY_CAST(Growth_Target AS DOUBLE) AS Growth_Target
FROM raw_fact_target;

-- ------------------------------------------------------------
-- FACT_PROMOTION
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_promotion AS
WITH dedup AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Promo_ID ORDER BY Promo_ID) AS rn
    FROM raw_fact_promotion
)
SELECT
    Promo_ID, Brand, Category,
    TRY_STRPTIME(Start_Date, '%Y-%m-%d')::DATE AS Start_Date,
    TRY_STRPTIME(End_Date, '%Y-%m-%d')::DATE AS End_Date,
    Promo_Type,
    TRY_CAST(Promo_Budget AS DOUBLE) AS Promo_Budget,
    TRY_CAST(Expected_Lift AS DOUBLE) AS Expected_Lift,
    COALESCE(TRY_CAST(Actual_Lift AS DOUBLE), TRY_CAST(Expected_Lift AS DOUBLE)) AS Actual_Lift,
    TRY_CAST(ROI_Pct AS DOUBLE) AS ROI_Pct
FROM dedup WHERE rn = 1;

-- ------------------------------------------------------------
-- FACT_COMPLAINT
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_complaint AS
SELECT
    Complaint_ID,
    TRY_STRPTIME(Complaint_Date, '%Y-%m-%d')::DATE AS Complaint_Date,
    Branch_ID, SKU_ID, Complaint_Type, Severity,
    COALESCE(
        TRY_CAST(Resolution_Days AS INTEGER),
        (SELECT MEDIAN(TRY_CAST(r2.Resolution_Days AS INTEGER))
         FROM raw_fact_complaint r2
         WHERE r2.Severity = raw_fact_complaint.Severity AND r2.Resolution_Days IS NOT NULL)
    ) AS Resolution_Days,
    Complaint_Status,
    CASE WHEN SKU_ID NOT IN (SELECT SKU_ID FROM raw_dim_product) THEN 1 ELSE 0 END AS Is_Orphan_SKU
FROM raw_fact_complaint;

-- ------------------------------------------------------------
-- FACT_COMPETITOR
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_fact_competitor AS
SELECT
    TRY_STRPTIME(Observation_Date, '%Y-%m-%d')::DATE AS Observation_Date,
    Category_ID, Brand_ID, Competitor_Name,
    COALESCE(
        TRY_CAST(Competitor_Price AS DOUBLE),
        TRY_CAST(Our_Price AS DOUBLE) * (1 + TRY_CAST(Price_Gap_Pct AS DOUBLE)/100)
    ) AS Competitor_Price,
    TRY_CAST(Our_Price AS DOUBLE) AS Our_Price,
    TRY_CAST(Price_Gap_Pct AS DOUBLE) AS Price_Gap_Pct,
    TRY_CAST(Market_Share_Est AS DOUBLE) AS Market_Share_Est
FROM raw_fact_competitor;

-- ------------------------------------------------------------
-- DIM_PRODUCT
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_dim_product AS
SELECT
    SKU_ID, SKU_Name, Brand, Category,
    TRY_STRPTIME(Launch_Date, '%Y-%m-%d')::DATE AS Launch_Date,
    Product_Lifecycle,
    TRY_CAST(Fast_Mover_Flag AS INTEGER) AS Fast_Mover_Flag,
    ABC_Class, XYZ_Class,
    TRY_CAST(Shelf_Life_Days AS INTEGER) AS Shelf_Life_Days
FROM raw_dim_product;

-- ------------------------------------------------------------
-- DIM_BRANCH (skema final, termasuk Region_Tier & Branch_Difficulty)
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_dim_branch AS
SELECT
    Branch_ID, Branch_Name, Region, Region_Raw, Region_Tier, Tier,
    TRY_CAST(Population AS INTEGER) AS Population,
    TRY_CAST(Store_Count AS INTEGER) AS Store_Count,
    TRY_CAST(Potential_Score AS DOUBLE) AS Potential_Score,
    Urban_Rural, Branch_Difficulty
FROM raw_dim_branch;

-- ------------------------------------------------------------
-- DIM_DISTRIBUTOR
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_dim_distributor AS
SELECT
    Distributor_ID, Distributor_Name, Distributor_Type, Coverage_Area,
    TRY_CAST(Warehouse_Size AS INTEGER) AS Warehouse_Size,
    TRY_CAST(Vehicle_Count AS INTEGER) AS Vehicle_Count,
    TRY_CAST(Salesman_Count AS INTEGER) AS Salesman_Count,
    Contract_Status
FROM raw_dim_distributor;

-- ------------------------------------------------------------
-- DIM_DATE (base + perpanjangan periode)
-- ------------------------------------------------------------
CREATE OR REPLACE TABLE clean_dim_date AS
WITH base AS (
    SELECT
        TRY_STRPTIME(Date, '%Y-%m-%d')::DATE AS Date,
        TRY_CAST(Day AS INTEGER) AS Day,
        TRY_CAST(Week AS INTEGER) AS Week,
        TRY_CAST(Month AS INTEGER) AS Month,
        TRY_CAST(Quarter AS INTEGER) AS Quarter,
        TRY_CAST(Year AS INTEGER) AS Year,
        Month_Name
    FROM raw_dim_date
),
extension AS (
    SELECT
        d::DATE AS Date,
        CAST(EXTRACT(day FROM d) AS INTEGER) AS Day,
        CAST(EXTRACT(week FROM d) AS INTEGER) AS Week,
        CAST(EXTRACT(month FROM d) AS INTEGER) AS Month,
        CAST(EXTRACT(quarter FROM d) AS INTEGER) AS Quarter,
        CAST(EXTRACT(year FROM d) AS INTEGER) AS Year,
        STRFTIME(d, '%B') AS Month_Name
    FROM generate_series(DATE '2026-01-01', DATE '2026-02-28', INTERVAL 1 DAY) AS t(d)
)
SELECT * FROM base UNION ALL SELECT * FROM extension ORDER BY Date;

-- ============================================================
-- VERIFIKASI HASIL CLEANING
-- ============================================================
SELECT 'clean_fact_sales' t, COUNT(*) c FROM clean_fact_sales
UNION ALL SELECT 'clean_fact_inventory', COUNT(*) FROM clean_fact_inventory
UNION ALL SELECT 'clean_fact_delivery', COUNT(*) FROM clean_fact_delivery
UNION ALL SELECT 'clean_fact_target', COUNT(*) FROM clean_fact_target
UNION ALL SELECT 'clean_fact_promotion', COUNT(*) FROM clean_fact_promotion
UNION ALL SELECT 'clean_fact_complaint', COUNT(*) FROM clean_fact_complaint
UNION ALL SELECT 'clean_fact_competitor', COUNT(*) FROM clean_fact_competitor
UNION ALL SELECT 'clean_dim_product', COUNT(*) FROM clean_dim_product
UNION ALL SELECT 'clean_dim_branch', COUNT(*) FROM clean_dim_branch
UNION ALL SELECT 'clean_dim_distributor', COUNT(*) FROM clean_dim_distributor
UNION ALL SELECT 'clean_dim_date', COUNT(*) FROM clean_dim_date;

SELECT COUNT(*) AS remaining_duplicates
FROM (SELECT Sales_ID FROM clean_fact_sales GROUP BY Sales_ID HAVING COUNT(*) > 1);

SELECT
    SUM(CASE WHEN Qty < 0 THEN 1 ELSE 0 END) AS neg_qty,
    SUM(CASE WHEN Net_Revenue < 0 THEN 1 ELSE 0 END) AS neg_revenue
FROM clean_fact_sales;

SELECT
    SUM(CASE WHEN Distributor_ID IS NULL THEN 1 ELSE 0 END) AS null_distributor,
    SUM(CASE WHEN Margin_Pct IS NULL THEN 1 ELSE 0 END) AS null_margin
FROM clean_fact_sales;
