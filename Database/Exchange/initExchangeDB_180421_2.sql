USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_ClosedOrders](
	[ClosedOrderId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SoldUserId] [int] NOT NULL,
	[BoughtUserId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders](
	[OpenOrderId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[SellingUserId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_ClosedOrders]
AS
BEGIN

select buco.* 
from   [BTC_USDT_ClosedOrders] buco
order by buco.ClosedDate desc

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_OpenOrders]
AS
BEGIN

select buoo.* from   [BTC_USDT_OpenOrders] buoo

END
GO
