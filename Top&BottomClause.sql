------- Top/Bottom Clause-------------

/*

The TOP clause in T-SQL is used to limit the number of rows returned in a query result. This is useful when
you only need a specific number or percentage of rows from a result set, such as retrieving the top 10 highest
scores or the top 5 latest entries.

if Top n, Where n exceeds the record number then all records will be returned.

Note: There is no keyword called BOTTOM.
*/

--- First 10 records.
Select
	Top(10) *
From DimProduct 

Select * From DimProduct

--- Last 10 records
Select
	Top(10) *
From DimProduct
Order BY ProductKey Desc

Select
	*
From (Select
	Top(10) *
From DimProduct
Order BY ProductKey Desc) As P
Order By P.ProductKey

------ Percent Keyword
Select
	Top(10) Percent *
From DimProduct 

------- Exercise
-- Top 10 largest selling products

Select Top(10) ProductKey, Sum(SalesAmount) As TotalSales From FactInternetSales
Group By ProductKey
Order By TotalSales Desc

Select
	Top(10) S.ProductKey,P.EnglishProductName,Sum(S.SalesAmount) As TotalSales
From DimProduct As P
Join FactInternetSales As S
On S.ProductKey = P.ProductKey
Group By S.ProductKey,P.EnglishProductName
Order By TotalSales Desc


