------------ Stored Procedures -----------------------

/*
A stored procedure in T-SQL (Transact-SQL) is a precompiled collection of one or more SQL statements stored on
the database server. They are used to perform a specific task, typically to query or modify data, and can accept
input parameters, return output parameters, and execute complex logic.

Difference b/w Stored Procedures and Views:
	
A stored procedure is a precompiled set of SQL statements used to perform specific tasks like querying or
modifying data, often involving complex logic and parameters. In contrast, a view is a virtual table created
from a SQL query, used to simplify and present data without storing it physically. Stored procedures allow for
data manipulation and procedural logic, while views are limited to data retrieval and act as reusable query
templates. Procedures are executed with EXEC, whereas views are queried like tables with SELECT.
*/

Create Procedure sp_SelectData
As
Select * From DimProduct

Exec sp_SelectData

--Drop Procedure sp_SelectData

--- Giving parameters to our Stored Procedures

Create Proc sp_SelectColorProduct(@color varchar(20))
As
Select * From DimProduct Where Color = @color

Execute sp_SelectColorProduct 'Silver'

--- Giving multiple parameters

Create Procedure sp_ColorPriceProduct(@color varchar(20),@price money)  --- Max parameter 2100
As
Select ProductKey,EnglishProductName,Color,ListPrice From DimProduct
Where Color = @color and ListPrice > @price

Execute sp_ColorPriceProduct 'Red',1000

--- Assigning Default values

Create Proc sp_SelectColorProduct2(@color varchar(20) = 'Red')
As
Select * From DimProduct Where Color = @color

Execute sp_SelectColorProduct2

--- Modifiying Stored Procedure

Alter Procedure sp_SelectColorProduct2(@color varchar(20) = 'White')
As
Select ProductKey,EnglishProductName,Color From DimProduct
Where Color = @color

exec sp_SelectColorProduct2 'Red'