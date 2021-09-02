ALTER PROCEDURE [dbo].[spDeleteBots_ById]
@id nvarchar(450)
AS
BEGIN

delete from Bots WHERE Id = @id

END
