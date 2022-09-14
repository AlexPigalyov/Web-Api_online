USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetCreatedOutcomeTransactionAndSetStateInWork]    Script Date: 15.12.2021 1:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCreatedOutcomeTransactionAndSetStateInWork]
@currencyAcronim nvarchar(10)
AS
BEGIN

--IF OBJECT_ID('tempdb..#Temp') IS NOT NULL
--    DROP TABLE #Temp

--create table #Temp
--(
--	[Id] [bigint],
--	[WalletId] [int],
--	[Value] [decimal](38, 20),
--	[Date] [datetime],
--	[OutcomingWallet] [nvarchar](max),
--	[CurrencyAcronim] [nvarchar](10),
--	[State] [int],
--	[LastUpdateDate] [datetime],
--	[ErrorText] [nvarchar](max)
--)

--Insert Into #Temp
--Select [Id]
--      ,[WalletId]
--      ,[Value]
--      ,[Date]
--      ,[OutcomingWallet]
--      ,[CurrencyAcronim]
--      ,[State]
--      ,[LastUpdateDate]
--      ,[ErrorText] 
--from OutcomeTransactions

--UPDATE [OutcomeTransactions]
--SET [State] = 2
--FROM [OutcomeTransactions]
--INNER JOIN ON #Temp.Id = [OutcomeTransactions].Id




declare @transactionId int;

set @transactionId = (select top(1) Id from OutcomeTransactions 
						where [State] = 1 AND CurrencyAcronim = @currencyAcronim)

UPDATE [OutcomeTransactions]
SET [State] = 2,
LastUpdateDate = GetDate()
Where OutcomeTransactions.Id = @transactionId

select top(1) * from OutcomeTransactions 
Where OutcomeTransactions.Id = @transactionId


END


