# 29. Power Query Data Refresh
## FMCG Enterprise Analytics Dashboard

---

# Purpose

Power Query Data Refresh is responsible for loading, transforming, validating, and refreshing analytical datasets from DuckDB into Power BI.

The objective is to create a repeatable, automated, and scalable refresh process that ensures all dashboard metrics are generated from the latest validated data.

---

# Business Objective

The Power Query layer was designed to:

- Automate data ingestion
- Reduce manual reporting effort
- Standardize data transformation
- Improve dashboard reliability
- Maintain Single Source of Truth (SSOT)
- Support scalable data refresh processes

---

# Refresh Architecture

```text
Parquet Files
      ↓
DuckDB
      ↓
SQL Cleaning
      ↓
SQL Validation
      ↓
Analytical Tables
      ↓
Power Query
      ↓
Power BI Data Model
      ↓
Dashboard Refresh
```

---

# Data Refresh Workflow

```text
Step 1
Connect Power BI to DuckDB
        ↓

Step 2
Load Analytical Tables
        ↓

Step 3
Apply Power Query Transformations
        ↓

Step 4
Validate Row Counts
        ↓

Step 5
Refresh Data Model
        ↓

Step 6
Refresh DAX Measures
        ↓

Step 7
Update Dashboard Visuals
```

---

# Data Sources

The dashboard consumes data from the validated analytical layer.

---

## Source Tables

```text
fact_sales
fact_inventory
fact_delivery
fact_target

dim_product
dim_branch
dim_distributor
dim_date
```

---

# Power Query Responsibilities

Power Query is intentionally limited to lightweight transformations.

Heavy transformations are handled in DuckDB.

---

# Transformation Strategy

## DuckDB

Handles:

```text
Data Cleaning
Data Validation
Business Rules
Aggregations
KPI Preparation
```

---

## Power Query

Handles:

```text
Column Renaming
Data Type Validation
Relationship Preparation
Minor Business Labels
Refresh Automation
```

---

# Refresh Process

## Fact Sales Refresh

### Purpose

Load sales transactions into Power BI.

### Validation

```text
Row Count Check
Date Range Check
Revenue Validation
```

---

## Fact Inventory Refresh

### Purpose

Load inventory snapshots.

### Validation

```text
Stock Quantity Validation
Inventory Value Validation
DOC Validation
```

---

## Fact Delivery Refresh

### Purpose

Load distributor delivery performance.

### Validation

```text
OTIF Validation
Lead Time Validation
```

---

## Fact Target Refresh

### Purpose

Load commercial targets.

### Validation

```text
Revenue Target Validation
Margin Target Validation
Growth Target Validation
```

---

# Dimension Refresh Process

---

## Product Dimension

Validation:

```text
SKU Count
Brand Count
Category Count
```

---

## Branch Dimension

Validation:

```text
Branch Count
Region Count
Tier Count
```

---

## Distributor Dimension

Validation:

```text
Distributor Count
Coverage Area Count
```

---

## Date Dimension

Validation:

```text
Date Coverage
Month Coverage
Year Coverage
```

---

# Refresh Validation Checks

After every refresh, Power Query validates:

---

## Row Count Validation

```text
Expected Rows
vs
Loaded Rows
```

---

## Null Value Validation

Critical fields checked:

```text
SKU_ID
Branch_ID
Date
Revenue
```

---

## Data Type Validation

Examples:

```text
Revenue → Decimal
Date → Date
Quantity → Integer
```

---

## Relationship Validation

Verify relationships between:

```text
Fact Sales ↔ Product
Fact Sales ↔ Branch
Fact Sales ↔ Distributor
Fact Sales ↔ Date
```

---

# Refresh Performance Optimization

---

## Incremental Loading Strategy

Large fact tables are loaded efficiently through:

```text
Date-Based Filtering
Partition Strategy
```

---

## Query Folding

Where possible:

```text
DuckDB Executes Query
Power BI Receives Results
```

Reducing memory consumption.

---

## Column Reduction

Only required columns are imported.

Benefits:

```text
Smaller Dataset
Faster Refresh
Lower Memory Usage
```

---

# Refresh Monitoring

## Metrics Tracked

```text
Refresh Duration
Rows Loaded
Refresh Success Rate
```

---

## Error Monitoring

Tracked issues include:

```text
Missing Files
Schema Changes
Null Keys
Relationship Failures
```

---

# Data Refresh Governance

Each refresh follows:

---

## Validation Checklist

```text
Row Counts Match
No Critical Nulls
Relationships Valid
Measures Refresh Correctly
```

---

## Approval Process

```text
Refresh Completed
Validation Passed
Dashboard Published
```

---

# Refresh Frequency

## Development Environment

```text
Manual Refresh
```

Used during dashboard development.

---

## Production Environment

```text
Scheduled Refresh
```

Potential schedules:

```text
Daily
Weekly
Monthly
```

depending on business requirements.

---

# Power Query Best Practices Applied

## Rule 1

Heavy transformations performed in DuckDB.

---

## Rule 2

Power Query used only for lightweight preparation.

---

## Rule 3

Minimize imported columns.

---

## Rule 4

Maintain star schema integrity.

---

## Rule 5

Validate data after every refresh.

---

# Business Benefits

The refresh process provides:

- Automated Reporting
- Reduced Manual Work
- Consistent KPI Calculation
- Faster Dashboard Updates
- Improved Data Reliability

---

# Technical Benefits

The refresh architecture supports:

- 20M+ Transaction Records
- Enterprise Reporting
- Scalable Data Models
- Efficient Power BI Performance

---

# Power Query Data Refresh Outcome

The Power Query layer acts as the final bridge between the validated analytical dataset and the Power BI reporting environment.

By combining:

- DuckDB Data Processing
- SQL Validation
- Power Query Refresh Automation
- Power BI Data Modeling

the FMCG Enterprise Analytics Dashboard delivers a reliable, scalable, and business-ready reporting platform that supports executive decision-making through a trusted Single Source of Truth (SSOT).