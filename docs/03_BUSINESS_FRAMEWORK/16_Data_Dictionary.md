# 16. Data Dictionary
## FMCG Enterprise Analytics Dashboard

---

# Purpose

The Data Dictionary provides a standardized definition of all datasets, tables, columns, and business meanings used throughout the analytics platform.

It serves as a reference for:

- Business Users
- Data Analysts
- Business Analysts
- BI Developers
- Stakeholders

---

# Dataset Overview

## Fact Tables

| Table Name | Description |
|------------|-------------|
| Fact_Sales | Sales transaction records |
| Fact_Inventory | Inventory stock movement and stock position |
| Fact_Delivery | Distributor delivery performance records |
| Fact_Target | Sales target planning records |

---

## Dimension Tables

| Table Name | Description |
|------------|-------------|
| Dim_Product | Product master data |
| Dim_Branch | Branch master data |
| Dim_Distributor | Distributor master data |
| Dim_Date | Calendar dimension |

---

# Fact_Sales

## Business Description

Contains all sales transactions across branches, distributors, channels, and products.

### Grain

```text
1 Row = 1 Sales Transaction
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Sales_ID | VARCHAR | Unique transaction identifier |
| Order_Date | DATE | Transaction date |
| Branch_ID | VARCHAR | Branch identifier |
| Distributor_ID | VARCHAR | Distributor identifier |
| SKU_ID | VARCHAR | Product identifier |
| Qty | INTEGER | Quantity sold |
| Unit_Price | DOUBLE | Product selling price |
| Gross_Revenue | DOUBLE | Revenue before discount |
| Discount_Amount | DOUBLE | Discount value |
| Net_Revenue | DOUBLE | Revenue after discount |
| COGS | DOUBLE | Cost of goods sold |
| Gross_Profit | DOUBLE | Revenue minus COGS |
| Margin_Pct | DOUBLE | Gross profit percentage |
| Sales_Channel | VARCHAR | Sales channel |
| Customer_Segment | VARCHAR | Customer segment |
| Promo_Flag | INTEGER | Promotion indicator |
| Promo_ID | VARCHAR | Promotion identifier |
| Return_Flag | INTEGER | Return indicator |
| Return_Qty | INTEGER | Returned quantity |
| Cancel_Flag | INTEGER | Cancellation indicator |
| Is_Orphan_SKU | INTEGER | Product master mismatch flag |

---

# Fact_Inventory

## Business Description

Contains inventory position and stock health information.

### Grain

```text
1 Row = 1 SKU per Branch per Day
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Snapshot_Date | DATE | Inventory snapshot date |
| Branch_ID | VARCHAR | Branch identifier |
| SKU_ID | VARCHAR | Product identifier |
| Opening_Stock | INTEGER | Opening stock balance |
| Receipt_Qty | INTEGER | Incoming stock |
| Issue_Qty | INTEGER | Outgoing stock |
| Adjustment_Qty | INTEGER | Stock adjustment |
| Closing_Stock | INTEGER | Closing stock balance |
| Stockout_Flag | INTEGER | Stockout indicator |
| Sales_Qty | INTEGER | Quantity sold |
| Inventory_Value | DOUBLE | Inventory value |
| Days_Of_Cover | DOUBLE | Inventory coverage days |

---

# Fact_Delivery

## Business Description

Contains distributor delivery and service performance data.

### Grain

```text
1 Row = 1 Delivery Order
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Delivery_ID | VARCHAR | Delivery identifier |
| Delivery_Date | DATE | Delivery date |
| Distributor_ID | VARCHAR | Distributor identifier |
| Branch_ID | VARCHAR | Destination branch |
| Lead_Time_Days | INTEGER | Delivery lead time |
| OTIF_Flag | INTEGER | On Time In Full indicator |
| Delivery_Qty | INTEGER | Delivered quantity |
| Requested_Qty | INTEGER | Requested quantity |

---

# Fact_Target

## Business Description

Contains sales planning and performance targets.

### Grain

```text
1 Row = 1 Month + Branch + Category
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Month | DATE | Target month |
| Branch_ID | VARCHAR | Branch identifier |
| Category_ID | VARCHAR | Product category |
| Target_Version | VARCHAR | Target version |
| Revenue_Target | DOUBLE | Revenue target |
| Volume_Target | INTEGER | Sales volume target |
| Margin_Target | DOUBLE | Margin target |
| Growth_Target | DOUBLE | Growth target |

---

# Dim_Product

## Business Description

Product master reference table.

### Grain

```text
1 Row = 1 SKU
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| SKU_ID | VARCHAR | Product identifier |
| SKU_Name | VARCHAR | Product name |
| Brand | VARCHAR | Product brand |
| Category | VARCHAR | Product category |
| Launch_Date | DATE | Product launch date |
| Product_Lifecycle | VARCHAR | Lifecycle stage |
| Fast_Mover_Flag | INTEGER | Fast mover indicator |
| ABC_Class | VARCHAR | Revenue contribution class |
| XYZ_Class | VARCHAR | Demand variability class |
| Shelf_Life_Days | INTEGER | Product shelf life |

---

# Dim_Branch

## Business Description

Branch master reference table.

### Grain

```text
1 Row = 1 Branch
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Branch_ID | VARCHAR | Branch identifier |
| Branch_Name | VARCHAR | Branch name |
| Region | VARCHAR | Business region |
| Region_Raw | VARCHAR | Raw region value for audit |
| Tier | VARCHAR | Branch tier |
| Population | INTEGER | Area population |
| Store_Count | INTEGER | Store count |
| Potential_Score | DOUBLE | Market potential score |
| Urban_Rural | VARCHAR | Area classification |

---

# Dim_Distributor

## Business Description

Distributor master reference table.

### Grain

```text
1 Row = 1 Distributor
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Distributor_ID | VARCHAR | Distributor identifier |
| Distributor_Name | VARCHAR | Distributor name |
| Distributor_Type | VARCHAR | Distributor category |
| Coverage_Area | VARCHAR | Service coverage |
| Warehouse_Size | INTEGER | Warehouse capacity |
| Vehicle_Count | INTEGER | Delivery fleet count |
| Salesman_Count | INTEGER | Sales force count |
| Contract_Status | VARCHAR | Contract status |

---

# Dim_Date

## Business Description

Calendar reference table.

### Grain

```text
1 Row = 1 Calendar Date
```

---

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| Date | DATE | Calendar date |
| Day | INTEGER | Day number |
| Week | INTEGER | Week number |
| Month | INTEGER | Month number |
| Quarter | INTEGER | Quarter number |
| Year | INTEGER | Year |
| Month_Name | VARCHAR | Month name |

---

# Business Classifications

## ABC Classification

| Class | Definition |
|---------|------------|
| A | Top 80% Revenue Contribution |
| B | Next 15% Revenue Contribution |
| C | Remaining 5% Revenue Contribution |

---

## XYZ Classification

| Class | Definition |
|---------|------------|
| X | Stable Demand |
| Y | Moderate Demand Variability |
| Z | High Demand Variability |

---

# Key Business Metrics

| Metric | Formula |
|----------|----------|
| Revenue | SUM(Net_Revenue) |
| Gross Profit | SUM(Gross_Profit) |
| Margin % | Gross Profit / Revenue |
| Achievement % | Revenue / Revenue Target |
| Growth % | Current Revenue / Previous Revenue |
| OTIF % | OTIF Deliveries / Total Deliveries |
| Stockout % | Stockout Events / Total Inventory Records |
| Inventory Turnover | Sales Qty / Average Inventory |
| DOC | Closing Stock / Average Daily Sales |

---

# Data Governance Notes

- All KPIs are validated in SQL before implementation in Power BI.
- Orphan products are retained and flagged for audit purposes.
- Data quality checks are performed before dashboard refresh.
- Business definitions are standardized across all dashboard pages.
- This Data Dictionary acts as the single source of reference for all project stakeholders.