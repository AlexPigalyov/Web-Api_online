USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[UpdateStateOutcomeTransaction]    Script Date: 15.12.2021 1:16:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateStateOutcomeTransaction]
@id int,
@state int,
@errorText nvarchar(max)
AS
BEGIN

UPDATE [Exchange].[dbo].[OutcomeTransactions]
SET State = @state, LastUpdateDate = GETDATE(), ErrorText = @errorText
WHERE Id = @id

END
