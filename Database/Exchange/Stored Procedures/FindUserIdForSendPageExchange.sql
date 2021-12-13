SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[FindUserIdForSendPageExchange]
@searchText nvarchar(max)
AS
BEGIN

Select *
FROM Wallets
WHERE (Address = @searchText)

END