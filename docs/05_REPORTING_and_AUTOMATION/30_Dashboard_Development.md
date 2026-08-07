# 30. Dashboard Development
## FMCG Enterprise Analytics Dashboard

---

# Purpose

Dashboard Development is the process of transforming validated business data into an interactive decision-support platform that enables stakeholders to monitor performance, identify risks, uncover opportunities, and take data-driven actions.

The dashboard is designed as a centralized reporting solution that serves multiple departments across the organization.

---

# Business Objective

The dashboard was developed to:

- Provide a Single Source of Truth (SSOT)
- Monitor business performance in real time
- Improve decision-making speed
- Reduce manual reporting effort
- Standardize KPI reporting
- Support strategic planning

---

# Dashboard Architecture

```text
Parquet Files
      ↓
DuckDB
      ↓
SQL Cleaning
      ↓
SQL Validation
      ↓
Analytical Dataset
      ↓
Power Query
      ↓
Star Schema Model
      ↓
DAX Measures
      ↓
Power BI Dashboard
```

---

# Dashboard Design Principles

## Executive First

Dashboard prioritizes business decisions over visual complexity.

---

## KPI Driven

Every visual supports a measurable business objective.

---

## Interactive

Users can drill down into:

```text
Year
Quarter
Month
Region
Branch
Distributor
Category
Brand
ABC Class
XYZ Class
```

---

## Scalable

Supports:

```text
20M+ Transactions
Multi-Year Analysis
Enterprise Reporting
```

---

# Dashboard Structure

## Total Pages

```text
5 Dashboard Pages
```

---

# Page 1
## Executive Overview

---

### Purpose

Provide a high-level business performance summary.

---

### Main KPIs

```text
Revenue
Gross Profit
Margin %
Achievement %
Growth %
Stockout %
```

---

### Key Visuals

```text
KPI Cards
Revenue Trend
Revenue by Region
Revenue by Category
Top 10 Branches
Top 10 Products
```

---

### Primary Users

```text
CEO
Commercial Director
Supply Chain Director
Executive Team
```

---

# Page 2
## Branch Performance Analysis

---

### Purpose

Evaluate branch-level business performance.

---

### Main KPIs

```text
Revenue
Growth %
Achievement %
Margin %
```

---

### Key Visuals

```text
Branch Ranking
Achievement Analysis
Growth Analysis
Regional Comparison
```

---

### Tables

```text
Top Performing Branches
Underperforming Branches
```

---

### Primary Users

```text
Regional Managers
Sales Managers
Commercial Team
```

---

# Page 3
## Distributor Performance Analysis

---

### Purpose

Evaluate distributor contribution and service quality.

---

### Main KPIs

```text
Revenue
OTIF %
Lead Time
Growth %
```

---

### Key Visuals

```text
Distributor Ranking
OTIF Analysis
Lead Time Analysis
Growth Analysis
```

---

### Tables

```text
Best Distributors
At-Risk Distributors
```

---

### Primary Users

```text
Supply Chain Team
Distributor Management Team
Operations Team
```

---

# Page 4
## Inventory Analytics

---

### Purpose

Monitor inventory health and supply chain risks.

---

### Main KPIs

```text
Inventory Value
Inventory Turnover
DOC
Stockout %
```

---

### Key Visuals

```text
Inventory Trend
DOC Distribution
Inventory Turnover Analysis
Stockout Analysis
```

---

### Tables

```text
Critical Stock Risk
Dead Stock List
```

---

### Primary Users

```text
Inventory Team
Supply Chain Team
Planning Team
```

---

# Page 5
## Product Analytics

---

### Purpose

Evaluate product portfolio performance.

---

### Main KPIs

```text
Revenue
Margin %
Growth %
Contribution %
```

---

### Key Visuals

```text
ABC Analysis
XYZ Analysis
Revenue by Brand
Revenue by Category
```

---

### Tables

```text
Fast Moving SKU
Slow Moving SKU
```

---

### Primary Users

```text
Category Manager
Commercial Team
Product Team
```

---

# Global Filters

Every dashboard page contains standardized filters.

---

## Slicers

```text
Year
Quarter
Month
Region
Branch
Distributor
Category
Brand
ABC Class
XYZ Class
```

---

## Purpose

Enable consistent analysis across all pages.

---

# KPI Development

The dashboard contains:

```text
40+ Custom DAX Measures
```

used for:

- Revenue Analysis
- Profitability Analysis
- Inventory Analysis
- Distributor Analysis
- Product Analysis

---

# Business Logic Integration

Dashboard incorporates business rules for:

---

## Branch Classification

```text
Top Performance
Average Performance
Underperforming
```

---

## Inventory Classification

```text
Critical Stock
Healthy Stock
Overstock
Dead Stock
```

---

## Product Classification

```text
ABC Analysis
XYZ Analysis
Fast Moving
Slow Moving
```

---

## Distributor Classification

```text
Best Distributor
At-Risk Distributor
```

---

# Automated Recommendation Engine

Each analytical table includes automated recommendations generated through business logic.

---

## Examples

### Top Branches

```text
Increase inventory allocation
Expand sales coverage
Replicate best practices
```

---

### Critical Stock

```text
Immediate replenishment required
```

---

### Dead Stock

```text
Liquidation campaign recommended
```

---

### At-Risk Distributor

```text
Performance review required
```

---

# User Experience Design

The dashboard emphasizes:

---

## Simplicity

Users should understand performance within seconds.

---

## Consistency

All pages follow the same layout structure.

---

## Accessibility

Business users do not require technical expertise.

---

## Actionability

Every page supports operational decision-making.

---

# Performance Optimization

---

## Star Schema

Used to improve model efficiency.

---

## Measure-Based Calculations

Minimizes calculated columns.

---

## Reduced Cardinality

Optimized filtering performance.

---

## Query Optimization

Heavy calculations performed in DuckDB.

---

# Dashboard Validation

Before publication:

---

## KPI Validation

```text
Power BI Result
=
SQL Result
```

---

## Visual Validation

```text
Cards
Charts
Tables
Filters
```

verified against source data.

---

## Business Validation

Confirmed with:

```text
Business Rules
KPI Definitions
Stakeholder Requirements
```

---

# Dashboard Governance

The dashboard follows:

---

## Design Standards

```text
Consistent Layout
Consistent KPI Definitions
Consistent Navigation
```

---

## Version Standards

```text
Development Version
Testing Version
Production Version
```

---

# Business Benefits

The dashboard enables:

- Faster Decision Making
- Standardized Reporting
- Improved Business Visibility
- Reduced Reporting Effort
- Better Resource Allocation

---

# Stakeholders Supported

```text
CEO
Commercial Director
Supply Chain Director
Regional Manager
Sales Manager
Category Manager
Inventory Planner
Distributor Manager
Business Analyst
```

---

# Dashboard Development Outcome

The FMCG Enterprise Analytics Dashboard transforms more than 20 million transactional records into a centralized business intelligence platform.

Through:

- DuckDB
- SQL
- Power Query
- Star Schema Modeling
- DAX
- Power BI

the dashboard provides a scalable enterprise-grade analytics solution that supports commercial performance management, supply chain optimization, inventory control, distributor governance, and strategic business decision-making through a trusted Single Source of Truth (SSOT).