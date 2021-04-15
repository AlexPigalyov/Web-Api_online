USE [Exchange]
GO

/****** Object:  Table [dbo].[ClosedOrder]    Script Date: 15.04.2021 22:20:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClosedOrder](
	[ClosedOrderId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[Pair] [nvarchar](25) NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SoldUserId] [int] NOT NULL,
	[BoughtUserId] [int] NOT NULL
) ON [PRIMARY]
GO


