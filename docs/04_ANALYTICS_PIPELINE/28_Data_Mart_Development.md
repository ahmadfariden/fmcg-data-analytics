# 28. Data Mart Development
## FMCG Enterprise Analytics Dashboard

---

# Purpose

Data Mart Development is the process of transforming the centralized analytical dataset into business-focused data structures designed to support specific reporting, dashboarding, and decision-making requirements.

The objective is to simplify analysis, improve performance, and provide stakeholders with subject-oriented datasets tailored to their business functions.

---

# Business Objective

The data mart layer was developed to:

- Simplify reporting logic
- Improve dashboard performance
- Reduce DAX complexity
- Standardize KPI calculations
- Support departmental analysis
- Create reusable business datasets

---

# Data Architecture

```text
Raw Layer
     ↓
Clean Layer
     ↓
Analytical Dataset
     ↓
Business Data Marts
     ↓
Power BI Dashboards
     ↓
Business Decisions
```

---

# Data Mart Strategy

Instead of allowing dashboards to directly query all transactional tables, business-specific data marts were created.

Benefits:

- Faster reporting
- Easier maintenance
- Cleaner business logic
- Better scalability
- Consistent KPI definitions

---

# Data Mart Framework

```text
Commercial Mart
        ↓
Branch Mart
        ↓
Distributor Mart
        ↓
Inventory Mart
        ↓
Product Mart
        ↓
Promotion Mart
        ↓
Executive Mart
```

---

# Data Mart Inventory

## Total Data Marts

```text
20 Business Data Marts
```

Designed to support:

- Executive Dashboard
- Branch Performance Analysis
- Distributor Analysis
- Inventory Analysis
- Product Analysis
- Promotion Analysis

---

# 01. Executive Summary Mart

## Purpose

Provide a high-level business performance view for executives.

---

## Main Metrics

```text
Revenue
Gross Profit
Margin %
Achievement %
Growth %
Stockout %
```

---

## Primary Users

```text
CEO
Commercial Director
Supply Chain Director
General Manager
```

---

# 02. Revenue Mart

## Purpose

Centralized revenue reporting dataset.

---

## Main Metrics

```text
Revenue
Revenue Contribution %
Growth %
```

---

## Analysis Dimensions

```text
Date
Region
Branch
Product
Distributor
```

---

# 03. Profitability Mart

## Purpose

Profit analysis across all business dimensions.

---

## Main Metrics

```text
Gross Profit
Margin %
Profit Contribution %
```

---

# 04. Branch Performance Mart

## Purpose

Evaluate branch performance.

---

## Main Metrics

```text
Revenue
Growth %
Achievement %
Margin %
```

---

## Primary Users

```text
Sales Managers
Regional Managers
Commercial Team
```

---

# 05. Top Branch Mart

## Purpose

Identify top-performing branches.

---

## Main Metrics

```text
Revenue Ranking
Growth Ranking
Achievement Ranking
```

---

# 06. Underperforming Branch Mart

## Purpose

Identify recovery opportunities.

---

## Main Metrics

```text
Low Revenue
Low Achievement
Negative Growth
```

---

# 07. Distributor Performance Mart

## Purpose

Evaluate distributor contribution.

---

## Main Metrics

```text
Revenue
OTIF %
Growth %
Lead Time
```

---

# 08. Best Distributor Mart

## Purpose

Identify strategic distributor partners.

---

## Main Metrics

```text
Revenue
OTIF %
Growth %
```

---

# 09. At-Risk Distributor Mart

## Purpose

Identify distributor operational risks.

---

## Main Metrics

```text
Low OTIF
Long Lead Time
Negative Growth
```

---

# 10. Inventory Health Mart

## Purpose

Monitor inventory efficiency.

---

## Main Metrics

```text
Inventory Value
Inventory Turnover
DOC
Stockout %
```

---

# 11. Critical Stock Risk Mart

## Purpose

Identify stock shortage risks.

---

## Main Metrics

```text
Low DOC
Stockout Risk
Revenue at Risk
```

---

# 12. Dead Stock Mart

## Purpose

Identify inventory waste.

---

## Main Metrics

```text
Dead Stock Value
Dead Stock Quantity
Dead Stock %
```

---

# 13. Inventory Turnover Mart

## Purpose

Track inventory movement efficiency.

---

## Main Metrics

```text
Inventory Turnover
DOC
Sales Velocity
```

---

# 14. Product Performance Mart

## Purpose

Evaluate product contribution.

---

## Main Metrics

```text
Revenue
Margin %
Growth %
Volume
```

---

# 15. Top Product Mart

## Purpose

Identify revenue-driving products.

---

## Main Metrics

```text
Revenue Ranking
Growth Ranking
Profit Ranking
```

---

# 16. Fast Moving SKU Mart

## Purpose

Monitor high-demand products.

---

## Main Metrics

```text
Sales Volume
Inventory Turnover
Revenue
```

---

# 17. Slow Moving SKU Mart

## Purpose

Identify inventory inefficiencies.

---

## Main Metrics

```text
DOC
Inventory Turnover
Sales Volume
```

---

# 18. ABC Analysis Mart

## Purpose

Support revenue contribution analysis.

---

## Main Metrics

```text
Revenue Contribution %
ABC Class
```

---

## Classifications

```text
A Class
B Class
C Class
```

---

# 19. XYZ Analysis Mart

## Purpose

Support demand variability analysis.

---

## Main Metrics

```text
Demand Variability
XYZ Class
```

---

## Classifications

```text
X Class
Y Class
Z Class
```

---

# 20. Promotion Performance Mart

## Purpose

Evaluate promotional effectiveness.

---

## Main Metrics

```text
Promo Revenue
Sales Uplift %
Promotion ROI
```

---

# Data Mart Design Principles

## Subject-Oriented

Each mart is built around a specific business process.

---

## KPI-Centric

All marts contain business-ready KPIs.

---

## Reusable

The same mart can support:

- Power BI
- SQL Analysis
- Executive Reporting

---

## Scalable

Supports:

```text
20M+ Transactions
Multi-Year Analysis
Enterprise Reporting
```

---

# Data Mart Granularity

| Data Mart | Granularity |
|------------|------------|
| Executive Mart | Monthly |
| Revenue Mart | Daily |
| Branch Mart | Daily |
| Distributor Mart | Daily |
| Inventory Mart | Daily |
| Product Mart | Daily |
| Promotion Mart | Daily |

---

# Data Mart Benefits

## Business Benefits

- Faster business analysis
- Consistent KPI definitions
- Improved decision-making
- Better stakeholder adoption

---

## Technical Benefits

- Reduced dashboard load time
- Simpler DAX calculations
- Lower query complexity
- Better scalability

---

# Relationship with Dashboard Pages

| Dashboard Page | Primary Data Mart |
|---------------|------------------|
| Executive Overview | Executive Summary Mart |
| Branch Performance | Branch Performance Mart |
| Distributor Performance | Distributor Performance Mart |
| Inventory Analytics | Inventory Health Mart |
| Product Analytics | Product Performance Mart |

---

# Data Mart Governance

Each data mart follows:

```text
Business Rules
Data Validation Rules
KPI Standards
Naming Standards
Version Control Standards
```

to ensure consistency across the entire analytics platform.

---

# Data Mart Development Outcome

The Data Mart Layer transforms raw transactional data into business-ready analytical assets.

The 20 business data marts serve as the foundation for:

- Executive Reporting
- Commercial Analytics
- Inventory Management
- Distributor Management
- Product Portfolio Optimization
- Promotion Evaluation

and enable the FMCG Enterprise Analytics Dashboard to operate as a scalable enterprise-level analytics solution and Single Source of Truth (SSOT) for decision-making.