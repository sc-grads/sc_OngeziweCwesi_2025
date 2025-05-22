SELECT 
    E.EmployeeFirstName AS '@EmployeeFirstName',
    E.EmployeeLastName AS '@EmployeeLastName',
    E.EmployeeNumber,
    E.DateOfBirth,
    T.Amount AS 'Transaction/Amount',
    T.DateOfTransaction AS 'Transaction/DateOfTransaction'
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
    ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML PATH('Employees'), ROOT('MyXML');
