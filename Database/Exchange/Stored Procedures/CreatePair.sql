USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[Create_BTC_USDT_OpenOrder]    Script Date: 28.03.2022 0:03:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CreatePair]
@currency1 nvarchar(10),
@currency2 nvarchar(10),
@created datetime,
@header nvarchar(128),
@acronim nvarchar(20)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Pairs] (Currency1, Currency2, "Order", Created, Header, Acronim)
VALUES (@currency1, @currency2, 10, @created, @header, @acronim)

END
