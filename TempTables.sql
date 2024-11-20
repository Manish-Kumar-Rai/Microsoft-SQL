-------------- Temporary Tables ---------------------

/*

Temporary tables in T-SQL are used to store intermediate results temporarily during the execution of queries. 
They are particularly useful for breaking down complex operations or when working with large datasets that need
intermediate processing.

Syntax:
	For Local Temporary Table:
		CREATE TABLE #TempTable (
			Column1 DataType,
			Column2 DataType,
			...
		)

	For Global Temporary Table:
		CREATE TABLE ##TempTable (
			Column1 DataType,
			Column2 DataType,
			...
		)

*/

----- Creating Temp Tables

-- Local
CREATE TABLE #Employees(
	EmpId int,
	EmpName varchar(100)
)

Select * From #Employees

-- Global

CREATE TABLE ##Employees(
	EmpId int,
	EmpName varchar(100)
)

SELECT * FROM ##Employees

---- Creating temp backup of table

Select * Into ##DimProduct From DimProduct