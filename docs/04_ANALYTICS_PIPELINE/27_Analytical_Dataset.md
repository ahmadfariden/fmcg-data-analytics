# 27. Analytical Dataset
## FMCG Enterprise Analytics Dashboard

---

# Purpose

The Analytical Dataset is the final business-ready dataset created after completing the entire data pipeline process, including:

```text
Data Collection
        ↓
Data Cleaning
        ↓
Data Validation
        ↓
Data Transformation
        ↓
Data Modeling
        ↓
Analytical Dataset
        ↓
Power BI Dashboard
```

The purpose of the Analytical Dataset is to provide a single, trusted, analysis-ready source for reporting, KPI calculation, dashboard development, and business decision-making.

---

# Analytical Dataset Architecture

```text
RAW LAYER
│
├── raw_fact_sales
├── raw_fact_inventory
├── raw_fact_delivery
├── raw_fact_target
│
├── raw_dim_product
├── raw_dim_branch
├── raw_dim_distributor
└── raw_dim_date
        ↓

CLEAN LAYER
│
├── clean_fact_sales
├── clean_fact_inventory
├── clean_fact_delivery
├── clean_fact_target
│
├── clean_dim_product
├── clean_dim_branch
├── clean_dim_distributor
└── clean_dim_date
        ↓

ANALYTICAL LAYER
│
├── fact_sales
├── fact_inventory
├── fact_delivery
├── fact_target
│
├── dim_product
├── dim_branch
├── dim_distributor
└── dim_date
        ↓

POWER BI MODEL
```

---

# Business Objective

The analytical dataset was designed to support:

- Executive Reporting
- Commercial Analytics
- Branch Performance Monitoring
- Distributor Performance Analysis
- Inventory Optimization
- Product Portfolio Analysis
- Promotion Analysis
- Supply Chain Monitoring

---

# Dataset Design Principles

## Single Source of Truth (SSOT)

All reports and KPIs originate from one validated dataset.

---

## Business-Oriented

Dataset structure follows business processes rather than operational systems.

---

## Scalable

Capable of supporting:

```text
20+ Million Transactions
Multiple Years
Multi-Branch Operations
Multi-Distributor Operations
```

---

## Analytics-Ready

Designed for:

- SQL Analysis
- KPI Calculation
- Power BI Modeling
- DAX Calculation
- Dashboard Reporting

---

# Fact Tables

---

## Fact Sales

### Purpose

Stores all sales transactions.

### Granularity

```text
1 Row = 1 Sales Transaction
```

### Key Metrics

```text
Revenue
Gross Profit
Margin %
Quantity
Discount
Returns
```

### Approximate Size

```text
20,000,000+ Rows
```

---

## Fact Inventory

### Purpose

Stores inventory snapshots and stock movements.

### Granularity

```text
1 Row = SKU x Branch x Date
```

### Key Metrics

```text
Opening Stock
Closing Stock
Inventory Value
DOC
Stockout Flag
```

---

## Fact Delivery

### Purpose

Stores distributor delivery performance.

### Granularity

```text
1 Row = Delivery Transaction
```

### Key Metrics

```text
OTIF Flag
Lead Time
Delivery Quantity
```

---

## Fact Target

### Purpose

Stores business targets.

### Granularity

```text
1 Row = Month x Branch x Category
```

### Key Metrics

```text
Revenue Target
Volume Target
Margin Target
Growth Target
```

---

# Dimension Tables

---

## Dim Product

### Purpose

Product master reference.

### Key Attributes

```text
SKU_ID
SKU_Name
Brand
Category
ABC_Class
XYZ_Class
Product_Lifecycle
```

---

## Dim Branch

### Purpose

Branch master reference.

### Key Attributes

```text
Branch_ID
Branch_Name
Region
Tier
Population
Store_Count
Potential_Score
```

---

## Dim Distributor

### Purpose

Distributor master reference.

### Key Attributes

```text
Distributor_ID
Distributor_Name
Distributor_Type
Coverage_Area
Warehouse_Size
Vehicle_Count
Salesman_Count
```

---

## Dim Date

### Purpose

Time intelligence support.

### Key Attributes

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

# Analytical Relationships

## Star Schema Model

```text
                 Dim_Date
                     |
                     |
                     |
Dim_Product ---- Fact_Sales ---- Dim_Branch
                     |
                     |
                     |
             Dim_Distributor
```

Additional relationships:

```text
Fact_Inventory
Fact_Delivery
Fact_Target
```

connected to the same dimensions.

---

# Business Metrics Supported

The analytical dataset supports:

### Commercial Metrics

```text
Revenue
Gross Profit
Margin %
Achievement %
Growth %
```

---

### Inventory Metrics

```text
DOC
Inventory Turnover
Stockout %
Dead Stock %
```

---

### Distributor Metrics

```text
OTIF %
Lead Time
Distributor Revenue
```

---

### Product Metrics

```text
ABC Analysis
XYZ Analysis
Revenue Contribution %
Fast Moving SKU
Slow Moving SKU
```

---

### Promotion Metrics

```text
Promo Revenue
Promo ROI
Sales Uplift %
```

---

# Data Quality Controls

Before entering the analytical layer, all datasets pass validation checks.

---

## Sales Validation

```text
Duplicate Sales_ID
Missing Distributor
Negative Revenue
Negative Quantity
Invalid Dates
```

---

## Inventory Validation

```text
Stock Consistency
Inventory Accuracy
Stockout Validation
```

---

## Target Validation

```text
Missing Targets
Branch Matching
Category Matching
```

---

## Relationship Validation

```text
Branch Matching
Distributor Matching
Product Matching
Date Matching
```

---

# Dataset Consumption Layer

The analytical dataset serves as the source for:

---

## Power BI Dashboards

```text
01 Executive Overview
02 Branch Performance
03 Distributor Performance
04 Inventory Analytics
05 Product Analytics
```

---

## SQL Analysis

Used for:

```text
Ad-Hoc Analysis
KPI Validation
Business Investigation
```

---

## Executive Reporting

Used for:

```text
Monthly Business Reviews
Quarterly Performance Reviews
Strategic Planning
```

---

# Dataset Performance Optimization

To support 20M+ transactions:

### DuckDB Optimization

```text
Columnar Storage
Vectorized Execution
Parquet Integration
```

---

### Power BI Optimization

```text
Star Schema
Measure-Based Calculations
Dimension Filtering
Aggregation Strategy
```

---

# Analytical Dataset Outcome

The final analytical dataset provides a centralized, validated, business-ready foundation for enterprise reporting and analytics.

It enables stakeholders across:

- Executive Management
- Commercial Teams
- Supply Chain Teams
- Inventory Planning Teams
- Distributor Management Teams
- Category Management Teams

to make data-driven decisions using a consistent and trusted source of information.

The Analytical Dataset acts as the core data asset powering the FMCG Enterprise Analytics Dashboard and establishes a scalable Single Source of Truth (SSOT) for the organization.