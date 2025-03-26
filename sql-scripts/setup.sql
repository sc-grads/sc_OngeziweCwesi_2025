-- sql-scripts/setup.sql
USE master;
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
    PRINT 'Database AutoTest created.';
END

USE AutoTest;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
BEGIN
    CREATE TABLE [user] (
        Name VARCHAR(50),
        Surname VARCHAR(50),
        Email VARCHAR(100)
    );
    PRINT 'Table [user] created.';
END

CREATE OR ALTER PROCEDURE InsertUser
AS
BEGIN
    INSERT INTO [user] (Name, Surname, Email)
    VALUES 
        ('John', 'Doe', 'john.doe@example.com'),
        ('Jane', 'Smith', 'jane.smith@example.com');
    PRINT 'Sample data inserted.';
END;
GO

EXEC InsertUser;
GO
