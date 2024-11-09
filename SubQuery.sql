----------- SubQuery ----------------

Select
	Max(SalesAmount)
From FactInternetSales

--- Part 1 Basic ---------------
Select * From FactInternetSales
Where SalesAmount = (Select Max(SalesAmount) From FactInternetSales)

---- Part 2 IN & NOT IN --------

---- For Red color product
Select * From FactInternetSales
Where ProductKey IN(Select ProductKey From DimProduct where Color = 'Red')
---For non-red color product--
Select * From FactInternetSales
Where ProductKey NOT IN(Select ProductKey From DimProduct where Color = 'Red')

---- another way using join concept----
Select F.* From FactInternetSales As F
Join DimProduct As P
On F.ProductKey = P.ProductKey
where P.Color = 'Red'

------- Part 3 with Update statement-----------

Select * From DimEmps

Select * From DimSalesTerritory

--SubQuery--
Update DimEmps Set BaseRate = BaseRate * 1.1
Where SalesTerritoryKey  IN(Select SalesTerritoryKey From DimSalesTerritory where SalesTerritoryCountry = 'Canada')

-- Using Join----
Update DimEmps Set BaseRate = BaseRate * 1.1
From DimEmps As E Join DimSalesTerritory As T
On E.SalesTerritoryKey = T.SalesTerritoryKey
Where T.SalesTerritoryCountry = 'Canada'

----- Part 4 Derived Table -------
-- Note : Always name the table--
Select AVG(TotalTransactions) From
(Select CustomerKey,Count(*) As TotalTransactions From FactInternetSales
Group By CustomerKey) AS T

---- Part 5 EXISTS, Correlated SubQuery--

/*
A correlated subquery is a subquery that uses values from the outer query in its execution. Unlike a regular 
subquery, which runs independently of the outer query, a correlated subquery is re-evaluated for each row 
processed by the outer query. This means that the subquery depends on the outer query and is executed repeatedly,
once for each row that the outer query considers.
*/

Select * From FactInternetSales
Where ProductKey In(Select ProductKey From DimProduct Where color = 'Red')

Select * From FactInternetSales
Where EXISTS(Select ProductKey From DimProduct Where color = 'Red') -- return True

Select * From FactInternetSales
Where NOT EXISTS(Select ProductKey From DimProduct Where color = 'Red') --return False

Select * From FactInternetSales As F
Where EXISTS(Select ProductKey From DimProduct As P Where F.ProductKey = P.ProductKey And Color = 'Red')

---- Part 6 Get Contribution YearWise ------
-- Using SubQuery For computed Field. Main Drawback is it runs for every record.

Select 
	Year(OrderDate) AS OrderYear,
	Sum(SalesAmount) As TotalSales,
	Format(Sum(SalesAmount) / (Select Sum(SalesAmount) From FactInternetSales),'P') As Contribution
From FactInternetSales
Group By Year(OrderDate)