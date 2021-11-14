ALTER PROCEDURE [dbo].[DeleteBots_ById]
@id nvarchar(450)
AS
BEGIN

DELETE FROM [Exchange].[dbo].[Bots] WHERE Id = @id

END
