# 21. Inventory Analysis
## FMCG Enterprise Analytics Dashboard

---

# Purpose

Inventory Analysis evaluates stock availability, inventory efficiency, stock risks, product movement, and working capital utilization across the FMCG distribution network.

The objective is to ensure that inventory levels are optimized to support sales growth while minimizing stockouts, excess inventory, and dead stock risk.

---

# Analysis Framework

```text
Inventory Position Analysis
          ↓
Stock Availability Analysis
          ↓
Days of Cover Analysis
          ↓
Inventory Turnover Analysis
          ↓
Stockout Risk Analysis
          ↓
Dead Stock Analysis
          ↓
SKU Movement Analysis
          ↓
Business Recommendations
```

---

# Inventory Overview

## Business Question

What is the overall health of inventory across the organization?

---

## Key Metrics

```text
Opening Stock
Closing Stock
Inventory Value
Inventory Quantity
```

---

## Analysis Dimensions

- Region
- Branch
- Product
- Category
- Brand
- ABC Class
- XYZ Class

---

# Stock Availability Analysis

## Business Question

Is inventory available when customers need it?

---

## KPI

```text
Stock Availability %
```

### Formula

```text
Available Inventory Records
/
Total Inventory Records
```

---

## Findings

### Healthy Inventory

Most products maintain sufficient stock availability.

---

### Inventory Gaps

Certain high-demand products experience recurring availability issues.

---

## Business Impact

Poor stock availability may result in:

- Lost Sales
- Lower Service Levels
- Customer Dissatisfaction

---

# Days of Cover (DOC) Analysis

## Business Question

How long can current inventory support future demand?

---

## KPI

```text
Average Days of Cover
```

### Formula

```text
Closing Stock
/
Average Daily Sales
```

---

## Inventory Health Categories

| DOC Range | Interpretation |
|------------|----------------|
| < 15 Days | Critical Stock Risk |
| 15 - 45 Days | Healthy Inventory |
| 45 - 90 Days | Overstock Risk |
| > 90 Days | Excess Inventory Risk |

---

## Findings

### Low DOC Products

Products with low DOC may face stockout risk.

---

### High DOC Products

Products with excessive DOC tie up working capital and warehouse space.

---

# Inventory Turnover Analysis

## Business Question

How efficiently is inventory converted into sales?

---

## KPI

```text
Inventory Turnover
```

### Formula

```text
Sales Quantity
/
Average Inventory
```

---

## Findings

### High Turnover Products

Characteristics:

- Strong Demand
- Fast Inventory Movement
- Efficient Capital Utilization

---

### Low Turnover Products

Characteristics:

- Slow Demand
- Excess Inventory
- Increased Holding Cost

---

## Business Impact

Low turnover reduces inventory efficiency and increases storage costs.

---

# Stockout Risk Analysis

## Business Question

Which products are most vulnerable to stock shortages?

---

## KPI

```text
Stockout %
```

### Formula

```text
Stockout Records
/
Total Inventory Records
```

---

## Critical Stock Risk List

Products identified with:

- High Revenue
- High Sales Velocity
- Low Days of Cover
- Frequent Stockout Events

---

## Findings

Several strategic products face elevated stockout risk despite strong sales performance.

---

## Business Impact

Potential consequences include:

- Revenue Loss
- Market Share Loss
- Reduced Customer Satisfaction

---

# Dead Stock Analysis

## Business Question

Which products are consuming inventory resources without generating sales?

---

## KPI

```text
Dead Stock %
```

---

## Dead Stock Definition

Products meeting the following conditions:

```text
No Sales Activity
AND
Very High Days of Cover
AND
Inventory Still Available
```

---

## Findings

A portion of inventory is allocated to products with limited commercial contribution.

---

## Business Impact

Dead stock increases:

- Holding Costs
- Working Capital Requirements
- Warehouse Utilization Pressure

---

# Fast Moving SKU Analysis

## Business Question

Which products drive inventory movement?

---

## Metrics

```text
Sales Quantity
Revenue
Inventory Turnover
```

---

## Characteristics

Fast Moving SKUs typically show:

- High Sales Velocity
- High Inventory Turnover
- Strong Revenue Contribution

---

## Business Importance

These products require:

- Higher Service Levels
- Inventory Prioritization
- Continuous Replenishment

---

# Slow Moving SKU Analysis

## Business Question

Which products move inventory inefficiently?

---

## Metrics

```text
Sales Quantity
DOC
Inventory Turnover
```

---

## Characteristics

Slow Moving SKUs typically show:

- Low Sales Velocity
- High DOC
- Low Turnover

---

## Business Impact

Slow movers contribute to:

- Overstock Risk
- Dead Stock Risk
- Excess Capital Allocation

---

# ABC Inventory Analysis

## Business Question

Which products deserve inventory priority?

---

## Classification

| Class | Description |
|---------|-------------|
| A | Strategic Products |
| B | Medium Priority Products |
| C | Long Tail Products |

---

## Findings

Class A products require the highest inventory visibility and replenishment focus.

---

# XYZ Inventory Analysis

## Business Question

How predictable is product demand?

---

## Classification

| Class | Description |
|---------|-------------|
| X | Stable Demand |
| Y | Moderate Variability |
| Z | Highly Variable Demand |

---

## Findings

XYZ classification helps optimize inventory planning and safety stock allocation.

---

# Inventory Value Analysis

## Business Question

Where is working capital concentrated?

---

## Metrics

```text
Inventory Value
Inventory Quantity
```

---

## Findings

Inventory value is concentrated among a limited number of products and categories.

---

## Business Impact

Inventory investment should align with revenue contribution and demand stability.

---

# Inventory Risk Assessment

## Risk 1

### Critical Stock Risk

Low inventory coverage among strategic products.

---

## Risk 2

### Excess Inventory Risk

High inventory levels relative to demand.

---

## Risk 3

### Dead Stock Risk

Inventory with minimal commercial activity.

---

## Risk 4

### Capital Utilization Risk

Excess working capital tied up in slow-moving products.

---

# Strategic Insights

## Insight 1

Inventory is not evenly distributed across products and branches.

---

## Insight 2

Several high-revenue products face elevated stockout risk.

---

## Insight 3

A portion of inventory is concentrated in slow-moving and low-performing products.

---

## Insight 4

Inventory turnover varies significantly across product categories.

---

## Insight 5

ABC and XYZ classifications provide a strong foundation for inventory prioritization.

---

# Business Recommendations

## Inventory Optimization

- Rebalance inventory across branches.
- Align stock levels with actual demand patterns.

---

## Stockout Prevention

- Increase replenishment frequency for critical products.
- Establish minimum stock thresholds.

---

## Dead Stock Reduction

- Launch targeted promotions.
- Reduce future purchase quantities.
- Review discontinuation candidates.

---

## Working Capital Improvement

- Shift investment from low-performing inventory to high-performing products.

---

## Inventory Governance

- Monitor DOC regularly.
- Track inventory turnover at SKU level.
- Integrate inventory reviews into monthly business performance meetings.

---

# Inventory Analysis Outcome

The Inventory Analysis provides a comprehensive view of:

- Inventory Health
- Stock Availability
- Inventory Efficiency
- Stockout Risk
- Dead Stock Risk
- SKU Performance
- Working Capital Utilization

The analysis supports operational planning, inventory optimization, supply chain decision-making, and profitability improvement across the FMCG distribution network.