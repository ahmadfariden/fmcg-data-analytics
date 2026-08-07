# 15. Project Architecture
## FMCG Enterprise Analytics Dashboard

---

# Architecture Overview

The FMCG Enterprise Analytics Dashboard was developed using a modern analytics workflow that simulates a real-world enterprise reporting environment.

The architecture covers the complete data lifecycle:

```text
Data Generation
        ↓
Raw Data Storage
        ↓
Data Profiling
        ↓
Data Cleaning
        ↓
Data Validation
        ↓
Star Schema Modeling
        ↓
Business KPI Validation
        ↓
Power BI Semantic Model
        ↓
Dashboard & Reporting
        ↓
Business Decision Support
```

---

# High-Level Architecture

```text
                    ┌──────────────────────┐
                    │  Python Data Generator │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Raw Parquet Files   │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │       DuckDB         │
                    │ Data Profiling Layer │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Data Cleaning Layer  │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Data Validation Layer│
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Star Schema Model  │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ KPI Validation Layer │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │      Power BI        │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Executive Dashboard  │
                    └──────────────────────┘
```

---

# Data Source Layer

The project begins with synthetic data generation using Python.

Generated datasets simulate a large FMCG distribution environment.

### Scale

- 20+ Million Sales Transactions
- 50 Branches
- 350 Distributors
- 4,000 Products (SKU)
- 24 Months Historical Data

---

# Raw Data Layer

Raw datasets are stored in Parquet format.

### Benefits

- Columnar Storage
- Faster Query Performance
- Reduced Storage Usage
- Easy Integration with DuckDB

### Raw Tables

```text
raw_fact_sales
raw_fact_inventory
raw_fact_delivery
raw_fact_target

raw_dim_product
raw_dim_branch
raw_dim_distributor
raw_dim_date
```

---

# Data Profiling Layer

Before cleaning, all raw datasets undergo profiling.

### Profiling Activities

- Null Analysis
- Duplicate Analysis
- Data Type Inspection
- Range Validation
- Referential Integrity Review
- Outlier Detection

---

# Data Cleaning Layer

DuckDB SQL is used to standardize and clean data.

### Cleaning Activities

- Duplicate Removal
- Date Standardization
- Missing Value Handling
- Data Type Conversion
- Revenue Correction
- Quantity Correction
- Margin Recalculation
- Distributor Imputation
- Orphan Record Flagging

### Output

```text
clean_fact_sales
clean_fact_inventory
clean_fact_delivery
clean_fact_target

clean_dim_product
clean_dim_branch
clean_dim_distributor
clean_dim_date
```

---

# Data Validation Layer

Business validation is performed before data enters reporting.

### Validation Areas

- Revenue Validation
- Margin Validation
- Growth Validation
- Achievement Validation
- Inventory Validation
- Relationship Validation
- Data Quality Monitoring

### Examples

```text
Revenue Clean vs Revenue Raw
Duplicate Validation
Margin > 100% Detection
Stock Validation
Orphan SKU Monitoring
```

---

# Data Modeling Layer

A Star Schema architecture is implemented to optimize reporting performance.

## Fact Tables

```text
Fact_Sales
Fact_Inventory
Fact_Delivery
Fact_Target
```

## Dimension Tables

```text
Dim_Product
Dim_Branch
Dim_Distributor
Dim_Date
```

---

# Star Schema Design

```text
                    Dim_Date
                        │
                        │
                        ▼
Dim_Branch ─── Fact_Sales ─── Dim_Product
                        │
                        │
                        ▼
                Dim_Distributor

Fact_Inventory
Fact_Delivery
Fact_Target
```

The model uses one-to-many relationships and a single-direction filtering strategy.

---

# KPI Validation Layer

Before implementation in Power BI, KPI calculations are validated using SQL.

### Validated KPIs

- Revenue
- Gross Profit
- Margin %
- Achievement %
- Growth %
- OTIF %
- Stockout %
- Inventory Turnover
- Days of Cover

---

# Power BI Semantic Layer

Power BI serves as the presentation and business logic layer.

### Components

- Data Model
- Relationships
- DAX Measures
- Business Logic
- Recommendation Engine

### Features

- Dynamic Filtering
- Drill Through
- Cross Filtering
- Interactive Analysis

---

# Dashboard Layer

The final dashboard consists of five business-focused reporting pages.

## Sheet 01

Executive Performance Dashboard

---

## Sheet 02

Branch Performance Dashboard

---

## Sheet 03

Distributor Performance Dashboard

---

## Sheet 04

Inventory Analytics Dashboard

---

## Sheet 05

Product & SKU Analytics Dashboard

---

# Recommendation Engine Layer

Business recommendations are generated dynamically using DAX logic.

Examples:

```text
Increase Inventory Allocation
Recovery Plan
Strategic Partner
Service Improvement Plan
Inventory Rebalancing
Promotion Push
Product Discontinuation
Replicate / Scale Up
```

---

# Stakeholder Consumption Layer

The dashboard supports decision-making across multiple business functions.

### Executive Management

- Revenue Growth
- Profitability
- Strategic Monitoring

### Sales Management

- Branch Performance
- Target Achievement

### Distributor Management

- OTIF Monitoring
- Service Performance

### Supply Chain Team

- Inventory Health
- Stockout Risk

### Category Management

- Product Portfolio Optimization
- SKU Rationalization

---

# Architecture Principles

The project architecture was designed based on:

- Scalability
- Maintainability
- Data Quality
- Business Traceability
- Reporting Performance
- Single Source of Truth (SSOT)

This architecture ensures that all dashboard metrics originate from a validated, governed, and reproducible analytics pipeline.