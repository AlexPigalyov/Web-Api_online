ALTER PROCEDURE [dbo].[GetCountOfOutcomeTransactions]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[OutcomeTransactions]

END
