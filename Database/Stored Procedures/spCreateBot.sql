ALTER PROCEDURE [dbo].[spCreateBot]
@name nvarchar(450),
@botAuthCode nvarchar(450),
@userId nvarchar(450)
AS
BEGIN

insert into Bots (Name, BotAuthCode, UserId)
values (@name, @botAuthCode, @userId)

END
