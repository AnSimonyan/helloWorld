
-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'SuperMoney'
)
CREATE DATABASE SuperMoney
GO

USE SuperMoney

-- Create a new table called '[TableName]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[logs]', 'U') IS NOT NULL
DROP TABLE [dbo].[logs]
GO
-- Create the table in the specified schema
CREATE TABLE logs ("id" INT PRIMARY KEY IDENTITY(1,1), "user" VARCHAR(50), "message" VARCHAR(50));
GO

INSERT INTO logs ("user","message") VALUES ('hack3r', 'Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r' , 'Erases file'); 
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Leaves');
INSERT INTO logs ("user","message") VALUES ('hack3r','Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r','Erases file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Leaves');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Erases file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Erases file');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Erases file');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
GO


BACKUP DATABASE SuperMoney
TO DISK = 'C:\Users\Asus\AppData\Local\AzureFunctionsTools\SuperMoney.bak'
   WITH FORMAT,
      MEDIANAME = 'SQLServerBackups',
      NAME = 'Full Backup of SuperMoney';
GO

BEGIN TRANSACTION T1

DELETE 
FROM dbo.[Logs]
WHERE EXISTS
    (SELECT [User] FROM dbo.[Logs]
     WHERE [User] = 'h4ck3r')
Go

DELETE top(3)
FROM dbo.[Logs]
Go
COMMIT