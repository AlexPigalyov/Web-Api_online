ALTER PROCEDURE [dbo].[FindUsersByUsernameFor_Paged]
@userName nvarchar(450),
@page int,
@pageSize int
AS
BEGIN

Select
  ANU.UserName
  ,ANU.Email
  ,UI.FullName
  ,UI.Location
  ,UI.RegistrationDate
FROM [web-api.online].[dbo].[AspNetUsers] as ANU
inner join [web-api.online].[dbo].[UsersInfo] as UI
ON ANU.Id = UI.UserId
WHERE ANU.UserName LIKE '%' + @userName + '%'
Order By ANU.Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END
