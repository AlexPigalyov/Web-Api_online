ALTER PROCEDURE [dbo].[Get_BTC_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE OpenOrderId = @openOrderId

END
