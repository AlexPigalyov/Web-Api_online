ALTER PROCEDURE [dbo].[CreateCandleStick]
@pairName nvarchar(25),
@baseVolume decimal(18,0),
@close decimal(18,0),
@closeTime datetime,
@final bit,
@high decimal(18,0),
@low decimal(18,0),
@open decimal(18,0),
@openTime datetime
AS
BEGIN

Declare @SQL nvarchar(200)

SET @SQL = 'INSERT INTO [Exchange].[dbo].['+@pairName+'_CandleStick] (BaseVolume, [Close], CloseTime, Final, High, Low, [Open], OpenTime)
VALUES ('+@baseVolume+', '+@close+', '+@closeTime+', '+@final+', '+@high+', '+@low+', '+@open+', '+@openTime+')'

END