USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[GetCryptById]    Script Date: 16.08.2022 22:21:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PCryptById]
@id int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PCrypts] 
WHERE 
Id = @id

END

