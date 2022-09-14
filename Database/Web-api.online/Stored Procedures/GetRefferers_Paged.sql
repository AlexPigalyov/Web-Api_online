USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetRefferers_Paged]
@page int,
@pageSize int
AS
BEGIN

SELECT 
	LEFT(anu.Email, 2) + '*****' + RIGHT(anu.Email,2) Email, 
	LEFT(anu.UserName, 1) + '*****' + RIGHT(anu.UserName,1) UserName,
	LEFT(ui.FullName, 1) + '*****' + RIGHT(ui.FullName,1) FullName,
	ui.ReffererId

FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId IS NOT NULL
ORDER By anu.Id

OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



