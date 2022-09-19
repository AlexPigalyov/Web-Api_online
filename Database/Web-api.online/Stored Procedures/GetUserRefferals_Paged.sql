USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserRefferals_Paged]
@userId nvarchar(450),
@page int,
@pageSize int
AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT
anu.Id
,LEFT(anu.Email, 2) + '*****' + RIGHT(anu.Email,4) Email
,ui.ReffererId
,ui.RegistrationDate
,anuref.Id

FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui ON anu.Id = ui.UserId
LEFT JOIN AspNetUsers anuref ON anuref.Number = ui.ReffererId
WHERE anuref.Id = @userId
ORDER By ui.RegistrationDate desc

OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY
END