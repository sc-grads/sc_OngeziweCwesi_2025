select *
from [dbo].[tblEmployee] as E
--Table Scan
select *
from [dbo].[tblEmployee] as E
where E.EmployeeNumber = 134 
--Still a Table Scan
--Hash match:
select * 
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department

select D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
from [dbo].[tblDepartment] as D
left join [dbo].[tblEmployee] as E
on D.Department = E.Department
