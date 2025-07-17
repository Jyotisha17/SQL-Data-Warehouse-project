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

```
data-warehouse-project/
│
├── datasets/ # Raw datasets used for the project (ERP and CRM data)
│
├── docs/ # Project documentation and architecture details
│ ├── etl.drawio # Draw.io file shows all different techniques and methods of ETL
│ ├── data_architecture.drawio # Draw.io file shows the project's architecture
│ ├── data_catalog.md # Catalog of datasets, including field descriptions and metadata
│ ├── data_flow.drawio # Draw.io file for the data flow diagram
│ ├── data_models.drawio # Draw.io file for data models (star schema)
│ ├── naming-conventions.md # Consistent naming guidelines for tables, columns, and files
│
├── scripts/ # SQL scripts for ETL and transformations
│ ├── bronze/ # Scripts for extracting and loading raw data
│ ├── silver/ # Scripts for cleaning and transforming data
│ ├── gold/ # Scripts for creating analytical models
│
├── tests/ # Test scripts and quality files
│
├── README.md # Project overview and instructions
├── LICENSE # License information for the repository
├── .gitignore # Files and directories to be ignored by Git
└── requirements.txt # Dependencies and requirements for the project
```

---

## 📌 License

This project is licensed under the **MIT License**.  
