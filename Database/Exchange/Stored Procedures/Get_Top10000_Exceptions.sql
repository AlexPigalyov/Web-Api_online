ALTER PROCEDURE [dbo].[Get_Top10000_Exceptions]

AS
BEGIN

SELECT TOP(10000) * FROM [Exchange].[dbo].[Exceptions]
	
END