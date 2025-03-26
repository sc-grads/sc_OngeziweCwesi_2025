-- Create the Auto_user login
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Auto_user')
BEGIN
    CREATE LOGIN Auto_user WITH PASSWORD = 'SecureP@ssw0rd123';
END

-- Create the AutoTest database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoTest')
BEGIN
    CREATE DATABASE AutoTest;
END
GO

-- Switch to AutoTest database
USE AutoTest;
GO

-- Create the Auto_user as a database user with full access
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Auto_user')
BEGIN
    CREATE USER Auto_user FOR LOGIN Auto_user;
    ALTER ROLE db_owner ADD MEMBER Auto_user; -- Full access to the database
END
GO

-- Create the user table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'user')
BEGIN
    CREATE TABLE [user] (
        Name VARCHAR(50),
        Surname VARCHAR(50),
        Email VARCHAR(100)
    );
END
GO

-- Create a stored procedure to insert data into the user table
IF NOT EXISTS (SELECT * FROM sys.procedures WHERE name = 'InsertUser')
BEGIN
    EXEC('
        CREATE PROCEDURE InsertUser
            @Name VARCHAR(50),
            @Surname VARCHAR(50),
            @Email VARCHAR(100)
        AS
        BEGIN
            INSERT INTO [user] (Name, Surname, Email)
            VALUES (@Name, @Surname, @Email);
        END
    ');
END
GO

-- Insert sample data using the stored procedure
EXEC InsertUser @Name = 'John', @Surname = 'Doe', @Email = 'john.doe@example.com';
EXEC InsertUser @Name = 'Jane', @Surname = 'Smith', @Email = 'jane.smith@example.com';
GO
