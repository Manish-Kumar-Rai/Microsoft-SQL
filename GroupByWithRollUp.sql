----------------- Group By With Roll Up ----------------

/*
The GROUP BY WITH ROLLUP clause in SQL is used to create subtotals and grand totals in the result set,
making it easier to analyze data hierarchically. It is particularly useful in generating summary reports,
as it computes aggregations at multiple levels of grouping.
*/

Select 
	Year(OrderDate) As OrderYear,
	Sum(SalesAmount) As TotalAmount
From dbo.FactInternetSales
Group By Year(OrderDate)

Select 
	Year(OrderDate) As OrderYear,
	Sum(SalesAmount) As TotalAmount
From dbo.FactInternetSales
Group By RollUp(Year(OrderDate))

Select 
	Year(OrderDate) As OrderYear,
	MONTH(OrderDate) As Month_Number,
	Sum(SalesAmount) As TotalAmount
From dbo.FactInternetSales
Group By Year(OrderDate),MONTH(OrderDate)

Select 
	Year(OrderDate) As OrderYear,
	MONTH(OrderDate) As Month_Number,
	Sum(SalesAmount) As TotalAmount
From dbo.FactInternetSales
Group By ROLLUP(Year(OrderDate),MONTH(OrderDate))


-- Naming GrandTotal ----------
-- 1. Scenario
Select 
	IsNUll(Format(OrderDate,'yyyy'),'Grand Total') As OrderYear,
	Sum(SalesAmount) As TotalAmount
From dbo.FactInternetSales
Group By ROLLUP(Format(OrderDate,'yyyy'))

-- 2.Scenario
Select 
	IsNUll(Format(OrderDate,'yyyy'),'Grand Total') As OrderYear,
	IsNull(Format(OrderDate,'MM'),Format(OrderDate,'yyyy') + '-Total') As Month_Number,
	Sum(SalesAmount) As TotalAmount
From dbo.FactInternetSales
Group By ROLLUP(Format(OrderDate,'yyyy'),Format(OrderDate,'MM'))