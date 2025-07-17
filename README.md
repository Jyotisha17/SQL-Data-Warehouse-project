# SQL-Data-Warehouse-project

# 🧠 Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project**! 🚀  
This project showcases a complete solution—from building a data warehouse to generating actionable business insights. It's designed as a portfolio project to highlight practical skills in **data engineering**, **ETL**, and **analytics**.

---

## 🏗️ Data Architecture

This project uses the **Medallion Architecture** with three layers:

- **Bronze Layer:** Raw data from source systems (CSV files) is ingested into a SQL Server database.
- **Silver Layer:** Data is cleaned, standardized, and transformed for analysis.
- **Gold Layer:** Business-ready data modeled in a star schema format for reporting and analytics.

---

## 📖 Project Overview

This project includes:

- **ETL Pipelines:** Extract, transform, and load data from ERP and CRM sources.
- **Data Modeling:** Build fact and dimension tables optimized for analytics.
- **Analytics & Reporting:** Use SQL to generate insights on customer behavior, product performance, and sales trends.

---

## 🎯 Skills Demonstrated

- SQL Development  
- Data Architecture  
- ETL Pipeline Building  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Tools & Resources

- **SQL Server Express:** To host the database.
- **SQL Server Management Studio (SSMS):** For managing the SQL Server environment.
- **Draw.io:** For creating data architecture and flow diagrams.
- **GitHub:** Version control and project collaboration.
- **Notion:** Project planning and documentation.
- **Datasets:** CRM and ERP data in CSV format (included in repo).

---

## 🚀 Project Goals

### Data Engineering

- **Objective:** Build a modern data warehouse using SQL Server to integrate ERP and CRM data.
- **Tasks:**
  - Import data from two systems.
  - Clean and validate the data.
  - Integrate both sources into a single star schema.
  - Document the data model and process.

### Data Analytics

- **Objective:** Generate insights using SQL queries.
- **Focus Areas:**
  - Customer behavior
  - Product performance
  - Sales trends

These insights support better decision-making for stakeholders.

---
## 📂 Repository Structure

<pre> ```text data-warehouse-project/ │ ├── datasets/ # Raw CRM and ERP datasets (CSV files) │ ├── docs/ # Project documentation and diagrams │ ├── data_architecture.drawio # Data architecture diagram │ ├── etl_process.drawio # ETL pipeline process flow │ ├── data_models.drawio # Star schema and table models │ ├── data_catalog.md # Dataset descriptions and metadata │ ├── naming-conventions.md # Naming standards for tables and fields │ ├── scripts/ # SQL scripts for ETL and transformations │ ├── bronze/ # Raw data loading scripts │ ├── silver/ # Data cleaning and transformation scripts │ ├── gold/ # Data modeling scripts │ ├── tests/ # Data validation and quality checks ├── README.md # Project overview and instructions ├── LICENSE # License information ├── .gitignore # Files ignored by Git └── requirements.txt # Project tools and dependencies ``` </pre>


---

## 📌 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and share it with proper attribution.
