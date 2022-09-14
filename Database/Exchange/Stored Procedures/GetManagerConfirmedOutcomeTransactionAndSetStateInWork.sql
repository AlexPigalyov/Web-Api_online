USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetManagerConfirmedOutcomeTransactionAndSetStateInWork]    Script Date: 15.12.2021 1:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetManagerConfirmedOutcomeTransactionAndSetStateInWork]
@currencyAcronim nvarchar(10)
AS
BEGIN

declare @transactionId int;

set @transactionId = (select top(1) Id from OutcomeTransactions 
						where [State] = 1 AND CurrencyAcronim = @currencyAcronim)

UPDATE [OutcomeTransactions]
SET [State] = 3,
LastUpdateDate = GetDate()
Where OutcomeTransactions.Id = @transactionId

select top(1) * from OutcomeTransactions 
Where OutcomeTransactions.Id = @transactionId


END
