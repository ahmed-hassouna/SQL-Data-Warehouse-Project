/*
-- Load data into the specified table from a flat file
BULK INSERT [database_name].[schema_name].[table_name]
FROM 'full_file_path'                          -- Full path to the source data file in your pc

WITH (
    FIELDTERMINATOR = 'delimiter',            -- Character used to separate fields (e.g., ',', '|', '\t')
    ROWTERMINATOR = 'row_delimiter',          -- Character used to separate rows (e.g., '\n' for Unix, '\r\n' for Windows)
    FIRSTROW = starting_row_number,           -- Row number to start reading from (use 2 to skip header row)
    CODEPAGE = 'ACP' | 'OEM' | 'RAW' | '65001',-- Character encoding of the file (65001 = UTF-8, ACP = Windows ANSI)
    TABLOCK,                                  -- Locks the entire table from other users accessing during the load for better performance
    ERRORFILE = 'error_file_path',            -- Path to a file where rows with errors will be logged
    MAXERRORS = allowed_number_of_errors      -- Maximum number of allowed errors before the load fails
);
*/

--====================================[ CRM Customer Info Load ]====================================
-- Clear the target Bronze table before loading fresh data
TRUNCATE TABLE bronze.crm_cust_info;

-- Load customer data from CRM source CSV
BULK INSERT bronze.crm_cust_info
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIELDTERMINATOR = ',',     -- Comma as column delimiter
	ROWTERMINATOR = '\n',      -- New line as row delimiter
	FIRSTROW = 2,              -- Skip header row
	TABLOCK                    -- Lock table for faster performance
);

-- Verify number of rows loaded
SELECT COUNT(*) AS NumberOfRows FROM bronze.crm_cust_info;

--====================================[ CRM Product Info Load ]====================================
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2,
	TABLOCK
);

SELECT COUNT(*) AS NumberOfRows FROM bronze.crm_prd_info;

--====================================[ CRM Sales Details Load ]====================================
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2,
	TABLOCK
);

SELECT COUNT(*) AS NumberOfRows FROM bronze.crm_sales_details;

--====================================[ ERP Customer (AZ12) Load ]====================================
TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2,
	TABLOCK
);

SELECT COUNT(*) AS NumberOfRows FROM bronze.erp_cust_az12;

--====================================[ ERP Location (A101) Load ]====================================
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2,
	TABLOCK
);

SELECT COUNT(*) AS NumberOfRows FROM bronze.erp_loc_a101;

-- Note: The following section seems duplicated. You may remove it if not needed.
--====================================[ ERP Location (A101) Load - DUPLICATE ]====================================
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2,
	TABLOCK
);

SELECT COUNT(*) AS NumberOfRows FROM bronze.erp_loc_a101;

--====================================[ ERP Product Category (PX_CAT_G1V2) Load ]====================================
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'E:\portfolio_projects\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2,
	TABLOCK
);

SELECT COUNT(*) AS NumberOfRows FROM bronze.erp_px_cat_g1v2;

