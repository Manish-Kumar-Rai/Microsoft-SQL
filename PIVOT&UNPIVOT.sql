------------------- PIVOT/UNPIVOT ----------------------

--------- PIVOT --------------------

/*
In T-SQL, the PIVOT operator is used to transform rows into columns, allowing for a cross-tabular display of
data. It is particularly useful for summarizing and reorganizing data for reporting.

Syntax:
	SELECT <column_list>
	FROM (<source_query>) AS SourceTable
	PIVOT (
		<aggregate_function>(<column_to_aggregate>)
		FOR <column_to_pivot> IN (<list_of_values>)
	) AS PivotTable;
*/

Select * From (
				Select City,Department,Salary From EMPLOYEES
				) As SourceTable
Pivot(
	Sum(Salary)
	For Department IN(IT,Sales)
) As PivotTable


Select City,IsNull(IT,0) As IT,Sales From (
				Select City,Department,Salary From EMPLOYEES
				) As SourceTable
Pivot(
	Sum(Salary)
	For Department IN(IT,Sales)
) As PivotTable

------ UNPIVOT ------------------

/*
In T-SQL, the UNPIVOT operator is used to transform columns into rows, effectively reversing the process of
PIVOT. This is useful for normalizing data or reorganizing wide tables into a more flexible, vertical format.

Syntax:
	SELECT <column1>, <column2>, <unpivoted_column_name>, <value_column_name>
	FROM <table_name>
	UNPIVOT (
		<value_column_name> FOR <unpivoted_column_name> IN (<list_of_columns>)
	) AS UnpivotTable;

*/

Select City,Department,Salary
From(
	Select City,IT,Sales From (
					Select City,Department,Salary From EMPLOYEES
					) As SourceTable
	Pivot(
		Sum(Salary)
		For Department IN(IT,Sales)
	) As PivotTable
	) As PT
UNPIVOT(
	Salary 
	For Department IN(IT,Sales)
) As UnPivotTable

Select * From PivotData

Select
	City,Department,Salary
From PivotData 
UNPIVOT(
	Salary
	For Department IN(IT,Sales)
) As UnPivotTable