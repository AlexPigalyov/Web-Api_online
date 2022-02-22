USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetCountOfIncomeTransactions]    Script Date: 22.02.2022 11:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCountOfTransfers]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[Transfers]

END
