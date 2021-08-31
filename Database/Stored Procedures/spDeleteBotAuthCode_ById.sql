ALTER PROCEDURE [dbo].[spDeleteBotAuthCode_ById]
@id nvarchar(450)
AS
BEGIN

delete from BotAuthCodes WHERE Id = @id

END
