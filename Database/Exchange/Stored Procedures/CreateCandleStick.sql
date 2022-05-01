ALTER PROCEDURE [dbo].[CreateCandleStick]
@pairName nvarchar(25),
@close decimal(18,0),
@closeTime datetime,
@high decimal(18,0),
@low decimal(18,0),
@open decimal(18,0),
@openTime datetime
AS
BEGIN

Declare @SQL nvarchar(200)

SET @SQL = 'INSERT INTO [Exchange].[dbo].['+@pairName+'_CandleStick] ([Close], CloseTime, High, Low, [Open], OpenTime)
VALUES ('+@close+', '+@closeTime+', '+@high+', '+@low+', '+@open+', '+@openTime+')'

END
GO