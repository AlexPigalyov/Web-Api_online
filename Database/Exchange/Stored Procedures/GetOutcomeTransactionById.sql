USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetOutcomeTransactionById]    Script Date: 15.12.2021 1:13:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetOutcomeTransactionById]
@id int
AS
BEGIN

SELECT *  FROM OutcomeTransactions 
WHERE id = @id

END
