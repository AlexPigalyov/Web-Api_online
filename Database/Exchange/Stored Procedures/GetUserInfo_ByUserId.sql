ALTER PROCEDURE [dbo].[GetUserInfo_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM [web-api.online].[dbo].[UsersInfo]
WHERE UserId = @userId

END
