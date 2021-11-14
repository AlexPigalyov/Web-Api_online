ALTER PROCEDURE [dbo].[CreateOrUpdateProfileUsersInfoPhoto]
@userId nvarchar(450),
@profilePhotoPath nvarchar(MAX)
AS
BEGIN

IF NOT EXISTS(SELECT 1 FROM [web-api.online].[dbo].[UsersInfo] WHERE UserId = @userId)
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo] (UserId, ProfilePhotoPath)
VALUES (@userId, @profilePhotoPath)

END
ELSE
BEGIN

UPDATE [web-api.online].[dbo].[UsersInfo]
SET ProfilePhotoPath = @profilePhotoPath
WHERE UserId = @userId

END


END
