-- Create the database
CREATE DATABASE dbtest;
GO

-- Alter database settings
ALTER DATABASE dbtest SET MIXED_PAGE_ALLOCATION ON;
GO

-- Use the database
USE dbtest;
GO

-- Create a table
CREATE TABLE heaptable1 (c1 INT, c2 VARCHAR(8000));
GO

-- Insert data into the table
INSERT INTO heaptable1 VALUES (1, REPLICATE('a', 1000));
GO

-- Select data from the table
SELECT * FROM heaptable1;
GO

-- Drop the table
DROP TABLE heaptable1;
GO

-- Select data with additional information
SELECT
    ht1.c1,
    ht1.c2,
    p.file_id,
    p.page_id,
    dddpa.is_mixed_page_allocation
FROM
    heaptable1 AS ht1
CROSS APPLY
    sys.fn_PhysLocCracker(%%physloc%%) AS p
INNER JOIN
    sys.dm_db_database_page_allocation(
        DB_ID(),
        OBJECT_ID('dbo.heaptable1'),
        NULL,
        NULL,
        'detailed'
    ) AS dddpa
ON
    p.file_id = dddpa.allocated_page_file_id
    AND p.page_id = dddpa.allocated_page_page_id;
GO

-- Enable trace flag
DBCC TRACEON(3604, -1);
GO

-- Display page information
DBCC PAGE(dbtest, 1, 1, 3);
GO
