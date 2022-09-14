CREATE PROCEDURE [dbo].[Get_OpenOrders_ByUserId]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy, 'BTCUSDT' as Pair FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'BTCUSDT' as Pair FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'DASHUSDT' as Pair FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'DASHUSDT' as Pair FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'DOGEUSDT' as Pair FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'DOGEUSDT' as Pair FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'ETHUSDT' as Pair FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'ETHUSDT' as Pair FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'LTCUSDT' as Pair FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'LTCUSDT' as Pair FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

ORDER BY CreateDate DESC

END