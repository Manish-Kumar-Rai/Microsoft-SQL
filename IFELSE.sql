------ IF ELSE Concept -----------

/*
In T-SQL, the IF statement is used for conditional logic, allowing you to execute certain code blocks based on
whether a specified condition evaluates to TRUE.
*/

Declare @x int
SET @x = 10

SELECT IIF(@x=10,1,0) AS Result

SELECT
	Case
		When @x = 10 Then 1
		When @x <> 10 Then 0
	END As Result

IF @x <> 10
	Select 0 As Result
Else
	Select 1 As Result
	

IF @x <> 20
	BEGIN
		print(1)
		print('Hello')
	END
Else
	Select 1 As Result