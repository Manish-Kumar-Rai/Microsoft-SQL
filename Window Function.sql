----------- Window Function --------

/*

In T-SQL, window functions are functions that perform calculations across a set of table rows that are somehow
related to the current row. Unlike aggregate functions (like SUM, COUNT, etc.), window functions do not group
the result into a single output row. Instead, they provide a "window" of rows around each row, allowing
calculations across this window, while still returning a row for each input row.

Syntax:
	SELECT column1, column2, 
       window_function() OVER ([PARTITION BY partition_column] ORDER BY order_column)
	FROM table;
*/

DROP TABLE EMPLOYEES


CREATE TABLE EMPLOYEES(
	EmployeeId int primary key identity(1,1),
	EmpName varchar(100),
	City varchar(30),
	Department varchar(50),
	Salary money
)

INSERT INTO EMPLOYEES(EmpName,City,Department,Salary)
VALUES
('John','NYC','IT',40000),
('Amanda','London','Sales',40000),
('Aman','Pune','IT',30000),
('Rahul','Pune','IT',26000),
('Sam','London','Sales',30000),
('Rakesh','Delhi','IT',20000),
('Suraj','Pune','Sales',12000),
('Ajay','Delhi','Sales',10000),
('Ankita','Delhi','Sales',10000),
('Sudeep','Delhi','IT',36000),
('Sanket','Pune','IT',40000)


----- ROW_NUMBER() -------
Select 
	EmpName,
	City,
	Department,
	Salary,
	Row_Number() OVER(Partition BY Department Order By EmpName) AS RowNum
From Employees

------ RANK() & DENSE_RANK()------

Select
	EmpName,
	City,
	Department,
	Salary,
	RANK() Over(Partition By City Order By Salary Desc) As SalaryRank
From Employees

Select
	EmpName,
	City,
	Department,
	Salary,
	DENSE_RANK() Over(Order By Salary Desc) As SalaryRank
From Employees

------ LAG() & LEAD()-------
/*
In T-SQL, the LAG and LEAD functions are window functions that allow you to access data from a previous or 
subsequent row within the same result set, without the need for a self-join. These functions are especially 
useful for comparisons between rows.
*/

CREATE TABLE Orders(
	ProductId int NULL,
	InvoiceNum varchar(10) NULL,
	OrderDate date NULL,
	City varchar(20) NULL,
	Qty int NULL
) 

INSERT INTO Orders (ProductId, InvoiceNum, OrderDate, City, Qty) VALUES 
(1, 'SOB982', '2022-01-02' , 'Delhi', 3000),
(2, 'SOB983', '2022-01-02' , 'NYC', 2500),
(3, 'SOB984', '2022-01-02' , 'London', 376),
(1, 'SOB985', '2022-01-03' , 'London', 2100),
(2, 'SOB986', '2022-01-03' , 'NYC', 4000),
(4, 'SOB987', '2022-01-03' , 'Delhi', 838),
(1, 'SOB988', '2022-01-04' , 'London', 2100),
(2, 'SOB989', '2022-01-04' , 'NYC', 4000),
(4, 'SOB990', '2022-01-04' , 'Delhi', 838)

-- LAG()
Select 
	ProductId,
	InvoiceNum,
	OrderDate,
	City,
	Qty,
	LAG(Qty,1,0) Over(Partition By City Order By OrderDate) As PreviousQty
From Orders

-- LEAD()
Select 
	ProductId,
	InvoiceNum,
	OrderDate,
	City,
	Qty,
	LEAD(Qty,1,0) Over(Partition By City Order By OrderDate) As TomorrowQty
From Orders

------ FIRST_VALUE & LAST_VALUE ------
/*
In T-SQL, FIRST_VALUE and LAST_VALUE are window functions that retrieve the first or last value within a 
specified window or partition of rows. These functions are useful when you need to access the beginning or
end of a sequence of data within each partition.
*/

-- FIRST_VALUE()
Select 
	ProductId,
	InvoiceNum,
	OrderDate,
	City,
	Qty,
	FIRST_VALUE(Qty) Over(Partition By City Order By OrderDate) as FirstDate  
From Orders

-- LAST_VALUE()
Select 
	ProductId,
	InvoiceNum,
	OrderDate,
	City,
	Qty,
	LAST_VALUE(Qty) Over(Order By OrderDate) as LastDate  
From Orders

-- trick to get last value

Select 
	ProductId,
	InvoiceNum,
	OrderDate,
	City,
	Qty,
	LAST_VALUE(Qty) Over(Order By (Select 0)) as LastDate  
From Orders