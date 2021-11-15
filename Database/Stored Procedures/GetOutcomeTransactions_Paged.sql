ALTER PROCEDURE [dbo].[GetOutcomeTransactions_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  CurrencyAcronim
  ,Value
  ,CreateDate
  ,FromAddress
  ,ToAddress
  ,State
  ,LastUpdateDate
  ,ErrorText
FROM [Exchange].[dbo].[OutcomeTransactions]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



