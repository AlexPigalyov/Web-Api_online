USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_SortedOrderBook]    Script Date: 06.08.2021 23:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate Desc

END