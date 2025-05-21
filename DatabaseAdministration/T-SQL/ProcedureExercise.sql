select * from tblTransaction
where EmployeeNumber between 3 and 11
order by EmployeeNumber

select sum(Amount) from tblTransaction
where EmployeeNumber between 3 and 11

select count(distinct EmployeeNumber) from tblTransaction
where EmployeeNumber between 3 and 11

select count(distinct EmployeeNumber) from tblEmployee
where EmployeeNumber between 3 and 11