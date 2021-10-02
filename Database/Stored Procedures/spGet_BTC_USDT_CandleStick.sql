ALTER PROCEDURE [dbo].[spGet_BTC_USDT_CandleStick]
AS
BEGIN

SELECT * FROM [BTC_USDT_CandleStick] 
WHERE CloseTime < GETDATE() AND CloseTime > (GETDATE() - 30)

END
