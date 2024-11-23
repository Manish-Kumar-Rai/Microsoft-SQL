-------------------------- Output Clause --------------

Select * From Products

--Drop Table Products
Truncate table Products

--CREATE TABLE Products(
--	ProductKey int primary key,
--	ProductName varchar(100),
--	StockLevel int,
--	Price money
--)

INSERT INTO Products(ProductKey,ProductName,StockLevel,Price)
OUTPUT INSERTED.*				--- OUTPUT clause
VALUES
(1,'Adjustable Race',1000,100.50),
(2,'Bearing Ball',800,90.85),
(3,'BB Ball Bearing',1250,120.45),
(4,'Headset Ball Bearings',500,75.10)

Delete From Products
OUTPUT deleted.*					--- OUTPUT clause
Where ProductKey >= 3

--- Creating Table value variable for storing deleted record

Declare @tblproducts TABLE(
	ProductKey int NOT NULL,
	ProductName varchar(100),
	StockLevel int,
	Price money
)

Delete From Products
OUTPUT deleted.* Into @tblproducts
Where ProductKey >= 3

Select * From @tblproducts

Update Products
Set Price = 90
OUTPUT inserted.ProductKey,deleted.Price,inserted.Price
Where ProductKey = 1

INSERT INTO Products(ProductKey,ProductName,StockLevel,Price)VALUES
(1,'Adjustable Race',1000,100.50),
(2,'Bearing Ball',800,90.85),
(3,'BB Ball Bearing',1250,120.45)

CREATE TABLE Products_Stage(
	ProductKey int primary key,
	ProductName varchar(100),
	StockLevel int,
	Price money
)

INSERT INTO Products_Stage(ProductKey,ProductName,StockLevel,Price)VALUES
(1,'Adjustable Race',1200,100.50),
(2,'Bearing Ball',1200,95.85),
(11,'Crown Race',400,100.25),
(12,'Chain Stays',600,30.45)

Select * From Products
Select * From Products_Stage

Merge Into Products As T
	Using Products_Stage as S
	On T.ProductKey = S.ProductKey

When NOT Matched Then
	Insert(ProductKey,ProductName,StockLevel,Price)
	Values(S.ProductKey,S.ProductName,S.StockLevel,S.Price)

When Matched Then
	Update Set T.StockLevel = S.StockLevel,
			   T.Price = S.Price

When Not Matched By Source Then
	Delete

	Output S.ProductKey,S.ProductName,S.StockLevel,S.Price, $Action As Operations;

	--https://learn.microsoft.com/en-us/sql/t-sql/queries/output-clause-transact-sql?view=sql-server-ver16