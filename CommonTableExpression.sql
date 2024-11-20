----------------- Common Table Expression -------------------

/*
A Common Table Expression (CTE) in T-SQL is a temporary result set that is defined within the execution scope of
a single SELECT, INSERT, UPDATE, DELETE, or MERGE statement. It's a useful feature for improving the readability
and manageability of complex queries.

Syntax:
	WITH cte_name (column1, column2, ...)
		AS
		(
		    -- CTE Query Definition
		    SELECT ...
		    FROM ...
		    WHERE ...
		)
	-- Query using the CTE
	SELECT ...
	FROM cte_name

*/

--WITH CteSelectData
--As
--(
--	Select ProductKey,Year(OrderDate) As OrderYear,SalesAmount From FactInternetSales
--)
--Select ProductKey,OrderYear,SUM(SalesAmount) As TotalSales From CteSelectData
--Group By ProductKey,OrderYear

----- Multi Part CTE -------------------

--WITH CteSales
--As
--(
--	Select ProductKey,SUM(SalesAmount) As TotalSales From FactInternetSales
--	Group By ProductKey
--),
--CteProducts
--As
--(
--	Select ProductKey,EnglishProductName From DimProduct
--)
--Select P.ProductKey, P.EnglishProductName,S.TotalSales From CteSales As S
--Join CteProducts As P
--On S.ProductKey = P.ProductKey


------------ Recursion ----------------------

--With CteNums(n)
--As
--(
-- Select 1 As Nums
-- Union All
-- Select n + 1 From CteNums
-- Where n < 10
--)
--Select * From CteNums

With CteNums(n)
As
(
 Select 1 As Nums
 Union All
 Select n + 1 From CteNums
 --Where n < 10      ---- Condition to stop recurs
)
Select * From CteNums
Option(MaxRecursion 2)              --- Query Hints