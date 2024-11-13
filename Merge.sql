-------------------- MERGE --------------------

/*
In T-SQL, the MERGE statement is used to perform INSERT, UPDATE, or DELETE operations in a single statement,
based on a comparison between a target table and a source table. It’s particularly useful for handling data
synchronization or "upserts" (inserts or updates).
*/

Set IDENTITY_INSERT EMPLOYEES ON
Set IDENTITY_INSERT EMPLOYEES OFF

Select * From EMPLOYEES

Select * From EMPLOYEES_STAGE

Select * Into EMPLOYEES_STAGE From EMPLOYEES

Delete From EMPLOYEES
Where EmployeeId > 6

Update EMPLOYEES_STAGE Set Salary = 34000
Where EmployeeId = 9

Update EMPLOYEES_STAGE Set Salary = 25000
Where EmployeeId = 6

Update EMPLOYEES_STAGE Set City = 'NYC'
Where EmployeeId = 5

Merge EMPLOYEES As T
	USING EMPLOYEES_STAGE As S
	ON T.EmployeeId = S.EmployeeId

When NOT MATCHED THEN
	INSERT(EmployeeId,EmpName,City,Department,Salary) VALUES
	(S.EmployeeId,S.EmpName,S.City,S.Department,S.Salary)

When MATCHED THEN
	UPDATE SET T.City = S.City, T.Department = S.Department, T.Salary = S.Salary

When NOT MATCHED BY SOURCE THEN
	DELETE;