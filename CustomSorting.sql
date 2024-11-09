------- Creating Custom Sorting ---------

---- Simple Sorting----------
--Select
--	EmployeeKey,
--	FirstName,
--	DepartmentName
--From DimEmployee
--Order By DepartmentName

---- Custom Sorting -------

--Select
--	EmployeeKey,
--	FirstName,
--	DepartmentName
--From DimEmployee
--Order BY Case DepartmentName
--			When 'Sales' Then 1
--			When 'Finance' Then 2
--			When 'Engineering' Then 3
--			When 'Marketing' Then 4
--			Else 5
--		 End Desc

--Select
--	Distinct DepartmentName
--From DimEmployee