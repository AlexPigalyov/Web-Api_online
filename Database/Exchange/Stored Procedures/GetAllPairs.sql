USE [Exchange]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPairs]
AS
BEGIN

SELECT 
[Id]
,[Currency1]
,[Currency2]
,[Order]
,[Created]
,[Header]
FROM [Exchange].[dbo].[Pairs]


END
