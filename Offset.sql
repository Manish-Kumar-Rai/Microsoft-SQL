--------- OffSet Keyword -----

/*
In T-SQL, OFFSET is used with the ORDER BY clause to skip a specified number of rows in the result set,
typically used in pagination scenarios. OFFSET is often combined with FETCH NEXT to limit the number of
rows returned.
*/

Select * From DimProduct
Order By ProductKey
Offset 10 Rows

----- Two Ways to get 11-20 product key records
Select Top(10) *
From (Select * From DimProduct
Order By ProductKey
Offset 10 Rows) As T

Select
	*
From DimProduct
Order By ProductKey
Offset 10 Rows
Fetch Next 10 Rows Only    --- Fetch First 10 Rows Only , is also used.