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
CREATE TABLE [dbo].[Table_1](
	[gdate] [datetime] NULL
) ON [PRIMARY]
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
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (2, CAST(N'2021-05-21T00:26:20.780' AS DateTime), CAST(N'2021-08-11T23:19:39.793' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (3, CAST(N'2021-05-21T00:29:38.720' AS DateTime), CAST(N'2021-08-11T20:04:26.400' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (4, CAST(N'2021-05-21T00:30:37.980' AS DateTime), CAST(N'2021-08-11T19:54:33.300' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (5, CAST(N'2021-05-21T00:32:33.493' AS DateTime), CAST(N'2021-08-11T23:19:41.610' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (6, CAST(N'2021-08-05T23:39:54.570' AS DateTime), CAST(N'2021-08-11T23:34:33.993' AS DateTime), 1, CAST(7000.00000000000000000000 AS Decimal(38, 20)), CAST(200.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (7, CAST(N'2021-08-05T23:40:44.653' AS DateTime), CAST(N'2021-08-11T23:34:49.953' AS DateTime), 1, CAST(1000.00000000000000000000 AS Decimal(38, 20)), CAST(800.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (8, CAST(N'2021-08-05T23:41:15.250' AS DateTime), CAST(N'2021-08-11T23:34:38.420' AS DateTime), 1, CAST(5000.00000000000000000000 AS Decimal(38, 20)), CAST(90.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (9, CAST(N'2021-08-05T23:42:06.980' AS DateTime), CAST(N'2021-08-11T23:34:24.287' AS DateTime), 1, CAST(500078.00000000000000000000 AS Decimal(38, 20)), CAST(990.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (11, CAST(N'2021-08-06T19:29:46.167' AS DateTime), CAST(N'2021-08-11T23:34:58.423' AS DateTime), 1, CAST(400.00000000000000000000 AS Decimal(38, 20)), CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (19, CAST(N'2021-08-06T23:58:04.977' AS DateTime), CAST(N'2021-08-11T23:34:44.893' AS DateTime), 1, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (20, CAST(N'2021-08-06T23:58:20.430' AS DateTime), CAST(N'2021-08-14T01:23:56.690' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (36, CAST(N'2021-08-07T00:19:18.737' AS DateTime), CAST(N'2021-08-11T19:05:14.293' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37, CAST(N'2021-08-07T00:19:18.990' AS DateTime), CAST(N'2021-08-11T19:05:23.467' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38, CAST(N'2021-08-07T00:19:19.140' AS DateTime), CAST(N'2021-08-11T19:05:26.403' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (39, CAST(N'2021-08-07T00:19:19.300' AS DateTime), CAST(N'2021-08-11T19:05:26.933' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (40, CAST(N'2021-08-07T00:19:19.470' AS DateTime), CAST(N'2021-08-11T19:05:27.150' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (41, CAST(N'2021-08-07T00:19:19.633' AS DateTime), CAST(N'2021-08-11T19:05:27.317' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (42, CAST(N'2021-08-07T00:19:19.783' AS DateTime), CAST(N'2021-08-11T19:05:27.473' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (49, CAST(N'2021-08-07T00:19:26.027' AS DateTime), CAST(N'2021-08-11T23:18:57.487' AS DateTime), 0, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (50, CAST(N'2021-08-07T00:19:53.300' AS DateTime), CAST(N'2021-08-11T23:18:58.510' AS DateTime), 0, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (55, CAST(N'2021-08-07T00:21:09.637' AS DateTime), CAST(N'2021-08-11T19:05:27.630' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (56, CAST(N'2021-08-07T01:47:24.890' AS DateTime), CAST(N'2021-08-11T19:05:27.777' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (68, CAST(N'2021-08-07T22:30:30.210' AS DateTime), CAST(N'2021-08-11T19:05:30.437' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (69, CAST(N'2021-08-07T22:30:30.360' AS DateTime), CAST(N'2021-08-11T19:05:30.843' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (70, CAST(N'2021-08-07T22:30:30.527' AS DateTime), CAST(N'2021-08-11T19:05:31.050' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (71, CAST(N'2021-08-07T22:30:30.663' AS DateTime), CAST(N'2021-08-11T19:05:31.213' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (72, CAST(N'2021-08-07T22:30:30.797' AS DateTime), CAST(N'2021-08-11T19:05:31.377' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (73, CAST(N'2021-08-07T22:30:30.947' AS DateTime), CAST(N'2021-08-11T19:05:31.930' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (74, CAST(N'2021-08-07T22:30:31.073' AS DateTime), CAST(N'2021-08-11T19:05:37.657' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (86, CAST(N'2021-08-10T02:08:49.377' AS DateTime), CAST(N'2021-08-14T01:18:29.827' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (87, CAST(N'2021-08-10T02:08:54.020' AS DateTime), CAST(N'2021-08-14T01:18:31.287' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (88, CAST(N'2021-08-10T02:08:54.177' AS DateTime), CAST(N'2021-08-14T01:18:32.280' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (89, CAST(N'2021-08-10T02:08:54.303' AS DateTime), CAST(N'2021-08-14T01:18:32.507' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (90, CAST(N'2021-08-10T02:08:54.850' AS DateTime), CAST(N'2021-08-14T01:18:32.787' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (94, CAST(N'2021-08-10T02:08:57.700' AS DateTime), CAST(N'2021-08-11T23:35:46.720' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(12.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (95, CAST(N'2021-08-10T02:08:57.850' AS DateTime), CAST(N'2021-08-11T23:35:46.730' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(12.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (102, CAST(N'2021-08-10T19:00:38.330' AS DateTime), CAST(N'2021-08-11T19:05:37.893' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (110, CAST(N'2021-08-10T19:00:52.987' AS DateTime), CAST(N'2021-08-11T19:05:38.057' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (111, CAST(N'2021-08-10T19:01:32.237' AS DateTime), CAST(N'2021-08-11T19:05:38.213' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (112, CAST(N'2021-08-10T19:02:28.253' AS DateTime), CAST(N'2021-08-11T19:05:38.357' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (116, CAST(N'2021-08-10T19:04:08.027' AS DateTime), CAST(N'2021-08-11T19:05:42.347' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (117, CAST(N'2021-08-10T19:04:08.173' AS DateTime), CAST(N'2021-08-11T19:05:42.507' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (118, CAST(N'2021-08-10T19:04:08.347' AS DateTime), CAST(N'2021-08-11T19:05:42.653' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (119, CAST(N'2021-08-10T19:04:08.530' AS DateTime), CAST(N'2021-08-11T19:05:42.807' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (120, CAST(N'2021-08-10T19:04:08.660' AS DateTime), CAST(N'2021-08-11T19:05:42.963' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (124, CAST(N'2021-08-10T19:04:33.273' AS DateTime), CAST(N'2021-08-11T19:05:43.120' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (125, CAST(N'2021-08-10T19:05:30.280' AS DateTime), CAST(N'2021-08-11T19:05:43.277' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (126, CAST(N'2021-08-10T19:05:31.387' AS DateTime), CAST(N'2021-08-11T19:05:43.430' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (128, CAST(N'2021-08-10T19:05:37.060' AS DateTime), CAST(N'2021-08-11T19:05:43.587' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (132, CAST(N'2021-08-10T19:09:17.640' AS DateTime), CAST(N'2021-08-11T19:06:18.537' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (133, CAST(N'2021-08-10T19:09:19.743' AS DateTime), CAST(N'2021-08-11T19:09:10.923' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (134, CAST(N'2021-08-10T19:09:19.930' AS DateTime), CAST(N'2021-08-11T19:09:11.510' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (135, CAST(N'2021-08-10T19:09:20.087' AS DateTime), CAST(N'2021-08-11T19:09:11.730' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (136, CAST(N'2021-08-10T19:09:23.470' AS DateTime), CAST(N'2021-08-11T19:09:13.347' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (138, CAST(N'2021-08-10T19:17:29.670' AS DateTime), CAST(N'2021-08-11T19:09:15.030' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (139, CAST(N'2021-08-10T19:17:34.423' AS DateTime), CAST(N'2021-08-11T19:09:16.020' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (140, CAST(N'2021-08-10T19:17:47.083' AS DateTime), CAST(N'2021-08-11T19:09:48.353' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (143, CAST(N'2021-08-10T19:22:58.993' AS DateTime), CAST(N'2021-08-11T19:09:48.643' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (156, CAST(N'2021-08-11T19:04:57.737' AS DateTime), CAST(N'2021-08-11T19:05:01.770' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (157, CAST(N'2021-08-11T19:05:20.883' AS DateTime), CAST(N'2021-08-11T19:05:23.463' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (158, CAST(N'2021-08-11T19:05:26.390' AS DateTime), CAST(N'2021-08-11T19:05:26.397' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (159, CAST(N'2021-08-11T19:05:26.923' AS DateTime), CAST(N'2021-08-11T19:05:26.927' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (160, CAST(N'2021-08-11T19:05:27.140' AS DateTime), CAST(N'2021-08-11T19:05:27.147' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (161, CAST(N'2021-08-11T19:05:27.307' AS DateTime), CAST(N'2021-08-11T19:05:27.313' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (162, CAST(N'2021-08-11T19:05:27.463' AS DateTime), CAST(N'2021-08-11T19:05:27.470' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (163, CAST(N'2021-08-11T19:05:27.620' AS DateTime), CAST(N'2021-08-11T19:05:27.623' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (164, CAST(N'2021-08-11T19:05:27.767' AS DateTime), CAST(N'2021-08-11T19:05:27.773' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (165, CAST(N'2021-08-11T19:05:28.317' AS DateTime), CAST(N'2021-08-11T19:09:48.810' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (166, CAST(N'2021-08-11T19:05:28.710' AS DateTime), CAST(N'2021-08-11T19:09:48.960' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (167, CAST(N'2021-08-11T19:05:28.963' AS DateTime), CAST(N'2021-08-11T19:09:49.113' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (168, CAST(N'2021-08-11T19:05:29.287' AS DateTime), CAST(N'2021-08-11T19:09:49.570' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (169, CAST(N'2021-08-11T19:05:29.550' AS DateTime), CAST(N'2021-08-11T19:11:18.473' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (170, CAST(N'2021-08-11T19:05:29.717' AS DateTime), CAST(N'2021-08-11T19:13:50.813' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (171, CAST(N'2021-08-11T19:05:29.860' AS DateTime), CAST(N'2021-08-11T19:13:54.817' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (172, CAST(N'2021-08-11T19:05:30.003' AS DateTime), CAST(N'2021-08-11T19:25:18.553' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (173, CAST(N'2021-08-11T19:05:30.427' AS DateTime), CAST(N'2021-08-11T19:05:30.433' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (174, CAST(N'2021-08-11T19:05:30.833' AS DateTime), CAST(N'2021-08-11T19:05:30.840' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (175, CAST(N'2021-08-11T19:05:31.040' AS DateTime), CAST(N'2021-08-11T19:05:31.047' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (176, CAST(N'2021-08-11T19:05:31.203' AS DateTime), CAST(N'2021-08-11T19:05:31.207' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (177, CAST(N'2021-08-11T19:05:31.367' AS DateTime), CAST(N'2021-08-11T19:05:31.373' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (178, CAST(N'2021-08-11T19:05:31.923' AS DateTime), CAST(N'2021-08-11T19:05:31.927' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (179, CAST(N'2021-08-11T19:05:34.203' AS DateTime), CAST(N'2021-08-11T19:25:25.867' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (180, CAST(N'2021-08-11T19:05:34.493' AS DateTime), CAST(N'2021-08-11T19:32:13.347' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (181, CAST(N'2021-08-11T19:05:37.650' AS DateTime), CAST(N'2021-08-11T19:05:37.653' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (182, CAST(N'2021-08-11T19:05:37.887' AS DateTime), CAST(N'2021-08-11T19:05:37.890' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (183, CAST(N'2021-08-11T19:05:38.050' AS DateTime), CAST(N'2021-08-11T19:05:38.053' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (184, CAST(N'2021-08-11T19:05:38.203' AS DateTime), CAST(N'2021-08-11T19:05:38.207' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (185, CAST(N'2021-08-11T19:05:38.347' AS DateTime), CAST(N'2021-08-11T19:05:38.350' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (186, CAST(N'2021-08-11T19:05:38.990' AS DateTime), CAST(N'2021-08-11T19:32:37.270' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (187, CAST(N'2021-08-11T19:05:42.337' AS DateTime), CAST(N'2021-08-11T19:05:42.343' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (188, CAST(N'2021-08-11T19:05:42.497' AS DateTime), CAST(N'2021-08-11T19:05:42.500' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (189, CAST(N'2021-08-11T19:05:42.647' AS DateTime), CAST(N'2021-08-11T19:05:42.650' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (190, CAST(N'2021-08-11T19:05:42.800' AS DateTime), CAST(N'2021-08-11T19:05:42.803' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (191, CAST(N'2021-08-11T19:05:42.953' AS DateTime), CAST(N'2021-08-11T19:05:42.960' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (192, CAST(N'2021-08-11T19:05:43.110' AS DateTime), CAST(N'2021-08-11T19:05:43.117' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (193, CAST(N'2021-08-11T19:05:43.267' AS DateTime), CAST(N'2021-08-11T19:05:43.273' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (194, CAST(N'2021-08-11T19:05:43.423' AS DateTime), CAST(N'2021-08-11T19:05:43.427' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (195, CAST(N'2021-08-11T19:05:43.577' AS DateTime), CAST(N'2021-08-11T19:05:43.583' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (196, CAST(N'2021-08-11T19:05:44.320' AS DateTime), CAST(N'2021-08-11T19:34:56.280' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (197, CAST(N'2021-08-11T19:06:18.520' AS DateTime), CAST(N'2021-08-11T19:06:18.530' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (198, CAST(N'2021-08-11T19:06:20.920' AS DateTime), CAST(N'2021-08-11T19:37:03.110' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (199, CAST(N'2021-08-11T19:09:10.350' AS DateTime), CAST(N'2021-08-11T19:09:10.633' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (200, CAST(N'2021-08-11T19:09:11.497' AS DateTime), CAST(N'2021-08-11T19:09:11.503' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (201, CAST(N'2021-08-11T19:09:11.720' AS DateTime), CAST(N'2021-08-11T19:09:11.723' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (202, CAST(N'2021-08-11T19:09:13.337' AS DateTime), CAST(N'2021-08-11T19:09:13.343' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (203, CAST(N'2021-08-11T19:09:13.760' AS DateTime), CAST(N'2021-08-11T19:40:38.523' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (204, CAST(N'2021-08-11T19:09:15.017' AS DateTime), CAST(N'2021-08-11T19:09:15.023' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (205, CAST(N'2021-08-11T19:09:15.353' AS DateTime), CAST(N'2021-08-11T19:42:34.000' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (206, CAST(N'2021-08-11T19:09:16.007' AS DateTime), CAST(N'2021-08-11T19:09:16.013' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (213, CAST(N'2021-08-11T19:09:48.340' AS DateTime), CAST(N'2021-08-11T19:09:48.347' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (214, CAST(N'2021-08-11T19:09:48.633' AS DateTime), CAST(N'2021-08-11T19:09:48.640' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (215, CAST(N'2021-08-11T19:09:48.800' AS DateTime), CAST(N'2021-08-11T19:09:48.803' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (216, CAST(N'2021-08-11T19:09:48.950' AS DateTime), CAST(N'2021-08-11T19:09:48.957' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (217, CAST(N'2021-08-11T19:09:49.103' AS DateTime), CAST(N'2021-08-11T19:09:49.110' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (218, CAST(N'2021-08-11T19:09:49.563' AS DateTime), CAST(N'2021-08-11T19:09:49.567' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (221, CAST(N'2021-08-11T19:11:18.137' AS DateTime), CAST(N'2021-08-11T19:11:18.163' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (222, CAST(N'2021-08-11T19:13:50.227' AS DateTime), CAST(N'2021-08-11T19:13:50.517' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (223, CAST(N'2021-08-11T19:13:54.803' AS DateTime), CAST(N'2021-08-11T19:13:54.810' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (225, CAST(N'2021-08-11T19:25:17.950' AS DateTime), CAST(N'2021-08-11T19:25:18.243' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (227, CAST(N'2021-08-11T19:25:25.857' AS DateTime), CAST(N'2021-08-11T19:25:25.860' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (228, CAST(N'2021-08-11T19:31:49.587' AS DateTime), CAST(N'2021-08-11T19:32:09.067' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (229, CAST(N'2021-08-11T19:32:27.303' AS DateTime), CAST(N'2021-08-11T19:32:32.220' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (230, CAST(N'2021-08-11T19:34:53.083' AS DateTime), CAST(N'2021-08-11T19:34:55.173' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (231, CAST(N'2021-08-11T19:35:56.393' AS DateTime), CAST(N'2021-08-11T19:35:59.657' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (232, CAST(N'2021-08-11T19:40:06.453' AS DateTime), CAST(N'2021-08-11T19:40:23.097' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (233, CAST(N'2021-08-11T19:42:14.203' AS DateTime), CAST(N'2021-08-11T19:42:24.857' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (234, CAST(N'2021-08-11T19:43:06.977' AS DateTime), CAST(N'2021-08-11T19:43:07.487' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (235, CAST(N'2021-08-11T19:43:07.477' AS DateTime), CAST(N'2021-08-11T19:43:07.483' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (236, CAST(N'2021-08-11T19:43:08.110' AS DateTime), CAST(N'2021-08-11T19:43:08.343' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (237, CAST(N'2021-08-11T19:43:08.337' AS DateTime), CAST(N'2021-08-11T19:43:08.340' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (238, CAST(N'2021-08-11T19:43:08.593' AS DateTime), CAST(N'2021-08-11T19:43:08.820' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (239, CAST(N'2021-08-11T19:43:08.807' AS DateTime), CAST(N'2021-08-11T19:43:08.813' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (240, CAST(N'2021-08-11T19:50:53.797' AS DateTime), CAST(N'2021-08-11T19:54:01.597' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (241, CAST(N'2021-08-11T19:51:09.330' AS DateTime), CAST(N'2021-08-11T19:59:33.530' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (242, CAST(N'2021-08-11T19:52:18.763' AS DateTime), CAST(N'2021-08-11T19:59:33.563' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (243, CAST(N'2021-08-11T19:53:19.933' AS DateTime), CAST(N'2021-08-11T19:53:56.650' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (244, CAST(N'2021-08-11T19:54:33.293' AS DateTime), CAST(N'2021-08-11T19:54:33.307' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (245, CAST(N'2021-08-11T19:54:43.497' AS DateTime), CAST(N'2021-08-11T20:02:02.997' AS DateTime), 0, CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (246, CAST(N'2021-08-11T19:54:53.137' AS DateTime), CAST(N'2021-08-11T20:01:51.333' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (247, CAST(N'2021-08-11T19:55:16.460' AS DateTime), CAST(N'2021-08-11T19:59:33.580' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (248, CAST(N'2021-08-11T19:55:51.360' AS DateTime), CAST(N'2021-08-11T19:59:33.760' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (249, CAST(N'2021-08-11T19:56:54.250' AS DateTime), CAST(N'2021-08-11T19:59:33.940' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (250, CAST(N'2021-08-11T19:57:29.473' AS DateTime), CAST(N'2021-08-11T19:59:34.103' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (251, CAST(N'2021-08-11T19:59:00.997' AS DateTime), CAST(N'2021-08-11T19:59:34.233' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (252, CAST(N'2021-08-11T19:59:28.180' AS DateTime), CAST(N'2021-08-11T20:02:07.710' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (253, CAST(N'2021-08-11T19:59:29.383' AS DateTime), CAST(N'2021-08-11T20:02:07.723' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (255, CAST(N'2021-08-11T19:59:29.697' AS DateTime), CAST(N'2021-08-11T20:02:10.927' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (256, CAST(N'2021-08-11T19:59:29.850' AS DateTime), CAST(N'2021-08-11T20:02:10.943' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (258, CAST(N'2021-08-11T19:59:33.177' AS DateTime), CAST(N'2021-08-11T19:59:33.210' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (259, CAST(N'2021-08-11T19:59:33.543' AS DateTime), CAST(N'2021-08-11T19:59:33.553' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (260, CAST(N'2021-08-11T19:59:33.570' AS DateTime), CAST(N'2021-08-11T19:59:33.573' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (261, CAST(N'2021-08-11T19:59:33.740' AS DateTime), CAST(N'2021-08-11T19:59:33.750' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (262, CAST(N'2021-08-11T19:59:33.917' AS DateTime), CAST(N'2021-08-11T19:59:33.930' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (263, CAST(N'2021-08-11T19:59:34.083' AS DateTime), CAST(N'2021-08-11T19:59:34.093' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (264, CAST(N'2021-08-11T19:59:34.227' AS DateTime), CAST(N'2021-08-11T19:59:34.240' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (279, CAST(N'2021-08-11T19:59:42.100' AS DateTime), CAST(N'2021-08-11T20:01:52.650' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (293, CAST(N'2021-08-11T20:00:06.247' AS DateTime), CAST(N'2021-08-11T20:01:56.587' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (295, CAST(N'2021-08-11T20:01:49.913' AS DateTime), CAST(N'2021-08-11T20:01:49.923' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (296, CAST(N'2021-08-11T20:01:51.320' AS DateTime), CAST(N'2021-08-11T20:01:51.340' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (297, CAST(N'2021-08-11T20:01:51.947' AS DateTime), CAST(N'2021-08-11T20:01:51.950' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (298, CAST(N'2021-08-11T20:01:52.637' AS DateTime), CAST(N'2021-08-11T20:01:52.643' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (299, CAST(N'2021-08-11T20:01:53.397' AS DateTime), CAST(N'2021-08-11T20:01:57.000' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (300, CAST(N'2021-08-11T20:01:54.703' AS DateTime), CAST(N'2021-08-11T20:01:57.460' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (301, CAST(N'2021-08-11T20:01:56.573' AS DateTime), CAST(N'2021-08-11T20:01:56.580' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (302, CAST(N'2021-08-11T20:01:56.987' AS DateTime), CAST(N'2021-08-11T20:01:56.993' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (303, CAST(N'2021-08-11T20:01:57.447' AS DateTime), CAST(N'2021-08-11T20:01:57.453' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (304, CAST(N'2021-08-11T20:02:02.983' AS DateTime), CAST(N'2021-08-11T20:02:02.990' AS DateTime), 1, CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (306, CAST(N'2021-08-11T20:02:07.697' AS DateTime), CAST(N'2021-08-11T20:02:07.717' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (307, CAST(N'2021-08-11T20:02:10.193' AS DateTime), CAST(N'2021-08-11T20:02:14.090' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (308, CAST(N'2021-08-11T20:02:10.913' AS DateTime), CAST(N'2021-08-11T20:02:10.937' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (309, CAST(N'2021-08-11T20:02:14.077' AS DateTime), CAST(N'2021-08-11T20:02:14.083' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (310, CAST(N'2021-08-11T20:02:15.027' AS DateTime), CAST(N'2021-08-11T20:02:16.570' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (311, CAST(N'2021-08-11T20:02:15.557' AS DateTime), CAST(N'2021-08-11T20:02:17.367' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (312, CAST(N'2021-08-11T20:02:15.917' AS DateTime), CAST(N'2021-08-11T20:02:18.013' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (313, CAST(N'2021-08-11T20:02:16.557' AS DateTime), CAST(N'2021-08-11T20:02:16.563' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (314, CAST(N'2021-08-11T20:02:17.357' AS DateTime), CAST(N'2021-08-11T20:02:17.363' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (315, CAST(N'2021-08-11T20:02:18.003' AS DateTime), CAST(N'2021-08-11T20:02:18.007' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (316, CAST(N'2021-08-11T20:02:18.560' AS DateTime), CAST(N'2021-08-11T20:02:19.633' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (317, CAST(N'2021-08-11T20:02:18.710' AS DateTime), CAST(N'2021-08-11T20:02:19.830' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (318, CAST(N'2021-08-11T20:02:18.867' AS DateTime), CAST(N'2021-08-11T20:02:19.997' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (319, CAST(N'2021-08-11T20:02:19.017' AS DateTime), CAST(N'2021-08-11T20:02:20.157' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (320, CAST(N'2021-08-11T20:02:19.170' AS DateTime), CAST(N'2021-08-11T20:02:20.307' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (321, CAST(N'2021-08-11T20:02:19.283' AS DateTime), CAST(N'2021-08-11T20:02:20.670' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (322, CAST(N'2021-08-11T20:02:19.620' AS DateTime), CAST(N'2021-08-11T20:02:19.627' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (323, CAST(N'2021-08-11T20:02:19.817' AS DateTime), CAST(N'2021-08-11T20:02:19.823' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (324, CAST(N'2021-08-11T20:02:19.983' AS DateTime), CAST(N'2021-08-11T20:02:19.990' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (325, CAST(N'2021-08-11T20:02:20.143' AS DateTime), CAST(N'2021-08-11T20:02:20.150' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (326, CAST(N'2021-08-11T20:02:20.293' AS DateTime), CAST(N'2021-08-11T20:02:20.300' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (327, CAST(N'2021-08-11T20:02:20.657' AS DateTime), CAST(N'2021-08-11T20:02:20.663' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (328, CAST(N'2021-08-11T20:02:23.103' AS DateTime), CAST(N'2021-08-11T20:02:24.237' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (329, CAST(N'2021-08-11T20:02:24.223' AS DateTime), CAST(N'2021-08-11T20:02:24.227' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (330, CAST(N'2021-08-11T20:02:24.920' AS DateTime), CAST(N'2021-08-11T20:02:26.530' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (331, CAST(N'2021-08-11T20:02:26.523' AS DateTime), CAST(N'2021-08-11T20:02:26.537' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (333, CAST(N'2021-08-11T20:02:32.570' AS DateTime), CAST(N'2021-08-11T20:04:12.717' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (334, CAST(N'2021-08-11T20:02:34.207' AS DateTime), CAST(N'2021-08-11T20:04:13.563' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (335, CAST(N'2021-08-11T20:02:44.600' AS DateTime), CAST(N'2021-08-11T20:04:07.030' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (336, CAST(N'2021-08-11T20:04:04.477' AS DateTime), CAST(N'2021-08-11T20:04:07.067' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (337, CAST(N'2021-08-11T20:04:09.777' AS DateTime), CAST(N'2021-08-11T20:04:09.790' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (338, CAST(N'2021-08-11T20:04:10.680' AS DateTime), CAST(N'2021-08-11T20:04:14.147' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (339, CAST(N'2021-08-11T20:04:11.050' AS DateTime), CAST(N'2021-08-11T20:04:14.597' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (340, CAST(N'2021-08-11T20:04:11.190' AS DateTime), CAST(N'2021-08-11T20:04:15.007' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (342, CAST(N'2021-08-11T20:04:12.097' AS DateTime), CAST(N'2021-08-11T20:04:12.103' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (343, CAST(N'2021-08-11T20:04:12.707' AS DateTime), CAST(N'2021-08-11T20:04:12.720' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (344, CAST(N'2021-08-11T20:04:13.070' AS DateTime), CAST(N'2021-08-11T20:04:13.077' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (345, CAST(N'2021-08-11T20:04:13.550' AS DateTime), CAST(N'2021-08-11T20:04:13.553' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (346, CAST(N'2021-08-11T20:04:14.127' AS DateTime), CAST(N'2021-08-11T20:04:14.133' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (347, CAST(N'2021-08-11T20:04:14.583' AS DateTime), CAST(N'2021-08-11T20:04:14.590' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (348, CAST(N'2021-08-11T20:04:14.997' AS DateTime), CAST(N'2021-08-11T20:04:15.003' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (349, CAST(N'2021-08-11T20:04:15.913' AS DateTime), CAST(N'2021-08-11T20:04:17.433' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (350, CAST(N'2021-08-11T20:04:16.060' AS DateTime), CAST(N'2021-08-11T20:04:17.683' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (351, CAST(N'2021-08-11T20:04:16.200' AS DateTime), CAST(N'2021-08-11T20:04:17.857' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (352, CAST(N'2021-08-11T20:04:16.350' AS DateTime), CAST(N'2021-08-11T20:04:18.123' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (353, CAST(N'2021-08-11T20:04:16.500' AS DateTime), CAST(N'2021-08-11T20:04:18.473' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (354, CAST(N'2021-08-11T20:04:16.640' AS DateTime), CAST(N'2021-08-11T20:04:18.727' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (355, CAST(N'2021-08-11T20:04:16.793' AS DateTime), CAST(N'2021-08-11T20:04:18.973' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (356, CAST(N'2021-08-11T20:04:16.937' AS DateTime), CAST(N'2021-08-11T20:04:19.173' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (357, CAST(N'2021-08-11T20:04:17.077' AS DateTime), CAST(N'2021-08-11T20:04:19.317' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (358, CAST(N'2021-08-11T20:04:17.420' AS DateTime), CAST(N'2021-08-11T20:04:17.427' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (359, CAST(N'2021-08-11T20:04:17.663' AS DateTime), CAST(N'2021-08-11T20:04:17.673' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (360, CAST(N'2021-08-11T20:04:17.847' AS DateTime), CAST(N'2021-08-11T20:04:17.850' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (361, CAST(N'2021-08-11T20:04:18.107' AS DateTime), CAST(N'2021-08-11T20:04:18.113' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (362, CAST(N'2021-08-11T20:04:18.457' AS DateTime), CAST(N'2021-08-11T20:04:18.463' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (363, CAST(N'2021-08-11T20:04:18.713' AS DateTime), CAST(N'2021-08-11T20:04:18.720' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (364, CAST(N'2021-08-11T20:04:18.957' AS DateTime), CAST(N'2021-08-11T20:04:18.967' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (365, CAST(N'2021-08-11T20:04:19.147' AS DateTime), CAST(N'2021-08-11T20:04:19.163' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (366, CAST(N'2021-08-11T20:04:19.303' AS DateTime), CAST(N'2021-08-11T20:04:19.310' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (367, CAST(N'2021-08-11T20:04:23.987' AS DateTime), CAST(N'2021-08-11T20:04:26.773' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (368, CAST(N'2021-08-11T20:04:26.387' AS DateTime), CAST(N'2021-08-11T20:04:26.390' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (369, CAST(N'2021-08-11T20:04:26.760' AS DateTime), CAST(N'2021-08-11T20:04:26.767' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (370, CAST(N'2021-08-11T23:18:54.780' AS DateTime), CAST(N'2021-08-11T23:19:00.720' AS DateTime), 0, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (371, CAST(N'2021-08-11T23:18:57.420' AS DateTime), CAST(N'2021-08-11T23:18:57.447' AS DateTime), 1, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (372, CAST(N'2021-08-11T23:18:58.497' AS DateTime), CAST(N'2021-08-11T23:18:58.503' AS DateTime), 1, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (373, CAST(N'2021-08-11T23:19:00.710' AS DateTime), CAST(N'2021-08-11T23:19:00.717' AS DateTime), 1, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (374, CAST(N'2021-08-11T23:19:37.020' AS DateTime), CAST(N'2021-08-14T01:18:16.367' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (375, CAST(N'2021-08-11T23:19:38.573' AS DateTime), CAST(N'2021-08-14T01:18:19.447' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (376, CAST(N'2021-08-11T23:19:39.783' AS DateTime), CAST(N'2021-08-11T23:19:39.800' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (377, CAST(N'2021-08-11T23:19:40.427' AS DateTime), CAST(N'2021-08-11T23:19:40.433' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (378, CAST(N'2021-08-11T23:19:41.600' AS DateTime), CAST(N'2021-08-11T23:19:41.617' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (379, CAST(N'2021-08-11T23:34:23.663' AS DateTime), CAST(N'2021-08-11T23:34:23.987' AS DateTime), 0, CAST(500078.00000000000000000000 AS Decimal(38, 20)), CAST(990.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (380, CAST(N'2021-08-11T23:34:33.973' AS DateTime), CAST(N'2021-08-11T23:34:33.983' AS DateTime), 0, CAST(7000.00000000000000000000 AS Decimal(38, 20)), CAST(200.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (381, CAST(N'2021-08-11T23:34:38.410' AS DateTime), CAST(N'2021-08-11T23:34:38.417' AS DateTime), 0, CAST(5000.00000000000000000000 AS Decimal(38, 20)), CAST(90.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (382, CAST(N'2021-08-11T23:34:44.877' AS DateTime), CAST(N'2021-08-11T23:34:44.900' AS DateTime), 0, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(246.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (383, CAST(N'2021-08-11T23:34:49.943' AS DateTime), CAST(N'2021-08-11T23:34:49.950' AS DateTime), 0, CAST(1000.00000000000000000000 AS Decimal(38, 20)), CAST(800.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (384, CAST(N'2021-08-11T23:34:58.413' AS DateTime), CAST(N'2021-08-11T23:34:58.417' AS DateTime), 0, CAST(400.00000000000000000000 AS Decimal(38, 20)), CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (385, CAST(N'2021-08-11T23:35:46.707' AS DateTime), CAST(N'2021-08-11T23:35:46.727' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (387, CAST(N'2021-08-14T00:52:32.477' AS DateTime), CAST(N'2021-08-14T00:52:34.367' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (388, CAST(N'2021-08-14T00:52:34.247' AS DateTime), CAST(N'2021-08-14T00:52:34.303' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (389, CAST(N'2021-08-14T00:57:49.817' AS DateTime), CAST(N'2021-08-14T01:08:05.243' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (390, CAST(N'2021-08-14T00:57:50.533' AS DateTime), CAST(N'2021-08-14T01:08:07.270' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (391, CAST(N'2021-08-14T01:08:04.653' AS DateTime), CAST(N'2021-08-14T01:08:04.943' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (392, CAST(N'2021-08-14T01:08:06.967' AS DateTime), CAST(N'2021-08-14T01:08:07.917' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (393, CAST(N'2021-08-14T01:08:07.260' AS DateTime), CAST(N'2021-08-14T01:08:07.263' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (394, CAST(N'2021-08-14T01:08:07.907' AS DateTime), CAST(N'2021-08-14T01:08:07.910' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (395, CAST(N'2021-08-14T01:08:08.067' AS DateTime), CAST(N'2021-08-14T01:36:36.510' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (396, CAST(N'2021-08-14T01:08:08.237' AS DateTime), CAST(N'2021-08-14T01:36:37.470' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (397, CAST(N'2021-08-14T01:08:08.533' AS DateTime), CAST(N'2021-08-14T01:36:37.630' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (398, CAST(N'2021-08-14T01:08:08.737' AS DateTime), CAST(N'2021-08-14T01:36:38.037' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (399, CAST(N'2021-08-14T01:08:09.053' AS DateTime), CAST(N'2021-08-14T01:36:42.067' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (400, CAST(N'2021-08-14T01:08:09.240' AS DateTime), CAST(N'2021-08-14T01:36:43.160' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (401, CAST(N'2021-08-14T01:08:09.393' AS DateTime), CAST(N'2021-08-14T01:36:43.630' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (402, CAST(N'2021-08-14T01:08:09.550' AS DateTime), CAST(N'2021-08-14T01:36:45.103' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (403, CAST(N'2021-08-14T01:08:09.713' AS DateTime), CAST(N'2021-08-14T01:36:46.130' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (404, CAST(N'2021-08-14T01:08:09.880' AS DateTime), CAST(N'2021-08-14T01:48:30.040' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (405, CAST(N'2021-08-14T01:08:10.027' AS DateTime), CAST(N'2021-08-14T01:48:44.133' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (406, CAST(N'2021-08-14T01:18:14.157' AS DateTime), CAST(N'2021-08-14T01:18:14.497' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (407, CAST(N'2021-08-14T01:18:16.353' AS DateTime), CAST(N'2021-08-14T01:18:16.360' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (408, CAST(N'2021-08-14T01:18:19.437' AS DateTime), CAST(N'2021-08-14T01:18:19.443' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (410, CAST(N'2021-08-14T01:18:29.820' AS DateTime), CAST(N'2021-08-14T01:18:29.823' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (411, CAST(N'2021-08-14T01:18:31.277' AS DateTime), CAST(N'2021-08-14T01:18:31.280' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (412, CAST(N'2021-08-14T01:18:32.270' AS DateTime), CAST(N'2021-08-14T01:18:32.273' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (413, CAST(N'2021-08-14T01:18:32.500' AS DateTime), CAST(N'2021-08-14T01:18:32.503' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (414, CAST(N'2021-08-14T01:18:32.780' AS DateTime), CAST(N'2021-08-14T01:18:32.783' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (415, CAST(N'2021-08-14T01:22:08.417' AS DateTime), CAST(N'2021-08-14T01:24:10.410' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (416, CAST(N'2021-08-14T01:22:12.887' AS DateTime), CAST(N'2021-08-14T01:22:12.910' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (417, CAST(N'2021-08-14T01:22:13.480' AS DateTime), CAST(N'2021-08-14T01:22:13.493' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (418, CAST(N'2021-08-14T01:22:13.880' AS DateTime), CAST(N'2021-08-14T01:22:13.887' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (419, CAST(N'2021-08-14T01:22:16.263' AS DateTime), CAST(N'2021-08-14T01:22:16.267' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (420, CAST(N'2021-08-14T01:22:17.650' AS DateTime), CAST(N'2021-08-14T01:22:17.657' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (421, CAST(N'2021-08-14T01:22:19.153' AS DateTime), CAST(N'2021-08-14T01:22:19.160' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (422, CAST(N'2021-08-14T01:22:19.630' AS DateTime), CAST(N'2021-08-14T01:22:19.633' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (423, CAST(N'2021-08-14T01:22:19.853' AS DateTime), CAST(N'2021-08-14T01:22:19.860' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (424, CAST(N'2021-08-14T01:22:20.210' AS DateTime), CAST(N'2021-08-14T01:22:20.213' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (425, CAST(N'2021-08-14T01:22:20.590' AS DateTime), CAST(N'2021-08-14T01:22:20.593' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (426, CAST(N'2021-08-14T01:22:20.757' AS DateTime), CAST(N'2021-08-14T01:22:20.763' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (427, CAST(N'2021-08-14T01:22:20.943' AS DateTime), CAST(N'2021-08-14T01:22:20.947' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (428, CAST(N'2021-08-14T01:23:15.310' AS DateTime), CAST(N'2021-08-14T01:23:17.223' AS DateTime), 1, CAST(2.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (429, CAST(N'2021-08-14T01:23:16.193' AS DateTime), CAST(N'2021-08-14T01:23:17.940' AS DateTime), 1, CAST(2.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (430, CAST(N'2021-08-14T01:23:17.213' AS DateTime), CAST(N'2021-08-14T01:23:17.217' AS DateTime), 0, CAST(2.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (431, CAST(N'2021-08-14T01:23:17.930' AS DateTime), CAST(N'2021-08-14T01:23:17.933' AS DateTime), 0, CAST(2.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (432, CAST(N'2021-08-14T01:23:56.147' AS DateTime), CAST(N'2021-08-14T01:23:56.710' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (433, CAST(N'2021-08-14T01:24:10.393' AS DateTime), CAST(N'2021-08-14T01:24:10.400' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (434, CAST(N'2021-08-14T01:24:13.653' AS DateTime), CAST(N'2021-08-14T01:24:15.313' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (435, CAST(N'2021-08-14T01:24:13.820' AS DateTime), CAST(N'2021-08-14T01:24:15.633' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (436, CAST(N'2021-08-14T01:24:13.980' AS DateTime), CAST(N'2021-08-14T01:24:16.113' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (437, CAST(N'2021-08-14T01:24:14.127' AS DateTime), CAST(N'2021-08-14T01:24:16.547' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (438, CAST(N'2021-08-14T01:24:14.297' AS DateTime), CAST(N'2021-08-14T01:24:16.747' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (439, CAST(N'2021-08-14T01:24:14.450' AS DateTime), CAST(N'2021-08-14T01:24:16.917' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (440, CAST(N'2021-08-14T01:24:14.607' AS DateTime), CAST(N'2021-08-14T01:24:17.073' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (441, CAST(N'2021-08-14T01:24:15.303' AS DateTime), CAST(N'2021-08-14T01:24:15.310' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (442, CAST(N'2021-08-14T01:24:15.627' AS DateTime), CAST(N'2021-08-14T01:24:15.630' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (443, CAST(N'2021-08-14T01:24:16.103' AS DateTime), CAST(N'2021-08-14T01:24:16.110' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (444, CAST(N'2021-08-14T01:24:16.533' AS DateTime), CAST(N'2021-08-14T01:24:16.540' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (445, CAST(N'2021-08-14T01:24:16.737' AS DateTime), CAST(N'2021-08-14T01:24:16.743' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (446, CAST(N'2021-08-14T01:24:16.907' AS DateTime), CAST(N'2021-08-14T01:24:16.913' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (447, CAST(N'2021-08-14T01:24:17.063' AS DateTime), CAST(N'2021-08-14T01:24:17.070' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (448, CAST(N'2021-08-14T01:24:37.833' AS DateTime), CAST(N'2021-08-14T01:25:04.147' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (449, CAST(N'2021-08-14T01:24:40.643' AS DateTime), CAST(N'2021-08-14T01:25:04.143' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (450, CAST(N'2021-08-14T01:25:06.737' AS DateTime), CAST(N'2021-08-14T01:25:37.543' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (451, CAST(N'2021-08-14T01:25:07.010' AS DateTime), CAST(N'2021-08-14T01:25:40.157' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (452, CAST(N'2021-08-14T01:25:07.163' AS DateTime), CAST(N'2021-08-14T01:25:40.327' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (453, CAST(N'2021-08-14T01:25:07.310' AS DateTime), CAST(N'2021-08-14T01:25:40.507' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (454, CAST(N'2021-08-14T01:25:07.467' AS DateTime), CAST(N'2021-08-14T01:25:40.663' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (455, CAST(N'2021-08-14T01:25:07.620' AS DateTime), CAST(N'2021-08-14T01:25:40.840' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (456, CAST(N'2021-08-14T01:25:07.783' AS DateTime), CAST(N'2021-08-14T01:25:40.973' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (457, CAST(N'2021-08-14T01:25:07.943' AS DateTime), CAST(N'2021-08-14T01:25:41.130' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (458, CAST(N'2021-08-14T01:25:08.083' AS DateTime), CAST(N'2021-08-14T01:25:41.293' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (459, CAST(N'2021-08-14T01:25:12.090' AS DateTime), CAST(N'2021-08-14T01:25:37.520' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (460, CAST(N'2021-08-14T01:25:40.147' AS DateTime), CAST(N'2021-08-14T01:25:40.153' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (461, CAST(N'2021-08-14T01:25:40.317' AS DateTime), CAST(N'2021-08-14T01:25:40.320' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (462, CAST(N'2021-08-14T01:25:40.497' AS DateTime), CAST(N'2021-08-14T01:25:40.503' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (463, CAST(N'2021-08-14T01:25:40.657' AS DateTime), CAST(N'2021-08-14T01:25:40.660' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (464, CAST(N'2021-08-14T01:25:40.813' AS DateTime), CAST(N'2021-08-14T01:25:40.820' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (465, CAST(N'2021-08-14T01:25:40.963' AS DateTime), CAST(N'2021-08-14T01:25:40.970' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (466, CAST(N'2021-08-14T01:25:41.123' AS DateTime), CAST(N'2021-08-14T01:25:41.127' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (467, CAST(N'2021-08-14T01:25:41.283' AS DateTime), CAST(N'2021-08-14T01:25:41.287' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (468, CAST(N'2021-08-14T01:25:45.023' AS DateTime), CAST(N'2021-08-14T01:30:12.517' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (469, CAST(N'2021-08-14T01:25:47.683' AS DateTime), CAST(N'2021-08-14T01:25:47.690' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (470, CAST(N'2021-08-14T01:25:48.017' AS DateTime), CAST(N'2021-08-14T01:25:48.023' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (471, CAST(N'2021-08-14T01:25:48.187' AS DateTime), CAST(N'2021-08-14T01:25:48.190' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (472, CAST(N'2021-08-14T01:25:48.550' AS DateTime), CAST(N'2021-08-14T01:25:48.553' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (473, CAST(N'2021-08-14T01:25:48.697' AS DateTime), CAST(N'2021-08-14T01:25:48.700' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (474, CAST(N'2021-08-14T01:25:48.867' AS DateTime), CAST(N'2021-08-14T01:25:48.870' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (475, CAST(N'2021-08-14T01:25:49.000' AS DateTime), CAST(N'2021-08-14T01:25:49.003' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (476, CAST(N'2021-08-14T01:25:49.247' AS DateTime), CAST(N'2021-08-14T01:25:49.250' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (477, CAST(N'2021-08-14T01:25:49.403' AS DateTime), CAST(N'2021-08-14T01:25:49.410' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (478, CAST(N'2021-08-14T01:25:49.547' AS DateTime), CAST(N'2021-08-14T01:25:49.550' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (479, CAST(N'2021-08-14T01:25:49.707' AS DateTime), CAST(N'2021-08-14T01:25:49.710' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (480, CAST(N'2021-08-14T01:25:49.847' AS DateTime), CAST(N'2021-08-14T01:25:49.850' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (481, CAST(N'2021-08-14T01:25:50.113' AS DateTime), CAST(N'2021-08-14T01:25:50.117' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (482, CAST(N'2021-08-14T01:25:50.377' AS DateTime), CAST(N'2021-08-14T01:25:50.380' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (483, CAST(N'2021-08-14T01:25:50.683' AS DateTime), CAST(N'2021-08-14T01:25:50.687' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (484, CAST(N'2021-08-14T01:25:50.867' AS DateTime), CAST(N'2021-08-14T01:25:50.873' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (485, CAST(N'2021-08-14T01:25:51.233' AS DateTime), CAST(N'2021-08-14T01:25:51.240' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (486, CAST(N'2021-08-14T01:25:51.443' AS DateTime), CAST(N'2021-08-14T01:25:51.450' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (487, CAST(N'2021-08-14T01:25:51.630' AS DateTime), CAST(N'2021-08-14T01:25:51.633' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (488, CAST(N'2021-08-14T01:25:51.827' AS DateTime), CAST(N'2021-08-14T01:25:51.830' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (489, CAST(N'2021-08-14T01:25:52.520' AS DateTime), CAST(N'2021-08-14T01:25:52.523' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (490, CAST(N'2021-08-14T01:25:52.650' AS DateTime), CAST(N'2021-08-14T01:25:52.657' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (491, CAST(N'2021-08-14T01:25:53.037' AS DateTime), CAST(N'2021-08-14T01:30:12.833' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (492, CAST(N'2021-08-14T01:25:53.207' AS DateTime), CAST(N'2021-08-14T01:30:13.453' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (493, CAST(N'2021-08-14T01:25:53.387' AS DateTime), CAST(N'2021-08-14T01:30:14.013' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (494, CAST(N'2021-08-14T01:25:53.713' AS DateTime), CAST(N'2021-08-14T01:30:14.593' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (495, CAST(N'2021-08-14T01:25:53.883' AS DateTime), CAST(N'2021-08-14T01:30:14.913' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (496, CAST(N'2021-08-14T01:25:54.363' AS DateTime), CAST(N'2021-08-14T01:25:54.370' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (497, CAST(N'2021-08-14T01:25:54.540' AS DateTime), CAST(N'2021-08-14T01:25:54.543' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (498, CAST(N'2021-08-14T01:25:54.703' AS DateTime), CAST(N'2021-08-14T01:25:54.707' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (499, CAST(N'2021-08-14T01:25:54.870' AS DateTime), CAST(N'2021-08-14T01:25:54.873' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (500, CAST(N'2021-08-14T01:25:55.050' AS DateTime), CAST(N'2021-08-14T01:25:55.053' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (501, CAST(N'2021-08-14T01:25:55.230' AS DateTime), CAST(N'2021-08-14T01:25:55.237' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (502, CAST(N'2021-08-14T01:25:55.403' AS DateTime), CAST(N'2021-08-14T01:25:55.410' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (503, CAST(N'2021-08-14T01:25:56.953' AS DateTime), CAST(N'2021-08-14T01:25:56.960' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (504, CAST(N'2021-08-14T01:25:57.140' AS DateTime), CAST(N'2021-08-14T01:25:57.147' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (505, CAST(N'2021-08-14T01:25:57.303' AS DateTime), CAST(N'2021-08-14T01:25:57.313' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (506, CAST(N'2021-08-14T01:25:57.470' AS DateTime), CAST(N'2021-08-14T01:25:57.477' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (507, CAST(N'2021-08-14T01:25:57.647' AS DateTime), CAST(N'2021-08-14T01:25:57.653' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (508, CAST(N'2021-08-14T01:25:57.830' AS DateTime), CAST(N'2021-08-14T01:25:57.840' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (509, CAST(N'2021-08-14T01:25:58.157' AS DateTime), CAST(N'2021-08-14T01:30:15.207' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (510, CAST(N'2021-08-14T01:25:58.347' AS DateTime), CAST(N'2021-08-14T01:30:15.870' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (511, CAST(N'2021-08-14T01:25:58.523' AS DateTime), CAST(N'2021-08-14T01:30:16.420' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (512, CAST(N'2021-08-14T01:25:59.017' AS DateTime), CAST(N'2021-08-14T01:25:59.023' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (513, CAST(N'2021-08-14T01:25:59.190' AS DateTime), CAST(N'2021-08-14T01:25:59.197' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (514, CAST(N'2021-08-14T01:25:59.363' AS DateTime), CAST(N'2021-08-14T01:25:59.373' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (515, CAST(N'2021-08-14T01:25:59.530' AS DateTime), CAST(N'2021-08-14T01:25:59.540' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (516, CAST(N'2021-08-14T01:25:59.707' AS DateTime), CAST(N'2021-08-14T01:25:59.717' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (517, CAST(N'2021-08-14T01:25:59.897' AS DateTime), CAST(N'2021-08-14T01:25:59.903' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (518, CAST(N'2021-08-14T01:26:00.093' AS DateTime), CAST(N'2021-08-14T01:26:00.100' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (519, CAST(N'2021-08-14T01:26:00.287' AS DateTime), CAST(N'2021-08-14T01:26:00.293' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (520, CAST(N'2021-08-14T01:26:00.520' AS DateTime), CAST(N'2021-08-14T01:26:00.527' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (521, CAST(N'2021-08-14T01:26:00.780' AS DateTime), CAST(N'2021-08-14T01:26:00.787' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (522, CAST(N'2021-08-14T01:26:00.923' AS DateTime), CAST(N'2021-08-14T01:26:00.930' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (523, CAST(N'2021-08-14T01:26:03.190' AS DateTime), CAST(N'2021-08-14T01:30:07.467' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (524, CAST(N'2021-08-14T01:30:03.627' AS DateTime), CAST(N'2021-08-14T01:30:07.190' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (525, CAST(N'2021-08-14T01:30:10.273' AS DateTime), CAST(N'2021-08-14T01:30:17.090' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (526, CAST(N'2021-08-14T01:30:10.637' AS DateTime), CAST(N'2021-08-14T01:30:17.423' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (527, CAST(N'2021-08-14T01:30:11.433' AS DateTime), CAST(N'2021-08-14T01:30:18.077' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (528, CAST(N'2021-08-14T01:30:12.163' AS DateTime), CAST(N'2021-08-14T01:30:12.173' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (529, CAST(N'2021-08-14T01:30:12.500' AS DateTime), CAST(N'2021-08-14T01:30:12.507' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (530, CAST(N'2021-08-14T01:30:12.827' AS DateTime), CAST(N'2021-08-14T01:30:12.830' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (531, CAST(N'2021-08-14T01:30:13.443' AS DateTime), CAST(N'2021-08-14T01:30:13.447' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (532, CAST(N'2021-08-14T01:30:14.003' AS DateTime), CAST(N'2021-08-14T01:30:14.010' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (533, CAST(N'2021-08-14T01:30:14.583' AS DateTime), CAST(N'2021-08-14T01:30:14.590' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (534, CAST(N'2021-08-14T01:30:14.900' AS DateTime), CAST(N'2021-08-14T01:30:14.907' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (535, CAST(N'2021-08-14T01:30:15.197' AS DateTime), CAST(N'2021-08-14T01:30:15.203' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (536, CAST(N'2021-08-14T01:30:15.863' AS DateTime), CAST(N'2021-08-14T01:30:15.867' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (537, CAST(N'2021-08-14T01:30:16.410' AS DateTime), CAST(N'2021-08-14T01:30:16.417' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (538, CAST(N'2021-08-14T01:30:17.080' AS DateTime), CAST(N'2021-08-14T01:30:17.083' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (539, CAST(N'2021-08-14T01:30:17.417' AS DateTime), CAST(N'2021-08-14T01:30:17.420' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (540, CAST(N'2021-08-14T01:30:18.070' AS DateTime), CAST(N'2021-08-14T01:30:18.073' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (541, CAST(N'2021-08-14T01:30:21.340' AS DateTime), CAST(N'2021-08-14T01:30:23.273' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (542, CAST(N'2021-08-14T01:30:22.957' AS DateTime), CAST(N'2021-08-14T01:30:22.970' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (543, CAST(N'2021-08-14T01:30:23.260' AS DateTime), CAST(N'2021-08-14T01:30:23.267' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (544, CAST(N'2021-08-14T01:30:23.973' AS DateTime), CAST(N'2021-08-14T01:30:31.033' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (545, CAST(N'2021-08-14T01:30:24.700' AS DateTime), CAST(N'2021-08-14T01:30:31.040' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (546, CAST(N'2021-08-14T01:30:31.023' AS DateTime), CAST(N'2021-08-14T01:30:59.733' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (547, CAST(N'2021-08-14T01:30:32.153' AS DateTime), CAST(N'2021-08-14T01:33:17.637' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (548, CAST(N'2021-08-14T01:30:34.547' AS DateTime), CAST(N'2021-08-14T01:30:34.553' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (549, CAST(N'2021-08-14T01:30:59.727' AS DateTime), CAST(N'2021-08-14T01:30:59.730' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (550, CAST(N'2021-08-14T01:31:02.103' AS DateTime), CAST(N'2021-08-14T01:33:21.700' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (551, CAST(N'2021-08-14T01:33:11.520' AS DateTime), CAST(N'2021-08-14T01:33:11.827' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (552, CAST(N'2021-08-14T01:33:13.267' AS DateTime), CAST(N'2021-08-14T01:33:13.273' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (553, CAST(N'2021-08-14T01:33:14.797' AS DateTime), CAST(N'2021-08-14T01:33:14.807' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (554, CAST(N'2021-08-14T01:33:15.963' AS DateTime), CAST(N'2021-08-14T01:33:15.970' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (555, CAST(N'2021-08-14T01:33:16.380' AS DateTime), CAST(N'2021-08-14T01:33:16.387' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (556, CAST(N'2021-08-14T01:33:16.753' AS DateTime), CAST(N'2021-08-14T01:33:16.760' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (557, CAST(N'2021-08-14T01:33:16.907' AS DateTime), CAST(N'2021-08-14T01:33:16.917' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (558, CAST(N'2021-08-14T01:33:17.073' AS DateTime), CAST(N'2021-08-14T01:33:17.077' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (559, CAST(N'2021-08-14T01:33:17.223' AS DateTime), CAST(N'2021-08-14T01:33:17.230' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (560, CAST(N'2021-08-14T01:33:17.373' AS DateTime), CAST(N'2021-08-14T01:33:17.380' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (561, CAST(N'2021-08-14T01:33:17.750' AS DateTime), CAST(N'2021-08-14T01:33:22.133' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (562, CAST(N'2021-08-14T01:33:19.497' AS DateTime), CAST(N'2021-08-14T01:33:22.320' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (563, CAST(N'2021-08-14T01:33:20.757' AS DateTime), CAST(N'2021-08-14T01:33:23.113' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (564, CAST(N'2021-08-14T01:33:21.223' AS DateTime), CAST(N'2021-08-15T23:45:43.563' AS DateTime), 0, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (565, CAST(N'2021-08-14T01:33:21.690' AS DateTime), CAST(N'2021-08-14T01:33:21.693' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (566, CAST(N'2021-08-14T01:33:22.120' AS DateTime), CAST(N'2021-08-14T01:33:22.127' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (567, CAST(N'2021-08-14T01:33:22.310' AS DateTime), CAST(N'2021-08-14T01:33:22.313' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (568, CAST(N'2021-08-14T01:33:23.103' AS DateTime), CAST(N'2021-08-14T01:33:23.107' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (569, CAST(N'2021-08-14T01:36:34.460' AS DateTime), CAST(N'2021-08-14T01:48:44.143' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (570, CAST(N'2021-08-14T01:36:36.193' AS DateTime), CAST(N'2021-08-14T01:36:36.220' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (571, CAST(N'2021-08-14T01:36:37.457' AS DateTime), CAST(N'2021-08-14T01:36:37.463' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (572, CAST(N'2021-08-14T01:36:37.623' AS DateTime), CAST(N'2021-08-14T01:36:37.627' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (573, CAST(N'2021-08-14T01:36:38.020' AS DateTime), CAST(N'2021-08-14T01:36:38.033' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (574, CAST(N'2021-08-14T01:36:42.053' AS DateTime), CAST(N'2021-08-14T01:36:42.060' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (575, CAST(N'2021-08-14T01:36:42.310' AS DateTime), CAST(N'2021-08-14T01:48:44.147' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (576, CAST(N'2021-08-14T01:36:42.733' AS DateTime), CAST(N'2021-08-14T01:48:44.153' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (577, CAST(N'2021-08-14T01:36:43.150' AS DateTime), CAST(N'2021-08-14T01:36:43.157' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (578, CAST(N'2021-08-14T01:36:43.380' AS DateTime), CAST(N'2021-08-14T01:48:44.160' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (579, CAST(N'2021-08-14T01:36:43.623' AS DateTime), CAST(N'2021-08-14T01:36:43.627' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (580, CAST(N'2021-08-14T01:36:43.813' AS DateTime), CAST(N'2021-08-14T01:48:44.163' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (581, CAST(N'2021-08-14T01:36:44.320' AS DateTime), CAST(N'2021-08-14T01:48:44.170' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (582, CAST(N'2021-08-14T01:36:44.497' AS DateTime), CAST(N'2021-08-14T01:48:44.173' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (583, CAST(N'2021-08-14T01:36:44.657' AS DateTime), CAST(N'2021-08-14T01:48:44.180' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (584, CAST(N'2021-08-14T01:36:44.860' AS DateTime), CAST(N'2021-08-14T01:48:44.183' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (585, CAST(N'2021-08-14T01:36:45.093' AS DateTime), CAST(N'2021-08-14T01:36:45.097' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (586, CAST(N'2021-08-14T01:36:46.120' AS DateTime), CAST(N'2021-08-14T01:36:46.127' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (587, CAST(N'2021-08-14T01:48:29.303' AS DateTime), CAST(N'2021-08-14T01:48:44.190' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (588, CAST(N'2021-08-14T01:48:29.717' AS DateTime), CAST(N'2021-08-14T01:48:29.740' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (589, CAST(N'2021-08-14T01:48:38.677' AS DateTime), CAST(N'2021-08-14T01:48:47.237' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(6.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (590, CAST(N'2021-08-14T01:48:44.120' AS DateTime), CAST(N'2021-08-14T01:48:44.197' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (591, CAST(N'2021-08-14T01:48:44.567' AS DateTime), CAST(N'2021-08-14T01:48:44.573' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (592, CAST(N'2021-08-14T01:48:44.783' AS DateTime), CAST(N'2021-08-14T01:48:44.790' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (593, CAST(N'2021-08-14T01:48:45.177' AS DateTime), CAST(N'2021-08-14T01:48:45.183' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (594, CAST(N'2021-08-14T01:48:45.700' AS DateTime), CAST(N'2021-08-14T01:48:45.707' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (595, CAST(N'2021-08-14T01:48:46.253' AS DateTime), CAST(N'2021-08-14T01:48:46.260' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (596, CAST(N'2021-08-14T01:48:46.770' AS DateTime), CAST(N'2021-08-14T01:48:46.773' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(15.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (597, CAST(N'2021-08-14T01:48:47.230' AS DateTime), CAST(N'2021-08-14T01:48:49.853' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (600, CAST(N'2021-08-15T23:44:47.853' AS DateTime), CAST(N'2021-08-15T23:44:48.183' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (601, CAST(N'2021-08-15T23:45:43.240' AS DateTime), CAST(N'2021-08-15T23:45:43.497' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] ON 
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (10, CAST(N'2021-08-06T19:26:29.747' AS DateTime), 1, CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(2.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (12, CAST(N'2021-08-06T23:52:23.403' AS DateTime), 0, CAST(12321.00000000000000000000 AS Decimal(38, 20)), CAST(1123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (13, CAST(N'2021-08-06T23:52:29.410' AS DateTime), 0, CAST(12321.00000000000000000000 AS Decimal(38, 20)), CAST(1123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (14, CAST(N'2021-08-06T23:52:30.473' AS DateTime), 0, CAST(12321.00000000000000000000 AS Decimal(38, 20)), CAST(1123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (17, CAST(N'2021-08-06T23:57:23.250' AS DateTime), 0, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (18, CAST(N'2021-08-06T23:57:25.170' AS DateTime), 0, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (31, CAST(N'2021-08-07T00:18:39.540' AS DateTime), 0, CAST(4324.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (32, CAST(N'2021-08-07T00:18:39.810' AS DateTime), 0, CAST(4324.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (33, CAST(N'2021-08-07T00:18:40.197' AS DateTime), 0, CAST(4324.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (34, CAST(N'2021-08-07T00:18:40.397' AS DateTime), 0, CAST(4324.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (35, CAST(N'2021-08-07T00:18:40.593' AS DateTime), 0, CAST(4324.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (91, CAST(N'2021-08-10T02:08:55.007' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (92, CAST(N'2021-08-10T02:08:55.320' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (93, CAST(N'2021-08-10T02:08:55.630' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (382, CAST(N'2021-08-11T23:34:44.877' AS DateTime), 0, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(246.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (385, CAST(N'2021-08-11T23:35:46.707' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (386, CAST(N'2021-08-11T23:35:49.367' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(104.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (409, CAST(N'2021-08-14T01:18:20.860' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (598, CAST(N'2021-08-14T01:48:48.307' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(14.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (599, CAST(N'2021-08-14T01:48:49.847' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(6.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
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
SET IDENTITY_INSERT [dbo].[IncomeTransactions] ON 
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (1, N'LTC', N'089027f7cae1241060439108eb986a6af2c3999c59fc1199f0ebcb1f6504b850', CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'MWHRykjpeqJefJ9wm5dgwYPb9K9FFbdDNC', 1629231574, N'53482f0f-47a2-4fb3-8c5e-66e2ab2136d1', 2)
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
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
ALTER TABLE [dbo].[BTC_USDT_ClosedOrders] ADD  CONSTRAINT [DF_BTC_USDT_ClosedOrders_ClosedDate]  DEFAULT (getdate()) FOR [ClosedDate]
GO
ALTER TABLE [dbo].[BTC_USDT_ClosedOrders] ADD  CONSTRAINT [DF_BTC_USDT_ClosedOrders_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[BTC_USDT_ClosedOrders] ADD  CONSTRAINT [DF_BTC_USDT_ClosedOrders_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DF_Currencies_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Table_1] ADD  CONSTRAINT [DF_Table_1_gdate]  DEFAULT (getdate()) FOR [gdate]
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
CREATE PROCEDURE [dbo].[spAdd_BTC_USDT_ClosedOrder]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@createDate datetime
AS
BEGIN

insert into BTC_USDT_ClosedOrders (CreateDate, IsBuy, Price, Amount, CreateUserId, BoughtUserId)
values (@createDate, @isBuy, @price, @amount, @createUserId, @boughtUserId)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAdd_BTC_USDT_Order]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@new_identity    BIGINT    OUTPUT
AS
BEGIN

insert into BTC_USDT_OpenOrders (IsBuy, Price, Amount, CreateUserId)
values (@isBuy, @price, @amount, @userid)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity

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
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_ClosedOrders]
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
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_SortedOrderBook]
@isBuy bit
AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy,
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
WHERE D1.IsBuy = @isBuy
GROUP BY  D1.Price, D1.IsBuy
ORDER BY  Price


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_SortedOrderBookBuy]

AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy,
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount
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
CREATE PROCEDURE [dbo].[spGet_BTC_USDT_SortedOrderBookSell]

AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy,
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount
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
CREATE PROCEDURE [dbo].[spUpdate_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@openOrderId bigint OUTPUT
AS
BEGIN

UPDATE [BTC_USDT_OpenOrders]
SET    IsBuy = @isBuy,
       Price = @price,
       Amount = @amount,
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
