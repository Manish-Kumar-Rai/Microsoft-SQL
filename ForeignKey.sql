------------ Foriegn Key Constraint ---------

/*
Defination : A foreign key is a column or set of columns in a database table that creates a link between data
			 in two tables. It enforces a relationship between the foreign key column(s) in one table and the
			 primary key column(s) in another table. This ensures referential integrity, meaning that a value
			 in the foreign key column must match an existing value in the referenced table or be null, which
			 helps maintain consistent and valid data across tables.

Orphan Record : In T-SQL (Transact-SQL), an orphan record refers to a record in a child table that has a 
				foreign key reference to a non-existent record in the parent table. This happens when the 
				referenced parent record is deleted or doesn't exist, but the foreign key constraint in the 
				child table isn't enforced or was temporarily disabled. 
*/

--Select
--	*
--From SalesTrn As S
--Left Join Products As P
--On S.ProductId = P.ProductId

---- Dimension/Master Table ---------
CREATE TABLE Products2(
	ProductId int primary key,
	ProductName varchar(50),
	UnitPrice money
)

INSERT INTO Products2(ProductId,ProductName,UnitPrice) VALUES
(1,'ABC Logo Cap',300),
(2,'Ball Bearing',500),
(3,'Bell',75.2),
(4,'Trousers',83.8),
(5,'Shirt',200)

----- Fact/Transaction Table ------------
CREATE TABLE SalesTran2(
	ProductId int foreign key references Products2(ProductId),
	InvoiceNum varchar(10),
	Qty int,
	Sales money
)

INSERT INTO SalesTran2(ProductId,InvoiceNum,Qty,Sales) VALUES
(1,'SOB982',10,3000),
(2,'SOB983',5,2500),
(3,'SOB984',5,376),
(1,'SOB985',7,2100),
(2,'SOB986',8,4000),
(4,'SOB987',10,838)

INSERT INTO SalesTran2(ProductId,InvoiceNum,Qty,Sales) VALUES
(6,'SOB988',1,900)

Select * from SalesTran2
Select * From Products2

Select
	*
From SalesTran2 As S
Left Join Products2 As P
On S.ProductId = P.ProductId