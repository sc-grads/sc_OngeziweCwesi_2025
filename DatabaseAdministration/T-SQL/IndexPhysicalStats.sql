SELECT * FROM sys.dm_db_index_physical_stats  
    (DB_ID(N'70-461'), OBJECT_ID(N'dbo.tblEmployee'), NULL, NULL , 'DETAILED');  
