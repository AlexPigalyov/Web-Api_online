ALTER PROCEDURE [dbo].[GetLastOrdersBySeconds]
@pairName nvarchar(20),
@seconds int
AS
BEGIN

Declare @SQL nvarchar(200)

SET @SQL = 'SELECT * 
FROM [Exchange].[dbo].['+ @pairName +'_ClosedOrders]
WHERE DATEADD(second, '+ @seconds +', GETDATE()) < ClosedDate and ClosedDate < GETDATE()'

EXEC(@SQL)

END
