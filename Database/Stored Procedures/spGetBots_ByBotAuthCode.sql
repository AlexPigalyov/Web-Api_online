USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spGetLastIncomeTransactionsByUserId]    Script Date: 16.08.2021 20:11:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetBots_ByBotAuthCode]
@botAuthCode nvarchar(450)
AS
BEGIN

SELECT * FROM Bots WHERE BotAuthCode = @botAuthCode
	
END






