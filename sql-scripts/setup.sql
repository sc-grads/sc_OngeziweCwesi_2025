-- File: sql-scripts/setup.sql
USE master;
GO

CREATE OR ALTER PROCEDURE SetupAutoDBAlex
AS
BEGIN
    -- Create database if it doesn’t exist
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoDBAlex')
    BEGIN
        CREATE DATABASE AutoDBAlex;
        PRINT 'Database AutoDBAlex created.';
    END
    ELSE
    BEGIN
        PRINT 'Database AutoDBAlex already exists.';
    END

    -- Switch to AutoDBAlex
    USE AutoDBAlex;
    GO

    -- Create user table if it doesn’t exist
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
    BEGIN
        CREATE TABLE [user] (
            Name VARCHAR(50),
            Surname VARCHAR(50),
            Email VARCHAR(100)
        );
        PRINT 'Table [user] created.';
    END
    ELSE
    BEGIN
        PRINT 'Table [user] already exists.';
    END

    -- Insert initial data
    INSERT INTO [user] (Name, Surname, Email)
    VALUES 
        ('Alex', 'Smith', 'alex.smith@example.com'),
        ('Emma', 'Jones', 'emma.jones@example.com');
    PRINT 'Initial data inserted into [user] table.';
END;
GO

-- Execute the stored procedure
EXEC SetupAutoDBAlex;
GO