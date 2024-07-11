use master
-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Intergalactic'
)
CREATE DATABASE Intergalactic
GO
use Intergalactic
-- Create a new table called '[MartianBases]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[MartianBases]', 'U') IS NOT NULL
DROP TABLE [dbo].[MartianBases]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[MartianBases]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
    [name] NVARCHAR(50) NOT NULL

    -- Specify more columns here
);
GO

IF OBJECT_ID('[dbo].[MartiansRole]', 'U') IS NOT NULL
DROP TABLE [dbo].[MartiansRole]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[MartiansRole]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
    [name] NVARCHAR(80) NOT NULL,
    [superior_id] int NOT NULL
   
    -- Specify more columns here
);
GO
-- Create a new table called '[Martians]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Martians]', 'U') IS NOT NULL
DROP TABLE [dbo].[Martians]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Martians]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
    [name] NVARCHAR(50) NOT NULL,
    [earthling_id] int NULL,
    [martiansRole_id] int Not Null,
    [martianBase_id] int Not Null
    -- Specify more columns here
);
GO

-- Create a new table called '[Earthling]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Earthling]', 'U') IS NOT NULL
DROP TABLE [dbo].[Earthling]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Earthling]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
    [firstname] NVARCHAR(80) NOT NULL,
    [lastname] NVARCHAR(80) NOT NULL,
    [continents_id] INT NOT null 
    -- Specify more columns here
);
GO


-- Create a new table called '[Continents]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Continents]', 'U') IS NOT NULL
DROP TABLE [dbo].[Continents]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Continents]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- Primary Key column
    [name] NVARCHAR(80) NOT NULL,

    -- Specify more columns here
);
GO

-- Insert rows into table 'MartianBases' in schema '[dbo]'
INSERT INTO [dbo].[MartianBases]
( -- Columns to insert data into
 [name]
)
VALUES
( -- First row: values for the columns in the list above
 'Base 1'
),
( -- Second row: values for the columns in the list above
 'Base 2'
),
( -- Second row: values for the columns in the list above
 'Base 3'
)
-- Add more rows here
GO
-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[MartiansRole]
( -- Columns to insert data into
 [name],[superior_id]
)
VALUES
( -- First row: values for the columns in the list above
 'Empereur',1
),
( -- Second row: values for the columns in the list above
 'Niveau 1',3
),
( -- Second row: values for the columns in the list above
 'Niveau 2',1
)
-- Add more rows here
GO

INSERT INTO [dbo].[Martians]
( -- Columns to insert data into
 [name], [earthling_id], [martiansRole_id], [martianBase_id] 
)
VALUES
( -- First row: values for the columns in the list above
 'Martians 1',1,1,1
),
( -- Second row: values for the columns in the list above
 'Martians 2',2,2,2
),
( -- Second row: values for the columns in the list above
 'Martians 3',3,3,3
)
-- Add more rows here
GO

INSERT INTO [dbo].[Continents]
( -- Columns to insert data into
 [name]
)
VALUES
( -- First row: values for the columns in the list above
 'Asia'
),
( -- Second row: values for the columns in the list above
 'Africa'
),
( -- Second row: values for the columns in the list above
 'Europe'
)
-- Add more rows here
GO

INSERT INTO [dbo].[Earthling]
( -- Columns to insert data into
 [firstname], [lastname],[continents_id]
)
VALUES
( -- First row: values for the columns in the list above
 'Anna', 'Memi',1
),
( -- Second row: values for the columns in the list above
 'Fransois', 'Verdier', 3
),
( -- Second row: values for the columns in the list above
 'Amir', 'Amon', 2
)
-- Add more rows here
GO

use intergalactic
select m.[name] as NameOfMartian, e.[firstname]+ ' '+ e.[lastname] as LienedEarthling, c.[name] as ContinentsOfEarthling, b.name as MartianBase
from dbo.[martians] as m
left join dbo.[Earthling] as e 
on m.earthling_id=e.id
left JOIN dbo.[continents] as c
on e.continents_id = c.id
left join dbo.[MartianBases] as b
on m.martianBase_id=b.id
GO