USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[CreateUserWallet]    Script Date: 13.12.2021 19:47:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateP2PSeller]
@userId nvarchar(450),
@price decimal(38,20),
@fiatId bigint,
@limitFrom decimal(38,20),
@limitTo decimal(38,20),
@available decimal(38,20),
@paymentId bigint,
@cryptId bigint
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PSellers] (UserId, Price, FiatId, LimitFrom, LimitTo, Available, PaymentId, CryptId)
VALUES (@userId, @price, @fiatId, @limitFrom, @limitTo, @available, @paymentId, @cryptId)

END
