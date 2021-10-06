ALTER PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrder] (ClosedOrderId, Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@closedOrderId, @total, @createDate, getdate(), @isBuy, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
