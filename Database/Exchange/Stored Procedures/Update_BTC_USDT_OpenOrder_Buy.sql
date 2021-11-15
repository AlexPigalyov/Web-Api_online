ALTER PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder_Buy]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@id bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
SET    Price = @price,
       Amount = @amount,
	   Total = @total,
       CreateUserId = @userid
WHERE  Id = @id 

END
