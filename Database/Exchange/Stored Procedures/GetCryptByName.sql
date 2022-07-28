SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCryptByName]
@name nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Crypts] 
WHERE 
[Name] = @name

END
