CREATE PROCEDURE [dbo].[GetP2PPayments]

AS
BEGIN

SELECT *
  FROM [Exchange].[dbo].[P2PPayments]

END
