SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetP2PSellersByCryptId]
@page int,
@cryptId bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PSellers] 
WHERE 
CryptId = @cryptId
ORDER BY Id
OFFSET 10 * (@page - 1) ROWS
FETCH  NEXT 10 ROWS ONLY
END
