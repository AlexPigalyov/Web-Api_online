ALTER PROCEDURE [dbo].[Get_BTC_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
UNION
SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId

END
