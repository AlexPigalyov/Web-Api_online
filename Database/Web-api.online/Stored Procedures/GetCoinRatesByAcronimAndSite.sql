Create PROCEDURE [dbo].[GetCoinRatesByAcronimAndSite]
@acronim nvarchar(10),
@site nvarchar(150)
AS
BEGIN

SELECT * 
FROM [web-api.online].[dbo].[CoinsRates] 
WHERE [Acronim] = @acronim 
AND [Site] = @site

END
