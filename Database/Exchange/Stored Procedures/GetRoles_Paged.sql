ALTER PROCEDURE [dbo].[GetRoles_Paged]
@page int,
@pageSize int
AS
BEGIN

SELECT Id, Name FROM [web-api.online].[dbo].[AspNetRoles]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END
