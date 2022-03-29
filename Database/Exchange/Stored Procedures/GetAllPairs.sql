USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetAllPairs]    Script Date: 29.03.2022 19:31:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetAllPairs]
AS
BEGIN

SELECT 
[Id]
,[Currency1]
,[Currency2]
,[Order]
,[Created]
,[Header]
,[Acronim]
FROM [Exchange].[dbo].[Pairs]
ORDER BY [Order]

END
