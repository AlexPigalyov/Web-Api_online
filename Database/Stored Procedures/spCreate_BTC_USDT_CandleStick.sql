ALTER PROCEDURE [dbo].[spCreate_BTC_USDT_CandleStick]
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

insert into BTC_USDT_CandleStick (BaseVolume, [Close], CloseTime, Final, High, Low, [Open], OpenTime)
values (@baseVolume, @close, @closeTime, @final, @high, @low, @open, @openTime)

END
