ALTER PROCEDURE [dbo].[GetUserIdByWalletAddress]
@address nvarchar(max)
AS
BEGIN

Select Id
FROM Wallets
WHERE Address = @address

END
