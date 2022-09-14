USE [Exchange]
GO

/****** Object:  StoredProcedure [dbo].[GetTransfers_Paged]    Script Date: 8/22/2022 20:06:42 ******/
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
  Id,
  WalletFromId,
  WalletToId,
  Value,
  Date, 
  CurrencyAcronim,
  Hash,
  Comment,
  PlatformCommission

FROM [Exchange].[dbo].[Transfers]
Order By Id desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



GO


