-- File: sql-scripts/setup.sql
USE master;
GO

-- Create the stored procedure
CREATE OR ALTER PROCEDURE SetupAutoTest
AS
BEGIN
    -- Check if the database exists, create it if it doesn’t
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TestAuto')
    BEGIN
        CREATE DATABASE TestAuto;
        PRINT 'Database AutoTest created.';
    END
    ELSE
    BEGIN
        PRINT 'Database AutoTest already exists.';
    END

    -- Switch to the AutoTest database
    USE TestAuto;
    GO

    -- Check if the table exists, create it if it doesn’t
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

    -- Insert sample data
    INSERT INTO [user] (Name, Surname, Email)
    VALUES 
        ('John', 'Doe', 'john.doe@example.com'),
        ('Jane', 'Smith', 'jane.smith@example.com');
    PRINT 'Sample data inserted into [user] table.';
END;
GO

-- Execute the stored procedure
EXEC SetupAutoTest;
GO
