-------- Union & Union All-H  -------------
/*
Union : Combine multiple tables together vertically
Union : add tables and remove dupilcates.
Union All : add tables and keep duplicate records.

Prerequisite : 
	1. All tables have same no. of columns.If it not, pass NULL as (Column Name) to table that lack.
	2. If columns are not in sequence, rearrange it.
	3. Columns name need to be the same, But their data type have to MATCHED.

*/

--CREATE TABLE tblemps1 (
--    EmployeeId INT PRIMARY KEY,
--    ParentEmployeeId INT,
--    EmployeeName VARCHAR(100),
--    Title VARCHAR(50),
--    Salary DECIMAL(10, 2),
--)

--INSERT INTO tblemps1 (EmployeeId, ParentEmployeeId, EmployeeName, Title, Salary) 
--VALUES (1, NULL, 'Alice Johnson', 'CEO', 150000.00),
--(2, 1, 'Bob Smith', 'CTO', 120000.00),
--(3, 1, 'Carol White', 'CFO', 115000.00),
--(4, 2, 'David Brown', 'Lead Engineer', 90000.00),
--(5, 2, 'Eve Black', 'Senior Developer', 85000.00),
--(6, 3, 'Frank Green', 'Finance Manager', 80000.00),
--(7, 3, 'Grace Blue', 'Accountant', 65000.00),
--(8, 4, 'Hank Gray', 'Developer', 60000.00),
--(9, 4, 'Ivy Purple', 'Developer', 60000.00),
--(10, 5, 'Jake Yellow', 'Junior Developer', 50000.00)

--Select
--	*
--From tblemps2

--Select
--	*
--Into tblemps2
--From tblemps1

--Select * From tblemps1
--Union All
--Select * From tblemps2