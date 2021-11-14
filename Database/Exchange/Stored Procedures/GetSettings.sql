ALTER PROCEDURE [dbo].[GetSettings]

AS
BEGIN

SELECT [Id]
      ,[Name]
      ,[Value]
      ,[LastUpdateDateTime]
  FROM [Exchange].[dbo].[Settings]

END
