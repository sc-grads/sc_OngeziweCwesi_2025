-- Check the server permissions of a specific login
SELECT pr.principal_id, pr.name, pe.state_desc, pe.permission_name
FROM sys.server_principals pr
INNER JOIN sys.server_permissions pe
   ON pr.principal_id = pe.grantee_principal_id
WHERE pr.principal_id = SUSER_ID('LAPTOP-938SNHB2\OngeziweCwesi')
   OR pr.principal_id = SUSER_ID('sa');

-- Grant IMPERSONATE permission separately
GRANT IMPERSONATE ANY LOGIN TO [LAPTOP-938SNHB2\OngeziweCwesi];
GRANT IMPERSONATE ANY LOGIN TO sa;
GO

-- Create a server role and assign privileges
CREATE SERVER ROLE devops;
GRANT ALTER ANY DATABASE TO devops;
ALTER SERVER ROLE devops ADD MEMBER [LAPTOP-938SNHB2\OngeziweCwesi];
GO

-- Check permissions assigned to the devops role
SELECT pe.state_desc, pe.permission_name
FROM sys.server_principals pr
INNER JOIN sys.server_permissions pe  
    ON pr.principal_id = pe.grantee_principal_id
WHERE pr.name = 'devops';

-- Check members of the devops role
SELECT rm.member_principal_id, pr.name
FROM sys.server_role_members rm
INNER JOIN sys.server_principals pr  
    ON rm.member_principal_id = pr.principal_id
WHERE rm.role_principal_id = (SELECT principal_id FROM sys.server_principals WHERE name = 'devops');
