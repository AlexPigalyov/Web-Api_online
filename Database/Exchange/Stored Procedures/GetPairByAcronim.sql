ALTER PROCEDURE [dbo].[GetPairByAcronim]
@acronim nvarchar(450)
AS
BEGIN

Select * From Pairs 
Where Acronim = @acronim
	
END






