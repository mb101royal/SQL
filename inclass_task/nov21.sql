--CREATE DATABASE Nov21Task

CREATE FUNCTION FormatPhoneNumber(@PhoneNumber VARCHAR(13))
RETURNS VARCHAR(13)
BEGIN
	DECLARE @Result AS VARCHAR(13);
	SELECT
	@Result = CASE
		WHEN LEN(@PhoneNumber) = 10 THEN
			SUBSTRING(@PhoneNumber, 1, 3) + '-' + 
			SUBSTRING(@PhoneNumber, 4, 3) + '-' + 
			SUBSTRING(@PhoneNumber, 7, 2) + '-' + 
			SUBSTRING(@PhoneNumber, 9, 2)
		WHEN LEN(@PhoneNumber) = 13 THEN
		   SUBSTRING(@PhoneNumber, 1, 3) + '-' + 
           SUBSTRING(@PhoneNumber, 4, 3) + '-' + 
           SUBSTRING(@PhoneNumber, 7, 3) + '-' +
		   SUBSTRING(@PhoneNumber, 10, 3)
		ELSE 'Wrong Phone Number'
	END;
	RETURN @Result
END

--SELECT dbo.FormatPhoneNumber (2556636222)