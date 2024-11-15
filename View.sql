------------------------ Views --------------------
/*

In T-SQL, a view is a virtual table that represents the result of a pre-defined query. It does not store data
itself but fetches data from the underlying tables when queried, providing a simplified or secure interface to
complex or sensitive data.

Note: These are objects that will hold our Query in the server. And provide Extra security to your table.

Syntax :
	CREATE VIEW view_name AS
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

Advantages of Views:-
	* Simplifies complex queries.
	* Enhances security by limiting access to specific data.
	* Provides a consistent interface to underlying tables.
Limitations:-
	* Cannot include ORDER BY unless used with TOP.
	* Complex views may have performance overhead if not indexed.
*/

--- Creating a View

Create View PivotView As
Select City,IT,Sales From
(Select
	City,Department,Salary
From EMPLOYEES ) As S
PIVOT(
	Sum(Salary)
	For Department IN(IT,Sales)
) As PivotTable

Select * From PivotView



-- Dropping a View
Drop View PivotView

---- Altering View
/*
Alter View PivotView
Use your Query here
*/