ALTER PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@openOrderId bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
SET    IsBuy = @isBuy,
       Price = @price,
       Amount = @amount,
       CreateUserId = @userid
WHERE  OpenOrderId = @openOrderId 

END
