ALTER PROCEDURE [dbo].[GetIncomeTransactions_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  CurrencyAcronim
  ,Amount
  ,TransactionFee
  ,FromAddress
  ,ToAddress
  ,Date
  ,UserId
FROM [Exchange].[dbo].[IncomeTransactions]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



