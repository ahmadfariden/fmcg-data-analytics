# 6. Stakeholder Analysis

## Overview

FMCG Enterprise Analytics & Business Intelligence Platform dibangun untuk mendukung pengambilan keputusan pada berbagai level organisasi, mulai dari level operasional hingga level eksekutif.

Setiap stakeholder memiliki tanggung jawab, kebutuhan informasi, KPI, dan keputusan bisnis yang berbeda.

Tujuan stakeholder analysis adalah memastikan bahwa seluruh dashboard, KPI, insight, dan recommendation yang dibangun benar-benar mendukung kebutuhan bisnis masing-masing stakeholder.

---

# Stakeholder Hierarchy

```text
CEO / Managing Director
│
├── Commercial Director
│   ├── National Sales Manager
│   │   ├── Regional Sales Manager
│   │   └── Area Sales Manager
│   │
│   ├── Category Manager
│   └── Product Manager
│
├── Supply Chain Director
│   ├── Inventory Manager
│   ├── Demand Planner
│   ├── Procurement Manager
│   └── Distribution Manager
│
└── Finance Director
    └── Finance Manager
```

---

# Stakeholder 1

## CEO / Managing Director

### Business Responsibility

Bertanggung jawab terhadap performa bisnis perusahaan secara keseluruhan.

### Key Business Questions

- Apakah bisnis tumbuh?
- Apakah target perusahaan tercapai?
- Area mana yang memberikan kontribusi terbesar?
- Risiko bisnis apa yang perlu diprioritaskan?

### KPIs

- Revenue
- Gross Profit
- Margin %
- Achievement %
- YoY Growth %
- Active Distributor
- Inventory Turnover

### Decisions

- Business Expansion
- Investment Allocation
- Strategic Prioritization

### Dashboard Usage

Sheet 1 — Executive Summary

---

# Stakeholder 2

## Commercial Director

### Business Responsibility

Mengelola performa penjualan nasional.

### Key Business Questions

- Apakah target penjualan tercapai?
- Cabang mana yang menjadi growth driver?
- Produk mana yang mendorong pertumbuhan?

### KPIs

- Revenue
- Achievement %
- Growth %
- Margin %
- Product Revenue

### Decisions

- Sales Strategy
- Product Strategy
- Territory Expansion

### Dashboard Usage

Sheet 1
Sheet 2
Sheet 5

---

# Stakeholder 3

## National Sales Manager

### Business Responsibility

Mengelola performa seluruh cabang.

### Key Business Questions

- Cabang mana yang outperform?
- Cabang mana yang underperform?
- Area mana yang membutuhkan intervensi?

### KPIs

- Revenue
- Achievement %
- Growth %
- Active Distributor

### Decisions

- Sales Recovery Plan
- Resource Allocation
- Territory Optimization

### Dashboard Usage

Sheet 2

---

# Stakeholder 4

## Regional Sales Manager

### Business Responsibility

Mengelola performa wilayah regional.

### Key Business Questions

- Cabang mana yang mengalami penurunan performa?
- Cabang mana yang memiliki potensi pertumbuhan?

### KPIs

- Revenue
- Growth %
- Achievement %

### Decisions

- Regional Sales Action Plan
- Market Expansion

### Dashboard Usage

Sheet 2

---

# Stakeholder 5

## Category Manager

### Business Responsibility

Mengelola performa kategori produk.

### Key Business Questions

- Kategori mana yang paling profitable?
- Produk mana yang menjadi revenue driver?
- Produk mana yang perlu dikembangkan?

### KPIs

- Revenue
- Growth %
- Margin %
- Category Contribution %

### Decisions

- Category Expansion
- Promotion Planning
- Product Portfolio Strategy

### Dashboard Usage

Sheet 5

---

# Stakeholder 6

## Product Manager

### Business Responsibility

Mengelola siklus hidup produk.

### Key Business Questions

- Produk mana yang fast moving?
- Produk mana yang slow moving?
- Produk mana yang perlu dihentikan?

### KPIs

- Revenue
- Growth %
- Margin %
- ABC Classification
- SKU Contribution %

### Decisions

- Product Development
- Product Rationalization
- Product Discontinuation

### Dashboard Usage

Sheet 5

---

# Stakeholder 7

## Supply Chain Manager

### Business Responsibility

Mengelola aliran barang dari supplier hingga distributor.

### Key Business Questions

- Apakah supply chain berjalan efisien?
- Apakah inventory cukup?
- Apakah distribusi berjalan optimal?

### KPIs

- Stockout Rate %
- Inventory Turnover
- OTIF %
- Lead Time

### Decisions

- Replenishment Strategy
- Inventory Optimization
- Distribution Improvement

### Dashboard Usage

Sheet 3
Sheet 4

---

# Stakeholder 8

## Inventory Manager

### Business Responsibility

Mengelola kesehatan inventory.

### Key Business Questions

- Produk mana yang berisiko stockout?
- Produk mana yang menjadi dead stock?
- Apakah inventory level optimal?

### KPIs

- Critical Stock %
- Dead Stock %
- Days Of Cover
- Inventory Value

### Decisions

- Replenishment
- Inventory Rebalancing
- Stock Reduction

### Dashboard Usage

Sheet 4

---

# Stakeholder 9

## Demand Planner

### Business Responsibility

Merencanakan kebutuhan inventory.

### Key Business Questions

- Produk mana yang membutuhkan replenishment?
- Produk mana yang memiliki risiko stockout?

### KPIs

- Days Of Cover
- Inventory Turnover
- Stockout Rate %

### Decisions

- Demand Planning
- Reorder Planning

### Dashboard Usage

Sheet 4

---

# Stakeholder 10

## Procurement Manager

### Business Responsibility

Mengelola pembelian produk.

### Key Business Questions

- Produk mana yang perlu dibeli lebih banyak?
- Produk mana yang perlu dikurangi pembeliannya?

### KPIs

- Inventory Value
- Days Of Cover
- Dead Stock %

### Decisions

- Purchase Planning
- Supplier Negotiation

### Dashboard Usage

Sheet 4

---

# Stakeholder 11

## Distribution Manager

### Business Responsibility

Mengelola jaringan distribusi nasional.

### Key Business Questions

- Distributor mana yang memiliki performa terbaik?
- Distributor mana yang berisiko?

### KPIs

- OTIF %
- Lead Time
- Return Rate %

### Decisions

- Distributor Development
- Distributor Evaluation

### Dashboard Usage

Sheet 3

---

# Stakeholder 12

## Operations Manager

### Business Responsibility

Mengelola kualitas operasional distribusi.

### Key Business Questions

- Apakah pengiriman berjalan sesuai SLA?
- Apakah terdapat bottleneck distribusi?

### KPIs

- OTIF %
- Lead Time
- Delivery Performance

### Decisions

- Process Improvement
- Operational Optimization

### Dashboard Usage

Sheet 3

---

# Stakeholder 13

## Finance Manager

### Business Responsibility

Mengelola profitabilitas dan efisiensi modal kerja.

### Key Business Questions

- Apakah profitabilitas meningkat?
- Apakah inventory digunakan secara efisien?
- Berapa modal yang tertahan dalam inventory?

### KPIs

- Gross Profit
- Margin %
- Inventory Value
- Inventory Turnover
- Dead Stock Value

### Decisions

- Cost Optimization
- Working Capital Management

### Dashboard Usage

Sheet 1
Sheet 4

---

# Stakeholder Coverage Matrix

| Dashboard | Primary Stakeholders |
|------------|---------------------|
| Executive Summary | CEO, Managing Director, Commercial Director, Finance Director |
| Branch Performance | National Sales Manager, Regional Sales Manager |
| Distributor Performance | Distribution Manager, Operations Manager, Supply Chain Manager |
| Inventory & Operations | Inventory Manager, Demand Planner, Procurement Manager |
| Product & SKU Performance | Category Manager, Product Manager, Commercial Director |

---

# Stakeholder Success Criteria

Project dianggap berhasil apabila setiap stakeholder dapat:

- Mengakses KPI yang relevan.
- Mengidentifikasi masalah lebih cepat.
- Memahami penyebab masalah bisnis.
- Mendapatkan rekomendasi tindakan yang jelas.
- Mengambil keputusan berbasis data secara lebih cepat dan akurat.

---

# Final Stakeholder Statement

FMCG Enterprise Analytics & Business Intelligence Platform dirancang untuk mendukung 13 stakeholder utama lintas fungsi bisnis, mulai dari level operasional hingga level eksekutif, sehingga seluruh organisasi dapat menggunakan data yang sama untuk mengambil keputusan yang lebih konsisten, cepat, dan terukur.