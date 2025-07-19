/* 
=============================================================================
Create database and schemas
=============================================================================
Script Purpose:

This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
within the database: 'bronze', 'silver', and 'gold'.


WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.
*/



use master;
--Drop the database if it already exist
--Before 
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force the database into SINGLE_USER mode to ensure exclusive access
    -- ROLLBACK IMMEDIATE cancels and rolls back all other users' transactions instantly
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Safely drop (delete) the database now that no other users are connected
	DROP DATABASE DataWarehouse;
END

--Create database "Data warehouse"
create database DataWarehouse;
use DataWarehouse;

--------------------------------------------------creating schemas-------------------------------------------------------------
-- 'bronze' schema used for storing raw or ingested data in a Medallion Architecture
CREATE SCHEMA bronze;
GO

-- 'silver' schema is used for storing cleaned, transformed, and enriched data (after initial processing)
CREATE SCHEMA silver;
GO

-- 'gold' schema contains highly curated, business-ready data for reporting and analytics
CREATE SCHEMA gold;




