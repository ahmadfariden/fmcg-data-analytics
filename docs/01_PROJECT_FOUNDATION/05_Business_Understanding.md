# 5. Business Understanding

## Overview

Sebelum melakukan analisis data, penting untuk memahami bagaimana bisnis FMCG beroperasi, bagaimana produk bergerak dari supplier hingga pelanggan, serta bagaimana setiap aktivitas bisnis menghasilkan data yang nantinya digunakan untuk pengambilan keputusan.

Business Understanding bertujuan untuk memastikan bahwa seluruh analisis, KPI, dashboard, dan rekomendasi yang dibangun benar-benar merepresentasikan kondisi bisnis yang terjadi di lapangan.

---

# FMCG Business Model

PT Sinergi Distribusi Nusantara merupakan perusahaan distribusi FMCG yang bertugas memastikan produk tersedia di pasar dalam jumlah yang tepat, waktu yang tepat, dan lokasi yang tepat.

Tujuan utama perusahaan adalah:

```text
Right Product
Right Quantity
Right Place
Right Time
Right Cost
```

Perusahaan memperoleh pendapatan dari aktivitas distribusi produk ke berbagai channel penjualan.

---

# End-to-End Business Process

## Step 1

Supplier / Manufacturer

Supplier memproduksi produk FMCG dan mengirimkan produk ke gudang distribusi perusahaan.

Contoh:

- Makanan
- Minuman
- Personal Care
- Home Care
- Health Products

Output:

```text
Inventory Inbound
```

---

## Step 2

Warehouse & Inventory Management

Produk diterima dan disimpan di gudang.

Tim inventory bertanggung jawab memastikan:

- Ketersediaan stok
- Akurasi stok
- Efisiensi inventory
- Keseimbangan stock level

Output:

```text
Available Inventory
```

---

## Step 3

Sales Order Generation

Distributor melakukan pemesanan produk.

Order dapat berasal dari:

- General Trade
- Modern Trade
- Horeca
- E-Commerce

Output:

```text
Sales Order
```

---

## Step 4

Order Fulfillment

Gudang menyiapkan dan mengirimkan produk sesuai pesanan.

Output:

```text
Delivery Transaction
```

---

## Step 5

Customer Delivery

Produk diterima oleh distributor.

Kinerja distribusi diukur melalui:

- OTIF
- Lead Time
- Return Rate

Output:

```text
Completed Delivery
```

---

## Step 6

Sales Realization

Penjualan berhasil dicatat sebagai revenue perusahaan.

Output:

```text
Revenue
Gross Profit
Margin
```

---

# Business Functions

## Commercial Team

Tanggung jawab:

- Revenue Growth
- Sales Achievement
- Market Expansion
- Product Performance

Fokus KPI:

- Revenue
- Achievement
- Growth
- Margin

---

## Supply Chain Team

Tanggung jawab:

- Inventory Availability
- Distribution Efficiency
- Replenishment Planning

Fokus KPI:

- Stockout Rate
- OTIF
- Lead Time
- Inventory Turnover

---

## Inventory Team

Tanggung jawab:

- Stock Monitoring
- Dead Stock Control
- Inventory Optimization

Fokus KPI:

- Days Of Cover
- Dead Stock Rate
- Inventory Value
- Critical Stock Rate

---

## Product & Category Team

Tanggung jawab:

- Product Portfolio
- Product Lifecycle
- Product Growth

Fokus KPI:

- Revenue Contribution
- Growth
- Margin
- ABC Classification

---

## Finance Team

Tanggung jawab:

- Profitability
- Working Capital
- Cost Efficiency

Fokus KPI:

- Gross Profit
- Margin
- Inventory Value
- Working Capital Exposure

---

# Revenue Generation Logic

Revenue dihasilkan dari transaksi penjualan produk.

Formula:

```text
Revenue
=
Quantity Sold × Unit Price
```

Revenue menjadi indikator utama pertumbuhan bisnis.

Pertanyaan bisnis:

- Produk apa yang menghasilkan revenue terbesar?
- Cabang mana yang menghasilkan revenue terbesar?
- Distributor mana yang memberikan kontribusi terbesar?

---

# Profitability Logic

Revenue yang tinggi belum tentu menghasilkan profit yang tinggi.

Formula:

```text
Gross Profit
=
Revenue − COGS
```

```text
Margin %
=
Gross Profit ÷ Revenue
```

Pertanyaan bisnis:

- Produk mana yang paling menguntungkan?
- Cabang mana yang memiliki margin terbaik?
- Distributor mana yang menghasilkan profit terbaik?

---

# Inventory Management Logic

Inventory merupakan aset yang harus dikelola secara optimal.

Terlalu sedikit:

```text
Stockout
↓
Lost Sales
```

Terlalu banyak:

```text
Dead Stock
↓
Working Capital Risk
```

Tujuan inventory management:

```text
Optimal Inventory Level
```

---

# Distribution Management Logic

Distribusi yang baik memastikan produk tersedia tepat waktu.

KPI utama:

### OTIF

```text
On Time In Full
```

Mengukur ketepatan dan kelengkapan pengiriman.

### Lead Time

```text
PO → Delivery
```

Mengukur kecepatan distribusi.

### Return Rate

Mengukur kualitas pengiriman dan penerimaan barang.

---

# Product Portfolio Logic

Tidak semua produk memiliki kontribusi yang sama.

Perusahaan harus mampu membedakan:

### Fast Moving SKU

Karakteristik:

- Revenue tinggi
- Growth tinggi
- Permintaan tinggi

Strategi:

```text
Scale Up
Expand Distribution
Increase Allocation
```

---

### Slow Moving SKU

Karakteristik:

- Revenue rendah
- Growth rendah
- DOC tinggi

Strategi:

```text
Inventory Rebalancing
Promotion
Liquidation
Discontinuation
```

---

# ABC Classification Logic

Digunakan untuk mengelompokkan produk berdasarkan kontribusi revenue.

### Class A

Kontribusi terbesar.

Biasanya:

```text
20% SKU
≈ 80% Revenue
```

---

### Class B

Kontribusi menengah.

Biasanya:

```text
30% SKU
≈ 15% Revenue
```

---

### Class C

Kontribusi kecil.

Biasanya:

```text
50% SKU
≈ 5% Revenue
```

Tujuan:

- Prioritas inventory
- Prioritas replenishment
- Prioritas promosi

---

# Stakeholder Decision Framework

Setiap stakeholder memiliki kebutuhan informasi yang berbeda.

### CEO / Director

Pertanyaan:

```text
Apakah bisnis tumbuh?
```

---

### Sales Manager

Pertanyaan:

```text
Cabang mana yang perlu diperbaiki?
```

---

### Inventory Manager

Pertanyaan:

```text
Produk mana yang berisiko stockout?
```

---

### Supply Chain Manager

Pertanyaan:

```text
Distributor mana yang bermasalah?
```

---

### Category Manager

Pertanyaan:

```text
Produk mana yang harus dikembangkan?
```

---

### Finance Manager

Pertanyaan:

```text
Apakah inventory digunakan secara efisien?
```

---

# Business Success Definition

Dalam project ini, bisnis dianggap berhasil apabila:

### Sales

- Revenue meningkat
- Target tercapai
- Growth positif

### Inventory

- Stockout menurun
- Dead stock menurun
- Inventory turnover meningkat

### Distribution

- OTIF meningkat
- Lead time menurun
- Return rate menurun

### Product

- Fast moving SKU berkembang
- Slow moving SKU berkurang

### Finance

- Margin meningkat
- Working capital lebih efisien

---

# Final Business Understanding Statement

Bisnis FMCG bukan hanya tentang menjual produk, tetapi tentang mengelola keseimbangan antara penjualan, inventory, distribusi, profitabilitas, dan pelayanan pelanggan secara bersamaan.

Oleh karena itu, seluruh KPI, dashboard, dan rekomendasi dalam project ini dirancang untuk membantu stakeholder memahami kondisi bisnis secara menyeluruh dan mengambil keputusan yang mampu meningkatkan pertumbuhan, profitabilitas, efisiensi operasional, dan daya saing perusahaan.