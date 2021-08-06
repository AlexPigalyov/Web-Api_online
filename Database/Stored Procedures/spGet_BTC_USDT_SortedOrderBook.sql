CREATE PROCEDURE [dbo].[spGet_BTC_USDT_SortedOrderBook]
AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price,
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
GROUP BY  D1.Price
ORDER BY  Price

END
