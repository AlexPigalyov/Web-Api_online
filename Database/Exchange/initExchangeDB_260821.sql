USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_ClosedOrders](
	[ClosedOrderId] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BTC_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[ClosedOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders](
	[OpenOrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BTC_USDT_OpenOrders] PRIMARY KEY CLUSTERED 
(
	[OpenOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Acronim] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Created] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[WhenDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UsersEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exceptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[WhenDate] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrencyAcronim] [nvarchar](50) NOT NULL,
	[TransactionId] [nvarchar](max) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[TransactionFee] [decimal](38, 20) NOT NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Date] [float] NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[IncomeWalletsId] [int] NOT NULL,
 CONSTRAINT [PK_IncomeTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeWallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[AddressLabel] [nvarchar](max) NULL,
	[CurrencyAcronim] [nvarchar](10) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_IncomeWallets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[AuthorId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_New] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WalletId] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[OutcomingWallet] [nvarchar](max) NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WalletFromId] [int] NOT NULL,
	[WalletToId] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (0, CAST(N'2021-08-21T20:54:45.567' AS DateTime), CAST(N'2021-08-21T20:54:45.570' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (1, CAST(N'2021-08-21T20:54:43.873' AS DateTime), CAST(N'2021-08-21T20:54:45.573' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (2, CAST(N'2021-08-21T20:54:44.680' AS DateTime), CAST(N'2021-08-21T21:04:21.110' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (3, CAST(N'2021-08-21T20:54:45.090' AS DateTime), CAST(N'2021-08-21T21:04:21.337' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (4, CAST(N'2021-08-21T20:54:45.567' AS DateTime), CAST(N'2021-08-21T21:04:19.393' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (5, CAST(N'2021-08-21T20:55:48.420' AS DateTime), CAST(N'2021-08-21T21:04:20.647' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (6, CAST(N'2021-08-21T21:04:19.357' AS DateTime), CAST(N'2021-08-21T21:04:19.390' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (7, CAST(N'2021-08-21T21:04:20.643' AS DateTime), CAST(N'2021-08-21T21:04:20.643' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (8, CAST(N'2021-08-21T21:04:21.110' AS DateTime), CAST(N'2021-08-21T21:04:21.110' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (9, CAST(N'2021-08-21T21:04:21.337' AS DateTime), CAST(N'2021-08-21T21:04:21.337' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (10, CAST(N'2021-08-21T21:04:22.537' AS DateTime), CAST(N'2021-08-21T21:04:31.533' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (11, CAST(N'2021-08-21T21:04:24.557' AS DateTime), CAST(N'2021-08-21T21:04:32.280' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (12, CAST(N'2021-08-21T21:04:24.717' AS DateTime), CAST(N'2021-08-21T21:04:32.447' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (13, CAST(N'2021-08-21T21:04:24.873' AS DateTime), CAST(N'2021-08-21T21:04:33.257' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (14, CAST(N'2021-08-21T21:04:25.040' AS DateTime), CAST(N'2021-08-21T21:04:33.417' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (15, CAST(N'2021-08-21T21:04:25.180' AS DateTime), CAST(N'2021-08-21T21:04:33.597' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (16, CAST(N'2021-08-21T21:04:25.330' AS DateTime), CAST(N'2021-08-21T21:04:33.767' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (17, CAST(N'2021-08-21T21:04:25.497' AS DateTime), CAST(N'2021-08-21T21:04:33.947' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (18, CAST(N'2021-08-21T21:04:25.643' AS DateTime), CAST(N'2021-08-21T21:04:34.110' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (19, CAST(N'2021-08-21T21:04:25.827' AS DateTime), CAST(N'2021-08-21T21:04:34.283' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (20, CAST(N'2021-08-21T21:04:25.990' AS DateTime), CAST(N'2021-08-21T21:04:34.450' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (21, CAST(N'2021-08-21T21:04:26.160' AS DateTime), CAST(N'2021-08-21T21:04:34.627' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (22, CAST(N'2021-08-21T21:04:26.317' AS DateTime), CAST(N'2021-08-21T21:04:34.810' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (23, CAST(N'2021-08-21T21:04:26.463' AS DateTime), CAST(N'2021-08-21T21:04:34.980' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (24, CAST(N'2021-08-21T21:04:26.640' AS DateTime), CAST(N'2021-08-21T21:04:35.157' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (25, CAST(N'2021-08-21T21:04:31.527' AS DateTime), CAST(N'2021-08-21T21:04:31.533' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (26, CAST(N'2021-08-21T21:04:32.273' AS DateTime), CAST(N'2021-08-21T21:04:32.277' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (27, CAST(N'2021-08-21T21:04:32.447' AS DateTime), CAST(N'2021-08-21T21:04:32.447' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (28, CAST(N'2021-08-21T21:04:33.257' AS DateTime), CAST(N'2021-08-21T21:04:33.257' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (29, CAST(N'2021-08-21T21:04:33.413' AS DateTime), CAST(N'2021-08-21T21:04:33.413' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (30, CAST(N'2021-08-21T21:04:33.593' AS DateTime), CAST(N'2021-08-21T21:04:33.593' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (31, CAST(N'2021-08-21T21:04:33.767' AS DateTime), CAST(N'2021-08-21T21:04:33.763' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (32, CAST(N'2021-08-21T21:04:33.943' AS DateTime), CAST(N'2021-08-21T21:04:33.943' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (33, CAST(N'2021-08-21T21:04:34.107' AS DateTime), CAST(N'2021-08-21T21:04:34.107' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (34, CAST(N'2021-08-21T21:04:34.283' AS DateTime), CAST(N'2021-08-21T21:04:34.283' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (35, CAST(N'2021-08-21T21:04:34.450' AS DateTime), CAST(N'2021-08-21T21:04:34.450' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (36, CAST(N'2021-08-21T21:04:34.627' AS DateTime), CAST(N'2021-08-21T21:04:34.627' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37, CAST(N'2021-08-21T21:04:34.810' AS DateTime), CAST(N'2021-08-21T21:04:34.807' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38, CAST(N'2021-08-21T21:04:34.980' AS DateTime), CAST(N'2021-08-21T21:04:34.980' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (39, CAST(N'2021-08-21T21:04:35.157' AS DateTime), CAST(N'2021-08-21T21:04:35.157' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (40, CAST(N'2021-08-21T21:04:35.343' AS DateTime), CAST(N'2021-08-21T21:04:36.990' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (41, CAST(N'2021-08-21T21:04:35.507' AS DateTime), CAST(N'2021-08-21T21:04:37.277' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (42, CAST(N'2021-08-21T21:04:35.697' AS DateTime), CAST(N'2021-08-21T21:04:37.457' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (43, CAST(N'2021-08-21T21:04:35.920' AS DateTime), CAST(N'2021-08-21T21:04:37.620' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (44, CAST(N'2021-08-21T21:04:36.137' AS DateTime), CAST(N'2021-08-21T21:04:37.793' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (45, CAST(N'2021-08-21T21:04:36.373' AS DateTime), CAST(N'2021-08-21T21:04:37.950' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (46, CAST(N'2021-08-21T21:04:36.530' AS DateTime), CAST(N'2021-08-21T21:04:38.100' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (47, CAST(N'2021-08-21T21:04:36.990' AS DateTime), CAST(N'2021-08-21T21:04:36.990' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (48, CAST(N'2021-08-21T21:04:37.273' AS DateTime), CAST(N'2021-08-21T21:04:37.277' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (49, CAST(N'2021-08-21T21:04:37.457' AS DateTime), CAST(N'2021-08-21T21:04:37.457' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (50, CAST(N'2021-08-21T21:04:37.617' AS DateTime), CAST(N'2021-08-21T21:04:37.617' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (51, CAST(N'2021-08-21T21:04:37.790' AS DateTime), CAST(N'2021-08-21T21:04:37.790' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (52, CAST(N'2021-08-21T21:04:37.947' AS DateTime), CAST(N'2021-08-21T21:04:37.947' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (53, CAST(N'2021-08-21T21:04:38.100' AS DateTime), CAST(N'2021-08-21T21:04:38.100' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (54, CAST(N'2021-08-21T21:04:38.407' AS DateTime), CAST(N'2021-08-21T21:07:09.487' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (55, CAST(N'2021-08-21T21:04:38.983' AS DateTime), CAST(N'2021-08-21T21:07:09.827' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (56, CAST(N'2021-08-21T21:04:39.160' AS DateTime), CAST(N'2021-08-21T21:07:10.223' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (57, CAST(N'2021-08-21T21:04:39.330' AS DateTime), CAST(N'2021-08-21T21:07:10.490' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (58, CAST(N'2021-08-21T21:05:14.380' AS DateTime), CAST(N'2021-08-21T21:07:10.837' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (59, CAST(N'2021-08-21T21:07:09.447' AS DateTime), CAST(N'2021-08-21T21:07:09.483' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (60, CAST(N'2021-08-21T21:07:09.823' AS DateTime), CAST(N'2021-08-21T21:07:09.827' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (61, CAST(N'2021-08-21T21:07:10.220' AS DateTime), CAST(N'2021-08-21T21:07:10.220' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (62, CAST(N'2021-08-21T21:07:10.487' AS DateTime), CAST(N'2021-08-21T21:07:10.490' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (63, CAST(N'2021-08-21T21:07:10.833' AS DateTime), CAST(N'2021-08-21T21:07:10.837' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (64, CAST(N'2021-08-21T21:07:11.847' AS DateTime), CAST(N'2021-08-21T21:07:13.590' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (65, CAST(N'2021-08-21T21:07:12.753' AS DateTime), CAST(N'2021-08-21T21:07:15.410' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (66, CAST(N'2021-08-21T21:07:13.587' AS DateTime), CAST(N'2021-08-21T21:07:13.587' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (67, CAST(N'2021-08-21T21:07:15.410' AS DateTime), CAST(N'2021-08-21T21:07:15.410' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (68, CAST(N'2021-08-21T21:07:16.527' AS DateTime), CAST(N'2021-08-21T21:07:35.437' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (69, CAST(N'2021-08-21T21:07:33.783' AS DateTime), CAST(N'2021-08-21T21:07:37.313' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (70, CAST(N'2021-08-21T21:07:35.433' AS DateTime), CAST(N'2021-08-21T21:07:35.433' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (71, CAST(N'2021-08-21T21:07:37.313' AS DateTime), CAST(N'2021-08-21T21:07:37.313' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (72, CAST(N'2021-08-21T21:21:21.477' AS DateTime), CAST(N'2021-08-21T21:21:23.407' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (73, CAST(N'2021-08-21T21:21:23.393' AS DateTime), CAST(N'2021-08-21T21:21:23.403' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (74, CAST(N'2021-08-21T21:21:24.260' AS DateTime), CAST(N'2021-08-21T21:21:25.600' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (75, CAST(N'2021-08-21T21:21:24.697' AS DateTime), CAST(N'2021-08-21T21:21:25.763' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (76, CAST(N'2021-08-21T21:21:25.040' AS DateTime), CAST(N'2021-08-21T21:21:25.987' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (77, CAST(N'2021-08-21T21:21:25.207' AS DateTime), CAST(N'2021-08-21T21:21:26.170' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (78, CAST(N'2021-08-21T21:21:25.597' AS DateTime), CAST(N'2021-08-21T21:21:25.597' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (79, CAST(N'2021-08-21T21:21:25.763' AS DateTime), CAST(N'2021-08-21T21:21:25.760' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (80, CAST(N'2021-08-21T21:21:25.987' AS DateTime), CAST(N'2021-08-21T21:21:25.987' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (81, CAST(N'2021-08-21T21:21:26.170' AS DateTime), CAST(N'2021-08-21T21:21:26.170' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (82, CAST(N'2021-08-21T21:24:36.970' AS DateTime), CAST(N'2021-08-21T21:24:37.947' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (83, CAST(N'2021-08-21T21:24:37.930' AS DateTime), CAST(N'2021-08-21T21:24:37.940' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (84, CAST(N'2021-08-21T21:24:38.440' AS DateTime), CAST(N'2021-08-21T21:25:02.607' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (85, CAST(N'2021-08-21T21:24:38.757' AS DateTime), CAST(N'2021-08-21T21:25:14.820' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (86, CAST(N'2021-08-21T21:25:02.567' AS DateTime), CAST(N'2021-08-21T21:25:02.603' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (87, CAST(N'2021-08-21T21:25:04.407' AS DateTime), CAST(N'2021-08-21T21:26:48.187' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (88, CAST(N'2021-08-21T21:25:14.813' AS DateTime), CAST(N'2021-08-21T21:25:14.820' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (89, CAST(N'2021-08-21T21:26:48.143' AS DateTime), CAST(N'2021-08-21T21:26:48.183' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (90, CAST(N'2021-08-21T21:26:48.920' AS DateTime), CAST(N'2021-08-21T21:26:50.003' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (91, CAST(N'2021-08-21T21:26:49.377' AS DateTime), CAST(N'2021-08-21T21:26:50.157' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (92, CAST(N'2021-08-21T21:26:49.527' AS DateTime), CAST(N'2021-08-21T21:26:50.290' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (93, CAST(N'2021-08-21T21:26:49.653' AS DateTime), CAST(N'2021-08-21T21:26:50.450' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (94, CAST(N'2021-08-21T21:26:50.003' AS DateTime), CAST(N'2021-08-21T21:26:50.003' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (95, CAST(N'2021-08-21T21:26:50.157' AS DateTime), CAST(N'2021-08-21T21:26:50.157' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (96, CAST(N'2021-08-21T21:26:50.290' AS DateTime), CAST(N'2021-08-21T21:26:50.290' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (97, CAST(N'2021-08-21T21:26:50.447' AS DateTime), CAST(N'2021-08-21T21:26:50.450' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (98, CAST(N'2021-08-21T21:26:50.587' AS DateTime), CAST(N'2021-08-21T21:26:52.163' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (99, CAST(N'2021-08-21T21:26:50.720' AS DateTime), CAST(N'2021-08-21T21:26:52.323' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (100, CAST(N'2021-08-21T21:26:50.890' AS DateTime), CAST(N'2021-08-21T21:26:52.493' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (101, CAST(N'2021-08-21T21:26:51.180' AS DateTime), CAST(N'2021-08-21T21:26:52.650' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (102, CAST(N'2021-08-21T21:26:51.340' AS DateTime), CAST(N'2021-08-21T21:26:52.787' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (103, CAST(N'2021-08-21T21:26:51.493' AS DateTime), CAST(N'2021-08-21T21:26:52.933' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (104, CAST(N'2021-08-21T21:26:51.647' AS DateTime), CAST(N'2021-08-21T21:26:53.087' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (105, CAST(N'2021-08-21T21:26:51.800' AS DateTime), CAST(N'2021-08-21T21:26:53.237' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (106, CAST(N'2021-08-21T21:26:52.163' AS DateTime), CAST(N'2021-08-21T21:26:52.163' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (107, CAST(N'2021-08-21T21:26:52.323' AS DateTime), CAST(N'2021-08-21T21:26:52.323' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (108, CAST(N'2021-08-21T21:26:52.493' AS DateTime), CAST(N'2021-08-21T21:26:52.490' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (109, CAST(N'2021-08-21T21:26:52.647' AS DateTime), CAST(N'2021-08-21T21:26:52.647' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (110, CAST(N'2021-08-21T21:26:52.787' AS DateTime), CAST(N'2021-08-21T21:26:52.787' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (111, CAST(N'2021-08-21T21:26:52.933' AS DateTime), CAST(N'2021-08-21T21:26:52.933' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (112, CAST(N'2021-08-21T21:26:53.087' AS DateTime), CAST(N'2021-08-21T21:26:53.087' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (113, CAST(N'2021-08-21T21:26:53.233' AS DateTime), CAST(N'2021-08-21T21:26:53.237' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (114, CAST(N'2021-08-21T21:26:53.390' AS DateTime), CAST(N'2021-08-23T11:21:54.757' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (115, CAST(N'2021-08-21T21:26:53.710' AS DateTime), CAST(N'2021-08-23T11:21:55.393' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (116, CAST(N'2021-08-21T21:26:53.857' AS DateTime), CAST(N'2021-08-25T15:06:47.827' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (117, CAST(N'2021-08-21T21:26:55.710' AS DateTime), CAST(N'2021-08-21T21:26:58.253' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (118, CAST(N'2021-08-21T21:26:55.987' AS DateTime), CAST(N'2021-08-21T21:26:58.390' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (119, CAST(N'2021-08-21T21:26:56.150' AS DateTime), CAST(N'2021-08-21T21:26:58.670' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (120, CAST(N'2021-08-21T21:26:56.310' AS DateTime), CAST(N'2021-08-21T21:26:59.110' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (121, CAST(N'2021-08-21T21:26:56.473' AS DateTime), CAST(N'2021-08-21T21:26:59.260' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (122, CAST(N'2021-08-21T21:26:56.637' AS DateTime), CAST(N'2021-08-21T21:26:59.427' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (123, CAST(N'2021-08-21T21:26:56.803' AS DateTime), CAST(N'2021-08-21T21:26:59.577' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (124, CAST(N'2021-08-21T21:26:56.967' AS DateTime), CAST(N'2021-08-21T21:26:59.727' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (125, CAST(N'2021-08-21T21:26:57.113' AS DateTime), CAST(N'2021-08-21T21:26:59.873' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (126, CAST(N'2021-08-21T21:26:58.253' AS DateTime), CAST(N'2021-08-21T21:26:58.253' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (127, CAST(N'2021-08-21T21:26:58.390' AS DateTime), CAST(N'2021-08-21T21:26:58.390' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (128, CAST(N'2021-08-21T21:26:58.667' AS DateTime), CAST(N'2021-08-21T21:26:58.670' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (129, CAST(N'2021-08-21T21:26:59.107' AS DateTime), CAST(N'2021-08-21T21:26:59.110' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (130, CAST(N'2021-08-21T21:26:59.260' AS DateTime), CAST(N'2021-08-21T21:26:59.260' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (131, CAST(N'2021-08-21T21:26:59.423' AS DateTime), CAST(N'2021-08-21T21:26:59.423' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (132, CAST(N'2021-08-21T21:26:59.573' AS DateTime), CAST(N'2021-08-21T21:26:59.577' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (133, CAST(N'2021-08-21T21:26:59.723' AS DateTime), CAST(N'2021-08-21T21:26:59.727' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (134, CAST(N'2021-08-21T21:26:59.870' AS DateTime), CAST(N'2021-08-21T21:26:59.870' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (135, CAST(N'2021-08-21T21:27:00.100' AS DateTime), CAST(N'2021-08-21T21:27:01.793' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (136, CAST(N'2021-08-21T21:27:00.380' AS DateTime), CAST(N'2021-08-21T21:27:02.400' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (137, CAST(N'2021-08-21T21:27:00.530' AS DateTime), CAST(N'2021-08-23T11:22:09.080' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (138, CAST(N'2021-08-21T21:27:01.793' AS DateTime), CAST(N'2021-08-21T21:27:01.790' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (139, CAST(N'2021-08-21T21:27:02.050' AS DateTime), CAST(N'2021-08-23T11:22:15.280' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (140, CAST(N'2021-08-21T21:27:02.397' AS DateTime), CAST(N'2021-08-21T21:27:02.397' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (141, CAST(N'2021-08-23T11:21:52.677' AS DateTime), CAST(N'2021-08-25T15:06:48.130' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (145, CAST(N'2021-08-23T11:21:54.743' AS DateTime), CAST(N'2021-08-23T11:21:54.753' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (146, CAST(N'2021-08-23T11:21:55.390' AS DateTime), CAST(N'2021-08-23T11:21:55.390' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (147, CAST(N'2021-08-23T11:22:09.077' AS DateTime), CAST(N'2021-08-23T11:22:09.077' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (148, CAST(N'2021-08-23T11:22:15.280' AS DateTime), CAST(N'2021-08-23T11:22:15.280' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (149, CAST(N'2021-08-23T11:22:15.467' AS DateTime), CAST(N'2021-08-23T11:22:16.833' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (150, CAST(N'2021-08-23T11:22:15.627' AS DateTime), CAST(N'2021-08-23T11:22:17.020' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (151, CAST(N'2021-08-23T11:22:16.833' AS DateTime), CAST(N'2021-08-23T11:22:16.833' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (152, CAST(N'2021-08-23T11:22:17.020' AS DateTime), CAST(N'2021-08-23T11:22:17.020' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (153, CAST(N'2021-08-23T11:22:17.177' AS DateTime), CAST(N'2021-08-23T11:22:22.870' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (154, CAST(N'2021-08-23T11:22:17.583' AS DateTime), CAST(N'2021-08-23T11:22:25.190' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (155, CAST(N'2021-08-23T11:22:17.757' AS DateTime), CAST(N'2021-08-23T11:22:25.700' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (156, CAST(N'2021-08-23T11:22:22.867' AS DateTime), CAST(N'2021-08-23T11:22:22.867' AS DateTime), 1, CAST(6.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (157, CAST(N'2021-08-23T11:22:25.190' AS DateTime), CAST(N'2021-08-23T11:22:25.190' AS DateTime), 1, CAST(6.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (158, CAST(N'2021-08-23T11:22:25.700' AS DateTime), CAST(N'2021-08-23T11:22:25.700' AS DateTime), 1, CAST(6.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (162, CAST(N'2021-08-25T15:06:47.800' AS DateTime), CAST(N'2021-08-25T15:06:47.823' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (163, CAST(N'2021-08-25T15:06:48.130' AS DateTime), CAST(N'2021-08-25T15:06:48.130' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] ON 
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (142, CAST(N'2021-08-23T11:21:53.243' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (143, CAST(N'2021-08-23T11:21:53.577' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (144, CAST(N'2021-08-23T11:21:53.747' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (159, CAST(N'2021-08-25T15:06:45.603' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (160, CAST(N'2021-08-25T15:06:47.080' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (161, CAST(N'2021-08-25T15:06:47.380' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (164, CAST(N'2021-08-25T15:06:49.307' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (1, N'BTC', N'Bitcoin', CAST(N'2021-04-22T04:17:22.167' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (2, N'USDT', N'Dollar', CAST(N'2021-04-22T04:18:16.937' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (3, N'ETH', N'Etherium', CAST(N'2021-04-22T04:18:32.010' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (4, N'LTC', N'LiteCoin', CAST(N'2021-04-24T03:22:55.287' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (5, N'XRP', N'Ripple', CAST(N'2021-04-24T03:23:23.307' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (6, N'DOGE', N'DogeCoin', CAST(N'2021-04-24T03:23:48.857' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (7, N'BCH', N'BitcoinCash', CAST(N'2021-04-24T03:24:49.830' AS DateTime))
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (8, N'DASH', N'DashCoin', CAST(N'2021-04-24T03:25:17.297' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (1, N'40ffde92-878c-4c09-ac6b-c86a769d1623', 50000000, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address LTC', CAST(N'2021-08-20T22:47:07.413' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (2, N'40ffde92-878c-4c09-ac6b-c86a769d1623', 50000000, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address LTC', CAST(N'2021-08-20T22:47:07.847' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (3, N'1', 2, CAST(1.43000000000000000000 AS Decimal(38, 20)), N'1', CAST(N'2021-08-20T23:22:31.640' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (4, N'1', 2, CAST(1.43000000000000000000 AS Decimal(38, 20)), N'1', CAST(N'2021-08-20T23:28:20.663' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (5, N'1', 2, CAST(1.43000000000000000000 AS Decimal(38, 20)), N'1', CAST(N'2021-08-20T23:28:58.767' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (6, N'e0519b6d-3a94-43b2-b423-fc4891246a93', 50000000, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address BTC', CAST(N'2021-08-24T22:19:00.527' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (7, N'e0519b6d-3a94-43b2-b423-fc4891246a93', 50000000, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address LTC', CAST(N'2021-08-24T22:19:08.447' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (8, N'8082acc0-2a64-4983-9227-9ea395279df3', 50000000, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address LTC', CAST(N'2021-08-25T18:52:08.717' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (9, N'8082acc0-2a64-4983-9227-9ea395279df3', 10000001, CAST(0.00021000000000000000 AS Decimal(38, 20)), N'Income transaction LTC', CAST(N'2021-08-25T18:54:16.340' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (10, N'8082acc0-2a64-4983-9227-9ea395279df3', 10000001, CAST(0.00021000000000000000 AS Decimal(38, 20)), N'Income transaction LTC', CAST(N'2021-08-25T19:03:48.830' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (11, N'8082acc0-2a64-4983-9227-9ea395279df3', 10000001, CAST(0.00031000000000000000 AS Decimal(38, 20)), N'Income transaction LTC', CAST(N'2021-08-25T19:04:24.187' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (12, N'8082acc0-2a64-4983-9227-9ea395279df3', 20000001, CAST(0.00020000000000000000 AS Decimal(38, 20)), N'Success', CAST(N'2021-08-25T19:17:37.870' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (13, N'8082acc0-2a64-4983-9227-9ea395279df3', 10000001, CAST(0.00018660000000000000 AS Decimal(38, 20)), N'Income transaction LTC', CAST(N'2021-08-25T19:17:42.210' AS DateTime))
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate]) VALUES (14, N'8082acc0-2a64-4983-9227-9ea395279df3', 20000001, CAST(0.00020000000000000000 AS Decimal(38, 20)), N'Success', CAST(N'2021-08-25T19:21:04.307' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomeTransactions] ON 
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (4, N'LTC', N'd07be03a6fde4176398b6910d8a646817037eef52ae27cf536b621d2e8942b81', CAST(0.00021000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', 1629906834, N'8082acc0-2a64-4983-9227-9ea395279df3', 18)
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (5, N'LTC', N'8eeca2c8862b7c0262b05a1438c6e8b460ba4323f8a2e1c2b135b4d864f2161f', CAST(0.00031000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', 1629907452, N'8082acc0-2a64-4983-9227-9ea395279df3', 18)
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (6, N'LTC', N'eed57f5771622a33095fbfa6fef2138bc02f1e36f5ed63166c541381bb12f5a6', CAST(0.00018660000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', 1629908243, N'8082acc0-2a64-4983-9227-9ea395279df3', 18)
GO
SET IDENTITY_INSERT [dbo].[IncomeTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomeWallets] ON 
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (1, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'bc1qdum4hpgcultjp0g97u7l2dgtu943r9vrf7gv5j', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'BTC', CAST(N'2021-08-17T23:17:09.683' AS DateTime), CAST(N'2021-08-17T23:17:09.683' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (2, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'MWHRykjpeqJefJ9wm5dgwYPb9K9FFbdDNC', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'LTC', CAST(N'2021-08-17T23:17:14.620' AS DateTime), CAST(N'2021-08-17T23:17:14.620' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (3, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'DLpBEJJkNMCrviZHP67QtAAE6QDsGx3GzS', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'DOGE', CAST(N'2021-08-17T23:17:24.640' AS DateTime), CAST(N'2021-08-17T23:17:24.640' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (4, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'Xt57w5TRnGWHS6xck3H155stoqYFmR98x9', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'DASH', CAST(N'2021-08-17T23:17:31.333' AS DateTime), CAST(N'2021-08-17T23:17:31.333' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (5, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'bitcoincash:qzmnan8gc8j29h8djtcrlcqcc2d6esa5k5zahnvcva', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'BCH', CAST(N'2021-08-17T23:17:38.737' AS DateTime), CAST(N'2021-08-17T23:17:38.737' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (6, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'bc1qm9vtph36vu07w2dvn0y6h56sy3r7p8cleaemey', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'BTC', CAST(N'2021-08-17T23:17:44.720' AS DateTime), CAST(N'2021-08-17T23:17:44.720' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (7, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'XogfZWAmQsz6btzSqBMGgDUUMxH2opTk8z', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'DASH', CAST(N'2021-08-17T23:17:49.290' AS DateTime), CAST(N'2021-08-17T23:17:49.290' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (8, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'D9birCkREQyBySQRKNVKy1o8zMmMpP6QXc', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'DOGE', CAST(N'2021-08-17T23:17:54.660' AS DateTime), CAST(N'2021-08-17T23:17:54.660' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (9, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'M8jaPg8QqmzP3Gs1Hmi6EAAyLVwgmavVdV', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'LTC', CAST(N'2021-08-17T23:18:02.447' AS DateTime), CAST(N'2021-08-17T23:18:02.447' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (10, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'bc1qxtg6cmvd7244y8klqpms32t5mj6uczmw9a8zhk', N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', N'BTC', CAST(N'2021-08-17T23:18:06.523' AS DateTime), CAST(N'2021-08-17T23:18:06.523' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (11, N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'', N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'ETH', CAST(N'2021-08-19T22:01:29.587' AS DateTime), CAST(N'2021-08-19T22:01:29.587' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (12, N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'MW5Z1mT9xGSLLhT78bTeXAfBicrZG3oMA7', N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'LTC', CAST(N'2021-08-20T22:47:07.860' AS DateTime), CAST(N'2021-08-20T22:47:07.860' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (13, N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'MP4Gj8sr378tqY6UamYPFo2VwSkH5SBvkA', N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'LTC', CAST(N'2021-08-20T22:47:07.860' AS DateTime), CAST(N'2021-08-20T22:47:07.860' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (14, N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'bc1qhug425dd9svnmj0whpemp77hfskghamppkapgy', N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'BTC', CAST(N'2021-08-21T22:31:07.230' AS DateTime), CAST(N'2021-08-21T22:31:07.230' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (15, N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'', N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'ETH', CAST(N'2021-08-21T22:31:10.513' AS DateTime), CAST(N'2021-08-21T22:31:10.513' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (16, N'e0519b6d-3a94-43b2-b423-fc4891246a93', N'bc1qj0mf9dug9ah5jmf346ejn60q7cftsvgcvlgah8', N'e0519b6d-3a94-43b2-b423-fc4891246a93', N'BTC', CAST(N'2021-08-24T22:19:00.830' AS DateTime), CAST(N'2021-08-24T22:19:00.830' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (17, N'e0519b6d-3a94-43b2-b423-fc4891246a93', N'M89JVCfaoJ4fs1zJBZ9ZYMUsiis9NWHkSA', N'e0519b6d-3a94-43b2-b423-fc4891246a93', N'LTC', CAST(N'2021-08-24T22:19:08.453' AS DateTime), CAST(N'2021-08-24T22:19:08.453' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (18, N'8082acc0-2a64-4983-9227-9ea395279df3', N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', N'8082acc0-2a64-4983-9227-9ea395279df3', N'LTC', CAST(N'2021-08-25T18:52:09.210' AS DateTime), CAST(N'2021-08-25T18:52:09.210' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[IncomeWallets] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (1, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-08-17T23:17:09.687' AS DateTime), CAST(N'2021-08-17T23:17:09.687' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (2, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', CAST(0.00020000000000000000 AS Decimal(38, 20)), N'LTC', CAST(N'2021-08-17T23:17:14.640' AS DateTime), CAST(N'2021-08-17T23:17:14.640' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (3, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'DOGE', CAST(N'2021-08-17T23:17:24.640' AS DateTime), CAST(N'2021-08-17T23:17:24.640' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (4, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'DASH', CAST(N'2021-08-17T23:17:31.333' AS DateTime), CAST(N'2021-08-17T23:17:31.333' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (5, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BCH', CAST(N'2021-08-17T23:17:38.740' AS DateTime), CAST(N'2021-08-17T23:17:38.740' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (6, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'ETH', CAST(N'2021-08-19T22:01:29.587' AS DateTime), CAST(N'2021-08-19T22:01:29.587' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (7, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-08-20T00:31:33.987' AS DateTime), CAST(N'2021-08-20T00:31:33.987' AS DateTime), N'6fa096b26a6a4ae3a6de1493754770d0')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (8, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-08-20T00:31:33.997' AS DateTime), CAST(N'2021-08-20T00:31:33.997' AS DateTime), N'a553667ff2864698bb4cc40b4ff0a2a1')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (9, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00023000000000000000 AS Decimal(38, 20)), N'LTC', CAST(N'2021-08-20T22:47:07.860' AS DateTime), CAST(N'2021-08-20T22:47:07.860' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (10, N'e0519b6d-3a94-43b2-b423-fc4891246a93', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-08-24T22:19:00.830' AS DateTime), CAST(N'2021-08-24T22:19:00.830' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (11, N'e0519b6d-3a94-43b2-b423-fc4891246a93', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'LTC', CAST(N'2021-08-24T22:19:08.453' AS DateTime), CAST(N'2021-08-24T22:19:08.453' AS DateTime), NULL)
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (12, N'8082acc0-2a64-4983-9227-9ea395279df3', CAST(0.00071660000000000000 AS Decimal(38, 20)), N'LTC', CAST(N'2021-08-25T18:52:09.220' AS DateTime), CAST(N'2021-08-25T18:52:09.220' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DF_Currencies_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_UsersEvents_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_UsersEvents_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[Exceptions] ADD  CONSTRAINT [DF_Exceptions_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_New_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_New_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Transfers] ADD  CONSTRAINT [DF_Transfers_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAdd_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

insert into BTC_USDT_OpenOrders (IsBuy, Price, Amount, Total, CreateUserId)
values (@isBuy, @price, @amount, @price * @amount, @userid)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20),
@comment nvarchar(450),
@whenDate datetime
AS
BEGIN

insert into Events (UserId, Type, Value, Comment, WhenDate)
values (@userid, @type, @value, @comment, @whenDate)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateIncomeTransaction]
@currencyAcronim nvarchar(10),
@transactionId nvarchar(max),
@amount decimal(38, 20),
@transactionFee decimal(38, 20),
@toAddress nvarchar(max),
@date float,
@userId nvarchar(450),
@incomeWalletId int,
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO IncomeTransactions(CurrencyAcronim, TransactionId, Amount,
TransactionFee, ToAddress, Date, UserId, IncomeWalletsId)
VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee,
@toAddress, @date, @userId, @incomeWalletId)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateUserIncomeWallet]
@userid nvarchar(450),
@address nvarchar(max),
@addressLabel nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO IncomeWallets (UserId, Address, AddressLabel, CurrencyAcronim)
VALUES (@userid, @address, @addressLabel, @currencyAcronim)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

--Создаём внутренний кошелёк, если его не было
--insert wallet if not exist
If Not Exists(SELECT 1 FROM Wallets WHERE UserId = @userid AND CurrencyAcronim = @currencyAcronim)
Begin
INSERT INTO Wallets (UserId, CurrencyAcronim, Value)
VALUES (@userid, @currencyAcronim, 0)
End

RETURN

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateUserWallet]
@userid nvarchar(450),
@address nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO Wallets (UserId, Address, CurrencyAcronim, Value)
VALUES (@userid, @address, @currencyAcronim, 0)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate Desc

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_ClosedOrders_Top100]
AS
BEGIN

select top 100 buco.*
from   [BTC_USDT_ClosedOrders] buco
order by buco.ClosedDate desc

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE OpenOrderId = @openOrderId

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate Desc

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy, 
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount,
	(SELECT SUM(D3.Price * D3.Amount)
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D3
	WHERE D3.Price = D1.Price) AS Total
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
WHERE D1.IsBuy = 1
GROUP BY  D1.Price, D1.IsBuy
ORDER BY  Price desc

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy, 
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount,
	(SELECT SUM(D3.Price * D3.Amount)
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D3
	WHERE D3.Price = D1.Price) AS Total
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
WHERE D1.IsBuy = 0
GROUP BY  D1.Price, D1.IsBuy
ORDER BY  Price


END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetEventsByUserIdWithOrderByDescWhenDate]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate Desc


END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLastIncomeTransactionsByUserId]
@userid nvarchar(450)
AS
BEGIN

Select transactions.* From IncomeTransactions transactions
	Inner join ( SELECT transactionGroup.CurrencyAcronim, max(transactionGroup.Id) LastId
				 FROM IncomeTransactions transactionGroup
				 WHERE transactionGroup.UserId = @userid
				 GROUP BY transactionGroup.CurrencyAcronim)
	transactionMaxIdByAcronim
	On transactions.Id = transactionMaxIdByAcronim.LastId
	
END







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetTop100_BTC_USDT_ClosedOrders]
AS
BEGIN

select top 100 buco.ClosedDate, buco.IsBuy, buco.Price, buco.Amount
from   [BTC_USDT_ClosedOrders] buco
order by buco.ClosedDate desc

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserIncomeWallets]
@userid nvarchar(450)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

SELECT iw.[Id]
      ,iw.[UserId]
      ,iw.[Address]
      ,iw.[AddressLabel]
      ,iw.[CurrencyAcronim]
      ,iw.[Created]
      ,iw.[LastUpdate]
  FROM [IncomeWallets] iw
  where iw.[UserId] = @userid

END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserWalletByAcronim]
@userId nvarchar(450),
@acronim nvarchar(450)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

SELECT w.[Id]
      ,w.[UserId]
      ,w.[Value]
      ,w.CurrencyAcronim
	  ,w.[Created]
	  ,w.[LastUpdate]
	  ,w.[Address]
  FROM [Wallets] w
  where w.[UserId] = @userid AND w.CurrencyAcronim = @acronim

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUserWallets]
@userid nvarchar(450)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

SELECT w.[Id]
      ,w.[UserId]
      ,w.[Value]
      ,w.CurrencyAcronim
	  ,w.[Created]
	  ,w.[LastUpdate]
	  ,w.[Address]
  FROM [Wallets] w
  where w.[UserId] = @userid

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMove_BTC_USDT_FromOpenOrdersToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from BTC_USDT_OpenOrders WHERE OpenOrderId = @closedOrderId

insert into BTC_USDT_ClosedOrders (ClosedOrderId, Total, CreateDate, ClosedDate, IsBuy, Price, Amount, CreateUserId, BoughtUserId, Status)
values (@closedOrderId, @total, @createDate, getdate(), @isBuy, @price, @amount, @createUserId, @boughtUserId, @status)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdate_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@openOrderId bigint
AS
BEGIN

UPDATE [BTC_USDT_OpenOrders]
SET    IsBuy = @isBuy,
       Price = @price,
       Amount = @amount,
	   Total = @total,
       CreateUserId = @userid
WHERE  OpenOrderId = @openOrderId 

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateWalletBalance]
@newWalletBalance decimal(38,20),
@walletId    INT    OUTPUT
AS
BEGIN

UPDATE Wallets
SET Value = @newWalletBalance
WHERE Id = @walletId

RETURN

END

GO
USE [master]
GO
ALTER DATABASE [Exchange] SET  READ_WRITE 
GO
