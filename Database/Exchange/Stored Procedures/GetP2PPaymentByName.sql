USE [Exchange]
GO

/****** Object:  StoredProcedure [dbo].[GetP2PCryptByName]    Script Date: 31.08.2022 23:02:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetP2PPaymentByName]
@name nvarchar(100)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PPayments] 
WHERE 
[Name] = @name

END
GO


