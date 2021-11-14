USE [Exchange]
GO

/****** Object:  Table [dbo].[OpenOrder]    Script Date: 15.04.2021 22:23:32 ******/
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


