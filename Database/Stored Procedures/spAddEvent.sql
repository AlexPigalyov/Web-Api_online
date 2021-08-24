ALTER PROCEDURE [dbo].[spAddEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20),
@comment nvarchar(450),
@whenDate datetime

BEGIN

insert into Events (UserId, Type, Value, Comment, WhenDate)
values (@userid, @type, @value, @comment, @whenDate)

END
