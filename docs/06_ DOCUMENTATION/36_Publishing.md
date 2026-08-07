# 37. Lesson Learned

## Overview

Lesson Learned merupakan dokumentasi pembelajaran, tantangan, kesalahan, dan pengalaman yang diperoleh selama pengembangan FMCG Enterprise Analytics & Business Intelligence Platform.

Tujuan utama bagian ini adalah mengidentifikasi apa yang berhasil, apa yang tidak berjalan sesuai rencana, serta bagaimana pengalaman tersebut dapat digunakan untuk meningkatkan kualitas project di masa depan.

Lesson Learned juga menunjukkan kemampuan refleksi, problem solving, dan continuous improvement yang merupakan bagian penting dari pekerjaan seorang Data Analyst.

---

# Project Summary

Selama pengembangan project ini berhasil dibangun:

```text
20 Million Fact Sales Transactions
50 Branches
350 Distributors
4,000 SKU
24 Months Historical Data
148 Business KPIs & Metrics
5 Executive Dashboards
38 Documentation Files
```

Project mencakup seluruh proses analytics mulai dari business understanding hingga executive reporting.

---

# Lesson 1

## Business Understanding Is More Important Than Expected

### Initial Assumption

Awalnya fokus utama project berada pada:

- SQL
- Power BI
- Dashboard

### Reality

Semakin kompleks project, semakin terlihat bahwa pemahaman bisnis menjadi faktor utama yang menentukan kualitas analisis.

Dashboard yang bagus tidak akan berguna jika KPI yang digunakan tidak menjawab kebutuhan bisnis.

### Key Learning

```text
Business Questions
↓
KPI
↓
Analysis
↓
Dashboard
```

Bukan:

```text
Dashboard
↓
Cari KPI
```

---

# Lesson 2

## KPI Design Is More Difficult Than Building Dashboard

### Initial Assumption

Membuat visual dianggap sebagai bagian tersulit.

### Reality

Menentukan KPI yang benar jauh lebih sulit dibanding membuat visual.

Satu KPI yang salah dapat menghasilkan keputusan bisnis yang salah.

### Key Learning

Setiap KPI harus memiliki:

- Business Purpose
- Formula
- Interpretation
- Target
- Stakeholder

---

# Lesson 3

## Recommendation Logic Must Match Business Context

### Initial Situation

Awalnya recommendation menggunakan logika yang sama pada banyak tabel.

Contoh:

```text
Growth > 10%
=
Replicate
```

### Problem

Recommendation sering tidak relevan dengan konteks visual.

### Solution

Membuat recommendation berbeda untuk setiap business area.

### Key Learning

```text
1 Table
=
1 Recommendation Logic
```

---

# Lesson 4

## Data Quality Consumes More Time Than Analysis

### Initial Assumption

Analisis akan menjadi pekerjaan terbesar.

### Reality

Sebagian besar waktu justru digunakan untuk:

- Data Validation
- Data Cleaning
- Data Reconciliation
- Business Logic Checking

### Key Learning

Kualitas dashboard sangat bergantung pada kualitas data.

```text
Garbage In
=
Garbage Out
```

---

# Lesson 5

## Synthetic Data Must Follow Business Logic

### Initial Situation

Dataset mengalami banyak regenerasi.

### Challenge

Data terlihat realistis secara teknis tetapi tidak realistis secara bisnis.

### Impact

KPI menjadi tidak masuk akal.

### Key Learning

Synthetic data harus mengikuti:

- Sales Logic
- Inventory Logic
- Distributor Logic
- Seasonal Logic
- Business Rules

Bukan hanya menghasilkan data dalam jumlah besar.

---

# Lesson 6

## Data Modeling Determines Dashboard Performance

### Initial Situation

Beberapa relationship menyebabkan hasil agregasi tidak sesuai.

### Example

Relationship yang salah menyebabkan nilai inventory menjadi sama pada seluruh produk.

### Solution

Melakukan review relationship dan star schema.

### Key Learning

```text
Good Data Model
=
Reliable Dashboard
```

---

# Lesson 7

## Relationship Validation Is Critical

### Challenge

Kesalahan relationship dapat menghasilkan insight yang salah meskipun visual terlihat normal.

### Key Learning

Sebelum membuat dashboard harus dipastikan:

- Cardinality benar
- Filter direction benar
- Relationship aktif
- Fact dan dimension sesuai

---

# Lesson 8

## Business Recommendation Adds Significant Value

### Initial Situation

Dashboard hanya berisi KPI dan visual.

### Improvement

Ditambahkan:

- Management Recommendation
- Product Recommendation
- Branch Recommendation
- Distributor Recommendation

### Result

Dashboard menjadi lebih actionable.

### Key Learning

Stakeholder tidak hanya membutuhkan angka.

Stakeholder membutuhkan tindakan yang harus dilakukan.

---

# Lesson 9

## Documentation Is More Important Than Expected

### Initial Assumption

Dokumentasi hanya pelengkap.

### Reality

Ketika project semakin besar, dokumentasi menjadi sangat penting.

### Benefits

- Mempermudah maintenance
- Mempermudah revisi
- Mempermudah presentasi
- Mempermudah publishing

### Key Learning

Project yang baik harus dapat dipahami tanpa bantuan pembuatnya.

---

# Lesson 10

## End-to-End Thinking Creates Better Analysts

### Initial Situation

Fokus utama hanya pada SQL dan Power BI.

### Evolution

Project berkembang menjadi:

```text
Business Understanding
↓
Data Collection
↓
Data Quality
↓
Data Modeling
↓
Analytics
↓
Dashboard
↓
Recommendation
↓
Action Plan
```

### Key Learning

Seorang analyst tidak hanya mengolah data.

Seorang analyst membantu bisnis mengambil keputusan.

---

# Technical Lessons Learned

## SQL

Pembelajaran:

- Complex Aggregation
- Window Functions
- KPI Calculations
- Data Mart Development
- Large Dataset Handling

---

## Power BI

Pembelajaran:

- Star Schema
- DAX Optimization
- KPI Framework
- Dashboard Design
- Recommendation Logic

---

## Data Modeling

Pembelajaran:

- Fact Table Design
- Dimension Design
- Relationship Management
- Performance Optimization

---

## Business Analysis

Pembelajaran:

- KPI Design
- Stakeholder Analysis
- Business Questions
- Executive Reporting

---

# Soft Skill Lessons Learned

## Critical Thinking

Belajar memahami:

```text
Mengapa KPI berubah?
```

Bukan hanya:

```text
Berapa nilainya?
```

---

## Problem Solving

Belajar menyelesaikan:

- Data Quality Issues
- Business Logic Issues
- Dashboard Issues
- Recommendation Issues

---

## Business Communication

Belajar menerjemahkan:

```text
Data
↓
Insight
↓
Recommendation
↓
Business Action
```

---

# Biggest Challenges

## Challenge 1

Membangun dataset yang realistis.

---

## Challenge 2

Mendesain KPI yang relevan.

---

## Challenge 3

Membuat recommendation yang sesuai konteks bisnis.

---

## Challenge 4

Menjaga konsistensi business logic antar dashboard.

---

## Challenge 5

Memastikan seluruh dashboard menjawab business questions yang telah ditentukan.

---

# What Went Well

- Business framework berhasil dibangun.
- KPI framework berhasil distandarkan.
- Dashboard berhasil mencakup seluruh stakeholder utama.
- Recommendation logic berhasil dibuat lebih spesifik.
- Dokumentasi project berhasil disusun secara lengkap.

---

# What Could Be Improved

- Forecasting module.
- Demand planning analytics.
- Predictive analytics.
- Machine learning implementation.
- Real-time dashboard architecture.
- Automated alert system.

---

# Personal Reflection

Project ini menunjukkan bahwa kemampuan teknis saja tidak cukup untuk menghasilkan analisis yang bernilai.

Kemampuan memahami proses bisnis, mendefinisikan KPI yang tepat, memvalidasi data, dan menerjemahkan hasil analisis menjadi rekomendasi bisnis memiliki peran yang sama pentingnya dengan kemampuan menggunakan SQL, Power BI, atau Python.

---

# Final Lesson Learned Statement

Pengalaman membangun FMCG Enterprise Analytics & Business Intelligence Platform memberikan pemahaman bahwa nilai terbesar seorang Data Analyst tidak terletak pada kemampuan membuat dashboard atau menulis query, tetapi pada kemampuan menghubungkan data dengan kebutuhan bisnis, menghasilkan insight yang relevan, dan membantu stakeholder mengambil keputusan yang lebih baik berdasarkan data.