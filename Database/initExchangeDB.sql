USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotAuthCodes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BotAuthCode] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BotAuthCodes] PRIMARY KEY CLUSTERED 
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
SET IDENTITY_INSERT [dbo].[BotAuthCodes] ON 
GO
INSERT [dbo].[BotAuthCodes] ([Id], [BotAuthCode], [UserId]) VALUES (1, N'51899c8f-a387-4d1f-9062-31b02c2350c4', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BotAuthCodes] ([Id], [BotAuthCode], [UserId]) VALUES (2, N'45f084a8-7f88-4195-8b5e-aaab76fc1982', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BotAuthCodes] ([Id], [BotAuthCode], [UserId]) VALUES (3, N'a0b54e9f-0f41-4245-b06d-de01fa85dd46', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BotAuthCodes] ([Id], [BotAuthCode], [UserId]) VALUES (4, N'34bb06b3-ae3d-459f-b445-645ba4587dc9', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BotAuthCodes] ([Id], [BotAuthCode], [UserId]) VALUES (5, N'ace9f8a1-6557-407a-9e8c-54d4855841ec', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
SET IDENTITY_INSERT [dbo].[BotAuthCodes] OFF
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (1, CAST(N'2021-08-31T23:47:18.607' AS DateTime), CAST(N'2021-08-31T23:48:25.607' AS DateTime), 0, CAST(47115.15000000000000000000 AS Decimal(38, 20)), CAST(0.00173778202665867000 AS Decimal(38, 20)), CAST(87.23958154107049297800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (2, CAST(N'2021-08-31T23:47:19.087' AS DateTime), CAST(N'2021-08-31T23:47:23.157' AS DateTime), 1, CAST(47113.18000000000000000000 AS Decimal(38, 20)), CAST(0.00052441992909853500 AS Decimal(38, 20)), CAST(43.96366028398014881882 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (3, CAST(N'2021-08-31T23:47:20.820' AS DateTime), CAST(N'2021-08-31T23:47:25.207' AS DateTime), 1, CAST(47113.00000000000000000000 AS Decimal(38, 20)), CAST(0.00045819031570953800 AS Decimal(38, 20)), CAST(21.58672034402346379400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (4, CAST(N'2021-08-31T23:47:21.130' AS DateTime), CAST(N'2021-08-31T23:47:28.900' AS DateTime), 1, CAST(47113.00000000000000000000 AS Decimal(38, 20)), CAST(0.00072179767448540600 AS Decimal(38, 20)), CAST(89.45553190902461782000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (5, CAST(N'2021-08-31T23:47:22.837' AS DateTime), CAST(N'2021-08-31T23:47:22.850' AS DateTime), 0, CAST(47111.13000000000000000000 AS Decimal(38, 20)), CAST(0.00025823939980857000 AS Decimal(38, 20)), CAST(12.16594993550351638410 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (6, CAST(N'2021-08-31T23:47:23.157' AS DateTime), CAST(N'2021-08-31T23:47:23.160' AS DateTime), 0, CAST(47111.11000000000000000000 AS Decimal(38, 20)), CAST(0.00015049059398029400 AS Decimal(38, 20)), CAST(38.88556281989522015653 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (7, CAST(N'2021-08-31T23:47:24.870' AS DateTime), CAST(N'2021-08-31T23:47:31.270' AS DateTime), 1, CAST(47106.91000000000000000000 AS Decimal(38, 20)), CAST(0.00007700403191941100 AS Decimal(38, 20)), CAST(30.43341814721848861534 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (8, CAST(N'2021-08-31T23:47:25.203' AS DateTime), CAST(N'2021-08-31T23:47:25.210' AS DateTime), 0, CAST(47106.91000000000000000000 AS Decimal(38, 20)), CAST(0.00056290808411450200 AS Decimal(38, 20)), CAST(48.10079042165506811640 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (9, CAST(N'2021-08-31T23:47:26.880' AS DateTime), CAST(N'2021-08-31T23:47:41.040' AS DateTime), 1, CAST(47100.91000000000000000000 AS Decimal(38, 20)), CAST(0.00093664073452196600 AS Decimal(38, 20)), CAST(104.16307952477324287170 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (10, CAST(N'2021-08-31T23:47:27.227' AS DateTime), CAST(N'2021-08-31T23:47:41.380' AS DateTime), 1, CAST(47100.91000000000000000000 AS Decimal(38, 20)), CAST(0.00011853433624772600 AS Decimal(38, 20)), CAST(61.08187513228672562970 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (11, CAST(N'2021-08-31T23:47:28.900' AS DateTime), CAST(N'2021-08-31T23:47:28.900' AS DateTime), 0, CAST(47100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00061403836529423200 AS Decimal(38, 20)), CAST(91.83908447897927700000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (12, CAST(N'2021-08-31T23:47:29.243' AS DateTime), CAST(N'2021-08-31T23:47:43.400' AS DateTime), 1, CAST(47100.01000000000000000000 AS Decimal(38, 20)), CAST(0.00066415191114142000 AS Decimal(38, 20)), CAST(104.26673147899983671640 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (13, CAST(N'2021-08-31T23:47:30.940' AS DateTime), CAST(N'2021-08-31T23:47:30.940' AS DateTime), 0, CAST(47099.99000000000000000000 AS Decimal(38, 20)), CAST(0.00056904594561506300 AS Decimal(38, 20)), CAST(26.80205834801001114937 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (14, CAST(N'2021-08-31T23:47:31.267' AS DateTime), CAST(N'2021-08-31T23:47:31.270' AS DateTime), 0, CAST(47099.99000000000000000000 AS Decimal(38, 20)), CAST(0.00028120083984974800 AS Decimal(38, 20)), CAST(16.87144587827867120841 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (15, CAST(N'2021-08-31T23:47:32.977' AS DateTime), CAST(N'2021-08-31T23:47:47.117' AS DateTime), 1, CAST(47095.00000000000000000000 AS Decimal(38, 20)), CAST(0.00021495377785291200 AS Decimal(38, 20)), CAST(10.12324816798289064000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (16, CAST(N'2021-08-31T23:47:33.290' AS DateTime), CAST(N'2021-08-31T23:47:33.293' AS DateTime), 0, CAST(47095.00000000000000000000 AS Decimal(38, 20)), CAST(0.00099364604921715600 AS Decimal(38, 20)), CAST(46.79576068788196182000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (17, CAST(N'2021-08-31T23:47:34.987' AS DateTime), CAST(N'2021-08-31T23:47:37.010' AS DateTime), 1, CAST(47110.37000000000000000000 AS Decimal(38, 20)), CAST(0.00035773157922445400 AS Decimal(38, 20)), CAST(46.01448626077360301049 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (18, CAST(N'2021-08-31T23:47:35.317' AS DateTime), CAST(N'2021-08-31T23:47:35.317' AS DateTime), 0, CAST(47110.37000000000000000000 AS Decimal(38, 20)), CAST(0.00061900637169322300 AS Decimal(38, 20)), CAST(29.16161920282526202251 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (19, CAST(N'2021-08-31T23:47:37.007' AS DateTime), CAST(N'2021-08-31T23:48:25.843' AS DateTime), 0, CAST(47104.76000000000000000000 AS Decimal(38, 20)), CAST(0.00054918512369002400 AS Decimal(38, 20)), CAST(70.50776083762376099480 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (20, CAST(N'2021-08-31T23:47:37.340' AS DateTime), CAST(N'2021-08-31T23:48:29.653' AS DateTime), 0, CAST(47104.76000000000000000000 AS Decimal(38, 20)), CAST(0.00004752836699948100 AS Decimal(38, 20)), CAST(2.23881232070247262956 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (21, CAST(N'2021-08-31T23:47:39.027' AS DateTime), CAST(N'2021-08-31T23:48:29.653' AS DateTime), 0, CAST(47103.14000000000000000000 AS Decimal(38, 20)), CAST(0.00017294685168796100 AS Decimal(38, 20)), CAST(81.89952143396302540240 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (22, CAST(N'2021-08-31T23:47:39.353' AS DateTime), CAST(N'2021-08-31T23:47:39.353' AS DateTime), 1, CAST(47103.14000000000000000000 AS Decimal(38, 20)), CAST(0.00101017042650383000 AS Decimal(38, 20)), CAST(47.58219902346961502620 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (23, CAST(N'2021-08-31T23:47:41.040' AS DateTime), CAST(N'2021-08-31T23:47:41.043' AS DateTime), 0, CAST(47095.27000000000000000000 AS Decimal(38, 20)), CAST(0.00117829570657494400 AS Decimal(38, 20)), CAST(99.60350272629807261570 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (24, CAST(N'2021-08-31T23:47:41.380' AS DateTime), CAST(N'2021-08-31T23:47:41.383' AS DateTime), 0, CAST(47094.32000000000000000000 AS Decimal(38, 20)), CAST(0.00013816605309870800 AS Decimal(38, 20)), CAST(12.08913028000555365488 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (25, CAST(N'2021-08-31T23:47:43.070' AS DateTime), CAST(N'2021-08-31T23:47:43.073' AS DateTime), 0, CAST(47089.96000000000000000000 AS Decimal(38, 20)), CAST(0.00058625940586731700 AS Decimal(38, 20)), CAST(27.60693197191572283732 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (26, CAST(N'2021-08-31T23:47:43.397' AS DateTime), CAST(N'2021-08-31T23:47:43.403' AS DateTime), 0, CAST(47089.96000000000000000000 AS Decimal(38, 20)), CAST(0.00082515318916419500 AS Decimal(38, 20)), CAST(108.98774827280177410760 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (27, CAST(N'2021-08-31T23:47:45.090' AS DateTime), CAST(N'2021-08-31T23:47:47.443' AS DateTime), 1, CAST(47094.52000000000000000000 AS Decimal(38, 20)), CAST(0.00031904188386120000 AS Decimal(38, 20)), CAST(73.46431878376597999520 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (28, CAST(N'2021-08-31T23:47:45.423' AS DateTime), CAST(N'2021-08-31T23:47:55.247' AS DateTime), 1, CAST(47094.53000000000000000000 AS Decimal(38, 20)), CAST(0.00169274841956456000 AS Decimal(38, 20)), CAST(95.13191771650949149950 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (29, CAST(N'2021-08-31T23:47:47.113' AS DateTime), CAST(N'2021-08-31T23:47:47.120' AS DateTime), 0, CAST(47091.79000000000000000000 AS Decimal(38, 20)), CAST(0.00048142090033806000 AS Decimal(38, 20)), CAST(32.79353010668683331988 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (30, CAST(N'2021-08-31T23:47:47.443' AS DateTime), CAST(N'2021-08-31T23:47:47.443' AS DateTime), 0, CAST(47091.79000000000000000000 AS Decimal(38, 20)), CAST(0.00075947070240950000 AS Decimal(38, 20)), CAST(86.55392305403735555800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (31, CAST(N'2021-08-31T23:47:49.200' AS DateTime), CAST(N'2021-08-31T23:47:57.557' AS DateTime), 1, CAST(47089.96000000000000000000 AS Decimal(38, 20)), CAST(0.00033339538175305000 AS Decimal(38, 20)), CAST(125.50107821211583506000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (32, CAST(N'2021-08-31T23:47:49.457' AS DateTime), CAST(N'2021-08-31T23:47:59.310' AS DateTime), 1, CAST(47089.96000000000000000000 AS Decimal(38, 20)), CAST(0.00044368450396866000 AS Decimal(38, 20)), CAST(91.14438142066174427000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (33, CAST(N'2021-08-31T23:47:51.473' AS DateTime), CAST(N'2021-08-31T23:47:55.530' AS DateTime), 1, CAST(47095.87000000000000000000 AS Decimal(38, 20)), CAST(0.00057639783065598000 AS Decimal(38, 20)), CAST(64.46674964284650809560 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (34, CAST(N'2021-08-31T23:47:53.230' AS DateTime), CAST(N'2021-08-31T23:48:31.690' AS DateTime), 0, CAST(47097.35000000000000000000 AS Decimal(38, 20)), CAST(0.00028165894690046900 AS Decimal(38, 20)), CAST(42.51135072958207107765 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (35, CAST(N'2021-08-31T23:47:53.497' AS DateTime), CAST(N'2021-08-31T23:47:53.497' AS DateTime), 1, CAST(47097.36000000000000000000 AS Decimal(38, 20)), CAST(0.00062096828647003000 AS Decimal(38, 20)), CAST(29.24596693646213212080 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (36, CAST(N'2021-08-31T23:47:55.247' AS DateTime), CAST(N'2021-08-31T23:47:55.250' AS DateTime), 0, CAST(47094.05000000000000000000 AS Decimal(38, 20)), CAST(0.00032727211607959000 AS Decimal(38, 20)), CAST(110.54351750491039774700 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37, CAST(N'2021-08-31T23:47:55.530' AS DateTime), CAST(N'2021-08-31T23:47:55.533' AS DateTime), 0, CAST(47094.05000000000000000000 AS Decimal(38, 20)), CAST(0.00079244299642390000 AS Decimal(38, 20)), CAST(101.78360844827819050900 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38, CAST(N'2021-08-31T23:47:57.277' AS DateTime), CAST(N'2021-08-31T23:47:57.283' AS DateTime), 0, CAST(47085.59000000000000000000 AS Decimal(38, 20)), CAST(0.00233173914399545000 AS Decimal(38, 20)), CAST(109.79131332112072056550 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (39, CAST(N'2021-08-31T23:47:57.557' AS DateTime), CAST(N'2021-08-31T23:47:57.560' AS DateTime), 0, CAST(47085.59000000000000000000 AS Decimal(38, 20)), CAST(0.00149185295286209000 AS Decimal(38, 20)), CAST(85.94289473187128983260 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (40, CAST(N'2021-08-31T23:47:59.307' AS DateTime), CAST(N'2021-08-31T23:48:01.347' AS DateTime), 0, CAST(47078.56000000000000000000 AS Decimal(38, 20)), CAST(0.00042092047283468600 AS Decimal(38, 20)), CAST(117.22402499093870552320 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (41, CAST(N'2021-08-31T23:47:59.587' AS DateTime), CAST(N'2021-08-31T23:47:59.587' AS DateTime), 1, CAST(47081.99000000000000000000 AS Decimal(38, 20)), CAST(0.00068568401498984700 AS Decimal(38, 20)), CAST(32.28336793691182655553 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (42, CAST(N'2021-08-31T23:48:01.347' AS DateTime), CAST(N'2021-08-31T23:48:01.347' AS DateTime), 1, CAST(47091.99000000000000000000 AS Decimal(38, 20)), CAST(0.00093967724742352700 AS Decimal(38, 20)), CAST(108.32452577531882326260 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (43, CAST(N'2021-08-31T23:48:01.600' AS DateTime), CAST(N'2021-08-31T23:48:31.690' AS DateTime), 0, CAST(47091.98000000000000000000 AS Decimal(38, 20)), CAST(0.00046491777243321500 AS Decimal(38, 20)), CAST(24.20877565869549975500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (44, CAST(N'2021-08-31T23:48:03.370' AS DateTime), CAST(N'2021-08-31T23:48:03.630' AS DateTime), 1, CAST(47086.20000000000000000000 AS Decimal(38, 20)), CAST(0.00039298666738578200 AS Decimal(38, 20)), CAST(33.34596950606095026720 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (45, CAST(N'2021-08-31T23:48:03.633' AS DateTime), CAST(N'2021-08-31T23:48:03.633' AS DateTime), 0, CAST(47086.19000000000000000000 AS Decimal(38, 20)), CAST(0.00031520319516547400 AS Decimal(38, 20)), CAST(48.18767996033091495870 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (46, CAST(N'2021-08-31T23:48:05.653' AS DateTime), CAST(N'2021-08-31T23:48:15.487' AS DateTime), 1, CAST(47086.20000000000000000000 AS Decimal(38, 20)), CAST(0.00110493998895629400 AS Decimal(38, 20)), CAST(73.39698084201055347600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (47, CAST(N'2021-08-31T23:48:09.423' AS DateTime), CAST(N'2021-08-31T23:48:15.737' AS DateTime), 1, CAST(47088.67000000000000000000 AS Decimal(38, 20)), CAST(0.00138167101800519000 AS Decimal(38, 20)), CAST(66.33063777452951586510 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (48, CAST(N'2021-08-31T23:48:09.693' AS DateTime), CAST(N'2021-08-31T23:49:20.300' AS DateTime), 1, CAST(47088.67000000000000000000 AS Decimal(38, 20)), CAST(0.00022533063265743200 AS Decimal(38, 20)), CAST(10.61051980209703849544 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (49, CAST(N'2021-08-31T23:48:13.467' AS DateTime), CAST(N'2021-08-31T23:48:13.467' AS DateTime), 0, CAST(47084.20000000000000000000 AS Decimal(38, 20)), CAST(0.00005696670345820800 AS Decimal(38, 20)), CAST(2.68223165896695711360 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (50, CAST(N'2021-08-31T23:48:13.713' AS DateTime), CAST(N'2021-08-31T23:49:26.367' AS DateTime), 1, CAST(47083.34000000000000000000 AS Decimal(38, 20)), CAST(0.00088320078723281200 AS Decimal(38, 20)), CAST(119.85203549973565558360 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (51, CAST(N'2021-08-31T23:48:15.483' AS DateTime), CAST(N'2021-08-31T23:48:15.490' AS DateTime), 0, CAST(47086.17000000000000000000 AS Decimal(38, 20)), CAST(0.00039687233078147800 AS Decimal(38, 20)), CAST(89.40178823073999377250 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (52, CAST(N'2021-08-31T23:48:15.733' AS DateTime), CAST(N'2021-08-31T23:48:15.737' AS DateTime), 0, CAST(47086.17000000000000000000 AS Decimal(38, 20)), CAST(0.00002696162705634000 AS Decimal(38, 20)), CAST(67.59663594796828685790 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (53, CAST(N'2021-08-31T23:48:17.500' AS DateTime), CAST(N'2021-08-31T23:48:31.903' AS DateTime), 0, CAST(47091.08000000000000000000 AS Decimal(38, 20)), CAST(0.00029111306480649500 AS Decimal(38, 20)), CAST(13.70882862384784056460 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (54, CAST(N'2021-08-31T23:48:17.753' AS DateTime), CAST(N'2021-08-31T23:48:31.907' AS DateTime), 0, CAST(47091.08000000000000000000 AS Decimal(38, 20)), CAST(0.00150108343991501500 AS Decimal(38, 20)), CAST(84.20801231183543926320 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (55, CAST(N'2021-08-31T23:48:19.533' AS DateTime), CAST(N'2021-08-31T23:48:33.710' AS DateTime), 0, CAST(47100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001257105307307610 AS Decimal(38, 20)), CAST(0.59209659974188431000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (56, CAST(N'2021-08-31T23:48:19.767' AS DateTime), CAST(N'2021-08-31T23:48:33.713' AS DateTime), 0, CAST(47111.08000000000000000000 AS Decimal(38, 20)), CAST(0.00084145440205068100 AS Decimal(38, 20)), CAST(39.64182565136179664548 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (57, CAST(N'2021-08-31T23:48:21.560' AS DateTime), CAST(N'2021-08-31T23:48:33.713' AS DateTime), 0, CAST(47111.10000000000000000000 AS Decimal(38, 20)), CAST(0.00145321583340560710 AS Decimal(38, 20)), CAST(71.52470716197995343900 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (58, CAST(N'2021-08-31T23:48:21.777' AS DateTime), CAST(N'2021-08-31T23:48:21.777' AS DateTime), 1, CAST(47111.10000000000000000000 AS Decimal(38, 20)), CAST(0.00020148992636310400 AS Decimal(38, 20)), CAST(9.49241206988482885440 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (59, CAST(N'2021-08-31T23:48:23.583' AS DateTime), CAST(N'2021-08-31T23:48:37.763' AS DateTime), 0, CAST(47111.09000000000000000000 AS Decimal(38, 20)), CAST(0.00113121139897556000 AS Decimal(38, 20)), CAST(61.83258567458613943380 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (60, CAST(N'2021-08-31T23:48:23.810' AS DateTime), CAST(N'2021-08-31T23:48:37.993' AS DateTime), 0, CAST(47111.08000000000000000000 AS Decimal(38, 20)), CAST(0.00064378111033876500 AS Decimal(38, 20)), CAST(30.32922339165838501620 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (61, CAST(N'2021-08-31T23:48:25.607' AS DateTime), CAST(N'2021-08-31T23:48:25.610' AS DateTime), 1, CAST(47117.54000000000000000000 AS Decimal(38, 20)), CAST(0.00011384280189585000 AS Decimal(38, 20)), CAST(92.60799969645052648980 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (62, CAST(N'2021-08-31T23:48:25.843' AS DateTime), CAST(N'2021-08-31T23:48:25.843' AS DateTime), 1, CAST(47117.55000000000000000000 AS Decimal(38, 20)), CAST(0.00038842215910014800 AS Decimal(38, 20)), CAST(62.47925852973924711600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (63, CAST(N'2021-08-31T23:48:27.633' AS DateTime), CAST(N'2021-08-31T23:48:51.930' AS DateTime), 0, CAST(47116.21000000000000000000 AS Decimal(38, 20)), CAST(0.00032472372163307100 AS Decimal(38, 20)), CAST(15.29975106044531618091 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (64, CAST(N'2021-08-31T23:48:27.867' AS DateTime), CAST(N'2021-08-31T23:48:51.933' AS DateTime), 0, CAST(47116.20000000000000000000 AS Decimal(38, 20)), CAST(0.00037350433490867900 AS Decimal(38, 20)), CAST(17.59810494442430149980 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (65, CAST(N'2021-08-31T23:48:29.653' AS DateTime), CAST(N'2021-08-31T23:48:29.660' AS DateTime), 1, CAST(47113.21000000000000000000 AS Decimal(38, 20)), CAST(0.00055561014919336900 AS Decimal(38, 20)), CAST(62.74045055197442791780 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (66, CAST(N'2021-08-31T23:48:29.880' AS DateTime), CAST(N'2021-08-31T23:48:51.933' AS DateTime), 0, CAST(47117.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001433694824312670 AS Decimal(38, 20)), CAST(0.67551399037140072390 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (67, CAST(N'2021-08-31T23:48:31.687' AS DateTime), CAST(N'2021-08-31T23:48:31.693' AS DateTime), 1, CAST(47125.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004915650642903500 AS Decimal(38, 20)), CAST(39.81542862953640725000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (68, CAST(N'2021-08-31T23:48:31.903' AS DateTime), CAST(N'2021-08-31T23:48:31.907' AS DateTime), 1, CAST(47125.00000000000000000000 AS Decimal(38, 20)), CAST(0.00028711110376152500 AS Decimal(38, 20)), CAST(111.51748181452489000000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (69, CAST(N'2021-08-31T23:48:33.713' AS DateTime), CAST(N'2021-08-31T23:48:33.717' AS DateTime), 1, CAST(47118.63000000000000000000 AS Decimal(38, 20)), CAST(0.00006499764838488290 AS Decimal(38, 20)), CAST(114.83924888517314579190 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (70, CAST(N'2021-08-31T23:48:33.927' AS DateTime), CAST(N'2021-08-31T23:49:04.120' AS DateTime), 1, CAST(47110.84000000000000000000 AS Decimal(38, 20)), CAST(0.00056766112612917100 AS Decimal(38, 20)), CAST(26.74299248729119431364 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (71, CAST(N'2021-08-31T23:48:35.743' AS DateTime), CAST(N'2021-08-31T23:48:39.783' AS DateTime), 0, CAST(47115.16000000000000000000 AS Decimal(38, 20)), CAST(0.00100288009941713000 AS Decimal(38, 20)), CAST(72.19749144244201284080 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (72, CAST(N'2021-08-31T23:48:35.950' AS DateTime), CAST(N'2021-08-31T23:48:44.080' AS DateTime), 0, CAST(47115.16000000000000000000 AS Decimal(38, 20)), CAST(0.00096251723117312000 AS Decimal(38, 20)), CAST(63.36983398794997400680 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (73, CAST(N'2021-08-31T23:48:37.760' AS DateTime), CAST(N'2021-08-31T23:48:37.763' AS DateTime), 1, CAST(47115.15000000000000000000 AS Decimal(38, 20)), CAST(0.00018127331905126000 AS Decimal(38, 20)), CAST(70.37863398063930091200 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (74, CAST(N'2021-08-31T23:48:37.990' AS DateTime), CAST(N'2021-08-31T23:49:04.123' AS DateTime), 1, CAST(47115.15000000000000000000 AS Decimal(38, 20)), CAST(0.00063416943067413100 AS Decimal(38, 20)), CAST(80.41908503310336030150 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (75, CAST(N'2021-08-31T23:48:39.780' AS DateTime), CAST(N'2021-08-31T23:48:39.783' AS DateTime), 1, CAST(47115.16000000000000000000 AS Decimal(38, 20)), CAST(0.00052948212629625000 AS Decimal(38, 20)), CAST(97.14412654003003899080 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (76, CAST(N'2021-08-31T23:48:40.013' AS DateTime), CAST(N'2021-08-31T23:48:52.180' AS DateTime), 0, CAST(47115.16000000000000000000 AS Decimal(38, 20)), CAST(0.00013253986152473340 AS Decimal(38, 20)), CAST(100.75352979131971469560 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (77, CAST(N'2021-08-31T23:48:41.797' AS DateTime), CAST(N'2021-08-31T23:49:04.270' AS DateTime), 1, CAST(47112.09000000000000000000 AS Decimal(38, 20)), CAST(0.00049609614764158400 AS Decimal(38, 20)), CAST(23.37212635634359315056 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (78, CAST(N'2021-08-31T23:48:42.050' AS DateTime), CAST(N'2021-08-31T23:49:04.273' AS DateTime), 1, CAST(47112.09000000000000000000 AS Decimal(38, 20)), CAST(0.00133403805868423400 AS Decimal(38, 20)), CAST(66.27477141563520302940 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (79, CAST(N'2021-08-31T23:48:43.830' AS DateTime), CAST(N'2021-08-31T23:49:12.213' AS DateTime), 1, CAST(47115.15000000000000000000 AS Decimal(38, 20)), CAST(0.00021036193115188400 AS Decimal(38, 20)), CAST(91.08806492583353110650 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (80, CAST(N'2021-08-31T23:48:44.080' AS DateTime), CAST(N'2021-08-31T23:48:44.083' AS DateTime), 1, CAST(47115.16000000000000000000 AS Decimal(38, 20)), CAST(0.00038248157574911000 AS Decimal(38, 20)), CAST(81.39051462642141151440 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (81, CAST(N'2021-08-31T23:48:45.867' AS DateTime), CAST(N'2021-08-31T23:48:54.193' AS DateTime), 0, CAST(47115.19000000000000000000 AS Decimal(38, 20)), CAST(0.00001576946411084900 AS Decimal(38, 20)), CAST(42.67814734316817285168 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (82, CAST(N'2021-08-31T23:48:46.100' AS DateTime), CAST(N'2021-08-31T23:48:54.197' AS DateTime), 0, CAST(47115.19000000000000000000 AS Decimal(38, 20)), CAST(0.00020546128759415900 AS Decimal(38, 20)), CAST(62.88006703845916370270 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (87, CAST(N'2021-08-31T23:48:51.930' AS DateTime), CAST(N'2021-08-31T23:48:51.937' AS DateTime), 1, CAST(47121.94000000000000000000 AS Decimal(38, 20)), CAST(0.00093185938723937330 AS Decimal(38, 20)), CAST(77.48846753550318704500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (88, CAST(N'2021-08-31T23:48:52.177' AS DateTime), CAST(N'2021-08-31T23:48:52.180' AS DateTime), 1, CAST(47121.94000000000000000000 AS Decimal(38, 20)), CAST(0.00107405321093930330 AS Decimal(38, 20)), CAST(107.46847732775518327960 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (89, CAST(N'2021-08-31T23:48:53.977' AS DateTime), CAST(N'2021-08-31T23:48:53.977' AS DateTime), 1, CAST(47115.50000000000000000000 AS Decimal(38, 20)), CAST(0.00089005618029742300 AS Decimal(38, 20)), CAST(41.93544196280323335650 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (90, CAST(N'2021-08-31T23:48:54.193' AS DateTime), CAST(N'2021-08-31T23:48:54.197' AS DateTime), 1, CAST(47115.97000000000000000000 AS Decimal(38, 20)), CAST(0.00112914156635717100 AS Decimal(38, 20)), CAST(116.82470179288556201950 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (91, CAST(N'2021-08-31T23:48:55.997' AS DateTime), CAST(N'2021-08-31T23:49:00.033' AS DateTime), 0, CAST(47119.16000000000000000000 AS Decimal(38, 20)), CAST(0.00063890391389788000 AS Decimal(38, 20)), CAST(39.06551406075223166580 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (93, CAST(N'2021-08-31T23:49:00.030' AS DateTime), CAST(N'2021-08-31T23:49:00.040' AS DateTime), 1, CAST(47119.17000000000000000000 AS Decimal(38, 20)), CAST(0.00019017525603537500 AS Decimal(38, 20)), CAST(48.02642257046829163710 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (94, CAST(N'2021-08-31T23:49:02.087' AS DateTime), CAST(N'2021-08-31T23:49:12.213' AS DateTime), 1, CAST(47102.80000000000000000000 AS Decimal(38, 20)), CAST(0.00083108244688767400 AS Decimal(38, 20)), CAST(55.65041437164547186400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (95, CAST(N'2021-08-31T23:49:02.257' AS DateTime), CAST(N'2021-08-31T23:49:16.243' AS DateTime), 1, CAST(47102.80000000000000000000 AS Decimal(38, 20)), CAST(0.00049531137393569200 AS Decimal(38, 20)), CAST(24.70535306899991339680 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (96, CAST(N'2021-08-31T23:49:04.120' AS DateTime), CAST(N'2021-08-31T23:49:04.127' AS DateTime), 0, CAST(47097.16000000000000000000 AS Decimal(38, 20)), CAST(0.00042891200814811400 AS Decimal(38, 20)), CAST(97.00388097400026033480 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (97, CAST(N'2021-08-31T23:49:04.273' AS DateTime), CAST(N'2021-08-31T23:49:04.273' AS DateTime), 0, CAST(47097.16000000000000000000 AS Decimal(38, 20)), CAST(0.00007270851986142600 AS Decimal(38, 20)), CAST(93.04285312335357877720 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (98, CAST(N'2021-08-31T23:49:06.163' AS DateTime), CAST(N'2021-08-31T23:49:16.383' AS DateTime), 1, CAST(47097.17000000000000000000 AS Decimal(38, 20)), CAST(0.00014056994395357100 AS Decimal(38, 20)), CAST(6.62044654727180549407 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (99, CAST(N'2021-08-31T23:49:06.287' AS DateTime), CAST(N'2021-08-31T23:49:16.387' AS DateTime), 1, CAST(47097.17000000000000000000 AS Decimal(38, 20)), CAST(0.00165172239986794100 AS Decimal(38, 20)), CAST(97.79700719297276786360 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (100, CAST(N'2021-08-31T23:49:10.197' AS DateTime), CAST(N'2021-08-31T23:49:10.197' AS DateTime), 0, CAST(47097.16000000000000000000 AS Decimal(38, 20)), CAST(0.00100905610947360000 AS Decimal(38, 20)), CAST(47.52367703685565497600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (101, CAST(N'2021-08-31T23:49:10.340' AS DateTime), CAST(N'2021-08-31T23:49:10.340' AS DateTime), 0, CAST(47097.16000000000000000000 AS Decimal(38, 20)), CAST(0.00071388929100422600 AS Decimal(38, 20)), CAST(33.62215816071259259816 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (102, CAST(N'2021-08-31T23:49:12.213' AS DateTime), CAST(N'2021-08-31T23:49:12.217' AS DateTime), 0, CAST(47093.48000000000000000000 AS Decimal(38, 20)), CAST(0.00035038477738870600 AS Decimal(38, 20)), CAST(82.04691700083732035560 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (103, CAST(N'2021-08-31T23:49:12.353' AS DateTime), CAST(N'2021-08-31T23:49:26.370' AS DateTime), 1, CAST(47093.48000000000000000000 AS Decimal(38, 20)), CAST(0.00048809404735830300 AS Decimal(38, 20)), CAST(22.98604725738729516444 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (104, CAST(N'2021-08-31T23:49:14.230' AS DateTime), CAST(N'2021-08-31T23:49:26.477' AS DateTime), 1, CAST(47097.16000000000000000000 AS Decimal(38, 20)), CAST(0.00011323668719886000 AS Decimal(38, 20)), CAST(103.11007506435816952640 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (105, CAST(N'2021-08-31T23:49:14.373' AS DateTime), CAST(N'2021-08-31T23:49:36.493' AS DateTime), 1, CAST(47097.16000000000000000000 AS Decimal(38, 20)), CAST(0.00076209129395993000 AS Decimal(38, 20)), CAST(47.71730579638870435720 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (106, CAST(N'2021-08-31T23:49:16.243' AS DateTime), CAST(N'2021-08-31T23:49:16.247' AS DateTime), 0, CAST(47093.47000000000000000000 AS Decimal(38, 20)), CAST(0.00002918723483066400 AS Decimal(38, 20)), CAST(26.07498766486095345940 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (107, CAST(N'2021-08-31T23:49:16.383' AS DateTime), CAST(N'2021-08-31T23:49:16.390' AS DateTime), 0, CAST(47093.47000000000000000000 AS Decimal(38, 20)), CAST(0.00042477194560913900 AS Decimal(38, 20)), CAST(124.41323547975929917130 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (108, CAST(N'2021-08-31T23:49:18.263' AS DateTime), CAST(N'2021-08-31T23:49:36.580' AS DateTime), 1, CAST(47087.17000000000000000000 AS Decimal(38, 20)), CAST(0.00109213849934384000 AS Decimal(38, 20)), CAST(60.47172235278684736330 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (109, CAST(N'2021-08-31T23:49:18.410' AS DateTime), CAST(N'2021-08-31T23:49:54.653' AS DateTime), 1, CAST(47087.17000000000000000000 AS Decimal(38, 20)), CAST(0.00000744421631445000 AS Decimal(38, 20)), CAST(114.24996395455237454470 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (110, CAST(N'2021-08-31T23:49:20.300' AS DateTime), CAST(N'2021-08-31T23:49:20.300' AS DateTime), 0, CAST(47082.49000000000000000000 AS Decimal(38, 20)), CAST(0.00034878796071223400 AS Decimal(38, 20)), CAST(27.03093293114136574834 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (111, CAST(N'2021-08-31T23:49:20.427' AS DateTime), CAST(N'2021-08-31T23:49:20.427' AS DateTime), 0, CAST(47082.49000000000000000000 AS Decimal(38, 20)), CAST(0.00034535825440909600 AS Decimal(38, 20)), CAST(16.26032655963371832904 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (112, CAST(N'2021-08-31T23:49:22.450' AS DateTime), CAST(N'2021-08-31T23:49:54.657' AS DateTime), 1, CAST(47082.50000000000000000000 AS Decimal(38, 20)), CAST(0.00011146690324482800 AS Decimal(38, 20)), CAST(5.24814047202461431000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (113, CAST(N'2021-08-31T23:49:24.343' AS DateTime), CAST(N'2021-08-31T23:49:24.343' AS DateTime), 0, CAST(47082.50000000000000000000 AS Decimal(38, 20)), CAST(0.00096818259473339800 AS Decimal(38, 20)), CAST(45.58445701653521133500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (114, CAST(N'2021-08-31T23:49:26.367' AS DateTime), CAST(N'2021-08-31T23:49:26.370' AS DateTime), 0, CAST(47082.49000000000000000000 AS Decimal(38, 20)), CAST(0.00091370950076436500 AS Decimal(38, 20)), CAST(107.58369376933103354520 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (115, CAST(N'2021-08-31T23:49:26.477' AS DateTime), CAST(N'2021-08-31T23:49:26.480' AS DateTime), 0, CAST(47082.49000000000000000000 AS Decimal(38, 20)), CAST(0.00116235938936581500 AS Decimal(38, 20)), CAST(114.78501384511763612010 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (116, CAST(N'2021-08-31T23:49:30.427' AS DateTime), CAST(N'2021-08-31T23:49:54.657' AS DateTime), 1, CAST(47082.47000000000000000000 AS Decimal(38, 20)), CAST(0.00063086477649904100 AS Decimal(38, 20)), CAST(29.70267191357280291127 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (117, CAST(N'2021-08-31T23:49:30.527' AS DateTime), CAST(N'2021-08-31T23:49:56.693' AS DateTime), 1, CAST(47082.47000000000000000000 AS Decimal(38, 20)), CAST(0.00094913979417139900 AS Decimal(38, 20)), CAST(97.12998725463818021860 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (118, CAST(N'2021-08-31T23:49:32.453' AS DateTime), CAST(N'2021-08-31T23:49:56.857' AS DateTime), 1, CAST(47082.48000000000000000000 AS Decimal(38, 20)), CAST(0.00064927017984412900 AS Decimal(38, 20)), CAST(102.35159761516396470720 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (119, CAST(N'2021-08-31T23:49:32.543' AS DateTime), CAST(N'2021-08-31T23:49:56.857' AS DateTime), 1, CAST(47082.48000000000000000000 AS Decimal(38, 20)), CAST(0.00043420569674773400 AS Decimal(38, 20)), CAST(20.44348103301125110032 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (120, CAST(N'2021-08-31T23:49:34.463' AS DateTime), CAST(N'2021-08-31T23:49:56.857' AS DateTime), 1, CAST(47082.49000000000000000000 AS Decimal(38, 20)), CAST(0.00010215526344355000 AS Decimal(38, 20)), CAST(4.80972416952830843950 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (121, CAST(N'2021-08-31T23:49:34.557' AS DateTime), CAST(N'2021-08-31T23:49:56.860' AS DateTime), 1, CAST(47080.03000000000000000000 AS Decimal(38, 20)), CAST(0.00078777854274389300 AS Decimal(38, 20)), CAST(50.37151524416108616610 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (122, CAST(N'2021-08-31T23:49:36.493' AS DateTime), CAST(N'2021-08-31T23:49:36.497' AS DateTime), 0, CAST(47080.00000000000000000000 AS Decimal(38, 20)), CAST(0.00025107607741424000 AS Decimal(38, 20)), CAST(59.52058156895834280000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (123, CAST(N'2021-08-31T23:49:36.580' AS DateTime), CAST(N'2021-08-31T23:49:36.587' AS DateTime), 0, CAST(47080.00000000000000000000 AS Decimal(38, 20)), CAST(0.00019211201630165000 AS Decimal(38, 20)), CAST(69.50714800407135120000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (124, CAST(N'2021-08-31T23:49:40.533' AS DateTime), CAST(N'2021-08-31T23:51:01.693' AS DateTime), 1, CAST(47072.12000000000000000000 AS Decimal(38, 20)), CAST(0.00025357137418052600 AS Decimal(38, 20)), CAST(125.10464190253710973360 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (125, CAST(N'2021-08-31T23:49:40.627' AS DateTime), CAST(N'2021-08-31T23:51:36.080' AS DateTime), 1, CAST(47072.12000000000000000000 AS Decimal(38, 20)), CAST(0.00043910202530170700 AS Decimal(38, 20)), CAST(114.78922247188908975040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (126, CAST(N'2021-08-31T23:49:42.553' AS DateTime), CAST(N'2021-08-31T23:51:54.077' AS DateTime), 1, CAST(47072.11000000000000000000 AS Decimal(38, 20)), CAST(0.00079871484558037794 AS Decimal(38, 20)), CAST(106.97458634509027739700 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (127, CAST(N'2021-08-31T23:49:42.650' AS DateTime), CAST(N'2021-08-31T23:51:54.080' AS DateTime), 1, CAST(47072.11000000000000000000 AS Decimal(38, 20)), CAST(0.00032574438095360300 AS Decimal(38, 20)), CAST(15.33347533212990531233 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (128, CAST(N'2021-08-31T23:49:44.670' AS DateTime), CAST(N'2021-08-31T23:49:44.670' AS DateTime), 0, CAST(47071.43000000000000000000 AS Decimal(38, 20)), CAST(0.00031229081280170500 AS Decimal(38, 20)), CAST(14.69997513443856078815 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (129, CAST(N'2021-08-31T23:49:46.573' AS DateTime), CAST(N'2021-08-31T23:49:46.573' AS DateTime), 0, CAST(47071.43000000000000000000 AS Decimal(38, 20)), CAST(0.00118236394039465000 AS Decimal(38, 20)), CAST(55.65556145481093984950 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (130, CAST(N'2021-08-31T23:49:48.587' AS DateTime), CAST(N'2021-08-31T23:52:00.350' AS DateTime), 1, CAST(47069.92000000000000000000 AS Decimal(38, 20)), CAST(0.00000218977891010688 AS Decimal(38, 20)), CAST(0.10307271811641803305 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (131, CAST(N'2021-08-31T23:49:48.713' AS DateTime), CAST(N'2021-08-31T23:52:00.353' AS DateTime), 1, CAST(47069.92000000000000000000 AS Decimal(38, 20)), CAST(0.00016290121365473700 AS Decimal(38, 20)), CAST(7.66774709463137821104 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (132, CAST(N'2021-08-31T23:49:50.610' AS DateTime), CAST(N'2021-08-31T23:51:58.113' AS DateTime), 1, CAST(47072.00000000000000000000 AS Decimal(38, 20)), CAST(0.00035552620368801400 AS Decimal(38, 20)), CAST(16.73532946000219500800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (133, CAST(N'2021-08-31T23:49:50.733' AS DateTime), CAST(N'2021-08-31T23:51:58.117' AS DateTime), 1, CAST(47072.10000000000000000000 AS Decimal(38, 20)), CAST(0.00038873984622244394 AS Decimal(38, 20)), CAST(95.56823614022750461800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (134, CAST(N'2021-08-31T23:49:52.627' AS DateTime), CAST(N'2021-08-31T23:49:52.630' AS DateTime), 0, CAST(47072.10000000000000000000 AS Decimal(38, 20)), CAST(0.00092425122215610500 AS Decimal(38, 20)), CAST(43.50644595445439017050 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (135, CAST(N'2021-08-31T23:49:52.780' AS DateTime), CAST(N'2021-08-31T23:51:58.117' AS DateTime), 1, CAST(47072.11000000000000000000 AS Decimal(38, 20)), CAST(0.00036398023900760794 AS Decimal(38, 20)), CAST(47.71187136197428530210 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (136, CAST(N'2021-08-31T23:49:54.653' AS DateTime), CAST(N'2021-08-31T23:49:54.660' AS DateTime), 0, CAST(47074.37000000000000000000 AS Decimal(38, 20)), CAST(0.00111383581553298100 AS Decimal(38, 20)), CAST(87.72834724778214498100 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (137, CAST(N'2021-08-31T23:49:54.827' AS DateTime), CAST(N'2021-08-31T23:50:29.110' AS DateTime), 1, CAST(47074.38000000000000000000 AS Decimal(38, 20)), CAST(0.00084650880659302200 AS Decimal(38, 20)), CAST(39.84887723490642297636 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (138, CAST(N'2021-08-31T23:49:56.693' AS DateTime), CAST(N'2021-08-31T23:49:56.697' AS DateTime), 0, CAST(47074.53000000000000000000 AS Decimal(38, 20)), CAST(0.00152460846068551100 AS Decimal(38, 20)), CAST(116.45053643570925550230 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (139, CAST(N'2021-08-31T23:49:56.853' AS DateTime), CAST(N'2021-08-31T23:49:56.860' AS DateTime), 0, CAST(47074.53000000000000000000 AS Decimal(38, 20)), CAST(0.00028213401347497700 AS Decimal(38, 20)), CAST(119.45998547698134174780 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (140, CAST(N'2021-08-31T23:49:58.913' AS DateTime), CAST(N'2021-08-31T23:50:13.117' AS DateTime), 0, CAST(47074.52000000000000000000 AS Decimal(38, 20)), CAST(0.00001621534908945900 AS Decimal(38, 20)), CAST(98.17922120995561406360 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (141, CAST(N'2021-08-31T23:50:00.737' AS DateTime), CAST(N'2021-08-31T23:50:13.120' AS DateTime), 0, CAST(47074.52000000000000000000 AS Decimal(38, 20)), CAST(0.00115737329565796900 AS Decimal(38, 20)), CAST(60.61804857723439865160 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (142, CAST(N'2021-08-31T23:50:00.940' AS DateTime), CAST(N'2021-08-31T23:50:00.943' AS DateTime), 1, CAST(47074.53000000000000000000 AS Decimal(38, 20)), CAST(0.00036017387637876600 AS Decimal(38, 20)), CAST(16.95501594880851142998 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (143, CAST(N'2021-08-31T23:50:04.767' AS DateTime), CAST(N'2021-08-31T23:50:20.980' AS DateTime), 0, CAST(47080.00000000000000000000 AS Decimal(38, 20)), CAST(0.00111078433339055000 AS Decimal(38, 20)), CAST(120.25625999895112440000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (144, CAST(N'2021-08-31T23:50:04.997' AS DateTime), CAST(N'2021-08-31T23:50:20.980' AS DateTime), 0, CAST(47079.99000000000000000000 AS Decimal(38, 20)), CAST(0.00031593758692775700 AS Decimal(38, 20)), CAST(14.87433843318293028243 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (145, CAST(N'2021-08-31T23:50:06.803' AS DateTime), CAST(N'2021-08-31T23:51:19.900' AS DateTime), 0, CAST(47079.99000000000000000000 AS Decimal(38, 20)), CAST(0.00060050429441057588 AS Decimal(38, 20)), CAST(100.47602571932626989750 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (146, CAST(N'2021-08-31T23:50:10.860' AS DateTime), CAST(N'2021-08-31T23:50:10.863' AS DateTime), 1, CAST(47082.46000000000000000000 AS Decimal(38, 20)), CAST(0.00071761226668842700 AS Decimal(38, 20)), CAST(33.78695084186719669042 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (147, CAST(N'2021-08-31T23:50:11.097' AS DateTime), CAST(N'2021-08-31T23:50:11.097' AS DateTime), 1, CAST(47082.47000000000000000000 AS Decimal(38, 20)), CAST(0.00099161130240727800 AS Decimal(38, 20)), CAST(46.68750939725159421666 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (148, CAST(N'2021-08-31T23:50:13.117' AS DateTime), CAST(N'2021-08-31T23:50:13.120' AS DateTime), 1, CAST(47082.46000000000000000000 AS Decimal(38, 20)), CAST(0.00013033072293286100 AS Decimal(38, 20)), CAST(67.52802252129001034900 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (149, CAST(N'2021-08-31T23:50:19.193' AS DateTime), CAST(N'2021-08-31T23:50:19.193' AS DateTime), 1, CAST(47080.00000000000000000000 AS Decimal(38, 20)), CAST(0.00144351175834588000 AS Decimal(38, 20)), CAST(67.96053358292403040000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (150, CAST(N'2021-08-31T23:50:20.977' AS DateTime), CAST(N'2021-08-31T23:50:20.983' AS DateTime), 1, CAST(47080.00000000000000000000 AS Decimal(38, 20)), CAST(0.00116691191194901300 AS Decimal(38, 20)), CAST(122.10828082314542560000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (151, CAST(N'2021-08-31T23:50:25.063' AS DateTime), CAST(N'2021-08-31T23:50:29.293' AS DateTime), 1, CAST(47072.84000000000000000000 AS Decimal(38, 20)), CAST(0.00090404421673344200 AS Decimal(38, 20)), CAST(126.94033737526575272600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (152, CAST(N'2021-08-31T23:50:25.243' AS DateTime), CAST(N'2021-08-31T23:52:00.353' AS DateTime), 1, CAST(47072.84000000000000000000 AS Decimal(38, 20)), CAST(0.00041103023151448788 AS Decimal(38, 20)), CAST(117.76083429198041614520 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (153, CAST(N'2021-08-31T23:50:27.083' AS DateTime), CAST(N'2021-08-31T23:51:05.733' AS DateTime), 1, CAST(47075.77000000000000000000 AS Decimal(38, 20)), CAST(0.00018449776972854600 AS Decimal(38, 20)), CAST(113.28144983768526649680 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (154, CAST(N'2021-08-31T23:50:27.270' AS DateTime), CAST(N'2021-08-31T23:51:50.020' AS DateTime), 1, CAST(47075.77000000000000000000 AS Decimal(38, 20)), CAST(0.00031541304616975200 AS Decimal(38, 20)), CAST(92.94353252782159056810 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (155, CAST(N'2021-08-31T23:50:29.110' AS DateTime), CAST(N'2021-08-31T23:50:29.113' AS DateTime), 0, CAST(47072.84000000000000000000 AS Decimal(38, 20)), CAST(0.00179263474666170800 AS Decimal(38, 20)), CAST(124.23198221939138453320 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (156, CAST(N'2021-08-31T23:50:29.287' AS DateTime), CAST(N'2021-08-31T23:50:29.297' AS DateTime), 0, CAST(47072.84000000000000000000 AS Decimal(38, 20)), CAST(0.00124560162548236800 AS Decimal(38, 20)), CAST(101.18993478729006960040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (157, CAST(N'2021-08-31T23:50:31.137' AS DateTime), CAST(N'2021-08-31T23:50:31.140' AS DateTime), 0, CAST(47073.23000000000000000000 AS Decimal(38, 20)), CAST(0.00026585140086982900 AS Decimal(38, 20)), CAST(12.51448413896766057767 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (158, CAST(N'2021-08-31T23:50:31.340' AS DateTime), CAST(N'2021-08-31T23:50:31.340' AS DateTime), 0, CAST(47073.23000000000000000000 AS Decimal(38, 20)), CAST(0.00053037134647852300 AS Decimal(38, 20)), CAST(24.96629237819320323929 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (159, CAST(N'2021-08-31T23:50:33.160' AS DateTime), CAST(N'2021-08-31T23:51:27.980' AS DateTime), 0, CAST(47078.46000000000000000000 AS Decimal(38, 20)), CAST(0.00124877661329170176 AS Decimal(38, 20)), CAST(115.37629396857074459520 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (160, CAST(N'2021-08-31T23:50:33.363' AS DateTime), CAST(N'2021-08-31T23:52:08.433' AS DateTime), 0, CAST(47078.45000000000000000000 AS Decimal(38, 20)), CAST(0.00036135555122111000 AS Decimal(38, 20)), CAST(67.82117000657686532150 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (161, CAST(N'2021-08-31T23:50:35.200' AS DateTime), CAST(N'2021-08-31T23:50:35.203' AS DateTime), 0, CAST(47075.06000000000000000000 AS Decimal(38, 20)), CAST(0.00022794146264341700 AS Decimal(38, 20)), CAST(10.73035803042661388002 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (162, CAST(N'2021-08-31T23:50:35.390' AS DateTime), CAST(N'2021-08-31T23:52:02.380' AS DateTime), 1, CAST(47075.06000000000000000000 AS Decimal(38, 20)), CAST(0.00037103563350207800 AS Decimal(38, 20)), CAST(109.66349052458342103540 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (163, CAST(N'2021-08-31T23:50:39.243' AS DateTime), CAST(N'2021-08-31T23:52:02.380' AS DateTime), 1, CAST(47075.07000000000000000000 AS Decimal(38, 20)), CAST(0.00010188657525083400 AS Decimal(38, 20)), CAST(4.79631766199327810838 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (164, CAST(N'2021-08-31T23:50:39.430' AS DateTime), CAST(N'2021-08-31T23:52:04.207' AS DateTime), 1, CAST(47075.07000000000000000000 AS Decimal(38, 20)), CAST(0.00100616105124641200 AS Decimal(38, 20)), CAST(114.11752112175525297600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (165, CAST(N'2021-08-31T23:50:41.273' AS DateTime), CAST(N'2021-08-31T23:52:06.227' AS DateTime), 1, CAST(47072.01000000000000000000 AS Decimal(38, 20)), CAST(0.00041121737971492900 AS Decimal(38, 20)), CAST(19.35682861011493503729 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (166, CAST(N'2021-08-31T23:50:41.463' AS DateTime), CAST(N'2021-08-31T23:52:20.580' AS DateTime), 1, CAST(47072.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006553495687689900 AS Decimal(38, 20)), CAST(126.61580118986318497080 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (167, CAST(N'2021-08-31T23:50:45.487' AS DateTime), CAST(N'2021-08-31T23:50:45.487' AS DateTime), 0, CAST(47072.00000000000000000000 AS Decimal(38, 20)), CAST(0.00078121467017625200 AS Decimal(38, 20)), CAST(36.77333695453653414400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (168, CAST(N'2021-08-31T23:50:47.310' AS DateTime), CAST(N'2021-08-31T23:52:20.583' AS DateTime), 1, CAST(47072.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004393137257729260 AS Decimal(38, 20)), CAST(2.06793756995831726720 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (169, CAST(N'2021-08-31T23:50:51.557' AS DateTime), CAST(N'2021-08-31T23:52:24.510' AS DateTime), 1, CAST(47072.01000000000000000000 AS Decimal(38, 20)), CAST(0.00055663280885509360 AS Decimal(38, 20)), CAST(59.84797692103138952370 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (170, CAST(N'2021-08-31T23:50:53.337' AS DateTime), CAST(N'2021-08-31T23:50:53.337' AS DateTime), 0, CAST(47072.01000000000000000000 AS Decimal(38, 20)), CAST(0.00057434375433919200 AS Decimal(38, 20)), CAST(27.03551494769198921592 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (171, CAST(N'2021-08-31T23:50:55.627' AS DateTime), CAST(N'2021-08-31T23:52:30.603' AS DateTime), 1, CAST(47072.00000000000000000000 AS Decimal(38, 20)), CAST(0.00065030531932146720 AS Decimal(38, 20)), CAST(116.94360421541617344000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (172, CAST(N'2021-08-31T23:50:57.650' AS DateTime), CAST(N'2021-08-31T23:52:38.787' AS DateTime), 1, CAST(47072.02000000000000000000 AS Decimal(38, 20)), CAST(0.00074485331035445800 AS Decimal(38, 20)), CAST(107.75855583192720478940 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (173, CAST(N'2021-08-31T23:50:59.370' AS DateTime), CAST(N'2021-08-31T23:52:52.860' AS DateTime), 1, CAST(47072.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006879216738454500 AS Decimal(38, 20)), CAST(109.96969693865410336760 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (174, CAST(N'2021-08-31T23:51:01.390' AS DateTime), CAST(N'2021-08-31T23:51:01.393' AS DateTime), 0, CAST(47072.01000000000000000000 AS Decimal(38, 20)), CAST(0.00104859290218381000 AS Decimal(38, 20)), CAST(49.35937557752532615810 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (175, CAST(N'2021-08-31T23:51:01.693' AS DateTime), CAST(N'2021-08-31T23:51:01.697' AS DateTime), 0, CAST(47072.05000000000000000000 AS Decimal(38, 20)), CAST(0.00126087987067219400 AS Decimal(38, 20)), CAST(71.28832472026947847600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (176, CAST(N'2021-08-31T23:51:03.413' AS DateTime), CAST(N'2021-08-31T23:51:03.413' AS DateTime), 0, CAST(47073.75000000000000000000 AS Decimal(38, 20)), CAST(0.00070973867984010800 AS Decimal(38, 20)), CAST(33.41006118012328396500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (177, CAST(N'2021-08-31T23:51:03.720' AS DateTime), CAST(N'2021-08-31T23:52:04.207' AS DateTime), 1, CAST(47073.76000000000000000000 AS Decimal(38, 20)), CAST(0.00126976311685040200 AS Decimal(38, 20)), CAST(66.37152349849921404480 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (178, CAST(N'2021-08-31T23:51:05.733' AS DateTime), CAST(N'2021-08-31T23:51:05.737' AS DateTime), 0, CAST(47073.75000000000000000000 AS Decimal(38, 20)), CAST(0.00048796358764541700 AS Decimal(38, 20)), CAST(54.62555375560603927500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (179, CAST(N'2021-08-31T23:51:07.437' AS DateTime), CAST(N'2021-08-31T23:51:07.440' AS DateTime), 0, CAST(47072.00000000000000000000 AS Decimal(38, 20)), CAST(0.00052356707086952700 AS Decimal(38, 20)), CAST(24.64534915997037494400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (180, CAST(N'2021-08-31T23:51:07.747' AS DateTime), CAST(N'2021-08-31T23:52:52.860' AS DateTime), 1, CAST(47072.00000000000000000000 AS Decimal(38, 20)), CAST(0.00098436662609892500 AS Decimal(38, 20)), CAST(81.00948522449656928000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (181, CAST(N'2021-08-31T23:51:09.460' AS DateTime), CAST(N'2021-08-31T23:52:57.007' AS DateTime), 1, CAST(47072.01000000000000000000 AS Decimal(38, 20)), CAST(0.00121980170883228640 AS Decimal(38, 20)), CAST(60.29722194522891189420 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (182, CAST(N'2021-08-31T23:51:11.477' AS DateTime), CAST(N'2021-08-31T23:52:18.357' AS DateTime), 1, CAST(47077.55000000000000000000 AS Decimal(38, 20)), CAST(0.00028869521179642000 AS Decimal(38, 20)), CAST(74.92365202821752267300 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (183, CAST(N'2021-08-31T23:51:11.793' AS DateTime), CAST(N'2021-08-31T23:52:57.010' AS DateTime), 1, CAST(47077.56000000000000000000 AS Decimal(38, 20)), CAST(0.00015016266626778900 AS Decimal(38, 20)), CAST(73.85429006288713339920 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (185, CAST(N'2021-08-31T23:51:13.827' AS DateTime), CAST(N'2021-08-31T23:51:13.830' AS DateTime), 1, CAST(47089.54000000000000000000 AS Decimal(38, 20)), CAST(0.00000551081551495512 AS Decimal(38, 20)), CAST(0.25950176762409972144 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (186, CAST(N'2021-08-31T23:51:15.527' AS DateTime), CAST(N'2021-08-31T23:51:15.533' AS DateTime), 1, CAST(47087.99000000000000000000 AS Decimal(38, 20)), CAST(0.00036122860813570600 AS Decimal(38, 20)), CAST(17.00952908760804277094 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (190, CAST(N'2021-08-31T23:51:19.617' AS DateTime), CAST(N'2021-08-31T23:53:25.350' AS DateTime), 0, CAST(47085.32000000000000000000 AS Decimal(38, 20)), CAST(0.00010713492990804000 AS Decimal(38, 20)), CAST(73.63886253289428491600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (191, CAST(N'2021-08-31T23:51:19.900' AS DateTime), CAST(N'2021-08-31T23:51:19.903' AS DateTime), 1, CAST(47084.97000000000000000000 AS Decimal(38, 20)), CAST(0.00099725601631089412 AS Decimal(38, 20)), CAST(75.23049629751109330590 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (192, CAST(N'2021-08-31T23:51:21.637' AS DateTime), CAST(N'2021-08-31T23:53:25.350' AS DateTime), 0, CAST(47084.97000000000000000000 AS Decimal(38, 20)), CAST(0.00031613746011449800 AS Decimal(38, 20)), CAST(14.88532282536733489506 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (193, CAST(N'2021-08-31T23:51:25.677' AS DateTime), CAST(N'2021-08-31T23:53:25.350' AS DateTime), 0, CAST(47084.96000000000000000000 AS Decimal(38, 20)), CAST(0.00002302463372378830 AS Decimal(38, 20)), CAST(1.08411395789922315397 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (194, CAST(N'2021-08-31T23:51:25.950' AS DateTime), CAST(N'2021-08-31T23:53:27.213' AS DateTime), 0, CAST(47084.96000000000000000000 AS Decimal(38, 20)), CAST(0.00027396816810312630 AS Decimal(38, 20)), CAST(51.65590514914878588800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (196, CAST(N'2021-08-31T23:51:27.977' AS DateTime), CAST(N'2021-08-31T23:51:27.980' AS DateTime), 1, CAST(47100.41000000000000000000 AS Decimal(38, 20)), CAST(0.00020469099153052412 AS Decimal(38, 20)), CAST(78.09994973323902962750 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (201, CAST(N'2021-08-31T23:51:33.770' AS DateTime), CAST(N'2021-08-31T23:53:27.383' AS DateTime), 0, CAST(47083.28000000000000000000 AS Decimal(38, 20)), CAST(0.00038582492791388630 AS Decimal(38, 20)), CAST(124.13024622790999435040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (202, CAST(N'2021-08-31T23:51:34.050' AS DateTime), CAST(N'2021-08-31T23:52:08.433' AS DateTime), 0, CAST(47081.28000000000000000000 AS Decimal(38, 20)), CAST(0.00047214331788577000 AS Decimal(38, 20)), CAST(44.61798412670587618080 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (203, CAST(N'2021-08-31T23:51:35.783' AS DateTime), CAST(N'2021-08-31T23:51:35.783' AS DateTime), 0, CAST(47073.75000000000000000000 AS Decimal(38, 20)), CAST(0.00016283684692477700 AS Decimal(38, 20)), CAST(7.66534102292522130375 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (204, CAST(N'2021-08-31T23:51:36.080' AS DateTime), CAST(N'2021-08-31T23:51:36.083' AS DateTime), 0, CAST(47072.03000000000000000000 AS Decimal(38, 20)), CAST(0.00021503298935249200 AS Decimal(38, 20)), CAST(40.91350235964307895273 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (205, CAST(N'2021-08-31T23:51:37.807' AS DateTime), CAST(N'2021-08-31T23:51:37.810' AS DateTime), 0, CAST(47072.02000000000000000000 AS Decimal(38, 20)), CAST(0.00010927786236129600 AS Decimal(38, 20)), CAST(5.14392972262817253792 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (206, CAST(N'2021-08-31T23:51:38.110' AS DateTime), CAST(N'2021-08-31T23:52:57.010' AS DateTime), 1, CAST(47069.01000000000000000000 AS Decimal(38, 20)), CAST(0.00040745160854768500 AS Decimal(38, 20)), CAST(19.17834383724707074185 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (207, CAST(N'2021-08-31T23:51:39.867' AS DateTime), CAST(N'2021-08-31T23:52:57.013' AS DateTime), 1, CAST(47067.47000000000000000000 AS Decimal(38, 20)), CAST(0.00016547167471864800 AS Decimal(38, 20)), CAST(7.78833308566972318056 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (208, CAST(N'2021-08-31T23:51:40.123' AS DateTime), CAST(N'2021-08-31T23:51:40.123' AS DateTime), 0, CAST(47066.86000000000000000000 AS Decimal(38, 20)), CAST(0.00135777134502203000 AS Decimal(38, 20)), CAST(63.90603380816358292580 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (209, CAST(N'2021-08-31T23:51:41.890' AS DateTime), CAST(N'2021-08-31T23:52:57.013' AS DateTime), 1, CAST(47066.88000000000000000000 AS Decimal(38, 20)), CAST(0.00030843149456587040 AS Decimal(38, 20)), CAST(21.64548564604900497408 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (210, CAST(N'2021-08-31T23:51:42.143' AS DateTime), CAST(N'2021-08-31T23:53:04.947' AS DateTime), 1, CAST(47066.90000000000000000000 AS Decimal(38, 20)), CAST(0.00075084918534888240 AS Decimal(38, 20)), CAST(90.81110623651857807800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (211, CAST(N'2021-08-31T23:51:43.910' AS DateTime), CAST(N'2021-08-31T23:53:04.950' AS DateTime), 1, CAST(47068.00000000000000000000 AS Decimal(38, 20)), CAST(0.00064702492572694440 AS Decimal(38, 20)), CAST(34.81612829969119750800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (212, CAST(N'2021-08-31T23:51:44.160' AS DateTime), CAST(N'2021-08-31T23:53:05.103' AS DateTime), 1, CAST(47068.00000000000000000000 AS Decimal(38, 20)), CAST(0.00172660332295421000 AS Decimal(38, 20)), CAST(84.97781242396898060000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (213, CAST(N'2021-08-31T23:51:45.933' AS DateTime), CAST(N'2021-08-31T23:51:45.933' AS DateTime), 0, CAST(47071.10000000000000000000 AS Decimal(38, 20)), CAST(0.00000680427560899606 AS Decimal(38, 20)), CAST(0.32028473761861443987 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (214, CAST(N'2021-08-31T23:51:46.183' AS DateTime), CAST(N'2021-08-31T23:53:06.967' AS DateTime), 1, CAST(47071.11000000000000000000 AS Decimal(38, 20)), CAST(0.00072975393162563200 AS Decimal(38, 20)), CAST(34.35032758848260269152 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (215, CAST(N'2021-08-31T23:51:48.003' AS DateTime), CAST(N'2021-08-31T23:51:48.007' AS DateTime), 0, CAST(47073.19000000000000000000 AS Decimal(38, 20)), CAST(0.00015964201663604100 AS Decimal(38, 20)), CAST(7.51485898109151884079 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (216, CAST(N'2021-08-31T23:51:48.207' AS DateTime), CAST(N'2021-08-31T23:51:48.207' AS DateTime), 0, CAST(47073.19000000000000000000 AS Decimal(38, 20)), CAST(0.00133644717230296000 AS Decimal(38, 20)), CAST(62.91083166677997364240 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (217, CAST(N'2021-08-31T23:51:50.023' AS DateTime), CAST(N'2021-08-31T23:51:50.023' AS DateTime), 0, CAST(47073.21000000000000000000 AS Decimal(38, 20)), CAST(0.00044535332161251200 AS Decimal(38, 20)), CAST(35.81171499155174754744 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (218, CAST(N'2021-08-31T23:51:50.223' AS DateTime), CAST(N'2021-08-31T23:51:50.223' AS DateTime), 0, CAST(47073.21000000000000000000 AS Decimal(38, 20)), CAST(0.00151315646712350000 AS Decimal(38, 20)), CAST(71.22913213976261143500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (219, CAST(N'2021-08-31T23:51:52.043' AS DateTime), CAST(N'2021-08-31T23:53:11.180' AS DateTime), 1, CAST(47073.19000000000000000000 AS Decimal(38, 20)), CAST(0.00006010373130446600 AS Decimal(38, 20)), CAST(113.85355203438908100150 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (220, CAST(N'2021-08-31T23:51:52.247' AS DateTime), CAST(N'2021-08-31T23:53:13.023' AS DateTime), 1, CAST(47073.19000000000000000000 AS Decimal(38, 20)), CAST(0.00004998877157922310 AS Decimal(38, 20)), CAST(2.35313094241536903869 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (221, CAST(N'2021-08-31T23:51:54.077' AS DateTime), CAST(N'2021-08-31T23:51:54.080' AS DateTime), 0, CAST(47072.03000000000000000000 AS Decimal(38, 20)), CAST(0.00091621086770492906 AS Decimal(38, 20)), CAST(96.05848389611679868730 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (222, CAST(N'2021-08-31T23:51:54.277' AS DateTime), CAST(N'2021-08-31T23:51:54.277' AS DateTime), 0, CAST(47072.04000000000000000000 AS Decimal(38, 20)), CAST(0.00072530151914120700 AS Decimal(38, 20)), CAST(34.14142212107566155228 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (223, CAST(N'2021-08-31T23:51:56.290' AS DateTime), CAST(N'2021-08-31T23:53:13.197' AS DateTime), 1, CAST(47072.03000000000000000000 AS Decimal(38, 20)), CAST(0.00014991205532565310 AS Decimal(38, 20)), CAST(82.79140214414354579730 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (224, CAST(N'2021-08-31T23:51:58.113' AS DateTime), CAST(N'2021-08-31T23:51:58.120' AS DateTime), 0, CAST(47070.04000000000000000000 AS Decimal(38, 20)), CAST(0.00064961085265950206 AS Decimal(38, 20)), CAST(113.31961478745865438280 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (225, CAST(N'2021-08-31T23:51:58.327' AS DateTime), CAST(N'2021-08-31T23:53:35.467' AS DateTime), 1, CAST(47070.04000000000000000000 AS Decimal(38, 20)), CAST(0.00012017495423563310 AS Decimal(38, 20)), CAST(78.91684975442382510880 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (226, CAST(N'2021-08-31T23:52:00.143' AS DateTime), CAST(N'2021-08-31T23:53:39.500' AS DateTime), 1, CAST(47066.87000000000000000000 AS Decimal(38, 20)), CAST(0.00004429530014484016 AS Decimal(38, 20)), CAST(102.05125873195119894240 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (227, CAST(N'2021-08-31T23:52:00.353' AS DateTime), CAST(N'2021-08-31T23:52:00.357' AS DateTime), 0, CAST(47066.87000000000000000000 AS Decimal(38, 20)), CAST(0.00084504074852217412 AS Decimal(38, 20)), CAST(106.66306886877450048160 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (228, CAST(N'2021-08-31T23:52:02.160' AS DateTime), CAST(N'2021-08-31T23:53:41.537' AS DateTime), 1, CAST(47072.99000000000000000000 AS Decimal(38, 20)), CAST(0.00045730239178860000 AS Decimal(38, 20)), CAST(58.32918993605179034410 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (229, CAST(N'2021-08-31T23:52:02.380' AS DateTime), CAST(N'2021-08-31T23:52:02.383' AS DateTime), 0, CAST(47072.99000000000000000000 AS Decimal(38, 20)), CAST(0.00141799936151038800 AS Decimal(38, 20)), CAST(89.01133216778861826700 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (230, CAST(N'2021-08-31T23:52:04.203' AS DateTime), CAST(N'2021-08-31T23:52:04.210' AS DateTime), 0, CAST(47072.04000000000000000000 AS Decimal(38, 20)), CAST(0.00014018424020157800 AS Decimal(38, 20)), CAST(120.32990980189652783880 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (231, CAST(N'2021-08-31T23:52:04.393' AS DateTime), CAST(N'2021-08-31T23:52:04.397' AS DateTime), 0, CAST(47072.04000000000000000000 AS Decimal(38, 20)), CAST(0.00045145137871217500 AS Decimal(38, 20)), CAST(21.25073735679465008700 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (232, CAST(N'2021-08-31T23:52:06.227' AS DateTime), CAST(N'2021-08-31T23:52:06.230' AS DateTime), 0, CAST(47069.28000000000000000000 AS Decimal(38, 20)), CAST(0.00086859429835742100 AS Decimal(38, 20)), CAST(60.23981422245730240800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (233, CAST(N'2021-08-31T23:52:06.417' AS DateTime), CAST(N'2021-08-31T23:53:41.540' AS DateTime), 1, CAST(47072.05000000000000000000 AS Decimal(38, 20)), CAST(0.00108297654943680000 AS Decimal(38, 20)), CAST(59.10859620326728264800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (234, CAST(N'2021-08-31T23:52:08.243' AS DateTime), CAST(N'2021-08-31T23:52:08.247' AS DateTime), 1, CAST(47083.22000000000000000000 AS Decimal(38, 20)), CAST(0.00107924349158036000 AS Decimal(38, 20)), CAST(50.81425874764623755920 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (235, CAST(N'2021-08-31T23:52:08.433' AS DateTime), CAST(N'2021-08-31T23:52:08.437' AS DateTime), 1, CAST(47083.22000000000000000000 AS Decimal(38, 20)), CAST(0.00047553661194421500 AS Decimal(38, 20)), CAST(84.02340046035863969820 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (236, CAST(N'2021-08-31T23:52:12.290' AS DateTime), CAST(N'2021-08-31T23:53:27.387' AS DateTime), 0, CAST(47083.21000000000000000000 AS Decimal(38, 20)), CAST(0.00033327709633544000 AS Decimal(38, 20)), CAST(15.69175551495175196240 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (238, CAST(N'2021-08-31T23:52:14.300' AS DateTime), CAST(N'2021-08-31T23:53:15.227' AS DateTime), 1, CAST(47078.34000000000000000000 AS Decimal(38, 20)), CAST(0.00069961105044913100 AS Decimal(38, 20)), CAST(32.93652690080134192254 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (239, CAST(N'2021-08-31T23:52:14.500' AS DateTime), CAST(N'2021-08-31T23:53:17.103' AS DateTime), 1, CAST(47079.89000000000000000000 AS Decimal(38, 20)), CAST(0.00047808999404222100 AS Decimal(38, 20)), CAST(55.52848199091812893560 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (240, CAST(N'2021-08-31T23:52:16.320' AS DateTime), CAST(N'2021-08-31T23:53:51.467' AS DateTime), 1, CAST(47076.38000000000000000000 AS Decimal(38, 20)), CAST(0.00113982085489659200 AS Decimal(38, 20)), CAST(108.18430848968985008260 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (241, CAST(N'2021-08-31T23:52:16.517' AS DateTime), CAST(N'2021-08-31T23:53:51.640' AS DateTime), 1, CAST(47076.38000000000000000000 AS Decimal(38, 20)), CAST(0.00019575693341705800 AS Decimal(38, 20)), CAST(9.21552778517612089004 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (242, CAST(N'2021-08-31T23:52:18.353' AS DateTime), CAST(N'2021-08-31T23:52:18.363' AS DateTime), 0, CAST(47074.56000000000000000000 AS Decimal(38, 20)), CAST(0.00085134769983186500 AS Decimal(38, 20)), CAST(93.74383682261751878400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (243, CAST(N'2021-08-31T23:52:18.543' AS DateTime), CAST(N'2021-08-31T23:53:55.510' AS DateTime), 1, CAST(47074.56000000000000000000 AS Decimal(38, 20)), CAST(0.00004993511440695500 AS Decimal(38, 20)), CAST(108.08438139854978138880 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (244, CAST(N'2021-08-31T23:52:20.400' AS DateTime), CAST(N'2021-08-31T23:52:20.407' AS DateTime), 0, CAST(47070.00000000000000000000 AS Decimal(38, 20)), CAST(0.00175570279548676000 AS Decimal(38, 20)), CAST(82.64093058356179320000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (245, CAST(N'2021-08-31T23:52:20.573' AS DateTime), CAST(N'2021-08-31T23:52:20.590' AS DateTime), 0, CAST(47067.01000000000000000000 AS Decimal(38, 20)), CAST(0.00071478043483327640 AS Decimal(38, 20)), CAST(38.79483069718589923068 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (246, CAST(N'2021-08-31T23:52:22.477' AS DateTime), CAST(N'2021-08-31T23:53:55.697' AS DateTime), 1, CAST(47069.18000000000000000000 AS Decimal(38, 20)), CAST(0.00065266710117119000 AS Decimal(38, 20)), CAST(117.31211083501838785540 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (247, CAST(N'2021-08-31T23:52:22.640' AS DateTime), CAST(N'2021-08-31T23:53:57.543' AS DateTime), 1, CAST(47069.18000000000000000000 AS Decimal(38, 20)), CAST(0.00030933318450550200 AS Decimal(38, 20)), CAST(14.56005934146268462836 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (248, CAST(N'2021-08-31T23:52:24.510' AS DateTime), CAST(N'2021-08-31T23:52:24.513' AS DateTime), 0, CAST(47069.17000000000000000000 AS Decimal(38, 20)), CAST(0.00143663789324306640 AS Decimal(38, 20)), CAST(93.82159753307764972720 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (249, CAST(N'2021-08-31T23:52:24.667' AS DateTime), CAST(N'2021-08-31T23:53:57.727' AS DateTime), 1, CAST(47069.17000000000000000000 AS Decimal(38, 20)), CAST(0.00059479905729871100 AS Decimal(38, 20)), CAST(44.12436505681311862418 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (250, CAST(N'2021-08-31T23:52:26.540' AS DateTime), CAST(N'2021-08-31T23:52:26.540' AS DateTime), 0, CAST(47075.00000000000000000000 AS Decimal(38, 20)), CAST(0.00052122415961754700 AS Decimal(38, 20)), CAST(24.53662731399602502500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (251, CAST(N'2021-08-31T23:52:26.697' AS DateTime), CAST(N'2021-08-31T23:52:26.697' AS DateTime), 0, CAST(47075.00000000000000000000 AS Decimal(38, 20)), CAST(0.00089739222857048400 AS Decimal(38, 20)), CAST(42.24473915995553430000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (252, CAST(N'2021-08-31T23:52:30.603' AS DateTime), CAST(N'2021-08-31T23:52:30.607' AS DateTime), 0, CAST(47062.16000000000000000000 AS Decimal(38, 20)), CAST(0.00039741275734148640 AS Decimal(38, 20)), CAST(68.01097853085039599040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (253, CAST(N'2021-08-31T23:52:30.727' AS DateTime), CAST(N'2021-08-31T23:52:30.727' AS DateTime), 0, CAST(47062.16000000000000000000 AS Decimal(38, 20)), CAST(0.00041148608173778600 AS Decimal(38, 20)), CAST(19.36542381651676277776 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (254, CAST(N'2021-08-31T23:52:32.633' AS DateTime), CAST(N'2021-08-31T23:54:03.773' AS DateTime), 1, CAST(47062.15000000000000000000 AS Decimal(38, 20)), CAST(0.00012369584265338100 AS Decimal(38, 20)), CAST(120.23115403350429886150 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (255, CAST(N'2021-08-31T23:52:32.747' AS DateTime), CAST(N'2021-08-31T23:52:32.747' AS DateTime), 0, CAST(47062.15000000000000000000 AS Decimal(38, 20)), CAST(0.00010365348505026400 AS Decimal(38, 20)), CAST(4.87815586145828190760 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (256, CAST(N'2021-08-31T23:52:36.667' AS DateTime), CAST(N'2021-08-31T23:54:03.773' AS DateTime), 1, CAST(47060.01000000000000000000 AS Decimal(38, 20)), CAST(0.00145057666923413100 AS Decimal(38, 20)), CAST(89.93620051203862190970 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (257, CAST(N'2021-08-31T23:52:36.770' AS DateTime), CAST(N'2021-08-31T23:54:17.787' AS DateTime), 1, CAST(47060.01000000000000000000 AS Decimal(38, 20)), CAST(0.00012691898575374500 AS Decimal(38, 20)), CAST(88.88959289137279574070 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (258, CAST(N'2021-08-31T23:52:38.700' AS DateTime), CAST(N'2021-08-31T23:52:38.700' AS DateTime), 0, CAST(47059.79000000000000000000 AS Decimal(38, 20)), CAST(0.00045536885268770600 AS Decimal(38, 20)), CAST(21.42956258002437994174 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (259, CAST(N'2021-08-31T23:52:38.790' AS DateTime), CAST(N'2021-08-31T23:52:38.790' AS DateTime), 0, CAST(47059.79000000000000000000 AS Decimal(38, 20)), CAST(0.00057386562501725600 AS Decimal(38, 20)), CAST(89.06463196914724651630 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (260, CAST(N'2021-08-31T23:52:40.733' AS DateTime), CAST(N'2021-08-31T23:52:40.733' AS DateTime), 0, CAST(47061.92000000000000000000 AS Decimal(38, 20)), CAST(0.00064105935256977500 AS Decimal(38, 20)), CAST(30.16948396589054546800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (261, CAST(N'2021-08-31T23:52:40.810' AS DateTime), CAST(N'2021-08-31T23:54:18.040' AS DateTime), 1, CAST(47061.92000000000000000000 AS Decimal(38, 20)), CAST(0.00016911797736264100 AS Decimal(38, 20)), CAST(39.59078784003767057536 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (262, CAST(N'2021-08-31T23:52:42.763' AS DateTime), CAST(N'2021-08-31T23:52:42.767' AS DateTime), 0, CAST(47059.78000000000000000000 AS Decimal(38, 20)), CAST(0.00162634941084606000 AS Decimal(38, 20)), CAST(76.53564547754519746680 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (263, CAST(N'2021-08-31T23:52:42.823' AS DateTime), CAST(N'2021-08-31T23:54:22.090' AS DateTime), 1, CAST(47059.78000000000000000000 AS Decimal(38, 20)), CAST(0.00037519363121837000 AS Decimal(38, 20)), CAST(101.97147369319538687940 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (264, CAST(N'2021-08-31T23:52:44.780' AS DateTime), CAST(N'2021-08-31T23:54:22.090' AS DateTime), 1, CAST(47055.81000000000000000000 AS Decimal(38, 20)), CAST(0.00060359518868084800 AS Decimal(38, 20)), CAST(28.40266051548013412688 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (265, CAST(N'2021-08-31T23:52:44.847' AS DateTime), CAST(N'2021-08-31T23:54:26.133' AS DateTime), 1, CAST(47055.81000000000000000000 AS Decimal(38, 20)), CAST(0.00010762007362564000 AS Decimal(38, 20)), CAST(69.54629883555402317640 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (266, CAST(N'2021-08-31T23:52:46.800' AS DateTime), CAST(N'2021-08-31T23:54:27.953' AS DateTime), 1, CAST(47059.77000000000000000000 AS Decimal(38, 20)), CAST(0.00167502988887719000 AS Decimal(38, 20)), CAST(101.64377636775941775960 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (267, CAST(N'2021-08-31T23:52:46.887' AS DateTime), CAST(N'2021-08-31T23:54:28.153' AS DateTime), 1, CAST(47059.77000000000000000000 AS Decimal(38, 20)), CAST(0.00054972171804389100 AS Decimal(38, 20)), CAST(25.86977761515036036507 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (268, CAST(N'2021-08-31T23:52:48.827' AS DateTime), CAST(N'2021-08-31T23:54:30.180' AS DateTime), 1, CAST(47052.11000000000000000000 AS Decimal(38, 20)), CAST(0.00039367170817855300 AS Decimal(38, 20)), CAST(76.58016904180181243040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (269, CAST(N'2021-08-31T23:52:48.907' AS DateTime), CAST(N'2021-08-31T23:54:34.253' AS DateTime), 1, CAST(47052.11000000000000000000 AS Decimal(38, 20)), CAST(0.00022105245605160420 AS Decimal(38, 20)), CAST(77.40927684123606597520 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (270, CAST(N'2021-08-31T23:52:52.860' AS DateTime), CAST(N'2021-08-31T23:52:52.863' AS DateTime), 0, CAST(47054.43000000000000000000 AS Decimal(38, 20)), CAST(0.00073660306340856500 AS Decimal(38, 20)), CAST(118.87666129674016165800 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (271, CAST(N'2021-08-31T23:52:52.963' AS DateTime), CAST(N'2021-08-31T23:54:36.280' AS DateTime), 1, CAST(47054.44000000000000000000 AS Decimal(38, 20)), CAST(0.00017866204901536000 AS Decimal(38, 20)), CAST(122.70808533054278352320 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (272, CAST(N'2021-08-31T23:52:54.883' AS DateTime), CAST(N'2021-08-31T23:52:54.880' AS DateTime), 0, CAST(47064.61000000000000000000 AS Decimal(38, 20)), CAST(0.00006115531733313360 AS Decimal(38, 20)), CAST(2.87825115971017296190 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (273, CAST(N'2021-08-31T23:52:54.990' AS DateTime), CAST(N'2021-08-31T23:54:36.280' AS DateTime), 1, CAST(47064.62000000000000000000 AS Decimal(38, 20)), CAST(0.00033370422135745400 AS Decimal(38, 20)), CAST(15.70566237058445667748 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (274, CAST(N'2021-08-31T23:52:56.893' AS DateTime), CAST(N'2021-08-31T23:54:36.283' AS DateTime), 1, CAST(47060.44000000000000000000 AS Decimal(38, 20)), CAST(0.00012059039027457600 AS Decimal(38, 20)), CAST(5.67503682609326737344 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (275, CAST(N'2021-08-31T23:52:57.007' AS DateTime), CAST(N'2021-08-31T23:52:57.013' AS DateTime), 0, CAST(47060.43000000000000000000 AS Decimal(38, 20)), CAST(0.00015145634261494560 AS Decimal(38, 20)), CAST(120.20324862360212993310 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (276, CAST(N'2021-08-31T23:52:58.920' AS DateTime), CAST(N'2021-08-31T23:52:58.920' AS DateTime), 0, CAST(47059.12000000000000000000 AS Decimal(38, 20)), CAST(0.00004927948277875760 AS Decimal(38, 20)), CAST(2.31904909362348734931 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (277, CAST(N'2021-08-31T23:52:59.030' AS DateTime), CAST(N'2021-08-31T23:52:59.030' AS DateTime), 0, CAST(47059.11000000000000000000 AS Decimal(38, 20)), CAST(0.00112927620528698000 AS Decimal(38, 20)), CAST(53.14273316498257338780 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (278, CAST(N'2021-08-31T23:53:01.057' AS DateTime), CAST(N'2021-08-31T23:54:36.283' AS DateTime), 1, CAST(47059.12000000000000000000 AS Decimal(38, 20)), CAST(0.00000312090818915558 AS Decimal(38, 20)), CAST(0.14686719298245513789 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (279, CAST(N'2021-08-31T23:53:04.947' AS DateTime), CAST(N'2021-08-31T23:53:04.950' AS DateTime), 0, CAST(47056.62000000000000000000 AS Decimal(38, 20)), CAST(0.00009267355943688660 AS Decimal(38, 20)), CAST(74.50103979367094635200 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (280, CAST(N'2021-08-31T23:53:05.103' AS DateTime), CAST(N'2021-08-31T23:53:05.103' AS DateTime), 0, CAST(47056.62000000000000000000 AS Decimal(38, 20)), CAST(0.00007882313289624000 AS Decimal(38, 20)), CAST(88.66641688280926758780 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (281, CAST(N'2021-08-31T23:53:06.967' AS DateTime), CAST(N'2021-08-31T23:53:06.970' AS DateTime), 0, CAST(47057.41000000000000000000 AS Decimal(38, 20)), CAST(0.00112913139366038800 AS Decimal(38, 20)), CAST(87.47432889496761040820 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (282, CAST(N'2021-08-31T23:53:07.143' AS DateTime), CAST(N'2021-08-31T23:53:07.143' AS DateTime), 0, CAST(47057.41000000000000000000 AS Decimal(38, 20)), CAST(0.00027293201902552100 AS Decimal(38, 20)), CAST(12.84347392141174216061 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (283, CAST(N'2021-08-31T23:53:11.003' AS DateTime), CAST(N'2021-08-31T23:53:11.007' AS DateTime), 0, CAST(47062.39000000000000000000 AS Decimal(38, 20)), CAST(0.00030168561358083300 AS Decimal(38, 20)), CAST(14.19804600373045917087 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (284, CAST(N'2021-08-31T23:53:11.177' AS DateTime), CAST(N'2021-08-31T23:53:11.180' AS DateTime), 0, CAST(47062.39000000000000000000 AS Decimal(38, 20)), CAST(0.00065479683967064200 AS Decimal(38, 20)), CAST(64.46123372180043834250 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (285, CAST(N'2021-08-31T23:53:13.023' AS DateTime), CAST(N'2021-08-31T23:53:13.027' AS DateTime), 0, CAST(47059.56000000000000000000 AS Decimal(38, 20)), CAST(0.00160891164835025690 AS Decimal(38, 20)), CAST(78.06712384569655982880 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (286, CAST(N'2021-08-31T23:53:13.197' AS DateTime), CAST(N'2021-08-31T23:53:13.200' AS DateTime), 0, CAST(47059.56000000000000000000 AS Decimal(38, 20)), CAST(0.00155640848938208690 AS Decimal(38, 20)), CAST(80.29869405290657299440 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (287, CAST(N'2021-08-31T23:53:15.060' AS DateTime), CAST(N'2021-08-31T23:54:36.287' AS DateTime), 1, CAST(47074.99000000000000000000 AS Decimal(38, 20)), CAST(0.00069379546893471358 AS Decimal(38, 20)), CAST(40.87641876419363695436 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (288, CAST(N'2021-08-31T23:53:15.227' AS DateTime), CAST(N'2021-08-31T23:53:15.227' AS DateTime), 0, CAST(47074.99000000000000000000 AS Decimal(38, 20)), CAST(0.00070136225172381900 AS Decimal(38, 20)), CAST(65.95080419005859952050 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (289, CAST(N'2021-08-31T23:53:17.100' AS DateTime), CAST(N'2021-08-31T23:53:17.103' AS DateTime), 0, CAST(47075.03000000000000000000 AS Decimal(38, 20)), CAST(0.00049750001248787300 AS Decimal(38, 20)), CAST(45.92592882510437095282 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (290, CAST(N'2021-08-31T23:53:17.263' AS DateTime), CAST(N'2021-08-31T23:54:38.310' AS DateTime), 1, CAST(47075.03000000000000000000 AS Decimal(38, 20)), CAST(0.00029136793165997000 AS Decimal(38, 20)), CAST(121.14646063979674498050 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (291, CAST(N'2021-08-31T23:53:21.133' AS DateTime), CAST(N'2021-08-31T23:54:42.180' AS DateTime), 1, CAST(47076.35000000000000000000 AS Decimal(38, 20)), CAST(0.00011967351735554000 AS Decimal(38, 20)), CAST(53.87515743196273759950 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (292, CAST(N'2021-08-31T23:53:21.290' AS DateTime), CAST(N'2021-08-31T23:54:42.180' AS DateTime), 1, CAST(47076.35000000000000000000 AS Decimal(38, 20)), CAST(0.00097328859072797400 AS Decimal(38, 20)), CAST(45.81887434811685881490 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (295, CAST(N'2021-08-31T23:53:25.180' AS DateTime), CAST(N'2021-08-31T23:53:25.183' AS DateTime), 1, CAST(47085.78000000000000000000 AS Decimal(38, 20)), CAST(0.00145681031954326000 AS Decimal(38, 20)), CAST(68.59505020774364084280 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (296, CAST(N'2021-08-31T23:53:25.350' AS DateTime), CAST(N'2021-08-31T23:53:25.353' AS DateTime), 1, CAST(47085.78000000000000000000 AS Decimal(38, 20)), CAST(0.00082311049882467370 AS Decimal(38, 20)), CAST(59.77104333812314038000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (297, CAST(N'2021-08-31T23:53:27.213' AS DateTime), CAST(N'2021-08-31T23:53:27.220' AS DateTime), 1, CAST(47086.49000000000000000000 AS Decimal(38, 20)), CAST(0.00225057266859829370 AS Decimal(38, 20)), CAST(118.87176686193304581580 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (298, CAST(N'2021-08-31T23:53:27.387' AS DateTime), CAST(N'2021-08-31T23:53:27.387' AS DateTime), 1, CAST(47086.49000000000000000000 AS Decimal(38, 20)), CAST(0.00097332810092405370 AS Decimal(38, 20)), CAST(79.69059416467510563620 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (299, CAST(N'2021-08-31T23:53:29.257' AS DateTime), CAST(N'2021-08-31T23:53:29.257' AS DateTime), 1, CAST(47086.48000000000000000000 AS Decimal(38, 20)), CAST(0.00027774930078431500 AS Decimal(38, 20)), CAST(13.07823689639463256120 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (303, CAST(N'2021-08-31T23:53:33.307' AS DateTime), CAST(N'2021-08-31T23:54:42.183' AS DateTime), 1, CAST(47074.48000000000000000000 AS Decimal(38, 20)), CAST(0.00034808886346783900 AS Decimal(38, 20)), CAST(16.38610224153951764872 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (304, CAST(N'2021-08-31T23:53:33.443' AS DateTime), CAST(N'2021-08-31T23:54:44.213' AS DateTime), 1, CAST(47074.48000000000000000000 AS Decimal(38, 20)), CAST(0.00002248734534833300 AS Decimal(38, 20)), CAST(52.30312393203379085200 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (305, CAST(N'2021-08-31T23:53:35.323' AS DateTime), CAST(N'2021-08-31T23:54:44.213' AS DateTime), 1, CAST(47066.20000000000000000000 AS Decimal(38, 20)), CAST(0.00061343443073026600 AS Decimal(38, 20)), CAST(28.87202760363684560920 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (306, CAST(N'2021-08-31T23:53:35.467' AS DateTime), CAST(N'2021-08-31T23:53:35.467' AS DateTime), 0, CAST(47066.20000000000000000000 AS Decimal(38, 20)), CAST(0.00071606195700171690 AS Decimal(38, 20)), CAST(39.35849371167936257000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (307, CAST(N'2021-08-31T23:53:37.340' AS DateTime), CAST(N'2021-08-31T23:53:37.340' AS DateTime), 0, CAST(47060.50000000000000000000 AS Decimal(38, 20)), CAST(0.00111142661264698000 AS Decimal(38, 20)), CAST(52.30429210447320229000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (308, CAST(N'2021-08-31T23:53:37.483' AS DateTime), CAST(N'2021-08-31T23:53:37.483' AS DateTime), 0, CAST(47060.50000000000000000000 AS Decimal(38, 20)), CAST(0.00029089569146321000 AS Decimal(38, 20)), CAST(13.68969668810439420500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (309, CAST(N'2021-08-31T23:53:39.370' AS DateTime), CAST(N'2021-08-31T23:53:39.370' AS DateTime), 0, CAST(47055.42000000000000000000 AS Decimal(38, 20)), CAST(0.00000049959747144002 AS Decimal(38, 20)), CAST(0.02350876884954833413 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (310, CAST(N'2021-08-31T23:53:39.500' AS DateTime), CAST(N'2021-08-31T23:53:39.500' AS DateTime), 0, CAST(47051.59000000000000000000 AS Decimal(38, 20)), CAST(0.00000503935106333292 AS Decimal(38, 20)), CAST(2.55838326153796899454 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (311, CAST(N'2021-08-31T23:53:41.387' AS DateTime), CAST(N'2021-08-31T23:53:41.387' AS DateTime), 0, CAST(47050.00000000000000000000 AS Decimal(38, 20)), CAST(0.00078181987208399000 AS Decimal(38, 20)), CAST(36.78462498155172950000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (312, CAST(N'2021-08-31T23:53:41.537' AS DateTime), CAST(N'2021-08-31T23:53:41.543' AS DateTime), 0, CAST(47050.00000000000000000000 AS Decimal(38, 20)), CAST(0.00017272818836976000 AS Decimal(38, 20)), CAST(88.72384671024948600000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (313, CAST(N'2021-08-31T23:53:43.400' AS DateTime), CAST(N'2021-08-31T23:54:46.250' AS DateTime), 1, CAST(47050.01000000000000000000 AS Decimal(38, 20)), CAST(0.00037290486370813800 AS Decimal(38, 20)), CAST(73.96956137130383238100 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (314, CAST(N'2021-08-31T23:53:43.577' AS DateTime), CAST(N'2021-08-31T23:54:48.300' AS DateTime), 1, CAST(47050.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000833497164227766 AS Decimal(38, 20)), CAST(0.39216049911888032578 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (315, CAST(N'2021-08-31T23:53:45.600' AS DateTime), CAST(N'2021-08-31T23:54:56.390' AS DateTime), 1, CAST(47050.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006708576444867452 AS Decimal(38, 20)), CAST(69.73628798370090800000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (316, CAST(N'2021-08-31T23:53:47.443' AS DateTime), CAST(N'2021-08-31T23:53:47.443' AS DateTime), 0, CAST(47050.00000000000000000000 AS Decimal(38, 20)), CAST(0.00056831686839848600 AS Decimal(38, 20)), CAST(26.73930865814876630000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (317, CAST(N'2021-08-31T23:53:51.467' AS DateTime), CAST(N'2021-08-31T23:53:51.470' AS DateTime), 0, CAST(47047.51000000000000000000 AS Decimal(38, 20)), CAST(0.00009242147118431900 AS Decimal(38, 20)), CAST(62.32213324847388107730 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (318, CAST(N'2021-08-31T23:53:51.640' AS DateTime), CAST(N'2021-08-31T23:53:51.643' AS DateTime), 0, CAST(47047.50000000000000000000 AS Decimal(38, 20)), CAST(0.00060139543069591500 AS Decimal(38, 20)), CAST(37.50402585060509721750 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (319, CAST(N'2021-08-31T23:53:53.487' AS DateTime), CAST(N'2021-08-31T23:53:53.490' AS DateTime), 0, CAST(47040.00000000000000000000 AS Decimal(38, 20)), CAST(0.00164469476875136000 AS Decimal(38, 20)), CAST(77.36644192206397440000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (320, CAST(N'2021-08-31T23:53:53.673' AS DateTime), CAST(N'2021-08-31T23:55:00.523' AS DateTime), 1, CAST(47040.00000000000000000000 AS Decimal(38, 20)), CAST(0.00014661922089133000 AS Decimal(38, 20)), CAST(116.26561396775115840000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (321, CAST(N'2021-08-31T23:53:55.510' AS DateTime), CAST(N'2021-08-31T23:53:55.513' AS DateTime), 0, CAST(47037.88000000000000000000 AS Decimal(38, 20)), CAST(0.00124162609634996500 AS Decimal(38, 20)), CAST(60.75230124423871212960 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (322, CAST(N'2021-08-31T23:53:55.697' AS DateTime), CAST(N'2021-08-31T23:53:55.700' AS DateTime), 0, CAST(47036.32000000000000000000 AS Decimal(38, 20)), CAST(0.00059804065734987500 AS Decimal(38, 20)), CAST(86.95832208839861254080 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (323, CAST(N'2021-08-31T23:53:57.540' AS DateTime), CAST(N'2021-08-31T23:53:57.543' AS DateTime), 0, CAST(47033.00000000000000000000 AS Decimal(38, 20)), CAST(0.00034263759299304300 AS Decimal(38, 20)), CAST(30.66414157808906698500 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (324, CAST(N'2021-08-31T23:53:57.727' AS DateTime), CAST(N'2021-08-31T23:53:57.730' AS DateTime), 0, CAST(47033.00000000000000000000 AS Decimal(38, 20)), CAST(0.00117690676570725900 AS Decimal(38, 20)), CAST(83.32863997343978701000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (325, CAST(N'2021-08-31T23:54:01.583' AS DateTime), CAST(N'2021-08-31T23:55:00.523' AS DateTime), 1, CAST(47031.57000000000000000000 AS Decimal(38, 20)), CAST(0.00023045764166417000 AS Decimal(38, 20)), CAST(64.99499832926607409110 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (326, CAST(N'2021-08-31T23:54:01.757' AS DateTime), CAST(N'2021-08-31T23:55:08.517' AS DateTime), 1, CAST(47031.57000000000000000000 AS Decimal(38, 20)), CAST(0.00112107886365665400 AS Decimal(38, 20)), CAST(76.87315469441925941670 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (327, CAST(N'2021-08-31T23:54:03.603' AS DateTime), CAST(N'2021-08-31T23:54:03.607' AS DateTime), 0, CAST(47022.00000000000000000000 AS Decimal(38, 20)), CAST(0.00125412882727297000 AS Decimal(38, 20)), CAST(58.97164571602959534000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (328, CAST(N'2021-08-31T23:54:03.773' AS DateTime), CAST(N'2021-08-31T23:54:03.777' AS DateTime), 0, CAST(47021.98000000000000000000 AS Decimal(38, 20)), CAST(0.00046051940813683900 AS Decimal(38, 20)), CAST(117.33447936656891295620 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (329, CAST(N'2021-08-31T23:54:05.623' AS DateTime), CAST(N'2021-08-31T23:55:10.533' AS DateTime), 1, CAST(47014.32000000000000000000 AS Decimal(38, 20)), CAST(0.00080830488484739000 AS Decimal(38, 20)), CAST(64.11719265498444235920 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (330, CAST(N'2021-08-31T23:54:05.797' AS DateTime), CAST(N'2021-08-31T23:54:05.797' AS DateTime), 0, CAST(47014.31000000000000000000 AS Decimal(38, 20)), CAST(0.00128482431559117000 AS Decimal(38, 20)), CAST(60.40512866874109964270 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (331, CAST(N'2021-08-31T23:54:07.653' AS DateTime), CAST(N'2021-08-31T23:55:14.583' AS DateTime), 1, CAST(46949.41000000000000000000 AS Decimal(38, 20)), CAST(0.00022473864607733600 AS Decimal(38, 20)), CAST(10.55134683752973957176 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (332, CAST(N'2021-08-31T23:54:07.820' AS DateTime), CAST(N'2021-08-31T23:55:14.777' AS DateTime), 1, CAST(46949.41000000000000000000 AS Decimal(38, 20)), CAST(0.00101312461109511600 AS Decimal(38, 20)), CAST(100.32366272214625297600 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (336, CAST(N'2021-08-31T23:54:11.933' AS DateTime), CAST(N'2021-08-31T23:54:11.937' AS DateTime), 0, CAST(46949.37000000000000000000 AS Decimal(38, 20)), CAST(0.00047711292480915500 AS Decimal(38, 20)), CAST(22.40015123864719748235 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (339, CAST(N'2021-08-31T23:54:15.760' AS DateTime), CAST(N'2021-08-31T23:55:12.760' AS DateTime), 1, CAST(46953.01000000000000000000 AS Decimal(38, 20)), CAST(0.00075626297991548800 AS Decimal(38, 20)), CAST(35.50882325860170721888 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (340, CAST(N'2021-08-31T23:54:16.017' AS DateTime), CAST(N'2021-08-31T23:55:12.760' AS DateTime), 1, CAST(46953.00000000000000000000 AS Decimal(38, 20)), CAST(0.00082266350869213400 AS Decimal(38, 20)), CAST(38.62651972362176770200 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (341, CAST(N'2021-08-31T23:54:17.787' AS DateTime), CAST(N'2021-08-31T23:54:17.790' AS DateTime), 0, CAST(46960.00000000000000000000 AS Decimal(38, 20)), CAST(0.00046797494630701000 AS Decimal(38, 20)), CAST(27.93621904957305480000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (342, CAST(N'2021-08-31T23:54:18.040' AS DateTime), CAST(N'2021-08-31T23:54:18.040' AS DateTime), 0, CAST(46961.35000000000000000000 AS Decimal(38, 20)), CAST(0.00020415596375435700 AS Decimal(38, 20)), CAST(27.11688786313040712925 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (345, CAST(N'2021-08-31T23:54:21.850' AS DateTime), CAST(N'2021-08-31T23:54:21.850' AS DateTime), 0, CAST(46932.56000000000000000000 AS Decimal(38, 20)), CAST(0.00179165614354036000 AS Decimal(38, 20)), CAST(84.08700945607655812160 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (346, CAST(N'2021-08-31T23:54:22.087' AS DateTime), CAST(N'2021-08-31T23:54:22.093' AS DateTime), 0, CAST(46932.55000000000000000000 AS Decimal(38, 20)), CAST(0.00097989673231723200 AS Decimal(38, 20)), CAST(91.92610761367615044750 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (349, CAST(N'2021-08-31T23:54:25.927' AS DateTime), CAST(N'2021-08-31T23:55:18.670' AS DateTime), 1, CAST(46958.90000000000000000000 AS Decimal(38, 20)), CAST(0.00088783405268929200 AS Decimal(38, 20)), CAST(82.47010610249896583900 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (350, CAST(N'2021-08-31T23:54:26.133' AS DateTime), CAST(N'2021-08-31T23:54:26.137' AS DateTime), 0, CAST(46954.13000000000000000000 AS Decimal(38, 20)), CAST(0.00039043668875956800 AS Decimal(38, 20)), CAST(41.71843700920046112488 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (351, CAST(N'2021-08-31T23:54:27.953' AS DateTime), CAST(N'2021-08-31T23:54:27.953' AS DateTime), 0, CAST(46954.14000000000000000000 AS Decimal(38, 20)), CAST(0.00048485691821429000 AS Decimal(38, 20)), CAST(124.18166714212866738780 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (352, CAST(N'2021-08-31T23:54:28.150' AS DateTime), CAST(N'2021-08-31T23:54:28.153' AS DateTime), 0, CAST(46962.54000000000000000000 AS Decimal(38, 20)), CAST(0.00117766675454455900 AS Decimal(38, 20)), CAST(81.12255023947398666300 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (353, CAST(N'2021-08-31T23:54:29.970' AS DateTime), CAST(N'2021-08-31T23:55:16.630' AS DateTime), 1, CAST(46974.99000000000000000000 AS Decimal(38, 20)), CAST(0.00004773535642201800 AS Decimal(38, 20)), CAST(2.24236789057073132982 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (354, CAST(N'2021-08-31T23:54:30.173' AS DateTime), CAST(N'2021-08-31T23:54:30.187' AS DateTime), 0, CAST(46974.98000000000000000000 AS Decimal(38, 20)), CAST(0.00005622232130552800 AS Decimal(38, 20)), CAST(23.77480545601486698282 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (355, CAST(N'2021-08-31T23:54:32.013' AS DateTime), CAST(N'2021-08-31T23:54:32.020' AS DateTime), 0, CAST(46979.55000000000000000000 AS Decimal(38, 20)), CAST(0.00007279874643906890 AS Decimal(38, 20)), CAST(3.42005234827155934100 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (356, CAST(N'2021-08-31T23:54:32.227' AS DateTime), CAST(N'2021-08-31T23:54:32.230' AS DateTime), 0, CAST(46979.55000000000000000000 AS Decimal(38, 20)), CAST(0.00009386372095619500 AS Decimal(38, 20)), CAST(4.40967537184761081225 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (357, CAST(N'2021-08-31T23:54:34.063' AS DateTime), CAST(N'2021-08-31T23:54:34.070' AS DateTime), 0, CAST(46964.84000000000000000000 AS Decimal(38, 20)), CAST(0.00072980162297831900 AS Decimal(38, 20)), CAST(34.27501645491707530396 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (358, CAST(N'2021-08-31T23:54:34.253' AS DateTime), CAST(N'2021-08-31T23:54:34.257' AS DateTime), 0, CAST(46962.53000000000000000000 AS Decimal(38, 20)), CAST(0.00052766529220513290 AS Decimal(38, 20)), CAST(59.94217682918178373110 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (359, CAST(N'2021-08-31T23:54:36.107' AS DateTime), CAST(N'2021-08-31T23:54:36.107' AS DateTime), 0, CAST(46949.23000000000000000000 AS Decimal(38, 20)), CAST(0.00242912767987192000 AS Decimal(38, 20)), CAST(114.04567414167314262160 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (360, CAST(N'2021-08-31T23:54:36.280' AS DateTime), CAST(N'2021-08-31T23:54:36.287' AS DateTime), 0, CAST(46949.22000000000000000000 AS Decimal(38, 20)), CAST(0.00017453012739985042 AS Decimal(38, 20)), CAST(78.82460851823836665120 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (361, CAST(N'2021-08-31T23:54:38.133' AS DateTime), CAST(N'2021-08-31T23:54:38.137' AS DateTime), 0, CAST(46945.08000000000000000000 AS Decimal(38, 20)), CAST(0.00228210808396438000 AS Decimal(38, 20)), CAST(107.13374657035453625040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (362, CAST(N'2021-08-31T23:54:38.310' AS DateTime), CAST(N'2021-08-31T23:54:38.310' AS DateTime), 0, CAST(46930.63000000000000000000 AS Decimal(38, 20)), CAST(0.00102474735282583000 AS Decimal(38, 20)), CAST(61.76611945354782005400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (365, CAST(N'2021-08-31T23:54:42.180' AS DateTime), CAST(N'2021-08-31T23:54:42.183' AS DateTime), 0, CAST(46947.27000000000000000000 AS Decimal(38, 20)), CAST(0.00108858438464281700 AS Decimal(38, 20)), CAST(118.75947406879387141590 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (366, CAST(N'2021-08-31T23:54:44.213' AS DateTime), CAST(N'2021-08-31T23:54:44.217' AS DateTime), 0, CAST(46957.38000000000000000000 AS Decimal(38, 20)), CAST(0.00070905201589179100 AS Decimal(38, 20)), CAST(63.15644543959455197820 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (367, CAST(N'2021-08-31T23:54:44.383' AS DateTime), CAST(N'2021-08-31T23:55:22.867' AS DateTime), 1, CAST(46957.39000000000000000000 AS Decimal(38, 20)), CAST(0.00092904087632383400 AS Decimal(38, 20)), CAST(101.44504129861632541730 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (368, CAST(N'2021-08-31T23:54:46.250' AS DateTime), CAST(N'2021-08-31T23:54:46.253' AS DateTime), 0, CAST(46961.56000000000000000000 AS Decimal(38, 20)), CAST(0.00049019074313817100 AS Decimal(38, 20)), CAST(63.55243812197715658880 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (369, CAST(N'2021-08-31T23:54:46.403' AS DateTime), CAST(N'2021-08-31T23:55:18.670' AS DateTime), 1, CAST(46961.56000000000000000000 AS Decimal(38, 20)), CAST(0.00006669751972271950 AS Decimal(38, 20)), CAST(3.13221957430967516242 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (370, CAST(N'2021-08-31T23:54:48.300' AS DateTime), CAST(N'2021-08-31T23:54:48.300' AS DateTime), 0, CAST(46962.99000000000000000000 AS Decimal(38, 20)), CAST(0.00099672613083232234 AS Decimal(38, 20)), CAST(47.20067450490361505400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (371, CAST(N'2021-08-31T23:54:48.417' AS DateTime), CAST(N'2021-08-31T23:55:16.640' AS DateTime), 1, CAST(46962.99000000000000000000 AS Decimal(38, 20)), CAST(0.00064347371284080400 AS Decimal(38, 20)), CAST(30.21944954140554984396 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (372, CAST(N'2021-08-31T23:54:52.333' AS DateTime), CAST(N'2021-08-31T23:55:18.827' AS DateTime), 1, CAST(46960.18000000000000000000 AS Decimal(38, 20)), CAST(0.00056929139288574300 AS Decimal(38, 20)), CAST(100.21536807518828959900 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (373, CAST(N'2021-08-31T23:54:52.447' AS DateTime), CAST(N'2021-08-31T23:54:52.447' AS DateTime), 0, CAST(46960.18000000000000000000 AS Decimal(38, 20)), CAST(0.00004088938419748540 AS Decimal(38, 20)), CAST(1.92017284200306993137 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (374, CAST(N'2021-08-31T23:54:56.393' AS DateTime), CAST(N'2021-08-31T23:54:56.393' AS DateTime), 0, CAST(46963.52000000000000000000 AS Decimal(38, 20)), CAST(0.00037747274780527774 AS Decimal(38, 20)), CAST(38.60548152241684928960 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (375, CAST(N'2021-08-31T23:54:56.490' AS DateTime), CAST(N'2021-08-31T23:54:56.490' AS DateTime), 0, CAST(46963.52000000000000000000 AS Decimal(38, 20)), CAST(0.00187673901793395000 AS Decimal(38, 20)), CAST(88.13827040352141950400 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (377, CAST(N'2021-08-31T23:54:58.507' AS DateTime), CAST(N'2021-08-31T23:54:58.510' AS DateTime), 0, CAST(46950.00000000000000000000 AS Decimal(38, 20)), CAST(0.00044827471116943000 AS Decimal(38, 20)), CAST(21.04649768940473850000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (379, CAST(N'2021-08-31T23:55:00.523' AS DateTime), CAST(N'2021-08-31T23:55:00.527' AS DateTime), 0, CAST(46949.01000000000000000000 AS Decimal(38, 20)), CAST(0.00115148640845506000 AS Decimal(38, 20)), CAST(125.82567920172818803620 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (384, CAST(N'2021-08-31T23:55:06.480' AS DateTime), CAST(N'2021-08-31T23:55:06.480' AS DateTime), 0, CAST(46927.55000000000000000000 AS Decimal(38, 20)), CAST(0.00047528661958653800 AS Decimal(38, 20)), CAST(22.30403660497824132190 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (386, CAST(N'2021-08-31T23:55:08.517' AS DateTime), CAST(N'2021-08-31T23:55:08.520' AS DateTime), 0, CAST(46936.49000000000000000000 AS Decimal(38, 20)), CAST(0.00003813565491611800 AS Decimal(38, 20)), CAST(56.19941444445955059610 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (388, CAST(N'2021-08-31T23:55:10.533' AS DateTime), CAST(N'2021-08-31T23:55:10.537' AS DateTime), 0, CAST(46942.82000000000000000000 AS Decimal(38, 20)), CAST(0.00055547518588392000 AS Decimal(38, 20)), CAST(90.09525404534255114860 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (391, CAST(N'2021-08-31T23:55:12.760' AS DateTime), CAST(N'2021-08-31T23:55:12.763' AS DateTime), 0, CAST(46950.44000000000000000000 AS Decimal(38, 20)), CAST(0.00086838481322321800 AS Decimal(38, 20)), CAST(114.90234243793074356960 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (392, CAST(N'2021-08-31T23:55:14.587' AS DateTime), CAST(N'2021-08-31T23:55:14.587' AS DateTime), 0, CAST(46945.27000000000000000000 AS Decimal(38, 20)), CAST(0.00112372146901848400 AS Decimal(38, 20)), CAST(63.30382418740434577140 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (393, CAST(N'2021-08-31T23:55:14.777' AS DateTime), CAST(N'2021-08-31T23:55:14.777' AS DateTime), 0, CAST(46940.86000000000000000000 AS Decimal(38, 20)), CAST(0.00114836159262264400 AS Decimal(38, 20)), CAST(101.46202128064685167360 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (394, CAST(N'2021-08-31T23:55:16.623' AS DateTime), CAST(N'2021-08-31T23:55:30.837' AS DateTime), 0, CAST(46962.98000000000000000000 AS Decimal(38, 20)), CAST(0.00057542680645148600 AS Decimal(38, 20)), CAST(83.46869856016741549940 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (395, CAST(N'2021-08-31T23:55:16.803' AS DateTime), CAST(N'2021-08-31T23:55:30.840' AS DateTime), 0, CAST(46962.98000000000000000000 AS Decimal(38, 20)), CAST(0.00113083355954421600 AS Decimal(38, 20)), CAST(58.26017960038129832480 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (396, CAST(N'2021-08-31T23:55:18.670' AS DateTime), CAST(N'2021-08-31T23:55:18.673' AS DateTime), 0, CAST(46958.67000000000000000000 AS Decimal(38, 20)), CAST(0.00102424707516294850 AS Decimal(38, 20)), CAST(92.92081351451884690320 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (397, CAST(N'2021-08-31T23:55:18.827' AS DateTime), CAST(N'2021-08-31T23:55:18.827' AS DateTime), 0, CAST(46958.67000000000000000000 AS Decimal(38, 20)), CAST(0.00054051144562685850 AS Decimal(38, 20)), CAST(77.49656386519113611820 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (398, CAST(N'2021-08-31T23:55:20.697' AS DateTime), CAST(N'2021-08-31T23:55:34.987' AS DateTime), 0, CAST(46958.71000000000000000000 AS Decimal(38, 20)), CAST(0.00026384044190116000 AS Decimal(38, 20)), CAST(126.07467054571999100040 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (399, CAST(N'2021-08-31T23:55:20.850' AS DateTime), CAST(N'2021-08-31T23:55:20.850' AS DateTime), 1, CAST(46958.71000000000000000000 AS Decimal(38, 20)), CAST(0.00109158064806442000 AS Decimal(38, 20)), CAST(51.25921909406916009820 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (400, CAST(N'2021-08-31T23:55:22.730' AS DateTime), CAST(N'2021-08-31T23:55:22.730' AS DateTime), 0, CAST(46954.85000000000000000000 AS Decimal(38, 20)), CAST(0.00044668235156996300 AS Decimal(38, 20)), CAST(20.97390281561487717055 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (401, CAST(N'2021-08-31T23:55:22.867' AS DateTime), CAST(N'2021-08-31T23:55:22.870' AS DateTime), 0, CAST(46954.85000000000000000000 AS Decimal(38, 20)), CAST(0.00078464048266627300 AS Decimal(38, 20)), CAST(117.30832732669907444300 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (404, CAST(N'2021-08-31T23:55:26.790' AS DateTime), CAST(N'2021-08-31T23:55:41.140' AS DateTime), 0, CAST(46955.11000000000000000000 AS Decimal(38, 20)), CAST(0.00001595135560070400 AS Decimal(38, 20)), CAST(35.27069540958090135477 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (405, CAST(N'2021-08-31T23:55:26.910' AS DateTime), CAST(N'2021-08-31T23:55:41.143' AS DateTime), 0, CAST(46955.11000000000000000000 AS Decimal(38, 20)), CAST(0.00024501973830397200 AS Decimal(38, 20)), CAST(11.50492876423421869692 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (406, CAST(N'2021-08-31T23:55:28.817' AS DateTime), CAST(N'2021-08-31T23:55:28.820' AS DateTime), 1, CAST(46970.00000000000000000000 AS Decimal(38, 20)), CAST(0.00051069381163022200 AS Decimal(38, 20)), CAST(23.98728833227152734000 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (408, CAST(N'2021-08-31T23:55:30.837' AS DateTime), CAST(N'2021-08-31T23:55:30.840' AS DateTime), 1, CAST(46980.85000000000000000000 AS Decimal(38, 20)), CAST(0.00010972186518354400 AS Decimal(38, 20)), CAST(90.47121529560578257150 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (409, CAST(N'2021-08-31T23:55:31.030' AS DateTime), CAST(N'2021-08-31T23:55:31.033' AS DateTime), 1, CAST(46980.86000000000000000000 AS Decimal(38, 20)), CAST(0.00132937733285566000 AS Decimal(38, 20)), CAST(62.45529036206516266760 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [Price], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (412, CAST(N'2021-08-31T23:55:34.983' AS DateTime), CAST(N'2021-08-31T23:55:34.990' AS DateTime), 1, CAST(46975.19000000000000000000 AS Decimal(38, 20)), CAST(0.00073520640783720300 AS Decimal(38, 20)), CAST(46.93041558536105221397 AS Decimal(38, 20)), 1, N'f15ad39c-2e1d-492b-b3af-047fad496645', N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] ON 
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (83, CAST(N'2021-08-31T23:48:47.880' AS DateTime), 0, CAST(47121.99000000000000000000 AS Decimal(38, 20)), CAST(0.00196305383218595000 AS Decimal(38, 20)), CAST(92.50300304972801404050 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (84, CAST(N'2021-08-31T23:48:48.113' AS DateTime), 0, CAST(47122.00000000000000000000 AS Decimal(38, 20)), CAST(0.00085084508110342800 AS Decimal(38, 20)), CAST(40.09352191175573421600 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (85, CAST(N'2021-08-31T23:48:49.900' AS DateTime), 0, CAST(47122.00000000000000000000 AS Decimal(38, 20)), CAST(0.00263929863816095000 AS Decimal(38, 20)), CAST(124.36903042742028590000 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (86, CAST(N'2021-08-31T23:48:50.140' AS DateTime), 0, CAST(47121.95000000000000000000 AS Decimal(38, 20)), CAST(0.00122954025363063000 AS Decimal(38, 20)), CAST(57.93833435456986532850 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (92, CAST(N'2021-08-31T23:48:56.217' AS DateTime), 0, CAST(47119.16000000000000000000 AS Decimal(38, 20)), CAST(0.00195979389714068000 AS Decimal(38, 20)), CAST(92.34384220639524342880 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (184, CAST(N'2021-08-31T23:51:13.490' AS DateTime), 0, CAST(47089.54000000000000000000 AS Decimal(38, 20)), CAST(0.00128873010812734000 AS Decimal(38, 20)), CAST(60.68570797586670202360 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (187, CAST(N'2021-08-31T23:51:15.863' AS DateTime), 0, CAST(47087.99000000000000000000 AS Decimal(38, 20)), CAST(0.00064916195648217700 AS Decimal(38, 20)), CAST(30.56773171521318575423 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (188, CAST(N'2021-08-31T23:51:17.593' AS DateTime), 0, CAST(47088.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005591315103504490 AS Decimal(38, 20)), CAST(2.63283901506970460165 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (189, CAST(N'2021-08-31T23:51:17.883' AS DateTime), 0, CAST(47088.01000000000000000000 AS Decimal(38, 20)), CAST(0.00098510766890137800 AS Decimal(38, 20)), CAST(46.38675976430477627778 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (195, CAST(N'2021-08-31T23:51:27.697' AS DateTime), 0, CAST(47100.41000000000000000000 AS Decimal(38, 20)), CAST(0.00185767133192051000 AS Decimal(38, 20)), CAST(87.49708137870210840910 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (197, CAST(N'2021-08-31T23:51:29.710' AS DateTime), 0, CAST(47098.08000000000000000000 AS Decimal(38, 20)), CAST(0.00025828730112793300 AS Decimal(38, 20)), CAST(12.16483597150747866864 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (198, CAST(N'2021-08-31T23:51:30.007' AS DateTime), 0, CAST(47098.08000000000000000000 AS Decimal(38, 20)), CAST(0.00013013567897963100 AS Decimal(38, 20)), CAST(6.12914061943697920848 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (199, CAST(N'2021-08-31T23:51:31.737' AS DateTime), 0, CAST(47098.20000000000000000000 AS Decimal(38, 20)), CAST(0.00260472020721283000 AS Decimal(38, 20)), CAST(122.67763326335130990600 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (200, CAST(N'2021-08-31T23:51:32.023' AS DateTime), 0, CAST(47096.46000000000000000000 AS Decimal(38, 20)), CAST(0.00214432357928917000 AS Decimal(38, 20)), CAST(100.99004967904922333820 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (237, CAST(N'2021-08-31T23:52:12.463' AS DateTime), 0, CAST(47083.21000000000000000000 AS Decimal(38, 20)), CAST(0.00017758004170731130 AS Decimal(38, 20)), CAST(67.26577842640357873280 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (293, CAST(N'2021-08-31T23:53:23.153' AS DateTime), 0, CAST(47077.60000000000000000000 AS Decimal(38, 20)), CAST(0.00150702649006016000 AS Decimal(38, 20)), CAST(70.94719028845618841600 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (294, CAST(N'2021-08-31T23:53:23.313' AS DateTime), 0, CAST(47077.60000000000000000000 AS Decimal(38, 20)), CAST(0.00053839289319626700 AS Decimal(38, 20)), CAST(25.34624526873657931920 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (300, CAST(N'2021-08-31T23:53:29.410' AS DateTime), 0, CAST(47086.48000000000000000000 AS Decimal(38, 20)), CAST(0.00136435995719599000 AS Decimal(38, 20)), CAST(64.24290783730983921520 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (301, CAST(N'2021-08-31T23:53:31.277' AS DateTime), 0, CAST(47082.93000000000000000000 AS Decimal(38, 20)), CAST(0.00194261213682714000 AS Decimal(38, 20)), CAST(91.46387125538265472020 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (302, CAST(N'2021-08-31T23:53:31.430' AS DateTime), 0, CAST(47077.61000000000000000000 AS Decimal(38, 20)), CAST(0.00138177240047686000 AS Decimal(38, 20)), CAST(65.05054217841342910460 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (333, CAST(N'2021-08-31T23:54:09.687' AS DateTime), 1, CAST(46920.28000000000000000000 AS Decimal(38, 20)), CAST(0.00242537160740484000 AS Decimal(38, 20)), CAST(113.79911492348516615520 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (334, CAST(N'2021-08-31T23:54:09.900' AS DateTime), 1, CAST(46924.97000000000000000000 AS Decimal(38, 20)), CAST(0.00021886127275361700 AS Decimal(38, 20)), CAST(10.27005865812529511649 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (335, CAST(N'2021-08-31T23:54:11.717' AS DateTime), 1, CAST(46948.73000000000000000000 AS Decimal(38, 20)), CAST(0.00149327585929691600 AS Decimal(38, 20)), CAST(124.02152348805940415880 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (337, CAST(N'2021-08-31T23:54:13.740' AS DateTime), 1, CAST(46947.01000000000000000000 AS Decimal(38, 20)), CAST(0.00262484315555768000 AS Decimal(38, 20)), CAST(123.22853787239795853680 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (338, CAST(N'2021-08-31T23:54:13.963' AS DateTime), 1, CAST(46948.70000000000000000000 AS Decimal(38, 20)), CAST(0.00189061388358968000 AS Decimal(38, 20)), CAST(88.76186403648680941600 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (343, CAST(N'2021-08-31T23:54:19.813' AS DateTime), 1, CAST(46939.45000000000000000000 AS Decimal(38, 20)), CAST(0.00140047370470151000 AS Decimal(38, 20)), CAST(65.73746543815129356950 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (344, CAST(N'2021-08-31T23:54:20.063' AS DateTime), 1, CAST(46944.99000000000000000000 AS Decimal(38, 20)), CAST(0.00092121600425858800 AS Decimal(38, 20)), CAST(43.24647610775937107412 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (347, CAST(N'2021-08-31T23:54:23.873' AS DateTime), 1, CAST(46942.89000000000000000000 AS Decimal(38, 20)), CAST(0.00210114096798987000 AS Decimal(38, 20)), CAST(98.63362933484198852430 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (348, CAST(N'2021-08-31T23:54:24.110' AS DateTime), 1, CAST(46945.71000000000000000000 AS Decimal(38, 20)), CAST(0.00149869151841788000 AS Decimal(38, 20)), CAST(70.35713740310545329480 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (363, CAST(N'2021-08-31T23:54:40.160' AS DateTime), 1, CAST(46947.29000000000000000000 AS Decimal(38, 20)), CAST(0.00162711562073190000 AS Decimal(38, 20)), CAST(76.38866891003052155100 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (364, CAST(N'2021-08-31T23:54:40.333' AS DateTime), 1, CAST(46947.39000000000000000000 AS Decimal(38, 20)), CAST(0.00141567528188027000 AS Decimal(38, 20)), CAST(66.46225957179296899530 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (376, CAST(N'2021-08-31T23:54:58.417' AS DateTime), 1, CAST(46950.00000000000000000000 AS Decimal(38, 20)), CAST(0.00071413130588556200 AS Decimal(38, 20)), CAST(33.52846481132713590000 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (378, CAST(N'2021-08-31T23:55:00.440' AS DateTime), 1, CAST(46949.01000000000000000000 AS Decimal(38, 20)), CAST(0.00243075477323996000 AS Decimal(38, 20)), CAST(114.12153015639061443960 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (380, CAST(N'2021-08-31T23:55:02.450' AS DateTime), 1, CAST(46935.51000000000000000000 AS Decimal(38, 20)), CAST(0.00212325849790278000 AS Decimal(38, 20)), CAST(99.65622046090090971780 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (381, CAST(N'2021-08-31T23:55:02.557' AS DateTime), 1, CAST(46935.52000000000000000000 AS Decimal(38, 20)), CAST(0.00223336017016944000 AS Decimal(38, 20)), CAST(104.82392093419115450880 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (382, CAST(N'2021-08-31T23:55:04.460' AS DateTime), 1, CAST(46938.24000000000000000000 AS Decimal(38, 20)), CAST(0.00245543730885509000 AS Decimal(38, 20)), CAST(115.25390570799433964160 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (383, CAST(N'2021-08-31T23:55:04.607' AS DateTime), 1, CAST(46938.24000000000000000000 AS Decimal(38, 20)), CAST(0.00073909246224867800 AS Decimal(38, 20)), CAST(34.69169937521938764672 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (385, CAST(N'2021-08-31T23:55:06.660' AS DateTime), 1, CAST(46927.56000000000000000000 AS Decimal(38, 20)), CAST(0.00134008059028540000 AS Decimal(38, 20)), CAST(62.88671230545352562400 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (387, CAST(N'2021-08-31T23:55:08.717' AS DateTime), 1, CAST(46936.49000000000000000000 AS Decimal(38, 20)), CAST(0.00208911072369158000 AS Decimal(38, 20)), CAST(98.05552459144260775420 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (389, CAST(N'2021-08-31T23:55:10.733' AS DateTime), 1, CAST(46942.82000000000000000000 AS Decimal(38, 20)), CAST(0.00014606252631454800 AS Decimal(38, 20)), CAST(6.85658688152909014536 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (390, CAST(N'2021-08-31T23:55:12.570' AS DateTime), 1, CAST(46950.45000000000000000000 AS Decimal(38, 20)), CAST(0.00254777373096336000 AS Decimal(38, 20)), CAST(119.61912316690868551200 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (402, CAST(N'2021-08-31T23:55:24.767' AS DateTime), 1, CAST(46954.81000000000000000000 AS Decimal(38, 20)), CAST(0.00074785461800538700 AS Decimal(38, 20)), CAST(35.11537149606552556147 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (403, CAST(N'2021-08-31T23:55:24.890' AS DateTime), 1, CAST(46954.81000000000000000000 AS Decimal(38, 20)), CAST(0.00143199399869516000 AS Decimal(38, 20)), CAST(67.23900612987148571960 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (407, CAST(N'2021-08-31T23:55:28.973' AS DateTime), 0, CAST(46968.38000000000000000000 AS Decimal(38, 20)), CAST(0.00168649908839096000 AS Decimal(38, 20)), CAST(79.21213005320019784480 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (410, CAST(N'2021-08-31T23:55:32.903' AS DateTime), 0, CAST(46979.94000000000000000000 AS Decimal(38, 20)), CAST(0.00205866744055351000 AS Decimal(38, 20)), CAST(96.71607283715746658940 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (411, CAST(N'2021-08-31T23:55:33.047' AS DateTime), 0, CAST(46979.94000000000000000000 AS Decimal(38, 20)), CAST(0.00234558900978676000 AS Decimal(38, 20)), CAST(110.19563094444139759440 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (413, CAST(N'2021-08-31T23:55:35.070' AS DateTime), 0, CAST(46975.19000000000000000000 AS Decimal(38, 20)), CAST(0.00129633336099625000 AS Decimal(38, 20)), CAST(60.89550593613743303750 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (414, CAST(N'2021-08-31T23:55:37.040' AS DateTime), 0, CAST(46977.68000000000000000000 AS Decimal(38, 20)), CAST(0.00030586918196914200 AS Decimal(38, 20)), CAST(14.36902455240812275056 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (415, CAST(N'2021-08-31T23:55:37.083' AS DateTime), 0, CAST(46977.68000000000000000000 AS Decimal(38, 20)), CAST(0.00214557312240152000 AS Decimal(38, 20)), CAST(100.79404756077943807360 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (416, CAST(N'2021-08-31T23:55:39.090' AS DateTime), 0, CAST(46976.62000000000000000000 AS Decimal(38, 20)), CAST(0.00252667077510928000 AS Decimal(38, 20)), CAST(118.69445286741410503360 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (417, CAST(N'2021-08-31T23:55:39.117' AS DateTime), 0, CAST(46976.62000000000000000000 AS Decimal(38, 20)), CAST(0.00057702282223711800 AS Decimal(38, 20)), CAST(27.10658185156064218116 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (418, CAST(N'2021-08-31T23:55:41.137' AS DateTime), 1, CAST(46977.19000000000000000000 AS Decimal(38, 20)), CAST(0.00007559469159487390 AS Decimal(38, 20)), CAST(3.55122619004379422634 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (419, CAST(N'2021-08-31T23:55:41.137' AS DateTime), 1, CAST(46977.19000000000000000000 AS Decimal(38, 20)), CAST(0.00089085790724068400 AS Decimal(38, 20)), CAST(54.10968983431579433840 AS Decimal(38, 20)), N'f15ad39c-2e1d-492b-b3af-047fad496645')
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
CREATE PROCEDURE [dbo].[spCreateBotAuthCode]
@botAuthCode nvarchar(450),
@userId nvarchar(450)
AS
BEGIN

insert into BotAuthCodes (BotAuthCode, UserId)
values (@botAuthCode, @userId)

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
CREATE PROCEDURE [dbo].[spDeleteBotAuthCode_ById]
@id nvarchar(450)
AS
BEGIN

delete from BotAuthCodes WHERE Id = @id

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
CREATE PROCEDURE [dbo].[spGetBotAuthCode_ByBotAuthCode]
@botAuthCode nvarchar(450)
AS
BEGIN

SELECT * FROM BotAuthCodes WHERE BotAuthCode = @botAuthCode
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetBotAuthCodes_ById]
@userid nvarchar(450)
AS
BEGIN

SELECT * FROM BotAuthCodes WHERE UserId = @userid
	
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
