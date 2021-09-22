USE [web-api.online]
GO
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_ClosedOrder]    Script Date: 20.08.2021 23:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCreateOrUpdateProfileUsersInfoPhoto]
@userId nvarchar(450),
@profilePhotoPath nvarchar(MAX)
AS
BEGIN

IF NOT EXISTS(SELECT * FROM UsersInfo WHERE UserId = @userId)
BEGIN

INSERT INTO UsersInfo (UserId, ProfilePhotoPath)
VALUES (@userId, @profilePhotoPath)

END
ELSE
BEGIN

UPDATE UsersInfo
SET ProfilePhotoPath = @profilePhotoPath
WHERE UserId = @userId

END


END
