---------------  SCHEMA ----------------------
/*
In T-SQL (Transact-SQL), a schema is a namespace within a database that holds objects such as tables, views,
stored procedures, functions, and more. Schemas are used to organize and manage database objects, enabling
better control over permissions and making it easier to structure your database logically.

Note: dbo(database owner) is default schema.

Always Prefix the SCHEMA Name.
*/

-- Syntax for creating an schema
--Create Schema SALES

Create Table SALES.SalesTrn(
	OrderId Int,
	OrderDate Datetime,
	Qty Int
)

Select * From SALES.SalesTrn

-- Dropping a Schema, but before you to table or move it to other location.
-- Drop SCHEMA SALES