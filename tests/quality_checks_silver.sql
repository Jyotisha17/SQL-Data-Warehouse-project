/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.
===============================================================================
*/

-- Check for Nulls and Duplicates in primary Key for crm_cust_info tables 
--EXPECTTATION : No Results

SELECT cst_id,
	COUNT(*) 
	FROM bronze.crm_cust_info
	GROUP BY cst_id
	HAVING COUNT(*) > 1 or cst_id IS NULL;

WITH CTE AS		
	(SELECT *, ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) rw_number FROM bronze.crm_cust_info)
	SELECT * FROM CTE
	WHERE rw_number = 1;

SELECT * FROM bronze.crm_cust_info
WHERE cst_id = 29466;

-- Check for unwanted Spaces for String values

SELECT cst_firstname	
	FROM bronze.crm_cust_info
	WHERE cst_firstname ! = TRIM(cst_firstname);

SELECT cst_lastname
	FROM bronze.crm_cust_info
	WHERE cst_lastname ! = TRIM(cst_lastname);

SELECT cst_marital_status
	FROM bronze.crm_cust_info
	WHERE cst_marital_status ! = TRIM(cst_marital_status);

SELECT cst_gndr
	FROM bronze.crm_cust_info
	WHERE cst_gndr ! = TRIM(cst_gndr);

-- Data Standardization and consistency

SELECT DISTINCT cst_marital_status
	FROM bronze.crm_cust_info;

SELECT DISTINCT cst_gndr
	FROM bronze.crm_cust_info;

--Checking cleaned data in silver layer crm_cust_info table

SELECT * FROM silver.crm_cust_info;

SELECT cst_id,
	COUNT(*) 
	FROM silver.crm_cust_info
	GROUP BY cst_id
	HAVING COUNT(*) > 1 or cst_id IS NULL;

SELECT cst_firstname	
	FROM silver.crm_cust_info
	WHERE cst_firstname ! = TRIM(cst_firstname);

SELECT cst_lastname
	FROM silver.crm_cust_info
	WHERE cst_lastname ! = TRIM(cst_lastname);

SELECT cst_marital_status
	FROM silver.crm_cust_info
	WHERE cst_marital_status ! = TRIM(cst_marital_status);

SELECT cst_gndr
	FROM silver.crm_cust_info
	WHERE cst_gndr ! = TRIM(cst_gndr);

-- Check for Nulls and Duplicates in primary Key for crm_cust_info tables 
--EXPECTTATION : No Results

SELECT prd_key FROM silver.crm_prd_info
WHERE prd_key != TRIM(prd_key);

SELECT prd_nm FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

SELECT prd_line FROM silver.crm_prd_info
WHERE prd_line != TRIM(prd_line);

SELECT prd_id, COUNT(*) FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*)>1 OR prd_id IS NULL;

SELECT prd_cost FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

SELECT DISTINCT prd_line FROM silver.crm_prd_info;

-- check if date format is corrcet as start date can not be after end date.

SELECT * FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- Check for Nulls and Duplicates in primary Key for crm_sales_details tables 
--EXPECTTATION : No Results

SELECT TOP (1000) 
	  sls_ord_num,
      sls_prd_key,
      sls_cust_id,
      sls_order_dt,
      sls_ship_dt,
      sls_due_dt,
      sls_sales,
      sls_quantity,
      sls_price
  FROM bronze.crm_sales_details
  
  --WHERE sls_prd_key IN (SELECT prd_key FROM silver.crm_prd_info)
  --WHERE sls_cust_id IN (SELECT cst_id FROM silver.crm_cust_info)

SELECT sls_ord_num FROM silver.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num);

SELECT sls_prd_key FROM silver.crm_sales_details
WHERE sls_prd_key != TRIM(sls_prd_key);

SELECT * FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt;

SELECT * FROM silver.crm_sales_details
WHERE sls_ship_dt> sls_due_dt;

SELECT sls_order_dt, sls_ship_dt,sls_due_dt FROM bronze.crm_sales_details 
WHERE sls_order_dt = 0;

SELECT  sls_order_dt FROM silver.crm_sales_details
where sls_order_dt < 0 OR sls_order_dt IS NULL;

SELECT  sls_ship_dt FROM bronze.crm_sales_details
where sls_ship_dt < 0 OR sls_ship_dt IS NULL

SELECT 
NULLIF(sls_order_dt,0) AS sls_order_dt
FROM silver.crm_sales_details
WHERE sls_order_dt <= 0 
OR LEN(sls_order_dt) != 8
OR sls_order_dt > 20500101
OR sls_order_dt < 19000101

SELECT 
sls_sales, 
sls_quantity,
sls_price 
FROM silver.crm_sales_details
where sls_sales != sls_quantity*sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity,sls_price

SELECT * FROM silver.crm_sales_details
