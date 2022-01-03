SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE GetAllIncomeTransactions
@id int
AS
BEGIN

SELECT inct.[Id],
       inct.[CurrencyAcronim],
       inct.[Amount],
       inct.[TransactionFee],
       inct.[FromAddress],
       inct.[ToAddress],
       inct.[Date],
       inct.[UserId]
 FROM IncomeTransactions inct
 where
 inct.[Id]=@id
END
GO
