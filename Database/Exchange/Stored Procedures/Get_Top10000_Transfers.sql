ALTER PROCEDURE [dbo].[Get_Top10000_Transfers]

AS
BEGIN

SELECT TOP(10000) * FROM [Exchange].[dbo].[Transfers]
	
END