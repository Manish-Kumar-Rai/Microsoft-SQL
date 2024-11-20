----- Variables -----------------------

/*

In T-SQL (Transact-SQL), variables are used to store data that can be used throughout a batch of SQL statements.
Variables can hold scalar values, table data, or be used in control-flow logic.

Syntax:
	DECLARE @VariableName DataType;
	SET @VariableName = Value;
	-- OR
	SELECT @VariableName = Value;

*/

--- Declare a Variable ------
DECLARE @x Int

--- Set the value os a variable
SET @x = 100

--- Fetching the value of the variable
Select @x

--------- Introduce Multiple Variables
-- One way
DECLARE @x Int
DECLARE @y Varchar(10)

SET @x = 100
SET @y = 'HELLO'

SELECT @x
SELECT @y

-- Other Way
DECLARE @x Int, @y Varchar(10)

--SET @x = 100, @y = 'HELLO' ---- Throw error
SELECT @x = 100, @y = 'HELLO'

SELECT @x, @y

--- Note : SET can assign one value at a time, But SELECT can assign multiple value together


----- Variables store latest value

DECLARE @x int

SET @x = 100

SET @x = 200

SELECT @x

---- Assigning default value

DECLARE @x int = 10  --default value

SELECT @x

SET @x = 100

SELECT @x
