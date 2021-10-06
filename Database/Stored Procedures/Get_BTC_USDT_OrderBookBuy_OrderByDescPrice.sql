ALTER PROCEDURE [dbo].[Get_BTC_USDT_OrderBookBuy_OrderByDescPrice]
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
WHERE D1.IsBuy = 1
GROUP BY  D1.Price, D1.IsBuy
ORDER BY  Price DESC

END
