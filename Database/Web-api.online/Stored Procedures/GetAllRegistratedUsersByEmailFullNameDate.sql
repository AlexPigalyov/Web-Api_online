use [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetAllRegistratedUsersByEmailFullNameDate]

AS
BEGIN

Select AspNetUsers.Email, UsersInfo.FullName, UsersInfo.RegistrationDate 
From AspNetUsers 
Left Join UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
WHERE AspNetUsers.Id IS NOT NULL
AND UsersInfo.UserId IS NOT NULL
	
END
