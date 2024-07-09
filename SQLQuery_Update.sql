

-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
   SELECT [name]
      FROM sys.databases
      WHERE [name] = N'GroceriesDB'
)
CREATE DATABASE GroceriesDB
GO

use GroceriesDB
GO
-- Create a new table called '[TableName]' in schema '[dbo]'
-- Drop the table if it already exists
 use GroceriesDB

IF OBJECT_ID('[dbo].[Customers]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customers]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Customers]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1) , -- Primary Key column
    [_name] NVARCHAR(50) NOT NULL,
    
    -- Specify more columns here
);
GO

-- Insert rows into table 'Customers' in schema '[dbo]'
INSERT INTO [dbo].[Customers]
( -- Columns to insert data into
  [_name]
)
VALUES
( -- First row: values for the columns in the list above
 'customers1Z'
),
(-- Second row: values for the columns in the list above
 'customers2Z'
)
Go

BEGIN TRAN UpDateCustomers
-- Update rows in table '[TableName]' in schema '[dbo]'
UPDATE [dbo].[Customers]
SET [_name] = Left([_name],LEN([_name])-1)  
WHERE RIGHT([_name] ,1)='Z'  
GO
COMMIT TRAN UpDateCustomers

