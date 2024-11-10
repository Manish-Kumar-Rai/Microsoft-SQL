--------------  Having Clause ----------------

/*
In T-SQL, the HAVING clause is used to filter records after aggregation with GROUP BY. While the WHERE clause
filters rows before aggregation, HAVING filters based on aggregate functions, such as SUM, COUNT, AVG, MAX, and 
MIN.
*/

Select ProductKey,Sum(SalesAmount) As TotalSales From FactInternetSales
Group By ProductKey
Having Sum(SalesAmount) > 10000
Order By Sum(SalesAmount)