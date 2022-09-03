CREATE PROCEDURE [dbo].[CreateP2PUserPayment]
@p2pUserId bigint,
@p2pPaymentId int
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PUsersPayments] (P2PPaymentId, P2PUserId)
VALUES (@p2pPaymentId, @p2pUserId)

END