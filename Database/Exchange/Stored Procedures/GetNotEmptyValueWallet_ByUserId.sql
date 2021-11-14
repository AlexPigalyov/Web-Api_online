ALTER PROCEDURE [dbo].[GetNotEmptyValueWallet_ByUserId]
@userid nvarchar(450)
AS
BEGIN

SELECT UserId,
	   CurrencyAcronim,
       Value
  FROM [Exchange].[dbo].[Wallets] 
  WHERE UserId = @userid AND Value != 0

END