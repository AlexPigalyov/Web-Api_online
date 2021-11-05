USE [Exchange]
GO
/****** Object:  Table [dbo].[Bots]    Script Date: 05.11.2021 21:52:39 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTC_USDT_CandleStick]    Script Date: 05.11.2021 21:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BTC_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTC_USDT_ClosedOrders]    Script Date: 05.11.2021 21:52:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[ExposedPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[TotalPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BTC_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTC_USDT_OpenOrders_Buy]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BTC_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTC_USDT_OpenOrders_Sell]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BTC_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 05.11.2021 21:52:40 ******/
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
/****** Object:  Table [dbo].[Events]    Script Date: 05.11.2021 21:52:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exceptions]    Script Date: 05.11.2021 21:52:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomeTransactions]    Script Date: 05.11.2021 21:52:40 ******/
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
	[FromAddress] [nvarchar](max) NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Date] [float] NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[IncomeWalletsId] [int] NOT NULL,
 CONSTRAINT [PK_IncomeTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomeWallets]    Script Date: 05.11.2021 21:52:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 05.11.2021 21:52:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutcomeTransactions]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FromWalletId] [int] NOT NULL,
	[FromAddress] [nvarchar](max) NOT NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
	[State] [int] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[ErrorText] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[LastUpdateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 05.11.2021 21:52:40 ******/
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
/****** Object:  Table [dbo].[Wallets]    Script Date: 05.11.2021 21:52:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bots] ON 
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (1, N'Binance', N'51899c8f-a387-4d1f-9062-31b02c2350c4', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (2, N'BitFinex', N'45f084a8-7f88-4195-8b5e-aaab76fc1982', N'1d6254fc-8f94-4229-b09f-a2b225c128b0')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (3, N'Kucoin', N'34bb06b3-ae3d-459f-b445-645ba4587dc9', N'cce4bbb8-e74c-4d2b-af4c-b87da455c6cf')
GO
INSERT [dbo].[Bots] ([Id], [Name], [BotAuthCode], [UserId]) VALUES (4, N'Poloniex', N'ace9f8a1-6557-407a-9e8c-54d4855841ec', N'824bef62-0f83-4e98-bec1-85ddca883324')
GO
SET IDENTITY_INSERT [dbo].[Bots] OFF
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_CandleStick] ON 
GO
INSERT [dbo].[BTC_USDT_CandleStick] ([Id], [Close], [CloseTime], [High], [Low], [Open], [OpenTime]) VALUES (25, CAST(1 AS Decimal(18, 0)), CAST(N'2021-10-30T20:21:17.453' AS DateTime), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(N'2021-10-30T20:20:57.507' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_CandleStick] OFF
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_ClosedOrders] ON 
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([Id], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (1, CAST(N'2021-10-30T20:20:56.907' AS DateTime), CAST(N'2021-10-30T20:20:57.507' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'4c05d081-eca8-4209-9132-64ceb6194d12')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([Id], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (2, CAST(N'2021-10-30T20:20:57.463' AS DateTime), CAST(N'2021-10-30T20:20:57.527' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'4c05d081-eca8-4209-9132-64ceb6194d12')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([Id], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (3, CAST(N'2021-10-30T20:21:17.197' AS DateTime), CAST(N'2021-10-30T20:21:17.453' AS DateTime), 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'4c05d081-eca8-4209-9132-64ceb6194d12')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([Id], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (4, CAST(N'2021-10-30T20:21:17.450' AS DateTime), CAST(N'2021-10-30T20:21:17.453' AS DateTime), 0, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(1.00000000000000000000 AS Decimal(38, 20)), 1, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'4c05d081-eca8-4209-9132-64ceb6194d12')
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_ClosedOrders] OFF
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
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created]) VALUES (9, N'ZEC', N'ZCash', CAST(N'2021-10-30T21:54:26.843' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (1, N'4c05d081-eca8-4209-9132-64ceb6194d12', 6, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address ZEC', CAST(N'2021-10-30T22:11:20.503' AS DateTime), N'ZEC')
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (2, N'4c05d081-eca8-4209-9132-64ceb6194d12', 6, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address ZEC', CAST(N'2021-10-31T22:21:16.173' AS DateTime), N'ZEC')
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (3, N'4c05d081-eca8-4209-9132-64ceb6194d12', 6, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address ZEC', CAST(N'2021-11-01T21:17:32.587' AS DateTime), N'ZEC')
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (4, N'4c05d081-eca8-4209-9132-64ceb6194d12', 6, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address ZEC', CAST(N'2021-11-01T21:19:51.893' AS DateTime), N'ZEC')
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (5, N'4c05d081-eca8-4209-9132-64ceb6194d12', 6, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address ZEC', CAST(N'2021-11-01T21:27:19.890' AS DateTime), N'ZEC')
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (6, N'4c05d081-eca8-4209-9132-64ceb6194d12', 6, CAST(0.00000000000000000000 AS Decimal(38, 20)), N'Create address ZEC', CAST(N'2021-11-03T17:40:41.060' AS DateTime), N'ZEC')
GO
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomeTransactions] ON 
GO
INSERT [dbo].[IncomeTransactions] ([Id], [CurrencyAcronim], [TransactionId], [Amount], [TransactionFee], [FromAddress], [ToAddress], [Date], [UserId], [IncomeWalletsId]) VALUES (4, N'ZEC', N'f5aa734c08f42bdbc86f2c7d35d5e7fc6b5cb28338d793d702dd838fd05d89b5', CAST(80000000.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), NULL, N'', 0, N'4c05d081-eca8-4209-9132-64ceb6194d12', 0)
GO
SET IDENTITY_INSERT [dbo].[IncomeTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[IncomeWallets] ON 
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (3, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'tmEUzjRQEqmUaxrmS2ff2k9WXaLibcgH5dq', N'4c05d081-eca8-4209-9132-64ceb6194d12', N'ZEC', CAST(N'2021-11-01T21:17:38.127' AS DateTime), CAST(N'2021-11-01T21:17:38.127' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (4, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'tmYzK1YLTC6MNcJrjBSSybQhvtzDGaozAi8', N'4c05d081-eca8-4209-9132-64ceb6194d12', N'ZEC', CAST(N'2021-11-01T21:19:54.507' AS DateTime), CAST(N'2021-11-01T21:19:54.507' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (5, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'tmKsT9HUthYoRquofgNafBRMayViVrSM5Qi', N'4c05d081-eca8-4209-9132-64ceb6194d12', N'ZEC', CAST(N'2021-11-01T21:27:21.740' AS DateTime), CAST(N'2021-11-01T21:27:21.740' AS DateTime))
GO
INSERT [dbo].[IncomeWallets] ([Id], [UserId], [Address], [AddressLabel], [CurrencyAcronim], [Created], [LastUpdate]) VALUES (6, N'4c05d081-eca8-4209-9132-64ceb6194d12', N'tmFH53pDxawueSByAAFmncXRShtvN7iPsJE', N'4c05d081-eca8-4209-9132-64ceb6194d12', N'ZEC', CAST(N'2021-11-03T17:40:43.440' AS DateTime), CAST(N'2021-11-03T17:40:43.440' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[IncomeWallets] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(1000012.99879081916472321792 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:28.957' AS DateTime), CAST(N'2021-09-16T21:36:28.957' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (2, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(3204910.74750266055938921790 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:28.983' AS DateTime), CAST(N'2021-09-16T21:36:28.983' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (3, N'1d6254fc-8f94-4229-b09f-a2b225c128b0', CAST(999999.96980768990051358754 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:28.983' AS DateTime), CAST(N'2021-09-16T21:36:28.983' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (4, N'1d6254fc-8f94-4229-b09f-a2b225c128b0', CAST(974950.45678522609272611672 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:28.987' AS DateTime), CAST(N'2021-09-16T21:36:28.987' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (5, N'cce4bbb8-e74c-4d2b-af4c-b87da455c6cf', CAST(1000000.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:28.990' AS DateTime), CAST(N'2021-09-16T21:36:28.990' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (6, N'cce4bbb8-e74c-4d2b-af4c-b87da455c6cf', CAST(1000000.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:28.990' AS DateTime), CAST(N'2021-09-16T21:36:28.990' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (7, N'824bef62-0f83-4e98-bec1-85ddca883324', CAST(999999.99810112686692789611 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:28.993' AS DateTime), CAST(N'2021-09-16T21:36:28.993' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (8, N'824bef62-0f83-4e98-bec1-85ddca883324', CAST(1000060.78686391560732683772 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:28.993' AS DateTime), CAST(N'2021-09-16T21:36:28.993' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (9, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(1.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:57.763' AS DateTime), CAST(N'2021-09-16T21:36:57.763' AS DateTime), N'9557d821738e44b9bd3319f35a3c0ed5')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (10, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(10.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:57.767' AS DateTime), CAST(N'2021-09-16T21:36:57.767' AS DateTime), N'59bdef4edf9e4a2bad9f6f521a184c96')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (11, N'4c05d081-eca8-4209-9132-64ceb6194d12', CAST(12.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-10-30T20:17:44.580' AS DateTime), CAST(N'2021-10-30T20:17:44.580' AS DateTime), N'77cbc8b188524a6da29de18e06d6e92d')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (12, N'4c05d081-eca8-4209-9132-64ceb6194d12', CAST(12.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-10-30T20:17:44.593' AS DateTime), CAST(N'2021-10-30T20:17:44.593' AS DateTime), N'd0dd188bf3a048b39b442d3324e31c2c')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (13, N'4c05d081-eca8-4209-9132-64ceb6194d12', CAST(80000000.00000000000000000000 AS Decimal(38, 20)), N'ZEC', CAST(N'2021-10-30T22:11:27.817' AS DateTime), CAST(N'2021-10-30T22:11:27.817' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Wallets]    Script Date: 05.11.2021 21:52:40 ******/
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [UC_Wallets] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[CurrencyAcronim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
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
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_Date]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_LastUpdateDate]  DEFAULT (getdate()) FOR [LastUpdateDate]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_LastUpdateDateTime]  DEFAULT (getdate()) FOR [LastUpdateDateTime]
GO
ALTER TABLE [dbo].[Transfers] ADD  CONSTRAINT [DF_Transfers_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Create_BTC_USDT_OpenOrder]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders] (IsBuy, Price, Amount, Total, CreateUserId)
VALUES (@isBuy, @price, @amount, @total, @userid)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity

END
GO
/****** Object:  StoredProcedure [dbo].[Create_BTC_USDT_OpenOrder_Buy]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder_Buy]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy] (Price, Amount, Total, CreateUserId)
VALUES (@price, @amount, @total, @userid)

set @new_identity = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[Create_BTC_USDT_OpenOrder_Sell]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder_Sell]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] (Price, Amount, Total, CreateUserId)
VALUES (@price, @amount, @total, @userid)

set @new_identity = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[CreateBot]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateBot]
@name nvarchar(450),
@botAuthCode nvarchar(450),
@userId nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Bots] (Name, BotAuthCode, UserId)
VALUES (@name, @botAuthCode, @userId)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateEvent]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20),
@comment nvarchar(450),
@whenDate datetime,
@currencyAcronim nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
VALUES (@userid, @type, @value, @comment, @whenDate, @currencyAcronim)

END

GO
/****** Object:  StoredProcedure [dbo].[CreateIncomeTransaction]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateIncomeTransaction]
@currencyAcronim nvarchar(10),
@transactionId nvarchar(max),
@amount decimal(38, 20),
@transactionFee decimal(38, 20),
@toAddress nvarchar(max),
@date decimal(38, 20),
@userId nvarchar(450),
@incomeWalletId int,
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[IncomeTransactions](CurrencyAcronim, TransactionId, Amount,
TransactionFee, ToAddress, Date, UserId, IncomeWalletsId)
VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee,
@toAddress, @date, @userId, @incomeWalletId)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

END
GO
/****** Object:  StoredProcedure [dbo].[CreateIncomeTransaction_UpdateBalance_CreateEvent]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateIncomeTransaction_UpdateBalance_CreateEvent]
@currencyAcronim nvarchar(10),
@transactionId nvarchar(max),
@amount decimal(38, 20),
@transactionFee decimal(38, 20),
@fromAddress nvarchar(max),
@toAddress nvarchar(max),
@dateFloat decimal(38, 20),
@userId nvarchar(450),
@incomeWalletId int
AS
BEGIN

if 0 = (Select Count(*) From IncomeTransactions Where TransactionId = @transactionId) 
	BEGIN
		INSERT INTO [Exchange].[dbo].[IncomeTransactions](CurrencyAcronim, TransactionId, Amount,
			TransactionFee, FromAddress, ToAddress, Date, UserId, IncomeWalletsId)
		VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee, @fromAddress,
			@toAddress, @dateFloat, @userId, @incomeWalletId)

		UPDATE [Exchange].[dbo].[Wallets]
		SET Value = Value + @amount
		WHERE CurrencyAcronim = @currencyAcronim and UserId = @userId

		INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
		VALUES (@userid, 2, @amount, 'Income transaction '+ @currencyAcronim, GETDATE(), @currencyAcronim)

		RETURN
	END

END
GO
/****** Object:  StoredProcedure [dbo].[CreateOutcomeTransaction]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOutcomeTransaction]
@fromWalletId int,
@fromAdress nvarchar(max),
@toAdress nvarchar(max),
@value decimal(38,20),
@currencyAcronim nvarchar(10),
@state int,
@errorText nvarchar(max)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[OutcomeTransactions] (FromWalletId, FromAddress, ToAddress,
			Value, CreateDate, CurrencyAcronim, State, LastUpdateDate, ErrorText)
VALUES (@fromWalletId, @fromAdress, @toAdress, @value, GETDATE(), @currencyAcronim, 1, GETDATE(), @errorText)

END

GO
/****** Object:  StoredProcedure [dbo].[CreateUserIncomeWallet]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUserIncomeWallet]
@userid nvarchar(450),
@address nvarchar(max),
@addressLabel nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[IncomeWallets] (UserId, Address, AddressLabel, CurrencyAcronim)
VALUES (@userid, @address, @addressLabel, @currencyAcronim)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

--Create inner wallet if not exist
--insert wallet if not exist
IF NOT EXISTS(SELECT 1 FROM [Exchange].[dbo].[Wallets] WHERE UserId = @userid AND CurrencyAcronim = @currencyAcronim)
BEGIN
INSERT INTO [Exchange].[dbo].[Wallets] (UserId, CurrencyAcronim, Value)
VALUES (@userid, @currencyAcronim, 0)
END

RETURN

END
GO
/****** Object:  StoredProcedure [dbo].[CreateUserWallet]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUserWallet]
@userid nvarchar(450),
@address nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Wallets] (UserId, Address, CurrencyAcronim, Value)
VALUES (@userid, @address, @currencyAcronim, 0)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBots_ById]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBots_ById]
@id nvarchar(450)
AS
BEGIN

DELETE FROM [Exchange].[dbo].[Bots] WHERE Id = @id

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_CandleStick]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_CandleStick]
AS
BEGIN

SELECT * 
FROM [Exchange].[dbo].[BTC_USDT_CandleStick]

END


GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_ClosedOrders_Top100]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
ORDER BY ClosedDate DESC

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_OpenOrder_ById]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
UNION
SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_OpenOrders]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrders]
AS
BEGIN

SELECT * FROM [BTC_USDT_OpenOrders]

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_OrderBookBuy_OrderByDescPrice]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC

END
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_OrderBookSell_OrderByPrice]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price

END
GO
/****** Object:  StoredProcedure [dbo].[GetBots_ByBotAuthCode]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBots_ByBotAuthCode]
@botAuthCode nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Bots] WHERE BotAuthCode = @botAuthCode
	
END






GO
/****** Object:  StoredProcedure [dbo].[GetBots_ById]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBots_ById]
@userid nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Bots] WHERE UserId = @userid
	
END






GO
/****** Object:  StoredProcedure [dbo].[GetCurrent_BTC_USDT_CandleStick]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrent_BTC_USDT_CandleStick]
AS
BEGIN

DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))
		
SELECT * FROM @CandleStick
END


GO
/****** Object:  StoredProcedure [dbo].[GetEventsByUserIdWithOrderByDescWhenDate]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEventsByUserIdWithOrderByDescWhenDate]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate Desc


END
GO
/****** Object:  StoredProcedure [dbo].[GetIncomeTransactionsByUserIdAndCurrencyAcronim]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIncomeTransactionsByUserIdAndCurrencyAcronim]
@userid nvarchar(450),
@currencyAcronim nvarchar(20)
AS
BEGIN

SELECT * FROM [dbo].[IncomeTransactions] as it WHERE it.UserId = @userid AND it.CurrencyAcronim = @currencyAcronim
	
END






GO
/****** Object:  StoredProcedure [dbo].[GetLastIncomeTransactionsByUserId]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastIncomeTransactionsByUserId]
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
/****** Object:  StoredProcedure [dbo].[GetManagerConfirmedOutcomeTransactionAndSetStateInWork]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetManagerConfirmedOutcomeTransactionAndSetStateInWork]
@currencyAcronim nvarchar(10)
AS
BEGIN

declare @transactionId int;

set @transactionId = (select top(1) Id from OutcomeTransactions 
						where [State] = 1 AND CurrencyAcronim = @currencyAcronim)

UPDATE [OutcomeTransactions]
SET [State] = 3,
LastUpdateDate = GetDate()
Where OutcomeTransactions.Id = @transactionId

select top(1) * from OutcomeTransactions 
Where OutcomeTransactions.Id = @transactionId


END


GO
/****** Object:  StoredProcedure [dbo].[GetUserIncomeWallets]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserIncomeWallets]
@userid nvarchar(450)
AS
BEGIN

SELECT iw.[Id]
      ,iw.[UserId]
      ,iw.[Address]
      ,iw.[AddressLabel]
      ,iw.[CurrencyAcronim]
      ,iw.[Created]
      ,iw.[LastUpdate]
  FROM [Exchange].[dbo].[IncomeWallets] iw
  where iw.[UserId] = @userid

END



GO
/****** Object:  StoredProcedure [dbo].[GetUserWalletByAcronim]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserWalletByAcronim]
@userId nvarchar(450),
@acronim nvarchar(450)
AS
BEGIN

SELECT w.[Id]
      ,w.[UserId]
      ,w.[Value]
      ,w.CurrencyAcronim
	  ,w.[Created]
	  ,w.[LastUpdate]
	  ,w.[Address]
  FROM [Exchange].[dbo].[Wallets] w
  where w.[UserId] = @userid AND w.CurrencyAcronim = @acronim

END
GO
/****** Object:  StoredProcedure [dbo].[GetUserWallets]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserWallets]
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
  FROM [Exchange].[dbo].[Wallets] w
  where w.[UserId] = @userid

END
GO
/****** Object:  StoredProcedure [dbo].[Move_BTC_USDT_FromOpenOrdersBuyToClosedOrders]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersBuyToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 1, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
GO
/****** Object:  StoredProcedure [dbo].[Move_BTC_USDT_FromOpenOrdersSellToClosedOrders]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersSellToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@id bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] WHERE Id = @id

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 0, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
GO
/****** Object:  StoredProcedure [dbo].[Move_BTC_USDT_FromOpenOrdersToClosedOrders]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 1, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
GO
/****** Object:  StoredProcedure [dbo].[Process_BTC_USDT_BuyOrder]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder_Buy]
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
/****** Object:  StoredProcedure [dbo].[Process_BTC_USDT_CandleStick]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_CandleStick]
AS
BEGIN

SELECT TOP(1) *
INTO #lastCandleStick
FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
ORDER BY Id DESC

IF NOT EXISTS(SELECT 1 FROM #lastCandleStick)
BEGIN	
	SELECT *
	INTO #closedOrdersByLastMinute 
	FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
	WHERE DATEADD(minute, -1, GETDATE()) < ClosedDate and ClosedDate < GETDATE()

	SELECT TOP (1) * INTO #firstOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate
	SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

	INSERT INTO [Exchange].[dbo].[BTC_USDT_CandleStick]([Open], OpenTime, High, Low, [Close], CloseTime)
	VALUES ((SELECT ExposedPrice FROM #firstOrder),
			(SELECT ClosedDate FROM #firstOrder),
			(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
			(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
			(SELECT ExposedPrice FROM #lastOrder),
			(SELECT ClosedDate FROM #lastOrder))
END
ELSE
BEGIN
	SELECT *
	INTO #closedOrdersByLastCandleStick
	FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
	WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

	SELECT TOP (1) * INTO #lastOrderByCandleStick FROM #closedOrdersByLastCandleStick ORDER BY ClosedDate DESC

	INSERT INTO [Exchange].[dbo].[BTC_USDT_CandleStick]([Open], OpenTime, High, Low, [Close], CloseTime)
	VALUES ((SELECT [Close] FROM #lastCandleStick),
			(SELECT CloseTime FROM #lastCandleStick),
			(SELECT max(ExposedPrice) FROM #closedOrdersByLastCandleStick),
			(SELECT min(ExposedPrice) FROM #closedOrdersByLastCandleStick),
			(SELECT ExposedPrice FROM #lastOrderByCandleStick),
			(SELECT ClosedDate FROM #lastOrderByCandleStick))
END

END
GO
/****** Object:  StoredProcedure [dbo].[Process_BTC_USDT_SellOrder]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder_Sell]
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				Total, CreateDate, ClosedDate, 
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
/****** Object:  StoredProcedure [dbo].[SendCoins]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendCoins]
@senderUserId nvarchar(450),
@receiverUserId nvarchar(450),
@typeSend int,
@typeRecieve int,

@Comment nvarchar(450),
@currencyAcronim nvarchar(10),
@value decimal(38,20),

@senderWalletId int,
@receiverWalletId int,
@hash varchar(66)
AS
BEGIN

UPDATE [Exchange].[dbo].[Wallets]
SET Value -= @value, LastUpdate = GETDATE()
WHERE ID = @senderWalletId

UPDATE [Exchange].[dbo].[Wallets]
SET Value += @value, LastUpdate = GETDATE()
WHERE Id = @receiverWalletId

insert into [Exchange].[dbo].[Transfers] (WalletFromId, WalletToId, Value, Date, CurrencyAcronim, Hash, Comment)
values (@senderWalletId, @receiverWalletId, @value, GETDATE(), @currencyAcronim, @hash, @Comment)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@senderUserId, @typeSend, @value, @Comment, GETDATE(), @currencyAcronim)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@receiverUserId, @typeRecieve, @value, @Comment, GETDATE(), @currencyAcronim)

END

GO
/****** Object:  StoredProcedure [dbo].[Update_BTC_USDT_OpenOrder]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@openOrderId bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
SET    IsBuy = @isBuy,
       Price = @price,
       Amount = @amount,
       CreateUserId = @userid
WHERE  OpenOrderId = @openOrderId 

END
GO
/****** Object:  StoredProcedure [dbo].[Update_BTC_USDT_OpenOrder_Buy]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder_Buy]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@id bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
SET    Price = @price,
       Amount = @amount,
	   Total = @total,
       CreateUserId = @userid
WHERE  Id = @id 

END
GO
/****** Object:  StoredProcedure [dbo].[Update_BTC_USDT_OpenOrder_Sell]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder_Sell]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@Id bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
SET    Price = @price,
       Amount = @amount,
	   Total = @total,
       CreateUserId = @userid
WHERE  Id = @Id 

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStateOutcomeTransaction]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStateOutcomeTransaction]
@id int,
@state int,
@errorText nvarchar(max)
AS
BEGIN

UPDATE [Exchange].[dbo].[OutcomeTransactions]
SET State = @state, LastUpdateDate = GETDATE(), ErrorText = @errorText
WHERE Id = @id

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateWalletBalance]    Script Date: 05.11.2021 21:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateWalletBalance]
@newWalletBalance decimal(38,20),
@walletId    INT    OUTPUT
AS
BEGIN

UPDATE [Exchange].[dbo].[Wallets]
SET Value = @newWalletBalance
WHERE Id = @walletId

RETURN

END
GO
