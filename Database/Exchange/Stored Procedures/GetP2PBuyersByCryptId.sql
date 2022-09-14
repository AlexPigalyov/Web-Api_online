ALTER PROCEDURE [dbo].[GetP2PBuyersByCryptId]
@page int,
@cryptId int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PBuyers] 
WHERE 
P2PCryptId = @cryptId
ORDER BY Id
OFFSET 10 * (@page - 1) ROWS
FETCH  NEXT 10 ROWS ONLY
END
