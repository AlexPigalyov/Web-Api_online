USE [web-api.online]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserRefferals]
@userId nvarchar(450)

AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT 
anu.Email,
anu.UserName,
ui.FullName,
ui.ReffererId


FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId = @userId

END