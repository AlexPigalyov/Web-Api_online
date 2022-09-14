USE [web-api.online]
GO
/****** Object:  StoredProcedure [dbo].[FindUserIdForSendPage]    Script Date: 15.12.2021 1:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FindUserIdForSendPage]
@searchText nvarchar(max)
AS
BEGIN

Select ANU.Id
FROM AspNetUsers as ANU
WHERE 
ANU.UserName = @searchText
OR ANU.NormalizedUserName = @searchText
OR ANU.Email = @searchText

END