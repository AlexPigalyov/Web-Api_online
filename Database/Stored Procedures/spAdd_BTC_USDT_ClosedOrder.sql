USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_Order]    Script Date: 10.08.2021 19:31:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spAdd_BTC_USDT_ClosedOrder]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@createDate datetime,
@new_identity    BIGINT    OUTPUT
AS
BEGIN

insert into BTC_USDT_ClosedOrders (CreateDate, IsBuy, Price, Amount, CreateUserId, BoughtUserId)
values (@createDate, @isBuy, @price, @amount, @createUserId, @boughtUserId)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity

END
