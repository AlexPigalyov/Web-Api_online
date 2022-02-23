USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfRegistratedUsers]
AS
BEGIN

SELECT COUNT(1) FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
WHERE AspNetUsers.Id IS NOT NULL
AND UsersInfo.UserId IS NOT NULL

END
