# 35. Version Control

## Overview

Version Control merupakan proses pengelolaan perubahan yang terjadi selama pengembangan FMCG Enterprise Analytics & Business Intelligence Platform.

Tujuan utama Version Control adalah memastikan seluruh perubahan pada data, kode, dokumentasi, dashboard, dan business logic dapat dilacak, dikontrol, dan dipulihkan apabila terjadi kesalahan atau perubahan yang tidak diinginkan.

Version Control membantu menjaga konsistensi project sekaligus mendukung kolaborasi, maintenance, dan pengembangan project di masa depan.

---

# Version Control Objectives

Project ini menerapkan Version Control untuk:

- Melacak perubahan project.
- Menjaga integritas data.
- Menghindari kehilangan pekerjaan.
- Mempermudah rollback jika terjadi error.
- Mendokumentasikan perkembangan project.
- Mendukung continuous improvement.

---

# Version Control Scope

Version Control diterapkan pada:

### Documentation

```text
*.md
```

Contoh:

- Project Overview
- Business Scenario
- KPI Design
- Dashboard Documentation

---

### SQL Scripts

```text
*.sql
```

Contoh:

- Data Cleaning
- Data Validation
- KPI Calculation
- Data Mart Development

---

### Python Scripts

```text
*.py
```

Contoh:

- Synthetic Data Generation
- Data Transformation
- Data Quality Checks

---

### Power BI Files

```text
*.pbix
```

Contoh:

- Dashboard Development
- Dashboard Enhancement

---

### Configuration Files

```text
*.json
*.yaml
```

---

# Versioning Strategy

Project menggunakan format:

```text
Major.Minor.Patch
```

Contoh:

```text
v1.0.0
```

---

## Major Version

Digunakan ketika terjadi perubahan besar.

Contoh:

- Penambahan dashboard baru
- Perubahan business architecture
- Perubahan data model

Contoh:

```text
v1.0.0
↓
v2.0.0
```

---

## Minor Version

Digunakan ketika terdapat fitur baru.

Contoh:

- KPI baru
- Visual baru
- Analisis baru

Contoh:

```text
v1.1.0
↓
v1.2.0
```

---

## Patch Version

Digunakan untuk perbaikan kecil.

Contoh:

- Bug Fix
- DAX Fix
- SQL Fix
- Documentation Fix

Contoh:

```text
v1.0.1
↓
v1.0.2
```

---

# Project Milestones

## Version 0.1

Project Initialization

Scope:

- Project Setup
- Folder Structure
- Business Foundation

Status:

```text
Completed
```

---

## Version 0.2

Synthetic Data Generation

Scope:

- Dataset Design
- Data Generation Logic
- Initial Validation

Status:

```text
Completed
```

---

## Version 0.3

Data Quality Framework

Scope:

- Profiling
- Cleaning
- Validation
- Reconciliation

Status:

```text
Completed
```

---

## Version 0.4

Data Modeling

Scope:

- Fact Tables
- Dimension Tables
- Star Schema

Status:

```text
Completed
```

---

## Version 0.5

Analytics Layer

Scope:

- KPI Development
- EDA
- Business Analysis

Status:

```text
Completed
```

---

## Version 0.6

Dashboard Development

Scope:

- Executive Dashboard
- Branch Dashboard
- Distributor Dashboard
- Inventory Dashboard
- Product Dashboard

Status:

```text
Completed
```

---

## Version 1.0

Enterprise Release

Scope:

- End-to-End Analytics Platform
- Documentation
- Dashboard Validation
- Business Action Plan

Status:

```text
Production Ready
```

---

# Folder Version Structure

```text
Project/
│
├── Docs/
│
├── SQL/
│
├── Python/
│
├── Data/
│
│   ├── Raw/
│   ├── Clean/
│   ├── Mart/
│   └── Archive/
│
├── Dashboard/
│
└── Archive/
```

---

# Backup Strategy

## Data Backup

Backup dilakukan pada:

- Raw Dataset
- Clean Dataset
- Analytical Dataset
- Data Mart

Frekuensi:

```text
Setiap perubahan besar
```

---

## Dashboard Backup

Backup dilakukan sebelum:

- Penambahan KPI
- Perubahan Relationship
- Perubahan DAX
- Perubahan Visual

Contoh:

```text
Dashboard_v1.pbix
Dashboard_v2.pbix
Dashboard_v3.pbix
```

---

## Documentation Backup

Backup dilakukan setiap:

```text
Major Update
```

---

# Change Log

Seluruh perubahan dicatat dalam:

```text
CHANGELOG.md
```

Format:

## Date

Tanggal perubahan.

## Version

Versi project.

## Changes

Perubahan yang dilakukan.

## Impact

Dampak terhadap project.

---

## Example

### 2026-08-01

Version:

```text
v0.5.0
```

Changes:

- Added Inventory KPI Framework
- Added ABC Analysis
- Added Product Recommendation Logic

Impact:

- Dashboard Accuracy Improved
- Additional Business Insights Available

---

# Power BI Version Control

Karena Power BI tidak mendukung Git secara langsung, setiap perubahan dashboard disimpan menggunakan pendekatan:

```text
FMCG_Dashboard_v1.pbix
FMCG_Dashboard_v2.pbix
FMCG_Dashboard_v3.pbix
```

Untuk perubahan besar:

```text
FMCG_Dashboard_v1_Final.pbix
```

---

# Data Model Change Management

Perubahan berikut wajib didokumentasikan:

### Relationship Changes

Contoh:

```text
Dim_Product
→ Fact_Inventory
```

---

### DAX Changes

Contoh:

```text
Growth Measure Revision
```

---

### KPI Logic Changes

Contoh:

```text
Achievement Formula Revision
```

---

# Quality Control Process

Sebelum release versi baru:

Checklist:

### Documentation

- Completed
- Reviewed

### SQL

- Validated

### Data Quality

- Checked

### Dashboard

- Validated

### KPI

- Recalculated

### Recommendation Logic

- Reviewed

---

# Release Management

## Development Version

Digunakan selama proses pembangunan.

Contoh:

```text
v0.6.0-dev
```

---

## Testing Version

Digunakan untuk validasi.

Contoh:

```text
v0.9.0-test
```

---

## Production Version

Digunakan untuk publikasi.

Contoh:

```text
v1.0.0
```

---

# Success Criteria

Version Control dianggap berhasil apabila:

- Seluruh perubahan dapat dilacak.
- Tidak ada kehilangan data atau file.
- Dashboard dapat dipulihkan ke versi sebelumnya.
- KPI dan business logic memiliki histori perubahan.
- Project dapat dikembangkan tanpa mengganggu versi sebelumnya.

---

# Final Version Control Statement

Version Control memastikan bahwa seluruh perkembangan FMCG Enterprise Analytics & Business Intelligence Platform terdokumentasi dengan baik, dapat ditelusuri, dan dapat dipulihkan kapan pun diperlukan. Dengan pendekatan ini, project menjadi lebih stabil, mudah dipelihara, dan siap untuk dikembangkan lebih lanjut di masa depan.