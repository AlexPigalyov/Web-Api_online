USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[Process_BTC_USDT_BuyOrder]    Script Date: 12.10.2021 23:56:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Process_BTC_USDT_BuyOrder]
@createUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder_Buy]
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@total,
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
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@total,
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
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id
END

END