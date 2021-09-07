USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bots](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[BotAuthCode] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Bots] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
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
CREATE TABLE [dbo].[TestTable](
	[Amount] [decimal](38, 20) NULL,
	[SelectedOrderAmount] [decimal](38, 20) NULL,
	[Text] [nvarchar](450) NULL
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
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
	[Hash] [varchar](66) NOT NULL,
	[Comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
SET IDENTITY_INSERT [dbo].[Bots] ON 
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (1, N'Binance', N'51899c8f-a387-4d1f-9062-31b02c2350c4', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (2, N'BitFinex', N'45f084a8-7f88-4195-8b5e-aaab76fc1982', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (3, N'Huobi', N'a0b54e9f-0f41-4245-b06d-de01fa85dd46', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (4, N'Kucoin', N'34bb06b3-ae3d-459f-b445-645ba4587dc9', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (5, N'Poloniex', N'ace9f8a1-6557-407a-9e8c-54d4855841ec', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
SET IDENTITY_INSERT [dbo].[Bots] OFF
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (1, CAST(N'2021-09-06T18:25:09.510' AS DateTime), CAST(N'2021-09-06T18:25:09.547' AS DateTime), 1, CAST(51639.77000000000000000000 AS Decimal(38, 20)), CAST(0.00016773686286422300 AS Decimal(38, 20)), CAST(8.66189301883001694871 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (3, CAST(N'2021-09-06T18:25:59.570' AS DateTime), CAST(N'2021-09-06T18:26:05.653' AS DateTime), 1, CAST(51648.33000000000000000000 AS Decimal(38, 20)), CAST(0.00001562779658270440 AS Decimal(38, 20)), CAST(2.17638463861218221786 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (4, CAST(N'2021-09-06T18:26:01.633' AS DateTime), CAST(N'2021-09-06T18:26:02.610' AS DateTime), 1, CAST(51645.80000000000000000000 AS Decimal(38, 20)), CAST(0.00005738189353485680 AS Decimal(38, 20)), CAST(2.96353379712250732144 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (5, CAST(N'2021-09-06T18:26:02.587' AS DateTime), CAST(N'2021-09-06T18:26:38.007' AS DateTime), 0, CAST(51645.80000000000000000000 AS Decimal(38, 20)), CAST(0.00009350100154685820 AS Decimal(38, 20)), CAST(7.79246782281123654700 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (6, CAST(N'2021-09-06T18:26:04.670' AS DateTime), CAST(N'2021-09-06T18:26:04.670' AS DateTime), 0, CAST(51652.23000000000000000000 AS Decimal(38, 20)), CAST(0.00002651073216763820 AS Decimal(38, 20)), CAST(1.36933843539124686319 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (7, CAST(N'2021-09-06T18:26:05.653' AS DateTime), CAST(N'2021-09-06T18:40:08.223' AS DateTime), 0, CAST(51652.24000000000000000000 AS Decimal(38, 20)), CAST(0.00002148903348552443 AS Decimal(38, 20)), CAST(7.83589593360492212016 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (8, CAST(N'2021-09-06T18:26:07.707' AS DateTime), CAST(N'2021-09-06T18:40:14.303' AS DateTime), 0, CAST(51652.27000000000000000000 AS Decimal(38, 20)), CAST(0.00003697407964476104 AS Decimal(38, 20)), CAST(2.14659123455347892614 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (9, CAST(N'2021-09-06T18:26:08.677' AS DateTime), CAST(N'2021-09-06T18:26:51.153' AS DateTime), 1, CAST(51652.28000000000000000000 AS Decimal(38, 20)), CAST(0.00008001649411395980 AS Decimal(38, 20)), CAST(7.21427004685529951636 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (10, CAST(N'2021-09-06T18:26:11.703' AS DateTime), CAST(N'2021-09-06T18:26:36.007' AS DateTime), 0, CAST(51648.77000000000000000000 AS Decimal(38, 20)), CAST(0.00000007368242371533 AS Decimal(38, 20)), CAST(0.46599302789639463665 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (11, CAST(N'2021-09-06T18:26:13.743' AS DateTime), CAST(N'2021-09-06T18:27:42.643' AS DateTime), 0, CAST(51649.39000000000000000000 AS Decimal(38, 20)), CAST(0.00005151102843299100 AS Decimal(38, 20)), CAST(8.95678558464822345018 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (12, CAST(N'2021-09-06T18:26:14.727' AS DateTime), CAST(N'2021-09-06T18:38:34.700' AS DateTime), 0, CAST(51645.89000000000000000000 AS Decimal(38, 20)), CAST(0.00001839943463839600 AS Decimal(38, 20)), CAST(5.91853908845298183951 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (13, CAST(N'2021-09-06T18:26:16.787' AS DateTime), CAST(N'2021-09-06T18:26:16.787' AS DateTime), 1, CAST(51648.04000000000000000000 AS Decimal(38, 20)), CAST(0.00000894866269498536 AS Decimal(38, 20)), CAST(0.46218088881711167269 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (14, CAST(N'2021-09-06T18:26:17.760' AS DateTime), CAST(N'2021-09-06T18:28:09.923' AS DateTime), 0, CAST(51648.03000000000000000000 AS Decimal(38, 20)), CAST(0.00004857371516925000 AS Decimal(38, 20)), CAST(8.19974042225784904437 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (15, CAST(N'2021-09-06T18:26:20.813' AS DateTime), CAST(N'2021-09-06T18:28:11.863' AS DateTime), 0, CAST(51648.07000000000000000000 AS Decimal(38, 20)), CAST(0.00001247472148969520 AS Decimal(38, 20)), CAST(0.64429528873028196826 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (16, CAST(N'2021-09-06T18:26:22.817' AS DateTime), CAST(N'2021-09-06T18:27:41.590' AS DateTime), 0, CAST(51649.33000000000000000000 AS Decimal(38, 20)), CAST(0.00005627398679790740 AS Decimal(38, 20)), CAST(2.90651371454076261204 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (17, CAST(N'2021-09-06T18:26:23.853' AS DateTime), CAST(N'2021-09-06T18:26:23.853' AS DateTime), 1, CAST(51649.34000000000000000000 AS Decimal(38, 20)), CAST(0.00012190409969627100 AS Decimal(38, 20)), CAST(6.29626629260659761114 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (18, CAST(N'2021-09-06T18:26:25.843' AS DateTime), CAST(N'2021-09-06T18:50:12.210' AS DateTime), 1, CAST(51654.40000000000000000000 AS Decimal(38, 20)), CAST(0.00009608148722726920 AS Decimal(38, 20)), CAST(4.96303157383225416448 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (19, CAST(N'2021-09-06T18:26:26.887' AS DateTime), CAST(N'2021-09-06T18:26:26.900' AS DateTime), 1, CAST(51645.81000000000000000000 AS Decimal(38, 20)), CAST(0.00009619901818046300 AS Decimal(38, 20)), CAST(4.96827621513473781003 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (20, CAST(N'2021-09-06T18:26:28.903' AS DateTime), CAST(N'2021-09-06T18:27:39.620' AS DateTime), 0, CAST(51650.60000000000000000000 AS Decimal(38, 20)), CAST(0.00004208178624607750 AS Decimal(38, 20)), CAST(5.91767092887658591340 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (21, CAST(N'2021-09-06T18:26:29.943' AS DateTime), CAST(N'2021-09-06T18:26:29.947' AS DateTime), 1, CAST(51650.61000000000000000000 AS Decimal(38, 20)), CAST(0.00009597443700580600 AS Decimal(38, 20)), CAST(4.95713821575645344166 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (22, CAST(N'2021-09-06T18:26:32.973' AS DateTime), CAST(N'2021-09-06T18:38:49.870' AS DateTime), 0, CAST(51650.60000000000000000000 AS Decimal(38, 20)), CAST(0.00010652625658853300 AS Decimal(38, 20)), CAST(5.50214506855168256980 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (23, CAST(N'2021-09-06T18:26:34.973' AS DateTime), CAST(N'2021-09-06T18:27:02.210' AS DateTime), 1, CAST(51652.86000000000000000000 AS Decimal(38, 20)), CAST(0.00011729774480559800 AS Decimal(38, 20)), CAST(6.05876399075928071028 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (24, CAST(N'2021-09-06T18:26:36.000' AS DateTime), CAST(N'2021-09-06T18:26:42.070' AS DateTime), 1, CAST(51648.34000000000000000000 AS Decimal(38, 20)), CAST(0.00002742545298646457 AS Decimal(38, 20)), CAST(1.42028469537101093637 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (25, CAST(N'2021-09-06T18:26:38.003' AS DateTime), CAST(N'2021-09-06T18:26:41.030' AS DateTime), 1, CAST(51645.49000000000000000000 AS Decimal(38, 20)), CAST(0.00008290947083519280 AS Decimal(38, 20)), CAST(9.11080528730249109999 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (26, CAST(N'2021-09-06T18:26:39.047' AS DateTime), CAST(N'2021-09-06T18:38:33.770' AS DateTime), 0, CAST(51645.48000000000000000000 AS Decimal(38, 20)), CAST(0.00018913991068915500 AS Decimal(38, 20)), CAST(9.76822147469854076940 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (27, CAST(N'2021-09-06T18:26:41.027' AS DateTime), CAST(N'2021-09-06T18:27:47.633' AS DateTime), 0, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007111185326758420 AS Decimal(38, 20)), CAST(7.95520138990843205000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (28, CAST(N'2021-09-06T18:26:42.067' AS DateTime), CAST(N'2021-09-06T18:38:46.810' AS DateTime), 0, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000510918172314263 AS Decimal(38, 20)), CAST(1.68041388275121188000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (29, CAST(N'2021-09-06T18:26:44.057' AS DateTime), CAST(N'2021-09-06T18:39:17.163' AS DateTime), 0, CAST(51651.98000000000000000000 AS Decimal(38, 20)), CAST(0.00011091727042147800 AS Decimal(38, 20)), CAST(5.72909663346477322644 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (30, CAST(N'2021-09-06T18:26:45.093' AS DateTime), CAST(N'2021-09-06T18:26:45.093' AS DateTime), 0, CAST(51652.84000000000000000000 AS Decimal(38, 20)), CAST(0.00002485643309767190 AS Decimal(38, 20)), CAST(1.28390536176475102320 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (31, CAST(N'2021-09-06T18:26:47.080' AS DateTime), CAST(N'2021-09-06T18:50:24.310' AS DateTime), 1, CAST(51654.40000000000000000000 AS Decimal(38, 20)), CAST(0.00005360884370916004 AS Decimal(38, 20)), CAST(3.97755609612909758336 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (33, CAST(N'2021-09-06T18:26:50.103' AS DateTime), CAST(N'2021-09-06T18:26:50.103' AS DateTime), 0, CAST(51655.67000000000000000000 AS Decimal(38, 20)), CAST(0.00003479699726905530 AS Decimal(38, 20)), CAST(1.79746220792122178855 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (34, CAST(N'2021-09-06T18:26:51.150' AS DateTime), CAST(N'2021-09-06T18:27:00.230' AS DateTime), 0, CAST(51655.67000000000000000000 AS Decimal(38, 20)), CAST(0.00001737643034075200 AS Decimal(38, 20)), CAST(5.03089676596752268591 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (35, CAST(N'2021-09-06T18:26:53.130' AS DateTime), CAST(N'2021-09-06T18:39:16.387' AS DateTime), 0, CAST(51651.52000000000000000000 AS Decimal(38, 20)), CAST(0.00003821725651538820 AS Decimal(38, 20)), CAST(5.85575034531725754336 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (36, CAST(N'2021-09-06T18:26:54.187' AS DateTime), CAST(N'2021-09-06T18:38:55.960' AS DateTime), 0, CAST(51651.51000000000000000000 AS Decimal(38, 20)), CAST(0.00014600045250076800 AS Decimal(38, 20)), CAST(7.54114383234794335968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (40, CAST(N'2021-09-06T18:27:00.227' AS DateTime), CAST(N'2021-09-06T18:50:12.010' AS DateTime), 1, CAST(51654.27000000000000000000 AS Decimal(38, 20)), CAST(0.00008472924571704560 AS Decimal(38, 20)), CAST(6.22077995349467838126 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (41, CAST(N'2021-09-06T18:27:02.210' AS DateTime), CAST(N'2021-09-06T18:27:05.233' AS DateTime), 0, CAST(51655.10000000000000000000 AS Decimal(38, 20)), CAST(0.00000809138249982600 AS Decimal(38, 20)), CAST(6.47698790987440726240 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (44, CAST(N'2021-09-06T18:27:06.280' AS DateTime), CAST(N'2021-09-06T18:27:06.280' AS DateTime), 0, CAST(51655.06000000000000000000 AS Decimal(38, 20)), CAST(0.00001832541228194040 AS Decimal(38, 20)), CAST(0.94660027094836827842 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (45, CAST(N'2021-09-06T18:27:09.303' AS DateTime), CAST(N'2021-09-06T18:27:11.280' AS DateTime), 0, CAST(51653.09000000000000000000 AS Decimal(38, 20)), CAST(0.00008858321089697220 AS Decimal(38, 20)), CAST(4.57559656495028577410 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (46, CAST(N'2021-09-06T18:27:11.273' AS DateTime), CAST(N'2021-09-06T18:27:18.407' AS DateTime), 1, CAST(51653.08000000000000000000 AS Decimal(38, 20)), CAST(0.00000985727012616460 AS Decimal(38, 20)), CAST(5.08475404152656698134 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (47, CAST(N'2021-09-06T18:27:14.303' AS DateTime), CAST(N'2021-09-06T18:50:09.190' AS DateTime), 1, CAST(51653.09000000000000000000 AS Decimal(38, 20)), CAST(0.00002431736086696216 AS Decimal(38, 20)), CAST(8.45518934024162984201 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (48, CAST(N'2021-09-06T18:27:15.380' AS DateTime), CAST(N'2021-09-06T18:27:21.433' AS DateTime), 1, CAST(51653.08000000000000000000 AS Decimal(38, 20)), CAST(0.00001935985890187310 AS Decimal(38, 20)), CAST(1.84651635036127278724 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (49, CAST(N'2021-09-06T18:27:18.403' AS DateTime), CAST(N'2021-09-06T18:42:12.667' AS DateTime), 0, CAST(51656.76000000000000000000 AS Decimal(38, 20)), CAST(0.00001566435313581640 AS Decimal(38, 20)), CAST(7.08097236455522599380 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (50, CAST(N'2021-09-06T18:27:20.340' AS DateTime), CAST(N'2021-09-06T18:27:20.340' AS DateTime), 0, CAST(51656.76000000000000000000 AS Decimal(38, 20)), CAST(0.00001638856791722990 AS Decimal(38, 20)), CAST(0.84658031964404480912 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (51, CAST(N'2021-09-06T18:27:21.430' AS DateTime), CAST(N'2021-09-06T18:27:48.740' AS DateTime), 0, CAST(51655.54000000000000000000 AS Decimal(38, 20)), CAST(0.00005933686981878070 AS Decimal(38, 20)), CAST(7.60334208592481041028 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (52, CAST(N'2021-09-06T18:27:23.357' AS DateTime), CAST(N'2021-09-06T18:27:23.357' AS DateTime), 1, CAST(51655.54000000000000000000 AS Decimal(38, 20)), CAST(0.00006849642976582820 AS Decimal(38, 20)), CAST(3.53822006762592921823 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (53, CAST(N'2021-09-06T18:27:26.377' AS DateTime), CAST(N'2021-09-06T18:27:59.747' AS DateTime), 0, CAST(51650.77000000000000000000 AS Decimal(38, 20)), CAST(0.00001380422264980300 AS Decimal(38, 20)), CAST(8.86283165700760285670 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (54, CAST(N'2021-09-06T18:27:27.457' AS DateTime), CAST(N'2021-09-06T18:27:27.457' AS DateTime), 1, CAST(51650.77000000000000000000 AS Decimal(38, 20)), CAST(0.00015778724940390700 AS Decimal(38, 20)), CAST(8.14983292789383755839 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (55, CAST(N'2021-09-06T18:27:29.403' AS DateTime), CAST(N'2021-09-06T18:27:29.403' AS DateTime), 1, CAST(51647.16000000000000000000 AS Decimal(38, 20)), CAST(0.00011018820512582900 AS Decimal(38, 20)), CAST(5.69090786024651049564 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (56, CAST(N'2021-09-06T18:27:30.480' AS DateTime), CAST(N'2021-09-06T18:38:43.787' AS DateTime), 0, CAST(51647.16000000000000000000 AS Decimal(38, 20)), CAST(0.00005688090867217670 AS Decimal(38, 20)), CAST(2.93773739113729757317 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (57, CAST(N'2021-09-06T18:27:32.443' AS DateTime), CAST(N'2021-09-06T18:38:37.723' AS DateTime), 0, CAST(51647.15000000000000000000 AS Decimal(38, 20)), CAST(0.00000950669423188399 AS Decimal(38, 20)), CAST(0.75365237067848327444 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (58, CAST(N'2021-09-06T18:27:33.540' AS DateTime), CAST(N'2021-09-06T18:38:39.823' AS DateTime), 0, CAST(51647.15000000000000000000 AS Decimal(38, 20)), CAST(0.00001463939334016260 AS Decimal(38, 20)), CAST(0.75608294374837882659 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (59, CAST(N'2021-09-06T18:27:35.507' AS DateTime), CAST(N'2021-09-06T18:27:36.600' AS DateTime), 0, CAST(51647.20000000000000000000 AS Decimal(38, 20)), CAST(0.00008097142115280560 AS Decimal(38, 20)), CAST(4.18194718256318138432 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (60, CAST(N'2021-09-06T18:27:36.590' AS DateTime), CAST(N'2021-09-06T18:27:44.607' AS DateTime), 1, CAST(51647.20000000000000000000 AS Decimal(38, 20)), CAST(0.00008077156323975540 AS Decimal(38, 20)), CAST(8.35357226351947647920 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (61, CAST(N'2021-09-06T18:27:38.563' AS DateTime), CAST(N'2021-09-06T18:27:38.567' AS DateTime), 1, CAST(51650.10000000000000000000 AS Decimal(38, 20)), CAST(0.00007248940806486150 AS Decimal(38, 20)), CAST(3.74408517549090296115 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (62, CAST(N'2021-09-06T18:27:39.620' AS DateTime), CAST(N'2021-09-06T18:49:50.993' AS DateTime), 1, CAST(51650.10000000000000000000 AS Decimal(38, 20)), CAST(0.00007708844089744950 AS Decimal(38, 20)), CAST(6.15515414898588390270 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (63, CAST(N'2021-09-06T18:27:41.587' AS DateTime), CAST(N'2021-09-06T18:27:53.680' AS DateTime), 1, CAST(51648.26000000000000000000 AS Decimal(38, 20)), CAST(0.00002897566893555920 AS Decimal(38, 20)), CAST(6.74739256372081746578 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (64, CAST(N'2021-09-06T18:27:42.640' AS DateTime), CAST(N'2021-09-06T18:28:00.840' AS DateTime), 1, CAST(51648.26000000000000000000 AS Decimal(38, 20)), CAST(0.00006036306762153422 AS Decimal(38, 20)), CAST(5.92991705445771830390 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (65, CAST(N'2021-09-06T18:27:44.603' AS DateTime), CAST(N'2021-09-06T18:28:14.880' AS DateTime), 0, CAST(51648.25000000000000000000 AS Decimal(38, 20)), CAST(0.00005124754312040560 AS Decimal(38, 20)), CAST(6.81855581006618536825 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (66, CAST(N'2021-09-06T18:27:47.630' AS DateTime), CAST(N'2021-09-06T18:28:03.857' AS DateTime), 1, CAST(51648.28000000000000000000 AS Decimal(38, 20)), CAST(0.00008941911938107480 AS Decimal(38, 20)), CAST(8.29114862403028165652 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (67, CAST(N'2021-09-06T18:27:48.737' AS DateTime), CAST(N'2021-09-06T18:50:02.937' AS DateTime), 1, CAST(51653.07000000000000000000 AS Decimal(38, 20)), CAST(0.00002046458573102260 AS Decimal(38, 20)), CAST(4.12199016961587834113 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (68, CAST(N'2021-09-06T18:27:50.657' AS DateTime), CAST(N'2021-09-06T18:27:50.653' AS DateTime), 1, CAST(51653.07000000000000000000 AS Decimal(38, 20)), CAST(0.00011155573824027400 AS Decimal(38, 20)), CAST(5.76219635622654974118 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (69, CAST(N'2021-09-06T18:27:51.767' AS DateTime), CAST(N'2021-09-06T18:27:51.767' AS DateTime), 0, CAST(51653.06000000000000000000 AS Decimal(38, 20)), CAST(0.00004539158104238640 AS Decimal(38, 20)), CAST(2.34461405907724726238 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (70, CAST(N'2021-09-06T18:27:53.680' AS DateTime), CAST(N'2021-09-06T18:42:09.620' AS DateTime), 0, CAST(51653.06000000000000000000 AS Decimal(38, 20)), CAST(0.00003749860005336780 AS Decimal(38, 20)), CAST(3.43359940454118566662 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (71, CAST(N'2021-09-06T18:27:54.787' AS DateTime), CAST(N'2021-09-06T18:27:54.787' AS DateTime), 0, CAST(51649.52000000000000000000 AS Decimal(38, 20)), CAST(0.00000293939532848978 AS Decimal(38, 20)), CAST(0.15181835780673946191 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (72, CAST(N'2021-09-06T18:27:56.717' AS DateTime), CAST(N'2021-09-06T18:28:08.840' AS DateTime), 0, CAST(51647.29000000000000000000 AS Decimal(38, 20)), CAST(0.00003151228224463400 AS Decimal(38, 20)), CAST(9.97353169070779026771 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (73, CAST(N'2021-09-06T18:27:57.807' AS DateTime), CAST(N'2021-09-06T18:27:57.807' AS DateTime), 1, CAST(51647.29000000000000000000 AS Decimal(38, 20)), CAST(0.00016159623691886500 AS Decimal(38, 20)), CAST(8.34600771105732712585 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (74, CAST(N'2021-09-06T18:27:59.743' AS DateTime), CAST(N'2021-09-06T18:50:00.100' AS DateTime), 1, CAST(51650.67000000000000000000 AS Decimal(38, 20)), CAST(0.00004094628898471000 AS Decimal(38, 20)), CAST(9.07853134078643953575 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (75, CAST(N'2021-09-06T18:28:00.837' AS DateTime), CAST(N'2021-09-06T18:38:52.927' AS DateTime), 0, CAST(51650.66000000000000000000 AS Decimal(38, 20)), CAST(0.00003735418572898668 AS Decimal(38, 20)), CAST(9.77137862099902173924 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (76, CAST(N'2021-09-06T18:28:03.853' AS DateTime), CAST(N'2021-09-06T18:42:10.253' AS DateTime), 0, CAST(51653.51000000000000000000 AS Decimal(38, 20)), CAST(0.00010889015612606520 AS Decimal(38, 20)), CAST(10.24337014550081106140 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (77, CAST(N'2021-09-06T18:28:05.803' AS DateTime), CAST(N'2021-09-06T18:28:06.883' AS DateTime), 0, CAST(51649.53000000000000000000 AS Decimal(38, 20)), CAST(0.00009781438200632780 AS Decimal(38, 20)), CAST(5.05206685786728789593 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (78, CAST(N'2021-09-06T18:28:06.880' AS DateTime), CAST(N'2021-09-06T18:49:50.760' AS DateTime), 1, CAST(51649.50000000000000000000 AS Decimal(38, 20)), CAST(0.00000115795051732940 AS Decimal(38, 20)), CAST(5.11187148868063255140 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (79, CAST(N'2021-09-06T18:28:08.837' AS DateTime), CAST(N'2021-09-06T18:49:17.607' AS DateTime), 1, CAST(51647.21000000000000000000 AS Decimal(38, 20)), CAST(0.00010482743908875998 AS Decimal(38, 20)), CAST(7.17461992567780134968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (80, CAST(N'2021-09-06T18:28:09.920' AS DateTime), CAST(N'2021-09-06T18:49:05.483' AS DateTime), 1, CAST(51647.20000000000000000000 AS Decimal(38, 20)), CAST(0.00002939627618966440 AS Decimal(38, 20)), CAST(4.02693173771212379968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (81, CAST(N'2021-09-06T18:28:11.860' AS DateTime), CAST(N'2021-09-06T18:49:11.557' AS DateTime), 1, CAST(51647.20000000000000000000 AS Decimal(38, 20)), CAST(0.00001297334926807020 AS Decimal(38, 20)), CAST(1.31432160004046116688 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (82, CAST(N'2021-09-06T18:28:14.877' AS DateTime), CAST(N'2021-09-06T18:28:18.980' AS DateTime), 1, CAST(51647.19000000000000000000 AS Decimal(38, 20)), CAST(0.00006702535416326840 AS Decimal(38, 20)), CAST(6.10846279786039497606 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (83, CAST(N'2021-09-06T18:28:18.980' AS DateTime), CAST(N'2021-09-06T18:38:45.890' AS DateTime), 0, CAST(51647.19000000000000000000 AS Decimal(38, 20)), CAST(0.00002843191904408380 AS Decimal(38, 20)), CAST(4.93009992622202847032 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (84, CAST(N'2021-09-06T18:28:20.920' AS DateTime), CAST(N'2021-09-06T18:36:17.067' AS DateTime), 0, CAST(51634.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006244050444217430 AS Decimal(38, 20)), CAST(4.88089691567838099016 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (85, CAST(N'2021-09-06T18:28:22.007' AS DateTime), CAST(N'2021-09-06T18:28:48.220' AS DateTime), 0, CAST(51634.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006915646561847833 AS Decimal(38, 20)), CAST(4.01006629790690991830 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (86, CAST(N'2021-09-06T18:28:23.943' AS DateTime), CAST(N'2021-09-06T18:28:23.940' AS DateTime), 1, CAST(51633.30000000000000000000 AS Decimal(38, 20)), CAST(0.00000850680899271127 AS Decimal(38, 20)), CAST(0.43923462076335881729 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (87, CAST(N'2021-09-06T18:28:25.030' AS DateTime), CAST(N'2021-09-06T18:37:06.590' AS DateTime), 0, CAST(51638.98000000000000000000 AS Decimal(38, 20)), CAST(0.00004129268342689270 AS Decimal(38, 20)), CAST(2.13231205362764359745 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (88, CAST(N'2021-09-06T18:28:26.957' AS DateTime), CAST(N'2021-09-06T18:28:31.090' AS DateTime), 0, CAST(51634.23000000000000000000 AS Decimal(38, 20)), CAST(0.00007700974786514870 AS Decimal(38, 20)), CAST(3.97633903351109696000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (89, CAST(N'2021-09-06T18:28:28.070' AS DateTime), CAST(N'2021-09-06T18:29:04.447' AS DateTime), 0, CAST(51636.16000000000000000000 AS Decimal(38, 20)), CAST(0.00003312008000590000 AS Decimal(38, 20)), CAST(9.66653284002129520928 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (90, CAST(N'2021-09-06T18:28:29.980' AS DateTime), CAST(N'2021-09-06T18:36:36.263' AS DateTime), 0, CAST(51634.22000000000000000000 AS Decimal(38, 20)), CAST(0.00005648943058051610 AS Decimal(38, 20)), CAST(2.91678768626909602094 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (91, CAST(N'2021-09-06T18:28:31.087' AS DateTime), CAST(N'2021-09-06T18:29:06.383' AS DateTime), 1, CAST(51634.23000000000000000000 AS Decimal(38, 20)), CAST(0.00005439837242215830 AS Decimal(38, 20)), CAST(6.78515710678247571861 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (92, CAST(N'2021-09-06T18:28:33.013' AS DateTime), CAST(N'2021-09-06T18:29:33.673' AS DateTime), 0, CAST(51624.07000000000000000000 AS Decimal(38, 20)), CAST(0.00003869519812925500 AS Decimal(38, 20)), CAST(1.99760361688852916785 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (93, CAST(N'2021-09-06T18:28:34.113' AS DateTime), CAST(N'2021-09-06T18:28:43.243' AS DateTime), 0, CAST(51622.53000000000000000000 AS Decimal(38, 20)), CAST(0.00004160525921806935 AS Decimal(38, 20)), CAST(2.46880410231710720750 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (94, CAST(N'2021-09-06T18:28:36.047' AS DateTime), CAST(N'2021-09-06T18:29:16.563' AS DateTime), 0, CAST(51614.99000000000000000000 AS Decimal(38, 20)), CAST(0.00007884388271665400 AS Decimal(38, 20)), CAST(8.91609032782362890156 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (95, CAST(N'2021-09-06T18:28:37.160' AS DateTime), CAST(N'2021-09-06T18:31:31.870' AS DateTime), 0, CAST(51614.99000000000000000000 AS Decimal(38, 20)), CAST(0.00003010382243902596 AS Decimal(38, 20)), CAST(2.47450934797095296023 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (96, CAST(N'2021-09-06T18:28:39.107' AS DateTime), CAST(N'2021-09-06T18:28:39.120' AS DateTime), 1, CAST(51615.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000621890016189725 AS Decimal(38, 20)), CAST(0.32098853185632655875 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (97, CAST(N'2021-09-06T18:28:43.223' AS DateTime), CAST(N'2021-09-06T18:28:51.257' AS DateTime), 1, CAST(51615.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003911235958296445 AS Decimal(38, 20)), CAST(8.62093987456799299500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (98, CAST(N'2021-09-06T18:28:45.173' AS DateTime), CAST(N'2021-09-06T18:28:45.173' AS DateTime), 1, CAST(51614.97000000000000000000 AS Decimal(38, 20)), CAST(0.00009389838319919000 AS Decimal(38, 20)), CAST(4.84656223187469587430 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (99, CAST(N'2021-09-06T18:28:46.303' AS DateTime), CAST(N'2021-09-06T18:28:46.303' AS DateTime), 0, CAST(51631.40000000000000000000 AS Decimal(38, 20)), CAST(0.00008630630592177920 AS Decimal(38, 20)), CAST(4.45611540356975058688 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (100, CAST(N'2021-09-06T18:28:48.220' AS DateTime), CAST(N'2021-09-06T18:29:01.430' AS DateTime), 1, CAST(51632.44000000000000000000 AS Decimal(38, 20)), CAST(0.00005889577262983467 AS Decimal(38, 20)), CAST(6.61164950822172607372 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (101, CAST(N'2021-09-06T18:28:49.340' AS DateTime), CAST(N'2021-09-06T18:28:49.340' AS DateTime), 1, CAST(51626.64000000000000000000 AS Decimal(38, 20)), CAST(0.00001863902547333340 AS Decimal(38, 20)), CAST(0.96227025806261304178 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (102, CAST(N'2021-09-06T18:28:51.253' AS DateTime), CAST(N'2021-09-06T18:29:36.700' AS DateTime), 0, CAST(51626.65000000000000000000 AS Decimal(38, 20)), CAST(0.00001302374210815125 AS Decimal(38, 20)), CAST(2.69161227437163835341 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (103, CAST(N'2021-09-06T18:28:54.283' AS DateTime), CAST(N'2021-09-06T18:29:15.467' AS DateTime), 0, CAST(51632.42000000000000000000 AS Decimal(38, 20)), CAST(0.00011675232346949777 AS Decimal(38, 20)), CAST(9.82858461101867836514 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (104, CAST(N'2021-09-06T18:28:55.397' AS DateTime), CAST(N'2021-09-06T18:28:55.397' AS DateTime), 1, CAST(51632.42000000000000000000 AS Decimal(38, 20)), CAST(0.00007060309251332800 AS Decimal(38, 20)), CAST(3.64540852594700689376 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (105, CAST(N'2021-09-06T18:28:57.307' AS DateTime), CAST(N'2021-09-06T18:28:57.307' AS DateTime), 1, CAST(51632.43000000000000000000 AS Decimal(38, 20)), CAST(0.00001344917258874010 AS Decimal(38, 20)), CAST(0.69441346224604200144 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (106, CAST(N'2021-09-06T18:29:00.333' AS DateTime), CAST(N'2021-09-06T18:29:00.333' AS DateTime), 1, CAST(51636.11000000000000000000 AS Decimal(38, 20)), CAST(0.00015408463932298300 AS Decimal(38, 20)), CAST(7.95633138539187571613 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (107, CAST(N'2021-09-06T18:29:01.427' AS DateTime), CAST(N'2021-09-06T18:30:22.150' AS DateTime), 0, CAST(51632.63000000000000000000 AS Decimal(38, 20)), CAST(0.00004800442021712833 AS Decimal(38, 20)), CAST(5.51953810419588720269 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (108, CAST(N'2021-09-06T18:29:03.357' AS DateTime), CAST(N'2021-09-06T18:30:25.230' AS DateTime), 0, CAST(51633.84000000000000000000 AS Decimal(38, 20)), CAST(0.00013907537578562030 AS Decimal(38, 20)), CAST(10.11112144685851341240 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (109, CAST(N'2021-09-06T18:29:04.443' AS DateTime), CAST(N'2021-09-06T18:29:07.493' AS DateTime), 1, CAST(51634.54000000000000000000 AS Decimal(38, 20)), CAST(0.00013548510239249200 AS Decimal(38, 20)), CAST(8.70585103475706765968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (110, CAST(N'2021-09-06T18:29:06.380' AS DateTime), CAST(N'2021-09-06T18:36:42.333' AS DateTime), 0, CAST(51634.54000000000000000000 AS Decimal(38, 20)), CAST(0.00004782058924800744 AS Decimal(38, 20)), CAST(5.77681706655343355260 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (111, CAST(N'2021-09-06T18:29:07.490' AS DateTime), CAST(N'2021-09-06T18:37:08.730' AS DateTime), 0, CAST(51643.18000000000000000000 AS Decimal(38, 20)), CAST(0.00002358142427335700 AS Decimal(38, 20)), CAST(8.21470126857923975982 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (112, CAST(N'2021-09-06T18:29:09.410' AS DateTime), CAST(N'2021-09-06T18:37:49.170' AS DateTime), 0, CAST(51643.18000000000000000000 AS Decimal(38, 20)), CAST(0.00000740195336165000 AS Decimal(38, 20)), CAST(5.97098445558049213672 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (113, CAST(N'2021-09-06T18:29:12.440' AS DateTime), CAST(N'2021-09-06T18:31:08.660' AS DateTime), 0, CAST(51634.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007572346882695490 AS Decimal(38, 20)), CAST(3.90990558941098930660 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (114, CAST(N'2021-09-06T18:29:13.527' AS DateTime), CAST(N'2021-09-06T18:29:13.527' AS DateTime), 1, CAST(51627.89000000000000000000 AS Decimal(38, 20)), CAST(0.00000300142979389123 AS Decimal(38, 20)), CAST(0.15495748724173909440 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (115, CAST(N'2021-09-06T18:29:15.463' AS DateTime), CAST(N'2021-09-06T18:46:00.493' AS DateTime), 1, CAST(51627.89000000000000000000 AS Decimal(38, 20)), CAST(0.00001954259016529723 AS Decimal(38, 20)), CAST(7.03661880869669643255 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (116, CAST(N'2021-09-06T18:29:16.563' AS DateTime), CAST(N'2021-09-06T18:29:22.613' AS DateTime), 1, CAST(51610.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003822241129270870 AS Decimal(38, 20)), CAST(7.95911566358222049188 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (117, CAST(N'2021-09-06T18:29:18.493' AS DateTime), CAST(N'2021-09-06T18:31:41.957' AS DateTime), 0, CAST(51603.98000000000000000000 AS Decimal(38, 20)), CAST(0.00002371295393617500 AS Decimal(38, 20)), CAST(1.22368280066329597650 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (118, CAST(N'2021-09-06T18:29:19.587' AS DateTime), CAST(N'2021-09-06T18:31:56.173' AS DateTime), 0, CAST(51603.98000000000000000000 AS Decimal(38, 20)), CAST(0.00003611253427160560 AS Decimal(38, 20)), CAST(1.86355049630124995029 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (119, CAST(N'2021-09-06T18:29:21.527' AS DateTime), CAST(N'2021-09-06T18:29:21.527' AS DateTime), 0, CAST(51613.73000000000000000000 AS Decimal(38, 20)), CAST(0.00003715021677182530 AS Decimal(38, 20)), CAST(1.91746125790246264137 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (120, CAST(N'2021-09-06T18:29:22.610' AS DateTime), CAST(N'2021-09-06T18:29:27.567' AS DateTime), 0, CAST(51616.02000000000000000000 AS Decimal(38, 20)), CAST(0.00008528988607474130 AS Decimal(38, 20)), CAST(6.37521321116424654900 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (121, CAST(N'2021-09-06T18:29:24.550' AS DateTime), CAST(N'2021-09-06T18:32:06.257' AS DateTime), 0, CAST(51616.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006904693463307246 AS Decimal(38, 20)), CAST(6.15460472885361768967 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (122, CAST(N'2021-09-06T18:29:25.640' AS DateTime), CAST(N'2021-09-06T18:29:25.640' AS DateTime), 1, CAST(51616.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000279170768465461 AS Decimal(38, 20)), CAST(0.14409681176820919631 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (123, CAST(N'2021-09-06T18:29:27.567' AS DateTime), CAST(N'2021-09-06T18:29:34.700' AS DateTime), 1, CAST(51616.02000000000000000000 AS Decimal(38, 20)), CAST(0.00003906113283664970 AS Decimal(38, 20)), CAST(6.41850467915073608382 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (124, CAST(N'2021-09-06T18:29:33.670' AS DateTime), CAST(N'2021-09-06T18:29:42.757' AS DateTime), 1, CAST(51619.06000000000000000000 AS Decimal(38, 20)), CAST(0.00000492259254908300 AS Decimal(38, 20)), CAST(9.75095143882029524220 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (125, CAST(N'2021-09-06T18:29:34.697' AS DateTime), CAST(N'2021-09-06T18:30:10.053' AS DateTime), 0, CAST(51617.58000000000000000000 AS Decimal(38, 20)), CAST(0.00009600501586497030 AS Decimal(38, 20)), CAST(6.97178773589776647960 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (126, CAST(N'2021-09-06T18:29:36.697' AS DateTime), CAST(N'2021-09-06T18:30:55.527' AS DateTime), 1, CAST(51621.35000000000000000000 AS Decimal(38, 20)), CAST(0.00002339420552523575 AS Decimal(38, 20)), CAST(8.47850718909072966725 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (127, CAST(N'2021-09-06T18:29:37.727' AS DateTime), CAST(N'2021-09-06T18:29:37.727' AS DateTime), 0, CAST(51621.34000000000000000000 AS Decimal(38, 20)), CAST(0.00014528435978353200 AS Decimal(38, 20)), CAST(7.49977333306803177288 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (128, CAST(N'2021-09-06T18:29:42.740' AS DateTime), CAST(N'2021-09-06T18:30:17.113' AS DateTime), 0, CAST(51621.34000000000000000000 AS Decimal(38, 20)), CAST(0.00003005767177327450 AS Decimal(38, 20)), CAST(9.74889504749708806814 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (129, CAST(N'2021-09-06T18:29:43.760' AS DateTime), CAST(N'2021-09-06T18:29:43.773' AS DateTime), 0, CAST(51621.35000000000000000000 AS Decimal(38, 20)), CAST(0.00012782624956584800 AS Decimal(38, 20)), CAST(6.59856356802598765480 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (130, CAST(N'2021-09-06T18:29:45.820' AS DateTime), CAST(N'2021-09-06T18:29:58.947' AS DateTime), 0, CAST(51619.57000000000000000000 AS Decimal(38, 20)), CAST(0.00005504711533666000 AS Decimal(38, 20)), CAST(9.44447999830576678469 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (131, CAST(N'2021-09-06T18:29:46.817' AS DateTime), CAST(N'2021-09-06T18:32:11.380' AS DateTime), 0, CAST(51616.03000000000000000000 AS Decimal(38, 20)), CAST(0.00003128535078432660 AS Decimal(38, 20)), CAST(1.61482560464432531540 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (132, CAST(N'2021-09-06T18:29:48.873' AS DateTime), CAST(N'2021-09-06T18:29:48.877' AS DateTime), 1, CAST(51615.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000391599880713783 AS Decimal(38, 20)), CAST(0.20212431759040716683 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (133, CAST(N'2021-09-06T18:29:49.837' AS DateTime), CAST(N'2021-09-06T18:31:35.913' AS DateTime), 0, CAST(51611.53000000000000000000 AS Decimal(38, 20)), CAST(0.00001266602660187800 AS Decimal(38, 20)), CAST(0.65371301194362445334 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (134, CAST(N'2021-09-06T18:29:51.910' AS DateTime), CAST(N'2021-09-06T18:30:00.983' AS DateTime), 0, CAST(51619.99000000000000000000 AS Decimal(38, 20)), CAST(0.00001086368626489480 AS Decimal(38, 20)), CAST(0.56078337635700692705 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (135, CAST(N'2021-09-06T18:29:52.863' AS DateTime), CAST(N'2021-09-06T18:36:01.883' AS DateTime), 0, CAST(51616.05000000000000000000 AS Decimal(38, 20)), CAST(0.00005933096588558100 AS Decimal(38, 20)), CAST(3.06243010169844317505 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (136, CAST(N'2021-09-06T18:29:54.937' AS DateTime), CAST(N'2021-09-06T18:36:54.467' AS DateTime), 0, CAST(51616.23000000000000000000 AS Decimal(38, 20)), CAST(0.00011671542409654530 AS Decimal(38, 20)), CAST(8.94571045709709172950 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (137, CAST(N'2021-09-06T18:29:55.900' AS DateTime), CAST(N'2021-09-06T18:29:55.900' AS DateTime), 1, CAST(51618.17000000000000000000 AS Decimal(38, 20)), CAST(0.00012791605150695700 AS Decimal(38, 20)), CAST(6.60279249241486260869 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (138, CAST(N'2021-09-06T18:29:57.957' AS DateTime), CAST(N'2021-09-06T18:30:14.090' AS DateTime), 0, CAST(51618.16000000000000000000 AS Decimal(38, 20)), CAST(0.00002485418069402420 AS Decimal(38, 20)), CAST(1.28292707573305219947 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (139, CAST(N'2021-09-06T18:29:58.933' AS DateTime), CAST(N'2021-09-06T18:30:44.383' AS DateTime), 1, CAST(51618.18000000000000000000 AS Decimal(38, 20)), CAST(0.00002603241457884770 AS Decimal(38, 20)), CAST(4.18517776949406124999 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (140, CAST(N'2021-09-06T18:30:00.980' AS DateTime), CAST(N'2021-09-06T18:30:41.337' AS DateTime), 1, CAST(51618.17000000000000000000 AS Decimal(38, 20)), CAST(0.00004471765637617420 AS Decimal(38, 20)), CAST(6.37890300467461630302 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (141, CAST(N'2021-09-06T18:30:01.977' AS DateTime), CAST(N'2021-09-06T18:30:31.297' AS DateTime), 0, CAST(51618.16000000000000000000 AS Decimal(38, 20)), CAST(0.00003212261974444738 AS Decimal(38, 20)), CAST(5.24474656926980358368 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (142, CAST(N'2021-09-06T18:30:04.007' AS DateTime), CAST(N'2021-09-06T18:30:04.007' AS DateTime), 1, CAST(51618.18000000000000000000 AS Decimal(38, 20)), CAST(0.00004546914121390750 AS Decimal(38, 20)), CAST(2.34703431562489583835 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (143, CAST(N'2021-09-06T18:30:07.023' AS DateTime), CAST(N'2021-09-06T18:30:07.023' AS DateTime), 1, CAST(51618.17000000000000000000 AS Decimal(38, 20)), CAST(0.00010840456546675600 AS Decimal(38, 20)), CAST(5.59564528903914055652 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (144, CAST(N'2021-09-06T18:30:08.030' AS DateTime), CAST(N'2021-09-06T18:31:50.070' AS DateTime), 0, CAST(51612.59000000000000000000 AS Decimal(38, 20)), CAST(0.00007532578971019290 AS Decimal(38, 20)), CAST(3.88775910073840496861 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (145, CAST(N'2021-09-06T18:30:10.050' AS DateTime), CAST(N'2021-09-06T18:30:32.250' AS DateTime), 1, CAST(51616.95000000000000000000 AS Decimal(38, 20)), CAST(0.00000141788804969690 AS Decimal(38, 20)), CAST(5.02867316021818112904 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (146, CAST(N'2021-09-06T18:30:11.060' AS DateTime), CAST(N'2021-09-06T18:30:11.060' AS DateTime), 1, CAST(51613.89000000000000000000 AS Decimal(38, 20)), CAST(0.00001578812059750230 AS Decimal(38, 20)), CAST(0.81488631982621798695 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (147, CAST(N'2021-09-06T18:30:14.090' AS DateTime), CAST(N'2021-09-06T18:30:20.147' AS DateTime), 1, CAST(51616.94000000000000000000 AS Decimal(38, 20)), CAST(0.00004439237911458700 AS Decimal(38, 20)), CAST(8.41210197309306096200 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (148, CAST(N'2021-09-06T18:30:16.090' AS DateTime), CAST(N'2021-09-06T18:30:16.090' AS DateTime), 1, CAST(51618.16000000000000000000 AS Decimal(38, 20)), CAST(0.00004482272958607540 AS Decimal(38, 20)), CAST(2.31366682741077376926 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (149, CAST(N'2021-09-06T18:30:17.110' AS DateTime), CAST(N'2021-09-06T18:30:52.480' AS DateTime), 1, CAST(51619.98000000000000000000 AS Decimal(38, 20)), CAST(0.00000638968050777410 AS Decimal(38, 20)), CAST(1.88141159580068311103 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (150, CAST(N'2021-09-06T18:30:19.117' AS DateTime), CAST(N'2021-09-06T18:30:19.117' AS DateTime), 0, CAST(51630.26000000000000000000 AS Decimal(38, 20)), CAST(0.00009372516949368880 AS Decimal(38, 20)), CAST(4.83905486950322110309 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (151, CAST(N'2021-09-06T18:30:20.143' AS DateTime), CAST(N'2021-09-06T18:37:05.697' AS DateTime), 0, CAST(51637.13000000000000000000 AS Decimal(38, 20)), CAST(0.00006737639376305790 AS Decimal(38, 20)), CAST(9.42408327103061625786 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (152, CAST(N'2021-09-06T18:30:22.147' AS DateTime), CAST(N'2021-09-06T18:30:58.583' AS DateTime), 1, CAST(51624.61000000000000000000 AS Decimal(38, 20)), CAST(0.00008290697023407967 AS Decimal(38, 20)), CAST(6.75824947660133702888 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (153, CAST(N'2021-09-06T18:30:23.170' AS DateTime), CAST(N'2021-09-06T18:30:23.170' AS DateTime), 1, CAST(51619.23000000000000000000 AS Decimal(38, 20)), CAST(0.00005674816642736470 AS Decimal(38, 20)), CAST(2.92929665489241674318 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (154, CAST(N'2021-09-06T18:30:25.230' AS DateTime), CAST(N'2021-09-06T18:30:47.427' AS DateTime), 1, CAST(51619.26000000000000000000 AS Decimal(38, 20)), CAST(0.00002371863276870870 AS Decimal(38, 20)), CAST(8.40330625400813277654 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (155, CAST(N'2021-09-06T18:30:26.210' AS DateTime), CAST(N'2021-09-06T18:30:26.210' AS DateTime), 1, CAST(51617.25000000000000000000 AS Decimal(38, 20)), CAST(0.00000881394902654642 AS Decimal(38, 20)), CAST(0.45495181039050319775 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (156, CAST(N'2021-09-06T18:30:28.270' AS DateTime), CAST(N'2021-09-06T18:30:28.267' AS DateTime), 1, CAST(51617.24000000000000000000 AS Decimal(38, 20)), CAST(0.00001584731778867880 AS Decimal(38, 20)), CAST(0.81799480565450290251 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (157, CAST(N'2021-09-06T18:30:31.293' AS DateTime), CAST(N'2021-09-06T18:30:38.313' AS DateTime), 1, CAST(51617.26000000000000000000 AS Decimal(38, 20)), CAST(0.00003765720810632118 AS Decimal(38, 20)), CAST(6.59591584196258805350 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (158, CAST(N'2021-09-06T18:30:32.247' AS DateTime), CAST(N'2021-09-06T18:30:34.320' AS DateTime), 0, CAST(51624.58000000000000000000 AS Decimal(38, 20)), CAST(0.00000003680726514943 AS Decimal(38, 20)), CAST(0.07509803465690955079 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (159, CAST(N'2021-09-06T18:30:34.320' AS DateTime), CAST(N'2021-09-06T18:30:56.560' AS DateTime), 1, CAST(51621.61000000000000000000 AS Decimal(38, 20)), CAST(0.00013550013654655857 AS Decimal(38, 20)), CAST(6.99663525403990380988 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (160, CAST(N'2021-09-06T18:30:35.277' AS DateTime), CAST(N'2021-09-06T18:30:35.277' AS DateTime), 0, CAST(51621.65000000000000000000 AS Decimal(38, 20)), CAST(0.00004920497538950530 AS Decimal(38, 20)), CAST(2.54004201781565626975 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (161, CAST(N'2021-09-06T18:30:37.350' AS DateTime), CAST(N'2021-09-06T18:30:37.350' AS DateTime), 0, CAST(51625.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000880027953945114 AS Decimal(38, 20)), CAST(0.45432314350090915913 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (162, CAST(N'2021-09-06T18:30:38.313' AS DateTime), CAST(N'2021-09-06T18:30:46.430' AS DateTime), 0, CAST(51625.96000000000000000000 AS Decimal(38, 20)), CAST(0.00008038901373762082 AS Decimal(38, 20)), CAST(6.09424952706647593432 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (163, CAST(N'2021-09-06T18:30:40.387' AS DateTime), CAST(N'2021-09-06T18:30:40.387' AS DateTime), 0, CAST(51625.95000000000000000000 AS Decimal(38, 20)), CAST(0.00006799729264713700 AS Decimal(38, 20)), CAST(3.51042483033646240515 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (164, CAST(N'2021-09-06T18:30:41.333' AS DateTime), CAST(N'2021-09-06T18:31:07.667' AS DateTime), 0, CAST(51625.95000000000000000000 AS Decimal(38, 20)), CAST(0.00000229542860868250 AS Decimal(38, 20)), CAST(9.58394541293008803720 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (165, CAST(N'2021-09-06T18:30:44.360' AS DateTime), CAST(N'2021-09-06T18:30:59.590' AS DateTime), 0, CAST(51625.96000000000000000000 AS Decimal(38, 20)), CAST(0.00005456116425551540 AS Decimal(38, 20)), CAST(4.16072087715967602608 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (166, CAST(N'2021-09-06T18:30:46.427' AS DateTime), CAST(N'2021-09-06T18:45:57.473' AS DateTime), 1, CAST(51625.96000000000000000000 AS Decimal(38, 20)), CAST(0.00007476151412109018 AS Decimal(38, 20)), CAST(8.00979494521269973756 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (167, CAST(N'2021-09-06T18:30:47.403' AS DateTime), CAST(N'2021-09-06T18:31:23.817' AS DateTime), 0, CAST(51625.95000000000000000000 AS Decimal(38, 20)), CAST(0.00007923534031921730 AS Decimal(38, 20)), CAST(5.31509666693861327970 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (168, CAST(N'2021-09-06T18:30:50.483' AS DateTime), CAST(N'2021-09-06T18:30:50.497' AS DateTime), 1, CAST(51625.92000000000000000000 AS Decimal(38, 20)), CAST(0.00006485978256206020 AS Decimal(38, 20)), CAST(3.34844594576631492038 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (169, CAST(N'2021-09-06T18:30:52.463' AS DateTime), CAST(N'2021-09-06T18:30:53.533' AS DateTime), 0, CAST(51625.91000000000000000000 AS Decimal(38, 20)), CAST(0.00013728078340053590 AS Decimal(38, 20)), CAST(7.41711843938866031210 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (170, CAST(N'2021-09-06T18:30:53.533' AS DateTime), CAST(N'2021-09-06T18:31:10.693' AS DateTime), 1, CAST(51625.90000000000000000000 AS Decimal(38, 20)), CAST(0.00000379647994590810 AS Decimal(38, 20)), CAST(8.41414119798064858140 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (171, CAST(N'2021-09-06T18:30:55.523' AS DateTime), CAST(N'2021-09-06T18:35:49.777' AS DateTime), 0, CAST(51621.65000000000000000000 AS Decimal(38, 20)), CAST(0.00000290625374899495 AS Decimal(38, 20)), CAST(1.35767310349359121466 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (172, CAST(N'2021-09-06T18:30:56.557' AS DateTime), CAST(N'2021-09-06T18:36:08.940' AS DateTime), 0, CAST(51621.65000000000000000000 AS Decimal(38, 20)), CAST(0.00000695949336837903 AS Decimal(38, 20)), CAST(10.26541799173568416915 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (173, CAST(N'2021-09-06T18:30:58.580' AS DateTime), CAST(N'2021-09-06T18:35:47.763' AS DateTime), 0, CAST(51625.95000000000000000000 AS Decimal(38, 20)), CAST(0.00000728220446374293 AS Decimal(38, 20)), CAST(8.00372613123769754310 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (174, CAST(N'2021-09-06T18:30:59.587' AS DateTime), CAST(N'2021-09-06T18:46:00.070' AS DateTime), 1, CAST(51625.96000000000000000000 AS Decimal(38, 20)), CAST(0.00005901041722810360 AS Decimal(38, 20)), CAST(5.86324192281005514924 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (175, CAST(N'2021-09-06T18:31:01.600' AS DateTime), CAST(N'2021-09-06T18:31:01.600' AS DateTime), 0, CAST(51628.05000000000000000000 AS Decimal(38, 20)), CAST(0.00002190568122170200 AS Decimal(38, 20)), CAST(1.13094760539809194110 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (176, CAST(N'2021-09-06T18:31:04.643' AS DateTime), CAST(N'2021-09-06T18:31:04.643' AS DateTime), 1, CAST(51623.33000000000000000000 AS Decimal(38, 20)), CAST(0.00007376914800785910 AS Decimal(38, 20)), CAST(3.80820907142855291280 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (177, CAST(N'2021-09-06T18:31:05.620' AS DateTime), CAST(N'2021-09-06T18:31:22.787' AS DateTime), 0, CAST(51623.32000000000000000000 AS Decimal(38, 20)), CAST(0.00009392992160000375 AS Decimal(38, 20)), CAST(4.87257764660007883069 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (178, CAST(N'2021-09-06T18:31:07.663' AS DateTime), CAST(N'2021-09-06T18:45:51.030' AS DateTime), 1, CAST(51625.95000000000000000000 AS Decimal(38, 20)), CAST(0.00004545733269558088 AS Decimal(38, 20)), CAST(2.53097403147959821329 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (179, CAST(N'2021-09-06T18:31:08.657' AS DateTime), CAST(N'2021-09-06T18:46:03.547' AS DateTime), 1, CAST(51628.05000000000000000000 AS Decimal(38, 20)), CAST(0.00001575577772024830 AS Decimal(38, 20)), CAST(4.72289511470133416976 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (180, CAST(N'2021-09-06T18:31:10.690' AS DateTime), CAST(N'2021-09-06T18:36:14.977' AS DateTime), 0, CAST(51628.04000000000000000000 AS Decimal(38, 20)), CAST(0.00011548154815820990 AS Decimal(38, 20)), CAST(6.15809080608052826872 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (181, CAST(N'2021-09-06T18:31:11.693' AS DateTime), CAST(N'2021-09-06T18:31:11.693' AS DateTime), 0, CAST(51628.03000000000000000000 AS Decimal(38, 20)), CAST(0.00000127246789693482 AS Decimal(38, 20)), CAST(0.06569501075698779500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (182, CAST(N'2021-09-06T18:31:13.720' AS DateTime), CAST(N'2021-09-06T18:31:14.737' AS DateTime), 0, CAST(51625.48000000000000000000 AS Decimal(38, 20)), CAST(0.00010046163019745700 AS Decimal(38, 20)), CAST(5.18637988052621240436 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (183, CAST(N'2021-09-06T18:31:14.733' AS DateTime), CAST(N'2021-09-06T18:44:26.717' AS DateTime), 1, CAST(51625.48000000000000000000 AS Decimal(38, 20)), CAST(0.00005022184059499784 AS Decimal(38, 20)), CAST(7.86806484669879104656 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (184, CAST(N'2021-09-06T18:31:17.780' AS DateTime), CAST(N'2021-09-06T18:36:10.967' AS DateTime), 0, CAST(51622.88000000000000000000 AS Decimal(38, 20)), CAST(0.00003410108007215940 AS Decimal(38, 20)), CAST(1.76039596443547604707 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (185, CAST(N'2021-09-06T18:31:19.757' AS DateTime), CAST(N'2021-09-06T18:31:19.757' AS DateTime), 1, CAST(51622.89000000000000000000 AS Decimal(38, 20)), CAST(0.00000045722061789465 AS Decimal(38, 20)), CAST(0.02360304966330765178 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (186, CAST(N'2021-09-06T18:31:22.783' AS DateTime), CAST(N'2021-09-06T18:43:32.113' AS DateTime), 1, CAST(51622.91000000000000000000 AS Decimal(38, 20)), CAST(0.00000644403873311525 AS Decimal(38, 20)), CAST(5.18159592062017215629 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (187, CAST(N'2021-09-06T18:31:23.813' AS DateTime), CAST(N'2021-09-06T18:43:34.657' AS DateTime), 1, CAST(51622.91000000000000000000 AS Decimal(38, 20)), CAST(0.00006793249206055570 AS Decimal(38, 20)), CAST(7.59723176583610739943 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (188, CAST(N'2021-09-06T18:31:25.820' AS DateTime), CAST(N'2021-09-06T18:35:55.827' AS DateTime), 0, CAST(51618.16000000000000000000 AS Decimal(38, 20)), CAST(0.00004987201804754880 AS Decimal(38, 20)), CAST(2.57430180710126156621 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (189, CAST(N'2021-09-06T18:31:26.847' AS DateTime), CAST(N'2021-09-06T18:31:26.847' AS DateTime), 1, CAST(51613.90000000000000000000 AS Decimal(38, 20)), CAST(0.00000204973723834834 AS Decimal(38, 20)), CAST(0.10579493284638738593 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (190, CAST(N'2021-09-06T18:31:28.850' AS DateTime), CAST(N'2021-09-06T18:31:28.850' AS DateTime), 1, CAST(51615.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004348364809690210 AS Decimal(38, 20)), CAST(2.24440849652160189150 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (191, CAST(N'2021-09-06T18:31:31.867' AS DateTime), CAST(N'2021-09-06T18:37:55.197' AS DateTime), 1, CAST(51614.98000000000000000000 AS Decimal(38, 20)), CAST(0.00001542306384789904 AS Decimal(38, 20)), CAST(2.34986932516190813650 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (192, CAST(N'2021-09-06T18:31:32.883' AS DateTime), CAST(N'2021-09-06T18:31:51.033' AS DateTime), 0, CAST(51613.04000000000000000000 AS Decimal(38, 20)), CAST(0.00003714411930979450 AS Decimal(38, 20)), CAST(6.52705503559767272744 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (193, CAST(N'2021-09-06T18:31:34.907' AS DateTime), CAST(N'2021-09-06T18:31:34.907' AS DateTime), 1, CAST(51613.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008931723688231650 AS Decimal(38, 20)), CAST(4.60993054720700151450 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (194, CAST(N'2021-09-06T18:31:35.910' AS DateTime), CAST(N'2021-09-06T18:31:37.937' AS DateTime), 1, CAST(51606.04000000000000000000 AS Decimal(38, 20)), CAST(0.00001920852792412440 AS Decimal(38, 20)), CAST(1.64491953585106089450 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (195, CAST(N'2021-09-06T18:31:37.933' AS DateTime), CAST(N'2021-09-06T18:31:38.937' AS DateTime), 0, CAST(51610.07000000000000000000 AS Decimal(38, 20)), CAST(0.00009556982782463060 AS Decimal(38, 20)), CAST(5.92371897467814796285 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (196, CAST(N'2021-09-06T18:31:38.933' AS DateTime), CAST(N'2021-09-06T18:31:47.043' AS DateTime), 1, CAST(51606.33000000000000000000 AS Decimal(38, 20)), CAST(0.00008799056647717540 AS Decimal(38, 20)), CAST(9.47287828326912003198 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (197, CAST(N'2021-09-06T18:31:40.960' AS DateTime), CAST(N'2021-09-06T18:32:03.227' AS DateTime), 0, CAST(51605.32000000000000000000 AS Decimal(38, 20)), CAST(0.00000159346247166000 AS Decimal(38, 20)), CAST(9.15849153627970721640 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (198, CAST(N'2021-09-06T18:31:41.957' AS DateTime), CAST(N'2021-09-06T18:31:44.013' AS DateTime), 1, CAST(51602.27000000000000000000 AS Decimal(38, 20)), CAST(0.00009904959597580600 AS Decimal(38, 20)), CAST(6.33482624644651979687 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (199, CAST(N'2021-09-06T18:31:44.010' AS DateTime), CAST(N'2021-09-06T18:31:54.090' AS DateTime), 0, CAST(51602.27000000000000000000 AS Decimal(38, 20)), CAST(0.00002221820718712090 AS Decimal(38, 20)), CAST(10.04862412331151613410 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (200, CAST(N'2021-09-06T18:31:47.043' AS DateTime), CAST(N'2021-09-06T18:31:48.000' AS DateTime), 0, CAST(51607.89000000000000000000 AS Decimal(38, 20)), CAST(0.00005428180957878060 AS Decimal(38, 20)), CAST(7.34237713353441109284 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (201, CAST(N'2021-09-06T18:31:47.997' AS DateTime), CAST(N'2021-09-06T18:37:02.653' AS DateTime), 1, CAST(51605.45000000000000000000 AS Decimal(38, 20)), CAST(0.00005855233793079540 AS Decimal(38, 20)), CAST(5.82285695759804878920 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (202, CAST(N'2021-09-06T18:31:50.067' AS DateTime), CAST(N'2021-09-06T18:37:11.760' AS DateTime), 1, CAST(51605.85000000000000000000 AS Decimal(38, 20)), CAST(0.00002278615703004690 AS Decimal(38, 20)), CAST(5.06315040668480408283 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (203, CAST(N'2021-09-06T18:31:51.033' AS DateTime), CAST(N'2021-09-06T18:37:12.663' AS DateTime), 1, CAST(51605.85000000000000000000 AS Decimal(38, 20)), CAST(0.00006400814636797050 AS Decimal(38, 20)), CAST(5.22004864972688892525 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (204, CAST(N'2021-09-06T18:31:53.123' AS DateTime), CAST(N'2021-09-06T18:31:53.123' AS DateTime), 1, CAST(51585.86000000000000000000 AS Decimal(38, 20)), CAST(0.00007346440771290310 AS Decimal(38, 20)), CAST(3.78972465126073951017 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (205, CAST(N'2021-09-06T18:31:54.070' AS DateTime), CAST(N'2021-09-06T18:31:59.240' AS DateTime), 1, CAST(51582.08000000000000000000 AS Decimal(38, 20)), CAST(0.00004520650303233720 AS Decimal(38, 20)), CAST(3.47790679651690527085 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (206, CAST(N'2021-09-06T18:31:56.157' AS DateTime), CAST(N'2021-09-06T18:32:08.357' AS DateTime), 1, CAST(51588.09000000000000000000 AS Decimal(38, 20)), CAST(0.00001248983769327940 AS Decimal(38, 20)), CAST(9.47400688812208085748 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (207, CAST(N'2021-09-06T18:31:57.140' AS DateTime), CAST(N'2021-09-06T18:31:57.153' AS DateTime), 1, CAST(51586.49000000000000000000 AS Decimal(38, 20)), CAST(0.00017587838609511000 AS Decimal(38, 20)), CAST(9.07294860551153106390 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (208, CAST(N'2021-09-06T18:31:59.223' AS DateTime), CAST(N'2021-09-06T18:32:00.207' AS DateTime), 0, CAST(51593.29000000000000000000 AS Decimal(38, 20)), CAST(0.00009797008191140880 AS Decimal(38, 20)), CAST(7.38695106821232106434 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (209, CAST(N'2021-09-06T18:32:00.203' AS DateTime), CAST(N'2021-09-06T18:32:09.307' AS DateTime), 1, CAST(51588.30000000000000000000 AS Decimal(38, 20)), CAST(0.00004291824542121820 AS Decimal(38, 20)), CAST(7.26818929693376146410 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (210, CAST(N'2021-09-06T18:32:02.290' AS DateTime), CAST(N'2021-09-06T18:32:02.293' AS DateTime), 0, CAST(51588.31000000000000000000 AS Decimal(38, 20)), CAST(0.00013504480101868700 AS Decimal(38, 20)), CAST(6.96673305884034074897 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (211, CAST(N'2021-09-06T18:32:03.223' AS DateTime), CAST(N'2021-09-06T18:36:50.523' AS DateTime), 1, CAST(51590.59000000000000000000 AS Decimal(38, 20)), CAST(0.00011986671309912000 AS Decimal(38, 20)), CAST(6.26620211920012696020 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (212, CAST(N'2021-09-06T18:32:05.323' AS DateTime), CAST(N'2021-09-06T18:32:17.440' AS DateTime), 0, CAST(51587.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007875985357852640 AS Decimal(38, 20)), CAST(4.06298535415397718206 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (213, CAST(N'2021-09-06T18:32:06.253' AS DateTime), CAST(N'2021-09-06T18:32:12.333' AS DateTime), 1, CAST(51590.58000000000000000000 AS Decimal(38, 20)), CAST(0.00004092851413457054 AS Decimal(38, 20)), CAST(5.67369718768298760294 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (214, CAST(N'2021-09-06T18:32:08.347' AS DateTime), CAST(N'2021-09-06T18:32:57.927' AS DateTime), 0, CAST(51590.58000000000000000000 AS Decimal(38, 20)), CAST(0.00000376907801431020 AS Decimal(38, 20)), CAST(0.83880689152565786597 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (215, CAST(N'2021-09-06T18:32:09.303' AS DateTime), CAST(N'2021-09-06T18:34:18.737' AS DateTime), 0, CAST(51590.61000000000000000000 AS Decimal(38, 20)), CAST(0.00000501426207135220 AS Decimal(38, 20)), CAST(2.47286730037127740394 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (216, CAST(N'2021-09-06T18:32:11.377' AS DateTime), CAST(N'2021-09-06T18:36:57.490' AS DateTime), 1, CAST(51592.22000000000000000000 AS Decimal(38, 20)), CAST(0.00003090430574068040 AS Decimal(38, 20)), CAST(5.58943143135500968668 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (217, CAST(N'2021-09-06T18:32:12.330' AS DateTime), CAST(N'2021-09-06T18:35:40.673' AS DateTime), 0, CAST(51592.22000000000000000000 AS Decimal(38, 20)), CAST(0.00005293545101440396 AS Decimal(38, 20)), CAST(8.54571484498136307340 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (218, CAST(N'2021-09-06T18:32:14.400' AS DateTime), CAST(N'2021-09-06T18:32:54.860' AS DateTime), 0, CAST(51587.36000000000000000000 AS Decimal(38, 20)), CAST(0.00003389621257497750 AS Decimal(38, 20)), CAST(1.74861612074189128440 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (219, CAST(N'2021-09-06T18:32:15.350' AS DateTime), CAST(N'2021-09-06T18:32:47.730' AS DateTime), 0, CAST(51585.06000000000000000000 AS Decimal(38, 20)), CAST(0.00008888749549579240 AS Decimal(38, 20)), CAST(9.55276875790670259786 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (220, CAST(N'2021-09-06T18:32:17.437' AS DateTime), CAST(N'2021-09-06T18:36:39.303' AS DateTime), 1, CAST(51585.34000000000000000000 AS Decimal(38, 20)), CAST(0.00002362008123827190 AS Decimal(38, 20)), CAST(9.29669029505696216296 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (221, CAST(N'2021-09-06T18:32:18.370' AS DateTime), CAST(N'2021-09-06T18:32:32.600' AS DateTime), 0, CAST(51581.89000000000000000000 AS Decimal(38, 20)), CAST(0.00000798269547893791 AS Decimal(38, 20)), CAST(0.41176252009807259045 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (222, CAST(N'2021-09-06T18:32:20.470' AS DateTime), CAST(N'2021-09-06T18:32:21.397' AS DateTime), 0, CAST(51579.35000000000000000000 AS Decimal(38, 20)), CAST(0.00005308195504037760 AS Decimal(38, 20)), CAST(2.73793273771190036256 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (223, CAST(N'2021-09-06T18:32:21.393' AS DateTime), CAST(N'2021-09-06T18:32:51.840' AS DateTime), 1, CAST(51574.97000000000000000000 AS Decimal(38, 20)), CAST(0.00000972809028333420 AS Decimal(38, 20)), CAST(3.23942620326907637365 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (224, CAST(N'2021-09-06T18:32:23.520' AS DateTime), CAST(N'2021-09-06T18:32:24.423' AS DateTime), 0, CAST(51562.59000000000000000000 AS Decimal(38, 20)), CAST(0.00010018681581140800 AS Decimal(38, 20)), CAST(5.16589170708914802672 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (225, CAST(N'2021-09-06T18:32:24.423' AS DateTime), CAST(N'2021-09-06T18:32:29.567' AS DateTime), 1, CAST(51561.05000000000000000000 AS Decimal(38, 20)), CAST(0.00001726924246981300 AS Decimal(38, 20)), CAST(6.05615769384095004205 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (226, CAST(N'2021-09-06T18:32:26.540' AS DateTime), CAST(N'2021-09-06T18:35:19.383' AS DateTime), 0, CAST(51559.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009983910308212000 AS Decimal(38, 20)), CAST(5.14760431581102508000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (227, CAST(N'2021-09-06T18:32:27.447' AS DateTime), CAST(N'2021-09-06T18:35:13.293' AS DateTime), 0, CAST(51558.66000000000000000000 AS Decimal(38, 20)), CAST(0.00010954153635983400 AS Decimal(38, 20)), CAST(5.64781482905431886244 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (228, CAST(N'2021-09-06T18:32:29.563' AS DateTime), CAST(N'2021-09-06T18:32:30.483' AS DateTime), 0, CAST(51564.12000000000000000000 AS Decimal(38, 20)), CAST(0.00010588920736028300 AS Decimal(38, 20)), CAST(6.35055708605304975552 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (229, CAST(N'2021-09-06T18:32:30.480' AS DateTime), CAST(N'2021-09-06T18:32:36.630' AS DateTime), 1, CAST(51564.12000000000000000000 AS Decimal(38, 20)), CAST(0.00009290401837458100 AS Decimal(38, 20)), CAST(10.25059774697961547968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (230, CAST(N'2021-09-06T18:32:32.597' AS DateTime), CAST(N'2021-09-06T18:32:42.743' AS DateTime), 1, CAST(51566.47000000000000000000 AS Decimal(38, 20)), CAST(0.00003036259144095829 AS Decimal(38, 20)), CAST(1.97733108759621980041 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (231, CAST(N'2021-09-06T18:32:33.520' AS DateTime), CAST(N'2021-09-06T18:32:33.520' AS DateTime), 1, CAST(51566.47000000000000000000 AS Decimal(38, 20)), CAST(0.00009629729944108860 AS Decimal(38, 20)), CAST(4.96571180270991205924 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (232, CAST(N'2021-09-06T18:32:36.630' AS DateTime), CAST(N'2021-09-06T18:33:16.110' AS DateTime), 0, CAST(51566.46000000000000000000 AS Decimal(38, 20)), CAST(0.00007227669333679480 AS Decimal(38, 20)), CAST(8.85007267415942831028 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (235, CAST(N'2021-09-06T18:32:44.707' AS DateTime), CAST(N'2021-09-06T18:32:44.707' AS DateTime), 1, CAST(51565.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000644388059454220 AS Decimal(38, 20)), CAST(0.33228508229935713978 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (236, CAST(N'2021-09-06T18:32:45.780' AS DateTime), CAST(N'2021-09-06T18:33:07.040' AS DateTime), 0, CAST(51565.99000000000000000000 AS Decimal(38, 20)), CAST(0.00010316052115669500 AS Decimal(38, 20)), CAST(5.31957440236092280305 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (237, CAST(N'2021-09-06T18:32:47.727' AS DateTime), CAST(N'2021-09-06T18:36:18.033' AS DateTime), 1, CAST(51577.26000000000000000000 AS Decimal(38, 20)), CAST(0.00010631068251389588 AS Decimal(38, 20)), CAST(10.27983091426692940392 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (239, CAST(N'2021-09-06T18:32:51.837' AS DateTime), CAST(N'2021-09-06T18:34:16.847' AS DateTime), 0, CAST(51577.27000000000000000000 AS Decimal(38, 20)), CAST(0.00008908965982919980 AS Decimal(38, 20)), CAST(8.59671213051261970627 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (240, CAST(N'2021-09-06T18:32:53.767' AS DateTime), CAST(N'2021-09-06T18:33:00.973' AS DateTime), 0, CAST(51573.12000000000000000000 AS Decimal(38, 20)), CAST(0.00001681004763432320 AS Decimal(38, 20)), CAST(0.86694660385066651238 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (241, CAST(N'2021-09-06T18:32:54.857' AS DateTime), CAST(N'2021-09-06T18:36:23.210' AS DateTime), 1, CAST(51577.31000000000000000000 AS Decimal(38, 20)), CAST(0.00008237264840042855 AS Decimal(38, 20)), CAST(6.42114682610185555310 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (242, CAST(N'2021-09-06T18:32:56.787' AS DateTime), CAST(N'2021-09-06T18:32:56.787' AS DateTime), 0, CAST(51581.87000000000000000000 AS Decimal(38, 20)), CAST(0.00000399124743602762 AS Decimal(38, 20)), CAST(0.20587600638301001125 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (243, CAST(N'2021-09-06T18:32:57.923' AS DateTime), CAST(N'2021-09-06T18:36:30.153' AS DateTime), 1, CAST(51581.88000000000000000000 AS Decimal(38, 20)), CAST(0.00003326549485012320 AS Decimal(38, 20)), CAST(5.62158365641422081336 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (244, CAST(N'2021-09-06T18:32:59.813' AS DateTime), CAST(N'2021-09-06T18:34:13.813' AS DateTime), 0, CAST(51575.80000000000000000000 AS Decimal(38, 20)), CAST(0.00004564803989867118 AS Decimal(38, 20)), CAST(3.45583318947799180380 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (245, CAST(N'2021-09-06T18:33:00.957' AS DateTime), CAST(N'2021-09-06T18:33:02.880' AS DateTime), 1, CAST(51571.81000000000000000000 AS Decimal(38, 20)), CAST(0.00010521342489179880 AS Decimal(38, 20)), CAST(6.29297134065738382082 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (246, CAST(N'2021-09-06T18:33:02.860' AS DateTime), CAST(N'2021-09-06T18:33:12.003' AS DateTime), 0, CAST(51571.81000000000000000000 AS Decimal(38, 20)), CAST(0.00006155360781660020 AS Decimal(38, 20)), CAST(8.60047772510133863219 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (249, CAST(N'2021-09-06T18:33:07.040' AS DateTime), CAST(N'2021-09-06T18:33:13.083' AS DateTime), 1, CAST(51559.34000000000000000000 AS Decimal(38, 20)), CAST(0.00006286073469690080 AS Decimal(38, 20)), CAST(9.48393054329271185488 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (250, CAST(N'2021-09-06T18:33:08.967' AS DateTime), CAST(N'2021-09-06T18:33:08.970' AS DateTime), 1, CAST(51571.82000000000000000000 AS Decimal(38, 20)), CAST(0.00000643970640676082 AS Decimal(38, 20)), CAST(0.33210737966231579209 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (251, CAST(N'2021-09-06T18:33:10.057' AS DateTime), CAST(N'2021-09-06T18:33:10.057' AS DateTime), 0, CAST(51572.90000000000000000000 AS Decimal(38, 20)), CAST(0.00001792079117983620 AS Decimal(38, 20)), CAST(0.92422717143857435898 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (252, CAST(N'2021-09-06T18:33:12.000' AS DateTime), CAST(N'2021-09-06T18:34:21.767' AS DateTime), 1, CAST(51570.40000000000000000000 AS Decimal(38, 20)), CAST(0.00008202202817519280 AS Decimal(38, 20)), CAST(7.40425297835116172720 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (253, CAST(N'2021-09-06T18:33:13.080' AS DateTime), CAST(N'2021-09-06T18:34:31.973' AS DateTime), 0, CAST(51570.40000000000000000000 AS Decimal(38, 20)), CAST(0.00004067018294738160 AS Decimal(38, 20)), CAST(7.09493985516789704000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (255, CAST(N'2021-09-06T18:33:16.107' AS DateTime), CAST(N'2021-09-06T18:33:19.237' AS DateTime), 1, CAST(51565.60000000000000000000 AS Decimal(38, 20)), CAST(0.00000226079477102480 AS Decimal(38, 20)), CAST(6.92472795276227938080 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (256, CAST(N'2021-09-06T18:33:18.063' AS DateTime), CAST(N'2021-09-06T18:33:18.063' AS DateTime), 0, CAST(51568.19000000000000000000 AS Decimal(38, 20)), CAST(0.00005975219246919840 AS Decimal(38, 20)), CAST(3.08131241416819223890 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (257, CAST(N'2021-09-06T18:33:19.230' AS DateTime), CAST(N'2021-09-06T18:33:28.323' AS DateTime), 0, CAST(51568.18000000000000000000 AS Decimal(38, 20)), CAST(0.00003207565677914620 AS Decimal(38, 20)), CAST(1.82045480658977087904 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (258, CAST(N'2021-09-06T18:33:21.127' AS DateTime), CAST(N'2021-09-06T18:33:21.127' AS DateTime), 1, CAST(51568.14000000000000000000 AS Decimal(38, 20)), CAST(0.00000096544986635700 AS Decimal(38, 20)), CAST(0.04978645387127927225 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (259, CAST(N'2021-09-06T18:33:22.283' AS DateTime), CAST(N'2021-09-06T18:35:26.507' AS DateTime), 0, CAST(51564.27000000000000000000 AS Decimal(38, 20)), CAST(0.00015600834943168300 AS Decimal(38, 20)), CAST(8.04445665234964876641 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (263, CAST(N'2021-09-06T18:33:28.320' AS DateTime), CAST(N'2021-09-06T18:33:31.360' AS DateTime), 1, CAST(51568.13000000000000000000 AS Decimal(38, 20)), CAST(0.00000976466201700480 AS Decimal(38, 20)), CAST(7.44557983752032413066 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (264, CAST(N'2021-09-06T18:33:30.227' AS DateTime), CAST(N'2021-09-06T18:33:30.223' AS DateTime), 0, CAST(51568.14000000000000000000 AS Decimal(38, 20)), CAST(0.00010254304041273100 AS Decimal(38, 20)), CAST(5.28795386402936999034 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (265, CAST(N'2021-09-06T18:33:31.357' AS DateTime), CAST(N'2021-09-06T18:33:51.403' AS DateTime), 0, CAST(51568.14000000000000000000 AS Decimal(38, 20)), CAST(0.00002898283956059390 AS Decimal(38, 20)), CAST(1.99813658600383062542 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (266, CAST(N'2021-09-06T18:33:33.247' AS DateTime), CAST(N'2021-09-06T18:34:36.897' AS DateTime), 0, CAST(51568.12000000000000000000 AS Decimal(38, 20)), CAST(0.00005814890528942880 AS Decimal(38, 20)), CAST(7.72673933807244696756 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (267, CAST(N'2021-09-06T18:33:34.387' AS DateTime), CAST(N'2021-09-06T18:33:34.383' AS DateTime), 1, CAST(51566.77000000000000000000 AS Decimal(38, 20)), CAST(0.00002446683525315800 AS Decimal(38, 20)), CAST(1.26167566612749035966 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (271, CAST(N'2021-09-06T18:33:40.490' AS DateTime), CAST(N'2021-09-06T18:33:40.490' AS DateTime), 1, CAST(51566.45000000000000000000 AS Decimal(38, 20)), CAST(0.00010902928482230300 AS Decimal(38, 20)), CAST(5.62225316432504653435 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (273, CAST(N'2021-09-06T18:33:43.527' AS DateTime), CAST(N'2021-09-06T18:33:43.527' AS DateTime), 1, CAST(51568.12000000000000000000 AS Decimal(38, 20)), CAST(0.00006721984272227620 AS Decimal(38, 20)), CAST(3.46640091588346575474 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (275, CAST(N'2021-09-06T18:33:46.553' AS DateTime), CAST(N'2021-09-06T18:33:46.553' AS DateTime), 1, CAST(51565.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005572404426323440 AS Decimal(38, 20)), CAST(2.87341089967412446834 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (276, CAST(N'2021-09-06T18:33:48.383' AS DateTime), CAST(N'2021-09-06T18:33:48.383' AS DateTime), 1, CAST(51565.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000399144804291029 AS Decimal(38, 20)), CAST(0.20581905824714953295 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (277, CAST(N'2021-09-06T18:33:51.400' AS DateTime), CAST(N'2021-09-06T18:33:52.593' AS DateTime), 1, CAST(51568.14000000000000000000 AS Decimal(38, 20)), CAST(0.00011511542476486210 AS Decimal(38, 20)), CAST(7.43087946849212057184 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (279, CAST(N'2021-09-06T18:33:54.430' AS DateTime), CAST(N'2021-09-06T18:34:42.937' AS DateTime), 0, CAST(51564.99000000000000000000 AS Decimal(38, 20)), CAST(0.00008075292170082770 AS Decimal(38, 20)), CAST(9.18699101487233973714 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (281, CAST(N'2021-09-06T18:33:57.450' AS DateTime), CAST(N'2021-09-06T18:33:57.450' AS DateTime), 1, CAST(51565.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008335319565765240 AS Decimal(38, 20)), CAST(4.29810753408684600600 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (283, CAST(N'2021-09-06T18:34:00.480' AS DateTime), CAST(N'2021-09-06T18:34:01.727' AS DateTime), 0, CAST(51570.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013921640279666400 AS Decimal(38, 20)), CAST(7.17938989222396248000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (284, CAST(N'2021-09-06T18:34:01.723' AS DateTime), CAST(N'2021-09-06T18:34:19.877' AS DateTime), 1, CAST(51570.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005313711653143900 AS Decimal(38, 20)), CAST(9.91967099175027171000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (287, CAST(N'2021-09-06T18:34:09.620' AS DateTime), CAST(N'2021-09-06T18:34:09.630' AS DateTime), 1, CAST(51570.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003404683733081760 AS Decimal(38, 20)), CAST(1.75579540115026363200 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (289, CAST(N'2021-09-06T18:34:12.670' AS DateTime), CAST(N'2021-09-06T18:34:12.670' AS DateTime), 1, CAST(51570.57000000000000000000 AS Decimal(38, 20)), CAST(0.00001491718991422900 AS Decimal(38, 20)), CAST(0.76928798667504064053 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (290, CAST(N'2021-09-06T18:34:13.803' AS DateTime), CAST(N'2021-09-06T18:35:56.853' AS DateTime), 1, CAST(51572.48000000000000000000 AS Decimal(38, 20)), CAST(0.00000673767505527378 AS Decimal(38, 20)), CAST(7.56525415201054093312 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (291, CAST(N'2021-09-06T18:34:15.703' AS DateTime), CAST(N'2021-09-06T18:34:15.700' AS DateTime), 1, CAST(51572.49000000000000000000 AS Decimal(38, 20)), CAST(0.00006785861974016700 AS Decimal(38, 20)), CAST(3.49963798796356520583 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (292, CAST(N'2021-09-06T18:34:16.843' AS DateTime), CAST(N'2021-09-06T18:36:04.910' AS DateTime), 1, CAST(51572.89000000000000000000 AS Decimal(38, 20)), CAST(0.00000417226525217920 AS Decimal(38, 20)), CAST(10.22916889258583408815 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (293, CAST(N'2021-09-06T18:34:18.733' AS DateTime), CAST(N'2021-09-06T18:36:26.283' AS DateTime), 1, CAST(51580.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011791959950603480 AS Decimal(38, 20)), CAST(6.34092858016162146000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (294, CAST(N'2021-09-06T18:34:19.877' AS DateTime), CAST(N'2021-09-06T18:34:47.100' AS DateTime), 0, CAST(51581.87000000000000000000 AS Decimal(38, 20)), CAST(0.00000365344872868300 AS Decimal(38, 20)), CAST(10.26947384058470126881 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (296, CAST(N'2021-09-06T18:34:22.900' AS DateTime), CAST(N'2021-09-06T18:34:22.900' AS DateTime), 1, CAST(51588.30000000000000000000 AS Decimal(38, 20)), CAST(0.00007177563797299550 AS Decimal(38, 20)), CAST(3.70278314444228375265 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (297, CAST(N'2021-09-06T18:34:24.800' AS DateTime), CAST(N'2021-09-06T18:34:24.797' AS DateTime), 0, CAST(51588.30000000000000000000 AS Decimal(38, 20)), CAST(0.00005960788822714610 AS Decimal(38, 20)), CAST(3.07506962022848115063 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (298, CAST(N'2021-09-06T18:34:28.933' AS DateTime), CAST(N'2021-09-06T18:34:28.930' AS DateTime), 0, CAST(51581.93000000000000000000 AS Decimal(38, 20)), CAST(0.00000644065030219064 AS Decimal(38, 20)), CAST(0.33222117304207643914 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (299, CAST(N'2021-09-06T18:34:30.837' AS DateTime), CAST(N'2021-09-06T18:34:30.837' AS DateTime), 0, CAST(51581.94000000000000000000 AS Decimal(38, 20)), CAST(0.00002825743464206230 AS Decimal(38, 20)), CAST(1.45757329826077903486 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (300, CAST(N'2021-09-06T18:34:31.970' AS DateTime), CAST(N'2021-09-06T18:35:41.687' AS DateTime), 1, CAST(51570.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007580037716580590 AS Decimal(38, 20)), CAST(8.87972944920312663000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (301, CAST(N'2021-09-06T18:34:33.877' AS DateTime), CAST(N'2021-09-06T18:34:33.877' AS DateTime), 1, CAST(51572.50000000000000000000 AS Decimal(38, 20)), CAST(0.00014230019745524100 AS Decimal(38, 20)), CAST(7.33877693326041647250 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (302, CAST(N'2021-09-06T18:34:35.000' AS DateTime), CAST(N'2021-09-06T18:34:35.000' AS DateTime), 0, CAST(51570.36000000000000000000 AS Decimal(38, 20)), CAST(0.00005571732914807150 AS Decimal(38, 20)), CAST(2.87336272240454056074 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (303, CAST(N'2021-09-06T18:34:36.897' AS DateTime), CAST(N'2021-09-06T18:34:45.963' AS DateTime), 1, CAST(51567.76000000000000000000 AS Decimal(38, 20)), CAST(0.00000509438077225080 AS Decimal(38, 20)), CAST(3.26131459724003880970 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (305, CAST(N'2021-09-06T18:34:41.057' AS DateTime), CAST(N'2021-09-06T18:34:41.057' AS DateTime), 1, CAST(51564.31000000000000000000 AS Decimal(38, 20)), CAST(0.00009741042158445830 AS Decimal(38, 20)), CAST(5.02290117581169896327 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (306, CAST(N'2021-09-06T18:34:42.933' AS DateTime), CAST(N'2021-09-06T18:34:44.073' AS DateTime), 1, CAST(51564.31000000000000000000 AS Decimal(38, 20)), CAST(0.00005047047736610830 AS Decimal(38, 20)), CAST(6.76644402874119865416 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (309, CAST(N'2021-09-06T18:34:47.100' AS DateTime), CAST(N'2021-09-06T18:35:53.820' AS DateTime), 1, CAST(51572.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001936964179359800 AS Decimal(38, 20)), CAST(8.18904300319859377200 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (310, CAST(N'2021-09-06T18:34:48.997' AS DateTime), CAST(N'2021-09-06T18:34:48.997' AS DateTime), 1, CAST(51564.31000000000000000000 AS Decimal(38, 20)), CAST(0.00013029823253410800 AS Decimal(38, 20)), CAST(6.71873845484083048548 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (311, CAST(N'2021-09-06T18:34:50.120' AS DateTime), CAST(N'2021-09-06T18:34:58.143' AS DateTime), 0, CAST(51564.30000000000000000000 AS Decimal(38, 20)), CAST(0.00003142151666405640 AS Decimal(38, 20)), CAST(5.96361384698235561060 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (312, CAST(N'2021-09-06T18:34:52.027' AS DateTime), CAST(N'2021-09-06T18:34:52.027' AS DateTime), 1, CAST(51566.09000000000000000000 AS Decimal(38, 20)), CAST(0.00003949679231247720 AS Decimal(38, 20)), CAST(2.03669514709650741815 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (313, CAST(N'2021-09-06T18:34:53.153' AS DateTime), CAST(N'2021-09-06T18:34:53.150' AS DateTime), 1, CAST(51566.07000000000000000000 AS Decimal(38, 20)), CAST(0.00002280210658107050 AS Decimal(38, 20)), CAST(1.17581502410694207794 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (315, CAST(N'2021-09-06T18:34:56.183' AS DateTime), CAST(N'2021-09-06T18:34:56.180' AS DateTime), 1, CAST(51564.30000000000000000000 AS Decimal(38, 20)), CAST(0.00008423241147968560 AS Decimal(38, 20)), CAST(4.34338533526195218408 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (316, CAST(N'2021-09-06T18:34:58.130' AS DateTime), CAST(N'2021-09-06T18:35:38.650' AS DateTime), 1, CAST(51564.30000000000000000000 AS Decimal(38, 20)), CAST(0.00000620090477457350 AS Decimal(38, 20)), CAST(1.93997382578794375257 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (317, CAST(N'2021-09-06T18:35:01.167' AS DateTime), CAST(N'2021-09-06T18:35:05.270' AS DateTime), 0, CAST(51555.90000000000000000000 AS Decimal(38, 20)), CAST(0.00003138498879568000 AS Decimal(38, 20)), CAST(5.85177682114095732090 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (318, CAST(N'2021-09-06T18:35:02.223' AS DateTime), CAST(N'2021-09-06T18:35:11.317' AS DateTime), 0, CAST(51555.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003624109394673300 AS Decimal(38, 20)), CAST(7.83789839505350979000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (319, CAST(N'2021-09-06T18:35:04.207' AS DateTime), CAST(N'2021-09-06T18:35:04.207' AS DateTime), 1, CAST(51555.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008211854467267100 AS Decimal(38, 20)), CAST(4.23362239178500013171 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (320, CAST(N'2021-09-06T18:35:05.267' AS DateTime), CAST(N'2021-09-06T18:35:22.417' AS DateTime), 1, CAST(51555.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005464084933262310 AS Decimal(38, 20)), CAST(4.43506294496304760353 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (321, CAST(N'2021-09-06T18:35:07.237' AS DateTime), CAST(N'2021-09-06T18:35:07.233' AS DateTime), 1, CAST(51555.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011578874593404500 AS Decimal(38, 20)), CAST(5.96948879662968997500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (322, CAST(N'2021-09-06T18:35:11.300' AS DateTime), CAST(N'2021-09-06T18:35:20.457' AS DateTime), 1, CAST(51555.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000840860177223000 AS Decimal(38, 20)), CAST(9.52150783158394312500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (323, CAST(N'2021-09-06T18:35:13.277' AS DateTime), CAST(N'2021-09-06T18:35:28.477' AS DateTime), 1, CAST(51557.49000000000000000000 AS Decimal(38, 20)), CAST(0.00003630985200233300 AS Decimal(38, 20)), CAST(7.51973149696854148083 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (324, CAST(N'2021-09-06T18:35:14.363' AS DateTime), CAST(N'2021-09-06T18:35:14.373' AS DateTime), 0, CAST(51557.48000000000000000000 AS Decimal(38, 20)), CAST(0.00006312334698770350 AS Decimal(38, 20)), CAST(3.25448069985158344718 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (325, CAST(N'2021-09-06T18:35:17.423' AS DateTime), CAST(N'2021-09-06T18:35:17.423' AS DateTime), 0, CAST(51557.49000000000000000000 AS Decimal(38, 20)), CAST(0.00007691336659570850 AS Decimal(38, 20)), CAST(3.96546012912457503167 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (326, CAST(N'2021-09-06T18:35:19.373' AS DateTime), CAST(N'2021-09-06T18:35:25.453' AS DateTime), 1, CAST(51555.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001084626708684800 AS Decimal(38, 20)), CAST(5.70638647276854861936 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (330, CAST(N'2021-09-06T18:35:26.503' AS DateTime), CAST(N'2021-09-06T18:35:37.613' AS DateTime), 1, CAST(51563.11000000000000000000 AS Decimal(38, 20)), CAST(0.00002794005685855600 AS Decimal(38, 20)), CAST(9.48495190786828548329 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (336, CAST(N'2021-09-06T18:35:35.617' AS DateTime), CAST(N'2021-09-06T18:35:35.617' AS DateTime), 1, CAST(51557.38000000000000000000 AS Decimal(38, 20)), CAST(0.00002763586650958090 AS Decimal(38, 20)), CAST(1.42483287126373610204 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (339, CAST(N'2021-09-06T18:35:40.670' AS DateTime), CAST(N'2021-09-06T18:36:48.393' AS DateTime), 1, CAST(51590.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004200764672924094 AS Decimal(38, 20)), CAST(4.89811441259464039100 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (341, CAST(N'2021-09-06T18:35:44.727' AS DateTime), CAST(N'2021-09-06T18:35:44.727' AS DateTime), 0, CAST(51614.39000000000000000000 AS Decimal(38, 20)), CAST(0.00007636587017977880 AS Decimal(38, 20)), CAST(3.94157780614847309693 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (342, CAST(N'2021-09-06T18:35:46.720' AS DateTime), CAST(N'2021-09-06T18:35:46.720' AS DateTime), 1, CAST(51623.48000000000000000000 AS Decimal(38, 20)), CAST(0.00006484382965827540 AS Decimal(38, 20)), CAST(3.34746414348738694639 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (343, CAST(N'2021-09-06T18:35:47.760' AS DateTime), CAST(N'2021-09-06T18:44:35.343' AS DateTime), 1, CAST(51625.48000000000000000000 AS Decimal(38, 20)), CAST(0.00004913544461556577 AS Decimal(38, 20)), CAST(4.18124456956199346443 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (344, CAST(N'2021-09-06T18:35:49.773' AS DateTime), CAST(N'2021-09-06T18:42:49.043' AS DateTime), 1, CAST(51621.13000000000000000000 AS Decimal(38, 20)), CAST(0.00008171270363112615 AS Decimal(38, 20)), CAST(4.36812619938369071884 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (345, CAST(N'2021-09-06T18:35:50.793' AS DateTime), CAST(N'2021-09-06T18:35:50.793' AS DateTime), 0, CAST(51619.36000000000000000000 AS Decimal(38, 20)), CAST(0.00003103775998160140 AS Decimal(38, 20)), CAST(1.60214930608387604310 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (346, CAST(N'2021-09-06T18:35:52.800' AS DateTime), CAST(N'2021-09-06T18:35:52.800' AS DateTime), 0, CAST(51616.69000000000000000000 AS Decimal(38, 20)), CAST(0.00002836182742768980 AS Decimal(38, 20)), CAST(1.46394365416856182276 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (347, CAST(N'2021-09-06T18:35:53.820' AS DateTime), CAST(N'2021-09-06T18:36:29.320' AS DateTime), 0, CAST(51616.10000000000000000000 AS Decimal(38, 20)), CAST(0.00001263949489809600 AS Decimal(38, 20)), CAST(9.06078351963878585040 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (348, CAST(N'2021-09-06T18:35:55.823' AS DateTime), CAST(N'2021-09-06T18:38:49.000' AS DateTime), 1, CAST(51617.91000000000000000000 AS Decimal(38, 20)), CAST(0.00005412899481790533 AS Decimal(38, 20)), CAST(6.07101662264648040066 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (349, CAST(N'2021-09-06T18:35:56.850' AS DateTime), CAST(N'2021-09-06T18:35:59.893' AS DateTime), 0, CAST(51616.98000000000000000000 AS Decimal(38, 20)), CAST(0.00010812067618040422 AS Decimal(38, 20)), CAST(5.92864121856496661244 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (350, CAST(N'2021-09-06T18:35:58.860' AS DateTime), CAST(N'2021-09-06T18:35:58.860' AS DateTime), 0, CAST(51621.09000000000000000000 AS Decimal(38, 20)), CAST(0.00010508198957195600 AS Decimal(38, 20)), CAST(5.42444684107300215204 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (351, CAST(N'2021-09-06T18:35:59.890' AS DateTime), CAST(N'2021-09-06T18:38:25.590' AS DateTime), 1, CAST(51616.52000000000000000000 AS Decimal(38, 20)), CAST(0.00005015142832424078 AS Decimal(38, 20)), CAST(8.16945524760609873540 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (352, CAST(N'2021-09-06T18:36:01.880' AS DateTime), CAST(N'2021-09-06T18:37:57.297' AS DateTime), 1, CAST(51615.49000000000000000000 AS Decimal(38, 20)), CAST(0.00004824708246078700 AS Decimal(38, 20)), CAST(5.55269367864147404032 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (353, CAST(N'2021-09-06T18:36:04.907' AS DateTime), CAST(N'2021-09-06T18:36:05.920' AS DateTime), 0, CAST(51621.54000000000000000000 AS Decimal(38, 20)), CAST(0.00012014984037734080 AS Decimal(38, 20)), CAST(6.41769854863849186080 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (354, CAST(N'2021-09-06T18:36:05.917' AS DateTime), CAST(N'2021-09-06T18:43:10.337' AS DateTime), 1, CAST(51621.54000000000000000000 AS Decimal(38, 20)), CAST(0.00002208175613641820 AS Decimal(38, 20)), CAST(7.34221404869887076886 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (355, CAST(N'2021-09-06T18:36:07.940' AS DateTime), CAST(N'2021-09-06T18:36:07.940' AS DateTime), 1, CAST(51620.27000000000000000000 AS Decimal(38, 20)), CAST(0.00005639914332721340 AS Decimal(38, 20)), CAST(2.91133900631945405562 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (356, CAST(N'2021-09-06T18:36:08.937' AS DateTime), CAST(N'2021-09-06T18:39:23.213' AS DateTime), 1, CAST(51619.02000000000000000000 AS Decimal(38, 20)), CAST(0.00015065429478448597 AS Decimal(38, 20)), CAST(8.13586928293850149230 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (357, CAST(N'2021-09-06T18:36:10.963' AS DateTime), CAST(N'2021-09-06T18:39:25.597' AS DateTime), 1, CAST(51619.05000000000000000000 AS Decimal(38, 20)), CAST(0.00007576486071374460 AS Decimal(38, 20)), CAST(5.67117549072461787120 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (358, CAST(N'2021-09-06T18:36:14.007' AS DateTime), CAST(N'2021-09-06T18:36:14.007' AS DateTime), 0, CAST(51616.52000000000000000000 AS Decimal(38, 20)), CAST(0.00000011993907397610 AS Decimal(38, 20)), CAST(0.00619083761066889679 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (359, CAST(N'2021-09-06T18:36:14.977' AS DateTime), CAST(N'2021-09-06T18:43:07.810' AS DateTime), 1, CAST(51621.35000000000000000000 AS Decimal(38, 20)), CAST(0.00004677514594363810 AS Decimal(38, 20)), CAST(8.37590959607443125480 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (360, CAST(N'2021-09-06T18:36:17.043' AS DateTime), CAST(N'2021-09-06T18:43:01.757' AS DateTime), 1, CAST(51621.34000000000000000000 AS Decimal(38, 20)), CAST(0.00000060975356055785 AS Decimal(38, 20)), CAST(9.63899736563649055660 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (361, CAST(N'2021-09-06T18:36:18.010' AS DateTime), CAST(N'2021-09-06T18:37:14.793' AS DateTime), 0, CAST(51619.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006114918601752712 AS Decimal(38, 20)), CAST(8.64411430292089446546 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (362, CAST(N'2021-09-06T18:36:20.133' AS DateTime), CAST(N'2021-09-06T18:36:20.143' AS DateTime), 0, CAST(51615.42000000000000000000 AS Decimal(38, 20)), CAST(0.00000822671326260395 AS Decimal(38, 20)), CAST(0.42462526026887317291 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (363, CAST(N'2021-09-06T18:36:21.063' AS DateTime), CAST(N'2021-09-06T18:36:21.063' AS DateTime), 1, CAST(51612.87000000000000000000 AS Decimal(38, 20)), CAST(0.00014353267138057000 AS Decimal(38, 20)), CAST(7.40813310871807993590 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (364, CAST(N'2021-09-06T18:36:23.200' AS DateTime), CAST(N'2021-09-06T18:36:24.097' AS DateTime), 0, CAST(51612.86000000000000000000 AS Decimal(38, 20)), CAST(0.00009246749342068445 AS Decimal(38, 20)), CAST(9.02399976219325031318 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (365, CAST(N'2021-09-06T18:36:24.097' AS DateTime), CAST(N'2021-09-06T18:37:39.117' AS DateTime), 1, CAST(51611.49000000000000000000 AS Decimal(38, 20)), CAST(0.00003935944244235762 AS Decimal(38, 20)), CAST(9.59533327185608417256 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (367, CAST(N'2021-09-06T18:36:27.130' AS DateTime), CAST(N'2021-09-06T18:36:27.130' AS DateTime), 0, CAST(51603.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007194911785048860 AS Decimal(38, 20)), CAST(3.71279032843876322580 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (368, CAST(N'2021-09-06T18:36:29.320' AS DateTime), CAST(N'2021-09-06T18:37:17.817' AS DateTime), 1, CAST(51606.79000000000000000000 AS Decimal(38, 20)), CAST(0.00000418715765894670 AS Decimal(38, 20)), CAST(0.86836952491426563993 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (370, CAST(N'2021-09-06T18:36:32.353' AS DateTime), CAST(N'2021-09-06T18:36:32.353' AS DateTime), 1, CAST(51606.80000000000000000000 AS Decimal(38, 20)), CAST(0.00005659654497010470 AS Decimal(38, 20)), CAST(2.92076657696319923196 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (371, CAST(N'2021-09-06T18:36:33.227' AS DateTime), CAST(N'2021-09-06T18:36:33.227' AS DateTime), 0, CAST(51619.35000000000000000000 AS Decimal(38, 20)), CAST(0.00006438249231520220 AS Decimal(38, 20)), CAST(3.32338240469073268257 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (372, CAST(N'2021-09-06T18:36:35.390' AS DateTime), CAST(N'2021-09-06T18:36:35.390' AS DateTime), 0, CAST(51619.35000000000000000000 AS Decimal(38, 20)), CAST(0.00001345719136924350 AS Decimal(38, 20)), CAST(0.69465147130595946173 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (373, CAST(N'2021-09-06T18:36:36.263' AS DateTime), CAST(N'2021-09-06T18:39:26.240' AS DateTime), 1, CAST(51619.36000000000000000000 AS Decimal(38, 20)), CAST(0.00000059731155661740 AS Decimal(38, 20)), CAST(2.94678109360386350456 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (374, CAST(N'2021-09-06T18:36:39.300' AS DateTime), CAST(N'2021-09-06T18:37:15.683' AS DateTime), 0, CAST(51619.35000000000000000000 AS Decimal(38, 20)), CAST(0.00000437040431628510 AS Decimal(38, 20)), CAST(9.95827326939541643445 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (375, CAST(N'2021-09-06T18:36:41.410' AS DateTime), CAST(N'2021-09-06T18:36:41.410' AS DateTime), 1, CAST(51619.36000000000000000000 AS Decimal(38, 20)), CAST(0.00000965996794852426 AS Decimal(38, 20)), CAST(0.49864136312333524567 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (376, CAST(N'2021-09-06T18:36:42.330' AS DateTime), CAST(N'2021-09-06T18:39:28.637' AS DateTime), 1, CAST(51619.36000000000000000000 AS Decimal(38, 20)), CAST(0.00000312432702776246 AS Decimal(38, 20)), CAST(2.62974397340882574526 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (377, CAST(N'2021-09-06T18:36:44.453' AS DateTime), CAST(N'2021-09-06T18:36:44.453' AS DateTime), 1, CAST(51619.34000000000000000000 AS Decimal(38, 20)), CAST(0.00010369453146294400 AS Decimal(38, 20)), CAST(5.35264327572640373696 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (378, CAST(N'2021-09-06T18:36:45.357' AS DateTime), CAST(N'2021-09-06T18:36:45.357' AS DateTime), 1, CAST(51619.34000000000000000000 AS Decimal(38, 20)), CAST(0.00006123243098204600 AS Decimal(38, 20)), CAST(3.16077767388876636964 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (379, CAST(N'2021-09-06T18:36:47.497' AS DateTime), CAST(N'2021-09-06T18:36:47.497' AS DateTime), 1, CAST(51622.48000000000000000000 AS Decimal(38, 20)), CAST(0.00003208558700610210 AS Decimal(38, 20)), CAST(1.65633757351076553521 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (380, CAST(N'2021-09-06T18:36:48.390' AS DateTime), CAST(N'2021-09-06T18:37:03.560' AS DateTime), 0, CAST(51622.48000000000000000000 AS Decimal(38, 20)), CAST(0.00000654389243877766 AS Decimal(38, 20)), CAST(2.50635085967025681813 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (381, CAST(N'2021-09-06T18:36:50.520' AS DateTime), CAST(N'2021-09-06T18:36:53.560' AS DateTime), 0, CAST(51615.12000000000000000000 AS Decimal(38, 20)), CAST(0.00001527684899758400 AS Decimal(38, 20)), CAST(6.97545117484882856448 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (382, CAST(N'2021-09-06T18:36:51.430' AS DateTime), CAST(N'2021-09-06T18:36:51.430' AS DateTime), 0, CAST(51615.13000000000000000000 AS Decimal(38, 20)), CAST(0.00004614899281698700 AS Decimal(38, 20)), CAST(2.38198626361785021331 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (383, CAST(N'2021-09-06T18:36:53.557' AS DateTime), CAST(N'2021-09-06T18:37:27.890' AS DateTime), 1, CAST(51611.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009729438251689730 AS Decimal(38, 20)), CAST(7.91045711531949729735 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (384, CAST(N'2021-09-06T18:36:54.467' AS DateTime), CAST(N'2021-09-06T18:37:20.857' AS DateTime), 1, CAST(51608.42000000000000000000 AS Decimal(38, 20)), CAST(0.00000387292262347070 AS Decimal(38, 20)), CAST(6.22337404463220813472 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (385, CAST(N'2021-09-06T18:36:56.587' AS DateTime), CAST(N'2021-09-06T18:36:56.587' AS DateTime), 1, CAST(51605.12000000000000000000 AS Decimal(38, 20)), CAST(0.00002567630178559400 AS Decimal(38, 20)), CAST(1.32502863480179264128 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (386, CAST(N'2021-09-06T18:36:57.490' AS DateTime), CAST(N'2021-09-06T18:40:44.643' AS DateTime), 0, CAST(51605.11000000000000000000 AS Decimal(38, 20)), CAST(0.00000590120572871610 AS Decimal(38, 20)), CAST(1.89935246798446801612 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (387, CAST(N'2021-09-06T18:36:59.620' AS DateTime), CAST(N'2021-09-06T18:36:59.620' AS DateTime), 1, CAST(51627.96000000000000000000 AS Decimal(38, 20)), CAST(0.00001333550839374560 AS Decimal(38, 20)), CAST(0.68848509393196208698 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (388, CAST(N'2021-09-06T18:37:00.527' AS DateTime), CAST(N'2021-09-06T18:37:00.527' AS DateTime), 1, CAST(51627.96000000000000000000 AS Decimal(38, 20)), CAST(0.00002531607794822940 AS Decimal(38, 20)), CAST(1.30701745966806953402 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (389, CAST(N'2021-09-06T18:37:02.650' AS DateTime), CAST(N'2021-09-06T18:37:33.067' AS DateTime), 0, CAST(51621.84000000000000000000 AS Decimal(38, 20)), CAST(0.00009102397276601860 AS Decimal(38, 20)), CAST(7.72140437858122081776 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (390, CAST(N'2021-09-06T18:37:03.560' AS DateTime), CAST(N'2021-09-06T18:43:10.890' AS DateTime), 1, CAST(51621.85000000000000000000 AS Decimal(38, 20)), CAST(0.00004423114752593874 AS Decimal(38, 20)), CAST(2.62110149680259529334 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (391, CAST(N'2021-09-06T18:37:05.697' AS DateTime), CAST(N'2021-09-06T18:45:48.413' AS DateTime), 1, CAST(51625.93000000000000000000 AS Decimal(38, 20)), CAST(0.00005039353196061910 AS Decimal(38, 20)), CAST(6.07998194151574814461 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (392, CAST(N'2021-09-06T18:37:06.587' AS DateTime), CAST(N'2021-09-06T18:43:41.180' AS DateTime), 1, CAST(51623.90000000000000000000 AS Decimal(38, 20)), CAST(0.00013182730662255930 AS Decimal(38, 20)), CAST(8.93712905431390510280 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (393, CAST(N'2021-09-06T18:37:08.727' AS DateTime), CAST(N'2021-09-06T18:43:23.027' AS DateTime), 1, CAST(51621.86000000000000000000 AS Decimal(38, 20)), CAST(0.00006283942156603390 AS Decimal(38, 20)), CAST(7.11295791836378448174 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (394, CAST(N'2021-09-06T18:37:09.623' AS DateTime), CAST(N'2021-09-06T18:37:09.623' AS DateTime), 1, CAST(51621.87000000000000000000 AS Decimal(38, 20)), CAST(0.00010821804632815400 AS Decimal(38, 20)), CAST(5.58641791920594312798 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (395, CAST(N'2021-09-06T18:37:11.757' AS DateTime), CAST(N'2021-09-06T18:37:45.173' AS DateTime), 0, CAST(51621.85000000000000000000 AS Decimal(38, 20)), CAST(0.00004503581442173340 AS Decimal(38, 20)), CAST(6.28450741794666776685 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (396, CAST(N'2021-09-06T18:37:12.660' AS DateTime), CAST(N'2021-09-06T18:37:46.137' AS DateTime), 0, CAST(51621.85000000000000000000 AS Decimal(38, 20)), CAST(0.00000413101054920440 AS Decimal(38, 20)), CAST(3.51746933750486511157 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (397, CAST(N'2021-09-06T18:37:14.790' AS DateTime), CAST(N'2021-09-06T18:37:23.907' AS DateTime), 1, CAST(51610.59000000000000000000 AS Decimal(38, 20)), CAST(0.00006016197226017788 AS Decimal(38, 20)), CAST(6.26094045229573889595 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (398, CAST(N'2021-09-06T18:37:15.683' AS DateTime), CAST(N'2021-09-06T18:37:21.760' AS DateTime), 1, CAST(51610.58000000000000000000 AS Decimal(38, 20)), CAST(0.00010178133170203390 AS Decimal(38, 20)), CAST(5.47855266391233421502 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (399, CAST(N'2021-09-06T18:37:17.813' AS DateTime), CAST(N'2021-09-06T18:37:30.000' AS DateTime), 0, CAST(51612.90000000000000000000 AS Decimal(38, 20)), CAST(0.00004147568114170660 AS Decimal(38, 20)), CAST(5.09441437381985592975 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (400, CAST(N'2021-09-06T18:37:18.707' AS DateTime), CAST(N'2021-09-06T18:37:18.707' AS DateTime), 1, CAST(51612.90000000000000000000 AS Decimal(38, 20)), CAST(0.00005304144586112420 AS Decimal(38, 20)), CAST(2.73762284108561722218 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (401, CAST(N'2021-09-06T18:37:20.853' AS DateTime), CAST(N'2021-09-06T18:41:51.347' AS DateTime), 0, CAST(51612.87000000000000000000 AS Decimal(38, 20)), CAST(0.00008367700301281960 AS Decimal(38, 20)), CAST(8.07290884575583017687 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (402, CAST(N'2021-09-06T18:37:21.740' AS DateTime), CAST(N'2021-09-06T18:52:16.270' AS DateTime), 0, CAST(51612.88000000000000000000 AS Decimal(38, 20)), CAST(0.00005693382381318810 AS Decimal(38, 20)), CAST(8.19174627578849125936 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (403, CAST(N'2021-09-06T18:37:23.887' AS DateTime), CAST(N'2021-09-06T18:37:30.930' AS DateTime), 0, CAST(51615.42000000000000000000 AS Decimal(38, 20)), CAST(0.00000226026345149622 AS Decimal(38, 20)), CAST(6.22915751395323434874 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (404, CAST(N'2021-09-06T18:37:24.807' AS DateTime), CAST(N'2021-09-06T18:37:24.817' AS DateTime), 1, CAST(51615.42000000000000000000 AS Decimal(38, 20)), CAST(0.00005826180626557290 AS Decimal(38, 20)), CAST(3.00720760035617677412 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (405, CAST(N'2021-09-06T18:37:26.947' AS DateTime), CAST(N'2021-09-06T18:37:26.960' AS DateTime), 0, CAST(51612.89000000000000000000 AS Decimal(38, 20)), CAST(0.00004069949725675370 AS Decimal(38, 20)), CAST(2.10061867496813047519 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (406, CAST(N'2021-09-06T18:37:27.873' AS DateTime), CAST(N'2021-09-06T18:52:16.370' AS DateTime), 0, CAST(51612.89000000000000000000 AS Decimal(38, 20)), CAST(0.00004752053061850370 AS Decimal(38, 20)), CAST(7.47431618201700691889 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (407, CAST(N'2021-09-06T18:37:29.997' AS DateTime), CAST(N'2021-09-06T18:37:40.027' AS DateTime), 1, CAST(51612.90000000000000000000 AS Decimal(38, 20)), CAST(0.00000901562506752760 AS Decimal(38, 20)), CAST(2.60600273824658384118 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (408, CAST(N'2021-09-06T18:37:30.917' AS DateTime), CAST(N'2021-09-06T18:37:51.237' AS DateTime), 1, CAST(51614.80000000000000000000 AS Decimal(38, 20)), CAST(0.00005461858019913518 AS Decimal(38, 20)), CAST(6.78242512263953040040 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (409, CAST(N'2021-09-06T18:37:33.063' AS DateTime), CAST(N'2021-09-06T18:37:54.263' AS DateTime), 1, CAST(51614.80000000000000000000 AS Decimal(38, 20)), CAST(0.00004154765579921640 AS Decimal(38, 20)), CAST(6.84265809406889147800 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (410, CAST(N'2021-09-06T18:37:33.950' AS DateTime), CAST(N'2021-09-06T18:37:33.953' AS DateTime), 0, CAST(51614.79000000000000000000 AS Decimal(38, 20)), CAST(0.00000545422705144353 AS Decimal(38, 20)), CAST(0.28151878387257699781 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (411, CAST(N'2021-09-06T18:37:36.093' AS DateTime), CAST(N'2021-09-06T18:37:36.093' AS DateTime), 1, CAST(51612.94000000000000000000 AS Decimal(38, 20)), CAST(0.00005391925668992070 AS Decimal(38, 20)), CAST(2.78293136038147569386 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (412, CAST(N'2021-09-06T18:37:36.993' AS DateTime), CAST(N'2021-09-06T18:37:36.993' AS DateTime), 0, CAST(51612.89000000000000000000 AS Decimal(38, 20)), CAST(0.00004863350980385840 AS Decimal(38, 20)), CAST(2.51011599182046517478 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (413, CAST(N'2021-09-06T18:37:39.113' AS DateTime), CAST(N'2021-09-06T18:38:15.547' AS DateTime), 0, CAST(51615.59000000000000000000 AS Decimal(38, 20)), CAST(0.00012867490962551638 AS Decimal(38, 20)), CAST(8.67319222225103655566 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (414, CAST(N'2021-09-06T18:37:40.023' AS DateTime), CAST(N'2021-09-06T18:41:06.433' AS DateTime), 0, CAST(51615.59000000000000000000 AS Decimal(38, 20)), CAST(0.00001255070027548400 AS Decimal(38, 20)), CAST(5.86895865795099479411 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (415, CAST(N'2021-09-06T18:37:43.057' AS DateTime), CAST(N'2021-09-06T18:37:43.070' AS DateTime), 0, CAST(51615.58000000000000000000 AS Decimal(38, 20)), CAST(0.00005158148931878690 AS Decimal(38, 20)), CAST(2.66240848845299073990 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (416, CAST(N'2021-09-06T18:37:45.150' AS DateTime), CAST(N'2021-09-06T18:38:00.363' AS DateTime), 1, CAST(51615.63000000000000000000 AS Decimal(38, 20)), CAST(0.00007627506129270260 AS Decimal(38, 20)), CAST(6.26153727585231423468 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (417, CAST(N'2021-09-06T18:37:46.120' AS DateTime), CAST(N'2021-09-06T18:39:22.513' AS DateTime), 1, CAST(51618.63000000000000000000 AS Decimal(38, 20)), CAST(0.00005082497394216440 AS Decimal(38, 20)), CAST(2.83675262974570428074 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (418, CAST(N'2021-09-06T18:37:48.210' AS DateTime), CAST(N'2021-09-06T18:37:48.210' AS DateTime), 0, CAST(51618.62000000000000000000 AS Decimal(38, 20)), CAST(0.00002294432466055470 AS Decimal(38, 20)), CAST(1.18435437580980204851 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (419, CAST(N'2021-09-06T18:37:49.167' AS DateTime), CAST(N'2021-09-06T18:39:14.147' AS DateTime), 1, CAST(51618.62000000000000000000 AS Decimal(38, 20)), CAST(0.00004437509227747840 AS Decimal(38, 20)), CAST(7.69963157653424176378 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (420, CAST(N'2021-09-06T18:37:51.233' AS DateTime), CAST(N'2021-09-06T18:38:07.330' AS DateTime), 0, CAST(51616.04000000000000000000 AS Decimal(38, 20)), CAST(0.00009449058104981182 AS Decimal(38, 20)), CAST(7.69642443139209830988 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (421, CAST(N'2021-09-06T18:37:54.260' AS DateTime), CAST(N'2021-09-06T18:37:58.220' AS DateTime), 0, CAST(51618.62000000000000000000 AS Decimal(38, 20)), CAST(0.00012311314992751560 AS Decimal(38, 20)), CAST(8.49956355970200294984 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (422, CAST(N'2021-09-06T18:37:55.193' AS DateTime), CAST(N'2021-09-06T18:38:03.430' AS DateTime), 0, CAST(51618.63000000000000000000 AS Decimal(38, 20)), CAST(0.00003120997605436016 AS Decimal(38, 20)), CAST(2.40713363248995380890 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (423, CAST(N'2021-09-06T18:37:57.293' AS DateTime), CAST(N'2021-09-06T18:38:01.257' AS DateTime), 0, CAST(51618.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001900325939944140 AS Decimal(38, 20)), CAST(3.47132814614126955120 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (424, CAST(N'2021-09-06T18:37:58.220' AS DateTime), CAST(N'2021-09-06T18:39:04.250' AS DateTime), 1, CAST(51618.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002304230584904740 AS Decimal(38, 20)), CAST(7.54425377782918669963 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (425, CAST(N'2021-09-06T18:38:00.363' AS DateTime), CAST(N'2021-09-06T18:38:21.607' AS DateTime), 0, CAST(51617.96000000000000000000 AS Decimal(38, 20)), CAST(0.00006255155795372540 AS Decimal(38, 20)), CAST(7.16594687919735064688 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (426, CAST(N'2021-09-06T18:38:01.253' AS DateTime), CAST(N'2021-09-06T18:38:55.127' AS DateTime), 1, CAST(51617.97000000000000000000 AS Decimal(38, 20)), CAST(0.00007225924286630930 AS Decimal(38, 20)), CAST(4.71078510407845166008 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (427, CAST(N'2021-09-06T18:38:03.427' AS DateTime), CAST(N'2021-09-06T18:38:58.997' AS DateTime), 1, CAST(51617.97000000000000000000 AS Decimal(38, 20)), CAST(0.00004445756731762434 AS Decimal(38, 20)), CAST(3.90580498374879476147 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (430, CAST(N'2021-09-06T18:38:07.327' AS DateTime), CAST(N'2021-09-06T18:38:24.627' AS DateTime), 1, CAST(51615.60000000000000000000 AS Decimal(38, 20)), CAST(0.00004703022998153718 AS Decimal(38, 20)), CAST(7.30468157386969744440 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (431, CAST(N'2021-09-06T18:38:09.483' AS DateTime), CAST(N'2021-09-06T18:41:15.040' AS DateTime), 0, CAST(51610.89000000000000000000 AS Decimal(38, 20)), CAST(0.00012963375799806500 AS Decimal(38, 20)), CAST(6.69051362432475292785 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (433, CAST(N'2021-09-06T18:38:12.520' AS DateTime), CAST(N'2021-09-06T18:38:12.520' AS DateTime), 1, CAST(51610.01000000000000000000 AS Decimal(38, 20)), CAST(0.00016252814632026900 AS Decimal(38, 20)), CAST(8.38807925687054629269 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (434, CAST(N'2021-09-06T18:38:15.547' AS DateTime), CAST(N'2021-09-06T18:38:22.553' AS DateTime), 1, CAST(51614.52000000000000000000 AS Decimal(38, 20)), CAST(0.00005036923151946162 AS Decimal(38, 20)), CAST(9.24127740401028988056 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (435, CAST(N'2021-09-06T18:38:16.450' AS DateTime), CAST(N'2021-09-06T18:38:16.450' AS DateTime), 1, CAST(51614.52000000000000000000 AS Decimal(38, 20)), CAST(0.00009213882959081740 AS Decimal(38, 20)), CAST(4.75570146269183650865 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (437, CAST(N'2021-09-06T18:38:19.520' AS DateTime), CAST(N'2021-09-06T18:52:22.340' AS DateTime), 0, CAST(51614.50000000000000000000 AS Decimal(38, 20)), CAST(0.00001844334854671910 AS Decimal(38, 20)), CAST(6.47581070511776023000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (438, CAST(N'2021-09-06T18:38:21.603' AS DateTime), CAST(N'2021-09-06T18:38:30.730' AS DateTime), 1, CAST(51617.51000000000000000000 AS Decimal(38, 20)), CAST(0.00003245736455193690 AS Decimal(38, 20)), CAST(4.90412400752524882687 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (439, CAST(N'2021-09-06T18:38:22.550' AS DateTime), CAST(N'2021-09-06T18:38:31.660' AS DateTime), 0, CAST(51620.74000000000000000000 AS Decimal(38, 20)), CAST(0.00002951961794380048 AS Decimal(38, 20)), CAST(4.12392152704219241595 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (440, CAST(N'2021-09-06T18:38:24.627' AS DateTime), CAST(N'2021-09-06T18:39:31.680' AS DateTime), 0, CAST(51621.49000000000000000000 AS Decimal(38, 20)), CAST(0.00003383115866865542 AS Decimal(38, 20)), CAST(4.17418536559203079897 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (441, CAST(N'2021-09-06T18:38:25.590' AS DateTime), CAST(N'2021-09-06T18:41:54.400' AS DateTime), 0, CAST(51620.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000264887586359332 AS Decimal(38, 20)), CAST(9.61753927552956244000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (442, CAST(N'2021-09-06T18:38:27.657' AS DateTime), CAST(N'2021-09-06T18:38:27.667' AS DateTime), 1, CAST(51620.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008193085076377300 AS Decimal(38, 20)), CAST(4.22927051642596226000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (443, CAST(N'2021-09-06T18:38:30.713' AS DateTime), CAST(N'2021-09-06T18:42:00.463' AS DateTime), 0, CAST(51620.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006028708483105770 AS Decimal(38, 20)), CAST(4.78746940459467508195 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (444, CAST(N'2021-09-06T18:38:31.643' AS DateTime), CAST(N'2021-09-06T18:39:49.933' AS DateTime), 1, CAST(51620.02000000000000000000 AS Decimal(38, 20)), CAST(0.00002963887277508152 AS Decimal(38, 20)), CAST(7.43958484021572392742 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (445, CAST(N'2021-09-06T18:38:33.763' AS DateTime), CAST(N'2021-09-06T18:43:25.550' AS DateTime), 1, CAST(51622.48000000000000000000 AS Decimal(38, 20)), CAST(0.00000771587258564100 AS Decimal(38, 20)), CAST(10.16218373498749101408 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (446, CAST(N'2021-09-06T18:38:34.697' AS DateTime), CAST(N'2021-09-06T18:43:31.630' AS DateTime), 1, CAST(51622.49000000000000000000 AS Decimal(38, 20)), CAST(0.00005073698128142220 AS Decimal(38, 20)), CAST(3.56899393945665583132 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (447, CAST(N'2021-09-06T18:38:36.800' AS DateTime), CAST(N'2021-09-06T18:38:36.800' AS DateTime), 1, CAST(51622.49000000000000000000 AS Decimal(38, 20)), CAST(0.00000508563798157761 AS Decimal(38, 20)), CAST(0.26253329584761035645 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (448, CAST(N'2021-09-06T18:38:37.720' AS DateTime), CAST(N'2021-09-06T18:45:33.310' AS DateTime), 1, CAST(51625.90000000000000000000 AS Decimal(38, 20)), CAST(0.00001457779883154561 AS Decimal(38, 20)), CAST(1.24338363044331018664 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (449, CAST(N'2021-09-06T18:38:39.820' AS DateTime), CAST(N'2021-09-06T18:45:45.003' AS DateTime), 1, CAST(51625.90000000000000000000 AS Decimal(38, 20)), CAST(0.00004199716366920490 AS Decimal(38, 20)), CAST(2.92391322850990561825 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (450, CAST(N'2021-09-06T18:38:40.753' AS DateTime), CAST(N'2021-09-06T18:38:40.750' AS DateTime), 0, CAST(51625.89000000000000000000 AS Decimal(38, 20)), CAST(0.00000043035242726577 AS Decimal(38, 20)), CAST(0.02221732707125569441 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (451, CAST(N'2021-09-06T18:38:42.857' AS DateTime), CAST(N'2021-09-06T18:38:42.853' AS DateTime), 0, CAST(51629.77000000000000000000 AS Decimal(38, 20)), CAST(0.00001318317242580610 AS Decimal(38, 20)), CAST(0.68064416021471100760 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (452, CAST(N'2021-09-06T18:38:43.783' AS DateTime), CAST(N'2021-09-06T18:46:15.357' AS DateTime), 1, CAST(51630.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004148592494497350 AS Decimal(38, 20)), CAST(5.07867961965346482600 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (453, CAST(N'2021-09-06T18:38:45.887' AS DateTime), CAST(N'2021-09-06T18:46:18.707' AS DateTime), 1, CAST(51630.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002162502921262120 AS Decimal(38, 20)), CAST(8.10528506959196400000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (454, CAST(N'2021-09-06T18:38:46.810' AS DateTime), CAST(N'2021-09-06T18:46:06.577' AS DateTime), 1, CAST(51629.99000000000000000000 AS Decimal(38, 20)), CAST(0.00011163563482073827 AS Decimal(38, 20)), CAST(7.72359472585317877170 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (455, CAST(N'2021-09-06T18:38:48.983' AS DateTime), CAST(N'2021-09-06T18:39:07.280' AS DateTime), 0, CAST(51635.45000000000000000000 AS Decimal(38, 20)), CAST(0.00003425164531648727 AS Decimal(38, 20)), CAST(4.56357412462742237767 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (456, CAST(N'2021-09-06T18:38:49.843' AS DateTime), CAST(N'2021-09-06T18:46:52.023' AS DateTime), 1, CAST(51635.46000000000000000000 AS Decimal(38, 20)), CAST(0.00000325341308640900 AS Decimal(38, 20)), CAST(5.66852374231368064332 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (457, CAST(N'2021-09-06T18:38:52.063' AS DateTime), CAST(N'2021-09-06T18:38:52.077' AS DateTime), 1, CAST(51637.79000000000000000000 AS Decimal(38, 20)), CAST(0.00009146481365499310 AS Decimal(38, 20)), CAST(4.72304083990566614925 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (458, CAST(N'2021-09-06T18:38:52.920' AS DateTime), CAST(N'2021-09-06T18:47:46.260' AS DateTime), 1, CAST(51637.99000000000000000000 AS Decimal(38, 20)), CAST(0.00013717440047169832 AS Decimal(38, 20)), CAST(9.01230538894511002315 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (459, CAST(N'2021-09-06T18:38:55.123' AS DateTime), CAST(N'2021-09-06T18:39:01.213' AS DateTime), 0, CAST(51640.25000000000000000000 AS Decimal(38, 20)), CAST(0.00004717594415283570 AS Decimal(38, 20)), CAST(6.16766291646540258625 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (460, CAST(N'2021-09-06T18:38:55.960' AS DateTime), CAST(N'2021-09-06T18:48:04.787' AS DateTime), 1, CAST(51640.26000000000000000000 AS Decimal(38, 20)), CAST(0.00000343654249023500 AS Decimal(38, 20)), CAST(7.71696527495409258078 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (461, CAST(N'2021-09-06T18:38:58.993' AS DateTime), CAST(N'2021-09-06T18:39:02.023' AS DateTime), 0, CAST(51640.25000000000000000000 AS Decimal(38, 20)), CAST(0.00002468980244579256 AS Decimal(38, 20)), CAST(3.57078746142528957023 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (462, CAST(N'2021-09-06T18:39:01.210' AS DateTime), CAST(N'2021-09-06T18:47:40.210' AS DateTime), 1, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005444666624741930 AS Decimal(38, 20)), CAST(5.24748673323796743500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (463, CAST(N'2021-09-06T18:39:02.020' AS DateTime), CAST(N'2021-09-06T18:48:01.763' AS DateTime), 1, CAST(51640.24000000000000000000 AS Decimal(38, 20)), CAST(0.00003553863532633454 AS Decimal(38, 20)), CAST(3.11021098137770875450 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (464, CAST(N'2021-09-06T18:39:04.247' AS DateTime), CAST(N'2021-09-06T18:39:10.337' AS DateTime), 0, CAST(51640.26000000000000000000 AS Decimal(38, 20)), CAST(0.00008190314820124880 AS Decimal(38, 20)), CAST(9.86591389066243185036 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (465, CAST(N'2021-09-06T18:39:05.050' AS DateTime), CAST(N'2021-09-06T18:39:05.050' AS DateTime), 0, CAST(51633.31000000000000000000 AS Decimal(38, 20)), CAST(0.00007582046905337860 AS Decimal(38, 20)), CAST(3.91486178297850380117 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (466, CAST(N'2021-09-06T18:39:07.277' AS DateTime), CAST(N'2021-09-06T18:46:48.997' AS DateTime), 1, CAST(51633.32000000000000000000 AS Decimal(38, 20)), CAST(0.00002212481592880763 AS Decimal(38, 20)), CAST(2.91090386394591006607 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (467, CAST(N'2021-09-06T18:39:08.090' AS DateTime), CAST(N'2021-09-06T18:39:08.090' AS DateTime), 1, CAST(51630.07000000000000000000 AS Decimal(38, 20)), CAST(0.00008610536348358980 AS Decimal(38, 20)), CAST(4.44562594403318522529 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (468, CAST(N'2021-09-06T18:39:10.333' AS DateTime), CAST(N'2021-09-06T18:45:02.993' AS DateTime), 1, CAST(51625.81000000000000000000 AS Decimal(38, 20)), CAST(0.00010708706272164720 AS Decimal(38, 20)), CAST(9.75677272096535354576 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (469, CAST(N'2021-09-06T18:39:11.117' AS DateTime), CAST(N'2021-09-06T18:39:11.117' AS DateTime), 0, CAST(51625.76000000000000000000 AS Decimal(38, 20)), CAST(0.00002156632534301200 AS Decimal(38, 20)), CAST(1.11337793624025518912 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (470, CAST(N'2021-09-06T18:39:13.363' AS DateTime), CAST(N'2021-09-06T18:39:13.363' AS DateTime), 1, CAST(51624.05000000000000000000 AS Decimal(38, 20)), CAST(0.00007515308273730480 AS Decimal(38, 20)), CAST(3.87970650088475986044 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (471, CAST(N'2021-09-06T18:39:14.143' AS DateTime), CAST(N'2021-09-06T18:40:02.703' AS DateTime), 0, CAST(51624.05000000000000000000 AS Decimal(38, 20)), CAST(0.00015147083259721760 AS Decimal(38, 20)), CAST(10.11035981802755003880 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (472, CAST(N'2021-09-06T18:39:16.383' AS DateTime), CAST(N'2021-09-06T18:45:11.720' AS DateTime), 1, CAST(51625.84000000000000000000 AS Decimal(38, 20)), CAST(0.00001383880675483370 AS Decimal(38, 20)), CAST(8.25740143054414024304 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (473, CAST(N'2021-09-06T18:39:17.163' AS DateTime), CAST(N'2021-09-06T18:45:12.103' AS DateTime), 1, CAST(51625.85000000000000000000 AS Decimal(38, 20)), CAST(0.00003213820477581500 AS Decimal(38, 20)), CAST(7.38536050421416882405 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (474, CAST(N'2021-09-06T18:39:22.510' AS DateTime), CAST(N'2021-09-06T18:39:59.680' AS DateTime), 0, CAST(51630.06000000000000000000 AS Decimal(38, 20)), CAST(0.00001747747744316160 AS Decimal(38, 20)), CAST(3.52645966317146449956 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (475, CAST(N'2021-09-06T18:39:23.213' AS DateTime), CAST(N'2021-09-06T18:39:59.117' AS DateTime), 0, CAST(51627.95000000000000000000 AS Decimal(38, 20)), CAST(0.00001214066120429903 AS Decimal(38, 20)), CAST(8.40476984804119254075 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (476, CAST(N'2021-09-06T18:39:25.590' AS DateTime), CAST(N'2021-09-06T18:39:29.270' AS DateTime), 0, CAST(51625.88000000000000000000 AS Decimal(38, 20)), CAST(0.00000696509424921400 AS Decimal(38, 20)), CAST(4.27100672732310512857 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (477, CAST(N'2021-09-06T18:39:26.240' AS DateTime), CAST(N'2021-09-06T18:39:46.907' AS DateTime), 0, CAST(51625.89000000000000000000 AS Decimal(38, 20)), CAST(0.00015329127896264760 AS Decimal(38, 20)), CAST(7.94463544640261777085 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (479, CAST(N'2021-09-06T18:39:29.270' AS DateTime), CAST(N'2021-09-06T18:43:55.873' AS DateTime), 1, CAST(51624.10000000000000000000 AS Decimal(38, 20)), CAST(0.00010698442780737940 AS Decimal(38, 20)), CAST(7.70746122319846978470 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (480, CAST(N'2021-09-06T18:39:31.673' AS DateTime), CAST(N'2021-09-06T18:40:11.810' AS DateTime), 1, CAST(51620.11000000000000000000 AS Decimal(38, 20)), CAST(0.00003585904465795458 AS Decimal(38, 20)), CAST(3.59741596164197412710 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (482, CAST(N'2021-09-06T18:39:34.717' AS DateTime), CAST(N'2021-09-06T18:39:34.730' AS DateTime), 1, CAST(51618.34000000000000000000 AS Decimal(38, 20)), CAST(0.00005158305030855490 AS Decimal(38, 20)), CAST(2.66263142906409173687 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (483, CAST(N'2021-09-06T18:39:35.343' AS DateTime), CAST(N'2021-09-06T18:41:36.777' AS DateTime), 0, CAST(51618.35000000000000000000 AS Decimal(38, 20)), CAST(0.00002103184322874610 AS Decimal(38, 20)), CAST(4.76087082180693143286 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (484, CAST(N'2021-09-06T18:39:37.780' AS DateTime), CAST(N'2021-09-06T18:41:00.303' AS DateTime), 0, CAST(51618.08000000000000000000 AS Decimal(38, 20)), CAST(0.00003669660325939608 AS Decimal(38, 20)), CAST(3.65176584470106256278 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (485, CAST(N'2021-09-06T18:39:38.407' AS DateTime), CAST(N'2021-09-06T18:40:20.880' AS DateTime), 0, CAST(51618.07000000000000000000 AS Decimal(38, 20)), CAST(0.00003767413759495760 AS Decimal(38, 20)), CAST(6.62454121317562096201 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (486, CAST(N'2021-09-06T18:39:40.820' AS DateTime), CAST(N'2021-09-06T18:39:56.060' AS DateTime), 0, CAST(51616.91000000000000000000 AS Decimal(38, 20)), CAST(0.00003126692438091470 AS Decimal(38, 20)), CAST(1.61390202174647978758 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (487, CAST(N'2021-09-06T18:39:41.440' AS DateTime), CAST(N'2021-09-06T18:40:20.370' AS DateTime), 0, CAST(51618.06000000000000000000 AS Decimal(38, 20)), CAST(0.00000591946356274170 AS Decimal(38, 20)), CAST(2.09336523371449185395 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (488, CAST(N'2021-09-06T18:39:43.860' AS DateTime), CAST(N'2021-09-06T18:39:43.863' AS DateTime), 1, CAST(51618.06000000000000000000 AS Decimal(38, 20)), CAST(0.00001293302290743820 AS Decimal(38, 20)), CAST(0.66757755241751945389 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (489, CAST(N'2021-09-06T18:39:44.467' AS DateTime), CAST(N'2021-09-06T18:39:44.467' AS DateTime), 1, CAST(51618.07000000000000000000 AS Decimal(38, 20)), CAST(0.00009066350101058540 AS Decimal(38, 20)), CAST(4.67987494160946791818 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (490, CAST(N'2021-09-06T18:39:46.897' AS DateTime), CAST(N'2021-09-06T18:44:41.380' AS DateTime), 1, CAST(51625.59000000000000000000 AS Decimal(38, 20)), CAST(0.00002906788095322740 AS Decimal(38, 20)), CAST(9.41439922256139724125 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (491, CAST(N'2021-09-06T18:39:47.497' AS DateTime), CAST(N'2021-09-06T18:39:47.497' AS DateTime), 0, CAST(51625.59000000000000000000 AS Decimal(38, 20)), CAST(0.00008496359292648900 AS Decimal(38, 20)), CAST(4.38629561334982125351 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (492, CAST(N'2021-09-06T18:39:49.933' AS DateTime), CAST(N'2021-09-06T18:39:50.520' AS DateTime), 0, CAST(51623.62000000000000000000 AS Decimal(38, 20)), CAST(0.00012129749186397348 AS Decimal(38, 20)), CAST(7.79188153230801247910 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (493, CAST(N'2021-09-06T18:39:50.520' AS DateTime), CAST(N'2021-09-06T18:43:38.160' AS DateTime), 1, CAST(51623.62000000000000000000 AS Decimal(38, 20)), CAST(0.00005427624362254452 AS Decimal(38, 20)), CAST(9.06375180273652035516 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (494, CAST(N'2021-09-06T18:39:52.983' AS DateTime), CAST(N'2021-09-06T18:40:17.340' AS DateTime), 0, CAST(51618.72000000000000000000 AS Decimal(38, 20)), CAST(0.00011873783558548330 AS Decimal(38, 20)), CAST(6.73375774948428508848 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (495, CAST(N'2021-09-06T18:39:53.557' AS DateTime), CAST(N'2021-09-06T18:39:53.570' AS DateTime), 1, CAST(51618.72000000000000000000 AS Decimal(38, 20)), CAST(0.00001171401888677570 AS Decimal(38, 20)), CAST(0.60466266099118656110 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (496, CAST(N'2021-09-06T18:39:56.040' AS DateTime), CAST(N'2021-09-06T18:40:02.153' AS DateTime), 1, CAST(51615.61000000000000000000 AS Decimal(38, 20)), CAST(0.00005342467047899250 AS Decimal(38, 20)), CAST(4.37140833056697467139 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (497, CAST(N'2021-09-06T18:39:56.623' AS DateTime), CAST(N'2021-09-06T18:39:56.633' AS DateTime), 1, CAST(51615.61000000000000000000 AS Decimal(38, 20)), CAST(0.00002170241299164590 AS Decimal(38, 20)), CAST(1.12018328503572803250 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (498, CAST(N'2021-09-06T18:39:59.100' AS DateTime), CAST(N'2021-09-06T18:44:17.093' AS DateTime), 1, CAST(51625.25000000000000000000 AS Decimal(38, 20)), CAST(0.00008955297064480997 AS Decimal(38, 20)), CAST(5.24995916761821440225 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (499, CAST(N'2021-09-06T18:39:59.677' AS DateTime), CAST(N'2021-09-06T18:44:20.153' AS DateTime), 1, CAST(51625.25000000000000000000 AS Decimal(38, 20)), CAST(0.00005082413714883070 AS Decimal(38, 20)), CAST(3.52608792871525048558 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (501, CAST(N'2021-09-06T18:40:02.700' AS DateTime), CAST(N'2021-09-06T18:40:14.830' AS DateTime), 1, CAST(51620.77000000000000000000 AS Decimal(38, 20)), CAST(0.00003156021983901040 AS Decimal(38, 20)), CAST(9.44820386066846525556 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (502, CAST(N'2021-09-06T18:40:05.190' AS DateTime), CAST(N'2021-09-06T18:40:05.193' AS DateTime), 1, CAST(51620.77000000000000000000 AS Decimal(38, 20)), CAST(0.00001609542705868160 AS Decimal(38, 20)), CAST(0.83085833824797937683 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (503, CAST(N'2021-09-06T18:40:05.743' AS DateTime), CAST(N'2021-09-06T18:40:05.743' AS DateTime), 1, CAST(51620.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000251816772041757 AS Decimal(38, 20)), CAST(0.12999031071399817679 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (504, CAST(N'2021-09-06T18:40:08.220' AS DateTime), CAST(N'2021-09-06T18:44:11.490' AS DateTime), 1, CAST(51625.20000000000000000000 AS Decimal(38, 20)), CAST(0.00007964589254914189 AS Decimal(38, 20)), CAST(9.36912065599010678760 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (505, CAST(N'2021-09-06T18:40:08.773' AS DateTime), CAST(N'2021-09-06T18:40:08.773' AS DateTime), 1, CAST(51625.20000000000000000000 AS Decimal(38, 20)), CAST(0.00000458442755256986 AS Decimal(38, 20)), CAST(0.23667198928692953647 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (506, CAST(N'2021-09-06T18:40:11.807' AS DateTime), CAST(N'2021-09-06T18:42:07.170' AS DateTime), 0, CAST(51625.24000000000000000000 AS Decimal(38, 20)), CAST(0.00001737706578214512 AS Decimal(38, 20)), CAST(2.74832697813665263643 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (507, CAST(N'2021-09-06T18:40:14.300' AS DateTime), CAST(N'2021-09-06T18:45:17.757' AS DateTime), 1, CAST(51625.89000000000000000000 AS Decimal(38, 20)), CAST(0.00011833727877509696 AS Decimal(38, 20)), CAST(8.01808710553416292362 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (508, CAST(N'2021-09-06T18:40:14.830' AS DateTime), CAST(N'2021-09-06T18:51:55.087' AS DateTime), 0, CAST(51625.88000000000000000000 AS Decimal(38, 20)), CAST(0.00000806034217032620 AS Decimal(38, 20)), CAST(4.57846412053584102712 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (509, CAST(N'2021-09-06T18:40:17.337' AS DateTime), CAST(N'2021-09-06T18:42:43.557' AS DateTime), 1, CAST(51618.72000000000000000000 AS Decimal(38, 20)), CAST(0.00006241164666712866 AS Decimal(38, 20)), CAST(9.64238553821495174112 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (510, CAST(N'2021-09-06T18:40:17.853' AS DateTime), CAST(N'2021-09-06T18:40:17.853' AS DateTime), 0, CAST(51618.72000000000000000000 AS Decimal(38, 20)), CAST(0.00000565068517143404 AS Decimal(38, 20)), CAST(0.29168113567240570923 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (511, CAST(N'2021-09-06T18:40:20.367' AS DateTime), CAST(N'2021-09-06T18:42:01.060' AS DateTime), 1, CAST(51615.60000000000000000000 AS Decimal(38, 20)), CAST(0.00004011290373285930 AS Decimal(38, 20)), CAST(8.04641158526781337680 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (512, CAST(N'2021-09-06T18:40:20.880' AS DateTime), CAST(N'2021-09-06T18:42:04.097' AS DateTime), 1, CAST(51615.61000000000000000000 AS Decimal(38, 20)), CAST(0.00011425385461852670 AS Decimal(38, 20)), CAST(8.68879399434143812296 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (513, CAST(N'2021-09-06T18:40:23.410' AS DateTime), CAST(N'2021-09-06T18:40:23.410' AS DateTime), 1, CAST(51615.61000000000000000000 AS Decimal(38, 20)), CAST(0.00002522891369891770 AS Decimal(38, 20)), CAST(1.30220577020699342530 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (515, CAST(N'2021-09-06T18:40:26.437' AS DateTime), CAST(N'2021-09-06T18:41:24.120' AS DateTime), 0, CAST(51610.48000000000000000000 AS Decimal(38, 20)), CAST(0.00004569581125196800 AS Decimal(38, 20)), CAST(3.26488571064223557840 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (516, CAST(N'2021-09-06T18:40:26.943' AS DateTime), CAST(N'2021-09-06T18:40:26.943' AS DateTime), 1, CAST(51610.48000000000000000000 AS Decimal(38, 20)), CAST(0.00001756431945486200 AS Decimal(38, 20)), CAST(0.90650295793876615376 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (517, CAST(N'2021-09-06T18:40:29.463' AS DateTime), CAST(N'2021-09-06T18:40:29.463' AS DateTime), 1, CAST(51607.88000000000000000000 AS Decimal(38, 20)), CAST(0.00000939047160064358 AS Decimal(38, 20)), CAST(0.48462233150942179941 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (519, CAST(N'2021-09-06T18:40:32.500' AS DateTime), CAST(N'2021-09-06T18:40:53.723' AS DateTime), 0, CAST(51610.45000000000000000000 AS Decimal(38, 20)), CAST(0.00006271317892834230 AS Decimal(38, 20)), CAST(3.23665538542226385704 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (520, CAST(N'2021-09-06T18:40:33.007' AS DateTime), CAST(N'2021-09-06T18:40:54.223' AS DateTime), 0, CAST(51610.45000000000000000000 AS Decimal(38, 20)), CAST(0.00004455354467246380 AS Decimal(38, 20)), CAST(2.29942848964095932671 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (521, CAST(N'2021-09-06T18:40:35.527' AS DateTime), CAST(N'2021-09-06T18:40:35.527' AS DateTime), 1, CAST(51607.53000000000000000000 AS Decimal(38, 20)), CAST(0.00001582156178346910 AS Decimal(38, 20)), CAST(0.81651172438723508232 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (523, CAST(N'2021-09-06T18:40:41.573' AS DateTime), CAST(N'2021-09-06T18:40:41.583' AS DateTime), 1, CAST(51607.54000000000000000000 AS Decimal(38, 20)), CAST(0.00009832670991231070 AS Decimal(38, 20)), CAST(5.07439961486797094268 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (524, CAST(N'2021-09-06T18:40:42.073' AS DateTime), CAST(N'2021-09-06T18:40:42.073' AS DateTime), 1, CAST(51607.87000000000000000000 AS Decimal(38, 20)), CAST(0.00003920716542713680 AS Decimal(38, 20)), CAST(2.02339829643217044662 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (525, CAST(N'2021-09-06T18:40:44.627' AS DateTime), CAST(N'2021-09-06T18:40:47.687' AS DateTime), 1, CAST(51602.20000000000000000000 AS Decimal(38, 20)), CAST(0.00013937872384645910 AS Decimal(38, 20)), CAST(9.81419609111568939520 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (526, CAST(N'2021-09-06T18:40:45.103' AS DateTime), CAST(N'2021-09-06T18:40:45.107' AS DateTime), 0, CAST(51608.27000000000000000000 AS Decimal(38, 20)), CAST(0.00004490956023564080 AS Decimal(38, 20)), CAST(2.31770471022221402942 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (530, CAST(N'2021-09-06T18:40:53.720' AS DateTime), CAST(N'2021-09-06T18:41:02.873' AS DateTime), 1, CAST(51610.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001539018220053530 AS Decimal(38, 20)), CAST(4.03094961437388093092 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (531, CAST(N'2021-09-06T18:40:54.220' AS DateTime), CAST(N'2021-09-06T18:41:05.937' AS DateTime), 1, CAST(51610.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001647399729884880 AS Decimal(38, 20)), CAST(3.14965890353333037667 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (532, CAST(N'2021-09-06T18:40:56.760' AS DateTime), CAST(N'2021-09-06T18:40:56.760' AS DateTime), 1, CAST(51612.92000000000000000000 AS Decimal(38, 20)), CAST(0.00005219495867015560 AS Decimal(38, 20)), CAST(2.69393422624604737035 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (533, CAST(N'2021-09-06T18:40:57.260' AS DateTime), CAST(N'2021-09-06T18:40:57.260' AS DateTime), 1, CAST(51612.92000000000000000000 AS Decimal(38, 20)), CAST(0.00005482664362286530 AS Decimal(38, 20)), CAST(2.82976317117545689968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (534, CAST(N'2021-09-06T18:40:59.793' AS DateTime), CAST(N'2021-09-06T18:40:59.807' AS DateTime), 1, CAST(51616.92000000000000000000 AS Decimal(38, 20)), CAST(0.00000882035047226602 AS Decimal(38, 20)), CAST(0.45527932469891737306 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (535, CAST(N'2021-09-06T18:41:00.283' AS DateTime), CAST(N'2021-09-06T18:42:31.400' AS DateTime), 1, CAST(51616.93000000000000000000 AS Decimal(38, 20)), CAST(0.00003664865355782612 AS Decimal(38, 20)), CAST(4.47307932536826472049 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (536, CAST(N'2021-09-06T18:41:02.853' AS DateTime), CAST(N'2021-09-06T18:51:54.980' AS DateTime), 0, CAST(51625.35000000000000000000 AS Decimal(38, 20)), CAST(0.00005469125502495620 AS Decimal(38, 20)), CAST(3.61797872526902760953 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (537, CAST(N'2021-09-06T18:41:03.367' AS DateTime), CAST(N'2021-09-06T18:41:03.380' AS DateTime), 1, CAST(51625.88000000000000000000 AS Decimal(38, 20)), CAST(0.00004906488258813740 AS Decimal(38, 20)), CAST(2.53301774070927083591 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (538, CAST(N'2021-09-06T18:41:05.920' AS DateTime), CAST(N'2021-09-06T18:42:06.550' AS DateTime), 0, CAST(51620.82000000000000000000 AS Decimal(38, 20)), CAST(0.00009427466722870020 AS Decimal(38, 20)), CAST(5.71693687681699197018 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (539, CAST(N'2021-09-06T18:41:06.430' AS DateTime), CAST(N'2021-09-06T18:41:39.257' AS DateTime), 1, CAST(51615.55000000000000000000 AS Decimal(38, 20)), CAST(0.00005361073960252590 AS Decimal(38, 20)), CAST(3.41495910809541389395 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (542, CAST(N'2021-09-06T18:41:15.040' AS DateTime), CAST(N'2021-09-06T18:41:27.647' AS DateTime), 1, CAST(51610.49000000000000000000 AS Decimal(38, 20)), CAST(0.00002223569686628700 AS Decimal(38, 20)), CAST(7.83805698158209025248 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (545, CAST(N'2021-09-06T18:41:18.560' AS DateTime), CAST(N'2021-09-06T18:41:18.560' AS DateTime), 1, CAST(51615.54000000000000000000 AS Decimal(38, 20)), CAST(0.00002646808076019780 AS Decimal(38, 20)), CAST(1.36616428120121995381 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (547, CAST(N'2021-09-06T18:41:24.117' AS DateTime), CAST(N'2021-09-06T18:41:27.160' AS DateTime), 1, CAST(51610.48000000000000000000 AS Decimal(38, 20)), CAST(0.00008001163968816900 AS Decimal(38, 20)), CAST(6.48782188259692183576 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (551, CAST(N'2021-09-06T18:41:30.683' AS DateTime), CAST(N'2021-09-06T18:41:30.683' AS DateTime), 1, CAST(51615.55000000000000000000 AS Decimal(38, 20)), CAST(0.00007530112325926360 AS Decimal(38, 20)), CAST(3.88670889264468330898 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (552, CAST(N'2021-09-06T18:41:33.223' AS DateTime), CAST(N'2021-09-06T18:41:33.223' AS DateTime), 1, CAST(51615.75000000000000000000 AS Decimal(38, 20)), CAST(0.00003221984265009870 AS Decimal(38, 20)), CAST(1.66305134326683197453 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (553, CAST(N'2021-09-06T18:41:33.730' AS DateTime), CAST(N'2021-09-06T18:41:33.730' AS DateTime), 1, CAST(51615.75000000000000000000 AS Decimal(38, 20)), CAST(0.00003898045292076680 AS Decimal(38, 20)), CAST(2.01200531284506895710 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (554, CAST(N'2021-09-06T18:41:36.773' AS DateTime), CAST(N'2021-09-06T18:42:16.283' AS DateTime), 1, CAST(51615.74000000000000000000 AS Decimal(38, 20)), CAST(0.00000271622669078240 AS Decimal(38, 20)), CAST(1.22577420246820397859 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (556, CAST(N'2021-09-06T18:41:39.810' AS DateTime), CAST(N'2021-09-06T18:41:39.810' AS DateTime), 0, CAST(51615.73000000000000000000 AS Decimal(38, 20)), CAST(0.00010985871186007700 AS Decimal(38, 20)), CAST(5.67043760951753221121 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (557, CAST(N'2021-09-06T18:41:42.277' AS DateTime), CAST(N'2021-09-06T18:41:42.850' AS DateTime), 0, CAST(51612.32000000000000000000 AS Decimal(38, 20)), CAST(0.00011776871714637100 AS Decimal(38, 20)), CAST(6.07831671534798689072 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (558, CAST(N'2021-09-06T18:41:42.850' AS DateTime), CAST(N'2021-09-06T18:41:55.017' AS DateTime), 1, CAST(51612.32000000000000000000 AS Decimal(38, 20)), CAST(0.00004554228514691000 AS Decimal(38, 20)), CAST(8.42885970988155282192 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (561, CAST(N'2021-09-06T18:41:48.950' AS DateTime), CAST(N'2021-09-06T18:41:48.960' AS DateTime), 1, CAST(51612.32000000000000000000 AS Decimal(38, 20)), CAST(0.00006886278394091070 AS Decimal(38, 20)), CAST(3.55416804084914413982 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (562, CAST(N'2021-09-06T18:41:51.327' AS DateTime), CAST(N'2021-09-06T18:41:57.427' AS DateTime), 1, CAST(51612.32000000000000000000 AS Decimal(38, 20)), CAST(0.00005903073468200440 AS Decimal(38, 20)), CAST(7.36547742438131863168 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (563, CAST(N'2021-09-06T18:41:54.397' AS DateTime), CAST(N'2021-09-06T18:42:39.910' AS DateTime), 1, CAST(51618.36000000000000000000 AS Decimal(38, 20)), CAST(0.00001623363048594168 AS Decimal(38, 20)), CAST(1.65679512544660432097 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (564, CAST(N'2021-09-06T18:41:55.013' AS DateTime), CAST(N'2021-09-06T18:51:51.953' AS DateTime), 0, CAST(51618.35000000000000000000 AS Decimal(38, 20)), CAST(0.00006315452114825800 AS Decimal(38, 20)), CAST(5.61074979122618513280 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (566, CAST(N'2021-09-06T18:42:00.460' AS DateTime), CAST(N'2021-09-06T18:42:42.947' AS DateTime), 1, CAST(51618.36000000000000000000 AS Decimal(38, 20)), CAST(0.00004340903565446430 AS Decimal(38, 20)), CAST(5.35262367782504938392 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (568, CAST(N'2021-09-06T18:42:03.493' AS DateTime), CAST(N'2021-09-06T18:42:03.493' AS DateTime), 0, CAST(51618.42000000000000000000 AS Decimal(38, 20)), CAST(0.00001640856322665170 AS Decimal(38, 20)), CAST(0.84698410822986264431 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (570, CAST(N'2021-09-06T18:42:06.527' AS DateTime), CAST(N'2021-09-06T18:42:46.587' AS DateTime), 1, CAST(51620.82000000000000000000 AS Decimal(38, 20)), CAST(0.00009890402625263880 AS Decimal(38, 20)), CAST(9.97204256403537387798 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (571, CAST(N'2021-09-06T18:42:07.143' AS DateTime), CAST(N'2021-09-06T18:43:59.370' AS DateTime), 1, CAST(51624.99000000000000000000 AS Decimal(38, 20)), CAST(0.00007819814965045038 AS Decimal(38, 20)), CAST(8.69878174325030945775 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (572, CAST(N'2021-09-06T18:42:09.603' AS DateTime), CAST(N'2021-09-06T18:46:21.740' AS DateTime), 1, CAST(51630.62000000000000000000 AS Decimal(38, 20)), CAST(0.00006114320701972700 AS Decimal(38, 20)), CAST(5.09293765710426984278 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (573, CAST(N'2021-09-06T18:42:10.250' AS DateTime), CAST(N'2021-09-06T18:46:24.447' AS DateTime), 1, CAST(51630.63000000000000000000 AS Decimal(38, 20)), CAST(0.00001443097433747180 AS Decimal(38, 20)), CAST(6.36714765814460733831 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (574, CAST(N'2021-09-06T18:42:12.667' AS DateTime), CAST(N'2021-09-06T18:46:30.833' AS DateTime), 1, CAST(51630.63000000000000000000 AS Decimal(38, 20)), CAST(0.00005509903806033580 AS Decimal(38, 20)), CAST(9.68650772422845599637 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (575, CAST(N'2021-09-06T18:42:15.693' AS DateTime), CAST(N'2021-09-06T18:46:42.690' AS DateTime), 1, CAST(51633.27000000000000000000 AS Decimal(38, 20)), CAST(0.00016859797871140700 AS Decimal(38, 20)), CAST(8.70526495626032971089 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (576, CAST(N'2021-09-06T18:42:16.280' AS DateTime), CAST(N'2021-09-06T18:43:04.777' AS DateTime), 0, CAST(51633.26000000000000000000 AS Decimal(38, 20)), CAST(0.00005811875455925175 AS Decimal(38, 20)), CAST(3.30205576410258252140 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (577, CAST(N'2021-09-06T18:42:18.730' AS DateTime), CAST(N'2021-09-06T18:46:48.747' AS DateTime), 1, CAST(51633.31000000000000000000 AS Decimal(38, 20)), CAST(0.00004703948509275890 AS Decimal(38, 20)), CAST(2.42880431603479903896 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (578, CAST(N'2021-09-06T18:42:19.307' AS DateTime), CAST(N'2021-09-06T18:42:19.307' AS DateTime), 0, CAST(51633.31000000000000000000 AS Decimal(38, 20)), CAST(0.00001331389407315940 AS Decimal(38, 20)), CAST(0.68744041998660197961 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (579, CAST(N'2021-09-06T18:42:21.760' AS DateTime), CAST(N'2021-09-06T18:47:25.320' AS DateTime), 1, CAST(51635.63000000000000000000 AS Decimal(38, 20)), CAST(0.00001273908466693900 AS Decimal(38, 20)), CAST(0.65779066240073543657 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (580, CAST(N'2021-09-06T18:42:22.333' AS DateTime), CAST(N'2021-09-06T18:47:31.100' AS DateTime), 1, CAST(51635.63000000000000000000 AS Decimal(38, 20)), CAST(0.00005053541569529820 AS Decimal(38, 20)), CAST(3.79844357011857527175 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (581, CAST(N'2021-09-06T18:42:27.803' AS DateTime), CAST(N'2021-09-06T18:47:43.600' AS DateTime), 1, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009951988863736360 AS Decimal(38, 20)), CAST(6.15523931769188841100 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (582, CAST(N'2021-09-06T18:42:28.370' AS DateTime), CAST(N'2021-09-06T18:47:31.463' AS DateTime), 1, CAST(51636.99000000000000000000 AS Decimal(38, 20)), CAST(0.00005854457470520610 AS Decimal(38, 20)), CAST(3.02306561860698033364 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (583, CAST(N'2021-09-06T18:42:31.397' AS DateTime), CAST(N'2021-09-06T18:43:01.213' AS DateTime), 0, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010876324340177888 AS Decimal(38, 20)), CAST(7.50863412330312338500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (584, CAST(N'2021-09-06T18:42:33.833' AS DateTime), CAST(N'2021-09-06T18:47:52.687' AS DateTime), 1, CAST(51638.46000000000000000000 AS Decimal(38, 20)), CAST(0.00005377621066466731 AS Decimal(38, 20)), CAST(3.22424001991218623979 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (585, CAST(N'2021-09-06T18:42:34.453' AS DateTime), CAST(N'2021-09-06T18:47:55.353' AS DateTime), 1, CAST(51638.47000000000000000000 AS Decimal(38, 20)), CAST(0.00000280223786961391 AS Decimal(38, 20)), CAST(0.14470327616292180312 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (586, CAST(N'2021-09-06T18:42:36.877' AS DateTime), CAST(N'2021-09-06T18:47:58.387' AS DateTime), 1, CAST(51638.47000000000000000000 AS Decimal(38, 20)), CAST(0.00002880769932121400 AS Decimal(38, 20)), CAST(1.48758551716752950258 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (587, CAST(N'2021-09-06T18:42:37.483' AS DateTime), CAST(N'2021-09-06T18:42:37.483' AS DateTime), 0, CAST(51639.61000000000000000000 AS Decimal(38, 20)), CAST(0.00001321450574938880 AS Decimal(38, 20)), CAST(0.68239192324119537037 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (588, CAST(N'2021-09-06T18:42:39.910' AS DateTime), CAST(N'2021-09-06T18:43:13.400' AS DateTime), 0, CAST(51639.60000000000000000000 AS Decimal(38, 20)), CAST(0.00001484494321739512 AS Decimal(38, 20)), CAST(1.60488511461083101728 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (589, CAST(N'2021-09-06T18:42:40.517' AS DateTime), CAST(N'2021-09-06T18:49:29.710' AS DateTime), 1, CAST(51648.26000000000000000000 AS Decimal(38, 20)), CAST(0.00000707862954916372 AS Decimal(38, 20)), CAST(4.34685134227800278249 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (590, CAST(N'2021-09-06T18:42:42.947' AS DateTime), CAST(N'2021-09-06T18:43:19.987' AS DateTime), 0, CAST(51641.46000000000000000000 AS Decimal(38, 20)), CAST(0.00001753565884080440 AS Decimal(38, 20)), CAST(9.13023280016593444530 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (591, CAST(N'2021-09-06T18:42:43.553' AS DateTime), CAST(N'2021-09-06T18:43:22.527' AS DateTime), 0, CAST(51641.46000000000000000000 AS Decimal(38, 20)), CAST(0.00008990107341199234 AS Decimal(38, 20)), CAST(7.86565124145712395666 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (592, CAST(N'2021-09-06T18:42:46.003' AS DateTime), CAST(N'2021-09-06T18:48:32.150' AS DateTime), 1, CAST(51641.47000000000000000000 AS Decimal(38, 20)), CAST(0.00001621372262770950 AS Decimal(38, 20)), CAST(4.42845643663042826320 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (593, CAST(N'2021-09-06T18:42:46.583' AS DateTime), CAST(N'2021-09-06T18:42:55.127' AS DateTime), 0, CAST(51641.47000000000000000000 AS Decimal(38, 20)), CAST(0.00002055065381366320 AS Decimal(38, 20)), CAST(6.16881527700353274394 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (594, CAST(N'2021-09-06T18:42:49.040' AS DateTime), CAST(N'2021-09-06T18:43:29.093' AS DateTime), 0, CAST(51641.46000000000000000000 AS Decimal(38, 20)), CAST(0.00002477386892995485 AS Decimal(38, 20)), CAST(5.49912207745016201826 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (595, CAST(N'2021-09-06T18:42:52.640' AS DateTime), CAST(N'2021-09-06T18:42:52.657' AS DateTime), 0, CAST(51641.46000000000000000000 AS Decimal(38, 20)), CAST(0.00000623874422453285 AS Decimal(38, 20)), CAST(0.32217786032144419196 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (596, CAST(N'2021-09-06T18:42:55.100' AS DateTime), CAST(N'2021-09-06T18:48:37.857' AS DateTime), 1, CAST(51641.47000000000000000000 AS Decimal(38, 20)), CAST(0.00006379150453200160 AS Decimal(38, 20)), CAST(6.88111372597582348251 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (597, CAST(N'2021-09-06T18:42:58.183' AS DateTime), CAST(N'2021-09-06T18:48:50.030' AS DateTime), 1, CAST(51643.73000000000000000000 AS Decimal(38, 20)), CAST(0.00004787423165881750 AS Decimal(38, 20)), CAST(6.18549569561821696644 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (598, CAST(N'2021-09-06T18:42:58.727' AS DateTime), CAST(N'2021-09-06T18:42:58.727' AS DateTime), 0, CAST(51636.99000000000000000000 AS Decimal(38, 20)), CAST(0.00011743604918822500 AS Decimal(38, 20)), CAST(6.06404409757188244275 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (599, CAST(N'2021-09-06T18:43:01.210' AS DateTime), CAST(N'2021-09-06T18:47:07.110' AS DateTime), 1, CAST(51635.52000000000000000000 AS Decimal(38, 20)), CAST(0.00002869841485689295 AS Decimal(38, 20)), CAST(7.24909374934608634560 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (600, CAST(N'2021-09-06T18:43:01.753' AS DateTime), CAST(N'2021-09-06T18:43:07.313' AS DateTime), 0, CAST(51635.51000000000000000000 AS Decimal(38, 20)), CAST(0.00012216220671411815 AS Decimal(38, 20)), CAST(6.33939278248263534476 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (601, CAST(N'2021-09-06T18:43:04.250' AS DateTime), CAST(N'2021-09-06T18:43:04.247' AS DateTime), 1, CAST(51632.54000000000000000000 AS Decimal(38, 20)), CAST(0.00000311712566908315 AS Decimal(38, 20)), CAST(0.16094511579396250570 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (602, CAST(N'2021-09-06T18:43:04.777' AS DateTime), CAST(N'2021-09-06T18:46:36.910' AS DateTime), 1, CAST(51632.55000000000000000000 AS Decimal(38, 20)), CAST(0.00003699720121780305 AS Decimal(38, 20)), CAST(5.64338028481095156930 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (603, CAST(N'2021-09-06T18:43:07.300' AS DateTime), CAST(N'2021-09-06T18:46:39.670' AS DateTime), 1, CAST(51632.55000000000000000000 AS Decimal(38, 20)), CAST(0.00004058071227771185 AS Decimal(38, 20)), CAST(8.40283190199161206650 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (604, CAST(N'2021-09-06T18:43:07.807' AS DateTime), CAST(N'2021-09-06T18:51:46.013' AS DateTime), 0, CAST(51632.54000000000000000000 AS Decimal(38, 20)), CAST(0.00002723788434045230 AS Decimal(38, 20)), CAST(3.82148074666450894162 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (605, CAST(N'2021-09-06T18:43:10.333' AS DateTime), CAST(N'2021-09-06T18:51:42.823' AS DateTime), 0, CAST(51635.51000000000000000000 AS Decimal(38, 20)), CAST(0.00000356850642877100 AS Decimal(38, 20)), CAST(1.32446438918745258849 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (607, CAST(N'2021-09-06T18:43:13.373' AS DateTime), CAST(N'2021-09-06T18:47:22.010' AS DateTime), 1, CAST(51635.52000000000000000000 AS Decimal(38, 20)), CAST(0.00009405376896916588 AS Decimal(38, 20)), CAST(5.62304163108341424672 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (608, CAST(N'2021-09-06T18:43:16.447' AS DateTime), CAST(N'2021-09-06T18:43:16.457' AS DateTime), 0, CAST(51636.45000000000000000000 AS Decimal(38, 20)), CAST(0.00005136880215786810 AS Decimal(38, 20)), CAST(2.65250258418464825225 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (609, CAST(N'2021-09-06T18:43:16.947' AS DateTime), CAST(N'2021-09-06T18:43:16.943' AS DateTime), 1, CAST(51635.52000000000000000000 AS Decimal(38, 20)), CAST(0.00005515009120812180 AS Decimal(38, 20)), CAST(2.84770363757879736634 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (610, CAST(N'2021-09-06T18:43:19.500' AS DateTime), CAST(N'2021-09-06T18:43:19.500' AS DateTime), 1, CAST(51638.08000000000000000000 AS Decimal(38, 20)), CAST(0.00006070565332691450 AS Decimal(38, 20)), CAST(3.13472338294747710416 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (611, CAST(N'2021-09-06T18:43:19.977' AS DateTime), CAST(N'2021-09-06T18:47:49.297' AS DateTime), 1, CAST(51638.08000000000000000000 AS Decimal(38, 20)), CAST(0.00003009278114423830 AS Decimal(38, 20)), CAST(3.24386425734890826944 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (612, CAST(N'2021-09-06T18:43:22.523' AS DateTime), CAST(N'2021-09-06T18:47:58.747' AS DateTime), 1, CAST(51639.49000000000000000000 AS Decimal(38, 20)), CAST(0.00001455374966121966 AS Decimal(38, 20)), CAST(5.39399379154090034188 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (615, CAST(N'2021-09-06T18:43:26.050' AS DateTime), CAST(N'2021-09-06T18:48:41.243' AS DateTime), 1, CAST(51641.62000000000000000000 AS Decimal(38, 20)), CAST(0.00000733995670794510 AS Decimal(38, 20)), CAST(2.09007879009442302180 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (616, CAST(N'2021-09-06T18:43:28.583' AS DateTime), CAST(N'2021-09-06T18:43:28.580' AS DateTime), 1, CAST(51638.10000000000000000000 AS Decimal(38, 20)), CAST(0.00001031820923570460 AS Decimal(38, 20)), CAST(0.53281272033423770526 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (617, CAST(N'2021-09-06T18:43:29.090' AS DateTime), CAST(N'2021-09-06T18:48:16.557' AS DateTime), 1, CAST(51641.44000000000000000000 AS Decimal(38, 20)), CAST(0.00005011212260001915 AS Decimal(38, 20)), CAST(10.18864132157736787536 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (618, CAST(N'2021-09-06T18:43:31.627' AS DateTime), CAST(N'2021-09-06T18:43:40.703' AS DateTime), 0, CAST(51644.39000000000000000000 AS Decimal(38, 20)), CAST(0.00011892129775086480 AS Decimal(38, 20)), CAST(8.76189832907225241993 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (620, CAST(N'2021-09-06T18:43:34.657' AS DateTime), CAST(N'2021-09-06T18:43:35.137' AS DateTime), 0, CAST(51644.18000000000000000000 AS Decimal(38, 20)), CAST(0.00004788295181835130 AS Decimal(38, 20)), CAST(5.98119363046217131126 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (621, CAST(N'2021-09-06T18:43:35.133' AS DateTime), CAST(N'2021-09-06T18:48:56.067' AS DateTime), 1, CAST(51644.17000000000000000000 AS Decimal(38, 20)), CAST(0.00002521103351619690 AS Decimal(38, 20)), CAST(4.67284789330736295903 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (623, CAST(N'2021-09-06T18:43:40.703' AS DateTime), CAST(N'2021-09-06T18:49:02.453' AS DateTime), 1, CAST(51644.21000000000000000000 AS Decimal(38, 20)), CAST(0.00001332467524955220 AS Decimal(38, 20)), CAST(6.82973880128786563557 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (625, CAST(N'2021-09-06T18:43:44.223' AS DateTime), CAST(N'2021-09-06T18:49:05.240' AS DateTime), 1, CAST(51644.99000000000000000000 AS Decimal(38, 20)), CAST(0.00004086597340221800 AS Decimal(38, 20)), CAST(2.11052278769781458782 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (626, CAST(N'2021-09-06T18:43:46.767' AS DateTime), CAST(N'2021-09-06T18:49:35.563' AS DateTime), 1, CAST(51648.26000000000000000000 AS Decimal(38, 20)), CAST(0.00006000207143835820 AS Decimal(38, 20)), CAST(4.27366401966854714968 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (627, CAST(N'2021-09-06T18:43:47.243' AS DateTime), CAST(N'2021-09-06T18:49:44.640' AS DateTime), 1, CAST(51648.26000000000000000000 AS Decimal(38, 20)), CAST(0.00000224477099359290 AS Decimal(38, 20)), CAST(9.25470332429986663018 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (630, CAST(N'2021-09-06T18:43:52.843' AS DateTime), CAST(N'2021-09-06T18:43:52.840' AS DateTime), 0, CAST(51664.11000000000000000000 AS Decimal(38, 20)), CAST(0.00003535015044517360 AS Decimal(38, 20)), CAST(1.82633406111599783950 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (632, CAST(N'2021-09-06T18:43:55.870' AS DateTime), CAST(N'2021-09-06T18:50:54.437' AS DateTime), 0, CAST(51654.64000000000000000000 AS Decimal(38, 20)), CAST(0.00000537465289485400 AS Decimal(38, 20)), CAST(6.69461882441177813776 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (633, CAST(N'2021-09-06T18:43:56.330' AS DateTime), CAST(N'2021-09-06T18:43:56.330' AS DateTime), 0, CAST(51654.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007292422143412950 AS Decimal(38, 20)), CAST(3.76687513470245737718 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (634, CAST(N'2021-09-06T18:43:59.353' AS DateTime), CAST(N'2021-09-06T18:51:03.553' AS DateTime), 0, CAST(51654.64000000000000000000 AS Decimal(38, 20)), CAST(0.00001176897474181282 AS Decimal(38, 20)), CAST(4.64721942231757438125 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (635, CAST(N'2021-09-06T18:44:01.917' AS DateTime), CAST(N'2021-09-06T18:44:01.930' AS DateTime), 0, CAST(51654.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007044532665537920 AS Decimal(38, 20)), CAST(3.63882869251928319328 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (636, CAST(N'2021-09-06T18:44:02.403' AS DateTime), CAST(N'2021-09-06T18:44:02.403' AS DateTime), 0, CAST(51658.44000000000000000000 AS Decimal(38, 20)), CAST(0.00000990322158201748 AS Decimal(38, 20)), CAST(0.51158497790135506953 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (639, CAST(N'2021-09-06T18:44:07.990' AS DateTime), CAST(N'2021-09-06T18:50:27.340' AS DateTime), 1, CAST(51654.65000000000000000000 AS Decimal(38, 20)), CAST(0.00003678847050144730 AS Decimal(38, 20)), CAST(1.90029556778758477495 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (640, CAST(N'2021-09-06T18:44:08.460' AS DateTime), CAST(N'2021-09-06T18:50:30.370' AS DateTime), 1, CAST(51654.65000000000000000000 AS Decimal(38, 20)), CAST(0.00002614292168344510 AS Decimal(38, 20)), CAST(1.35040346953576743472 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (642, CAST(N'2021-09-06T18:44:11.480' AS DateTime), CAST(N'2021-09-06T18:44:14.037' AS DateTime), 0, CAST(51658.43000000000000000000 AS Decimal(38, 20)), CAST(0.00008219981104237911 AS Decimal(38, 20)), CAST(8.36069494978333617203 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (643, CAST(N'2021-09-06T18:44:14.033' AS DateTime), CAST(N'2021-09-06T18:50:36.240' AS DateTime), 1, CAST(51655.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009372867145283589 AS Decimal(38, 20)), CAST(9.08758576329033082500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (645, CAST(N'2021-09-06T18:44:17.070' AS DateTime), CAST(N'2021-09-06T18:44:17.590' AS DateTime), 0, CAST(51657.71000000000000000000 AS Decimal(38, 20)), CAST(0.00002442824161817703 AS Decimal(38, 20)), CAST(5.88800840852982617977 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (647, CAST(N'2021-09-06T18:44:20.137' AS DateTime), CAST(N'2021-09-06T18:46:51.760' AS DateTime), 0, CAST(51664.35000000000000000000 AS Decimal(38, 20)), CAST(0.00006803053015285720 AS Decimal(38, 20)), CAST(6.98408823299309294025 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (648, CAST(N'2021-09-06T18:44:20.637' AS DateTime), CAST(N'2021-09-06T18:44:20.650' AS DateTime), 0, CAST(51664.35000000000000000000 AS Decimal(38, 20)), CAST(0.00000172314792951716 AS Decimal(38, 20)), CAST(0.08902531773234988525 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (652, CAST(N'2021-09-06T18:44:26.710' AS DateTime), CAST(N'2021-09-06T18:49:11.310' AS DateTime), 0, CAST(51669.98000000000000000000 AS Decimal(38, 20)), CAST(0.00004221554428442276 AS Decimal(38, 20)), CAST(7.75639583780812080718 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (654, CAST(N'2021-09-06T18:44:29.733' AS DateTime), CAST(N'2021-09-06T18:44:29.737' AS DateTime), 0, CAST(51669.99000000000000000000 AS Decimal(38, 20)), CAST(0.00002457422876012240 AS Decimal(38, 20)), CAST(1.26975015429323680678 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (656, CAST(N'2021-09-06T18:44:35.340' AS DateTime), CAST(N'2021-09-06T18:44:35.827' AS DateTime), 0, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00007155034293958423 AS Decimal(38, 20)), CAST(6.23615083973799499300 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (659, CAST(N'2021-09-06T18:44:41.380' AS DateTime), CAST(N'2021-09-06T18:44:44.873' AS DateTime), 0, CAST(51670.26000000000000000000 AS Decimal(38, 20)), CAST(0.00000407917592864510 AS Decimal(38, 20)), CAST(1.71271704732114136185 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (666, CAST(N'2021-09-06T18:45:02.977' AS DateTime), CAST(N'2021-09-06T18:49:26.423' AS DateTime), 0, CAST(51671.82000000000000000000 AS Decimal(38, 20)), CAST(0.00002612872814113680 AS Decimal(38, 20)), CAST(6.88350236661941954688 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (668, CAST(N'2021-09-06T18:45:06.033' AS DateTime), CAST(N'2021-09-06T18:45:06.050' AS DateTime), 0, CAST(51673.34000000000000000000 AS Decimal(38, 20)), CAST(0.00006060479323407860 AS Decimal(38, 20)), CAST(3.13165208641424308452 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (669, CAST(N'2021-09-06T18:45:08.637' AS DateTime), CAST(N'2021-09-06T18:45:08.650' AS DateTime), 0, CAST(51670.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004728620548140550 AS Decimal(38, 20)), CAST(2.44327823722422218500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (671, CAST(N'2021-09-06T18:45:11.707' AS DateTime), CAST(N'2021-09-06T18:45:21.170' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00010067774676749430 AS Decimal(38, 20)), CAST(5.91736920870338103608 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (672, CAST(N'2021-09-06T18:45:12.103' AS DateTime), CAST(N'2021-09-06T18:45:23.833' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00009375876928389000 AS Decimal(38, 20)), CAST(6.50542524076725318005 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (673, CAST(N'2021-09-06T18:45:17.753' AS DateTime), CAST(N'2021-09-06T18:45:18.133' AS DateTime), 0, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00001453252975574304 AS Decimal(38, 20)), CAST(6.86573112568685360080 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (679, CAST(N'2021-09-06T18:45:33.303' AS DateTime), CAST(N'2021-09-06T18:45:41.973' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00005772638267731599 AS Decimal(38, 20)), CAST(3.73614577247661700078 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (682, CAST(N'2021-09-06T18:45:45.000' AS DateTime), CAST(N'2021-09-06T18:48:56.413' AS DateTime), 0, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00003606865249391130 AS Decimal(38, 20)), CAST(9.17002875454803338312 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (683, CAST(N'2021-09-06T18:45:48.410' AS DateTime), CAST(N'2021-09-06T18:49:08.533' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00010042721140218290 AS Decimal(38, 20)), CAST(7.79330145169615625322 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (684, CAST(N'2021-09-06T18:45:51.030' AS DateTime), CAST(N'2021-09-06T18:50:05.963' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00005214576257958462 AS Decimal(38, 20)), CAST(9.58280806865437275418 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (685, CAST(N'2021-09-06T18:45:51.437' AS DateTime), CAST(N'2021-09-06T18:45:51.440' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00009939816291415980 AS Decimal(38, 20)), CAST(5.13616350096147196468 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (687, CAST(N'2021-09-06T18:46:00.070' AS DateTime), CAST(N'2021-09-06T18:49:14.327' AS DateTime), 0, CAST(51670.03000000000000000000 AS Decimal(38, 20)), CAST(0.00005905153791376040 AS Decimal(38, 20)), CAST(6.10026476403876713592 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (688, CAST(N'2021-09-06T18:46:00.490' AS DateTime), CAST(N'2021-09-06T18:49:17.370' AS DateTime), 0, CAST(51670.03000000000000000000 AS Decimal(38, 20)), CAST(0.00002880740250870987 AS Decimal(38, 20)), CAST(2.49824557196572707721 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (689, CAST(N'2021-09-06T18:46:03.127' AS DateTime), CAST(N'2021-09-06T18:46:03.127' AS DateTime), 1, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00005767677885372040 AS Decimal(38, 20)), CAST(2.98001900879911852743 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (690, CAST(N'2021-09-06T18:46:03.543' AS DateTime), CAST(N'2021-09-06T18:46:12.650' AS DateTime), 0, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00000186818707821380 AS Decimal(38, 20)), CAST(7.73771146962887054110 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (691, CAST(N'2021-09-06T18:46:06.157' AS DateTime), CAST(N'2021-09-06T18:46:06.157' AS DateTime), 0, CAST(51667.56000000000000000000 AS Decimal(38, 20)), CAST(0.00003285030686894910 AS Decimal(38, 20)), CAST(1.69729520116983976120 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (692, CAST(N'2021-09-06T18:46:06.573' AS DateTime), CAST(N'2021-09-06T18:46:12.260' AS DateTime), 0, CAST(51667.56000000000000000000 AS Decimal(38, 20)), CAST(0.00000770849567265673 AS Decimal(38, 20)), CAST(6.16622002291531576620 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (693, CAST(N'2021-09-06T18:46:09.190' AS DateTime), CAST(N'2021-09-06T18:46:09.203' AS DateTime), 1, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00003825180979364170 AS Decimal(38, 20)), CAST(1.97637806013966808967 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (694, CAST(N'2021-09-06T18:46:09.600' AS DateTime), CAST(N'2021-09-06T18:46:09.613' AS DateTime), 1, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00009388376450812620 AS Decimal(38, 20)), CAST(4.85074597458712600733 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (697, CAST(N'2021-09-06T18:46:15.340' AS DateTime), CAST(N'2021-09-06T18:46:15.680' AS DateTime), 0, CAST(51655.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005036388302704500 AS Decimal(38, 20)), CAST(4.74450183079461561750 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (699, CAST(N'2021-09-06T18:46:18.397' AS DateTime), CAST(N'2021-09-06T18:46:18.400' AS DateTime), 0, CAST(51655.04000000000000000000 AS Decimal(38, 20)), CAST(0.00010693094772609500 AS Decimal(38, 20)), CAST(5.52352238202934626880 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (701, CAST(N'2021-09-06T18:46:21.427' AS DateTime), CAST(N'2021-09-06T18:46:21.427' AS DateTime), 1, CAST(51657.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001632729536682710 AS Decimal(38, 20)), CAST(0.84341942331009484124 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (703, CAST(N'2021-09-06T18:46:24.443' AS DateTime), CAST(N'2021-09-06T18:50:39.293' AS DateTime), 0, CAST(51653.27000000000000000000 AS Decimal(38, 20)), CAST(0.00012995095463933160 AS Decimal(38, 20)), CAST(7.97717308624679012624 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (704, CAST(N'2021-09-06T18:46:24.760' AS DateTime), CAST(N'2021-09-06T18:46:24.760' AS DateTime), 0, CAST(51653.27000000000000000000 AS Decimal(38, 20)), CAST(0.00003544427810024670 AS Decimal(38, 20)), CAST(1.83081286666712986171 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (705, CAST(N'2021-09-06T18:46:27.470' AS DateTime), CAST(N'2021-09-06T18:46:27.473' AS DateTime), 0, CAST(51652.55000000000000000000 AS Decimal(38, 20)), CAST(0.00008140398146650010 AS Decimal(38, 20)), CAST(4.20472322289746974026 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (706, CAST(N'2021-09-06T18:46:27.783' AS DateTime), CAST(N'2021-09-06T18:46:27.783' AS DateTime), 1, CAST(51652.56000000000000000000 AS Decimal(38, 20)), CAST(0.00001005501347130860 AS Decimal(38, 20)), CAST(0.51936718662757574002 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (707, CAST(N'2021-09-06T18:46:30.510' AS DateTime), CAST(N'2021-09-06T18:46:30.523' AS DateTime), 1, CAST(51654.29000000000000000000 AS Decimal(38, 20)), CAST(0.00001724435520230060 AS Decimal(38, 20)), CAST(0.89074492448264385957 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (708, CAST(N'2021-09-06T18:46:30.810' AS DateTime), CAST(N'2021-09-06T18:50:45.530' AS DateTime), 0, CAST(51654.28000000000000000000 AS Decimal(38, 20)), CAST(0.00007669079596022520 AS Decimal(38, 20)), CAST(6.80750898765158365108 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (709, CAST(N'2021-09-06T18:46:33.577' AS DateTime), CAST(N'2021-09-06T18:46:33.590' AS DateTime), 1, CAST(51655.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002866777201586760 AS Decimal(38, 20)), CAST(1.48083376347964087800 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (710, CAST(N'2021-09-06T18:46:33.873' AS DateTime), CAST(N'2021-09-06T18:46:33.873' AS DateTime), 1, CAST(51655.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010365443439393000 AS Decimal(38, 20)), CAST(5.35426980861845415000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (711, CAST(N'2021-09-06T18:46:36.640' AS DateTime), CAST(N'2021-09-06T18:46:36.640' AS DateTime), 0, CAST(51657.71000000000000000000 AS Decimal(38, 20)), CAST(0.00001418293193643120 AS Decimal(38, 20)), CAST(0.73265778492190136455 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (714, CAST(N'2021-09-06T18:46:39.937' AS DateTime), CAST(N'2021-09-06T18:46:39.937' AS DateTime), 1, CAST(51660.99000000000000000000 AS Decimal(38, 20)), CAST(0.00004013898048556360 AS Decimal(38, 20)), CAST(2.07361946947489628396 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (716, CAST(N'2021-09-06T18:46:42.960' AS DateTime), CAST(N'2021-09-06T18:46:42.960' AS DateTime), 1, CAST(51657.75000000000000000000 AS Decimal(38, 20)), CAST(0.00002000821010210000 AS Decimal(38, 20)), CAST(1.03357911540175627500 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (720, CAST(N'2021-09-06T18:46:52.023' AS DateTime), CAST(N'2021-09-06T18:47:04.070' AS DateTime), 0, CAST(51663.97000000000000000000 AS Decimal(38, 20)), CAST(0.00010405323994534710 AS Decimal(38, 20)), CAST(6.32679501710359028372 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (721, CAST(N'2021-09-06T18:47:03.810' AS DateTime), CAST(N'2021-09-06T18:47:03.810' AS DateTime), 1, CAST(51662.56000000000000000000 AS Decimal(38, 20)), CAST(0.00001515383572091990 AS Decimal(38, 20)), CAST(0.78288594716216758894 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (723, CAST(N'2021-09-06T18:47:06.833' AS DateTime), CAST(N'2021-09-06T18:47:06.830' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00000292801438035817 AS Decimal(38, 20)), CAST(0.15129814515063937872 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (732, CAST(N'2021-09-06T18:47:21.987' AS DateTime), CAST(N'2021-09-06T18:47:25.047' AS DateTime), 0, CAST(51679.98000000000000000000 AS Decimal(38, 20)), CAST(0.00005446245654228300 AS Decimal(38, 20)), CAST(7.77134153416556163096 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (733, CAST(N'2021-09-06T18:47:22.290' AS DateTime), CAST(N'2021-09-06T18:47:22.290' AS DateTime), 1, CAST(51676.32000000000000000000 AS Decimal(38, 20)), CAST(0.00000185808837500312 AS Decimal(38, 20)), CAST(0.09601916945494123012 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (735, CAST(N'2021-09-06T18:47:25.317' AS DateTime), CAST(N'2021-09-06T18:48:10.483' AS DateTime), 0, CAST(51677.78000000000000000000 AS Decimal(38, 20)), CAST(0.00013079500996079090 AS Decimal(38, 20)), CAST(9.13047053226974430996 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (737, CAST(N'2021-09-06T18:47:28.440' AS DateTime), CAST(N'2021-09-06T18:47:28.440' AS DateTime), 0, CAST(51681.11000000000000000000 AS Decimal(38, 20)), CAST(0.00002302703662916410 AS Decimal(38, 20)), CAST(1.19006281300585906015 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (738, CAST(N'2021-09-06T18:47:31.097' AS DateTime), CAST(N'2021-09-06T18:48:19.583' AS DateTime), 0, CAST(51681.22000000000000000000 AS Decimal(38, 20)), CAST(0.00000103243151727730 AS Decimal(38, 20)), CAST(5.96279648405646271710 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (739, CAST(N'2021-09-06T18:47:31.460' AS DateTime), CAST(N'2021-09-06T18:48:22.627' AS DateTime), 0, CAST(51681.22000000000000000000 AS Decimal(38, 20)), CAST(0.00004550381537783190 AS Decimal(38, 20)), CAST(5.37734773852730514636 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (742, CAST(N'2021-09-06T18:47:40.190' AS DateTime), CAST(N'2021-09-06T18:48:25.690' AS DateTime), 0, CAST(51683.43000000000000000000 AS Decimal(38, 20)), CAST(0.00000947076725283170 AS Decimal(38, 20)), CAST(9.62718213292433342586 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (743, CAST(N'2021-09-06T18:47:40.570' AS DateTime), CAST(N'2021-09-06T18:47:40.570' AS DateTime), 0, CAST(51683.43000000000000000000 AS Decimal(38, 20)), CAST(0.00001968222065813940 AS Decimal(38, 20)), CAST(1.01724467362950161014 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (745, CAST(N'2021-09-06T18:47:43.600' AS DateTime), CAST(N'2021-09-06T18:48:28.740' AS DateTime), 0, CAST(51683.74000000000000000000 AS Decimal(38, 20)), CAST(0.00003605671852643440 AS Decimal(38, 20)), CAST(7.00710611473587324452 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (746, CAST(N'2021-09-06T18:47:46.257' AS DateTime), CAST(N'2021-09-06T18:48:31.773' AS DateTime), 0, CAST(51683.77000000000000000000 AS Decimal(38, 20)), CAST(0.00002741202778527968 AS Decimal(38, 20)), CAST(8.50644710315515184706 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (747, CAST(N'2021-09-06T18:47:46.633' AS DateTime), CAST(N'2021-09-06T18:47:46.633' AS DateTime), 0, CAST(51685.84000000000000000000 AS Decimal(38, 20)), CAST(0.00001519078678227530 AS Decimal(38, 20)), CAST(0.78514857510279599175 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (748, CAST(N'2021-09-06T18:47:49.293' AS DateTime), CAST(N'2021-09-06T18:48:40.870' AS DateTime), 0, CAST(51685.49000000000000000000 AS Decimal(38, 20)), CAST(0.00006947739574568140 AS Decimal(38, 20)), CAST(10.23955865807437238822 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (749, CAST(N'2021-09-06T18:47:49.653' AS DateTime), CAST(N'2021-09-06T18:47:49.653' AS DateTime), 1, CAST(51685.49000000000000000000 AS Decimal(38, 20)), CAST(0.00009854265241815830 AS Decimal(38, 20)), CAST(5.09322527613219663307 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (750, CAST(N'2021-09-06T18:47:52.330' AS DateTime), CAST(N'2021-09-06T18:47:52.330' AS DateTime), 0, CAST(51685.51000000000000000000 AS Decimal(38, 20)), CAST(0.00000866252240196919 AS Decimal(38, 20)), CAST(0.44772688823220258944 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (751, CAST(N'2021-09-06T18:47:52.687' AS DateTime), CAST(N'2021-09-06T18:48:43.920' AS DateTime), 0, CAST(51685.50000000000000000000 AS Decimal(38, 20)), CAST(0.00003282521126457729 AS Decimal(38, 20)), CAST(4.47603779312397177330 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (752, CAST(N'2021-09-06T18:47:55.350' AS DateTime), CAST(N'2021-09-06T18:48:46.983' AS DateTime), 0, CAST(51685.50000000000000000000 AS Decimal(38, 20)), CAST(0.00000450404603243994 AS Decimal(38, 20)), CAST(0.37762893661960426418 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (754, CAST(N'2021-09-06T18:47:58.383' AS DateTime), CAST(N'2021-09-06T18:49:57.063' AS DateTime), 0, CAST(51685.85000000000000000000 AS Decimal(38, 20)), CAST(0.00000744723072622300 AS Decimal(38, 20)), CAST(9.53451247193123673530 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (755, CAST(N'2021-09-06T18:47:58.743' AS DateTime), CAST(N'2021-09-06T18:48:10.870' AS DateTime), 0, CAST(51678.46000000000000000000 AS Decimal(38, 20)), CAST(0.00000791600151356054 AS Decimal(38, 20)), CAST(8.55855170606339934418 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (756, CAST(N'2021-09-06T18:48:01.413' AS DateTime), CAST(N'2021-09-06T18:48:01.410' AS DateTime), 1, CAST(51675.79000000000000000000 AS Decimal(38, 20)), CAST(0.00003314668640175210 AS Decimal(38, 20)), CAST(1.71288120569279715166 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (757, CAST(N'2021-09-06T18:48:01.760' AS DateTime), CAST(N'2021-09-06T18:49:08.280' AS DateTime), 0, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00003611051972774346 AS Decimal(38, 20)), CAST(3.70229956243045194436 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (758, CAST(N'2021-09-06T18:48:04.437' AS DateTime), CAST(N'2021-09-06T18:48:04.437' AS DateTime), 1, CAST(51678.45000000000000000000 AS Decimal(38, 20)), CAST(0.00005691027606693580 AS Decimal(38, 20)), CAST(2.94103485621133839351 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (759, CAST(N'2021-09-06T18:48:04.783' AS DateTime), CAST(N'2021-09-06T18:48:13.513' AS DateTime), 0, CAST(51678.46000000000000000000 AS Decimal(38, 20)), CAST(0.00003428850603955250 AS Decimal(38, 20)), CAST(1.94957241144468212725 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (760, CAST(N'2021-09-06T18:48:07.463' AS DateTime), CAST(N'2021-09-06T18:48:07.460' AS DateTime), 1, CAST(51678.46000000000000000000 AS Decimal(38, 20)), CAST(0.00008623155843756700 AS Decimal(38, 20)), CAST(4.45631414345346870682 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (761, CAST(N'2021-09-06T18:48:07.843' AS DateTime), CAST(N'2021-09-06T18:48:07.843' AS DateTime), 0, CAST(51678.45000000000000000000 AS Decimal(38, 20)), CAST(0.00012240984920524500 AS Decimal(38, 20)), CAST(6.32595127166079347025 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (766, CAST(N'2021-09-06T18:48:16.913' AS DateTime), CAST(N'2021-09-06T18:48:16.910' AS DateTime), 1, CAST(51672.89000000000000000000 AS Decimal(38, 20)), CAST(0.00006380861804997950 AS Decimal(38, 20)), CAST(3.29717570154860520576 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (768, CAST(N'2021-09-06T18:48:19.933' AS DateTime), CAST(N'2021-09-06T18:48:19.933' AS DateTime), 0, CAST(51675.78000000000000000000 AS Decimal(38, 20)), CAST(0.00001261458360246130 AS Decimal(38, 20)), CAST(0.65186844703239759731 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (770, CAST(N'2021-09-06T18:48:22.963' AS DateTime), CAST(N'2021-09-06T18:48:22.967' AS DateTime), 1, CAST(51675.80000000000000000000 AS Decimal(38, 20)), CAST(0.00012235468762105100 AS Decimal(38, 20)), CAST(6.32277636656790726580 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (772, CAST(N'2021-09-06T18:48:26.013' AS DateTime), CAST(N'2021-09-06T18:48:26.027' AS DateTime), 0, CAST(51678.31000000000000000000 AS Decimal(38, 20)), CAST(0.00002586694565874850 AS Decimal(38, 20)), CAST(1.33676003650595919504 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (774, CAST(N'2021-09-06T18:48:29.120' AS DateTime), CAST(N'2021-09-06T18:48:29.120' AS DateTime), 0, CAST(51678.44000000000000000000 AS Decimal(38, 20)), CAST(0.00003105862840593730 AS Decimal(38, 20)), CAST(1.60506146455852640181 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (776, CAST(N'2021-09-06T18:48:32.147' AS DateTime), CAST(N'2021-09-06T18:48:34.810' AS DateTime), 0, CAST(51683.39000000000000000000 AS Decimal(38, 20)), CAST(0.00001266799197190810 AS Decimal(38, 20)), CAST(1.49270491952073027166 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (778, CAST(N'2021-09-06T18:48:35.190' AS DateTime), CAST(N'2021-09-06T18:48:35.190' AS DateTime), 0, CAST(51678.73000000000000000000 AS Decimal(38, 20)), CAST(0.00004890566992056820 AS Decimal(38, 20)), CAST(2.52738291129416545439 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (780, CAST(N'2021-09-06T18:48:38.220' AS DateTime), CAST(N'2021-09-06T18:48:38.220' AS DateTime), 0, CAST(51675.99000000000000000000 AS Decimal(38, 20)), CAST(0.00003313280131348070 AS Decimal(38, 20)), CAST(1.71217030934741551839 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (782, CAST(N'2021-09-06T18:48:41.240' AS DateTime), CAST(N'2021-09-06T18:48:59.430' AS DateTime), 0, CAST(51682.04000000000000000000 AS Decimal(38, 20)), CAST(0.00008219237825004030 AS Decimal(38, 20)), CAST(4.62721371659199976222 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (784, CAST(N'2021-09-06T18:48:44.297' AS DateTime), CAST(N'2021-09-06T18:48:44.310' AS DateTime), 0, CAST(51684.46000000000000000000 AS Decimal(38, 20)), CAST(0.00004241839183607060 AS Decimal(38, 20)), CAST(2.19237167611571748288 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (786, CAST(N'2021-09-06T18:48:47.343' AS DateTime), CAST(N'2021-09-06T18:48:47.343' AS DateTime), 0, CAST(51682.06000000000000000000 AS Decimal(38, 20)), CAST(0.00002947981927053990 AS Decimal(38, 20)), CAST(1.52357778832919934419 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (787, CAST(N'2021-09-06T18:48:50.027' AS DateTime), CAST(N'2021-09-06T18:49:02.147' AS DateTime), 0, CAST(51682.05000000000000000000 AS Decimal(38, 20)), CAST(0.00006677331834415550 AS Decimal(38, 20)), CAST(5.92522041163115073465 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (788, CAST(N'2021-09-06T18:48:50.373' AS DateTime), CAST(N'2021-09-06T18:48:50.373' AS DateTime), 0, CAST(51682.05000000000000000000 AS Decimal(38, 20)), CAST(0.00001738762940158490 AS Decimal(38, 20)), CAST(0.89862833211418088105 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (791, CAST(N'2021-09-06T18:48:59.100' AS DateTime), CAST(N'2021-09-06T18:48:59.100' AS DateTime), 1, CAST(51675.81000000000000000000 AS Decimal(38, 20)), CAST(0.00000133726941483899 AS Decimal(38, 20)), CAST(0.06910448020003082783 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (794, CAST(N'2021-09-06T18:49:02.450' AS DateTime), CAST(N'2021-09-06T18:49:54.040' AS DateTime), 0, CAST(51678.44000000000000000000 AS Decimal(38, 20)), CAST(0.00000449215639591830 AS Decimal(38, 20)), CAST(0.92074606518054850602 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (800, CAST(N'2021-09-06T18:49:11.553' AS DateTime), CAST(N'2021-09-06T18:50:21.270' AS DateTime), 0, CAST(51667.56000000000000000000 AS Decimal(38, 20)), CAST(0.00005879463984574860 AS Decimal(38, 20)), CAST(3.70807688361757967813 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (802, CAST(N'2021-09-06T18:49:14.580' AS DateTime), CAST(N'2021-09-06T18:49:14.580' AS DateTime), 0, CAST(51672.59000000000000000000 AS Decimal(38, 20)), CAST(0.00000257620317981402 AS Decimal(38, 20)), CAST(0.13311909066722613171 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (804, CAST(N'2021-09-06T18:49:17.603' AS DateTime), CAST(N'2021-09-06T18:50:24.113' AS DateTime), 0, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00007136052570834702 AS Decimal(38, 20)), CAST(9.10320400431206171999 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (805, CAST(N'2021-09-06T18:49:20.623' AS DateTime), CAST(N'2021-09-06T18:49:20.623' AS DateTime), 0, CAST(51667.58000000000000000000 AS Decimal(38, 20)), CAST(0.00001168134892903330 AS Decimal(38, 20)), CAST(0.60354703029874235041 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (806, CAST(N'2021-09-06T18:49:23.400' AS DateTime), CAST(N'2021-09-06T18:49:23.400' AS DateTime), 0, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00006073447627049610 AS Decimal(38, 20)), CAST(3.13800280411919618148 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (808, CAST(N'2021-09-06T18:49:26.660' AS DateTime), CAST(N'2021-09-06T18:49:26.660' AS DateTime), 0, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00000466813547754108 AS Decimal(38, 20)), CAST(0.24119121655533717878 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (809, CAST(N'2021-09-06T18:49:29.450' AS DateTime), CAST(N'2021-09-06T18:49:29.460' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00003883111543898990 AS Decimal(38, 20)), CAST(2.00650508394390389664 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (810, CAST(N'2021-09-06T18:49:29.693' AS DateTime), CAST(N'2021-09-06T18:49:47.697' AS DateTime), 0, CAST(51672.60000000000000000000 AS Decimal(38, 20)), CAST(0.00006000294343568568 AS Decimal(38, 20)), CAST(7.06518793635114935160 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (811, CAST(N'2021-09-06T18:49:32.503' AS DateTime), CAST(N'2021-09-06T18:49:32.517' AS DateTime), 1, CAST(51671.76000000000000000000 AS Decimal(38, 20)), CAST(0.00006964829809481660 AS Decimal(38, 20)), CAST(3.59885014356382059922 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (812, CAST(N'2021-09-06T18:49:32.750' AS DateTime), CAST(N'2021-09-06T18:49:32.750' AS DateTime), 0, CAST(51671.76000000000000000000 AS Decimal(38, 20)), CAST(0.00002274348513350980 AS Decimal(38, 20)), CAST(1.17519590538228634325 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (813, CAST(N'2021-09-06T18:49:35.553' AS DateTime), CAST(N'2021-09-06T18:49:41.823' AS DateTime), 0, CAST(51671.75000000000000000000 AS Decimal(38, 20)), CAST(0.00003036589819489326 AS Decimal(38, 20)), CAST(4.90676058499615892085 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (814, CAST(N'2021-09-06T18:49:35.777' AS DateTime), CAST(N'2021-09-06T18:49:35.777' AS DateTime), 1, CAST(51667.91000000000000000000 AS Decimal(38, 20)), CAST(0.00000459224721630674 AS Decimal(38, 20)), CAST(0.23727181586988717471 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (815, CAST(N'2021-09-06T18:49:38.583' AS DateTime), CAST(N'2021-09-06T18:49:38.583' AS DateTime), 0, CAST(51669.83000000000000000000 AS Decimal(38, 20)), CAST(0.00010624992219090900 AS Decimal(38, 20)), CAST(5.48991541711749557547 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (816, CAST(N'2021-09-06T18:49:38.800' AS DateTime), CAST(N'2021-09-06T18:49:38.800' AS DateTime), 0, CAST(51669.83000000000000000000 AS Decimal(38, 20)), CAST(0.00003287751424725980 AS Decimal(38, 20)), CAST(1.69877557197849183183 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (817, CAST(N'2021-09-06T18:49:41.610' AS DateTime), CAST(N'2021-09-06T18:49:41.610' AS DateTime), 0, CAST(51670.57000000000000000000 AS Decimal(38, 20)), CAST(0.00003781491957503130 AS Decimal(38, 20)), CAST(1.95391844894602503884 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (819, CAST(N'2021-09-06T18:49:44.637' AS DateTime), CAST(N'2021-09-06T18:50:30.160' AS DateTime), 0, CAST(51672.59000000000000000000 AS Decimal(38, 20)), CAST(0.00006562686668039540 AS Decimal(38, 20)), CAST(9.25693502596880409782 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (820, CAST(N'2021-09-06T18:49:44.877' AS DateTime), CAST(N'2021-09-06T18:49:44.873' AS DateTime), 1, CAST(51672.59000000000000000000 AS Decimal(38, 20)), CAST(0.00003738851195079670 AS Decimal(38, 20)), CAST(1.93196124874361805245 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (822, CAST(N'2021-09-06T18:49:47.907' AS DateTime), CAST(N'2021-09-06T18:49:47.927' AS DateTime), 1, CAST(51672.60000000000000000000 AS Decimal(38, 20)), CAST(0.00004901816083538260 AS Decimal(38, 20)), CAST(2.53289581758239093676 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (825, CAST(N'2021-09-06T18:49:53.807' AS DateTime), CAST(N'2021-09-06T18:49:53.817' AS DateTime), 0, CAST(51672.60000000000000000000 AS Decimal(38, 20)), CAST(0.00012101741820621200 AS Decimal(38, 20)), CAST(6.25328464400231019120 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (827, CAST(N'2021-09-06T18:49:56.860' AS DateTime), CAST(N'2021-09-06T18:49:56.860' AS DateTime), 1, CAST(51680.00000000000000000000 AS Decimal(38, 20)), CAST(0.00014821552892598100 AS Decimal(38, 20)), CAST(7.65977853489469808000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (832, CAST(N'2021-09-06T18:50:03.130' AS DateTime), CAST(N'2021-09-06T18:50:03.130' AS DateTime), 0, CAST(51672.91000000000000000000 AS Decimal(38, 20)), CAST(0.00000442231577095684 AS Decimal(38, 20)), CAST(0.22851392482423340720 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (834, CAST(N'2021-09-06T18:50:06.153' AS DateTime), CAST(N'2021-09-06T18:50:06.153' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00009018207010355880 AS Decimal(38, 20)), CAST(4.65994293745385348447 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (835, CAST(N'2021-09-06T18:50:08.993' AS DateTime), CAST(N'2021-09-06T18:50:08.990' AS DateTime), 0, CAST(51676.78000000000000000000 AS Decimal(38, 20)), CAST(0.00013495216329347000 AS Decimal(38, 20)), CAST(6.97389325304072462660 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (839, CAST(N'2021-09-06T18:50:15.237' AS DateTime), CAST(N'2021-09-06T18:50:15.237' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00003073704290703730 AS Decimal(38, 20)), CAST(1.58826353805903372873 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (840, CAST(N'2021-09-06T18:50:18.047' AS DateTime), CAST(N'2021-09-06T18:50:18.043' AS DateTime), 0, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00002072572569396610 AS Decimal(38, 20)), CAST(1.07095254800854657818 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (841, CAST(N'2021-09-06T18:50:21.070' AS DateTime), CAST(N'2021-09-06T18:50:21.070' AS DateTime), 0, CAST(51665.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000266866935541326 AS Decimal(38, 20)), CAST(0.13787680224742607790 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (845, CAST(N'2021-09-06T18:50:27.137' AS DateTime), CAST(N'2021-09-06T18:50:27.137' AS DateTime), 1, CAST(51666.85000000000000000000 AS Decimal(38, 20)), CAST(0.00007388579653291300 AS Decimal(38, 20)), CAST(3.81744636659653603405 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (848, CAST(N'2021-09-06T18:50:30.367' AS DateTime), CAST(N'2021-09-06T18:50:36.423' AS DateTime), 0, CAST(51669.56000000000000000000 AS Decimal(38, 20)), CAST(0.00004691624783301550 AS Decimal(38, 20)), CAST(3.77493514288093195934 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (852, CAST(N'2021-09-06T18:50:39.483' AS DateTime), CAST(N'2021-09-06T18:50:42.337' AS DateTime), 0, CAST(51651.72000000000000000000 AS Decimal(38, 20)), CAST(0.00006727267339232970 AS Decimal(38, 20)), CAST(3.47474928971206381208 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (854, CAST(N'2021-09-06T18:50:42.503' AS DateTime), CAST(N'2021-09-06T18:50:48.557' AS DateTime), 0, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004976550128765660 AS Decimal(38, 20)), CAST(2.57038814150746339000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (857, CAST(N'2021-09-06T18:50:48.553' AS DateTime), CAST(N'2021-09-06T18:50:51.573' AS DateTime), 1, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005139276769542730 AS Decimal(38, 20)), CAST(5.98565621044750120000 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (858, CAST(N'2021-09-06T18:50:51.387' AS DateTime), CAST(N'2021-09-06T18:50:51.390' AS DateTime), 0, CAST(51650.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001473052502364410 AS Decimal(38, 20)), CAST(0.76083176477646800144 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (859, CAST(N'2021-09-06T18:50:51.573' AS DateTime), CAST(N'2021-09-06T18:51:00.670' AS DateTime), 0, CAST(51650.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000377777889546830 AS Decimal(38, 20)), CAST(2.84955928312522364896 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (865, CAST(N'2021-09-06T18:51:06.587' AS DateTime), CAST(N'2021-09-06T18:51:06.590' AS DateTime), 1, CAST(51641.28000000000000000000 AS Decimal(38, 20)), CAST(0.00001341135781882860 AS Decimal(38, 20)), CAST(0.69257968430231700461 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (866, CAST(N'2021-09-06T18:51:06.713' AS DateTime), CAST(N'2021-09-06T18:51:06.713' AS DateTime), 1, CAST(51641.28000000000000000000 AS Decimal(38, 20)), CAST(0.00006522598232385980 AS Decimal(38, 20)), CAST(3.36835321646149461254 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (867, CAST(N'2021-09-06T18:51:15.647' AS DateTime), CAST(N'2021-09-06T18:51:15.647' AS DateTime), 1, CAST(51637.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006099182845139500 AS Decimal(38, 20)), CAST(3.14943565566296812895 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (869, CAST(N'2021-09-06T18:51:18.790' AS DateTime), CAST(N'2021-09-06T18:51:24.700' AS DateTime), 0, CAST(51637.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006964008392283700 AS Decimal(38, 20)), CAST(3.59600570992437339737 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (874, CAST(N'2021-09-06T18:51:39.773' AS DateTime), CAST(N'2021-09-06T18:51:49.040' AS DateTime), 0, CAST(51634.19000000000000000000 AS Decimal(38, 20)), CAST(0.00015842022046373200 AS Decimal(38, 20)), CAST(8.17989976326622619708 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (876, CAST(N'2021-09-06T18:51:42.803' AS DateTime), CAST(N'2021-09-06T18:51:42.977' AS DateTime), 1, CAST(51634.57000000000000000000 AS Decimal(38, 20)), CAST(0.00003561314709280290 AS Decimal(38, 20)), CAST(2.02312783147545404972 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (878, CAST(N'2021-09-06T18:51:45.870' AS DateTime), CAST(N'2021-09-06T18:51:48.933' AS DateTime), 0, CAST(51626.72000000000000000000 AS Decimal(38, 20)), CAST(0.00009749010582337630 AS Decimal(38, 20)), CAST(5.03309439611381769474 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (882, CAST(N'2021-09-06T18:51:51.950' AS DateTime), CAST(N'2021-09-06T18:52:01.060' AS DateTime), 1, CAST(51617.93000000000000000000 AS Decimal(38, 20)), CAST(0.00001200183826126260 AS Decimal(38, 20)), CAST(3.87941569905547566436 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (883, CAST(N'2021-09-06T18:51:52.060' AS DateTime), CAST(N'2021-09-06T18:51:52.063' AS DateTime), 1, CAST(51617.93000000000000000000 AS Decimal(38, 20)), CAST(0.00005111139288689540 AS Decimal(38, 20)), CAST(2.63826430023826467452 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (886, CAST(N'2021-09-06T18:51:58.020' AS DateTime), CAST(N'2021-09-06T18:51:58.020' AS DateTime), 1, CAST(51620.29000000000000000000 AS Decimal(38, 20)), CAST(0.00005604583986850730 AS Decimal(38, 20)), CAST(2.89310250730590869312 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (887, CAST(N'2021-09-06T18:51:58.127' AS DateTime), CAST(N'2021-09-06T18:51:58.123' AS DateTime), 1, CAST(51620.29000000000000000000 AS Decimal(38, 20)), CAST(0.00002449218939267670 AS Decimal(38, 20)), CAST(1.26429391918489513024 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (890, CAST(N'2021-09-06T18:52:04.103' AS DateTime), CAST(N'2021-09-06T18:52:25.367' AS DateTime), 0, CAST(51616.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008578968610884140 AS Decimal(38, 20)), CAST(4.42812043819395770240 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (894, CAST(N'2021-09-06T18:52:10.223' AS DateTime), CAST(N'2021-09-06T18:52:10.263' AS DateTime), 0, CAST(51612.33000000000000000000 AS Decimal(38, 20)), CAST(0.00004992010688871150 AS Decimal(38, 20)), CAST(2.57649303037545121280 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (895, CAST(N'2021-09-06T18:52:10.257' AS DateTime), CAST(N'2021-09-06T18:52:28.443' AS DateTime), 1, CAST(51612.33000000000000000000 AS Decimal(38, 20)), CAST(0.00005828667146073950 AS Decimal(38, 20)), CAST(5.58480395240872033083 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (898, CAST(N'2021-09-06T18:52:16.270' AS DateTime), CAST(N'2021-09-06T18:52:28.507' AS DateTime), 1, CAST(51612.35000000000000000000 AS Decimal(38, 20)), CAST(0.00002986808420618410 AS Decimal(38, 20)), CAST(4.48005045736364476667 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (899, CAST(N'2021-09-06T18:52:16.370' AS DateTime), CAST(N'2021-09-06T18:52:37.553' AS DateTime), 1, CAST(51612.35000000000000000000 AS Decimal(38, 20)), CAST(0.00012826541491237730 AS Decimal(38, 20)), CAST(9.07272574582076598035 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (900, CAST(N'2021-09-06T18:52:19.310' AS DateTime), CAST(N'2021-09-06T18:52:19.310' AS DateTime), 1, CAST(51612.61000000000000000000 AS Decimal(38, 20)), CAST(0.00000865981420905321 AS Decimal(38, 20)), CAST(0.44695561344432179698 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (901, CAST(N'2021-09-06T18:52:19.387' AS DateTime), CAST(N'2021-09-06T18:52:19.387' AS DateTime), 1, CAST(51612.61000000000000000000 AS Decimal(38, 20)), CAST(0.00011760195582993400 AS Decimal(38, 20)), CAST(6.06974388148760986774 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (902, CAST(N'2021-09-06T18:52:22.340' AS DateTime), CAST(N'2021-09-06T18:52:49.757' AS DateTime), 1, CAST(51614.49000000000000000000 AS Decimal(38, 20)), CAST(0.00004793504841995170 AS Decimal(38, 20)), CAST(3.42608710645226033989 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (903, CAST(N'2021-09-06T18:52:22.417' AS DateTime), CAST(N'2021-09-06T18:52:22.417' AS DateTime), 1, CAST(51614.49000000000000000000 AS Decimal(38, 20)), CAST(0.00000341908559362362 AS Decimal(38, 20)), CAST(0.17647435918123039825 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (905, CAST(N'2021-09-06T18:52:25.487' AS DateTime), CAST(N'2021-09-06T18:52:25.487' AS DateTime), 1, CAST(51615.98000000000000000000 AS Decimal(38, 20)), CAST(0.00005605597684907540 AS Decimal(38, 20)), CAST(2.89338417992233886489 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (908, CAST(N'2021-09-06T18:52:31.473' AS DateTime), CAST(N'2021-09-06T18:52:31.473' AS DateTime), 1, CAST(51614.51000000000000000000 AS Decimal(38, 20)), CAST(0.00002150990591454780 AS Decimal(38, 20)), CAST(1.11022325392548656858 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (909, CAST(N'2021-09-06T18:52:31.520' AS DateTime), CAST(N'2021-09-06T18:52:31.520' AS DateTime), 1, CAST(51614.51000000000000000000 AS Decimal(38, 20)), CAST(0.00001504565869227320 AS Decimal(38, 20)), CAST(0.77657430102892200413 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (910, CAST(N'2021-09-06T18:52:37.523' AS DateTime), CAST(N'2021-09-06T18:52:37.520' AS DateTime), 1, CAST(51614.50000000000000000000 AS Decimal(38, 20)), CAST(0.00008342526754523870 AS Decimal(38, 20)), CAST(4.30595347171372288115 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (912, CAST(N'2021-09-06T18:52:46.580' AS DateTime), CAST(N'2021-09-06T18:52:46.590' AS DateTime), 1, CAST(51614.47000000000000000000 AS Decimal(38, 20)), CAST(0.00001839868818335170 AS Decimal(38, 20)), CAST(0.94963853927896081910 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (915, CAST(N'2021-09-06T18:52:49.747' AS DateTime), CAST(N'2021-09-06T18:52:49.753' AS DateTime), 0, CAST(51614.50000000000000000000 AS Decimal(38, 20)), CAST(0.00002110906682028860 AS Decimal(38, 20)), CAST(1.08953392939578594470 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (917, CAST(N'2021-09-06T18:52:52.817' AS DateTime), CAST(N'2021-09-06T18:52:52.823' AS DateTime), 0, CAST(51615.97000000000000000000 AS Decimal(38, 20)), CAST(0.00001302145468677460 AS Decimal(38, 20)), CAST(0.67211501446891715036 AS Decimal(38, 20)), 1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] ON 
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (2, CAST(N'2021-09-06T18:25:58.400' AS DateTime), 1, CAST(51658.97000000000000000000 AS Decimal(38, 20)), CAST(0.00013189007701905900 AS Decimal(38, 20)), CAST(6.81330553202525830923 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (32, CAST(N'2021-09-06T18:26:48.120' AS DateTime), 1, CAST(51655.68000000000000000000 AS Decimal(38, 20)), CAST(0.00001288415548060280 AS Decimal(38, 20)), CAST(0.66553981257626444390 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (37, CAST(N'2021-09-06T18:26:56.153' AS DateTime), 1, CAST(51656.74000000000000000000 AS Decimal(38, 20)), CAST(0.00005333459146941760 AS Decimal(38, 20)), CAST(2.75509112454192291462 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38, CAST(N'2021-09-06T18:26:57.200' AS DateTime), 1, CAST(51656.74000000000000000000 AS Decimal(38, 20)), CAST(0.00012879558053277200 AS Decimal(38, 20)), CAST(6.65315981673046468328 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (39, CAST(N'2021-09-06T18:26:59.183' AS DateTime), 1, CAST(51660.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013448525030840400 AS Decimal(38, 20)), CAST(6.94750803093215064000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (42, CAST(N'2021-09-06T18:27:03.260' AS DateTime), 1, CAST(51657.22000000000000000000 AS Decimal(38, 20)), CAST(0.00009766516149866640 AS Decimal(38, 20)), CAST(5.04511073387213993141 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (43, CAST(N'2021-09-06T18:27:05.230' AS DateTime), 1, CAST(51655.06000000000000000000 AS Decimal(38, 20)), CAST(0.00000062049208237891 AS Decimal(38, 20)), CAST(0.45001240425626955834 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (233, CAST(N'2021-09-06T18:32:38.663' AS DateTime), 0, CAST(51566.46000000000000000000 AS Decimal(38, 20)), CAST(0.00005429301832536840 AS Decimal(38, 20)), CAST(2.79969875775437658386 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (234, CAST(N'2021-09-06T18:32:42.743' AS DateTime), 0, CAST(51566.47000000000000000000 AS Decimal(38, 20)), CAST(0.00011884427905028871 AS Decimal(38, 20)), CAST(7.69407161098077368809 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (238, CAST(N'2021-09-06T18:32:48.807' AS DateTime), 0, CAST(51566.64000000000000000000 AS Decimal(38, 20)), CAST(0.00007894221100906940 AS Decimal(38, 20)), CAST(4.07078457590871848482 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (247, CAST(N'2021-09-06T18:33:04.010' AS DateTime), 0, CAST(51568.82000000000000000000 AS Decimal(38, 20)), CAST(0.00001648590742446760 AS Decimal(38, 20)), CAST(0.85015879250903326023 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (248, CAST(N'2021-09-06T18:33:05.930' AS DateTime), 0, CAST(51559.33000000000000000000 AS Decimal(38, 20)), CAST(0.00004542245466514610 AS Decimal(38, 20)), CAST(3.76683809069373705291 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (254, CAST(N'2021-09-06T18:33:15.027' AS DateTime), 0, CAST(51565.59000000000000000000 AS Decimal(38, 20)), CAST(0.00001451259237458580 AS Decimal(38, 20)), CAST(0.74835038822501778262 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (260, CAST(N'2021-09-06T18:33:24.150' AS DateTime), 0, CAST(51566.21000000000000000000 AS Decimal(38, 20)), CAST(0.00010528670824379030 AS Decimal(38, 20)), CAST(8.64175461062147014898 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (261, CAST(N'2021-09-06T18:33:25.303' AS DateTime), 0, CAST(51566.21000000000000000000 AS Decimal(38, 20)), CAST(0.00007410563662373720 AS Decimal(38, 20)), CAST(3.82134682032332344001 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (262, CAST(N'2021-09-06T18:33:27.180' AS DateTime), 0, CAST(51562.90000000000000000000 AS Decimal(38, 20)), CAST(0.00005271993626501410 AS Decimal(38, 20)), CAST(2.71839280163929553689 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (268, CAST(N'2021-09-06T18:33:36.270' AS DateTime), 0, CAST(51566.45000000000000000000 AS Decimal(38, 20)), CAST(0.00005173929345409300 AS Decimal(38, 20)), CAST(8.29026485326086051420 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (269, CAST(N'2021-09-06T18:33:37.460' AS DateTime), 0, CAST(51566.44000000000000000000 AS Decimal(38, 20)), CAST(0.00000981503511304736 AS Decimal(38, 20)), CAST(0.50612641925484990660 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (270, CAST(N'2021-09-06T18:33:39.300' AS DateTime), 0, CAST(51565.15000000000000000000 AS Decimal(38, 20)), CAST(0.00000170329837207791 AS Decimal(38, 20)), CAST(7.46518919120734475625 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (272, CAST(N'2021-09-06T18:33:42.330' AS DateTime), 0, CAST(51568.12000000000000000000 AS Decimal(38, 20)), CAST(0.00008669739211290020 AS Decimal(38, 20)), CAST(4.47082152016509106162 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (274, CAST(N'2021-09-06T18:33:45.350' AS DateTime), 0, CAST(51566.44000000000000000000 AS Decimal(38, 20)), CAST(0.00016837474730255800 AS Decimal(38, 20)), CAST(8.68248630429251895352 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (278, CAST(N'2021-09-06T18:33:52.590' AS DateTime), 0, CAST(51569.98000000000000000000 AS Decimal(38, 20)), CAST(0.00008068968433918890 AS Decimal(38, 20)), CAST(10.09766556039372798898 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (280, CAST(N'2021-09-06T18:33:55.623' AS DateTime), 0, CAST(51564.99000000000000000000 AS Decimal(38, 20)), CAST(0.00002039079303871400 AS Decimal(38, 20)), CAST(7.77027809677231070178 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (282, CAST(N'2021-09-06T18:33:58.683' AS DateTime), 0, CAST(51566.44000000000000000000 AS Decimal(38, 20)), CAST(0.00003648321518510730 AS Decimal(38, 20)), CAST(1.88130952684992447901 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (285, CAST(N'2021-09-06T18:34:03.503' AS DateTime), 0, CAST(51565.15000000000000000000 AS Decimal(38, 20)), CAST(0.00002042449574006000 AS Decimal(38, 20)), CAST(1.05319218651055490900 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (286, CAST(N'2021-09-06T18:34:06.550' AS DateTime), 0, CAST(51569.99000000000000000000 AS Decimal(38, 20)), CAST(0.00015272166344929600 AS Decimal(38, 20)), CAST(7.87585465686356022704 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (288, CAST(N'2021-09-06T18:34:10.777' AS DateTime), 0, CAST(51569.99000000000000000000 AS Decimal(38, 20)), CAST(0.00003978042595078260 AS Decimal(38, 20)), CAST(2.05147616847759917417 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (295, CAST(N'2021-09-06T18:34:21.763' AS DateTime), 0, CAST(51592.25000000000000000000 AS Decimal(38, 20)), CAST(0.00006068238283539320 AS Decimal(38, 20)), CAST(7.36244164896090555850 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (304, CAST(N'2021-09-06T18:34:38.020' AS DateTime), 0, CAST(51567.75000000000000000000 AS Decimal(38, 20)), CAST(0.00003917006069755650 AS Decimal(38, 20)), CAST(2.01991189753641920288 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (307, CAST(N'2021-09-06T18:34:44.073' AS DateTime), 0, CAST(51565.75000000000000000000 AS Decimal(38, 20)), CAST(0.00002588531590340850 AS Decimal(38, 20)), CAST(3.93734374678758592960 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (308, CAST(N'2021-09-06T18:34:45.960' AS DateTime), 0, CAST(51571.99000000000000000000 AS Decimal(38, 20)), CAST(0.00016410862690029120 AS Decimal(38, 20)), CAST(8.72613581965825929858 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (314, CAST(N'2021-09-06T18:34:55.050' AS DateTime), 0, CAST(51566.97000000000000000000 AS Decimal(38, 20)), CAST(0.00000531932385886057 AS Decimal(38, 20)), CAST(0.27430141385014724737 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (327, CAST(N'2021-09-06T18:35:20.453' AS DateTime), 0, CAST(51555.01000000000000000000 AS Decimal(38, 20)), CAST(0.00015535492876328300 AS Decimal(38, 20)), CAST(8.44283045439367807013 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (328, CAST(N'2021-09-06T18:35:22.413' AS DateTime), 0, CAST(51555.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001348823067428980 AS Decimal(38, 20)), CAST(3.51239540104719462863 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (329, CAST(N'2021-09-06T18:35:25.450' AS DateTime), 0, CAST(51556.97000000000000000000 AS Decimal(38, 20)), CAST(0.00001482406920512380 AS Decimal(38, 20)), CAST(1.32348475809510133345 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (331, CAST(N'2021-09-06T18:35:28.477' AS DateTime), 0, CAST(51564.35000000000000000000 AS Decimal(38, 20)), CAST(0.00010807370781343100 AS Decimal(38, 20)), CAST(7.44504441258599041340 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (332, CAST(N'2021-09-06T18:35:29.557' AS DateTime), 0, CAST(51560.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013765761402326500 AS Decimal(38, 20)), CAST(7.09762657903954340000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (333, CAST(N'2021-09-06T18:35:31.503' AS DateTime), 0, CAST(51562.15000000000000000000 AS Decimal(38, 20)), CAST(0.00016754767446198900 AS Decimal(38, 20)), CAST(8.63911832276024611635 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (334, CAST(N'2021-09-06T18:35:32.580' AS DateTime), 0, CAST(51557.33000000000000000000 AS Decimal(38, 20)), CAST(0.00000597545402402778 AS Decimal(38, 20)), CAST(0.30807845501662818263 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (335, CAST(N'2021-09-06T18:35:34.570' AS DateTime), 0, CAST(51557.34000000000000000000 AS Decimal(38, 20)), CAST(0.00000838882811758147 AS Decimal(38, 20)), CAST(0.43250566345970782649 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (337, CAST(N'2021-09-06T18:35:37.610' AS DateTime), 0, CAST(51568.08000000000000000000 AS Decimal(38, 20)), CAST(0.00014529987226487200 AS Decimal(38, 20)), CAST(8.93365052423126497824 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (338, CAST(N'2021-09-06T18:35:38.650' AS DateTime), 0, CAST(51568.08000000000000000000 AS Decimal(38, 20)), CAST(0.00009384543732453350 AS Decimal(38, 20)), CAST(5.15919777307411770456 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (340, CAST(N'2021-09-06T18:35:41.687' AS DateTime), 0, CAST(51589.99000000000000000000 AS Decimal(38, 20)), CAST(0.00001340071950731820 AS Decimal(38, 20)), CAST(4.60188368535550558776 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (366, CAST(N'2021-09-06T18:36:26.280' AS DateTime), 0, CAST(51594.99000000000000000000 AS Decimal(38, 20)), CAST(0.00006007671461444220 AS Decimal(38, 20)), CAST(9.18371804708286961023 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (369, CAST(N'2021-09-06T18:36:30.150' AS DateTime), 0, CAST(51606.78000000000000000000 AS Decimal(38, 20)), CAST(0.00013798869910556180 AS Decimal(38, 20)), CAST(10.16294876901112227162 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (428, CAST(N'2021-09-06T18:38:04.290' AS DateTime), 0, CAST(51615.59000000000000000000 AS Decimal(38, 20)), CAST(0.00004709949178951760 AS Decimal(38, 20)), CAST(7.68394556671097838261 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (429, CAST(N'2021-09-06T18:38:06.467' AS DateTime), 0, CAST(51615.59000000000000000000 AS Decimal(38, 20)), CAST(0.00007117621985784560 AS Decimal(38, 20)), CAST(3.67380258193241677290 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (432, CAST(N'2021-09-06T18:38:10.357' AS DateTime), 0, CAST(51610.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003501464912435700 AS Decimal(38, 20)), CAST(10.19518564832510230626 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (436, CAST(N'2021-09-06T18:38:18.573' AS DateTime), 0, CAST(51610.90000000000000000000 AS Decimal(38, 20)), CAST(0.00017642840658148200 AS Decimal(38, 20)), CAST(9.10562884923620935380 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (478, CAST(N'2021-09-06T18:39:28.633' AS DateTime), 0, CAST(51620.05000000000000000000 AS Decimal(38, 20)), CAST(0.00012000393118709554 AS Decimal(38, 20)), CAST(6.35588684546388070290 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (481, CAST(N'2021-09-06T18:39:32.300' AS DateTime), 0, CAST(51620.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008617686428417310 AS Decimal(38, 20)), CAST(4.44845059611765826373 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (500, CAST(N'2021-09-06T18:40:02.150' AS DateTime), 0, CAST(51620.76000000000000000000 AS Decimal(38, 20)), CAST(0.00000651662228932450 AS Decimal(38, 20)), CAST(7.25164936744758404076 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (514, CAST(N'2021-09-06T18:40:23.920' AS DateTime), 0, CAST(51610.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004035451209189112 AS Decimal(38, 20)), CAST(2.56733860837171586700 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (518, CAST(N'2021-09-06T18:40:29.973' AS DateTime), 0, CAST(51607.88000000000000000000 AS Decimal(38, 20)), CAST(0.00003612713321863040 AS Decimal(38, 20)), CAST(9.77879375227811659036 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (522, CAST(N'2021-09-06T18:40:36.023' AS DateTime), 0, CAST(51607.53000000000000000000 AS Decimal(38, 20)), CAST(0.00007317234057615160 AS Decimal(38, 20)), CAST(3.77624376145396098155 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (527, CAST(N'2021-09-06T18:40:47.683' AS DateTime), 0, CAST(51610.44000000000000000000 AS Decimal(38, 20)), CAST(0.00004499460265272990 AS Decimal(38, 20)), CAST(9.51558850488680393316 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (528, CAST(N'2021-09-06T18:40:48.150' AS DateTime), 0, CAST(51610.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001260362072503360 AS Decimal(38, 20)), CAST(0.65047853724831036112 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (529, CAST(N'2021-09-06T18:40:51.183' AS DateTime), 0, CAST(51610.44000000000000000000 AS Decimal(38, 20)), CAST(0.00005658843249855020 AS Decimal(38, 20)), CAST(2.92055390016047518409 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (540, CAST(N'2021-09-06T18:41:08.987' AS DateTime), 0, CAST(51615.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007510152816544360 AS Decimal(38, 20)), CAST(3.87636537625937141400 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (541, CAST(N'2021-09-06T18:41:09.480' AS DateTime), 0, CAST(51615.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007595556596105710 AS Decimal(38, 20)), CAST(3.92044653707996221650 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (543, CAST(N'2021-09-06T18:41:15.527' AS DateTime), 0, CAST(51610.48000000000000000000 AS Decimal(38, 20)), CAST(0.00002613285548339270 AS Decimal(38, 20)), CAST(1.34872921526852927550 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (544, CAST(N'2021-09-06T18:41:18.077' AS DateTime), 0, CAST(51610.47000000000000000000 AS Decimal(38, 20)), CAST(0.00008501281583915130 AS Decimal(38, 20)), CAST(4.38755138148204299411 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (546, CAST(N'2021-09-06T18:41:21.603' AS DateTime), 0, CAST(51610.48000000000000000000 AS Decimal(38, 20)), CAST(0.00011662703748635300 AS Decimal(38, 20)), CAST(6.01917738564867177944 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (548, CAST(N'2021-09-06T18:41:27.157' AS DateTime), 0, CAST(51612.91000000000000000000 AS Decimal(38, 20)), CAST(0.00004581711210581400 AS Decimal(38, 20)), CAST(6.49438804175518312053 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (549, CAST(N'2021-09-06T18:41:27.643' AS DateTime), 0, CAST(51612.91000000000000000000 AS Decimal(38, 20)), CAST(0.00004495602689914200 AS Decimal(38, 20)), CAST(3.46796039144994808839 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (550, CAST(N'2021-09-06T18:41:30.190' AS DateTime), 0, CAST(51614.99000000000000000000 AS Decimal(38, 20)), CAST(0.00007074978168623068 AS Decimal(38, 20)), CAST(10.02103479468124679086 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (555, CAST(N'2021-09-06T18:41:39.253' AS DateTime), 0, CAST(51615.73000000000000000000 AS Decimal(38, 20)), CAST(0.00007104702064350610 AS Decimal(38, 20)), CAST(6.43430129526392128336 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (559, CAST(N'2021-09-06T18:41:45.297' AS DateTime), 0, CAST(51612.31000000000000000000 AS Decimal(38, 20)), CAST(0.00019129398446124700 AS Decimal(38, 20)), CAST(9.87312442714906315057 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (560, CAST(N'2021-09-06T18:41:45.883' AS DateTime), 0, CAST(51612.31000000000000000000 AS Decimal(38, 20)), CAST(0.00015967486731692900 AS Decimal(38, 20)), CAST(8.24118875117020779599 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (565, CAST(N'2021-09-06T18:41:57.427' AS DateTime), 0, CAST(51618.35000000000000000000 AS Decimal(38, 20)), CAST(0.00003448101563122120 AS Decimal(38, 20)), CAST(7.46520802380396582035 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (567, CAST(N'2021-09-06T18:42:01.057' AS DateTime), 0, CAST(51618.36000000000000000000 AS Decimal(38, 20)), CAST(0.00007339700808441070 AS Decimal(38, 20)), CAST(5.85919549175209707720 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (569, CAST(N'2021-09-06T18:42:04.093' AS DateTime), 0, CAST(51618.42000000000000000000 AS Decimal(38, 20)), CAST(0.00004883197818362630 AS Decimal(38, 20)), CAST(8.41823301363131045826 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (606, CAST(N'2021-09-06T18:43:10.860' AS DateTime), 0, CAST(51635.51000000000000000000 AS Decimal(38, 20)), CAST(0.00013242816866023026 AS Decimal(38, 20)), CAST(9.12189388752409126119 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (613, CAST(N'2021-09-06T18:43:23.023' AS DateTime), 0, CAST(51639.49000000000000000000 AS Decimal(38, 20)), CAST(0.00001642245837320850 AS Decimal(38, 20)), CAST(7.77545703454631144558 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (614, CAST(N'2021-09-06T18:43:25.550' AS DateTime), 0, CAST(51641.61000000000000000000 AS Decimal(38, 20)), CAST(0.00003137831940845560 AS Decimal(38, 20)), CAST(6.07984586731031762385 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (619, CAST(N'2021-09-06T18:43:32.110' AS DateTime), 0, CAST(51644.64000000000000000000 AS Decimal(38, 20)), CAST(0.00009945052969243875 AS Decimal(38, 20)), CAST(5.46888686429310313056 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (622, CAST(N'2021-09-06T18:43:38.160' AS DateTime), 0, CAST(51644.18000000000000000000 AS Decimal(38, 20)), CAST(0.00002815509449138898 AS Decimal(38, 20)), CAST(4.25709886319684218203 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (624, CAST(N'2021-09-06T18:43:41.180' AS DateTime), 0, CAST(51644.21000000000000000000 AS Decimal(38, 20)), CAST(0.00005445808714928870 AS Decimal(38, 20)), CAST(9.62056199588601020008 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (628, CAST(N'2021-09-06T18:43:49.800' AS DateTime), 1, CAST(51667.54000000000000000000 AS Decimal(38, 20)), CAST(0.00001683455790245650 AS Decimal(38, 20)), CAST(0.86980019380748731201 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (629, CAST(N'2021-09-06T18:43:50.270' AS DateTime), 1, CAST(51667.55000000000000000000 AS Decimal(38, 20)), CAST(0.00018137290653836600 AS Decimal(38, 20)), CAST(9.37109371721635222330 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (631, CAST(N'2021-09-06T18:43:53.297' AS DateTime), 1, CAST(51664.96000000000000000000 AS Decimal(38, 20)), CAST(0.00014417966415368900 AS Decimal(38, 20)), CAST(7.44903658131377603744 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (637, CAST(N'2021-09-06T18:44:04.973' AS DateTime), 1, CAST(51658.45000000000000000000 AS Decimal(38, 20)), CAST(0.00009580165571337640 AS Decimal(38, 20)), CAST(4.94896504158666909058 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (638, CAST(N'2021-09-06T18:44:05.437' AS DateTime), 1, CAST(51658.45000000000000000000 AS Decimal(38, 20)), CAST(0.00007139886667551420 AS Decimal(38, 20)), CAST(3.68835478421371652499 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (641, CAST(N'2021-09-06T18:44:11.010' AS DateTime), 1, CAST(51656.58000000000000000000 AS Decimal(38, 20)), CAST(0.00011990898713465300 AS Decimal(38, 20)), CAST(6.19408818664017346674 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (644, CAST(N'2021-09-06T18:44:14.517' AS DateTime), 1, CAST(51655.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002345693689931970 AS Decimal(38, 20)), CAST(1.21166807553435910350 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (646, CAST(N'2021-09-06T18:44:17.573' AS DateTime), 1, CAST(51657.71000000000000000000 AS Decimal(38, 20)), CAST(0.00002342965538773207 AS Decimal(38, 20)), CAST(2.47222936474112057416 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (649, CAST(N'2021-09-06T18:44:23.223' AS DateTime), 1, CAST(51667.54000000000000000000 AS Decimal(38, 20)), CAST(0.00006601381453965500 AS Decimal(38, 20)), CAST(3.41077140328020629870 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (650, CAST(N'2021-09-06T18:44:23.690' AS DateTime), 1, CAST(51667.55000000000000000000 AS Decimal(38, 20)), CAST(0.00019592053498882800 AS Decimal(38, 20)), CAST(10.12273403756202013140 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (651, CAST(N'2021-09-06T18:44:26.270' AS DateTime), 1, CAST(51669.99000000000000000000 AS Decimal(38, 20)), CAST(0.00013595198753101400 AS Decimal(38, 20)), CAST(7.02463783620761806986 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (653, CAST(N'2021-09-06T18:44:29.303' AS DateTime), 1, CAST(51670.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001154148076267050 AS Decimal(38, 20)), CAST(0.59634831100718473500 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (655, CAST(N'2021-09-06T18:44:32.797' AS DateTime), 1, CAST(51670.02000000000000000000 AS Decimal(38, 20)), CAST(0.00003229034553854280 AS Decimal(38, 20)), CAST(1.66844279978341724686 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (657, CAST(N'2021-09-06T18:44:35.823' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00010550257177348377 AS Decimal(38, 20)), CAST(9.14878798186077179816 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (658, CAST(N'2021-09-06T18:44:38.850' AS DateTime), 1, CAST(51670.26000000000000000000 AS Decimal(38, 20)), CAST(0.00017645752521998100 AS Decimal(38, 20)), CAST(9.11760620707297546506 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (660, CAST(N'2021-09-06T18:44:44.870' AS DateTime), 1, CAST(51670.25000000000000000000 AS Decimal(38, 20)), CAST(0.00013882553006467590 AS Decimal(38, 20)), CAST(7.38392188485139440025 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (661, CAST(N'2021-09-06T18:44:50.417' AS DateTime), 1, CAST(51670.01000000000000000000 AS Decimal(38, 20)), CAST(0.00019747218917937600 AS Decimal(38, 20)), CAST(10.20338998962024971376 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (662, CAST(N'2021-09-06T18:44:50.910' AS DateTime), 1, CAST(51670.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009206415428410480 AS Decimal(38, 20)), CAST(4.75695577250123785705 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (663, CAST(N'2021-09-06T18:44:56.457' AS DateTime), 1, CAST(51670.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006999589561950220 AS Decimal(38, 20)), CAST(3.61668792665967867400 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (664, CAST(N'2021-09-06T18:44:56.943' AS DateTime), 1, CAST(51670.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001979994076294820 AS Decimal(38, 20)), CAST(1.02306293922153349400 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (665, CAST(N'2021-09-06T18:45:02.523' AS DateTime), 1, CAST(51670.25000000000000000000 AS Decimal(38, 20)), CAST(0.00011652598917322500 AS Decimal(38, 20)), CAST(6.02092699207782905625 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (667, CAST(N'2021-09-06T18:45:05.563' AS DateTime), 1, CAST(51673.34000000000000000000 AS Decimal(38, 20)), CAST(0.00003153060163908200 AS Decimal(38, 20)), CAST(1.62929149890084147388 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (670, CAST(N'2021-09-06T18:45:09.080' AS DateTime), 1, CAST(51672.58000000000000000000 AS Decimal(38, 20)), CAST(0.00003056953643940830 AS Decimal(38, 20)), CAST(1.57960681722824053441 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (674, CAST(N'2021-09-06T18:45:18.130' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00006521911698636596 AS Decimal(38, 20)), CAST(4.12097653647923635558 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (675, CAST(N'2021-09-06T18:45:21.170' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00009522870997676070 AS Decimal(38, 20)), CAST(10.12299793582775835555 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (676, CAST(N'2021-09-06T18:45:23.817' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00003487714186072200 AS Decimal(38, 20)), CAST(6.64695326857018947732 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (677, CAST(N'2021-09-06T18:45:30.217' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00010650285561871800 AS Decimal(38, 20)), CAST(5.50328158730088010116 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (678, CAST(N'2021-09-06T18:45:32.920' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00010878903610109800 AS Decimal(38, 20)), CAST(5.62141452261831853676 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (680, CAST(N'2021-09-06T18:45:41.973' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00013528169371899301 AS Decimal(38, 20)), CAST(9.97323105847668039649 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (681, CAST(N'2021-09-06T18:45:42.377' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00014756359390335300 AS Decimal(38, 20)), CAST(7.62499751360227629486 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (686, CAST(N'2021-09-06T18:45:57.470' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00002912191619590002 AS Decimal(38, 20)), CAST(10.02787091768586446289 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (695, CAST(N'2021-09-06T18:46:12.243' AS DateTime), 1, CAST(51667.55000000000000000000 AS Decimal(38, 20)), CAST(0.00002096223683141247 AS Decimal(38, 20)), CAST(1.48134650519062059446 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (696, CAST(N'2021-09-06T18:46:12.647' AS DateTime), 1, CAST(51667.56000000000000000000 AS Decimal(38, 20)), CAST(0.00002597664577233410 AS Decimal(38, 20)), CAST(1.43867457199565465612 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (698, CAST(N'2021-09-06T18:46:15.677' AS DateTime), 1, CAST(51655.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010576465870522200 AS Decimal(38, 20)), CAST(8.06481982318025188500 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (700, CAST(N'2021-09-06T18:46:18.703' AS DateTime), 0, CAST(51655.05000000000000000000 AS Decimal(38, 20)), CAST(0.00002681818577778420 AS Decimal(38, 20)), CAST(9.33744688069855597515 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (702, CAST(N'2021-09-06T18:46:21.740' AS DateTime), 0, CAST(51657.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001343396241470920 AS Decimal(38, 20)), CAST(3.85243433301805947212 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (712, CAST(N'2021-09-06T18:46:36.900' AS DateTime), 0, CAST(51657.71000000000000000000 AS Decimal(38, 20)), CAST(0.00003126667739416755 AS Decimal(38, 20)), CAST(3.52635564481237978333 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (713, CAST(N'2021-09-06T18:46:39.667' AS DateTime), 0, CAST(51660.99000000000000000000 AS Decimal(38, 20)), CAST(0.00002343365094784455 AS Decimal(38, 20)), CAST(5.38066484792673320880 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (715, CAST(N'2021-09-06T18:46:42.687' AS DateTime), 0, CAST(51657.75000000000000000000 AS Decimal(38, 20)), CAST(0.00000673492327646100 AS Decimal(38, 20)), CAST(10.09088233306554445200 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (717, CAST(N'2021-09-06T18:46:48.743' AS DateTime), 0, CAST(51662.48000000000000000000 AS Decimal(38, 20)), CAST(0.00009420392582854410 AS Decimal(38, 20)), CAST(7.29698489185359781144 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (718, CAST(N'2021-09-06T18:46:48.993' AS DateTime), 0, CAST(51662.48000000000000000000 AS Decimal(38, 20)), CAST(0.00006241870814115707 AS Decimal(38, 20)), CAST(4.36772812139406991446 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (719, CAST(N'2021-09-06T18:46:51.760' AS DateTime), 1, CAST(51663.97000000000000000000 AS Decimal(38, 20)), CAST(0.00005237124769593080 AS Decimal(38, 20)), CAST(6.22043383872644776836 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (722, CAST(N'2021-09-06T18:47:04.067' AS DateTime), 1, CAST(51662.56000000000000000000 AS Decimal(38, 20)), CAST(0.00007912736901972790 AS Decimal(38, 20)), CAST(9.46357920149472509200 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (724, CAST(N'2021-09-06T18:47:07.110' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00006882825152428305 AS Decimal(38, 20)), CAST(5.03945739651461878936 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (725, CAST(N'2021-09-06T18:47:09.853' AS DateTime), 1, CAST(51681.11000000000000000000 AS Decimal(38, 20)), CAST(0.00019771922957045900 AS Decimal(38, 20)), CAST(10.21834925254614432949 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (726, CAST(N'2021-09-06T18:47:10.137' AS DateTime), 1, CAST(51681.11000000000000000000 AS Decimal(38, 20)), CAST(0.00019517242302893300 AS Decimal(38, 20)), CAST(10.08672746352481955563 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (727, CAST(N'2021-09-06T18:47:12.867' AS DateTime), 1, CAST(51681.10000000000000000000 AS Decimal(38, 20)), CAST(0.00008764516426606340 AS Decimal(38, 20)), CAST(4.52959849895084918174 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (728, CAST(N'2021-09-06T18:47:13.163' AS DateTime), 1, CAST(51681.10000000000000000000 AS Decimal(38, 20)), CAST(0.00003898604402271380 AS Decimal(38, 20)), CAST(2.01484163974227416918 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (729, CAST(N'2021-09-06T18:47:15.887' AS DateTime), 1, CAST(51677.79000000000000000000 AS Decimal(38, 20)), CAST(0.00005108091423803980 AS Decimal(38, 20)), CAST(2.63974875900143079604 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (730, CAST(N'2021-09-06T18:47:16.193' AS DateTime), 1, CAST(51677.80000000000000000000 AS Decimal(38, 20)), CAST(0.00016806162389370700 AS Decimal(38, 20)), CAST(8.68505498725421160460 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (731, CAST(N'2021-09-06T18:47:18.940' AS DateTime), 1, CAST(51677.80000000000000000000 AS Decimal(38, 20)), CAST(0.00003678610317259380 AS Decimal(38, 20)), CAST(1.90102488253266787764 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (734, CAST(N'2021-09-06T18:47:25.047' AS DateTime), 1, CAST(51677.78000000000000000000 AS Decimal(38, 20)), CAST(0.00003707630356637550 AS Decimal(38, 20)), CAST(4.73051990636803005813 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (736, CAST(N'2021-09-06T18:47:28.070' AS DateTime), 1, CAST(51681.10000000000000000000 AS Decimal(38, 20)), CAST(0.00007298642446891700 AS Decimal(38, 20)), CAST(3.77201870162054636870 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (740, CAST(N'2021-09-06T18:47:37.137' AS DateTime), 1, CAST(51683.40000000000000000000 AS Decimal(38, 20)), CAST(0.00008934314944285110 AS Decimal(38, 20)), CAST(4.61755772991465054174 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (741, CAST(N'2021-09-06T18:47:37.507' AS DateTime), 1, CAST(51683.40000000000000000000 AS Decimal(38, 20)), CAST(0.00017682114521824800 AS Decimal(38, 20)), CAST(9.13871797677279868320 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (744, CAST(N'2021-09-06T18:47:43.240' AS DateTime), 1, CAST(51685.84000000000000000000 AS Decimal(38, 20)), CAST(0.00015402234445979000 AS Decimal(38, 20)), CAST(7.96077425217359237360 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (753, CAST(N'2021-09-06T18:47:55.710' AS DateTime), 1, CAST(51685.98000000000000000000 AS Decimal(38, 20)), CAST(0.00003572676388347840 AS Decimal(38, 20)), CAST(1.84657280354618691283 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (762, CAST(N'2021-09-06T18:48:10.480' AS DateTime), 1, CAST(51675.80000000000000000000 AS Decimal(38, 20)), CAST(0.00004746330121879610 AS Decimal(38, 20)), CAST(9.21164083685410189460 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (763, CAST(N'2021-09-06T18:48:10.870' AS DateTime), 1, CAST(51675.80000000000000000000 AS Decimal(38, 20)), CAST(0.00007279291826896106 AS Decimal(38, 20)), CAST(4.17069799689762969728 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (764, CAST(N'2021-09-06T18:48:13.510' AS DateTime), 1, CAST(51675.79000000000000000000 AS Decimal(38, 20)), CAST(0.00002631764208260830 AS Decimal(38, 20)), CAST(3.13187058306967584703 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (765, CAST(N'2021-09-06T18:48:16.553' AS DateTime), 0, CAST(51672.88000000000000000000 AS Decimal(38, 20)), CAST(0.00001675620862131745 AS Decimal(38, 20)), CAST(3.45527925500037957141 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (767, CAST(N'2021-09-06T18:48:19.580' AS DateTime), 1, CAST(51675.79000000000000000000 AS Decimal(38, 20)), CAST(0.00006537335871969020 AS Decimal(38, 20)), CAST(3.43157167106958276683 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (769, CAST(N'2021-09-06T18:48:22.610' AS DateTime), 1, CAST(51675.80000000000000000000 AS Decimal(38, 20)), CAST(0.00001795438407824990 AS Decimal(38, 20)), CAST(3.27925322345259188044 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (771, CAST(N'2021-09-06T18:48:25.670' AS DateTime), 1, CAST(51675.82000000000000000000 AS Decimal(38, 20)), CAST(0.00018751040622010430 AS Decimal(38, 20)), CAST(10.17916366377621560752 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (773, CAST(N'2021-09-06T18:48:28.733' AS DateTime), 1, CAST(51678.44000000000000000000 AS Decimal(38, 20)), CAST(0.00014443841546049260 AS Decimal(38, 20)), CAST(9.32770695203536775388 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (775, CAST(N'2021-09-06T18:48:31.773' AS DateTime), 1, CAST(51682.10000000000000000000 AS Decimal(38, 20)), CAST(0.00011822731574914832 AS Decimal(38, 20)), CAST(7.52694711648066133880 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (777, CAST(N'2021-09-06T18:48:34.807' AS DateTime), 1, CAST(51678.72000000000000000000 AS Decimal(38, 20)), CAST(0.00015083039633502790 AS Decimal(38, 20)), CAST(8.44938742976541960192 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (779, CAST(N'2021-09-06T18:48:37.853' AS DateTime), 0, CAST(51675.99000000000000000000 AS Decimal(38, 20)), CAST(0.00009682128527053741 AS Decimal(38, 20)), CAST(8.36892964061663335422 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (781, CAST(N'2021-09-06T18:48:40.870' AS DateTime), 1, CAST(51682.05000000000000000000 AS Decimal(38, 20)), CAST(0.00011050424050097660 AS Decimal(38, 20)), CAST(9.30181992358159108890 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (783, CAST(N'2021-09-06T18:48:43.900' AS DateTime), 1, CAST(51684.47000000000000000000 AS Decimal(38, 20)), CAST(0.00010761818033997771 AS Decimal(38, 20)), CAST(7.25874226008387476085 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (785, CAST(N'2021-09-06T18:48:46.963' AS DateTime), 1, CAST(51682.06000000000000000000 AS Decimal(38, 20)), CAST(0.00007695615593202236 AS Decimal(38, 20)), CAST(4.21003104553945845634 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (789, CAST(N'2021-09-06T18:48:56.063' AS DateTime), 0, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00006997909800614080 AS Decimal(38, 20)), CAST(6.50698703196281121250 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (790, CAST(N'2021-09-06T18:48:56.413' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00010746544213381870 AS Decimal(38, 20)), CAST(7.41678272874273375260 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (792, CAST(N'2021-09-06T18:48:59.427' AS DateTime), 1, CAST(51677.57000000000000000000 AS Decimal(38, 20)), CAST(0.00008392438231218770 AS Decimal(38, 20)), CAST(8.58451052212777682596 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (793, CAST(N'2021-09-06T18:49:02.143' AS DateTime), 1, CAST(51678.43000000000000000000 AS Decimal(38, 20)), CAST(0.00001087809838861180 AS Decimal(38, 20)), CAST(4.01290330402514361934 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (795, CAST(N'2021-09-06T18:49:05.240' AS DateTime), 0, CAST(51676.80000000000000000000 AS Decimal(38, 20)), CAST(0.00012606732683538800 AS Decimal(38, 20)), CAST(8.62657876971871774080 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (796, CAST(N'2021-09-06T18:49:05.480' AS DateTime), 0, CAST(51676.81000000000000000000 AS Decimal(38, 20)), CAST(0.00016916655784899660 AS Decimal(38, 20)), CAST(10.26109384767741715141 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (797, CAST(N'2021-09-06T18:49:08.267' AS DateTime), 1, CAST(51672.62000000000000000000 AS Decimal(38, 20)), CAST(0.00006945268161103754 AS Decimal(38, 20)), CAST(5.45472718876232187622 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (798, CAST(N'2021-09-06T18:49:08.530' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00005864886113379610 AS Decimal(38, 20)), CAST(8.21987585648335383519 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (799, CAST(N'2021-09-06T18:49:11.307' AS DateTime), 1, CAST(51667.57000000000000000000 AS Decimal(38, 20)), CAST(0.00004493846895403054 AS Decimal(38, 20)), CAST(4.50303607977871256948 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (801, CAST(N'2021-09-06T18:49:14.323' AS DateTime), 1, CAST(51669.95000000000000000000 AS Decimal(38, 20)), CAST(0.00003912910010625060 AS Decimal(38, 20)), CAST(5.07298865746206736945 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (803, CAST(N'2021-09-06T18:49:17.367' AS DateTime), 1, CAST(51667.58000000000000000000 AS Decimal(38, 20)), CAST(0.00010584722734328613 AS Decimal(38, 20)), CAST(6.95727886024839148968 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (807, CAST(N'2021-09-06T18:49:26.420' AS DateTime), 1, CAST(51667.58000000000000000000 AS Decimal(38, 20)), CAST(0.00000068242177398990 AS Decimal(38, 20)), CAST(1.38526723313180198239 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (818, CAST(N'2021-09-06T18:49:41.820' AS DateTime), 1, CAST(51670.58000000000000000000 AS Decimal(38, 20)), CAST(0.00000792462975155774 AS Decimal(38, 20)), CAST(1.97849378749933211158 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (821, CAST(N'2021-09-06T18:49:47.677' AS DateTime), 1, CAST(51672.60000000000000000000 AS Decimal(38, 20)), CAST(0.00008915812461132032 AS Decimal(38, 20)), CAST(7.70754020476572223560 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (823, CAST(N'2021-09-06T18:49:50.737' AS DateTime), 0, CAST(51672.59000000000000000000 AS Decimal(38, 20)), CAST(0.00008552945865575660 AS Decimal(38, 20)), CAST(4.47936295236311191274 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (824, CAST(N'2021-09-06T18:49:50.973' AS DateTime), 0, CAST(51672.59000000000000000000 AS Decimal(38, 20)), CAST(0.00004283566393090250 AS Decimal(38, 20)), CAST(6.19678909991245327168 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (826, CAST(N'2021-09-06T18:49:54.030' AS DateTime), 1, CAST(51678.24000000000000000000 AS Decimal(38, 20)), CAST(0.00002637225651478920 AS Decimal(38, 20)), CAST(1.59501853785864075480 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (828, CAST(N'2021-09-06T18:49:57.063' AS DateTime), 1, CAST(51680.00000000000000000000 AS Decimal(38, 20)), CAST(0.00015523107161523400 AS Decimal(38, 20)), CAST(8.40721466500649776000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (829, CAST(N'2021-09-06T18:49:59.880' AS DateTime), 1, CAST(51682.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006412532816833130 AS Decimal(38, 20)), CAST(3.31412585164897992991 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (830, CAST(N'2021-09-06T18:50:00.100' AS DateTime), 0, CAST(51682.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010613022051105700 AS Decimal(38, 20)), CAST(7.60120816376023009400 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (831, CAST(N'2021-09-06T18:50:02.933' AS DateTime), 0, CAST(51672.91000000000000000000 AS Decimal(38, 20)), CAST(0.00010285392752981440 AS Decimal(38, 20)), CAST(6.37222643706103682567 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (833, CAST(N'2021-09-06T18:50:05.960' AS DateTime), 1, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00010960589410253038 AS Decimal(38, 20)), CAST(8.35813027258882237015 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (836, CAST(N'2021-09-06T18:50:09.187' AS DateTime), 0, CAST(51676.77000000000000000000 AS Decimal(38, 20)), CAST(0.00015308807219988184 AS Decimal(38, 20)), CAST(9.16773976134569201388 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (837, CAST(N'2021-09-06T18:50:12.010' AS DateTime), 0, CAST(51672.61000000000000000000 AS Decimal(38, 20)), CAST(0.00007014845938894340 AS Decimal(38, 20)), CAST(8.00293525363677826129 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (838, CAST(N'2021-09-06T18:50:12.210' AS DateTime), 0, CAST(51672.98000000000000000000 AS Decimal(38, 20)), CAST(0.00006817393958017880 AS Decimal(38, 20)), CAST(8.48756738431272435504 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (842, CAST(N'2021-09-06T18:50:21.267' AS DateTime), 1, CAST(51665.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005118477467968340 AS Decimal(38, 20)), CAST(5.68208645145644428000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (843, CAST(N'2021-09-06T18:50:24.110' AS DateTime), 1, CAST(51666.83000000000000000000 AS Decimal(38, 20)), CAST(0.00010719598825424798 AS Decimal(38, 20)), CAST(9.22544905229802222385 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (844, CAST(N'2021-09-06T18:50:24.307' AS DateTime), 0, CAST(51666.82000000000000000000 AS Decimal(38, 20)), CAST(0.00013558845964054996 AS Decimal(38, 20)), CAST(9.77522301665486362220 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (846, CAST(N'2021-09-06T18:50:27.337' AS DateTime), 0, CAST(51666.85000000000000000000 AS Decimal(38, 20)), CAST(0.00014180531377988170 AS Decimal(38, 20)), CAST(9.22737826339578324365 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (847, CAST(N'2021-09-06T18:50:30.157' AS DateTime), 1, CAST(51669.56000000000000000000 AS Decimal(38, 20)), CAST(0.00000552967703227480 AS Decimal(38, 20)), CAST(3.67662730475443565911 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (849, CAST(N'2021-09-06T18:50:36.223' AS DateTime), 0, CAST(51667.75000000000000000000 AS Decimal(38, 20)), CAST(0.00001783823800172511 AS Decimal(38, 20)), CAST(5.76441118597089410775 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (850, CAST(N'2021-09-06T18:50:36.407' AS DateTime), 1, CAST(51667.76000000000000000000 AS Decimal(38, 20)), CAST(0.00008713953815733050 AS Decimal(38, 20)), CAST(6.92636217716055944496 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (851, CAST(N'2021-09-06T18:50:39.273' AS DateTime), 1, CAST(51651.73000000000000000000 AS Decimal(38, 20)), CAST(0.00003079695982429840 AS Decimal(38, 20)), CAST(8.30290787593851157990 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (853, CAST(N'2021-09-06T18:50:42.333' AS DateTime), 1, CAST(51650.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011265745298595030 AS Decimal(38, 20)), CAST(9.29339282673942578280 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (855, CAST(N'2021-09-06T18:50:45.527' AS DateTime), 1, CAST(51650.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004591612510658780 AS Decimal(38, 20)), CAST(6.33264869917010211813 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (856, CAST(N'2021-09-06T18:50:48.367' AS DateTime), 0, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004916247718462840 AS Decimal(38, 20)), CAST(2.53924194658605686000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (860, CAST(N'2021-09-06T18:50:54.417' AS DateTime), 1, CAST(51651.62000000000000000000 AS Decimal(38, 20)), CAST(0.00017544228312347200 AS Decimal(38, 20)), CAST(9.33948766878288758812 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (861, CAST(N'2021-09-06T18:50:54.600' AS DateTime), 0, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011251894734451500 AS Decimal(38, 20)), CAST(5.81160363034419975000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (862, CAST(N'2021-09-06T18:50:57.470' AS DateTime), 0, CAST(51650.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006413284757367000 AS Decimal(38, 20)), CAST(3.31246157718005550000 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (863, CAST(N'2021-09-06T18:51:00.653' AS DateTime), 1, CAST(51650.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013676502841374170 AS Decimal(38, 20)), CAST(7.25903740294876959210 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (864, CAST(N'2021-09-06T18:51:03.550' AS DateTime), 1, CAST(51650.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007998563120140998 AS Decimal(38, 20)), CAST(4.73912631451351705223 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (868, CAST(N'2021-09-06T18:51:15.763' AS DateTime), 0, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000477814674599941 AS Decimal(38, 20)), CAST(0.24672916352317153417 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (870, CAST(N'2021-09-06T18:51:21.673' AS DateTime), 0, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012884448912406600 AS Decimal(38, 20)), CAST(6.65314288489939604200 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (871, CAST(N'2021-09-06T18:51:24.697' AS DateTime), 1, CAST(51637.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000835972521843370 AS Decimal(38, 20)), CAST(4.02767692462588654861 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (872, CAST(N'2021-09-06T18:51:30.727' AS DateTime), 0, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007355949276758340 AS Decimal(38, 20)), CAST(3.79839152803970402580 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (873, CAST(N'2021-09-06T18:51:33.867' AS DateTime), 0, CAST(51637.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000755348503941367 AS Decimal(38, 20)), CAST(0.39003930698020367779 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (875, CAST(N'2021-09-06T18:51:39.910' AS DateTime), 0, CAST(51634.19000000000000000000 AS Decimal(38, 20)), CAST(0.00003471984259538340 AS Decimal(38, 20)), CAST(1.79273094934011959845 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (877, CAST(N'2021-09-06T18:51:42.973' AS DateTime), 0, CAST(51634.57000000000000000000 AS Decimal(38, 20)), CAST(0.00003484849977998470 AS Decimal(38, 20)), CAST(3.63825683776823242733 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (879, CAST(N'2021-09-06T18:51:46.007' AS DateTime), 1, CAST(51626.73000000000000000000 AS Decimal(38, 20)), CAST(0.00001880042395498680 AS Decimal(38, 20)), CAST(2.37680731202539464714 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (880, CAST(N'2021-09-06T18:51:48.930' AS DateTime), 1, CAST(51626.54000000000000000000 AS Decimal(38, 20)), CAST(0.00004493352810150670 AS Decimal(38, 20)), CAST(7.35283943376832919482 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (881, CAST(N'2021-09-06T18:51:49.040' AS DateTime), 1, CAST(51626.54000000000000000000 AS Decimal(38, 20)), CAST(0.00000128764873430500 AS Decimal(38, 20)), CAST(8.24516469746722510198 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (884, CAST(N'2021-09-06T18:51:54.977' AS DateTime), 1, CAST(51623.54000000000000000000 AS Decimal(38, 20)), CAST(0.00007537828715302880 AS Decimal(38, 20)), CAST(6.71465021340689576690 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (885, CAST(N'2021-09-06T18:51:55.087' AS DateTime), 1, CAST(51623.54000000000000000000 AS Decimal(38, 20)), CAST(0.00017826825286181080 AS Decimal(38, 20)), CAST(9.61894167878532570498 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (888, CAST(N'2021-09-06T18:52:01.043' AS DateTime), 0, CAST(51618.75000000000000000000 AS Decimal(38, 20)), CAST(0.00009998431713319540 AS Decimal(38, 20)), CAST(5.78058535876767888750 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (889, CAST(N'2021-09-06T18:52:01.153' AS DateTime), 0, CAST(51618.75000000000000000000 AS Decimal(38, 20)), CAST(0.00016757514903674600 AS Decimal(38, 20)), CAST(8.65001972434053258750 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (891, CAST(N'2021-09-06T18:52:04.210' AS DateTime), 0, CAST(51616.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000546066221104030 AS Decimal(38, 20)), CAST(3.17524284172693197120 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (892, CAST(N'2021-09-06T18:52:07.160' AS DateTime), 0, CAST(51612.90000000000000000000 AS Decimal(38, 20)), CAST(0.00001388541004335779 AS Decimal(38, 20)), CAST(7.23340239087206425050 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (893, CAST(N'2021-09-06T18:52:07.240' AS DateTime), 0, CAST(51612.90000000000000000000 AS Decimal(38, 20)), CAST(0.00010908488021655200 AS Decimal(38, 20)), CAST(5.63018701412887672080 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (896, CAST(N'2021-09-06T18:52:13.240' AS DateTime), 0, CAST(51610.46000000000000000000 AS Decimal(38, 20)), CAST(0.00013853582178174300 AS Decimal(38, 20)), CAST(7.14989748863377583178 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (897, CAST(N'2021-09-06T18:52:13.290' AS DateTime), 0, CAST(51610.46000000000000000000 AS Decimal(38, 20)), CAST(0.00016943660721622200 AS Decimal(38, 20)), CAST(8.74470123926853688212 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (904, CAST(N'2021-09-06T18:52:25.363' AS DateTime), 1, CAST(51615.98000000000000000000 AS Decimal(38, 20)), CAST(0.00009693273422165460 AS Decimal(38, 20)), CAST(9.43139679333047492608 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (906, CAST(N'2021-09-06T18:52:28.443' AS DateTime), 0, CAST(51615.99000000000000000000 AS Decimal(38, 20)), CAST(0.00002890175023530710 AS Decimal(38, 20)), CAST(4.50031670237892434513 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (907, CAST(N'2021-09-06T18:52:28.503' AS DateTime), 0, CAST(51615.99000000000000000000 AS Decimal(38, 20)), CAST(0.00002985110414673190 AS Decimal(38, 20)), CAST(3.08246502883222872684 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (911, CAST(N'2021-09-06T18:52:37.550' AS DateTime), 0, CAST(51614.50000000000000000000 AS Decimal(38, 20)), CAST(0.00003203672721611200 AS Decimal(38, 20)), CAST(9.22355400613051729450 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (913, CAST(N'2021-09-06T18:52:46.607' AS DateTime), 0, CAST(51614.47000000000000000000 AS Decimal(38, 20)), CAST(0.00016869221672820500 AS Decimal(38, 20)), CAST(8.70695935955143512635 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (914, CAST(N'2021-09-06T18:52:49.643' AS DateTime), 0, CAST(51614.50000000000000000000 AS Decimal(38, 20)), CAST(0.00006481186424606130 AS Decimal(38, 20)), CAST(5.81937552379992798850 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (916, CAST(N'2021-09-06T18:52:52.810' AS DateTime), 1, CAST(51615.97000000000000000000 AS Decimal(38, 20)), CAST(0.00002434113324821980 AS Decimal(38, 20)), CAST(1.92850621797503290057 AS Decimal(38, 20)), N'cf685ef7-9a1f-4062-aa2a-365088511f7d')
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
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (4, N'LTC', N'd07be03a6fde4176398b6910d8a646817037eef52ae27cf536b621d2e8942b81', CAST(0.00021000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', 1629906834, N'8082acc0-2a64-4983-9227-9ea395279df3', 18)
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (5, N'LTC', N'8eeca2c8862b7c0262b05a1438c6e8b460ba4323f8a2e1c2b135b4d864f2161f', CAST(0.00031000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', 1629907452, N'8082acc0-2a64-4983-9227-9ea395279df3', 18)
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (6, N'LTC', N'eed57f5771622a33095fbfa6fef2138bc02f1e36f5ed63166c541381bb12f5a6', CAST(0.00018660000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'M8GGkgkfEvQsq6UQXk9SauXNAPgEugpdyp', 1629908243, N'8082acc0-2a64-4983-9227-9ea395279df3', 18)
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (10004, N'LTC', N'8b5565e5efbc0b8dbdfc645534b95316edb6471391a9d0f08998ad1c5a13cba2', CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'MW5Z1mT9xGSLLhT78bTeXAfBicrZG3oMA7', 1629488895, N'40ffde92-878c-4c09-ac6b-c86a769d1623', 12)
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
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011575467172812400 AS Decimal(38, 20)), N'равенство')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001423732499323660 AS Decimal(38, 20)), CAST(0.00007776247201383230 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006292045603642240 AS Decimal(38, 20)), CAST(0.00004427215961938360 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010761260702629220 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51636.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51636.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007887211482919340 AS Decimal(38, 20)), CAST(0.00008676980039420060 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008676980039420060 AS Decimal(38, 20)), N'равенство')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51639.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00016773686286422300 AS Decimal(38, 20)), N'равенство')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006481186424606130 AS Decimal(38, 20)), CAST(0.00004793504841995170 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002434113324821980 AS Decimal(38, 20)), CAST(0.00001302145468677460 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003950960805616780 AS Decimal(38, 20)), CAST(0.00010761260702629220 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015194860051942420 AS Decimal(38, 20)), CAST(0.00003950960805616780 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'15')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'15')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00017862043631198800 AS Decimal(38, 20)), N'равенство')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51658.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51645.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51645.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009350100154685820 AS Decimal(38, 20)), CAST(0.00005738189353485680 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51652.23000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001562779658270440 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51652.24000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013607706527042960 AS Decimal(38, 20)), CAST(0.00001562779658270440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51652.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51652.28000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51648.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51649.39000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51645.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000007368242371533 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51648.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51648.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51649.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51649.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005151102843299100 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51654.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51645.81000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001839943463839600 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004010262826462360 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51652.86000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002742545298646457 AS Decimal(38, 20)), CAST(0.00000007368242371533 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51645.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008290947083519280 AS Decimal(38, 20)), CAST(0.00009350100154685820 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51645.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007111185326758420 AS Decimal(38, 20)), CAST(0.00008290947083519280 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000510918172314263 AS Decimal(38, 20)), CAST(0.00002742545298646457 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51651.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51652.84000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011481349138301510 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51654.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.68000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.67000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008001649411395980 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.67000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001737643034075200 AS Decimal(38, 20)), CAST(0.00008001649411395980 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51651.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51651.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51656.74000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51656.74000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51660.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51654.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010305465799898600 AS Decimal(38, 20)), CAST(0.00001737643034075200 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000809138249982600 AS Decimal(38, 20)), CAST(0.00011729774480559800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51657.22000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000062049208237891 AS Decimal(38, 20)), CAST(0.00000809138249982600 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008472924571704560 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51653.09000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51653.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000985727012616460 AS Decimal(38, 20)), CAST(0.00008858321089697220 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51653.09000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51653.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51656.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012722009137609040 AS Decimal(38, 20)), CAST(0.00000985727012616460 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51656.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001935985890187310 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012783329958460890 AS Decimal(38, 20)), CAST(0.00001935985890187310 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005933686981878070 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001380422264980300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004857371516925000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51647.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51647.15000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51647.15000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51647.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008077156323975540 AS Decimal(38, 20)), CAST(0.00008097142115280560 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004208178624607750 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007708844089744950 AS Decimal(38, 20)), CAST(0.00004208178624607750 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007436724997794560 AS Decimal(38, 20)), CAST(0.00005627398679790740 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006330246295002400 AS Decimal(38, 20)), CAST(0.00005151102843299100 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51648.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005124754312040560 AS Decimal(38, 20)), CAST(0.00008077156323975540 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.28000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008941911938107480 AS Decimal(38, 20)), CAST(0.00007111185326758420 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51653.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002046458573102260 AS Decimal(38, 20)), CAST(0.00005933686981878070 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51653.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001566435313581640 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51653.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002897566893555920 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51653.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003749860005336780 AS Decimal(38, 20)), CAST(0.00002897566893555920 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51649.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006036306762153422 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51647.29000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.29000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003151228224463400 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.67000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016196370719092200 AS Decimal(38, 20)), CAST(0.00001380422264980300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.66000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012881899938397978 AS Decimal(38, 20)), CAST(0.00006036306762153422 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51653.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010889015612606520 AS Decimal(38, 20)), CAST(0.00008941911938107480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51649.53000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51649.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000115795051732940 AS Decimal(38, 20)), CAST(0.00009781438200632780 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.21000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010740364226857400 AS Decimal(38, 20)), CAST(0.00003151228224463400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002939627618966440 AS Decimal(38, 20)), CAST(0.00004857371516925000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001297334926807020 AS Decimal(38, 20)), CAST(0.00001247472148969520 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51647.19000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006702535416326840 AS Decimal(38, 20)), CAST(0.00005124754312040560 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51647.19000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002843191904408380 AS Decimal(38, 20)), CAST(0.00006702535416326840 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51633.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006915646561847833 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51638.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.23000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51636.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.22000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51634.23000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005439837242215830 AS Decimal(38, 20)), CAST(0.00007700974786514870 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51624.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51622.53000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004160525921806935 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012541866550474365 AS Decimal(38, 20)), CAST(0.00004160525921806935 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007884388271665400 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51631.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003911235958296445 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51632.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005889577262983467 AS Decimal(38, 20)), CAST(0.00006915646561847833 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51626.64000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007588967703091440 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51626.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001302374210815125 AS Decimal(38, 20)), CAST(0.00003911235958296445 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51632.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51632.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011975375326338900 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51632.43000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006244050444217430 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51636.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003312008000590000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51632.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004800442021712833 AS Decimal(38, 20)), CAST(0.00005889577262983467 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51633.84000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51634.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013548510239249200 AS Decimal(38, 20)), CAST(0.00003312008000590000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005748055719653170 AS Decimal(38, 20)), CAST(0.00005439837242215830 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51643.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002358142427335700 AS Decimal(38, 20)), CAST(0.00013548510239249200 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51643.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51627.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011675232346949777 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51627.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001954259016529723 AS Decimal(38, 20)), CAST(0.00011675232346949777 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007537262806453400 AS Decimal(38, 20)), CAST(0.00007884388271665400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51603.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51603.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51613.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003822241129270870 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008528988607474130 AS Decimal(38, 20)), CAST(0.00003822241129270870 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011644658153711239 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003906113283664970 AS Decimal(38, 20)), CAST(0.00008528988607474130 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015020695233261500 AS Decimal(38, 20)), CAST(0.00003869519812925500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51617.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009600501586497030 AS Decimal(38, 20)), CAST(0.00003906113283664970 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015122045509108375 AS Decimal(38, 20)), CAST(0.00001302374210815125 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000492259254908300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00018393137845393800 AS Decimal(38, 20)), CAST(0.00000492259254908300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002339420552523575 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011253058272997456 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51611.53000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.23000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.17000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005504711533666000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002603241457884770 AS Decimal(38, 20)), CAST(0.00005504711533666000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.17000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011271494902331120 AS Decimal(38, 20)), CAST(0.00001086368626489480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013846223724003050 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.17000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003005767177327450 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000141788804969690 AS Decimal(38, 20)), CAST(0.00009600501586497030 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51613.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003215355967737430 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.94000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013811754860827580 AS Decimal(38, 20)), CAST(0.00002485418069402420 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005678388655967260 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000638968050777410 AS Decimal(38, 20)), CAST(0.00003005767177327450 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51630.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004439237911458700 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.13000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013811356711113500 AS Decimal(38, 20)), CAST(0.00004439237911458700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51624.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008290697023407967 AS Decimal(38, 20)), CAST(0.00004800442021712833 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.23000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013907537578562030 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002371863276870870 AS Decimal(38, 20)), CAST(0.00013907537578562030 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004796993753312618 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.24000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003212261974444738 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009566246303527762 AS Decimal(38, 20)), CAST(0.00003212261974444738 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51624.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000003680726514943 AS Decimal(38, 20)), CAST(0.00000141788804969690 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013550013654655857 AS Decimal(38, 20)), CAST(0.00000003680726514943 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004645748764577232 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003765720810632118 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008038901373762082 AS Decimal(38, 20)), CAST(0.00003765720810632118 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004471765637617420 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014092435917860180 AS Decimal(38, 20)), CAST(0.00004471765637617420 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005456116425551540 AS Decimal(38, 20)), CAST(0.00002603241457884770 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007476151412109018 AS Decimal(38, 20)), CAST(0.00008038901373762082 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007923534031921730 AS Decimal(38, 20)), CAST(0.00002371863276870870 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.92000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007606457661654160 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013728078340053590 AS Decimal(38, 20)), CAST(0.00000638968050777410 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002570216116761010 AS Decimal(38, 20)), CAST(0.00013728078340053590 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000290625374899495 AS Decimal(38, 20)), CAST(0.00002339420552523575 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006335863669559243 AS Decimal(38, 20)), CAST(0.00013550013654655857 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007212603412201833 AS Decimal(38, 20)), CAST(0.00008290697023407967 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005901041722810360 AS Decimal(38, 20)), CAST(0.00005456116425551540 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51628.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000379647994590810 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51623.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000229542860868250 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51623.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004672980059251570 AS Decimal(38, 20)), CAST(0.00000229542860868250 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51628.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001575577772024830 AS Decimal(38, 20)), CAST(0.00007572346882695490 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51628.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011548154815820990 AS Decimal(38, 20)), CAST(0.00000379647994590810 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51628.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004545733269558088 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005194498852451500 AS Decimal(38, 20)), CAST(0.00010046163019745700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51622.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009392992160000375 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000644403873311525 AS Decimal(38, 20)), CAST(0.00009392992160000375 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006793249206055570 AS Decimal(38, 20)), CAST(0.00007923534031921730 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.16000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51613.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003010382243902596 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006904693463307246 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001542306384789904 AS Decimal(38, 20)), CAST(0.00003010382243902596 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51613.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51613.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003714411930979450 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51606.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001920852792412440 AS Decimal(38, 20)), CAST(0.00001266602660187800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009556982782463060 AS Decimal(38, 20)), CAST(0.00001920852792412440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51606.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008799056647717540 AS Decimal(38, 20)), CAST(0.00009556982782463060 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51605.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51602.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009904959597580600 AS Decimal(38, 20)), CAST(0.00002371295393617500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51602.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009568261490002400 AS Decimal(38, 20)), CAST(0.00009904959597580600 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51607.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005428180957878060 AS Decimal(38, 20)), CAST(0.00008799056647717540 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51605.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005855233793079540 AS Decimal(38, 20)), CAST(0.00005428180957878060 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51605.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002278615703004690 AS Decimal(38, 20)), CAST(0.00007532578971019290 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51605.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006400814636797050 AS Decimal(38, 20)), CAST(0.00003714411930979450 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51585.86000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002221820718712090 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51582.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004520650303233720 AS Decimal(38, 20)), CAST(0.00002221820718712090 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51588.09000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014753463871196640 AS Decimal(38, 20)), CAST(0.00003611253427160560 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51586.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000159346247166000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51593.29000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009797008191140880 AS Decimal(38, 20)), CAST(0.00004520650303233720 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51588.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004291824542121820 AS Decimal(38, 20)), CAST(0.00009797008191140880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51588.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001248983769327940 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51590.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011986671309912000 AS Decimal(38, 20)), CAST(0.00000159346247166000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51587.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51590.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004092851413457054 AS Decimal(38, 20)), CAST(0.00006904693463307246 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51590.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000376907801431020 AS Decimal(38, 20)), CAST(0.00001248983769327940 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51590.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000501426207135220 AS Decimal(38, 20)), CAST(0.00004291824542121820 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51592.22000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007705329855766740 AS Decimal(38, 20)), CAST(0.00003128535078432660 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51592.22000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012471108898739946 AS Decimal(38, 20)), CAST(0.00004092851413457054 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51587.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51585.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51585.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010145976492271760 AS Decimal(38, 20)), CAST(0.00007875985357852640 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51581.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51579.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51574.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000972809028333420 AS Decimal(38, 20)), CAST(0.00005308195504037760 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51562.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51561.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001726924246981300 AS Decimal(38, 20)), CAST(0.00010018681581140800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51559.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51558.66000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51564.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010588920736028300 AS Decimal(38, 20)), CAST(0.00001726924246981300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51564.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009290401837458100 AS Decimal(38, 20)), CAST(0.00010588920736028300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51566.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003036259144095829 AS Decimal(38, 20)), CAST(0.00000798269547893791 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51566.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008888749549579240 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007872057393133700 AS Decimal(38, 20)), CAST(0.00009290401837458100 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011884427905028871 AS Decimal(38, 20)), CAST(0.00003036259144095829 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51565.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007227669333679480 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51565.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51577.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011042186902389960 AS Decimal(38, 20)), CAST(0.00008888749549579240 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.64000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51577.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015694827956936680 AS Decimal(38, 20)), CAST(0.00000972809028333420 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51573.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51577.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009059936166303250 AS Decimal(38, 20)), CAST(0.00003389621257497750 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51581.87000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010643062158787198 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51581.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010521461270061180 AS Decimal(38, 20)), CAST(0.00000376907801431020 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51575.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51571.81000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010521342489179880 AS Decimal(38, 20)), CAST(0.00001681004763432320 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51571.81000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006155360781660020 AS Decimal(38, 20)), CAST(0.00010521342489179880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51559.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51559.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008078152587673700 AS Decimal(38, 20)), CAST(0.00010316052115669500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51571.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006056522981290018 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51572.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006286073469690080 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51570.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008202202817519280 AS Decimal(38, 20)), CAST(0.00006155360781660020 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51570.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007471702027819920 AS Decimal(38, 20)), CAST(0.00006286073469690080 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51565.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51565.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006201298724022320 AS Decimal(38, 20)), CAST(0.00007227669333679480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.19000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000226079477102480 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003304110664550320 AS Decimal(38, 20)), CAST(0.00000226079477102480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51568.14000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003207565677914620 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51564.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.21000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.21000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51562.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51568.13000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011230770242973580 AS Decimal(38, 20)), CAST(0.00003207565677914620 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.14000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000976466201700480 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.14000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002898283956059390 AS Decimal(38, 20)), CAST(0.00000976466201700480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51566.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012536874801170500 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51565.15000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51566.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005173929345409300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51568.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005814890528942880 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51565.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008904794207264060 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51565.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008505649402973031 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51568.14000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011511542476486210 AS Decimal(38, 20)), CAST(0.00002898283956059390 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51569.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008068968433918890 AS Decimal(38, 20)), CAST(0.00011511542476486210 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51564.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51564.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51565.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000170329837207791 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51570.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51570.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005313711653143900 AS Decimal(38, 20)), CAST(0.00013921640279666400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51565.15000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51569.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51570.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004067018294738160 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51569.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51570.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004564803989867118 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51572.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010104364822667282 AS Decimal(38, 20)), CAST(0.00004564803989867118 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51572.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008908965982919980 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51572.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010925425482413520 AS Decimal(38, 20)), CAST(0.00008908965982919980 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51580.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011791959950603480 AS Decimal(38, 20)), CAST(0.00000501426207135220 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51581.87000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014595364618392400 AS Decimal(38, 20)), CAST(0.00005313711653143900 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51592.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006068238283539320 AS Decimal(38, 20)), CAST(0.00008202202817519280 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51588.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005293545101440396 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51588.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004143575999952672 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51581.93000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003499510969733608 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51581.94000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000673767505527378 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51570.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013151770631387740 AS Decimal(38, 20)), CAST(0.00004067018294738160 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51572.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000365344872868300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51570.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007580037716580590 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51567.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000509438077225080 AS Decimal(38, 20)), CAST(0.00005814890528942880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51567.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51564.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008075292170082770 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51564.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005047047736610830 AS Decimal(38, 20)), CAST(0.00008075292170082770 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51565.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002588531590340850 AS Decimal(38, 20)), CAST(0.00005047047736610830 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51571.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016410862690029120 AS Decimal(38, 20)), CAST(0.00000509438077225080 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51572.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015513509938266800 AS Decimal(38, 20)), CAST(0.00000365344872868300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51564.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002039079303871400 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51564.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51566.09000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012808881482486080 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51566.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010528670824379030 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51566.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51564.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003142151666405640 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51564.30000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000620090477457350 AS Decimal(38, 20)), CAST(0.00003142151666405640 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51555.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51555.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51555.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003138498879568000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51555.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005464084933262310 AS Decimal(38, 20)), CAST(0.00003138498879568000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51555.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003624109394673300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51555.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014844531535564200 AS Decimal(38, 20)), CAST(0.00003624109394673300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51557.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003630985200233300 AS Decimal(38, 20)), CAST(0.00010954153635983400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51557.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008532196836793850 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51557.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000840860177223000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51555.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001084626708684800 AS Decimal(38, 20)), CAST(0.00009983910308212000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51555.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015535492876328300 AS Decimal(38, 20)), CAST(0.00000840860177223000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51555.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001348823067428980 AS Decimal(38, 20)), CAST(0.00005464084933262310 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51556.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001482406920512380 AS Decimal(38, 20)), CAST(0.00001084626708684800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51563.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002794005685855600 AS Decimal(38, 20)), CAST(0.00015600834943168300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51564.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010807370781343100 AS Decimal(38, 20)), CAST(0.00003630985200233300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51560.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51562.15000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51557.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51557.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51557.38000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004542245466514610 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014529987226487200 AS Decimal(38, 20)), CAST(0.00002794005685855600 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51568.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009384543732453350 AS Decimal(38, 20)), CAST(0.00000620090477457350 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51590.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004200764672924094 AS Decimal(38, 20)), CAST(0.00005293545101440396 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51589.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001340071950731820 AS Decimal(38, 20)), CAST(0.00007580037716580590 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.39000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007876922920288920 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51623.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000728220446374293 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007370967337568817 AS Decimal(38, 20)), CAST(0.00000728220446374293 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.13000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008171270363112615 AS Decimal(38, 20)), CAST(0.00000290625374899495 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004773146922128780 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.69000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001936964179359800 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015617216627866600 AS Decimal(38, 20)), CAST(0.00001936964179359800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006774251967097720 AS Decimal(38, 20)), CAST(0.00004987201804754880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010812067618040422 AS Decimal(38, 20)), CAST(0.00000673767505527378 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.09000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000417226525217920 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005015142832424078 AS Decimal(38, 20)), CAST(0.00010812067618040422 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004824708246078700 AS Decimal(38, 20)), CAST(0.00005933096588558100 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012014984037734080 AS Decimal(38, 20)), CAST(0.00000417226525217920 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002208175613641820 AS Decimal(38, 20)), CAST(0.00012014984037734080 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000695949336837903 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015065429478448597 AS Decimal(38, 20)), CAST(0.00000695949336837903 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007576486071374460 AS Decimal(38, 20)), CAST(0.00003410108007215940 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010631068251389588 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004677514594363810 AS Decimal(38, 20)), CAST(0.00011548154815820990 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012428454697331570 AS Decimal(38, 20)), CAST(0.00006244050444217430 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006114918601752712 AS Decimal(38, 20)), CAST(0.00010631068251389588 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008237264840042855 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.87000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001263949489809600 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.86000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009246749342068445 AS Decimal(38, 20)), CAST(0.00008237264840042855 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51611.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009344717929765955 AS Decimal(38, 20)), CAST(0.00009246749342068445 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51594.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006007671461444220 AS Decimal(38, 20)), CAST(0.00011791959950603480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51603.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003326549485012320 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51606.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000418715765894670 AS Decimal(38, 20)), CAST(0.00001263949489809600 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51606.78000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016366500089115580 AS Decimal(38, 20)), CAST(0.00003326549485012320 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51606.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011671542409654530 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003707727260751540 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002362008123827190 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000059731155661740 AS Decimal(38, 20)), CAST(0.00005648943058051610 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51619.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016929736676127510 AS Decimal(38, 20)), CAST(0.00002362008123827190 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004782058924800744 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000312432702776246 AS Decimal(38, 20)), CAST(0.00004782058924800744 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006560283529833110 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51619.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000437040431628510 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010602798010503290 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51622.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000654389243877766 AS Decimal(38, 20)), CAST(0.00004200764672924094 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001527684899758400 AS Decimal(38, 20)), CAST(0.00011986671309912000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.13000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003090430574068040 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51611.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013799387977365100 AS Decimal(38, 20)), CAST(0.00001527684899758400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51608.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000387292262347070 AS Decimal(38, 20)), CAST(0.00011671542409654530 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51605.12000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013798869910556180 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51605.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000590120572871610 AS Decimal(38, 20)), CAST(0.00003090430574068040 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51627.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009269247171128730 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51627.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006737639376305790 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.84000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009102397276601860 AS Decimal(38, 20)), CAST(0.00005855233793079540 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004423114752593874 AS Decimal(38, 20)), CAST(0.00000654389243877766 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.93000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005039353196061910 AS Decimal(38, 20)), CAST(0.00006737639376305790 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51623.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013182730662255930 AS Decimal(38, 20)), CAST(0.00004129268342689270 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.86000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011420822372390200 AS Decimal(38, 20)), CAST(0.00002358142427335700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51621.87000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000740195336165000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009895507111165410 AS Decimal(38, 20)), CAST(0.00002278615703004690 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000413101054920440 AS Decimal(38, 20)), CAST(0.00006400814636797050 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006016197226017788 AS Decimal(38, 20)), CAST(0.00006114918601752712 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010178133170203390 AS Decimal(38, 20)), CAST(0.00000437040431628510 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009451712700283080 AS Decimal(38, 20)), CAST(0.00000418715765894670 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004147568114170660 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.87000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015253978695373030 AS Decimal(38, 20)), CAST(0.00000387292262347070 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005693382381318810 AS Decimal(38, 20)), CAST(0.00010178133170203390 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006052206971706912 AS Decimal(38, 20)), CAST(0.00006016197226017788 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000226026345149622 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009729438251689730 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004752053061850370 AS Decimal(38, 20)), CAST(0.00009729438251689730 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000901562506752760 AS Decimal(38, 20)), CAST(0.00004147568114170660 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012914439417847678 AS Decimal(38, 20)), CAST(0.00000226026345149622 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004154765579921640 AS Decimal(38, 20)), CAST(0.00009102397276601860 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008799295224621602 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.94000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004503581442173340 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003935944244235762 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012867490962551638 AS Decimal(38, 20)), CAST(0.00003935944244235762 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010468952986630140 AS Decimal(38, 20)), CAST(0.00000901562506752760 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007756290485968988 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007627506129270260 AS Decimal(38, 20)), CAST(0.00004503581442173340 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005082497394216440 AS Decimal(38, 20)), CAST(0.00000413101054920440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005461858019913518 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014176188667386900 AS Decimal(38, 20)), CAST(0.00000740195336165000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009449058104981182 AS Decimal(38, 20)), CAST(0.00005461858019913518 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012311314992751560 AS Decimal(38, 20)), CAST(0.00004154765579921640 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003120997605436016 AS Decimal(38, 20)), CAST(0.00001542306384789904 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001900325939944140 AS Decimal(38, 20)), CAST(0.00004824708246078700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002304230584904740 AS Decimal(38, 20)), CAST(0.00012311314992751560 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51617.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006255155795372540 AS Decimal(38, 20)), CAST(0.00007627506129270260 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007225924286630930 AS Decimal(38, 20)), CAST(0.00001900325939944140 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004445756731762434 AS Decimal(38, 20)), CAST(0.00003120997605436016 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004703022998153718 AS Decimal(38, 20)), CAST(0.00009449058104981182 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003501464912435700 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005036923151946162 AS Decimal(38, 20)), CAST(0.00012867490962551638 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001255070027548400 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003245736455193690 AS Decimal(38, 20)), CAST(0.00006255155795372540 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.74000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002951961794380048 AS Decimal(38, 20)), CAST(0.00005036923151946162 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51621.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003383115866865542 AS Decimal(38, 20)), CAST(0.00004703022998153718 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013616277693592122 AS Decimal(38, 20)), CAST(0.00005015142832424078 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005423192617214822 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006028708483105770 AS Decimal(38, 20)), CAST(0.00003245736455193690 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011460246570157052 AS Decimal(38, 20)), CAST(0.00002951961794380048 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000771587258564100 AS Decimal(38, 20)), CAST(0.00018913991068915500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005073698128142220 AS Decimal(38, 20)), CAST(0.00001839943463839600 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51622.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000950669423188399 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001457779883154561 AS Decimal(38, 20)), CAST(0.00000950669423188399 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004199716366920490 AS Decimal(38, 20)), CAST(0.00001463939334016260 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006731216724371143 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51629.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005412899481790533 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51630.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004148592494497350 AS Decimal(38, 20)), CAST(0.00005688090867217670 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51630.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012855597693871620 AS Decimal(38, 20)), CAST(0.00002843191904408380 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51629.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014448594168968737 AS Decimal(38, 20)), CAST(0.00000510918172314263 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51635.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003425164531648727 AS Decimal(38, 20)), CAST(0.00005412899481790533 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51635.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000325341308640900 AS Decimal(38, 20)), CAST(0.00010652625658853300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51637.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003735418572898668 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51637.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013717440047169832 AS Decimal(38, 20)), CAST(0.00003735418572898668 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51640.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004717594415283570 AS Decimal(38, 20)), CAST(0.00007225924286630930 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51640.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000343654249023500 AS Decimal(38, 20)), CAST(0.00014600045250076800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51640.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002468980244579256 AS Decimal(38, 20)), CAST(0.00004445756731762434 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005444666624741930 AS Decimal(38, 20)), CAST(0.00004717594415283570 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51640.24000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003553863532633454 AS Decimal(38, 20)), CAST(0.00002468980244579256 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51640.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016800851168483860 AS Decimal(38, 20)), CAST(0.00002304230584904740 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51633.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006594141762049040 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51633.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002212481592880763 AS Decimal(38, 20)), CAST(0.00003425164531648727 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51630.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008190314820124880 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.81000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010708706272164720 AS Decimal(38, 20)), CAST(0.00008190314820124880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004437509227747840 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51624.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003821725651538820 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51624.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015147083259721760 AS Decimal(38, 20)), CAST(0.00004437509227747840 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.84000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012172980547031780 AS Decimal(38, 20)), CAST(0.00003821725651538820 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003213820477581500 AS Decimal(38, 20)), CAST(0.00011091727042147800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51630.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001747747744316160 AS Decimal(38, 20)), CAST(0.00005082497394216440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51627.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001214066120429903 AS Decimal(38, 20)), CAST(0.00015065429478448597 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000696509424921400 AS Decimal(38, 20)), CAST(0.00007576486071374460 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015329127896264760 AS Decimal(38, 20)), CAST(0.00000059731155661740 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012000393118709554 AS Decimal(38, 20)), CAST(0.00000312432702776246 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51624.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014233457825255300 AS Decimal(38, 20)), CAST(0.00000696509424921400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003585904465795458 AS Decimal(38, 20)), CAST(0.00003383115866865542 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000264887586359332 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002762187655438760 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.07000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003767413759495760 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002906788095322740 AS Decimal(38, 20)), CAST(0.00015329127896264760 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002963887277508152 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51623.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012129749186397348 AS Decimal(38, 20)), CAST(0.00002963887277508152 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51623.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005427624362254452 AS Decimal(38, 20)), CAST(0.00012129749186397348 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011873783558548330 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005342467047899250 AS Decimal(38, 20)), CAST(0.00003126692438091470 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000591946356274170 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008955297064480997 AS Decimal(38, 20)), CAST(0.00001214066120429903 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005082413714883070 AS Decimal(38, 20)), CAST(0.00001747747744316160 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008705465155050850 AS Decimal(38, 20)), CAST(0.00005342467047899250 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003156021983901040 AS Decimal(38, 20)), CAST(0.00015147083259721760 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002400720120594200 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002148903348552443 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015999444078653857 AS Decimal(38, 20)), CAST(0.00002148903348552443 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003697407964476104 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.24000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001737706578214512 AS Decimal(38, 20)), CAST(0.00003585904465795458 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011833727877509696 AS Decimal(38, 20)), CAST(0.00003697407964476104 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005712522475846360 AS Decimal(38, 20)), CAST(0.00003156021983901040 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006806233183856270 AS Decimal(38, 20)), CAST(0.00011873783558548330 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006241164666712866 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014997161559293630 AS Decimal(38, 20)), CAST(0.00000591946356274170 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013066241784517840 AS Decimal(38, 20)), CAST(0.00003767413759495760 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004551695373166210 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004569581125196800 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51607.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004035451209189112 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51607.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51607.53000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00017366100855807790 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51607.53000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51607.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007533429864576720 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51607.87000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003612713321863040 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51602.20000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00018428828408209990 AS Decimal(38, 20)), CAST(0.00000590120572871610 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51608.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013937872384645910 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004499460265272990 AS Decimal(38, 20)), CAST(0.00013937872384645910 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001539018220053530 AS Decimal(38, 20)), CAST(0.00006271317892834230 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001647399729884880 AS Decimal(38, 20)), CAST(0.00004455354467246380 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.92000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007326999216958440 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.92000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001844334854671910 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.92000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003669660325939608 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51616.93000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004996254763098552 AS Decimal(38, 20)), CAST(0.00003669660325939608 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51625.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005469125502495620 AS Decimal(38, 20)), CAST(0.00001539018220053530 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51625.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000806034217032620 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51620.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009427466722870020 AS Decimal(38, 20)), CAST(0.00001647399729884880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005361073960252590 AS Decimal(38, 20)), CAST(0.00001255070027548400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002223569686628700 AS Decimal(38, 20)), CAST(0.00012963375799806500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012240061504878120 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51610.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008001163968816900 AS Decimal(38, 20)), CAST(0.00004569581125196800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004581711210581400 AS Decimal(38, 20)), CAST(0.00008001163968816900 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004495602689914200 AS Decimal(38, 20)), CAST(0.00002223569686628700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004709949178951760 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006001229614951290 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002103184322874610 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.74000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000271622669078240 AS Decimal(38, 20)), CAST(0.00002103184322874610 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007104702064350610 AS Decimal(38, 20)), CAST(0.00005361073960252590 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004011290373285930 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004554228514691000 AS Decimal(38, 20)), CAST(0.00011776871714637100 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008367700301281960 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005903073468200440 AS Decimal(38, 20)), CAST(0.00008367700301281960 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002944813623533048 AS Decimal(38, 20)), CAST(0.00000264887586359332 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006315452114825800 AS Decimal(38, 20)), CAST(0.00004554228514691000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008559240851811660 AS Decimal(38, 20)), CAST(0.00005903073468200440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51618.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004340903565446430 AS Decimal(38, 20)), CAST(0.00006028708483105770 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.36000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007339700808441070 AS Decimal(38, 20)), CAST(0.00004011290373285930 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011425385461852670 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.42000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004883197818362630 AS Decimal(38, 20)), CAST(0.00011425385461852670 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009890402625263880 AS Decimal(38, 20)), CAST(0.00009427466722870020 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51624.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015112237108457988 AS Decimal(38, 20)), CAST(0.00001737706578214512 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51630.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006114320701972700 AS Decimal(38, 20)), CAST(0.00003749860005336780 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51630.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001443097433747180 AS Decimal(38, 20)), CAST(0.00010889015612606520 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51630.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00017194729762708260 AS Decimal(38, 20)), CAST(0.00001566435313581640 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51633.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51633.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006123588022833490 AS Decimal(38, 20)), CAST(0.00000271622669078240 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51633.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51633.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003664865355782612 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51635.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51635.63000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51636.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010876324340177888 AS Decimal(38, 20)), CAST(0.00003664865355782612 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51638.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51638.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51638.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51639.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001623363048594168 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51639.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001484494321739512 AS Decimal(38, 20)), CAST(0.00001623363048594168 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51641.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013339140337584070 AS Decimal(38, 20)), CAST(0.00004340903565446430 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51641.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008990107341199234 AS Decimal(38, 20)), CAST(0.00006241164666712866 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51641.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51641.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002055065381366320 AS Decimal(38, 20)), CAST(0.00009890402625263880 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51641.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002477386892995485 AS Decimal(38, 20)), CAST(0.00008171270363112615 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51641.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011804580274878285 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51641.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011269717445256980 AS Decimal(38, 20)), CAST(0.00002055065381366320 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51643.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51636.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000060975356055785 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51635.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003162642923725112 AS Decimal(38, 20)), CAST(0.00010876324340177888 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51635.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012216220671411815 AS Decimal(38, 20)), CAST(0.00000060975356055785 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51632.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005811875455925175 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51632.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005118013315423425 AS Decimal(38, 20)), CAST(0.00005811875455925175 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51632.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004058071227771185 AS Decimal(38, 20)), CAST(0.00012216220671411815 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51632.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002723788434045230 AS Decimal(38, 20)), CAST(0.00004677514594363810 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51635.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000356850642877100 AS Decimal(38, 20)), CAST(0.00002208175613641820 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51635.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013242816866023026 AS Decimal(38, 20)), CAST(0.00004423114752593874 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51635.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009405376896916588 AS Decimal(38, 20)), CAST(0.00001484494321739512 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51636.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006283942156603390 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51635.52000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007824131216771890 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51638.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001753565884080440 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51638.08000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004528356792651360 AS Decimal(38, 20)), CAST(0.00001753565884080440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51639.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001455374966121966 AS Decimal(38, 20)), CAST(0.00008990107341199234 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51639.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008773249606030810 AS Decimal(38, 20)), CAST(0.00006283942156603390 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51641.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011001565955114400 AS Decimal(38, 20)), CAST(0.00000771587258564100 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51641.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51638.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007741428682460350 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51641.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00017252197180526415 AS Decimal(38, 20)), CAST(0.00002477386892995485 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51644.39000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011892129775086480 AS Decimal(38, 20)), CAST(0.00005073698128142220 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51644.64000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009945052969243875 AS Decimal(38, 20)), CAST(0.00000644403873311525 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51644.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004788295181835130 AS Decimal(38, 20)), CAST(0.00006793249206055570 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51644.17000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004259866291778180 AS Decimal(38, 20)), CAST(0.00004788295181835130 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51644.18000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002815509449138898 AS Decimal(38, 20)), CAST(0.00005427624362254452 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51644.21000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001332467524955220 AS Decimal(38, 20)), CAST(0.00011892129775086480 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51644.21000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005445808714928870 AS Decimal(38, 20)), CAST(0.00013182730662255930 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51644.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51648.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51664.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010698442780737940 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51664.96000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51654.64000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002261900809715460 AS Decimal(38, 20)), CAST(0.00010698442780737940 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51654.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007819814965045038 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51654.64000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001176897474181282 AS Decimal(38, 20)), CAST(0.00007819814965045038 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51654.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008954911413115937 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51658.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007964589254914189 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51658.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51658.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51654.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51654.65000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51656.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51658.43000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008219981104237911 AS Decimal(38, 20)), CAST(0.00007964589254914189 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009372867145283589 AS Decimal(38, 20)), CAST(0.00008219981104237911 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51657.71000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002442824161817703 AS Decimal(38, 20)), CAST(0.00008955297064480997 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51657.71000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002342965538773207 AS Decimal(38, 20)), CAST(0.00002442824161817703 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51664.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008435782551968430 AS Decimal(38, 20)), CAST(0.00005082413714883070 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51664.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005022184059499784 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51669.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51669.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009989232313814316 AS Decimal(38, 20)), CAST(0.00005022184059499784 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51669.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004913544461556577 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007155034293958423 AS Decimal(38, 20)), CAST(0.00004913544461556577 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010550257177348377 AS Decimal(38, 20)), CAST(0.00007155034293958423 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51670.26000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000407917592864510 AS Decimal(38, 20)), CAST(0.00002906788095322740 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013882553006467590 AS Decimal(38, 20)), CAST(0.00000407917592864510 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.25000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51671.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002612872814113680 AS Decimal(38, 20)), CAST(0.00010708706272164720 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51673.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51673.34000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006112501223623920 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51670.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001383880675483370 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010067774676749430 AS Decimal(38, 20)), CAST(0.00001383880675483370 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009375876928389000 AS Decimal(38, 20)), CAST(0.00003213820477581500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001453252975574304 AS Decimal(38, 20)), CAST(0.00011833727877509696 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006521911698636596 AS Decimal(38, 20)), CAST(0.00001453252975574304 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009522870997676070 AS Decimal(38, 20)), CAST(0.00010067774676749430 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003487714186072200 AS Decimal(38, 20)), CAST(0.00009375876928389000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005772638267731599 AS Decimal(38, 20)), CAST(0.00001457779883154561 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013528169371899301 AS Decimal(38, 20)), CAST(0.00005772638267731599 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013546681540807110 AS Decimal(38, 20)), CAST(0.00004199716366920490 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010042721140218290 AS Decimal(38, 20)), CAST(0.00005039353196061910 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013999503885395712 AS Decimal(38, 20)), CAST(0.00004545733269558088 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003606865249391130 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011930398629945882 AS Decimal(38, 20)), CAST(0.00007476151412109018 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51670.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005905153791376040 AS Decimal(38, 20)), CAST(0.00005901041722810360 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51670.03000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002880740250870987 AS Decimal(38, 20)), CAST(0.00001954259016529723 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004221554428442276 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013400376137998170 AS Decimal(38, 20)), CAST(0.00001575577772024830 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011163563482073827 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000770849567265673 AS Decimal(38, 20)), CAST(0.00011163563482073827 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009575195158634000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000186818707821380 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002096223683141247 AS Decimal(38, 20)), CAST(0.00000770849567265673 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002597664577233410 AS Decimal(38, 20)), CAST(0.00000186818707821380 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005036388302704500 AS Decimal(38, 20)), CAST(0.00004148592494497350 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010576465870522200 AS Decimal(38, 20)), CAST(0.00005036388302704500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002162502921262120 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51655.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015914039218758180 AS Decimal(38, 20)), CAST(0.00002162502921262120 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51657.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006803053015285720 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51657.02000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001343396241470920 AS Decimal(38, 20)), CAST(0.00006114320701972700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51653.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014000596811064020 AS Decimal(38, 20)), CAST(0.00001443097433747180 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51653.27000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013650301952683590 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51652.55000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005509903806033580 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51652.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012995095463933160 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51654.29000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000537465289485400 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51654.28000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007669079596022520 AS Decimal(38, 20)), CAST(0.00005509903806033580 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013047262017171420 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51655.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002681818577778420 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51657.71000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003699720121780305 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51657.71000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003126667739416755 AS Decimal(38, 20)), CAST(0.00003699720121780305 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51660.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006357263143340815 AS Decimal(38, 20)), CAST(0.00004058071227771185 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51660.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002343365094784455 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51657.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002674313337856100 AS Decimal(38, 20)), CAST(0.00016859797871140700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51657.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000673492327646100 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51662.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009420392582854410 AS Decimal(38, 20)), CAST(0.00004703948509275890 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51662.48000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006241870814115707 AS Decimal(38, 20)), CAST(0.00002212481592880763 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51663.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005237124769593080 AS Decimal(38, 20)), CAST(0.00006803053015285720 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51663.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011920707566626700 AS Decimal(38, 20)), CAST(0.00000325341308640900 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51662.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010405323994534710 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51662.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007912736901972790 AS Decimal(38, 20)), CAST(0.00010405323994534710 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002869841485689295 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006882825152428305 AS Decimal(38, 20)), CAST(0.00002869841485689295 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51681.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51681.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51681.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51681.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51677.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51677.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51677.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51679.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005632054491728612 AS Decimal(38, 20)), CAST(0.00009405376896916588 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51676.32000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005446245654228300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51677.78000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003707630356637550 AS Decimal(38, 20)), CAST(0.00005446245654228300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51677.78000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016394169636254300 AS Decimal(38, 20)), CAST(0.00001273908466693900 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51681.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51681.11000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005053541569529820 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51681.22000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006484104956725680 AS Decimal(38, 20)), CAST(0.00005053541569529820 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51681.22000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004550381537783190 AS Decimal(38, 20)), CAST(0.00005854457470520610 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51683.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51683.40000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51683.43000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013182545487388270 AS Decimal(38, 20)), CAST(0.00005444666624741930 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51683.43000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009951988863736360 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51685.84000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51683.74000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003605671852643440 AS Decimal(38, 20)), CAST(0.00009951988863736360 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51683.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002741202778527968 AS Decimal(38, 20)), CAST(0.00013717440047169832 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51685.84000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003009278114423830 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51685.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016802004816383970 AS Decimal(38, 20)), CAST(0.00003009278114423830 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51685.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006947739574568140 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51685.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005377621066466731 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51685.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003282521126457729 AS Decimal(38, 20)), CAST(0.00005377621066466731 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51685.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000450404603243994 AS Decimal(38, 20)), CAST(0.00000280223786961391 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51685.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51685.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015566275965220400 AS Decimal(38, 20)), CAST(0.00002880769932121400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015105783601806334 AS Decimal(38, 20)), CAST(0.00001455374966121966 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013079500996079090 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003611051972774346 AS Decimal(38, 20)), CAST(0.00003553863532633454 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51678.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009414755995112754 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003428850603955250 AS Decimal(38, 20)), CAST(0.00000343654249023500 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51678.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000791600151356054 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.45000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005011212260001915 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004746330121879610 AS Decimal(38, 20)), CAST(0.00013079500996079090 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007279291826896106 AS Decimal(38, 20)), CAST(0.00000791600151356054 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002631764208260830 AS Decimal(38, 20)), CAST(0.00003428850603955250 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.88000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001675620862131745 AS Decimal(38, 20)), CAST(0.00005011212260001915 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.89000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000103243151727730 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.79000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006537335871969020 AS Decimal(38, 20)), CAST(0.00000103243151727730 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51675.78000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007313929669239530 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001795438407824990 AS Decimal(38, 20)), CAST(0.00004550381537783190 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000947076725283170 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00018751040622010430 AS Decimal(38, 20)), CAST(0.00000947076725283170 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.31000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004727235103364680 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51678.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014443841546049260 AS Decimal(38, 20)), CAST(0.00003605671852643440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001621372262770950 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51682.10000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011822731574914832 AS Decimal(38, 20)), CAST(0.00002741202778527968 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51683.39000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001266799197190810 AS Decimal(38, 20)), CAST(0.00001621372262770950 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51678.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015083039633502790 AS Decimal(38, 20)), CAST(0.00001266799197190810 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006379150453200160 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51675.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009815855468537640 AS Decimal(38, 20)), CAST(0.00006379150453200160 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51675.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000733995670794510 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51682.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011050424050097660 AS Decimal(38, 20)), CAST(0.00006947739574568140 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51682.04000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008219237825004030 AS Decimal(38, 20)), CAST(0.00000733995670794510 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51684.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010761818033997771 AS Decimal(38, 20)), CAST(0.00003282521126457729 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51684.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007735405092935740 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51682.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007695615593202236 AS Decimal(38, 20)), CAST(0.00000450404603243994 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51682.06000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004787423165881750 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51682.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006677331834415550 AS Decimal(38, 20)), CAST(0.00004787423165881750 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51682.05000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002521103351619690 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010071614091317810 AS Decimal(38, 20)), CAST(0.00002521103351619690 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010746544213381870 AS Decimal(38, 20)), CAST(0.00003606865249391130 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51675.81000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009682128527053741 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51677.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008392438231218770 AS Decimal(38, 20)), CAST(0.00008219237825004030 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51678.43000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001087809838861180 AS Decimal(38, 20)), CAST(0.00006677331834415550 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51678.44000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000449215639591830 AS Decimal(38, 20)), CAST(0.00001332467524955220 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51676.80000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012606732683538800 AS Decimal(38, 20)), CAST(0.00004086597340221800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51676.81000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00016916655784899660 AS Decimal(38, 20)), CAST(0.00002939627618966440 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006945268161103754 AS Decimal(38, 20)), CAST(0.00003611051972774346 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005864886113379610 AS Decimal(38, 20)), CAST(0.00010042721140218290 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004493846895403054 AS Decimal(38, 20)), CAST(0.00004221554428442276 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005879463984574860 AS Decimal(38, 20)), CAST(0.00001297334926807020 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51669.95000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003912910010625060 AS Decimal(38, 20)), CAST(0.00005905153791376040 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010482743908875998 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010584722734328613 AS Decimal(38, 20)), CAST(0.00002880740250870987 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007136052570834702 AS Decimal(38, 20)), CAST(0.00010482743908875998 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007248124129720090 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001174676502670480 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000068242177398990 AS Decimal(38, 20)), CAST(0.00002612872814113680 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000707862954916372 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010116392341496722 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012965124153050228 AS Decimal(38, 20)), CAST(0.00000707862954916372 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51671.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000294343568568 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51671.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000207143835820 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51671.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003495814541120000 AS Decimal(38, 20)), CAST(0.00006000207143835820 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003036589819489326 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51669.83000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007293720481588400 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51669.83000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004005969056862420 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51670.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000224477099359290 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51670.58000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000792462975155774 AS Decimal(38, 20)), CAST(0.00003036589819489326 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00017690117516410510 AS Decimal(38, 20)), CAST(0.00000224477099359290 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013951266321330840 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008915812461132032 AS Decimal(38, 20)), CAST(0.00006000294343568568 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005214576257958462 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008552945865575660 AS Decimal(38, 20)), CAST(0.00000115795051732940 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.59000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004283566393090250 AS Decimal(38, 20)), CAST(0.00007708844089744950 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.60000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004094628898471000 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51678.24000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002637225651478920 AS Decimal(38, 20)), CAST(0.00000449215639591830 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51680.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000744723072622300 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51680.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015523107161523400 AS Decimal(38, 20)), CAST(0.00000744723072622300 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51682.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51682.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010613022051105700 AS Decimal(38, 20)), CAST(0.00004094628898471000 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010285392752981440 AS Decimal(38, 20)), CAST(0.00002046458573102260 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.91000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00015926952416043216 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010960589410253038 AS Decimal(38, 20)), CAST(0.00005214576257958462 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002912191619590002 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51676.78000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002431736086696216 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51676.77000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00015308807219988184 AS Decimal(38, 20)), CAST(0.00002431736086696216 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007014845938894340 AS Decimal(38, 20)), CAST(0.00008472924571704560 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006817393958017880 AS Decimal(38, 20)), CAST(0.00009608148722726920 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006997909800614080 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51672.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005627751306457330 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51665.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005360884370916004 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51665.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005118477467968340 AS Decimal(38, 20)), CAST(0.00005879463984574860 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51666.83000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00010719598825424798 AS Decimal(38, 20)), CAST(0.00007136052570834702 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51666.82000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013558845964054996 AS Decimal(38, 20)), CAST(0.00005360884370916004 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51666.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006562686668039540 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51666.85000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00014180531377988170 AS Decimal(38, 20)), CAST(0.00003678847050144730 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51669.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000552967703227480 AS Decimal(38, 20)), CAST(0.00006562686668039540 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51669.56000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004691624783301550 AS Decimal(38, 20)), CAST(0.00002614292168344510 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51667.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001783823800172511 AS Decimal(38, 20)), CAST(0.00009372867145283589 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51667.76000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00008713953815733050 AS Decimal(38, 20)), CAST(0.00004691624783301550 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51651.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003079695982429840 AS Decimal(38, 20)), CAST(0.00012995095463933160 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51651.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00011265745298595030 AS Decimal(38, 20)), CAST(0.00006727267339232970 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004591612510658780 AS Decimal(38, 20)), CAST(0.00007669079596022520 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00006612329271907140 AS Decimal(38, 20)), CAST(0.00004976550128765660 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005139276769542730 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000377777889546830 AS Decimal(38, 20)), CAST(0.00005139276769542730 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51651.62000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00017544228312347200 AS Decimal(38, 20)), CAST(0.00000537465289485400 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51650.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00013676502841374170 AS Decimal(38, 20)), CAST(0.00000377777889546830 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51650.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007998563120140998 AS Decimal(38, 20)), CAST(0.00001176897474181282 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51641.28000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009660430173231540 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51641.28000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003137831940845560 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51637.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001642245837320850 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51637.01000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000835972521843370 AS Decimal(38, 20)), CAST(0.00006964008392283700 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51637.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.19000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.19000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51634.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003561314709280290 AS Decimal(38, 20)), CAST(0.00000356850642877100 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51634.57000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00003484849977998470 AS Decimal(38, 20)), CAST(0.00003561314709280290 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51626.72000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51626.73000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001880042395498680 AS Decimal(38, 20)), CAST(0.00002723788434045230 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51626.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004493352810150670 AS Decimal(38, 20)), CAST(0.00009749010582337630 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51626.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000128764873430500 AS Decimal(38, 20)), CAST(0.00015842022046373200 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.93000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00001200183826126260 AS Decimal(38, 20)), CAST(0.00006315452114825800 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51617.93000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003448101563122120 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51623.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00007537828715302880 AS Decimal(38, 20)), CAST(0.00005469125502495620 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51623.54000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00017826825286181080 AS Decimal(38, 20)), CAST(0.00000806034217032620 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.29000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003100881168200120 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51620.29000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000651662228932450 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009998431713319540 AS Decimal(38, 20)), CAST(0.00001200183826126260 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51618.75000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51616.00000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.90000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51612.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.33000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005828667146073950 AS Decimal(38, 20)), CAST(0.00004992010688871150 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51610.46000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002986808420618410 AS Decimal(38, 20)), CAST(0.00005693382381318810 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.35000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00012826541491237730 AS Decimal(38, 20)), CAST(0.00004752053061850370 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013148736587329179 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51612.61000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001388541004335779 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00004793504841995170 AS Decimal(38, 20)), CAST(0.00001844334854671910 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.49000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00019073061383829038 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00009693273422165460 AS Decimal(38, 20)), CAST(0.00008578968610884140 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51615.98000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000546066221104030 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002890175023530710 AS Decimal(38, 20)), CAST(0.00005828667146073950 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.99000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00002985110414673190 AS Decimal(38, 20)), CAST(0.00002986808420618410 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00016922070792374258 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.51000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00015417504923146938 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007074978168623068 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00005043541539946370 AS Decimal(38, 20)), CAST(0.00012826541491237730 AS Decimal(38, 20)), N'amount > selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), N'51614.47000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003203672721611200 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51614.50000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002682598159966310 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(-1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'51615.97000000000000000000')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002434113324821980 AS Decimal(38, 20)), N'amount < selectedOrder')
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', CAST(997182.49232979011401877328 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-02T15:32:29.617' AS DateTime), CAST(N'2021-09-02T15:32:29.617' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (2, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', CAST(997012.93417129026063485179 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-02T15:32:29.637' AS DateTime), CAST(N'2021-09-02T15:32:29.637' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (3, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-02T15:32:40.250' AS DateTime), CAST(N'2021-09-02T15:32:40.250' AS DateTime), N'82200ad9b9c14a70b56f05aaa5bbddac')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (4, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(0.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-02T15:32:40.253' AS DateTime), CAST(N'2021-09-02T15:32:40.253' AS DateTime), N'1da7ca87befd4f27a155267a6fcbc14a')
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
CREATE PROCEDURE [dbo].[spCreate_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

insert into BTC_USDT_OpenOrders (IsBuy, Price, Amount, Total, CreateUserId)
values (@isBuy, @price, @amount, @total, @userid)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateBot]
@name nvarchar(450),
@botAuthCode nvarchar(450),
@userId nvarchar(450)
AS
BEGIN

insert into Bots (Name, BotAuthCode, UserId)
values (@name, @botAuthCode, @userId)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCreateEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20),
@comment nvarchar(450),
@whenDate datetime,
@currencyAcronim nvarchar(450)
AS
BEGIN

insert into Events (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@userid, @type, @value, @comment, @whenDate, @currencyAcronim)

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
CREATE PROCEDURE [dbo].[spDeleteBots_ById]
@id nvarchar(450)
AS
BEGIN

delete from Bots WHERE Id = @id

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
CREATE PROCEDURE [dbo].[spGetBots_ByBotAuthCode]
@botAuthCode nvarchar(450)
AS
BEGIN

SELECT * FROM Bots WHERE BotAuthCode = @botAuthCode
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetBots_ById]
@userid nvarchar(450)
AS
BEGIN

SELECT * FROM Bots WHERE UserId = @userid
	
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
CREATE PROCEDURE [dbo].[spProcess_BTC_USDT_Order]
@createUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@openOrderId bigint,
@createDate datetime,
@updatedOrderAmount decimal(38,20) OUTPUT
AS
BEGIN

SELECT TOP 1 *
INTO   #selectedOrder
FROM   BTC_USDT_OpenOrders
WHERE  IsBuy != @isBuy AND 
	   (( IsBuy = 1 AND @price >= Price ) OR 
	   ( IsBuy = 0 AND @price <= Price ))
ORDER  BY Price,
          CreateDate

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

IF NOT EXISTS(SELECT * FROM #selectedOrder)
BEGIN	
	SELECT 0
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amount = @amount - @selectOrderAmount;

	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO BTC_USDT_ClosedOrders (	
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
				(SELECT Price FROM #selectedOrder),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	IF ((SELECT IsBuy FROM #selectedOrder) = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'USDT' 
	END
 
	UPDATE [BTC_USDT_OpenOrders]
	SET    IsBuy = @isBuy,
		   Price = @price,
		   Amount = @amount,
		   CreateUserId = @createUserId
	WHERE  OpenOrderId = @openOrderId 	
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	SET @selectOrderAmount = @selectOrderAmount - @amount;

	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = @openOrderId
	
	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
				@total,
				@createDate,
				getdate(),
				@isBuy,
				@price,
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	IF (@isBuy = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'USDT' 
	END
	
	UPDATE [BTC_USDT_OpenOrders]
	SET    IsBuy = (SELECT IsBuy FROM #selectedOrder),
		   Price = (SELECT Price FROM #selectedOrder),
		   Amount = @selectOrderAmount,
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  OpenOrderId = (SELECT OpenOrderId FROM #selectedOrder)

	SET @amount = 0;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
				(SELECT Price FROM #selectedOrder),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)

	IF ((SELECT IsBuy FROM #selectedOrder) = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + (SELECT Total FROM #selectedOrder)
		WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
			AND CurrencyAcronim = 'USDT' 
	END
	
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = @openOrderId
	
	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, Price, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
				@total,
				@createDate,
				getdate(),
				@isBuy,
				@price,
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	IF (@isBuy = 1)
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'BTC'  			
	END
	ELSE
	BEGIN
		UPDATE Wallets 
		SET Value = Value + @total
		WHERE UserId = @createUserId 
			AND CurrencyAcronim = 'USDT' 
	END

	SET @amount = 0;
END
DROP TABLE #selectedOrder

SET @updatedOrderAmount = @amount;

SELECT @updatedOrderAmount

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
