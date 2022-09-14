USE [web-api.online]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetRegistratedUsers_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
	AspNetUsers.Number,
	LEFT(AspNetUsers.Email, 2) + '*****' + RIGHT(AspNetUsers.Email,2) Email, 
	LEFT(UsersInfo.FullName, 1) + '*****' + RIGHT(UsersInfo.FullName,1) FullName, 
	UsersInfo.RegistrationDate,
	UsersInfo.ReffererId
  
FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
Order By AspNetUsers.Number desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



