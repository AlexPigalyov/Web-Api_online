ALTER PROCEDURE [dbo].[GetLastCandleStick]
@pairName nvarchar(450)
AS
BEGIN

Declare @SQL nvarchar(100)

SET @SQL = 'SELECT TOP 1 * FROM [Exchange].[dbo].[' + @pairName + '_CandleStick] ORDER BY Id DESC'

EXEC(@SQL)
	
END