ALTER PROCEDURE [dbo].[spProcess_BTC_USDT_CandleStick]
AS
BEGIN

SELECT *
INTO #closedOrdersByLastMinute 
FROM BTC_USDT_ClosedOrders 
WHERE DATEADD(minute, -1, GETDATE()) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedOrderId DESC
SELECT TOP (1) * INTO #firstOrder FROM #closedOrdersByLastMinute ORDER BY ClosedOrderId

INSERT INTO BTC_USDT_CandleStick([Close], CloseTime, High, Low, [Open], OpenTime)
VALUES ((SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #firstOrder),
		(SELECT ClosedDate FROM #firstOrder))
END
