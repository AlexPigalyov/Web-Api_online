ALTER PROCEDURE [dbo].[GetLastThreeEvents_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT TOP(3) * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate DESC


END