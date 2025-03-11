SELECT BusinessEntityID, firstname,lastname
INTO #TempPersonTable
FROM [Person].[Person]
WHERE title ='mr'

SELECT * FROM #TempPersonTable