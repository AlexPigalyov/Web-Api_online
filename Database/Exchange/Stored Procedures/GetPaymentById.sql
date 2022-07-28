SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentById]
@id bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Payments] 
WHERE 
Id = @id

END
