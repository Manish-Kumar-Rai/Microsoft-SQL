-----  CASE Statement ------------------

/*
In T-SQL, the CASE statement is a versatile conditional expression used to execute logic based on different
conditions, similar to an IF...ELSE structure. It allows you to define multiple conditions and return different
values for each condition, making it more flexible than the IIF function for handling complex scenarios.
Syntax:
	CASE expression
		WHEN value1 THEN result1
		WHEN value2 THEN result2
		...
		ELSE default_result
	END

*/

--Select Distinct color From DimProduct

--Select
--	ProductKey,
--	EnglishProductName,
--	Color,
--	CASE Color
--		When 'Black' Then 'BK'
--		When 'Blue' Then 'BL'
--		When 'Grey' Then 'GR'
--		When 'Multi' Then 'ML'
--		When 'Red' Then 'RD'
--		When 'Silver' Then 'SL'
--		When 'Silver/Black' Then 'SL/BK'
--		When 'White' Then 'WT'
--		When 'Yellow' Then 'YW'
--		Else 'No Code'
--	END As 'Color Code'
--From DimProduct

--Select
--	ProductKey,
--	EnglishProductName,
--	ListPrice,
--	CASE 
--		When ListPrice is NULL Then 'No Value'
--		When ListPrice < 2000 Then 'Low'
--		When ListPrice < 3000 Then 'Avg'
--		Else 'High'
--	END As Category
--From DimProduct