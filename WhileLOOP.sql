--------------- WHILE LOOP--------------

Declare @x int = 0

While @x < 10
	Begin
		SET @x = @x + 1
		print(@x)
	End

-----------------------

Declare @x int = 0

While @x < 10
	Begin
		SET @x = @x + 1
		IF @x <=5
			print(@x)
		ELSE
			print('Still Running')
	End


--------------
Declare @x int = 0

While @x < 10
	Begin
		SET @x = @x + 1
		IF @x <=5
			print(@x)
		ELSE
			break
	End