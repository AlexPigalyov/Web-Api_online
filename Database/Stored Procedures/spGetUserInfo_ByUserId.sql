USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_ClosedOrder]    Script Date: 20.08.2021 23:57:57 ******/
SET ANSI_NULLS ON
GO
USE [web-api.online]
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetUserInfo_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM UsersInfo
WHERE UserId = @userId

END
