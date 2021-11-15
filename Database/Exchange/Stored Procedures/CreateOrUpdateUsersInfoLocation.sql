ALTER PROCEDURE [dbo].[CreateOrUpdateUsersInfoLocation]
@userId nvarchar(450),
@location nvarchar(200)
AS
BEGIN

IF NOT EXISTS(SELECT 1 FROM [web-api.online].[dbo].[UsersInfo] WHERE UserId = @userId)
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo] (UserId, Location)
VALUES (@userId, @location)

END
ELSE
BEGIN

UPDATE [web-api.online].[dbo].[UsersInfo]
SET Location = @location
WHERE UserId = @userId

END


END
