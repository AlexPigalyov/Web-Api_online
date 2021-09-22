USE [web-api.online]
GO
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_ClosedOrder]    Script Date: 20.08.2021 23:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCreateOrUpdateUsersInfoLocation]
@userId nvarchar(450),
@location nvarchar(200)
AS
BEGIN

IF NOT EXISTS(SELECT * FROM UsersInfo WHERE UserId = @userId)
BEGIN

INSERT INTO UsersInfo (UserId, Location)
VALUES (@userId, @location)

END
ELSE
BEGIN

UPDATE UsersInfo
SET Location = @location
WHERE UserId = @userId

END


END
