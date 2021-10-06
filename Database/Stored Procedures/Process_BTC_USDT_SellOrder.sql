ALTER PROCEDURE [dbo].[Process_BTC_USDT_SellOrder]
@createUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@openOrderId bigint,
@createDate datetime
AS
BEGIN
SET NOCOUNT ON;

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE  IsBuy = 1 AND @price <= Price 
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 


DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	SELECT 0;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			
 
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
	SET    IsBuy = @isBuy,
		   Price = @price,
		   Amount = @amountLocal,
		   CreateUserId = @createUserId
	WHERE  OpenOrderId = @openOrderId 	
	
	SELECT @amountLocal
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = @openOrderId
	
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
				@total,
				@createDate,
				getdate(),
				@isBuy,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
	SET    IsBuy = (SELECT IsBuy FROM #selectedOrder),
		   Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  OpenOrderId = (SELECT OpenOrderId FROM #selectedOrder)
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 
		
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = @openOrderId

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
				@total,
				@createDate,
				getdate(),
				@isBuy,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
END
DROP TABLE #selectedOrder
SET NOCOUNT OFF;

SELECT @amountLocal
END