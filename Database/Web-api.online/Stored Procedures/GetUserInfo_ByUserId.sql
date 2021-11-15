ALTER PROCEDURE [dbo].[GetUserInfo_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[UsersInfo]
WHERE UserId = @userId

END
