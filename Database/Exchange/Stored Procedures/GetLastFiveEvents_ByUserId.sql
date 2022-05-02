ALTER PROCEDURE [dbo].[GetLastFiveEvents_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT TOP(5) * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate DESC


END