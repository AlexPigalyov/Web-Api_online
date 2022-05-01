USE [Exchange]
GO

/****** Object:  StoredProcedure [dbo].[GetLastOrdersBySeconds]    Script Date: 01.05.2022 23:33:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[GetLastOrdersBySeconds]
@pairName nvarchar(20),
@seconds nvarchar(10)
AS
BEGIN

Declare @SQL nvarchar(200)

SET @SQL = 'SELECT * 
FROM [Exchange].[dbo].['+ @pairName +'_ClosedOrders]
WHERE DATEADD(second, -'+ @seconds +', GETDATE()) < ClosedDate and ClosedDate < GETDATE()'

EXEC(@SQL)

END
GO