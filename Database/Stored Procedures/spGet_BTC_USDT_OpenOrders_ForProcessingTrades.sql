ALTER PROCEDURE [dbo].[spGet_BTC_USDT_OpenOrders_ForProcessingTrades]
@isBuy bit,
@price decimal(38,20)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE IsBuy != @isBuy &&
 CASE @isBuy WHEN 1 THEN @price >= Price
 ELSE @price <= Price 

END
