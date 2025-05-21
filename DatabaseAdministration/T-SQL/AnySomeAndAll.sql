select * 
from tblTransaction as T
Where EmployeeNumber = some -- or "some"
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <> any -- does not work properly
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <> all 
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber

select * 
from tblTransaction as T
Where EmployeeNumber <= all
    (Select EmployeeNumber from tblEmployee where EmployeeLastName like 'y%')
order by EmployeeNumber


