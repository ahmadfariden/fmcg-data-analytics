# 14. Business Rules
## FMCG Enterprise Analytics Dashboard

---

# Purpose

Business Rules define the operational logic, KPI calculations, data standards, and decision criteria used throughout the analytics pipeline.

The objective is to ensure all stakeholders interpret business performance consistently and make decisions based on the same set of rules.

---

# Sales Rules

## Revenue Calculation

Revenue is calculated using Net Revenue after discounts.

```text
Revenue = Net Revenue
```

---

## Gross Profit Calculation

```text
Gross Profit = Net Revenue - COGS
```

---

## Margin %

```text
Margin % = Gross Profit / Net Revenue
```

---

## Sales Achievement %

```text
Achievement % = Actual Revenue / Revenue Target
```

### Interpretation

| Achievement % | Status |
|--------------|---------|
| > 120% | Exceptional |
| 100% - 120% | Above Target |
| 90% - 99% | Near Target |
| < 90% | Underperforming |

---

## Growth %

```text
Growth % =
(Current Period Revenue - Previous Period Revenue)
/
Previous Period Revenue
```

### Interpretation

| Growth % | Status |
|-----------|---------|
| > 10% | Strong Growth |
| 0% - 10% | Stable Growth |
| < 0% | Declining |

---

# Branch Performance Rules

## Top Performing Branch

A branch is classified as Top Performing when:

```text
Achievement % >= 100%
AND
Growth % > 0
AND
Margin % >= Company Average
```

---

## Underperforming Branch

A branch is classified as Underperforming when:

```text
Achievement % < 90%
OR
Growth % < 0
```

---

# Distributor Rules

## OTIF (On Time In Full)

```text
OTIF % =
On Time Deliveries
/
Total Deliveries
```

### Performance Standard

| OTIF % | Status |
|---------|---------|
| >= 95% | Excellent |
| 90% - 94% | Acceptable |
| < 90% | At Risk |

---

## Distributor Risk Classification

Distributor is considered At Risk when:

```text
OTIF % < 90%
OR
Lead Time > Company Average
```

---

## Best Distributor Classification

Distributor is classified as Best Distributor when:

```text
OTIF % >= 95%
AND
Revenue Contribution Above Average
```

---

# Inventory Rules

## Stockout Event

A Stockout occurs when:

```text
Closing Stock <= 0
```

---

## Stockout %

```text
Stockout % =
Stockout Events
/
Total Inventory Records
```

---

## Days of Cover (DOC)

```text
DOC =
Closing Stock
/
Average Daily Sales
```

### DOC Classification

| DOC | Status |
|------|---------|
| < 15 | Critical |
| 15 - 30 | Low |
| 31 - 90 | Healthy |
| > 90 | Excess Stock |

---

## Critical Stock Risk

SKU is classified as Critical Stock Risk when:

```text
DOC < 15
AND
Revenue Contribution Above Average
```

---

## Dead Stock

SKU is classified as Dead Stock when:

```text
No Sales Activity
AND
DOC >= 180
```

---

# Product Rules

## Fast Moving SKU

SKU is classified as Fast Moving when:

```text
Sales Velocity Above Average
```

---

## Slow Moving SKU

SKU is classified as Slow Moving when:

```text
Sales Velocity Below Average
```

---

## ABC Classification

Products are classified based on cumulative revenue contribution.

### Class A

```text
Top 80% Revenue Contribution
```

### Class B

```text
Next 15% Revenue Contribution
```

### Class C

```text
Remaining 5% Revenue Contribution
```

---

## XYZ Classification

Products are classified based on demand variability.

### X

```text
Stable Demand
Low Variability
```

### Y

```text
Moderate Variability
```

### Z

```text
Highly Variable Demand
```

---

# Business Recommendation Rules

## Branch Recommendation

| Condition | Recommendation |
|------------|----------------|
| Achievement > 120% | Increase Inventory Allocation |
| Achievement 100%-120% | Increase Sales Force |
| Achievement 90%-99% | Launch Local Promotion |
| Achievement < 90% | Recovery Plan |

---

## Product Recommendation

| Condition | Recommendation |
|------------|----------------|
| High Revenue + High Growth + Healthy DOC | Replicate / Scale Up |
| High Revenue + High DOC | Inventory Rebalancing |
| Medium Revenue + High DOC | Reduce Purchase Quantity |
| Low Revenue + Negative Growth + High DOC | Promotion Push |
| Low Revenue + Negative Growth + Very High DOC | Product Discontinuation |

---

## Distributor Recommendation

| Condition | Recommendation |
|------------|----------------|
| High Revenue + High OTIF | Strategic Partner |
| High Revenue + Low OTIF | Service Improvement Plan |
| Low Revenue + High OTIF | Business Development |
| Low Revenue + Low OTIF | Contract Review |

---

# Data Quality Rules

## Duplicate Transactions

```text
One Sales_ID = One Transaction
```

Duplicate Sales_ID records are removed during data cleaning.

---

## Missing Distributor

```text
Missing Distributor_ID
→ UNKNOWN
```

---

## Negative Quantity

```text
Negative Qty
→ Converted to Absolute Value
```

---

## Negative Revenue

```text
Negative Revenue
→ Converted to Absolute Value
```

---

## Missing Margin %

```text
Margin % Recalculated
Using:
Gross Profit / Net Revenue
```

---

## Orphan SKU

Products not found in Product Master are not deleted.

Instead:

```text
Is_Orphan_SKU = 1
```

for audit and monitoring purposes.

---

# Governance Principle

All KPI calculations, classifications, recommendations, and business rules are validated in SQL before implementation in Power BI to ensure consistency, traceability, and business accuracy across the entire analytics platform.