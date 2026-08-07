# 1. Project Overview

## Project Title

FMCG Enterprise Analytics & Business Intelligence Platform

---

## Project Summary

FMCG Enterprise Analytics & Business Intelligence Platform merupakan simulasi end-to-end lingkungan data perusahaan Fast Moving Consumer Goods (FMCG) skala nasional yang dirancang untuk merepresentasikan proses bisnis, operasional, dan analitik yang umum digunakan pada perusahaan seperti Unilever, Indofood, Wings, Mayora, Kalbe, Kino, maupun Nutrifood.

Project ini mensimulasikan seluruh perjalanan data mulai dari proses transaksi operasional harian hingga menjadi insight dan rekomendasi bisnis yang dapat digunakan oleh stakeholder untuk pengambilan keputusan strategis.

Dataset dibangun menggunakan synthetic data dengan business logic yang realistis untuk merepresentasikan aktivitas penjualan, distribusi, inventory management, promotion management, customer complaint management, dan market intelligence selama periode 2 tahun operasional perusahaan.

---

## Project Scale

### Business Period

01 January 2024 – 31 December 2025

(24 Months)

### Business Coverage

- 50 Branches
- 20 Regions
- 350 Distributors
- 4,000 Active SKUs
- 6 Product Categories
- 4 Sales Channels

### Sales Channels

- General Trade
- Modern Trade
- Horeca
- E-Commerce

---

## Dataset Scale

### Fact Tables

| Table | Rows |
|---------|---------:|
| Fact Sales | 20,000,000 |
| Fact Inventory | 1,500,000 |
| Fact Delivery | 4,000,000 |
| Fact Target | 86,400 |
| Fact Promotion | 120,000 |
| Fact Complaint | 500,000 |
| Fact Competitor | 250,000 |

### Dimension Tables

| Table | Rows |
|---------|---------:|
| Dim Product | 4,000 |
| Dim Branch | 50 |
| Dim Distributor | 350 |
| Dim Date | 731 |

---

## Business Domains Covered

### Commercial Analytics

Analisis performa penjualan perusahaan untuk mengukur pencapaian target, pertumbuhan bisnis, profitabilitas, serta kontribusi setiap cabang dan produk terhadap revenue perusahaan.

### Inventory Analytics

Analisis inventory untuk memonitor stock availability, stockout risk, dead stock risk, inventory turnover, dan days of cover guna menjaga keseimbangan antara service level dan working capital.

### Distribution Analytics

Analisis performa distributor menggunakan indikator OTIF, lead time, return rate, dan delivery reliability untuk memastikan efektivitas jaringan distribusi nasional.

### Product Analytics

Analisis performa SKU dan kategori produk untuk mengidentifikasi fast moving products, slow moving products, profit drivers, dan product lifecycle opportunities.

### Promotion Analytics

Analisis efektivitas program promosi untuk mengukur ROI, sales uplift, dan dampak promosi terhadap pertumbuhan penjualan.

### Operational Analytics

Analisis KPI operasional yang digunakan untuk memonitor kualitas proses bisnis dan mendukung continuous improvement.

---

## Analytics Objectives

Project ini dirancang untuk menjawab empat level analitik bisnis:

### Level 1 — Descriptive Analytics

Menjawab:

```text
What happened?
```

Contoh:

- Berapa total revenue?
- Berapa pencapaian target?
- Cabang mana yang memiliki performa terbaik?

---

### Level 2 — Diagnostic Analytics

Menjawab:

```text
Why did it happen?
```

Contoh:

- Mengapa revenue turun?
- Mengapa stockout meningkat?
- Mengapa distributor tertentu memiliki OTIF rendah?

---

### Level 3 — Predictive Analytics

Menjawab:

```text
What will happen?
```

Contoh:

- Produk mana yang berpotensi mengalami stockout?
- Produk mana yang berpotensi menjadi dead stock?
- Distributor mana yang berisiko mengalami penurunan performa?

---

### Level 4 — Prescriptive Analytics

Menjawab:

```text
What should we do?
```

Contoh:

- SKU mana yang harus direplenish?
- Produk mana yang perlu dipromosikan?
- Distributor mana yang perlu dievaluasi?
- Cabang mana yang perlu mendapatkan intervensi bisnis?

---

## Technical Scope

Project dibangun menggunakan:

### Data Generation

- Python
- Pandas
- Faker
- NumPy

### Data Storage

- CSV
- DuckDB
- Parquet

### Data Processing

- SQL
- Data Cleaning
- Data Validation
- Data Reconciliation

### Data Modeling

- Star Schema
- Fact Tables
- Dimension Tables

### Business Intelligence

- Power BI
- DAX
- Power Query

---

## Dashboard Scope

Dashboard terdiri dari 5 halaman utama:

### Sheet 1 — Executive Summary

Monitoring KPI strategis perusahaan.

### Sheet 2 — Branch Performance

Analisis performa cabang terbaik dan cabang berisiko.

### Sheet 3 — Distributor Performance

Analisis performa distributor dan risiko distribusi.

### Sheet 4 — Inventory & Operations

Monitoring stockout risk, critical stock, dead stock, inventory turnover, dan days of cover.

### Sheet 5 — Product & SKU Performance

Analisis fast moving SKU, slow moving SKU, kategori produk, dan profit drivers.

---

## Key Business Metrics

Project mengukur lebih dari 100 KPI dan business metrics yang mencakup:

- Revenue
- Gross Profit
- Margin
- Achievement
- Growth
- OTIF
- Lead Time
- Return Rate
- Stockout Rate
- Critical Stock Rate
- Dead Stock Rate
- Inventory Turnover
- Days Of Cover
- ABC Analysis
- Distributor Performance
- Product Performance
- Promotion Performance
- Operational KPI

---

## Expected Business Outcome

Melalui project ini, stakeholder dapat:

- Memonitor performa bisnis secara real-time.
- Mengidentifikasi risiko operasional lebih cepat.
- Mengoptimalkan inventory dan working capital.
- Meningkatkan efektivitas distribusi.
- Mengembangkan produk dengan potensi pertumbuhan tinggi.
- Mengambil keputusan berbasis data yang lebih akurat dan terukur.

---

## Portfolio Positioning

Project ini merepresentasikan simulasi lingkungan kerja Data Analyst, Business Analyst, Sales Analyst, Commercial Analyst, Supply Chain Analyst, dan BI Analyst pada perusahaan FMCG skala nasional.

Dengan volume data lebih dari 26 juta records dan cakupan proses bisnis end-to-end, project ini berada pada level:

Enterprise Scale FMCG Analytics & Business Intelligence Project