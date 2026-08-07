# 18. Data Transformation
## FMCG Enterprise Analytics Dashboard

---

# Purpose

The Data Transformation stage converts raw operational data into a clean, validated, and analytics-ready dataset that can be used for reporting, KPI calculations, and business decision-making.

The objective is to ensure consistency, accuracy, and business usability before data enters the Power BI semantic layer.

---

# Transformation Workflow

```text
Raw Data
    ↓
Data Profiling
    ↓
Data Cleaning
    ↓
Data Standardization
    ↓
Business Rule Application
    ↓
Data Validation
    ↓
Clean Analytics Tables
    ↓
Star Schema Modeling
    ↓
Power BI
```

---

# Source Tables

## Raw Fact Tables

```text
raw_fact_sales
raw_fact_inventory
raw_fact_delivery
raw_fact_target
```

---

## Raw Dimension Tables

```text
raw_dim_product
raw_dim_branch
raw_dim_distributor
raw_dim_date
```

---

# Transformation Layer

All transformations were performed using DuckDB SQL.

---

# Fact_Sales Transformation

## 1. Duplicate Transaction Removal

### Business Problem

Duplicate Sales_ID records inflate revenue and KPI calculations.

### Transformation

```sql
ROW_NUMBER()
PARTITION BY Sales_ID
```

Only the first occurrence is retained.

---

## 2. Date Standardization

### Business Problem

Multiple date formats existed in source data.

### Supported Formats

```text
YYYY-MM-DD
DD/MM/YYYY
MM-DD-YYYY
```

### Transformation

```sql
TRY_STRPTIME()
```

All dates converted into:

```text
DATE
```

---

## 3. Missing Distributor Handling

### Business Problem

Some transactions contained missing Distributor_ID.

### Transformation

```sql
COALESCE(Distributor_ID,'UNKNOWN')
```

---

## 4. Margin Reconstruction

### Business Problem

Missing Margin_Pct values.

### Transformation

```sql
Gross_Profit / Net_Revenue
```

Margin percentage recalculated automatically.

---

## 5. Negative Quantity Correction

### Business Problem

Negative quantities caused reporting inconsistencies.

### Transformation

```sql
ABS(Qty)
```

---

## 6. Negative Revenue Correction

### Business Problem

Negative revenue values created incorrect KPI calculations.

### Transformation

```sql
ABS(Net_Revenue)
```

---

## 7. Orphan Product Detection

### Business Problem

Sales transactions referenced products missing from the product master.

### Transformation

Products are not deleted.

Instead:

```sql
Is_Orphan_SKU = 1
```

for audit and monitoring purposes.

---

# Fact_Target Transformation

## Missing Margin Target Imputation

### Business Problem

Missing Margin_Target values.

### Transformation Logic

```sql
AVG(Margin_Target)
by Category
```

Missing values replaced using category-level averages.

---

# Fact_Inventory Transformation

## Stock Consistency Standardization

### Validation Rules

```text
Opening Stock
+ Receipt Qty
- Issue Qty
± Adjustment Qty
=
Closing Stock
```

Inventory balances standardized before reporting.

---

## Stockout Flag Generation

### Transformation

```text
Closing Stock <= 0
```

becomes:

```text
Stockout_Flag = 1
```

---

## Days of Cover Calculation

### Formula

```text
Closing Stock
/
Average Daily Sales
```

Used for inventory health monitoring.

---

# Fact_Delivery Transformation

## Lead Time Standardization

### Transformation

Lead Time converted into:

```text
Integer Days
```

---

## OTIF Flag Validation

### Business Rule

```text
Delivered On Time
AND
Delivered In Full
```

Results in:

```text
OTIF_Flag = 1
```

---

# Dim_Product Transformation

## Data Type Standardization

### Transformations

```text
Launch_Date → DATE
Fast_Mover_Flag → INTEGER
Shelf_Life_Days → INTEGER
```

---

## Product Classification Retention

Existing classifications preserved:

```text
ABC_Class
XYZ_Class
Fast_Mover_Flag
```

---

# Dim_Branch Transformation

## Regional Standardization

Two regional fields maintained:

```text
Region
Region_Raw
```

### Purpose

| Field | Usage |
|---------|---------|
| Region | Reporting |
| Region_Raw | Data Quality Audit |

---

## Numeric Field Standardization

```text
Population
Store_Count
Potential_Score
```

converted into analytics-ready formats.

---

# Dim_Distributor Transformation

## Capacity Standardization

Converted to numeric formats:

```text
Warehouse_Size
Vehicle_Count
Salesman_Count
```

---

# Dim_Date Transformation

## Calendar Normalization

All calendar fields standardized:

```text
Date
Day
Week
Month
Quarter
Year
Month_Name
```

---

# Business Logic Transformation

Several business metrics were derived during transformation.

---

## Revenue

```text
Revenue = Net Revenue
```

---

## Gross Profit

```text
Gross Profit =
Net Revenue - COGS
```

---

## Margin %

```text
Margin % =
Gross Profit / Revenue
```

---

## Achievement %

```text
Revenue / Revenue Target
```

---

## Growth %

```text
(Current Revenue - Previous Revenue)
/
Previous Revenue
```

---

## Inventory Turnover

```text
Sales Qty
/
Average Inventory
```

---

## OTIF %

```text
OTIF Deliveries
/
Total Deliveries
```

---

# Transformation Validation

After transformation, all datasets underwent validation checks.

---

## Sales Validation

- Duplicate Check
- Revenue Check
- Margin Check
- Missing Value Check

---

## Inventory Validation

- Stock Formula Validation
- Stockout Validation
- DOC Validation

---

## Delivery Validation

- Lead Time Validation
- OTIF Validation

---

## Master Data Validation

- Product Integrity
- Branch Integrity
- Distributor Integrity

---

# Transformation Outputs

## Clean Fact Tables

```text
clean_fact_sales
clean_fact_inventory
clean_fact_delivery
clean_fact_target
```

---

## Clean Dimension Tables

```text
clean_dim_product
clean_dim_branch
clean_dim_distributor
clean_dim_date
```

---

# Transformation Outcome

The transformation layer converted raw synthetic FMCG operational data into a governed analytics dataset suitable for:

- KPI Reporting
- Executive Dashboards
- Branch Performance Analysis
- Distributor Performance Monitoring
- Inventory Optimization
- Product Portfolio Analysis
- Business Recommendation Generation

The transformed datasets serve as the foundation of the Power BI semantic model and ensure that all dashboard metrics are accurate, consistent, and business-ready.