CREATE PROCEDURE [dbo].[CreateEmptyUsersInfo]
@userId nvarchar(450)
AS
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo](UserId)
VALUES (@userId)


END