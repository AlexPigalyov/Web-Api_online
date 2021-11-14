ALTER PROCEDURE [dbo].[GetCountOfUsers]
AS
BEGIN

SELECT COUNT(1) FROM [web-api.online].[dbo].[AspNetUsers]

END
