CREATE PROCEDURE [dbo].[CreateP2PPayment]
@name nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PPayments] ([Name])
VALUES (@name)

END