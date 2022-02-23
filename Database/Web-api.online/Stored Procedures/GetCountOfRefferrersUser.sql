USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCountOfRefferrersUser]
@userId nvarchar(450)
AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '87aa46b6-f6b1-4d7b-9540-a575b76b706c'

SELECT COUNT(1) FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
WHERE UsersInfo.ReffererId = @userId

END