# 19. Exploratory Data Analysis (EDA)
## FMCG Enterprise Analytics Dashboard

---

# Purpose

Exploratory Data Analysis (EDA) was conducted to understand the structure, quality, distribution, and business characteristics of the dataset before performing data cleaning, validation, KPI development, and dashboard creation.

The objective of EDA is to identify:

- Data quality issues
- Business patterns
- Data distribution
- Outliers and anomalies
- Relationships between variables
- Potential business risks and opportunities

---

# EDA Framework

```text
Dataset Overview
        ↓
Data Structure Review
        ↓
Data Quality Assessment
        ↓
Distribution Analysis
        ↓
Business Pattern Analysis
        ↓
Outlier Detection
        ↓
Relationship Analysis
        ↓
Business Insight Generation
```

---

# Dataset Overview

## Dataset Scale

| Dataset | Records |
|----------|-----------:|
| Fact Sales | 20,000,000+ |
| Fact Inventory | Millions |
| Fact Delivery | Millions |
| Fact Target | Thousands |
| Product Master | 4,000 SKU |
| Branch Master | 50 Branches |
| Distributor Master | 350 Distributors |
| Date Dimension | 24 Months |

---

# Data Structure Review

The first step focused on understanding dataset structure.

## Review Areas

- Number of rows
- Number of columns
- Data types
- Primary keys
- Foreign keys
- Table relationships

---

# Data Quality Assessment

## Missing Values Analysis

The following fields were reviewed:

```text
Distributor_ID
Margin_Pct
Margin_Target
Promo_ID
```

### Findings

- Missing Distributor_ID detected
- Missing Margin_Pct detected
- Missing Margin_Target detected
- Missing Promo_ID expected due to non-promo transactions

---

## Duplicate Analysis

### Target Table

```text
Fact Sales
```

### Key

```text
Sales_ID
```

### Findings

Duplicate transaction records identified and documented.

---

## Data Type Review

Validated consistency for:

```text
Date Fields
Numeric Fields
Categorical Fields
Identifiers
```

---

# Sales Analysis

## Revenue Distribution

Revenue was analyzed across:

- Time
- Branch
- Product
- Distributor
- Channel

### Key Observations

- Revenue distribution is highly concentrated.
- A small number of products contribute the majority of revenue.
- Revenue performance varies significantly across branches.

---

## Profitability Analysis

Metrics reviewed:

```text
Gross Profit
Margin %
```

### Key Observations

- High-revenue products do not always generate high margins.
- Margin performance varies across categories and branches.

---

# Branch Performance Analysis

## Branch Revenue Distribution

Analyzed:

```text
Revenue by Branch
```

### Findings

- Top-performing branches contribute a disproportionate share of total revenue.
- Revenue concentration follows a Pareto-like pattern.

---

## Branch Achievement Analysis

Reviewed:

```text
Achievement %
```

### Findings

- Some branches consistently exceed targets.
- Several branches remain below target despite operating in high-potential markets.

---

## Branch Growth Analysis

Reviewed:

```text
Growth %
```

### Findings

- Growth performance is uneven across regions.
- Revenue growth is concentrated in a subset of branches.

---

# Distributor Analysis

## Distributor Revenue Contribution

Analyzed:

```text
Revenue by Distributor
```

### Findings

- Revenue dependency exists on a limited number of distributors.
- Several distributors generate low sales volume despite broad coverage.

---

## Service Performance Analysis

Reviewed:

```text
OTIF %
Lead Time
```

### Findings

- Service quality differs significantly across distributors.
- Some high-revenue distributors show declining service performance.

---

# Inventory Analysis

## Stock Distribution

Reviewed:

```text
Opening Stock
Closing Stock
Inventory Value
```

### Findings

- Inventory allocation is uneven across products.
- Certain products carry excessive stock levels.

---

## Days of Cover (DOC)

Reviewed:

```text
DOC
```

### Findings

- Healthy inventory exists for most products.
- Excessive DOC identified for several low-performing products.

---

## Stockout Analysis

Reviewed:

```text
Stockout Flag
```

### Findings

- Stockout risk remains present in several high-demand products.
- Revenue-generating products are vulnerable to stock shortages.

---

# Product Analysis

## Product Revenue Distribution

Reviewed:

```text
Revenue by Product
```

### Findings

- Revenue follows the Pareto principle.
- A small group of products contributes the majority of revenue.

---

## ABC Analysis

Reviewed:

```text
ABC Classification
```

### Findings

| Class | Business Observation |
|---------|---------------------|
| A | Major revenue contributors |
| B | Moderate contributors |
| C | Long-tail products |

---

## XYZ Analysis

Reviewed:

```text
XYZ Classification
```

### Findings

| Class | Business Observation |
|---------|---------------------|
| X | Stable demand |
| Y | Moderate variability |
| Z | High variability |

---

## Fast Moving SKU Analysis

Reviewed:

```text
Sales Velocity
```

### Findings

- Fast-moving products require inventory prioritization.
- Fast movers generate the majority of transaction volume.

---

## Slow Moving SKU Analysis

Reviewed:

```text
Sales Velocity
```

### Findings

- Slow-moving products contribute limited revenue.
- Several SKUs show excessive inventory holding periods.

---

# Target Analysis

## Revenue Target Review

Reviewed:

```text
Revenue Target
Volume Target
Margin Target
Growth Target
```

### Findings

- Target distribution is consistent across planning periods.
- Some branches consistently outperform targets.

---

# Outlier Detection

## Revenue Outliers

Reviewed extreme values for:

```text
Revenue
Gross Profit
Margin %
```

### Findings

- High-value transactions exist but remain within expected business ranges.

---

## Inventory Outliers

Reviewed:

```text
DOC
Inventory Value
```

### Findings

- Several products exhibit extremely high DOC values.
- Potential dead stock candidates identified.

---

# Relationship Analysis

## Revenue vs Margin

Reviewed relationship between:

```text
Revenue
Margin %
```

### Findings

- High revenue does not necessarily indicate high profitability.

---

## Revenue vs Achievement

Reviewed:

```text
Revenue
Achievement %
```

### Findings

- High sales volume does not always mean target attainment.

---

## Inventory vs Revenue

Reviewed:

```text
Inventory Value
Revenue
```

### Findings

- Excess inventory does not always generate proportional sales.

---

# Key EDA Insights

## Insight 1

Revenue concentration is heavily dependent on a relatively small group of branches and products.

---

## Insight 2

Inventory inefficiencies exist within slow-moving and long-tail product groups.

---

## Insight 3

Several distributors contribute significant revenue while exhibiting service-level risks.

---

## Insight 4

Critical stock risk exists among high-demand products, creating potential revenue loss opportunities.

---

## Insight 5

Business growth is not evenly distributed across all branches, indicating opportunities for targeted improvement initiatives.

---

# EDA Outcome

The EDA phase provided a comprehensive understanding of:

- Dataset quality
- Business behavior
- Revenue drivers
- Inventory risks
- Distributor performance
- Product portfolio effectiveness

The findings from EDA became the foundation for:

- Data Cleaning
- Data Validation
- KPI Design
- Star Schema Modeling
- Dashboard Development
- Business Recommendations

and ensured that all subsequent analyses were built on validated business assumptions and data-driven observations.