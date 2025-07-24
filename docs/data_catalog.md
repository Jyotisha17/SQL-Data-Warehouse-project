## ✅ Overview: Gold Layer in Data Catalog

The **Gold Layer** represents the **business-ready** data in a modern data architecture.  
It is the final curated layer in the data pipeline, where data is **cleaned, transformed, joined**, and **modeled** to support analytical use cases.

- **Fact tables**: Contain quantitative metrics and business events (e.g., `sales_amount`, `quantity`, `price`).
- **Dimension tables**: Contain descriptive attributes used to filter, group, or label facts (e.g., `customers`, `products`, `date`).

---

## 🟨 1. gold.dim_customers  
**Purpose**: Stores customer details enriched with demographic and geographic data.

| Column Name     | Data Type     | Description                                                                 |
|------------------|---------------|-----------------------------------------------------------------------------|
| `customer_key`   | INT           | Surrogate key uniquely identifying each customer record in the dimension table. |
| `customer_id`    | INT           | Unique numerical identifier assigned to each customer.                     |
| `customer_number`| NVARCHAR(50)  | Alphanumeric identifier representing the customer.                         |
| `first_name`     | NVARCHAR(50)  | The customer's first name.                                                 |
| `last_name`      | NVARCHAR(50)  | The customer's last name or family name.                                   |
| `country`        | NVARCHAR(50)  | The country of residence for the customer (e.g., 'Australia').             |
| `marital_status` | NVARCHAR(50)  | The marital status of the customer (e.g., 'Married', 'Single').            |
| `gender`         | NVARCHAR(50)  | The gender of the customer (e.g., 'Male', 'Female', 'n/a').                |
| `birthdate`      | DATE          | Date of birth, formatted as YYYY-MM-DD (e.g., 1971-10-06).                  |
| `create_date`    | DATE          | The date and time when the customer record was created.                    |

---

## 🟨 2. gold.dim_products  
**Purpose**: Provides information about the products and their attributes.

| Column Name            | Data Type     | Description                                                                 |
|-------------------------|---------------|-----------------------------------------------------------------------------|
| `product_key`           | INT           | Surrogate key uniquely identifying each product record.                    |
| `product_id`            | INT           | Unique identifier assigned to the product.                                 |
| `product_number`        | NVARCHAR(50)  | Alphanumeric code representing the product.                                |
| `product_name`          | NVARCHAR(50)  | Descriptive name including details like type, color, size.                 |
| `category_id`           | NVARCHAR(50)  | Identifier for the product's category.                                     |
| `category`              | NVARCHAR(50)  | Broad classification (e.g., Bikes, Components).                            |
| `subcategory`           | NVARCHAR(50)  | Detailed classification within the category.                               |
| `maintenance`           | NVARCHAR(50)  | Indicates if maintenance is required (e.g., 'Yes', 'No').                  |
| `product_line`          | NVARCHAR(50)  | Product line or series (e.g., Road, Mountain).                             |
| `cost`                  | INT           | Base cost of the product.                                                  |                 
| `start_date`            | DATE          | Date when the product became available for sale or use.                    |

---

## 🟨 3. gold.fact_sales  
**Purpose**: Stores transactional sales data for analytical purposes.

| Column Name     | Data Type     | Description                                                                 |
|------------------|---------------|-----------------------------------------------------------------------------|
| `order_number`   | NVARCHAR(50)  | Unique alphanumeric identifier for each sales order (e.g., 'SO54496').     |
| `product_key`    | INT           | Surrogate key linking to the product dimension.                             |
| `customer_key`   | INT           | Surrogate key linking to the customer dimension.                            |
| `order_date`     | DATE          | The date the order was placed.                                              |
| `shipping_date`  | DATE          | The date the order was shipped.                                             |
| `due_date`       | DATE          | The date payment was due.                                                   |
| `sales_amount`   | INT           | Total monetary value of the sale (e.g., 25).                                |
| `quantity`       | INT           | Number of units ordered (e.g., 1).                                          |
| `price`          | INT           | Price per unit (e.g., 25).                                                  |

---
