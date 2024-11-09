------------ Intersect -----------------

/*
INTERSECT: Give the matching records from multiple tables. (Same as inner join)
Difference b/w Intersect & Join :
	1. Intersect has less code as compare to join
	2. Intersect compared all columns, whereas join compared specified column.

Prerequisite :  Same as Union
	1. All tables have same no. of columns.If it not, pass NULL as (Column Name) to table that lack.
	2. If columns are not in sequence, rearrange it.
	3. Columns name need to be the same, But their data type have to MATCHED.
*/
Select * From tblemps1
Intersect
Select * From tblemps2