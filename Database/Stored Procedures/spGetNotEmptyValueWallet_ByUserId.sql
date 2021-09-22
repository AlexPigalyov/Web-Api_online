USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spGetNotEmptyValueWallet_ByUserId]    Script Date: 22.09.2021 22:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetNotEmptyValueWallet_ByUserId]
@userid nvarchar(450)
AS
BEGIN

SELECT UserId,
	   CurrencyAcronim,
       Value
  FROM [Wallets] 
  WHERE UserId = @userid AND Value != 0

END