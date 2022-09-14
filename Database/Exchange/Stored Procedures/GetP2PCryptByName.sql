SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PCryptByName]
@name nvarchar(100)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PCrypts] 
WHERE 
[Name] = @name

END
