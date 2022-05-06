CREATE PROCEDURE [dbo].[MoveFromOpenToClosedOrders]
@pair nvarchar(20),
@buyOrSell nvarchar(4),
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

declare @Sql nvarchar(max);

set @sql = 'delete from [Exchange].[dbo].[' + @pair + '_OpenOrders_' + @buyOrSell + '] WHERE OpenOrderId = ' + @closedOrderId

exec sp_executesql @sql

set @sql = 'insert into [Exchange].[dbo].[' + @pair + '_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (' + @total + ', ' + @createDate + ', ' + getdate() + ', 1, ' + @price + ', ' + @price + ', ' + @amount + ',0, ' + @createUserId + ', ' + @boughtUserId + ', ' + @status + ')'

exec sp_executesql @sql

END