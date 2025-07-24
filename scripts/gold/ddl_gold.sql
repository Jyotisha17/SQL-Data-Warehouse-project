/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dimension_customers
-- =============================================================================
IF OBJECT_ID('gold.dimension_customers', 'V') IS NOT NULL
    DROP VIEW gold.dimension_customers;
GO

CREATE VIEW gold.dimension_customers AS 

SELECT 
	ROW_NUMBER() OVER(ORDER BY cst_id) AS customer_key,
	ci.cst_id AS customer_id,
	ci.cst_key AS customer_number,
	ci.cst_firstname AS first_name,
	ci.cst_lastname AS last_name,
	cl.cntry AS country,
	ci.cst_marital_status AS marital_status,
	CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr  -- Crm is master table for gender info
		ELSE COALESCE(eci.gen, 'n/a')
	END AS gender,
	eci.bdate AS birthdate,
	ci.cst_create_date AS create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 eci
ON ci.cst_key = eci.cid
LEFT JOIN silver.erp_loc_a101 cl
ON ci.cst_key = cl.cid;
GO
  
-- =============================================================================
-- Create Dimension: gold.dimension_products
-- =============================================================================
IF OBJECT_ID('gold.dimension_products', 'V') IS NOT NULL
    DROP VIEW gold.dimension_products;
GO

CREATE VIEW gold.dimension_products AS 

SELECT 
	ROW_NUMBER() OVER(ORDER BY P.prd_start_dt, P.prd_key)AS product_key,
	p.prd_id AS product_id,
	p.prd_key AS product_number, 
	p.prd_nm AS product_name,
	p.cat_id AS category_id, 
	ca.cat AS category,
	ca.subcat AS subcategory,
	ca.maintenance,
	p.prd_line AS product_line,
	p.prd_cost AS cost, 
	p.prd_start_dt AS start_date
FROM silver.crm_prd_info p 
LEFT JOIN silver.erp_px_cat_g1v2 ca
ON p.cat_id = ca.id
WHERE prd_end_dt IS NULL;
GO

-- =============================================================================
-- Create Dimension: gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO
  
CREATE VIEW gold.fact_sales AS

SELECT 
	s.sls_ord_num AS order_number,
	p.product_key,
	c.customer_key, 
	s.sls_order_dt AS order_date, 
	s.sls_ship_dt AS shipping_date, 
	s.sls_due_dt AS due_date, 
	s.sls_sales AS sales_amount, 
	s.sls_quantity AS quantity, 
	s.sls_price AS price
FROM silver.crm_sales_details s
LEFT JOIN gold.dimension_products p
ON s.sls_prd_key = p.product_number
LEFT JOIN gold.dimension_customers c
ON s.sls_cust_id = c.customer_id;

GO
