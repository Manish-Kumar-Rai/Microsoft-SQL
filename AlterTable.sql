----------- Alter Table ---------------------

/*
In T-SQL, the ALTER TABLE statement is used to modify an existing table's structure, such as adding, deleting,
or altering columns, changing data types, and adding or dropping constraints.

Note: We need ALTER TABLE Permission.
*/


Select * From EMPLOYEES

-- Adding a Column
Alter Table EMPLOYEES
Add Email Varchar(100)

-- Adding more than one column
Alter Table EMPLOYEES
Add Phone Varchar(20), DOJ Date

------- For Column -------
-- Dropping a Column
Alter Table EMPLOYEES
Drop Column Email

-- Dropping more then one columns
Alter Table EMPLOYEES
Drop Column Phone, DOJ

-- Changing the data type of a Column
Alter Table EMPLOYEES
Alter Column EmpName Varchar(205)


----- For Constraints--------------

Create Table EmpNew(
	EmpId Int,
	EmpName Varchar(100)
)

----- Adding Not Null Constrain-----
Alter Table EmpNew
Alter Column EmpId Int Not Null

----- Adding Primary Key Constrain----
/*
We are able to add primary key constraint only if the column is not null and no duplicates.
*/
Alter Table EmpNew
Add Constraint PK_EmpId Primary Key(EmpId)

---- Adding Foreign Key Constraint-----

Create Table Salaries(
	EmpId Int,
	Salary money
)

Alter Table Salaries
Add Constraint Fk_EmpId Foreign Key(EmpId) References EmpNew(EmpId) 

--- Dropping Constraints --

/*
Note: Drop Foreign Key first, then Primary Key.
*/

Alter Table Salaries
Drop FK_EmpId

Alter Table EmpNew
Drop Pk_EmpId