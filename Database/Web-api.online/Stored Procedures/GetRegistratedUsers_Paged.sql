USE [web-api.online]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRegistratedUsers_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  AspNetUsers.Email, 
  UsersInfo.FullName, 
  UsersInfo.RegistrationDate 
  
FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



