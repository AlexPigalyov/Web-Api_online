ALTER PROCEDURE [dbo].[Get_BTC_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

SELECT DISTINCT TOP(15) COUNT(D1.Price) AS CountPrices, D1.Price,
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] AS D2
    WHERE D2.Price = D1.Price) AS Amount,
	(SELECT SUM(D3.Price * D3.Amount)
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] AS D3
	WHERE D3.Price = D1.Price) AS Total
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] AS D1
GROUP BY  D1.Price
ORDER BY  Price

END
