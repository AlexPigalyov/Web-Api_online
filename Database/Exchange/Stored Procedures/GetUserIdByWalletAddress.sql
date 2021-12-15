SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetUserIdByWalletAddress]
@address nvarchar(max)
AS
BEGIN

Select UserId
FROM Wallets
WHERE Address = @address

END
