USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCountUserRefferer]
AS
BEGIN

SELECT COUNT(1) FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId IS NOT NULL

END
