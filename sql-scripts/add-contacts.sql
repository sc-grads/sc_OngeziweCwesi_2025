-- File: sql-scripts/add-contacts.sql
USE AutoTest;
GO

-- Create a new table called "contacts"
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'contacts')
BEGIN
    CREATE TABLE contacts (
        ContactID INT IDENTITY(1,1) PRIMARY KEY,
        FirstName VARCHAR(50),
        LastName VARCHAR(50),
        Phone VARCHAR(15)
    );
    PRINT 'Table [contacts] created.';
END
ELSE
BEGIN
    PRINT 'Table [contacts] already exists.';
END

-- Insert sample data into contacts
INSERT INTO contacts (FirstName, LastName, Phone)
VALUES 
    ('Alice', 'Johnson', '555-1234'),
    ('Bob', 'Williams', '555-5678');
PRINT 'Sample data inserted into [contacts] table.';

-- Create a stored procedure to query contacts
CREATE OR ALTER PROCEDURE GetAllContacts
AS
BEGIN
    SELECT FirstName, LastName, Phone 
    FROM contacts 
    ORDER BY LastName, FirstName;
END;
GO

-- Execute the stored procedure to test it
EXEC GetAllContacts;
GO