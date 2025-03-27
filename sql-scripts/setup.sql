----
USE master;
GO

-- Stored procedure to create the database if it doesn't exist
CREATE OR ALTER PROCEDURE sp_CreateAutoTest_OC_27March
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoTest_OC_27March')
        BEGIN
            CREATE DATABASE AutoTest_OC_27March;
            PRINT 'Database AutoTest_OC_27March created.';
        END
        ELSE
        BEGIN
            PRINT 'Database AutoTest_OC_27March already exists.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error creating database: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END;
GO

-- Execute the stored procedure
EXEC sp_CreateAutoTest_OC_27March;
GO

-- Switch to the new database
BEGIN TRY
    USE AutoTest_OC_27March;
    PRINT 'Switched to AutoTest_OC_27March database.';
END TRY
BEGIN CATCH
    PRINT 'Error switching to AutoTest_OC_27March: ' + ERROR_MESSAGE();
    RETURN;
END CATCH
GO

-- Create the user table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
BEGIN
    BEGIN TRY
        CREATE TABLE [user] (
            Name VARCHAR(50),
            Surname VARCHAR(50),
            Email VARCHAR(100)
        );
        PRINT 'Table [user] created.';
    END TRY
    BEGIN CATCH
        PRINT 'Error creating table: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END
GO

-- Stored procedure to insert data
CREATE OR ALTER PROCEDURE sp_InsertUserData
AS
BEGIN
    BEGIN TRY
        INSERT INTO [user] (Name, Surname, Email)
        VALUES 
            ('John', 'Doe', 'john.doe@example.com'),
            ('Ongeziwe', 'Cwesi', 'ongeziwecwesi@example.com'),
            ('Jane', 'Smith', 'jane.smith@example.com');
        PRINT 'Sample data inserted into user table.';
    END TRY
    BEGIN CATCH
        PRINT 'Error inserting data: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END;
GO

-- Execute the insert procedure
EXEC sp_InsertUserData;
GO
