ALTER PROCEDURE [dbo].[UpdateSetting]
@name nvarchar(MAX),
@value nvarchar(MAX)
AS
BEGIN

UPDATE [Exchange].[dbo].[Settings]
SET    Value = @value,
       LastUpdateDateTime = GETDATE()
WHERE  Name = @name 

END
