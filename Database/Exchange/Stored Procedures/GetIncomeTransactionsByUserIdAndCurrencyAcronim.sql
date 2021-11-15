USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetLastIncomeTransactionsByUserId]    Script Date: 05.11.2021 20:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIncomeTransactionsByUserIdAndCurrencyAcronim]
@userid nvarchar(450),
@currencyAcronim nvarchar(20)
AS
BEGIN

SELECT * FROM [dbo].[IncomeTransactions] as it WHERE it.UserId = @userid AND it.CurrencyAcronim = @currencyAcronim
	
END
