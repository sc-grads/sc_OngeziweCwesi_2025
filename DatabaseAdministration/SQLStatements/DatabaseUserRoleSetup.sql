USE [AdventureWorks2019]
GO

-- Add user to the dbdev role
ALTER ROLE [dbdev] ADD MEMBER [LAPTOP-938SNHB2\OngeziweCwesi]
GO

-- Create a new database user for the login sqluser01
CREATE USER [sqluser01] FOR LOGIN [sqluser01]
GO

-- Check permissions for sqluser01
SELECT pe.state_desc, pe.permission_name  
FROM sys.database_principals pr 
INNER JOIN sys.database_permissions pe
    ON pr.principal_id = pe.grantee_principal_id 
WHERE pr.principal_id = DATABASE_PRINCIPAL_ID('sqluser01');

-- Check permissions for LAPTOP-938SNHB2\OngeziweCwesi
SELECT pe.state_desc, pe.permission_name  
FROM sys.database_principals pr 
INNER JOIN sys.database_permissions pe
    ON pr.principal_id = pe.grantee_principal_id 
WHERE pr.principal_id = DATABASE_PRINCIPAL_ID('LAPTOP-938SNHB2\OngeziweCwesi');

