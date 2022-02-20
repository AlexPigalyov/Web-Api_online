USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetIncomeTransactions_Paged]    Script Date: 15.02.2022 15:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetTransfers_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  WalletFromId,
  WalletToId,
  Value,
  Date, 
  CurrencyAcronim,
  Hash,
  Comment,
  PlatformCommission

FROM [Exchange].[dbo].[Transfers]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



