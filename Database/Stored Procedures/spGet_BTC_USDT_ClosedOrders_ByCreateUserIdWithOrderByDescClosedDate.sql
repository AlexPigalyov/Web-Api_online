USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate Desc

END