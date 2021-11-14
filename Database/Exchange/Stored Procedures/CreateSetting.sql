ALTER PROCEDURE [dbo].[CreateSetting]
@name nvarchar(max),
@value nvarchar(max)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Settings](Name, Value, LastUpdateDateTime)
VALUES (@name, @value, GETDATE())

END
