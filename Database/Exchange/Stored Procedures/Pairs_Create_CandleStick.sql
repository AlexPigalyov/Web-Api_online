create PROCEDURE [dbo].[Pairs_Create_CandleStick]
@pair nvarchar(20),
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

declare @Sql nvarchar(max);

set @Sql = 'INSERT INTO [Exchange].[dbo].[' + @pair + '_CandleStick] (BaseVolume, [Close], CloseTime, Final, High, Low, [Open], OpenTime) VALUES (' + @baseVolume + ', ' + @close + ', ''' + @closeTime + ''', ' + @final + ', ' + @high + ', ' + @low + ', ' + @open + ', ''' + @openTime + ''')'
exec sp_executesql @sql 

END
