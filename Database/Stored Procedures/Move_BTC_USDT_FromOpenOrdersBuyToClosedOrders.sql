ALTER PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 1, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
