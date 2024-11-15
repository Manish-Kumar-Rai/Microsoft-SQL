---------------- Group By with CUBE -----------------

/*
The GROUP BY WITH CUBE clause in SQL is used to generate a result set that includes all possible combinations
of groupings for the specified columns, as well as subtotals and grand totals. It is particularly useful for
multidimensional data analysis and reporting.
*/

Select
	Year(OrderDate) As OrderYear,
	Sum(SalesAmount) As TotalAmount
From FactInternetSales
Group By CUBE(Year(OrderDate))

Select
	Year(OrderDate) As OrderYear,
	Format(OrderDate,'MM') As Month_Number,
	Sum(SalesAmount) As TotalAmount
From FactInternetSales
Group By CUBE(Year(OrderDate),Format(OrderDate,'MM'))


/*
				Difference between ROLLUP and CUBE

The difference between ROLLUP and CUBE lies in their aggregation scope. ROLLUP generates hierarchical subtotals
and a grand total, focusing on progressively summarizing data along a single hierarchy (e.g., by Region and then
Product). In contrast, CUBE calculates subtotals for all possible combinations of the specified columns,
enabling multidimensional analysis. ROLLUP produces fewer rows (n + 1 levels for n columns), while CUBE
generates more rows (2^n combinations), making ROLLUP more efficient for hierarchical data and CUBE better
for comprehensive summaries. Both include a grand total row and are used for reporting and analytics.
*/