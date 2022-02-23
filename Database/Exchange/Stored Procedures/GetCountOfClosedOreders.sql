USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCountOfClosedOreders]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[ClosedOrders_Paged]

END
