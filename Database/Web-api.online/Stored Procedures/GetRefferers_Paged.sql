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
LEFT(AspNetUsers.Email, 2) + '*****' + RIGHT(AspNetUsers.Email,2), 
LEFT(UsersInfo.FullName, 2) + '*****' + RIGHT(UsersInfo.FullName,2), 
UsersInfo.RegistrationDate,
UsersInfo.ReffererId

FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId IS NOT NULL
ORDER By anu.Id

OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



