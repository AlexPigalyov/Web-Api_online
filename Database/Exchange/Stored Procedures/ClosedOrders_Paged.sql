USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ClosedOrders_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  CreateDate
      ,ClosedDate
      ,IsBuy
      ,ExposedPrice
      ,Difference
      ,TotalPrice
      ,Amount
      ,Total
      ,Status
      ,CreateUserId
      ,BoughtUserId
FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



