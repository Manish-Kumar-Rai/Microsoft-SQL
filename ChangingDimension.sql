---------------- Changing Dimension -------------------

/*
SCD (Slowly Changing Dimensions) in T-SQL refers to a method used in data warehousing to manage historical 
changes in dimension data. It tracks how attribute values change over time, ensuring both current and historical
data are preserved. There are three common types of SCD implementations:

1. SCD Type 1: Overwrite the Data
2. SCD Type 2: Maintain Historical Data
3. SCD Type 3: Track Limited History
*/

--CREATE TABLE Products(
--	ProductKey int primary key,
--	ProductName varchar(100),
--	StockLevel int,
--	Price money
--)

Select * From Products

Truncate table Products

INSERT INTO Products(ProductKey,ProductName,StockLevel,Price)
Output inserted.*
VALUES
(1,'Adjustable Race',1000,100.50),
(2,'Bearing Ball',800,90.85),
(3,'BB Ball Bearing',1250,120.45),
(4,'Headset Ball Bearings',500,75.10),
(5,'Blade',1500,10.25),
(6,'LL Crankarm',200,2000.45),
(7,'ML Crankarm',200,1980.50),
(8,'HL Crankarm',200,1976.45),
(9,'Chainring Bolts',2000,10.25),
(10,'Chainring Nut',2000,3.45)

--CREATE TABLE Products_Stage(
--	ProductKey int primary key,
--	ProductName varchar(100),
--	StockLevel int,
--	Price money
--)

Truncate Table Products_Stage

Select * From Products_Stage

INSERT INTO Products_Stage(ProductKey,ProductName,StockLevel,Price)
Output inserted.*
VALUES
(1,'Adjustable Race',1200,100.50),
(2,'Bearing Ball',1200,95.85),
(11,'Crown Race',400,100.25),
(12,'Chain Stays',600,30.45)

SELECT * FROM Products
SELECT * FROM Products_Stage

--SCD 1 : Overwrite

Merge Into Products As T
	Using Products_Stage As S
	On T.ProductKey = S.ProductKey

When Not Matched Then
	Insert(ProductKey,ProductName,StockLevel,Price)
	Values(S.ProductKey,S.ProductName,S.StockLevel,S.Price)

When Matched Then
	Update Set T.StockLevel = S.StockLevel,
			   T.Price = S.Price;

--2. SCD Type 2: Maintain Historical Data (by adding a row)

--Drop Table IF EXISTS Products

--CREATE TABLE Products(
--	ProductKey int,
--	ProductName varchar(100),
--	StockLevel int,
--	Price money,
--	StartDate datetime,
--	EndDate datetime,
--	IsActive bit
--)

INSERT INTO Products(ProductKey,ProductName,StockLevel,Price,StartDate,EndDate,IsActive)VALUES
(1,'Adjustable Race',1000,100.50,'2020-04-03',null,1),
(2,'Bearing Ball',800,90.85,'2021-01-02',null,1),
(3,'BB Ball Bearing',1250,120.45,'2022-07-02',null,1),
(4,'Headset Ball Bearings',500,75.10,'2023-09-02',null,1)

Truncate Table Products_Stage

INSERT INTO Products_Stage(ProductKey,ProductName,StockLevel,Price)VALUES
(1,'Adjustable Race',1200,100.50),
(5,'Crown Race',400,100.25),
(6,'Chain Stays',600,30.45)

SELECT * FROM Products
SELECT * FROM Products_Stage

INSERT INTO Products_Stage(ProductKey,ProductName,StockLevel,Price)VALUES
(1,'Adjustable Race',1500,120.50)

--SCD Type 2 : Implementation

INSERT INTO Products
	SELECT ProductKey,ProductName,StockLevel,Price,StartDate,EndDate,IsActive
FROM(
MERGE INTO Products T
	USING Products_Stage S
	ON T.ProductKey = S.ProductKey

WHEN NOT MATCHED THEN
	INSERT(ProductKey,ProductName,StockLevel,Price,StartDate,EndDate,IsActive)
	VALUES(S.ProductKey,S.ProductName,S.StockLevel,S.Price,
			FORMAT(GETDATE(),'yyyy-MM-dd'),NULL,1)
			
WHEN MATCHED AND IsActive = 1 THEN
	UPDATE SET EndDate=FORMAT(DATEADD(DD,-1,GETDATE()),'yyyy-MM-dd'),
				IsActive = 0
				
OUTPUT	S.ProductKey,S.ProductName,S.StockLevel,S.Price,
	FORMAT(GETDATE(),'yyyy-MM-dd') StartDate, null as EndDate,1 as Isactive, 
	$Action as Operation) as MergeOp	
	
	WHERE MergeOp.Operation = 'UPDATE';


--3. SCD Type 3: Track Limited History (By Adding a Column)