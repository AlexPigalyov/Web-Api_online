ALTER PROCEDURE [dbo].[GetCountOfIncomeTransactions]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[IncomeTransactions]

END
