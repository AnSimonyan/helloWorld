
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
-- Create a new table called '[Product]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Product]', 'U') IS NOT NULL
DROP TABLE [dbo].[Product]
GO

-- Create the table in the specified schema
CREATE TABLE [dbo].[Product]
(
   [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
   [_name] NVARCHAR(50) NOT NULL,
   [_price] DECIMAL (38,2) NOT NULL
   -- Specify more columns here
)
GO
-- Create a new table called '[Grocery]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Grocery]', 'U') IS NOT NULL
DROP TABLE [dbo].[Grocery]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Grocery]
(
   [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1)  , -- Primary Key column
   [_amount] Decimal(38,2) NOT NULL,
   [_date] DATETIME NOT NULL
   -- Specify more columns here
);
GO

-- Insert rows into table 'Grocery' in schema '[dbo]'
INSERT INTO [dbo].[Product]
( -- Columns to insert data into
  [_name], [_price]
)
VALUES
( -- First row: values for the columns in the list above
 'Pain', 1.15
),
( -- Second row: values for the columns in the list above
 'Chocolat noir', 1.95
),
( -- Second row: values for the columns in the list above
 'Chocolat blanc', 1.95
)
-- Add more rows here
GO

-- Insert rows into table 'Grocery' in schema '[dbo]'
INSERT INTO [dbo].[Grocery]
( -- Columns to insert data into
  [_amount], [_date]
)
VALUES
( -- First row: values for the columns in the list above
 12, '2015-01-22'
),
( -- Second row: values for the columns in the list above
 13, '2015-01-21'
),
( -- Second row: values for the columns in the list above
 11, '2015-01-20'
)
-- Add more rows here
GO