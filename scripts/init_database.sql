/*
*******************************************************************************
Data Warehouse Environment Setup
*******************************************************************************
Summary:
    This script handles the creation of the main database and its logical divisions.
    It ensures a fresh start by checking for the existence of 'DataWarehouse',
    removing it if necessary, and establishing the new container.

    Schema Structure:
    - bronze: Landing zone for raw data.
    - silver: Staging zone for cleaned and transformed data.
    - gold:   Final presentation zone for data models (Star Schema).

IMPORTANT:
    Running this script will erase the current database instance.
    Please verify that no critical data is stored in 'DataWarehouse' before proceeding.
*******************************************************************************
*/


-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

-- Create Schemas
CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;