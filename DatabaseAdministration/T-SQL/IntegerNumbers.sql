-- Initialise a variable, give it a data type and an initial value
DECLARE @myvar as smallint = 2000
-- Multiply that variable by 10
SET @myvar = @myvar * 10
-- Retrieve that variable
SELECT @myvar AS myVariable
