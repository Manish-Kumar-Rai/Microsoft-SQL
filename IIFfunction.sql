---- IIF Function (Condition function)----------------

/*
The IIF function in T-SQL is a shorthand way to write conditional logic within a query, similar to the IF...ELSE
statement. It allows you to return different values based on whether a condition is true or false. IIF is 
essentially a simplified CASE expression that can be useful for basic conditional logic in SQL.
Syntax:
	IIF(condition, true_value, false_value)

NOTE: Maximum nesting of IIF is 10.
*/

--Select
--	ProductKey,
--	EnglishProductName,Color,
--	IIF(Color = 'Red','RD',
--		IIF(Color = 'Silver','SL',
--			IIF(Color = 'Black','BK','NA')
--		)
--	) As 'Color Code'
--From DimProduct
--order by Color

--Select Distinct Color From DimProduct

--Select IIF(10=10,'True','False') as Result

--Select 
--	ProductKey,
--	EnglishProductName,
--	ListPrice,
--	IIF(ListPrice < 2000,'Low',IIF(ListPrice < 3000,'Avg',IIF(ListPrice is NULL,'NA','High'))) As Category
--From DimProduct
--order by ListPrice DESC