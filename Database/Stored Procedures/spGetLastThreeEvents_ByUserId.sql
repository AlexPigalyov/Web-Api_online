USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_SortedOrderBook]    Script Date: 06.08.2021 23:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetLastThreeEvents_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT TOP(3) * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate Desc


END