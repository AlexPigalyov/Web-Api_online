ALTER PROCEDURE [dbo].[Create_BTC_USDT_CandleStick]
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

INSERT INTO [Exchange].[dbo].[BTC_USDT_CandleStick] (BaseVolume, [Close], CloseTime, Final, High, Low, [Open], OpenTime)
VALUES (@baseVolume, @close, @closeTime, @final, @high, @low, @open, @openTime)

END
