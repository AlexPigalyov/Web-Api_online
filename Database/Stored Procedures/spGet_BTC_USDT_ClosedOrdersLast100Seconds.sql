ALTER PROCEDURE [dbo].[spGet_BTC_USDT_ClosedOrdersLast100Seconds]
AS
BEGIN

SELECT *
INTO #closedOrdersByLastMinute 
FROM BTC_USDT_ClosedOrders 
WHERE DATEADD(minute, -1, GETDATE()) < ClosedDate < GETDATE()

SELECT SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute as MaxPrice,
	   SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute as MinPrice

END
