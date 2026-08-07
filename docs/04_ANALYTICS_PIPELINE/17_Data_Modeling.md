# 17. Data Modeling
## FMCG Enterprise Analytics Dashboard

---

# Purpose

The data model was designed using a Star Schema architecture to support high-performance analytical reporting, scalable KPI calculations, and simplified business analysis across Sales, Distribution, Inventory, and Product Performance.

The objective of the model is to create a centralized semantic layer that enables consistent reporting across all dashboard pages while maintaining query performance on 20+ million transaction records.

---

# Data Modeling Approach

The project uses:

```text
Star Schema
```

instead of:

```text
Normalized OLTP Schema
```

because analytical workloads require:

- Faster aggregations
- Simpler relationships
- Better Power BI performance
- Easier KPI calculations
- Better scalability

---

# Data Model Architecture

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

---

# Fact Tables

Fact tables store measurable business events and transactional data.

---

## Fact_Sales

### Business Purpose

Stores all sales transactions.

### Grain

```text
1 Row = 1 Sales Transaction
```

### Key Measures

- Revenue
- Gross Profit
- Margin %
- Sales Quantity
- Growth %
- Achievement %

---

## Fact_Inventory

### Business Purpose

Stores inventory balances and stock movement information.

### Grain

```text
1 Row = 1 SKU per Branch per Day
```

### Key Measures

- Closing Stock
- Inventory Value
- Stockout %
- Inventory Turnover
- Days of Cover

---

## Fact_Delivery

### Business Purpose

Stores distributor delivery performance records.

### Grain

```text
1 Row = 1 Delivery Order
```

### Key Measures

- OTIF %
- Lead Time
- Delivery Volume

---

## Fact_Target

### Business Purpose

Stores monthly business targets.

### Grain

```text
1 Row = Month + Branch + Category
```

### Key Measures

- Revenue Target
- Volume Target
- Margin Target
- Growth Target

---

# Dimension Tables

Dimension tables provide business context for analysis.

---

## Dim_Product

### Business Purpose

Provides product hierarchy and product attributes.

### Key Attributes

- SKU
- Brand
- Category
- Product Lifecycle
- ABC Class
- XYZ Class

---

## Dim_Branch

### Business Purpose

Provides branch-level organizational structure.

### Key Attributes

- Branch
- Region
- Tier
- Market Potential
- Urban/Rural Classification

---

## Dim_Distributor

### Business Purpose

Provides distributor information.

### Key Attributes

- Distributor Name
- Distributor Type
- Coverage Area
- Warehouse Size
- Vehicle Count

---

## Dim_Date

### Business Purpose

Provides time intelligence capability.

### Key Attributes

- Day
- Week
- Month
- Quarter
- Year

---

# Relationship Design

## Relationship Type

```text
One-to-Many
```

---

## Relationship Direction

```text
Single Direction Filtering
```

---

## Active Relationships

### Fact_Sales

| Fact Column | Dimension Column |
|-------------|------------------|
| SKU_ID | Dim_Product[SKU_ID] |
| Branch_ID | Dim_Branch[Branch_ID] |
| Distributor_ID | Dim_Distributor[Distributor_ID] |
| Order_Date | Dim_Date[Date] |

---

### Fact_Inventory

| Fact Column | Dimension Column |
|-------------|------------------|
| SKU_ID | Dim_Product[SKU_ID] |
| Branch_ID | Dim_Branch[Branch_ID] |
| Snapshot_Date | Dim_Date[Date] |

---

### Fact_Delivery

| Fact Column | Dimension Column |
|-------------|------------------|
| Distributor_ID | Dim_Distributor[Distributor_ID] |
| Branch_ID | Dim_Branch[Branch_ID] |
| Delivery_Date | Dim_Date[Date] |

---

### Fact_Target

| Fact Column | Dimension Column |
|-------------|------------------|
| Branch_ID | Dim_Branch[Branch_ID] |
| Month | Dim_Date[Date] |

---

# Data Model Design Principles

## Single Source of Truth (SSOT)

All KPIs originate from validated fact tables.

No KPI calculations are performed outside the semantic model.

---

## Conformed Dimensions

The same dimensions are reused across all fact tables.

Examples:

```text
Dim_Product
Dim_Branch
Dim_Distributor
Dim_Date
```

This ensures consistent reporting across all dashboard pages.

---

## Business-Oriented Modeling

The model is designed around business processes:

```text
Sales
Inventory
Distribution
Planning
```

rather than around system tables.

---

## KPI Consistency

All dashboard KPIs use standardized calculations.

Examples:

- Revenue
- Margin %
- Achievement %
- Growth %
- OTIF %
- DOC

are calculated once and reused across the entire report.

---

# Performance Optimization

Several optimization techniques were applied:

### Star Schema Design

Reduces model complexity and improves aggregation speed.

---

### Dedicated Date Dimension

Improves time intelligence calculations.

---

### Measure-Based Calculations

Business logic is centralized in DAX measures rather than calculated columns.

---

### Cleaned Data Layer

Only validated clean tables are imported into Power BI.

---

### Reduced Relationship Complexity

Avoids many-to-many relationships.

Avoids bidirectional filtering where unnecessary.

---

# Dashboard Dependency Map

```text
Executive Dashboard
        │
        ├── Fact_Sales
        ├── Fact_Target
        └── Dim_Date

Branch Dashboard
        │
        ├── Fact_Sales
        ├── Fact_Target
        └── Dim_Branch

Distributor Dashboard
        │
        ├── Fact_Delivery
        ├── Fact_Sales
        └── Dim_Distributor

Inventory Dashboard
        │
        ├── Fact_Inventory
        └── Dim_Product

Product Dashboard
        │
        ├── Fact_Sales
        ├── Fact_Inventory
        └── Dim_Product
```

---

# Modeling Outcome

The final semantic model enables:

- Executive Reporting
- Performance Monitoring
- Distributor Evaluation
- Inventory Optimization
- Product Portfolio Analysis
- ABC & XYZ Analysis
- Dynamic Business Recommendations

while maintaining scalability and performance for a dataset containing more than 20 million sales transactions.

The model serves as the analytical foundation of the FMCG Enterprise Analytics Dashboard and acts as the organization's reporting Single Source of Truth (SSOT).