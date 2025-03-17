DBCC CHECKDB	('AdventureWorks2019')
DBCC CHECKDB    ('AdventureWorks2019') with no_infomsgs

alter database AdventureWorks2019 set single_user with rollback immediate
go
dbcc checkdb ('AdventureWorks2019',REPAIR_ALLOW_DATA_LOSS)
GO
alter database AdventureWorks2019 set MULTI_user with rollback immediate
GO
