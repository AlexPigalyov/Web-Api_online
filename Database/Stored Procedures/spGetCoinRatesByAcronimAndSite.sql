Create PROCEDURE [dbo].[spGetCoinRatesByAcronimAndSite]
@acronim nvarchar(10),
@site nvarchar(150)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

select * 
from [CoinsRates] 
where [Acronim] = @acronim 
and [Site] = @site

END
