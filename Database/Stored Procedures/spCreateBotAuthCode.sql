ALTER PROCEDURE [dbo].[spCreateBotAuthCode]
@botAuthCode nvarchar(450),
@userId nvarchar(450)
AS
BEGIN

insert into BotAuthCodes (BotAuthCode, UserId)
values (@botAuthCode, @userId)

END
