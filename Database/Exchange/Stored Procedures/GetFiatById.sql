SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFiatById]
@fiatId bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Fiats] 
WHERE 
Id = @fiatId

END
