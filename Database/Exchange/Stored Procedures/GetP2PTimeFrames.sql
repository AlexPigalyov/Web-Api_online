
USE [Exchange]
GO

/****** Object:  StoredProcedure [dbo].[GetCryptByName]    Script Date: 02.08.2022 16:20:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetP2PTimeFrames]
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PTimeFrames]

END

GO


