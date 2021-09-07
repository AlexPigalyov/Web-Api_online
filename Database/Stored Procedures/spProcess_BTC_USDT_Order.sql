USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spProcess_BTC_USDT_Order]    Script Date: 06.09.2021 16:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spProcess_BTC_USDT_Order]
@createUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@openOrderId bigint,
@createDate datetime,
@updatedOrderAmount decimal(38,20) OUTPUT
AS
BEGIN

SELECT TOP 1 *
INTO   #selectedOrder
FROM   BTC_USDT_OpenOrders
WHERE  IsBuy != @isBuy AND 
	   (( IsBuy = 1 AND @price >= Price ) OR 
	   ( IsBuy = 0 AND @price <= Price ))
ORDER  BY Price,
          CreateDate

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

IF NOT EXISTS(SELECT * FROM #selectedOrder)
BEGIN	
	SELECT 0
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amount = @amount - @selectOrderAmount;

	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO BTC_USDT_ClosedOrders (	
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
				(SELECT Price FROM #selectedOrder),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	IF ((SELECT IsBuy FROM #selectedOrder) = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'USDT' 
	END
 
	UPDATE [BTC_USDT_OpenOrders]
	SET    IsBuy = @isBuy,
		   Price = @price,
		   Amount = @amount,
		   CreateUserId = @createUserId
	WHERE  OpenOrderId = @openOrderId 	
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	SET @selectOrderAmount = @selectOrderAmount - @amount;

	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = @openOrderId
	
	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
				@total,
				@createDate,
				getdate(),
				@isBuy,
				@price,
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	IF (@isBuy = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'USDT' 
	END
	
	UPDATE [BTC_USDT_OpenOrders]
	SET    IsBuy = (SELECT IsBuy FROM #selectedOrder),
		   Price = (SELECT Price FROM #selectedOrder),
		   Amount = @selectOrderAmount,
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  OpenOrderId = (SELECT OpenOrderId FROM #selectedOrder)

	SET @amount = 0;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
				(SELECT Price FROM #selectedOrder),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)

	IF ((SELECT IsBuy FROM #selectedOrder) = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'USDT' 
	END
	
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = @openOrderId
	
	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
				@total,
				@createDate,
				getdate(),
				@isBuy,
				@price,
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	IF (@isBuy = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'USDT' 
	END

	SET @amount = 0;
END
DROP TABLE #selectedOrder

SET @updatedOrderAmount = @amount;

SELECT @updatedOrderAmount

END