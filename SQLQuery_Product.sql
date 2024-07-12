-- Create a new database called 'Store'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'DBStore'
)
CREATE DATABASE DBStore
GO

Use DBStore

Go
-- Create a new table called '[Purchases]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[purchases]', 'U') IS NOT NULL
DROP TABLE [dbo].[purchases]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[purchases]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [product_id] int NOT NULL,
    [date] DATETIME NOT NULL,
    [quantity] DECIMAL(18,2) Not NULL
    
    -- Specify more columns here
);
GO

-- Create a new table called '[Products]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Products]', 'U') IS NOT NULL

ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_CategoryID]
GO

DROP TABLE [dbo].[Products]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Products]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [name] NVARCHAR(80) NOT NULL,
    [category_id] Int NOT NULL ,
    [price] DECIMAL(18,2)
    -- Specify more columns here
);
GO



-- Create a new table called '[Categories]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Categories]', 'U') IS NOT NULL

DROP TABLE [dbo].[Categories]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Categories]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
    [name] NVARCHAR(80) NOT NULL
   
    -- Specify more columns here
);
GO

ALTER TABLE Products
ADD CONSTRAINT  FK_CategoryID
FOREIGN KEY  (category_id) REFERENCES Categories(ID)
GO

-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[Categories]
( -- Columns to insert data into
 [name]
)
VALUES
( -- First row: values for the columns in the list above
 'Categorie 1'
),
( -- Second row: values for the columns in the list above
  'Categorie 2'
),
(
    'Categorie 3'
)
-- Add more rows here
GO

-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[Products]
( -- Columns to insert data into
 [Name], [category_id], [price]
)
VALUES
( 
 'Product 1', 1, 9
),
( 
 'Product 2', 2, 7.55
),
( 
 'Product 3', 3, 6.45
),
( 
 'Product 4', 1, 8.5
),
( 
 'Product 5', 2, 8
),
( 
 'Product 6', 3, 5
),
( 
 'Product 7', 1, 10
),
( 
 'Product 8', 2, 8
),
( 
 'Product 9', 3, 6
)

GO

-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[purchases]
( -- Columns to insert data into
 [product_id], [date], [quantity]
)
VALUES
( 
 1, '2019-02-02', 3
),
( 
  1, '2019-03-01', 10
),
( 
  2, '2019-06-01', 5
),
( 
 3, '2019-04-02', 12
),
( 
  3, '2019-05-01', 4
),
( 
  4, '2019-06-01', 20
),
( 
 4, '2019-02-02', 3
),
( 
  5, '2019-03-01', 10
),
( 
  5, '2019-06-01', 5
),
( 
 6, '2020-04-02', 12
),
( 
  6, '2020-05-01', 4
),
( 
  7, '2020-06-01', 20
),
( 
 4, '2020-02-02', 3
),
( 
  3, '2020-03-01', 10
),
( 
  2, '2020-06-01', 5
),
( 
 1, '2020-04-02', 12
),
( 
  9, '2020-05-01', 4
),
( 
  8, '2020-06-01', 20
)
-- Add more rows here
GO


SELECT c.name as [Category name], Sum(p.quantity) as [Total Quantity]
FROM purchases as p
Left join Products as pr
ON p.product_id=pr.Id
INNER join Categories as c 
on pr.category_id=c.Id
GROUP by c.name
GO

SELECT c.name as [Category name], Sum(p.quantity*pr.price) as [Total Amount]
FROM purchases as p
Left join Products as pr
ON p.product_id=pr.Id
INNER join Categories as c 
on pr.category_id=c.Id
GROUP by c.name
GO

SELECT YEAR(p.[date]), Sum(p.quantity) as [Total quantity]
FROM purchases as p
Left join Products as pr
ON p.product_id=pr.Id
INNER join Categories as c 
on pr.category_id=c.Id
where p.date BETWEEN '2019-01-01' AND '2020-12-31'
GROUP by YEAR(p.[date])
GO

