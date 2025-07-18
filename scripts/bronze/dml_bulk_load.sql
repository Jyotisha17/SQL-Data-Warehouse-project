/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source → Bronze)
===============================================================================
Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following operations:
        - Truncates the target bronze tables before loading.
        - Loads data using the BULK INSERT command from CSV files into bronze tables.

Parameters:
    None.
    This procedure does not accept input parameters or return output.

Usage Example:
    EXEC bronze.load_bronze;

===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @load_start_time DATETIME, @load_end_time DATETIME
	BEGIN TRY
		SET @load_start_time = GETDATE();
		PRINT '==========================================================================';
		PRINT 'Loading Bronze Layer.';
		PRINT '==========================================================================';

		PRINT '--------------------------------------------------------------------------';
		PRINT 'Loading CRM Tables.';
		PRINT '--------------------------------------------------------------------------';

		PRINT 'Truncating CRM Table.'

		TRUNCATE TABLE bronze.crm_cust_info; -- FULL LOAD

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into: bronze.crm_cust_info.'

		BULK INSERT bronze.crm_cust_info
		FROM 'F:\Users\Jyo\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'TOTAL LOADING TIME: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================';

		TRUNCATE TABLE bronze.crm_prod_info; 

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into: bronze.crm_prod_info.'
	
		BULK INSERT bronze.crm_prod_info
		FROM 'F:\Users\Jyo\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'TOTAL LOADING TIME: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================';

		TRUNCATE TABLE bronze.crm_sales_details; 

		SET @start_time = GETDATE();
		PRINT 'Inserting Data into: bronze.crm_sales_details.'

		BULK INSERT bronze.crm_sales_details
		FROM 'F:\Users\Jyo\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'TOTAL LOADING TIME: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================';

		PRINT '--------------------------------------------------------------------------';
		PRINT 'Loading ERP Tables.';
		PRINT '--------------------------------------------------------------------------';

		PRINT 'Truncating ERP Tables.'

		TRUNCATE TABLE bronze.erp_cust_az12; 
		SET @start_time = GETDATE();
		PRINT 'Inserting Data into: bronze.erp_cust_az12.'

		BULK INSERT bronze.erp_cust_az12
		FROM 'F:\Users\Jyo\Downloads\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'TOTAL LOADING TIME: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================';

		TRUNCATE TABLE bronze.erp_loc_a101;
		SET @start_time = GETDATE();
		PRINT 'Inserting Data into: bronze.erp_loc_a101.'

		BULK INSERT bronze.erp_loc_a101
		FROM 'F:\Users\Jyo\Downloads\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'TOTAL LOADING TIME: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================';

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		SET @start_time = GETDATE();
		PRINT 'Inserting Data into: bronze.erp_px_cat_g1v2.'

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'F:\Users\Jyo\Downloads\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'TOTAL LOADING TIME: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '===============================';
		SET @load_end_time = GETDATE()
		PRINT 'TOTAL LOAD TIME FOR BRONZE LAYER: ' + CAST(DATEDIFF(SECOND, @load_start_time, @load_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=======================================================';
	END TRY
	BEGIN CATCH
		PRINT '=======================================================';
		PRINT 'ERROR OCCOURED WHILE BRONZE LAYER LOADING';
		PRINT 'ERROR MESSAGE:'+ ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE:'+ CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE:'+ CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=======================================================';
	END CATCH
END
