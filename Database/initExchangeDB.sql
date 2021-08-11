USE [Exchange]
GO
/****** Object:  Table [dbo].[BTC_USDT_ClosedOrders]    Script Date: 11.08.2021 23:48:55 ******/
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
	[Status] [nvarchar](50) NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BTC_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[ClosedOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTC_USDT_OpenOrders]    Script Date: 11.08.2021 23:48:55 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 11.08.2021 23:48:55 ******/
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
/****** Object:  Table [dbo].[IncomeTransactions]    Script Date: 11.08.2021 23:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WalletId] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransactionId] [nvarchar](max) NULL,
	[IncomeWallet] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomeWallets]    Script Date: 11.08.2021 23:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeWallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[CurrencyAcronim] [nvarchar](10) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutcomeTransactions]    Script Date: 11.08.2021 23:48:55 ******/
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
/****** Object:  Table [dbo].[Table_1]    Script Date: 11.08.2021 23:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[gdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 11.08.2021 23:48:55 ******/
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
/****** Object:  Table [dbo].[Wallets]    Script Date: 11.08.2021 23:48:55 ******/
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
	[Address] [nvarchar](150) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (2, CAST(N'2021-05-21T00:26:20.780' AS DateTime), CAST(N'2021-08-11T23:19:39.793' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (3, CAST(N'2021-05-21T00:29:38.720' AS DateTime), CAST(N'2021-08-11T20:04:26.400' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (4, CAST(N'2021-05-21T00:30:37.980' AS DateTime), CAST(N'2021-08-11T19:54:33.300' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (5, CAST(N'2021-05-21T00:32:33.493' AS DateTime), CAST(N'2021-08-11T23:19:41.610' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (6, CAST(N'2021-08-05T23:39:54.570' AS DateTime), CAST(N'2021-08-11T23:34:33.993' AS DateTime), 1, CAST(7000.00000000000000000000 AS Decimal(38, 20)), CAST(200.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (7, CAST(N'2021-08-05T23:40:44.653' AS DateTime), CAST(N'2021-08-11T23:34:49.953' AS DateTime), 1, CAST(1000.00000000000000000000 AS Decimal(38, 20)), CAST(800.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (8, CAST(N'2021-08-05T23:41:15.250' AS DateTime), CAST(N'2021-08-11T23:34:38.420' AS DateTime), 1, CAST(5000.00000000000000000000 AS Decimal(38, 20)), CAST(90.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (9, CAST(N'2021-08-05T23:42:06.980' AS DateTime), CAST(N'2021-08-11T23:34:24.287' AS DateTime), 1, CAST(500078.00000000000000000000 AS Decimal(38, 20)), CAST(990.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (11, CAST(N'2021-08-06T19:29:46.167' AS DateTime), CAST(N'2021-08-11T23:34:58.423' AS DateTime), 1, CAST(400.00000000000000000000 AS Decimal(38, 20)), CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (19, CAST(N'2021-08-06T23:58:04.977' AS DateTime), CAST(N'2021-08-11T23:34:44.893' AS DateTime), 1, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (36, CAST(N'2021-08-07T00:19:18.737' AS DateTime), CAST(N'2021-08-11T19:05:14.293' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37, CAST(N'2021-08-07T00:19:18.990' AS DateTime), CAST(N'2021-08-11T19:05:23.467' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38, CAST(N'2021-08-07T00:19:19.140' AS DateTime), CAST(N'2021-08-11T19:05:26.403' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (39, CAST(N'2021-08-07T00:19:19.300' AS DateTime), CAST(N'2021-08-11T19:05:26.933' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (40, CAST(N'2021-08-07T00:19:19.470' AS DateTime), CAST(N'2021-08-11T19:05:27.150' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (41, CAST(N'2021-08-07T00:19:19.633' AS DateTime), CAST(N'2021-08-11T19:05:27.317' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (42, CAST(N'2021-08-07T00:19:19.783' AS DateTime), CAST(N'2021-08-11T19:05:27.473' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (49, CAST(N'2021-08-07T00:19:26.027' AS DateTime), CAST(N'2021-08-11T23:18:57.487' AS DateTime), 0, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (50, CAST(N'2021-08-07T00:19:53.300' AS DateTime), CAST(N'2021-08-11T23:18:58.510' AS DateTime), 0, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (55, CAST(N'2021-08-07T00:21:09.637' AS DateTime), CAST(N'2021-08-11T19:05:27.630' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (56, CAST(N'2021-08-07T01:47:24.890' AS DateTime), CAST(N'2021-08-11T19:05:27.777' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (68, CAST(N'2021-08-07T22:30:30.210' AS DateTime), CAST(N'2021-08-11T19:05:30.437' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (69, CAST(N'2021-08-07T22:30:30.360' AS DateTime), CAST(N'2021-08-11T19:05:30.843' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (70, CAST(N'2021-08-07T22:30:30.527' AS DateTime), CAST(N'2021-08-11T19:05:31.050' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (71, CAST(N'2021-08-07T22:30:30.663' AS DateTime), CAST(N'2021-08-11T19:05:31.213' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (72, CAST(N'2021-08-07T22:30:30.797' AS DateTime), CAST(N'2021-08-11T19:05:31.377' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (73, CAST(N'2021-08-07T22:30:30.947' AS DateTime), CAST(N'2021-08-11T19:05:31.930' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (74, CAST(N'2021-08-07T22:30:31.073' AS DateTime), CAST(N'2021-08-11T19:05:37.657' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (94, CAST(N'2021-08-10T02:08:57.700' AS DateTime), CAST(N'2021-08-11T23:35:46.720' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(12.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (95, CAST(N'2021-08-10T02:08:57.850' AS DateTime), CAST(N'2021-08-11T23:35:46.730' AS DateTime), 1, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(12.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (102, CAST(N'2021-08-10T19:00:38.330' AS DateTime), CAST(N'2021-08-11T19:05:37.893' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (110, CAST(N'2021-08-10T19:00:52.987' AS DateTime), CAST(N'2021-08-11T19:05:38.057' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (111, CAST(N'2021-08-10T19:01:32.237' AS DateTime), CAST(N'2021-08-11T19:05:38.213' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (112, CAST(N'2021-08-10T19:02:28.253' AS DateTime), CAST(N'2021-08-11T19:05:38.357' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (116, CAST(N'2021-08-10T19:04:08.027' AS DateTime), CAST(N'2021-08-11T19:05:42.347' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (117, CAST(N'2021-08-10T19:04:08.173' AS DateTime), CAST(N'2021-08-11T19:05:42.507' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (118, CAST(N'2021-08-10T19:04:08.347' AS DateTime), CAST(N'2021-08-11T19:05:42.653' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (119, CAST(N'2021-08-10T19:04:08.530' AS DateTime), CAST(N'2021-08-11T19:05:42.807' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (120, CAST(N'2021-08-10T19:04:08.660' AS DateTime), CAST(N'2021-08-11T19:05:42.963' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (124, CAST(N'2021-08-10T19:04:33.273' AS DateTime), CAST(N'2021-08-11T19:05:43.120' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (125, CAST(N'2021-08-10T19:05:30.280' AS DateTime), CAST(N'2021-08-11T19:05:43.277' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (126, CAST(N'2021-08-10T19:05:31.387' AS DateTime), CAST(N'2021-08-11T19:05:43.430' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (128, CAST(N'2021-08-10T19:05:37.060' AS DateTime), CAST(N'2021-08-11T19:05:43.587' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (132, CAST(N'2021-08-10T19:09:17.640' AS DateTime), CAST(N'2021-08-11T19:06:18.537' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (133, CAST(N'2021-08-10T19:09:19.743' AS DateTime), CAST(N'2021-08-11T19:09:10.923' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (134, CAST(N'2021-08-10T19:09:19.930' AS DateTime), CAST(N'2021-08-11T19:09:11.510' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (135, CAST(N'2021-08-10T19:09:20.087' AS DateTime), CAST(N'2021-08-11T19:09:11.730' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (136, CAST(N'2021-08-10T19:09:23.470' AS DateTime), CAST(N'2021-08-11T19:09:13.347' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (138, CAST(N'2021-08-10T19:17:29.670' AS DateTime), CAST(N'2021-08-11T19:09:15.030' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (139, CAST(N'2021-08-10T19:17:34.423' AS DateTime), CAST(N'2021-08-11T19:09:16.020' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (140, CAST(N'2021-08-10T19:17:47.083' AS DateTime), CAST(N'2021-08-11T19:09:48.353' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (143, CAST(N'2021-08-10T19:22:58.993' AS DateTime), CAST(N'2021-08-11T19:09:48.643' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (156, CAST(N'2021-08-11T19:04:57.737' AS DateTime), CAST(N'2021-08-11T19:05:01.770' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (157, CAST(N'2021-08-11T19:05:20.883' AS DateTime), CAST(N'2021-08-11T19:05:23.463' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (158, CAST(N'2021-08-11T19:05:26.390' AS DateTime), CAST(N'2021-08-11T19:05:26.397' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (159, CAST(N'2021-08-11T19:05:26.923' AS DateTime), CAST(N'2021-08-11T19:05:26.927' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (160, CAST(N'2021-08-11T19:05:27.140' AS DateTime), CAST(N'2021-08-11T19:05:27.147' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (161, CAST(N'2021-08-11T19:05:27.307' AS DateTime), CAST(N'2021-08-11T19:05:27.313' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (162, CAST(N'2021-08-11T19:05:27.463' AS DateTime), CAST(N'2021-08-11T19:05:27.470' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (163, CAST(N'2021-08-11T19:05:27.620' AS DateTime), CAST(N'2021-08-11T19:05:27.623' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (164, CAST(N'2021-08-11T19:05:27.767' AS DateTime), CAST(N'2021-08-11T19:05:27.773' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (165, CAST(N'2021-08-11T19:05:28.317' AS DateTime), CAST(N'2021-08-11T19:09:48.810' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (166, CAST(N'2021-08-11T19:05:28.710' AS DateTime), CAST(N'2021-08-11T19:09:48.960' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (167, CAST(N'2021-08-11T19:05:28.963' AS DateTime), CAST(N'2021-08-11T19:09:49.113' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (168, CAST(N'2021-08-11T19:05:29.287' AS DateTime), CAST(N'2021-08-11T19:09:49.570' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (169, CAST(N'2021-08-11T19:05:29.550' AS DateTime), CAST(N'2021-08-11T19:11:18.473' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (170, CAST(N'2021-08-11T19:05:29.717' AS DateTime), CAST(N'2021-08-11T19:13:50.813' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (171, CAST(N'2021-08-11T19:05:29.860' AS DateTime), CAST(N'2021-08-11T19:13:54.817' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (172, CAST(N'2021-08-11T19:05:30.003' AS DateTime), CAST(N'2021-08-11T19:25:18.553' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (173, CAST(N'2021-08-11T19:05:30.427' AS DateTime), CAST(N'2021-08-11T19:05:30.433' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (174, CAST(N'2021-08-11T19:05:30.833' AS DateTime), CAST(N'2021-08-11T19:05:30.840' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (175, CAST(N'2021-08-11T19:05:31.040' AS DateTime), CAST(N'2021-08-11T19:05:31.047' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (176, CAST(N'2021-08-11T19:05:31.203' AS DateTime), CAST(N'2021-08-11T19:05:31.207' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (177, CAST(N'2021-08-11T19:05:31.367' AS DateTime), CAST(N'2021-08-11T19:05:31.373' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (178, CAST(N'2021-08-11T19:05:31.923' AS DateTime), CAST(N'2021-08-11T19:05:31.927' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (179, CAST(N'2021-08-11T19:05:34.203' AS DateTime), CAST(N'2021-08-11T19:25:25.867' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (180, CAST(N'2021-08-11T19:05:34.493' AS DateTime), CAST(N'2021-08-11T19:32:13.347' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (181, CAST(N'2021-08-11T19:05:37.650' AS DateTime), CAST(N'2021-08-11T19:05:37.653' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (182, CAST(N'2021-08-11T19:05:37.887' AS DateTime), CAST(N'2021-08-11T19:05:37.890' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (183, CAST(N'2021-08-11T19:05:38.050' AS DateTime), CAST(N'2021-08-11T19:05:38.053' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (184, CAST(N'2021-08-11T19:05:38.203' AS DateTime), CAST(N'2021-08-11T19:05:38.207' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (185, CAST(N'2021-08-11T19:05:38.347' AS DateTime), CAST(N'2021-08-11T19:05:38.350' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (186, CAST(N'2021-08-11T19:05:38.990' AS DateTime), CAST(N'2021-08-11T19:32:37.270' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (187, CAST(N'2021-08-11T19:05:42.337' AS DateTime), CAST(N'2021-08-11T19:05:42.343' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (188, CAST(N'2021-08-11T19:05:42.497' AS DateTime), CAST(N'2021-08-11T19:05:42.500' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (189, CAST(N'2021-08-11T19:05:42.647' AS DateTime), CAST(N'2021-08-11T19:05:42.650' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (190, CAST(N'2021-08-11T19:05:42.800' AS DateTime), CAST(N'2021-08-11T19:05:42.803' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (191, CAST(N'2021-08-11T19:05:42.953' AS DateTime), CAST(N'2021-08-11T19:05:42.960' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (192, CAST(N'2021-08-11T19:05:43.110' AS DateTime), CAST(N'2021-08-11T19:05:43.117' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (193, CAST(N'2021-08-11T19:05:43.267' AS DateTime), CAST(N'2021-08-11T19:05:43.273' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (194, CAST(N'2021-08-11T19:05:43.423' AS DateTime), CAST(N'2021-08-11T19:05:43.427' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (195, CAST(N'2021-08-11T19:05:43.577' AS DateTime), CAST(N'2021-08-11T19:05:43.583' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (196, CAST(N'2021-08-11T19:05:44.320' AS DateTime), CAST(N'2021-08-11T19:34:56.280' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (197, CAST(N'2021-08-11T19:06:18.520' AS DateTime), CAST(N'2021-08-11T19:06:18.530' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (198, CAST(N'2021-08-11T19:06:20.920' AS DateTime), CAST(N'2021-08-11T19:37:03.110' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (199, CAST(N'2021-08-11T19:09:10.350' AS DateTime), CAST(N'2021-08-11T19:09:10.633' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (200, CAST(N'2021-08-11T19:09:11.497' AS DateTime), CAST(N'2021-08-11T19:09:11.503' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (201, CAST(N'2021-08-11T19:09:11.720' AS DateTime), CAST(N'2021-08-11T19:09:11.723' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (202, CAST(N'2021-08-11T19:09:13.337' AS DateTime), CAST(N'2021-08-11T19:09:13.343' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (203, CAST(N'2021-08-11T19:09:13.760' AS DateTime), CAST(N'2021-08-11T19:40:38.523' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (204, CAST(N'2021-08-11T19:09:15.017' AS DateTime), CAST(N'2021-08-11T19:09:15.023' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (205, CAST(N'2021-08-11T19:09:15.353' AS DateTime), CAST(N'2021-08-11T19:42:34.000' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (206, CAST(N'2021-08-11T19:09:16.007' AS DateTime), CAST(N'2021-08-11T19:09:16.013' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (213, CAST(N'2021-08-11T19:09:48.340' AS DateTime), CAST(N'2021-08-11T19:09:48.347' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (214, CAST(N'2021-08-11T19:09:48.633' AS DateTime), CAST(N'2021-08-11T19:09:48.640' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (215, CAST(N'2021-08-11T19:09:48.800' AS DateTime), CAST(N'2021-08-11T19:09:48.803' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (216, CAST(N'2021-08-11T19:09:48.950' AS DateTime), CAST(N'2021-08-11T19:09:48.957' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (217, CAST(N'2021-08-11T19:09:49.103' AS DateTime), CAST(N'2021-08-11T19:09:49.110' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (218, CAST(N'2021-08-11T19:09:49.563' AS DateTime), CAST(N'2021-08-11T19:09:49.567' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (221, CAST(N'2021-08-11T19:11:18.137' AS DateTime), CAST(N'2021-08-11T19:11:18.163' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (222, CAST(N'2021-08-11T19:13:50.227' AS DateTime), CAST(N'2021-08-11T19:13:50.517' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (223, CAST(N'2021-08-11T19:13:54.803' AS DateTime), CAST(N'2021-08-11T19:13:54.810' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (225, CAST(N'2021-08-11T19:25:17.950' AS DateTime), CAST(N'2021-08-11T19:25:18.243' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (227, CAST(N'2021-08-11T19:25:25.857' AS DateTime), CAST(N'2021-08-11T19:25:25.860' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (228, CAST(N'2021-08-11T19:31:49.587' AS DateTime), CAST(N'2021-08-11T19:32:09.067' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (229, CAST(N'2021-08-11T19:32:27.303' AS DateTime), CAST(N'2021-08-11T19:32:32.220' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (230, CAST(N'2021-08-11T19:34:53.083' AS DateTime), CAST(N'2021-08-11T19:34:55.173' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (231, CAST(N'2021-08-11T19:35:56.393' AS DateTime), CAST(N'2021-08-11T19:35:59.657' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (232, CAST(N'2021-08-11T19:40:06.453' AS DateTime), CAST(N'2021-08-11T19:40:23.097' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (233, CAST(N'2021-08-11T19:42:14.203' AS DateTime), CAST(N'2021-08-11T19:42:24.857' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (234, CAST(N'2021-08-11T19:43:06.977' AS DateTime), CAST(N'2021-08-11T19:43:07.487' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (235, CAST(N'2021-08-11T19:43:07.477' AS DateTime), CAST(N'2021-08-11T19:43:07.483' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (236, CAST(N'2021-08-11T19:43:08.110' AS DateTime), CAST(N'2021-08-11T19:43:08.343' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (237, CAST(N'2021-08-11T19:43:08.337' AS DateTime), CAST(N'2021-08-11T19:43:08.340' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (238, CAST(N'2021-08-11T19:43:08.593' AS DateTime), CAST(N'2021-08-11T19:43:08.820' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (239, CAST(N'2021-08-11T19:43:08.807' AS DateTime), CAST(N'2021-08-11T19:43:08.813' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (240, CAST(N'2021-08-11T19:50:53.797' AS DateTime), CAST(N'2021-08-11T19:54:01.597' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (241, CAST(N'2021-08-11T19:51:09.330' AS DateTime), CAST(N'2021-08-11T19:59:33.530' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (242, CAST(N'2021-08-11T19:52:18.763' AS DateTime), CAST(N'2021-08-11T19:59:33.563' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (243, CAST(N'2021-08-11T19:53:19.933' AS DateTime), CAST(N'2021-08-11T19:53:56.650' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (244, CAST(N'2021-08-11T19:54:33.293' AS DateTime), CAST(N'2021-08-11T19:54:33.307' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (245, CAST(N'2021-08-11T19:54:43.497' AS DateTime), CAST(N'2021-08-11T20:02:02.997' AS DateTime), 0, CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (246, CAST(N'2021-08-11T19:54:53.137' AS DateTime), CAST(N'2021-08-11T20:01:51.333' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (247, CAST(N'2021-08-11T19:55:16.460' AS DateTime), CAST(N'2021-08-11T19:59:33.580' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (248, CAST(N'2021-08-11T19:55:51.360' AS DateTime), CAST(N'2021-08-11T19:59:33.760' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (249, CAST(N'2021-08-11T19:56:54.250' AS DateTime), CAST(N'2021-08-11T19:59:33.940' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (250, CAST(N'2021-08-11T19:57:29.473' AS DateTime), CAST(N'2021-08-11T19:59:34.103' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (251, CAST(N'2021-08-11T19:59:00.997' AS DateTime), CAST(N'2021-08-11T19:59:34.233' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (252, CAST(N'2021-08-11T19:59:28.180' AS DateTime), CAST(N'2021-08-11T20:02:07.710' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (253, CAST(N'2021-08-11T19:59:29.383' AS DateTime), CAST(N'2021-08-11T20:02:07.723' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (255, CAST(N'2021-08-11T19:59:29.697' AS DateTime), CAST(N'2021-08-11T20:02:10.927' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (256, CAST(N'2021-08-11T19:59:29.850' AS DateTime), CAST(N'2021-08-11T20:02:10.943' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (258, CAST(N'2021-08-11T19:59:33.177' AS DateTime), CAST(N'2021-08-11T19:59:33.210' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (259, CAST(N'2021-08-11T19:59:33.543' AS DateTime), CAST(N'2021-08-11T19:59:33.553' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (260, CAST(N'2021-08-11T19:59:33.570' AS DateTime), CAST(N'2021-08-11T19:59:33.573' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (261, CAST(N'2021-08-11T19:59:33.740' AS DateTime), CAST(N'2021-08-11T19:59:33.750' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (262, CAST(N'2021-08-11T19:59:33.917' AS DateTime), CAST(N'2021-08-11T19:59:33.930' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (263, CAST(N'2021-08-11T19:59:34.083' AS DateTime), CAST(N'2021-08-11T19:59:34.093' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (264, CAST(N'2021-08-11T19:59:34.227' AS DateTime), CAST(N'2021-08-11T19:59:34.240' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (279, CAST(N'2021-08-11T19:59:42.100' AS DateTime), CAST(N'2021-08-11T20:01:52.650' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (293, CAST(N'2021-08-11T20:00:06.247' AS DateTime), CAST(N'2021-08-11T20:01:56.587' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (295, CAST(N'2021-08-11T20:01:49.913' AS DateTime), CAST(N'2021-08-11T20:01:49.923' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (296, CAST(N'2021-08-11T20:01:51.320' AS DateTime), CAST(N'2021-08-11T20:01:51.340' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (297, CAST(N'2021-08-11T20:01:51.947' AS DateTime), CAST(N'2021-08-11T20:01:51.950' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (298, CAST(N'2021-08-11T20:01:52.637' AS DateTime), CAST(N'2021-08-11T20:01:52.643' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (299, CAST(N'2021-08-11T20:01:53.397' AS DateTime), CAST(N'2021-08-11T20:01:57.000' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (300, CAST(N'2021-08-11T20:01:54.703' AS DateTime), CAST(N'2021-08-11T20:01:57.460' AS DateTime), 0, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (301, CAST(N'2021-08-11T20:01:56.573' AS DateTime), CAST(N'2021-08-11T20:01:56.580' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (302, CAST(N'2021-08-11T20:01:56.987' AS DateTime), CAST(N'2021-08-11T20:01:56.993' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (303, CAST(N'2021-08-11T20:01:57.447' AS DateTime), CAST(N'2021-08-11T20:01:57.453' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (304, CAST(N'2021-08-11T20:02:02.983' AS DateTime), CAST(N'2021-08-11T20:02:02.990' AS DateTime), 1, CAST(10.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (306, CAST(N'2021-08-11T20:02:07.697' AS DateTime), CAST(N'2021-08-11T20:02:07.717' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (307, CAST(N'2021-08-11T20:02:10.193' AS DateTime), CAST(N'2021-08-11T20:02:14.090' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (308, CAST(N'2021-08-11T20:02:10.913' AS DateTime), CAST(N'2021-08-11T20:02:10.937' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (309, CAST(N'2021-08-11T20:02:14.077' AS DateTime), CAST(N'2021-08-11T20:02:14.083' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (310, CAST(N'2021-08-11T20:02:15.027' AS DateTime), CAST(N'2021-08-11T20:02:16.570' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (311, CAST(N'2021-08-11T20:02:15.557' AS DateTime), CAST(N'2021-08-11T20:02:17.367' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (312, CAST(N'2021-08-11T20:02:15.917' AS DateTime), CAST(N'2021-08-11T20:02:18.013' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (313, CAST(N'2021-08-11T20:02:16.557' AS DateTime), CAST(N'2021-08-11T20:02:16.563' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (314, CAST(N'2021-08-11T20:02:17.357' AS DateTime), CAST(N'2021-08-11T20:02:17.363' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (315, CAST(N'2021-08-11T20:02:18.003' AS DateTime), CAST(N'2021-08-11T20:02:18.007' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (316, CAST(N'2021-08-11T20:02:18.560' AS DateTime), CAST(N'2021-08-11T20:02:19.633' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (317, CAST(N'2021-08-11T20:02:18.710' AS DateTime), CAST(N'2021-08-11T20:02:19.830' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (318, CAST(N'2021-08-11T20:02:18.867' AS DateTime), CAST(N'2021-08-11T20:02:19.997' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (319, CAST(N'2021-08-11T20:02:19.017' AS DateTime), CAST(N'2021-08-11T20:02:20.157' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (320, CAST(N'2021-08-11T20:02:19.170' AS DateTime), CAST(N'2021-08-11T20:02:20.307' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (321, CAST(N'2021-08-11T20:02:19.283' AS DateTime), CAST(N'2021-08-11T20:02:20.670' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (322, CAST(N'2021-08-11T20:02:19.620' AS DateTime), CAST(N'2021-08-11T20:02:19.627' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (323, CAST(N'2021-08-11T20:02:19.817' AS DateTime), CAST(N'2021-08-11T20:02:19.823' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (324, CAST(N'2021-08-11T20:02:19.983' AS DateTime), CAST(N'2021-08-11T20:02:19.990' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (325, CAST(N'2021-08-11T20:02:20.143' AS DateTime), CAST(N'2021-08-11T20:02:20.150' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (326, CAST(N'2021-08-11T20:02:20.293' AS DateTime), CAST(N'2021-08-11T20:02:20.300' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (327, CAST(N'2021-08-11T20:02:20.657' AS DateTime), CAST(N'2021-08-11T20:02:20.663' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (328, CAST(N'2021-08-11T20:02:23.103' AS DateTime), CAST(N'2021-08-11T20:02:24.237' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (329, CAST(N'2021-08-11T20:02:24.223' AS DateTime), CAST(N'2021-08-11T20:02:24.227' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (330, CAST(N'2021-08-11T20:02:24.920' AS DateTime), CAST(N'2021-08-11T20:02:26.530' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (331, CAST(N'2021-08-11T20:02:26.523' AS DateTime), CAST(N'2021-08-11T20:02:26.537' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (333, CAST(N'2021-08-11T20:02:32.570' AS DateTime), CAST(N'2021-08-11T20:04:12.717' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (334, CAST(N'2021-08-11T20:02:34.207' AS DateTime), CAST(N'2021-08-11T20:04:13.563' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (335, CAST(N'2021-08-11T20:02:44.600' AS DateTime), CAST(N'2021-08-11T20:04:07.030' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (336, CAST(N'2021-08-11T20:04:04.477' AS DateTime), CAST(N'2021-08-11T20:04:07.067' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (337, CAST(N'2021-08-11T20:04:09.777' AS DateTime), CAST(N'2021-08-11T20:04:09.790' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (338, CAST(N'2021-08-11T20:04:10.680' AS DateTime), CAST(N'2021-08-11T20:04:14.147' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (339, CAST(N'2021-08-11T20:04:11.050' AS DateTime), CAST(N'2021-08-11T20:04:14.597' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (340, CAST(N'2021-08-11T20:04:11.190' AS DateTime), CAST(N'2021-08-11T20:04:15.007' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (342, CAST(N'2021-08-11T20:04:12.097' AS DateTime), CAST(N'2021-08-11T20:04:12.103' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (343, CAST(N'2021-08-11T20:04:12.707' AS DateTime), CAST(N'2021-08-11T20:04:12.720' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (344, CAST(N'2021-08-11T20:04:13.070' AS DateTime), CAST(N'2021-08-11T20:04:13.077' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (345, CAST(N'2021-08-11T20:04:13.550' AS DateTime), CAST(N'2021-08-11T20:04:13.553' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (346, CAST(N'2021-08-11T20:04:14.127' AS DateTime), CAST(N'2021-08-11T20:04:14.133' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (347, CAST(N'2021-08-11T20:04:14.583' AS DateTime), CAST(N'2021-08-11T20:04:14.590' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (348, CAST(N'2021-08-11T20:04:14.997' AS DateTime), CAST(N'2021-08-11T20:04:15.003' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (349, CAST(N'2021-08-11T20:04:15.913' AS DateTime), CAST(N'2021-08-11T20:04:17.433' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (350, CAST(N'2021-08-11T20:04:16.060' AS DateTime), CAST(N'2021-08-11T20:04:17.683' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (351, CAST(N'2021-08-11T20:04:16.200' AS DateTime), CAST(N'2021-08-11T20:04:17.857' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (352, CAST(N'2021-08-11T20:04:16.350' AS DateTime), CAST(N'2021-08-11T20:04:18.123' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (353, CAST(N'2021-08-11T20:04:16.500' AS DateTime), CAST(N'2021-08-11T20:04:18.473' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (354, CAST(N'2021-08-11T20:04:16.640' AS DateTime), CAST(N'2021-08-11T20:04:18.727' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (355, CAST(N'2021-08-11T20:04:16.793' AS DateTime), CAST(N'2021-08-11T20:04:18.973' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (356, CAST(N'2021-08-11T20:04:16.937' AS DateTime), CAST(N'2021-08-11T20:04:19.173' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (357, CAST(N'2021-08-11T20:04:17.077' AS DateTime), CAST(N'2021-08-11T20:04:19.317' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (358, CAST(N'2021-08-11T20:04:17.420' AS DateTime), CAST(N'2021-08-11T20:04:17.427' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (359, CAST(N'2021-08-11T20:04:17.663' AS DateTime), CAST(N'2021-08-11T20:04:17.673' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (360, CAST(N'2021-08-11T20:04:17.847' AS DateTime), CAST(N'2021-08-11T20:04:17.850' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (361, CAST(N'2021-08-11T20:04:18.107' AS DateTime), CAST(N'2021-08-11T20:04:18.113' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (362, CAST(N'2021-08-11T20:04:18.457' AS DateTime), CAST(N'2021-08-11T20:04:18.463' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (363, CAST(N'2021-08-11T20:04:18.713' AS DateTime), CAST(N'2021-08-11T20:04:18.720' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (364, CAST(N'2021-08-11T20:04:18.957' AS DateTime), CAST(N'2021-08-11T20:04:18.967' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (365, CAST(N'2021-08-11T20:04:19.147' AS DateTime), CAST(N'2021-08-11T20:04:19.163' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (366, CAST(N'2021-08-11T20:04:19.303' AS DateTime), CAST(N'2021-08-11T20:04:19.310' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (367, CAST(N'2021-08-11T20:04:23.987' AS DateTime), CAST(N'2021-08-11T20:04:26.773' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (368, CAST(N'2021-08-11T20:04:26.387' AS DateTime), CAST(N'2021-08-11T20:04:26.390' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (369, CAST(N'2021-08-11T20:04:26.760' AS DateTime), CAST(N'2021-08-11T20:04:26.767' AS DateTime), 0, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (370, CAST(N'2021-08-11T23:18:54.780' AS DateTime), CAST(N'2021-08-11T23:19:00.720' AS DateTime), 0, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (371, CAST(N'2021-08-11T23:18:57.420' AS DateTime), CAST(N'2021-08-11T23:18:57.447' AS DateTime), 1, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (372, CAST(N'2021-08-11T23:18:58.497' AS DateTime), CAST(N'2021-08-11T23:18:58.503' AS DateTime), 1, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (373, CAST(N'2021-08-11T23:19:00.710' AS DateTime), CAST(N'2021-08-11T23:19:00.717' AS DateTime), 1, CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(123.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (376, CAST(N'2021-08-11T23:19:39.783' AS DateTime), CAST(N'2021-08-11T23:19:39.800' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (377, CAST(N'2021-08-11T23:19:40.427' AS DateTime), CAST(N'2021-08-11T23:19:40.433' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (378, CAST(N'2021-08-11T23:19:41.600' AS DateTime), CAST(N'2021-08-11T23:19:41.617' AS DateTime), 0, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (379, CAST(N'2021-08-11T23:34:23.663' AS DateTime), CAST(N'2021-08-11T23:34:23.987' AS DateTime), 0, CAST(500078.00000000000000000000 AS Decimal(38, 20)), CAST(990.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (380, CAST(N'2021-08-11T23:34:33.973' AS DateTime), CAST(N'2021-08-11T23:34:33.983' AS DateTime), 0, CAST(7000.00000000000000000000 AS Decimal(38, 20)), CAST(200.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (381, CAST(N'2021-08-11T23:34:38.410' AS DateTime), CAST(N'2021-08-11T23:34:38.417' AS DateTime), 0, CAST(5000.00000000000000000000 AS Decimal(38, 20)), CAST(90.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (382, CAST(N'2021-08-11T23:34:44.877' AS DateTime), CAST(N'2021-08-11T23:34:44.900' AS DateTime), 0, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(246.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (383, CAST(N'2021-08-11T23:34:49.943' AS DateTime), CAST(N'2021-08-11T23:34:49.950' AS DateTime), 0, CAST(1000.00000000000000000000 AS Decimal(38, 20)), CAST(800.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (384, CAST(N'2021-08-11T23:34:58.413' AS DateTime), CAST(N'2021-08-11T23:34:58.417' AS DateTime), 0, CAST(400.00000000000000000000 AS Decimal(38, 20)), CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (385, CAST(N'2021-08-11T23:35:46.707' AS DateTime), CAST(N'2021-08-11T23:35:46.727' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'53cd122d-6253-4981-b290-11471f67c528', N'53cd122d-6253-4981-b290-11471f67c528')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] ON 
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (5, CAST(N'2021-05-21T00:32:33.493' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
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
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (20, CAST(N'2021-08-06T23:58:20.430' AS DateTime), 1, CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(11.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
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
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (86, CAST(N'2021-08-10T02:08:49.377' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (87, CAST(N'2021-08-10T02:08:54.020' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (88, CAST(N'2021-08-10T02:08:54.177' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (89, CAST(N'2021-08-10T02:08:54.303' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (90, CAST(N'2021-08-10T02:08:54.850' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (91, CAST(N'2021-08-10T02:08:55.007' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (92, CAST(N'2021-08-10T02:08:55.320' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (93, CAST(N'2021-08-10T02:08:55.630' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (374, CAST(N'2021-08-11T23:19:37.020' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (375, CAST(N'2021-08-11T23:19:38.573' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(3.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (382, CAST(N'2021-08-11T23:34:44.877' AS DateTime), 0, CAST(2341.00000000000000000000 AS Decimal(38, 20)), CAST(246.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (385, CAST(N'2021-08-11T23:35:46.707' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (386, CAST(N'2021-08-11T23:35:49.367' AS DateTime), 0, CAST(369.00000000000000000000 AS Decimal(38, 20)), CAST(104.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
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
SET IDENTITY_INSERT [dbo].[IncomeWallets] ON 
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Value], [Address], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (1, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'bf65a226-dce4-45bf-8fc0-e5a5000456ae', N'BTC', CAST(N'2021-04-24T03:14:24.217' AS DateTime), CAST(N'2021-04-24T03:14:24.217' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Value], [Address], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (2, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'e607df8e-5789-466b-922d-fbe85eb8f2ce', N'BTC', CAST(N'2021-04-24T03:14:27.907' AS DateTime), CAST(N'2021-04-24T03:14:27.907' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Value], [Address], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (3, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'a311afd1-8227-4e04-9cec-19f3fd257b2f', N'ETH', CAST(N'2021-04-24T03:18:38.743' AS DateTime), CAST(N'2021-04-24T03:18:38.743' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[IncomeWallets] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (26, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-04-24T03:14:24.227' AS DateTime), CAST(N'2021-04-24T03:14:24.227' AS DateTime), N'3f9af9f40ea743d8bf2daf11ab5271ce')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (29, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-05-07T05:34:20.973' AS DateTime), CAST(N'2021-05-07T05:34:20.973' AS DateTime), N'9a0492b93fe04383bc9d34ccbc259500')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (30, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-05-16T00:53:05.020' AS DateTime), CAST(N'2021-05-16T00:53:05.020' AS DateTime), N'0a90160d09024a378829e9eecdf7ae56')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (27, N'53cd122d-6253-4981-b290-11471f67c528', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'ETH', CAST(N'2021-04-24T03:18:38.747' AS DateTime), CAST(N'2021-04-24T03:18:38.747' AS DateTime), N'0a90160d09024a378829e9eecdf7ae56')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (31, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-08-06T22:10:55.127' AS DateTime), CAST(N'2021-08-06T22:10:55.127' AS DateTime), N'e2aca1b0ffcc4d7a97234994e651ffda')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (32, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-08-06T22:10:55.137' AS DateTime), CAST(N'2021-08-06T22:10:55.137' AS DateTime), N'bbd739f4e67a4828a0c0afc4c77587e6')
GO
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
ALTER TABLE [dbo].[BTC_USDT_ClosedOrders] ADD  CONSTRAINT [DF_BTC_USDT_ClosedOrders_ClosedDate]  DEFAULT (getdate()) FOR [ClosedDate]
GO
ALTER TABLE [dbo].[BTC_USDT_ClosedOrders] ADD  CONSTRAINT [DF_BTC_USDT_ClosedOrders_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DF_Currencies_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IncomeTransactions] ADD  CONSTRAINT [DF_IncomeTransactions_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_Value]  DEFAULT ((0)) FOR [Value]
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
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_ClosedOrder]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_Order]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreateUserIncomeWallet]    Script Date: 11.08.2021 23:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateUserIncomeWallet]
@userid nvarchar(450),
@address nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO IncomeWallets (UserId, Address, CurrencyAcronim, Value)
VALUES (@userid, @address, @currencyAcronim, 0)

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
/****** Object:  StoredProcedure [dbo].[spCreateUserWallet]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_ClosedOrders]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_OpenOrders]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_SortedOrderBook]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_SortedOrderBookBuy]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spGet_BTC_USDT_SortedOrderBookSell]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetUserIncomeWallets]    Script Date: 11.08.2021 23:48:56 ******/
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
      ,iw.[Value]
      ,iw.[Address]
      ,iw.[CurrencyAcronim]
      ,iw.[Created]
      ,iw.[LastUpdate]
  FROM [IncomeWallets] iw
  where iw.[UserId] = @userid

END
GO
/****** Object:  StoredProcedure [dbo].[spGetUserWallets]    Script Date: 11.08.2021 23:48:56 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdate_BTC_USDT_OpenOrder]    Script Date: 11.08.2021 23:48:56 ******/
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
