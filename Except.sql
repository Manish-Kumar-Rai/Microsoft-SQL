---------- Except -----------------------

/*
EXCEPT : Gives record which are present on first table(given priority) but not on second table,(like anti join)

Prerequisite : 
	1. All tables have same no. of columns.If it not, pass NULL as (Column Name) to table that lack.
	2. If columns are not in sequence, rearrange it.
	3. Columns name need to be the same, But their data type have to MATCHED.
*/

Select * From tblemps1
Except
Select * From tblemps2


Delete From tblemps2 where EmployeeId = 10
