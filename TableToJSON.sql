------ Converting Table to JSON (JavaScript Object Notation)-------

CREATE TABLE EmployeesNew(
	EmpId int primary key identity(1,1),
	EmpName varchar(100),	
	City varchar(30),
	Salary money,
	DOJ datetime
)



INSERT INTO EmployeesNew(EmpName,CITY,Salary,DOJ) VALUES
('SAM','NYC',45000,NULL),
('AMAN','DELHI',30000,'2022-01-04'),
('JAY','CHENNAI',40000,'2023-05-12'),
('AMANDA','SYDNEY',60000,NULL)

Select * From EmployeesNew
For JSON PATH

Select * From EmployeesNew
For Json Path, ROOT('Employees')

-- Include NULL Values

Select * From EmployeesNew
For JSON Path,Root('Employees'), INCLUDE_NULL_VALUES

--- without array

Select EmpId,EmpName,DOJ,Salary From EmployeesNew
For json path,without_array_wrapper

--- we can use AUTO instead of PATH

Select * From EmployeesNew
For JSON AUTO

--- Hardcore writing required Path not AUTO

Select 1 As EmpId, 'Manish' As EmpName
For Json Path                         --- auto give an error

