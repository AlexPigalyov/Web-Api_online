SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIncomeTransactionsByUserIdAndCurrencyAcronim]
@userId bigint,
@currencyAcronim nvarchar(50)
AS
BEGIN

SELECT * FROM IncomeTransactions 
WHERE 
UserId = @userId
AND CurrencyAcronim = @currencyAcronim

END
