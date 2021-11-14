ALTER PROCEDURE [GetDPDCitiesTop10]
@text nvarchar(50)
AS
BEGIN
SELECT TOP (10) [cityId]
,[cityIdSpecified]
,[countryCode]
,[countryName]
,[regionCode]
,[regionCodeSpecified]
,[regionName]
,[cityCode]
,[cityName]
,[abbreviation]
,[indexMin]
,[indexMax]
,[Population]
,[Settled]
,[lat]
,[lng]
FROM [web-api.online].[dbo].[DpdCities]
WHERE 
[cityName] like N'%'+@text+'%'
ORDER BY Population DESC
END
GO

GRANT EXECUTE
    ON OBJECT::[dbo].[spGetDPDCitiesTop10] TO PUBLIC
    AS [dbo];
