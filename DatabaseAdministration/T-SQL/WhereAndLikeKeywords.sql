select * from tblEmployee
where [EmployeeLastName] <> 'Word' -- NOT WORD AS A LAST NAME

select * from tblEmployee
where [EmployeeLastName] like '_W%' -- LETTER W IS THE SECOND LETTER IN THE WORD AND FOLLOWED BY FROM ZERO TO INFINITE LETTERS AFTER IT

Select * from tblEmployee
where [EmployeeLastName] like '[r-t]%' -- ANY EMPLOYEE WHOSE LAST NAME START WITH EITHER R,S,T

Select * from tblEmployee
where [EmployeeLastName] like '[^rst]%'  -- WHERE THE EMPLOYEE LASTNAME DOES NOT START WITH R,S,T 


select * from tblEmployee
where EmployeeLastName like '[%]%' -- Retrieve all employee records where the last name contains the percentage symbol (%) as a literal character


select * from tblEmployee
where EmployeeLastName like '`%%' ESCAPE '`'  -- Retrieve all employee records where the last name starts with a literal percent sign (%)
