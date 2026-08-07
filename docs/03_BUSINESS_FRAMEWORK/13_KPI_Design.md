# KPI Design Framework
## FMCG Enterprise Analytics Dashboard

---

# KPI Design Objective

The KPI framework was designed to monitor business performance across multiple business functions, including:

- Executive Management
- Commercial & Sales
- Distributor Management
- Supply Chain
- Inventory Management
- Category Management

All KPIs were validated in SQL before being implemented as DAX measures in Power BI to ensure business accuracy and consistency.

---

# KPI Layer Structure

```text
Business Objective
        ↓
Business KPI Definition
        ↓
SQL KPI Validation
        ↓
DAX Measure Implementation
        ↓
Power BI Dashboard
        ↓
Business Insight & Recommendation
```

---

# Sheet 01 — Executive Performance Dashboard

## Revenue

**Business Purpose**

Measure total realized sales revenue.

**Formula**

```text
Revenue = SUM(Net Revenue)
```

**Business Question**

How much revenue has the company generated?

---

## Gross Profit

**Business Purpose**

Measure total profit generated after deducting COGS.

**Formula**

```text
Gross Profit = SUM(Gross Profit)
```

---

## Margin %

**Business Purpose**

Measure profitability efficiency.

**Formula**

```text
Margin % = Gross Profit / Revenue
```

---

## Achievement %

**Business Purpose**

Compare actual performance against business targets.

**Formula**

```text
Achievement % = Actual Revenue / Revenue Target
```

---

## YoY Growth %

**Business Purpose**

Measure business growth versus previous year.

**Formula**

```text
Growth % =
(Current Revenue - Previous Revenue)
/ Previous Revenue
```

---

# Sheet 02 — Branch Performance Dashboard

## Branch Revenue

Measure branch sales contribution.

---

## Branch Gross Profit

Measure branch profitability.

---

## Branch Margin %

Evaluate branch profit efficiency.

---

## Branch Achievement %

Compare branch actual sales against target.

---

## Branch Growth %

Evaluate branch growth trend.

---

## Top Performing Branches

Identify branches exceeding business expectations.

---

## Underperforming Branches

Identify branches requiring recovery plans.

---

# Sheet 03 — Distributor Performance Dashboard

## Distributor Revenue

Measure revenue contribution by distributor.

---

## Distributor Achievement %

Evaluate distributor target attainment.

---

## OTIF %

**On Time In Full**

Measure delivery service quality.

**Formula**

```text
OTIF % =
On-Time & Complete Deliveries
/
Total Deliveries
```

---

## Lead Time

Measure average delivery cycle duration.

---

## Best Distributor Score

Identify high-performing distributors.

---

## At-Risk Distributor Score

Identify distributors requiring corrective action.

---

# Sheet 04 — Inventory Analytics Dashboard

## Inventory Value

Measure total inventory investment.

---

## Days of Cover (DOC)

Measure inventory sustainability.

**Formula**

```text
DOC =
Current Stock
/
Average Daily Sales
```

---

## Stockout %

Measure inventory availability risk.

**Formula**

```text
Stockout % =
Stockout Events
/
Inventory Observations
```

---

## Inventory Turnover

Measure inventory movement efficiency.

**Formula**

```text
Inventory Turnover =
Sales Quantity
/
Average Inventory
```

---

## Critical Stock Risk

Identify high-demand products with low stock coverage.

---

## Dead Stock Value

Identify inventory with no significant movement.

---

# Sheet 05 — Product & SKU Analytics Dashboard

## Product Revenue

Measure product sales contribution.

---

## Product Margin %

Evaluate product profitability.

---

## Product Growth %

Measure product growth performance.

---

## ABC Classification

Classify products based on revenue contribution.

### A Class

Top revenue contributors.

### B Class

Medium contributors.

### C Class

Long-tail contributors.

---

## XYZ Classification

Classify products based on demand stability.

### X Class

Stable demand.

### Y Class

Moderately variable demand.

### Z Class

Highly variable demand.

---

## Fast Moving SKU

Products with high sales velocity.

---

## Slow Moving SKU

Products with low sales velocity.

---

## Long Tail %

Measure proportion of low-contribution products.

**Formula**

```text
Long Tail % =
C-Class SKU Count
/
Total SKU Count
```

---

# Business Recommendation Measures

Each analytical table contains a dedicated recommendation engine based on its own business logic.

Examples:

- Branch Recovery Plan
- Branch Expansion Opportunity
- Distributor Development Program
- Distributor Risk Mitigation
- Inventory Rebalancing
- Reduce Purchase Quantity
- Promotion Push
- Product Discontinuation
- Replicate / Scale Up
- Monitor Performance

This approach ensures recommendations are aligned with the specific business context of each dashboard page rather than applying a generic recommendation across all analyses.

---

# KPI Validation Process

Before implementation in Power BI, all KPI calculations were validated in SQL using DuckDB.

Validation covered:

- Revenue Validation
- Margin Validation
- Achievement Validation
- Growth Validation
- Stockout Validation
- OTIF Validation
- Inventory Turnover Validation
- Relationship Integrity Validation
- Data Quality Validation

This process ensures that all dashboard KPIs are business-valid, traceable, and reproducible.

---

# Final KPI Coverage

## Executive KPIs

- Revenue
- Gross Profit
- Margin %
- Achievement %
- Growth %

## Branch KPIs

- Revenue
- Profit
- Margin %
- Achievement %
- Growth %

## Distributor KPIs

- Revenue
- Achievement %
- OTIF %
- Lead Time

## Inventory KPIs

- Inventory Value
- DOC
- Stockout %
- Inventory Turnover
- Dead Stock

## Product KPIs

- Revenue
- Margin %
- Growth %
- ABC Analysis
- XYZ Analysis
- Fast Moving SKU
- Slow Moving SKU
- Long Tail %

The KPI framework serves as the foundation for business monitoring, performance management, risk identification, and strategic decision-making across the FMCG distribution network.