USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_SortedOrderBook]    Script Date: 06.08.2021 23:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGet_BTC_USDT_OrderBookSell_OrderByDescPrice]

AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy, 
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount,
	(SELECT SUM(D3.Price * D3.Amount)
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D3
	WHERE D3.Price = D1.Price) AS Total
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
WHERE D1.IsBuy = 0
GROUP BY  D1.Price, D1.IsBuy
ORDER BY  Price desc


END
