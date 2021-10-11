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
	[ClosedOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders](
	[OpenOrderId] [bigint] NOT NULL,
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
INSERT [dbo].[BTC_USDT_CandleStick] ([Id], [Close], [CloseTime], [High], [Low], [Open], [OpenTime]) VALUES (1, CAST(57357 AS Decimal(18, 0)), CAST(N'2021-10-11T20:40:49.127' AS DateTime), CAST(57388 AS Decimal(18, 0)), CAST(57357 AS Decimal(18, 0)), CAST(57370 AS Decimal(18, 0)), CAST(N'2021-10-11T20:40:02.813' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_CandleStick] OFF
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (36381, CAST(N'2021-10-11T20:37:24.480' AS DateTime), CAST(N'2021-10-11T20:40:02.813' AS DateTime), 1, CAST(57370.03000000000000000000 AS Decimal(38, 20)), CAST(0.17000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(3.44220180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37084, CAST(N'2021-10-11T20:38:31.727' AS DateTime), CAST(N'2021-10-11T20:40:02.937' AS DateTime), 1, CAST(57370.32000000000000000000 AS Decimal(38, 20)), CAST(0.46000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(10.32665760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37271, CAST(N'2021-10-11T20:38:50.230' AS DateTime), CAST(N'2021-10-11T20:40:02.947' AS DateTime), 1, CAST(57370.63000000000000000000 AS Decimal(38, 20)), CAST(0.77000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(9.75300710000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37951, CAST(N'2021-10-11T20:40:00.430' AS DateTime), CAST(N'2021-10-11T20:40:02.143' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(6.88460880000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37952, CAST(N'2021-10-11T20:40:00.477' AS DateTime), CAST(N'2021-10-11T20:40:02.147' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16345660000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37953, CAST(N'2021-10-11T20:40:00.533' AS DateTime), CAST(N'2021-10-11T20:40:02.150' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(9.75319580000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37954, CAST(N'2021-10-11T20:40:00.580' AS DateTime), CAST(N'2021-10-11T20:40:02.153' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31089140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37955, CAST(N'2021-10-11T20:40:00.633' AS DateTime), CAST(N'2021-10-11T20:40:02.167' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(9.17947840000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37958, CAST(N'2021-10-11T20:40:00.967' AS DateTime), CAST(N'2021-10-11T20:40:02.290' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(10.32691320000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37959, CAST(N'2021-10-11T20:40:00.970' AS DateTime), CAST(N'2021-10-11T20:40:02.297' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(9.75319580000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37960, CAST(N'2021-10-11T20:40:01.783' AS DateTime), CAST(N'2021-10-11T20:40:02.303' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37961, CAST(N'2021-10-11T20:40:01.913' AS DateTime), CAST(N'2021-10-11T20:40:02.490' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(11.47434800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37962, CAST(N'2021-10-11T20:40:02.133' AS DateTime), CAST(N'2021-10-11T20:40:02.143' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14743460000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37963, CAST(N'2021-10-11T20:40:02.140' AS DateTime), CAST(N'2021-10-11T20:40:02.157' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58973840000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37964, CAST(N'2021-10-11T20:40:02.133' AS DateTime), CAST(N'2021-10-11T20:40:02.160' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16345570000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37965, CAST(N'2021-10-11T20:40:02.137' AS DateTime), CAST(N'2021-10-11T20:40:02.163' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(10.32691140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37966, CAST(N'2021-10-11T20:40:02.137' AS DateTime), CAST(N'2021-10-11T20:40:02.167' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(9.17947680000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37967, CAST(N'2021-10-11T20:40:02.130' AS DateTime), CAST(N'2021-10-11T20:40:02.173' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(9.75319410000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37968, CAST(N'2021-10-11T20:40:02.270' AS DateTime), CAST(N'2021-10-11T20:40:02.490' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60576100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37969, CAST(N'2021-10-11T20:40:02.277' AS DateTime), CAST(N'2021-10-11T20:40:02.280' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44230380000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37970, CAST(N'2021-10-11T20:40:02.290' AS DateTime), CAST(N'2021-10-11T20:40:02.293' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60575950000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37971, CAST(N'2021-10-11T20:40:02.480' AS DateTime), CAST(N'2021-10-11T20:40:02.483' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01602110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37972, CAST(N'2021-10-11T20:40:02.483' AS DateTime), CAST(N'2021-10-11T20:40:02.490' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73717300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37973, CAST(N'2021-10-11T20:40:02.483' AS DateTime), CAST(N'2021-10-11T20:40:02.497' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.02000000000000000000 AS Decimal(38, 20)), CAST(57371.75000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(12.04806330000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37974, CAST(N'2021-10-11T20:40:02.483' AS DateTime), CAST(N'2021-10-11T20:40:02.497' AS DateTime), 0, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(-0.02000000000000000000 AS Decimal(38, 20)), CAST(57371.75000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(10.90062870000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37975, CAST(N'2021-10-11T20:40:02.597' AS DateTime), CAST(N'2021-10-11T20:40:02.800' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86849350000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37976, CAST(N'2021-10-11T20:40:02.643' AS DateTime), CAST(N'2021-10-11T20:40:02.807' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86849350000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37977, CAST(N'2021-10-11T20:40:02.793' AS DateTime), CAST(N'2021-10-11T20:40:02.823' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.46000000000000000000 AS Decimal(38, 20)), CAST(57370.32000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(13.19506780000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37978, CAST(N'2021-10-11T20:40:02.877' AS DateTime), CAST(N'2021-10-11T20:40:02.880' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.46000000000000000000 AS Decimal(38, 20)), CAST(57370.32000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86849300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37979, CAST(N'2021-10-11T20:40:02.930' AS DateTime), CAST(N'2021-10-11T20:40:02.947' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.77000000000000000000 AS Decimal(38, 20)), CAST(57370.63000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.60547900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37980, CAST(N'2021-10-11T20:40:03.130' AS DateTime), CAST(N'2021-10-11T20:40:05.253' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.62137140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37981, CAST(N'2021-10-11T20:40:03.183' AS DateTime), CAST(N'2021-10-11T20:40:05.253' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37984, CAST(N'2021-10-11T20:40:03.557' AS DateTime), CAST(N'2021-10-11T20:40:03.560' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60547900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37988, CAST(N'2021-10-11T20:40:05.243' AS DateTime), CAST(N'2021-10-11T20:40:05.250' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86849300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37989, CAST(N'2021-10-11T20:40:05.250' AS DateTime), CAST(N'2021-10-11T20:40:05.260' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(5.73698600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37996, CAST(N'2021-10-11T20:40:05.760' AS DateTime), CAST(N'2021-10-11T20:40:07.320' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.04767270000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37997, CAST(N'2021-10-11T20:40:05.760' AS DateTime), CAST(N'2021-10-11T20:40:07.327' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29479480000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37998, CAST(N'2021-10-11T20:40:06.143' AS DateTime), CAST(N'2021-10-11T20:40:07.327' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29479480000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (37999, CAST(N'2021-10-11T20:40:06.147' AS DateTime), CAST(N'2021-10-11T20:40:07.330' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01589090000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38000, CAST(N'2021-10-11T20:40:06.147' AS DateTime), CAST(N'2021-10-11T20:40:07.873' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(10.32657660000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38001, CAST(N'2021-10-11T20:40:06.533' AS DateTime), CAST(N'2021-10-11T20:40:07.877' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(10.90027530000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38002, CAST(N'2021-10-11T20:40:06.700' AS DateTime), CAST(N'2021-10-11T20:40:07.883' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(10.32657660000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38003, CAST(N'2021-10-11T20:40:06.707' AS DateTime), CAST(N'2021-10-11T20:40:07.927' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(5.16328830000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38004, CAST(N'2021-10-11T20:40:06.880' AS DateTime), CAST(N'2021-10-11T20:40:07.927' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57369870000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38005, CAST(N'2021-10-11T20:40:06.900' AS DateTime), CAST(N'2021-10-11T20:40:07.930' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.03178180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38006, CAST(N'2021-10-11T20:40:07.107' AS DateTime), CAST(N'2021-10-11T20:40:07.933' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14739740000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38007, CAST(N'2021-10-11T20:40:07.257' AS DateTime), CAST(N'2021-10-11T20:40:07.260' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(10.90027340000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38008, CAST(N'2021-10-11T20:40:07.317' AS DateTime), CAST(N'2021-10-11T20:40:07.330' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(12.62136920000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38009, CAST(N'2021-10-11T20:40:07.867' AS DateTime), CAST(N'2021-10-11T20:40:09.493' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(9.75287790000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38010, CAST(N'2021-10-11T20:40:07.873' AS DateTime), CAST(N'2021-10-11T20:40:07.870' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57369860000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38011, CAST(N'2021-10-11T20:40:07.873' AS DateTime), CAST(N'2021-10-11T20:40:09.567' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(11.47397400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38012, CAST(N'2021-10-11T20:40:07.873' AS DateTime), CAST(N'2021-10-11T20:40:07.877' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(9.75287620000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38013, CAST(N'2021-10-11T20:40:07.880' AS DateTime), CAST(N'2021-10-11T20:40:07.877' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.03178040000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38014, CAST(N'2021-10-11T20:40:07.877' AS DateTime), CAST(N'2021-10-11T20:40:07.880' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(12.62136920000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38015, CAST(N'2021-10-11T20:40:07.887' AS DateTime), CAST(N'2021-10-11T20:40:09.570' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(8.03178180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38016, CAST(N'2021-10-11T20:40:07.883' AS DateTime), CAST(N'2021-10-11T20:40:07.887' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(4.01589020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38017, CAST(N'2021-10-11T20:40:07.890' AS DateTime), CAST(N'2021-10-11T20:40:09.587' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.78000000000000000000 AS Decimal(38, 20)), CAST(57369.09000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(8.60548050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38018, CAST(N'2021-10-11T20:40:07.913' AS DateTime), CAST(N'2021-10-11T20:40:07.913' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38019, CAST(N'2021-10-11T20:40:07.930' AS DateTime), CAST(N'2021-10-11T20:40:07.930' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16328740000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38020, CAST(N'2021-10-11T20:40:07.927' AS DateTime), CAST(N'2021-10-11T20:40:07.930' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(8.60547900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38021, CAST(N'2021-10-11T20:40:07.927' AS DateTime), CAST(N'2021-10-11T20:40:07.933' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(11.47397200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38022, CAST(N'2021-10-11T20:40:08.230' AS DateTime), CAST(N'2021-10-11T20:40:09.580' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.86000000000000000000 AS Decimal(38, 20)), CAST(57369.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44219220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38023, CAST(N'2021-10-11T20:40:08.383' AS DateTime), CAST(N'2021-10-11T20:40:09.583' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(1.42000000000000000000 AS Decimal(38, 20)), CAST(57368.45000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(10.90027530000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38024, CAST(N'2021-10-11T20:40:08.713' AS DateTime), CAST(N'2021-10-11T20:40:09.590' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(3.50000000000000000000 AS Decimal(38, 20)), CAST(57366.37000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29479480000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38025, CAST(N'2021-10-11T20:40:08.807' AS DateTime), CAST(N'2021-10-11T20:40:09.583' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.87000000000000000000 AS Decimal(38, 20)), CAST(57369.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44219220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38026, CAST(N'2021-10-11T20:40:09.177' AS DateTime), CAST(N'2021-10-11T20:40:09.590' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.87000000000000000000 AS Decimal(38, 20)), CAST(57369.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(8.60548050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38027, CAST(N'2021-10-11T20:40:09.240' AS DateTime), CAST(N'2021-10-11T20:40:09.600' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.87000000000000000000 AS Decimal(38, 20)), CAST(57369.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38028, CAST(N'2021-10-11T20:40:09.490' AS DateTime), CAST(N'2021-10-11T20:40:09.490' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86849300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38029, CAST(N'2021-10-11T20:40:09.493' AS DateTime), CAST(N'2021-10-11T20:40:09.493' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86849300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38030, CAST(N'2021-10-11T20:40:09.493' AS DateTime), CAST(N'2021-10-11T20:40:09.497' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(9.17917760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38031, CAST(N'2021-10-11T20:40:09.537' AS DateTime), CAST(N'2021-10-11T20:40:09.537' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01589020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38032, CAST(N'2021-10-11T20:40:09.567' AS DateTime), CAST(N'2021-10-11T20:40:09.570' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(6.88438320000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38033, CAST(N'2021-10-11T20:40:09.570' AS DateTime), CAST(N'2021-10-11T20:40:09.570' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44219160000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38034, CAST(N'2021-10-11T20:40:09.573' AS DateTime), CAST(N'2021-10-11T20:40:09.570' AS DateTime), 0, CAST(57369.84000000000000000000 AS Decimal(38, 20)), CAST(-0.03000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72109520000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38035, CAST(N'2021-10-11T20:40:09.570' AS DateTime), CAST(N'2021-10-11T20:40:09.573' AS DateTime), 0, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(5.16328740000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38036, CAST(N'2021-10-11T20:40:09.580' AS DateTime), CAST(N'2021-10-11T20:40:09.583' AS DateTime), 0, CAST(57369.01000000000000000000 AS Decimal(38, 20)), CAST(-0.86000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(5.73690100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38037, CAST(N'2021-10-11T20:40:09.583' AS DateTime), CAST(N'2021-10-11T20:40:09.587' AS DateTime), 0, CAST(57368.45000000000000000000 AS Decimal(38, 20)), CAST(-1.42000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(12.62105900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38038, CAST(N'2021-10-11T20:40:09.583' AS DateTime), CAST(N'2021-10-11T20:40:09.593' AS DateTime), 0, CAST(57366.37000000000000000000 AS Decimal(38, 20)), CAST(-3.50000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29465480000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38039, CAST(N'2021-10-11T20:40:09.577' AS DateTime), CAST(N'2021-10-11T20:40:09.593' AS DateTime), 0, CAST(57369.09000000000000000000 AS Decimal(38, 20)), CAST(-0.78000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31059990000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38040, CAST(N'2021-10-11T20:40:09.600' AS DateTime), CAST(N'2021-10-11T20:40:25.090' AS DateTime), 0, CAST(57365.60000000000000000000 AS Decimal(38, 20)), CAST(-0.20000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72096800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38041, CAST(N'2021-10-11T20:40:09.603' AS DateTime), CAST(N'2021-10-11T20:40:25.087' AS DateTime), 0, CAST(57365.60000000000000000000 AS Decimal(38, 20)), CAST(-0.20000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(10.89946400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38042, CAST(N'2021-10-11T20:40:09.603' AS DateTime), CAST(N'2021-10-11T20:40:27.640' AS DateTime), 0, CAST(57366.28000000000000000000 AS Decimal(38, 20)), CAST(-3.59000000000000000000 AS Decimal(38, 20)), CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(5.16296520000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38043, CAST(N'2021-10-11T20:40:09.610' AS DateTime), CAST(N'2021-10-11T20:40:09.750' AS DateTime), 0, CAST(57362.04000000000000000000 AS Decimal(38, 20)), CAST(-2.96000000000000000000 AS Decimal(38, 20)), CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(9.75154680000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38044, CAST(N'2021-10-11T20:40:09.620' AS DateTime), CAST(N'2021-10-11T20:40:25.227' AS DateTime), 0, CAST(57365.67000000000000000000 AS Decimal(38, 20)), CAST(-0.13000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(10.32582060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38045, CAST(N'2021-10-11T20:40:09.743' AS DateTime), CAST(N'2021-10-11T20:40:09.757' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(2.96000000000000000000 AS Decimal(38, 20)), CAST(57362.04000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(9.75205000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38046, CAST(N'2021-10-11T20:40:09.780' AS DateTime), CAST(N'2021-10-11T20:40:10.880' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57364.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38047, CAST(N'2021-10-11T20:40:09.830' AS DateTime), CAST(N'2021-10-11T20:40:11.020' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57364.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38048, CAST(N'2021-10-11T20:40:09.873' AS DateTime), CAST(N'2021-10-11T20:40:11.963' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(2.98000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(10.32570000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38049, CAST(N'2021-10-11T20:40:09.920' AS DateTime), CAST(N'2021-10-11T20:40:11.963' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(2.98000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14730000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38050, CAST(N'2021-10-11T20:40:10.633' AS DateTime), CAST(N'2021-10-11T20:40:11.987' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(2.98000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(9.17840000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38051, CAST(N'2021-10-11T20:40:10.873' AS DateTime), CAST(N'2021-10-11T20:40:11.990' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(2.98000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31015000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38052, CAST(N'2021-10-11T20:40:11.023' AS DateTime), CAST(N'2021-10-11T20:40:11.020' AS DateTime), 0, CAST(57362.12000000000000000000 AS Decimal(38, 20)), CAST(-2.88000000000000000000 AS Decimal(38, 20)), CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(6.88345440000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38053, CAST(N'2021-10-11T20:40:11.080' AS DateTime), CAST(N'2021-10-11T20:40:11.810' AS DateTime), 1, CAST(57364.39000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57364.38000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(8.03101460000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38054, CAST(N'2021-10-11T20:40:11.280' AS DateTime), CAST(N'2021-10-11T20:40:11.277' AS DateTime), 0, CAST(57364.38000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57364.39000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57364380000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38055, CAST(N'2021-10-11T20:40:11.700' AS DateTime), CAST(N'2021-10-11T20:40:11.960' AS DateTime), 1, CAST(57364.39000000000000000000 AS Decimal(38, 20)), CAST(2.37000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(6.88372680000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38056, CAST(N'2021-10-11T20:40:11.720' AS DateTime), CAST(N'2021-10-11T20:40:11.960' AS DateTime), 1, CAST(57364.39000000000000000000 AS Decimal(38, 20)), CAST(2.37000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58915120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38057, CAST(N'2021-10-11T20:40:11.810' AS DateTime), CAST(N'2021-10-11T20:40:11.810' AS DateTime), 0, CAST(57364.38000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57364.39000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(11.47287600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38058, CAST(N'2021-10-11T20:40:11.960' AS DateTime), CAST(N'2021-10-11T20:40:11.963' AS DateTime), 0, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(-2.98000000000000000000 AS Decimal(38, 20)), CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.04602420000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38059, CAST(N'2021-10-11T20:40:11.983' AS DateTime), CAST(N'2021-10-11T20:40:11.983' AS DateTime), 0, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(-2.98000000000000000000 AS Decimal(38, 20)), CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60430300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38060, CAST(N'2021-10-11T20:40:11.990' AS DateTime), CAST(N'2021-10-11T20:40:13.333' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38061, CAST(N'2021-10-11T20:40:11.990' AS DateTime), CAST(N'2021-10-11T20:40:21.783' AS DateTime), 0, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(-2.83000000000000000000 AS Decimal(38, 20)), CAST(57364.85000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(13.19326460000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38062, CAST(N'2021-10-11T20:40:11.990' AS DateTime), CAST(N'2021-10-11T20:40:21.773' AS DateTime), 0, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.03000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(12.04602420000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38063, CAST(N'2021-10-11T20:40:12.030' AS DateTime), CAST(N'2021-10-11T20:40:13.337' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38064, CAST(N'2021-10-11T20:40:12.080' AS DateTime), CAST(N'2021-10-11T20:40:13.380' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01534070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38065, CAST(N'2021-10-11T20:40:12.177' AS DateTime), CAST(N'2021-10-11T20:40:12.177' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(10.89878380000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38066, CAST(N'2021-10-11T20:40:12.570' AS DateTime), CAST(N'2021-10-11T20:40:13.380' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38067, CAST(N'2021-10-11T20:40:12.677' AS DateTime), CAST(N'2021-10-11T20:40:13.427' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38068, CAST(N'2021-10-11T20:40:12.720' AS DateTime), CAST(N'2021-10-11T20:40:13.567' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38069, CAST(N'2021-10-11T20:40:12.727' AS DateTime), CAST(N'2021-10-11T20:40:13.570' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72086030000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38070, CAST(N'2021-10-11T20:40:12.780' AS DateTime), CAST(N'2021-10-11T20:40:13.570' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38071, CAST(N'2021-10-11T20:40:12.960' AS DateTime), CAST(N'2021-10-11T20:40:12.960' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38072, CAST(N'2021-10-11T20:40:13.237' AS DateTime), CAST(N'2021-10-11T20:40:13.687' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38073, CAST(N'2021-10-11T20:40:13.327' AS DateTime), CAST(N'2021-10-11T20:40:13.340' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(4.01534140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38074, CAST(N'2021-10-11T20:40:13.380' AS DateTime), CAST(N'2021-10-11T20:40:13.383' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(13.19326460000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38075, CAST(N'2021-10-11T20:40:13.427' AS DateTime), CAST(N'2021-10-11T20:40:13.430' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(12.61964440000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38076, CAST(N'2021-10-11T20:40:13.533' AS DateTime), CAST(N'2021-10-11T20:40:14.020' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(7.45706130000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38077, CAST(N'2021-10-11T20:40:13.567' AS DateTime), CAST(N'2021-10-11T20:40:13.570' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(9.75154340000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38078, CAST(N'2021-10-11T20:40:13.680' AS DateTime), CAST(N'2021-10-11T20:40:13.680' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17792320000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38079, CAST(N'2021-10-11T20:40:13.687' AS DateTime), CAST(N'2021-10-11T20:40:13.687' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(5.73620200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38080, CAST(N'2021-10-11T20:40:13.773' AS DateTime), CAST(N'2021-10-11T20:40:14.127' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(7.45706130000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38081, CAST(N'2021-10-11T20:40:13.863' AS DateTime), CAST(N'2021-10-11T20:40:14.130' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38082, CAST(N'2021-10-11T20:40:14.023' AS DateTime), CAST(N'2021-10-11T20:40:14.023' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(5.73620200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38083, CAST(N'2021-10-11T20:40:14.180' AS DateTime), CAST(N'2021-10-11T20:40:14.180' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38084, CAST(N'2021-10-11T20:40:14.230' AS DateTime), CAST(N'2021-10-11T20:40:14.230' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38085, CAST(N'2021-10-11T20:40:14.277' AS DateTime), CAST(N'2021-10-11T20:40:15.183' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38086, CAST(N'2021-10-11T20:40:14.397' AS DateTime), CAST(N'2021-10-11T20:40:15.180' AS DateTime), 0, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(4.01534070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38087, CAST(N'2021-10-11T20:40:14.487' AS DateTime), CAST(N'2021-10-11T20:40:14.483' AS DateTime), 1, CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58896160000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38088, CAST(N'2021-10-11T20:40:14.667' AS DateTime), CAST(N'2021-10-11T20:40:14.930' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(12.04602000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38089, CAST(N'2021-10-11T20:40:14.807' AS DateTime), CAST(N'2021-10-11T20:40:14.807' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38090, CAST(N'2021-10-11T20:40:14.933' AS DateTime), CAST(N'2021-10-11T20:40:14.933' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.61964220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38091, CAST(N'2021-10-11T20:40:15.127' AS DateTime), CAST(N'2021-10-11T20:40:15.127' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72086030000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38092, CAST(N'2021-10-11T20:40:15.183' AS DateTime), CAST(N'2021-10-11T20:40:15.303' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(4.01534070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38093, CAST(N'2021-10-11T20:40:15.210' AS DateTime), CAST(N'2021-10-11T20:40:15.307' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38094, CAST(N'2021-10-11T20:40:15.310' AS DateTime), CAST(N'2021-10-11T20:40:15.430' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(9.75154000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38095, CAST(N'2021-10-11T20:40:15.430' AS DateTime), CAST(N'2021-10-11T20:40:15.727' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(9.75154170000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38096, CAST(N'2021-10-11T20:40:15.577' AS DateTime), CAST(N'2021-10-11T20:40:16.093' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(4.58896080000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38097, CAST(N'2021-10-11T20:40:15.730' AS DateTime), CAST(N'2021-10-11T20:40:15.730' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(7.45706000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38098, CAST(N'2021-10-11T20:40:16.093' AS DateTime), CAST(N'2021-10-11T20:40:16.407' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.61964000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38099, CAST(N'2021-10-11T20:40:16.377' AS DateTime), CAST(N'2021-10-11T20:40:16.377' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00018000000000000000 AS Decimal(38, 20)), CAST(10.32516180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38100, CAST(N'2021-10-11T20:40:16.410' AS DateTime), CAST(N'2021-10-11T20:40:16.757' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(2.86810050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38101, CAST(N'2021-10-11T20:40:16.410' AS DateTime), CAST(N'2021-10-11T20:40:18.840' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38102, CAST(N'2021-10-11T20:40:16.410' AS DateTime), CAST(N'2021-10-11T20:40:18.943' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(8.60430150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38103, CAST(N'2021-10-11T20:40:16.413' AS DateTime), CAST(N'2021-10-11T20:40:18.947' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72086030000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38104, CAST(N'2021-10-11T20:40:16.480' AS DateTime), CAST(N'2021-10-11T20:40:19.903' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(7.45706130000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38105, CAST(N'2021-10-11T20:40:16.680' AS DateTime), CAST(N'2021-10-11T20:40:20.100' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38106, CAST(N'2021-10-11T20:40:16.707' AS DateTime), CAST(N'2021-10-11T20:40:20.410' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(9.75154170000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38107, CAST(N'2021-10-11T20:40:16.757' AS DateTime), CAST(N'2021-10-11T20:40:16.757' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(2.86810000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38108, CAST(N'2021-10-11T20:40:16.900' AS DateTime), CAST(N'2021-10-11T20:40:20.947' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(10.32516180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38109, CAST(N'2021-10-11T20:40:16.917' AS DateTime), CAST(N'2021-10-11T20:40:35.720' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38110, CAST(N'2021-10-11T20:40:17.617' AS DateTime), CAST(N'2021-10-11T20:40:36.383' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(12.61964220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38111, CAST(N'2021-10-11T20:40:17.687' AS DateTime), CAST(N'2021-10-11T20:40:36.387' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38112, CAST(N'2021-10-11T20:40:17.937' AS DateTime), CAST(N'2021-10-11T20:40:36.390' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17792160000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38113, CAST(N'2021-10-11T20:40:18.427' AS DateTime), CAST(N'2021-10-11T20:40:36.527' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(11.47240200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38114, CAST(N'2021-10-11T20:40:18.430' AS DateTime), CAST(N'2021-10-11T20:40:36.530' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38115, CAST(N'2021-10-11T20:40:18.430' AS DateTime), CAST(N'2021-10-11T20:40:37.120' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38116, CAST(N'2021-10-11T20:40:18.580' AS DateTime), CAST(N'2021-10-11T20:40:37.123' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38117, CAST(N'2021-10-11T20:40:18.623' AS DateTime), CAST(N'2021-10-11T20:40:38.767' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(2.86810050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38118, CAST(N'2021-10-11T20:40:18.717' AS DateTime), CAST(N'2021-10-11T20:40:18.713' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60430000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38119, CAST(N'2021-10-11T20:40:18.843' AS DateTime), CAST(N'2021-10-11T20:40:18.843' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(3.44172000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38120, CAST(N'2021-10-11T20:40:18.943' AS DateTime), CAST(N'2021-10-11T20:40:18.947' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(10.89878000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38121, CAST(N'2021-10-11T20:40:19.120' AS DateTime), CAST(N'2021-10-11T20:40:40.173' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38122, CAST(N'2021-10-11T20:40:19.173' AS DateTime), CAST(N'2021-10-11T20:40:19.173' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58896000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38123, CAST(N'2021-10-11T20:40:19.243' AS DateTime), CAST(N'2021-10-11T20:40:40.177' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38124, CAST(N'2021-10-11T20:40:19.333' AS DateTime), CAST(N'2021-10-11T20:40:40.180' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38125, CAST(N'2021-10-11T20:40:19.337' AS DateTime), CAST(N'2021-10-11T20:40:40.183' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38126, CAST(N'2021-10-11T20:40:19.340' AS DateTime), CAST(N'2021-10-11T20:40:40.187' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38127, CAST(N'2021-10-11T20:40:19.663' AS DateTime), CAST(N'2021-10-11T20:40:40.193' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.09000000000000000000 AS Decimal(38, 20)), CAST(57361.92000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.72086030000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38128, CAST(N'2021-10-11T20:40:19.707' AS DateTime), CAST(N'2021-10-11T20:40:40.217' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(1.63000000000000000000 AS Decimal(38, 20)), CAST(57360.38000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(12.61964220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38129, CAST(N'2021-10-11T20:40:19.740' AS DateTime), CAST(N'2021-10-11T20:40:40.387' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(1.64000000000000000000 AS Decimal(38, 20)), CAST(57360.37000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(8.03068140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38130, CAST(N'2021-10-11T20:40:19.860' AS DateTime), CAST(N'2021-10-11T20:40:40.387' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(1.64000000000000000000 AS Decimal(38, 20)), CAST(57360.37000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38131, CAST(N'2021-10-11T20:40:19.903' AS DateTime), CAST(N'2021-10-11T20:40:19.903' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(5.73620000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38132, CAST(N'2021-10-11T20:40:19.967' AS DateTime), CAST(N'2021-10-11T20:40:40.390' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(1.64000000000000000000 AS Decimal(38, 20)), CAST(57360.37000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(9.17792160000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38133, CAST(N'2021-10-11T20:40:19.970' AS DateTime), CAST(N'2021-10-11T20:40:40.393' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38134, CAST(N'2021-10-11T20:40:20.027' AS DateTime), CAST(N'2021-10-11T20:40:40.400' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38135, CAST(N'2021-10-11T20:40:20.103' AS DateTime), CAST(N'2021-10-11T20:40:20.103' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(8.60430000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38136, CAST(N'2021-10-11T20:40:20.153' AS DateTime), CAST(N'2021-10-11T20:40:40.403' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38137, CAST(N'2021-10-11T20:40:20.247' AS DateTime), CAST(N'2021-10-11T20:40:40.403' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38138, CAST(N'2021-10-11T20:40:20.277' AS DateTime), CAST(N'2021-10-11T20:40:40.403' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38139, CAST(N'2021-10-11T20:40:20.330' AS DateTime), CAST(N'2021-10-11T20:40:40.410' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(1.65000000000000000000 AS Decimal(38, 20)), CAST(57360.36000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(10.89878190000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38140, CAST(N'2021-10-11T20:40:20.360' AS DateTime), CAST(N'2021-10-11T20:40:40.460' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38141, CAST(N'2021-10-11T20:40:20.410' AS DateTime), CAST(N'2021-10-11T20:40:20.410' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(8.60430000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38142, CAST(N'2021-10-11T20:40:20.780' AS DateTime), CAST(N'2021-10-11T20:40:40.463' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01534070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38143, CAST(N'2021-10-11T20:40:20.827' AS DateTime), CAST(N'2021-10-11T20:40:40.467' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38145, CAST(N'2021-10-11T20:40:20.933' AS DateTime), CAST(N'2021-10-11T20:40:42.333' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38146, CAST(N'2021-10-11T20:40:20.947' AS DateTime), CAST(N'2021-10-11T20:40:20.947' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(8.03068000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38147, CAST(N'2021-10-11T20:40:20.983' AS DateTime), CAST(N'2021-10-11T20:40:42.510' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38148, CAST(N'2021-10-11T20:40:20.997' AS DateTime), CAST(N'2021-10-11T20:40:42.510' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(2.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38157, CAST(N'2021-10-11T20:40:21.777' AS DateTime), CAST(N'2021-10-11T20:40:21.777' AS DateTime), 1, CAST(57362.03000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(10.89878570000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38158, CAST(N'2021-10-11T20:40:21.780' AS DateTime), CAST(N'2021-10-11T20:40:21.777' AS DateTime), 1, CAST(57362.05000000000000000000 AS Decimal(38, 20)), CAST(0.03000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72086150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38159, CAST(N'2021-10-11T20:40:21.783' AS DateTime), CAST(N'2021-10-11T20:40:21.780' AS DateTime), 1, CAST(57363.67000000000000000000 AS Decimal(38, 20)), CAST(1.65000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01545690000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38160, CAST(N'2021-10-11T20:40:21.783' AS DateTime), CAST(N'2021-10-11T20:40:21.780' AS DateTime), 1, CAST(57363.68000000000000000000 AS Decimal(38, 20)), CAST(1.66000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73636800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38161, CAST(N'2021-10-11T20:40:21.783' AS DateTime), CAST(N'2021-10-11T20:40:21.780' AS DateTime), 1, CAST(57364.39000000000000000000 AS Decimal(38, 20)), CAST(2.37000000000000000000 AS Decimal(38, 20)), CAST(57362.02000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57364390000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38164, CAST(N'2021-10-11T20:40:21.967' AS DateTime), CAST(N'2021-10-11T20:40:22.173' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01537150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38165, CAST(N'2021-10-11T20:40:21.973' AS DateTime), CAST(N'2021-10-11T20:40:22.177' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362450000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38166, CAST(N'2021-10-11T20:40:22.173' AS DateTime), CAST(N'2021-10-11T20:40:22.177' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-1.24000000000000000000 AS Decimal(38, 20)), CAST(57363.68000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(6.30986840000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38167, CAST(N'2021-10-11T20:40:22.193' AS DateTime), CAST(N'2021-10-11T20:40:22.400' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(6.88349400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38168, CAST(N'2021-10-11T20:40:22.227' AS DateTime), CAST(N'2021-10-11T20:40:22.670' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(4.58899600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38169, CAST(N'2021-10-11T20:40:22.400' AS DateTime), CAST(N'2021-10-11T20:40:22.400' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(9.17799040000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38170, CAST(N'2021-10-11T20:40:22.430' AS DateTime), CAST(N'2021-10-11T20:40:23.527' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(12.61973900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38171, CAST(N'2021-10-11T20:40:22.480' AS DateTime), CAST(N'2021-10-11T20:40:35.720' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(8.03074300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38172, CAST(N'2021-10-11T20:40:22.557' AS DateTime), CAST(N'2021-10-11T20:40:35.723' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01537150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38175, CAST(N'2021-10-11T20:40:22.670' AS DateTime), CAST(N'2021-10-11T20:40:22.670' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29449760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38182, CAST(N'2021-10-11T20:40:22.940' AS DateTime), CAST(N'2021-10-11T20:40:22.940' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38183, CAST(N'2021-10-11T20:40:23.207' AS DateTime), CAST(N'2021-10-11T20:40:23.203' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29449760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38184, CAST(N'2021-10-11T20:40:23.230' AS DateTime), CAST(N'2021-10-11T20:40:23.230' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44174640000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38185, CAST(N'2021-10-11T20:40:23.277' AS DateTime), CAST(N'2021-10-11T20:40:23.277' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38186, CAST(N'2021-10-11T20:40:23.527' AS DateTime), CAST(N'2021-10-11T20:40:23.527' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(7.45711720000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38192, CAST(N'2021-10-11T20:40:24.387' AS DateTime), CAST(N'2021-10-11T20:40:24.383' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86812200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38195, CAST(N'2021-10-11T20:40:24.463' AS DateTime), CAST(N'2021-10-11T20:40:24.460' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.20000000000000000000 AS Decimal(38, 20)), CAST(57365.60000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44194800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38196, CAST(N'2021-10-11T20:40:24.473' AS DateTime), CAST(N'2021-10-11T20:40:26.037' AS DateTime), 0, CAST(57365.79000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(6.88389480000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38197, CAST(N'2021-10-11T20:40:24.923' AS DateTime), CAST(N'2021-10-11T20:40:24.920' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.20000000000000000000 AS Decimal(38, 20)), CAST(57365.60000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72097400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38198, CAST(N'2021-10-11T20:40:25.040' AS DateTime), CAST(N'2021-10-11T20:40:25.330' AS DateTime), 0, CAST(57365.79000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(8.03121060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38199, CAST(N'2021-10-11T20:40:25.087' AS DateTime), CAST(N'2021-10-11T20:40:25.090' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.13000000000000000000 AS Decimal(38, 20)), CAST(57365.67000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(10.89950200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38200, CAST(N'2021-10-11T20:40:25.227' AS DateTime), CAST(N'2021-10-11T20:40:25.227' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.79000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(10.32584400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38201, CAST(N'2021-10-11T20:40:25.290' AS DateTime), CAST(N'2021-10-11T20:40:25.330' AS DateTime), 0, CAST(57365.79000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16292110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38202, CAST(N'2021-10-11T20:40:25.330' AS DateTime), CAST(N'2021-10-11T20:40:25.330' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.79000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(9.75218600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38203, CAST(N'2021-10-11T20:40:25.560' AS DateTime), CAST(N'2021-10-11T20:40:25.560' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.79000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58926400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38204, CAST(N'2021-10-11T20:40:26.040' AS DateTime), CAST(N'2021-10-11T20:40:35.593' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(2.86829000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38205, CAST(N'2021-10-11T20:40:27.120' AS DateTime), CAST(N'2021-10-11T20:40:35.593' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72097400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38206, CAST(N'2021-10-11T20:40:27.227' AS DateTime), CAST(N'2021-10-11T20:40:35.597' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17852800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38207, CAST(N'2021-10-11T20:40:27.610' AS DateTime), CAST(N'2021-10-11T20:40:35.603' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.86829000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38208, CAST(N'2021-10-11T20:40:27.617' AS DateTime), CAST(N'2021-10-11T20:40:35.603' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01560600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38209, CAST(N'2021-10-11T20:40:27.617' AS DateTime), CAST(N'2021-10-11T20:40:35.607' AS DateTime), 1, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73658000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38211, CAST(N'2021-10-11T20:40:27.637' AS DateTime), CAST(N'2021-10-11T20:40:27.637' AS DateTime), 1, CAST(57369.86000000000000000000 AS Decimal(38, 20)), CAST(3.58000000000000000000 AS Decimal(38, 20)), CAST(57366.28000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29479440000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38212, CAST(N'2021-10-11T20:40:27.640' AS DateTime), CAST(N'2021-10-11T20:40:27.640' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(3.59000000000000000000 AS Decimal(38, 20)), CAST(57366.28000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72109610000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38215, CAST(N'2021-10-11T20:40:27.690' AS DateTime), CAST(N'2021-10-11T20:40:27.860' AS DateTime), 0, CAST(57371.65000000000000000000 AS Decimal(38, 20)), CAST(-0.08000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72114950000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38216, CAST(N'2021-10-11T20:40:27.733' AS DateTime), CAST(N'2021-10-11T20:40:27.860' AS DateTime), 0, CAST(57371.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.66000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(11.47433000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38217, CAST(N'2021-10-11T20:40:27.857' AS DateTime), CAST(N'2021-10-11T20:40:27.853' AS DateTime), 1, CAST(57371.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01601620000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38218, CAST(N'2021-10-11T20:40:27.860' AS DateTime), CAST(N'2021-10-11T20:40:27.860' AS DateTime), 1, CAST(57371.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.65000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45831580000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38219, CAST(N'2021-10-11T20:40:27.860' AS DateTime), CAST(N'2021-10-11T20:40:35.547' AS DateTime), 1, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(7.45832620000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38220, CAST(N'2021-10-11T20:40:27.863' AS DateTime), CAST(N'2021-10-11T20:40:35.550' AS DateTime), 1, CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.29000000000000000000 AS Decimal(38, 20)), CAST(57371.44000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(5.16345570000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38221, CAST(N'2021-10-11T20:40:27.863' AS DateTime), CAST(N'2021-10-11T20:40:35.550' AS DateTime), 1, CAST(57371.75000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38222, CAST(N'2021-10-11T20:40:27.873' AS DateTime), CAST(N'2021-10-11T20:40:35.593' AS DateTime), 1, CAST(57372.19000000000000000000 AS Decimal(38, 20)), CAST(0.75000000000000000000 AS Decimal(38, 20)), CAST(57371.44000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(10.32699420000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38223, CAST(N'2021-10-11T20:40:28.000' AS DateTime), CAST(N'2021-10-11T20:40:28.013' AS DateTime), 0, CAST(57377.64000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57377.65000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16398760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38224, CAST(N'2021-10-11T20:40:28.017' AS DateTime), CAST(N'2021-10-11T20:40:35.317' AS DateTime), 1, CAST(57377.65000000000000000000 AS Decimal(38, 20)), CAST(2.55000000000000000000 AS Decimal(38, 20)), CAST(57375.10000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86888250000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38225, CAST(N'2021-10-11T20:40:28.017' AS DateTime), CAST(N'2021-10-11T20:40:35.320' AS DateTime), 1, CAST(57377.65000000000000000000 AS Decimal(38, 20)), CAST(0.97000000000000000000 AS Decimal(38, 20)), CAST(57376.68000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(10.90175350000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38226, CAST(N'2021-10-11T20:40:28.067' AS DateTime), CAST(N'2021-10-11T20:40:28.127' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(6.88560000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38227, CAST(N'2021-10-11T20:40:28.080' AS DateTime), CAST(N'2021-10-11T20:40:28.127' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31180000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38228, CAST(N'2021-10-11T20:40:28.090' AS DateTime), CAST(N'2021-10-11T20:40:28.087' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73799900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38229, CAST(N'2021-10-11T20:40:28.127' AS DateTime), CAST(N'2021-10-11T20:40:28.130' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(7.45939870000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38230, CAST(N'2021-10-11T20:40:28.307' AS DateTime), CAST(N'2021-10-11T20:40:30.073' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(13.19740000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38231, CAST(N'2021-10-11T20:40:29.813' AS DateTime), CAST(N'2021-10-11T20:40:29.813' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16419910000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38232, CAST(N'2021-10-11T20:40:30.077' AS DateTime), CAST(N'2021-10-11T20:40:33.243' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(13.19739770000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38233, CAST(N'2021-10-11T20:40:30.117' AS DateTime), CAST(N'2021-10-11T20:40:31.630' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38234, CAST(N'2021-10-11T20:40:30.683' AS DateTime), CAST(N'2021-10-11T20:40:32.077' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31179890000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38235, CAST(N'2021-10-11T20:40:30.880' AS DateTime), CAST(N'2021-10-11T20:40:32.080' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38236, CAST(N'2021-10-11T20:40:30.883' AS DateTime), CAST(N'2021-10-11T20:40:33.083' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(2.86899950000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38237, CAST(N'2021-10-11T20:40:31.000' AS DateTime), CAST(N'2021-10-11T20:40:33.083' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(6.88559880000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38238, CAST(N'2021-10-11T20:40:32.080' AS DateTime), CAST(N'2021-10-11T20:40:32.080' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38239, CAST(N'2021-10-11T20:40:32.080' AS DateTime), CAST(N'2021-10-11T20:40:32.083' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38240, CAST(N'2021-10-11T20:40:32.313' AS DateTime), CAST(N'2021-10-11T20:40:32.313' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57380000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38241, CAST(N'2021-10-11T20:40:32.770' AS DateTime), CAST(N'2021-10-11T20:40:33.240' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(6.31179890000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38242, CAST(N'2021-10-11T20:40:32.873' AS DateTime), CAST(N'2021-10-11T20:40:32.873' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72140000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38243, CAST(N'2021-10-11T20:40:33.083' AS DateTime), CAST(N'2021-10-11T20:40:33.087' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(10.90220000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38244, CAST(N'2021-10-11T20:40:33.247' AS DateTime), CAST(N'2021-10-11T20:40:35.260' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31180000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38245, CAST(N'2021-10-11T20:40:33.247' AS DateTime), CAST(N'2021-10-11T20:40:35.267' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38246, CAST(N'2021-10-11T20:40:33.250' AS DateTime), CAST(N'2021-10-11T20:40:35.317' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.82000000000000000000 AS Decimal(38, 20)), CAST(57379.18000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(13.19740000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38247, CAST(N'2021-10-11T20:40:33.250' AS DateTime), CAST(N'2021-10-11T20:40:35.320' AS DateTime), 1, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(2.34000000000000000000 AS Decimal(38, 20)), CAST(57377.66000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01660000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38248, CAST(N'2021-10-11T20:40:33.260' AS DateTime), CAST(N'2021-10-11T20:40:35.323' AS DateTime), 1, CAST(57380.34000000000000000000 AS Decimal(38, 20)), CAST(2.69000000000000000000 AS Decimal(38, 20)), CAST(57377.65000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(12.04987140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38249, CAST(N'2021-10-11T20:40:33.270' AS DateTime), CAST(N'2021-10-11T20:40:33.377' AS DateTime), 1, CAST(57385.73000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(2.29542920000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38250, CAST(N'2021-10-11T20:40:33.277' AS DateTime), CAST(N'2021-10-11T20:40:33.430' AS DateTime), 1, CAST(57385.74000000000000000000 AS Decimal(38, 20)), CAST(0.67000000000000000000 AS Decimal(38, 20)), CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(12.05100540000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38251, CAST(N'2021-10-11T20:40:33.290' AS DateTime), CAST(N'2021-10-11T20:40:35.047' AS DateTime), 1, CAST(57388.02000000000000000000 AS Decimal(38, 20)), CAST(2.95000000000000000000 AS Decimal(38, 20)), CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31268220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38252, CAST(N'2021-10-11T20:40:33.290' AS DateTime), CAST(N'2021-10-11T20:40:33.433' AS DateTime), 1, CAST(57385.74000000000000000000 AS Decimal(38, 20)), CAST(0.67000000000000000000 AS Decimal(38, 20)), CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31243140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38253, CAST(N'2021-10-11T20:40:33.290' AS DateTime), CAST(N'2021-10-11T20:40:35.043' AS DateTime), 1, CAST(57386.91000000000000000000 AS Decimal(38, 20)), CAST(1.84000000000000000000 AS Decimal(38, 20)), CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(12.05125110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38254, CAST(N'2021-10-11T20:40:33.333' AS DateTime), CAST(N'2021-10-11T20:40:33.330' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-0.66000000000000000000 AS Decimal(38, 20)), CAST(57385.73000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14770140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38255, CAST(N'2021-10-11T20:40:33.377' AS DateTime), CAST(N'2021-10-11T20:40:33.380' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-0.67000000000000000000 AS Decimal(38, 20)), CAST(57385.74000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(9.75546190000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38256, CAST(N'2021-10-11T20:40:33.433' AS DateTime), CAST(N'2021-10-11T20:40:33.437' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-1.84000000000000000000 AS Decimal(38, 20)), CAST(57386.91000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(13.19856610000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38257, CAST(N'2021-10-11T20:40:33.480' AS DateTime), CAST(N'2021-10-11T20:40:33.477' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-1.84000000000000000000 AS Decimal(38, 20)), CAST(57386.91000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73850700000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38258, CAST(N'2021-10-11T20:40:33.527' AS DateTime), CAST(N'2021-10-11T20:40:33.523' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-1.84000000000000000000 AS Decimal(38, 20)), CAST(57386.91000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14770140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38259, CAST(N'2021-10-11T20:40:33.810' AS DateTime), CAST(N'2021-10-11T20:40:33.933' AS DateTime), 1, CAST(57385.08000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(9.18161280000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38260, CAST(N'2021-10-11T20:40:33.927' AS DateTime), CAST(N'2021-10-11T20:40:33.927' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57385.08000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86925350000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38261, CAST(N'2021-10-11T20:40:33.933' AS DateTime), CAST(N'2021-10-11T20:40:33.933' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(-1.84000000000000000000 AS Decimal(38, 20)), CAST(57386.91000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(6.88620840000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38267, CAST(N'2021-10-11T20:40:35.260' AS DateTime), CAST(N'2021-10-11T20:40:35.260' AS DateTime), 0, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.31180000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38268, CAST(N'2021-10-11T20:40:35.300' AS DateTime), CAST(N'2021-10-11T20:40:35.317' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38269, CAST(N'2021-10-11T20:40:35.317' AS DateTime), CAST(N'2021-10-11T20:40:35.320' AS DateTime), 0, CAST(57375.10000000000000000000 AS Decimal(38, 20)), CAST(-2.55000000000000000000 AS Decimal(38, 20)), CAST(57377.65000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(7.45876300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38270, CAST(N'2021-10-11T20:40:35.320' AS DateTime), CAST(N'2021-10-11T20:40:35.320' AS DateTime), 0, CAST(57377.54000000000000000000 AS Decimal(38, 20)), CAST(-2.80000000000000000000 AS Decimal(38, 20)), CAST(57380.34000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.18040640000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38271, CAST(N'2021-10-11T20:40:35.317' AS DateTime), CAST(N'2021-10-11T20:40:35.320' AS DateTime), 0, CAST(57379.99000000000000000000 AS Decimal(38, 20)), CAST(-0.35000000000000000000 AS Decimal(38, 20)), CAST(57380.34000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(10.90219810000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38272, CAST(N'2021-10-11T20:40:35.317' AS DateTime), CAST(N'2021-10-11T20:40:35.320' AS DateTime), 0, CAST(57379.18000000000000000000 AS Decimal(38, 20)), CAST(-1.16000000000000000000 AS Decimal(38, 20)), CAST(57380.34000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(7.45929340000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38279, CAST(N'2021-10-11T20:40:35.543' AS DateTime), CAST(N'2021-10-11T20:40:35.543' AS DateTime), 0, CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57371.74000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73717400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38280, CAST(N'2021-10-11T20:40:35.547' AS DateTime), CAST(N'2021-10-11T20:40:35.547' AS DateTime), 0, CAST(57370.71000000000000000000 AS Decimal(38, 20)), CAST(-1.02000000000000000000 AS Decimal(38, 20)), CAST(57371.73000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29482840000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38281, CAST(N'2021-10-11T20:40:35.550' AS DateTime), CAST(N'2021-10-11T20:40:35.550' AS DateTime), 0, CAST(57371.44000000000000000000 AS Decimal(38, 20)), CAST(-0.75000000000000000000 AS Decimal(38, 20)), CAST(57372.19000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01600080000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38282, CAST(N'2021-10-11T20:40:35.550' AS DateTime), CAST(N'2021-10-11T20:40:35.550' AS DateTime), 0, CAST(57371.44000000000000000000 AS Decimal(38, 20)), CAST(-0.75000000000000000000 AS Decimal(38, 20)), CAST(57372.19000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(9.75314480000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38289, CAST(N'2021-10-11T20:40:35.593' AS DateTime), CAST(N'2021-10-11T20:40:35.600' AS DateTime), 0, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(4.01560600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38290, CAST(N'2021-10-11T20:40:35.593' AS DateTime), CAST(N'2021-10-11T20:40:35.600' AS DateTime), 0, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(10.32584400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38291, CAST(N'2021-10-11T20:40:35.593' AS DateTime), CAST(N'2021-10-11T20:40:35.607' AS DateTime), 0, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(10.89950200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38292, CAST(N'2021-10-11T20:40:35.597' AS DateTime), CAST(N'2021-10-11T20:40:35.610' AS DateTime), 0, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.81000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(12.04681800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38293, CAST(N'2021-10-11T20:40:35.713' AS DateTime), CAST(N'2021-10-11T20:40:35.713' AS DateTime), 0, CAST(57365.80000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57365.81000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86829000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38294, CAST(N'2021-10-11T20:40:35.720' AS DateTime), CAST(N'2021-10-11T20:40:35.717' AS DateTime), 0, CAST(57362.50000000000000000000 AS Decimal(38, 20)), CAST(-1.18000000000000000000 AS Decimal(38, 20)), CAST(57363.68000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38295, CAST(N'2021-10-11T20:40:35.720' AS DateTime), CAST(N'2021-10-11T20:40:35.720' AS DateTime), 0, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(5.16262050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38296, CAST(N'2021-10-11T20:40:35.723' AS DateTime), CAST(N'2021-10-11T20:40:35.727' AS DateTime), 0, CAST(57362.44000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(12.04611240000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38297, CAST(N'2021-10-11T20:40:35.723' AS DateTime), CAST(N'2021-10-11T20:40:35.727' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(4.58896000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38302, CAST(N'2021-10-11T20:40:36.073' AS DateTime), CAST(N'2021-10-11T20:40:36.073' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14724000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38303, CAST(N'2021-10-11T20:40:36.323' AS DateTime), CAST(N'2021-10-11T20:40:36.320' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38306, CAST(N'2021-10-11T20:40:36.383' AS DateTime), CAST(N'2021-10-11T20:40:36.390' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(10.89878000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38307, CAST(N'2021-10-11T20:40:36.390' AS DateTime), CAST(N'2021-10-11T20:40:36.390' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(12.61964000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38308, CAST(N'2021-10-11T20:40:36.530' AS DateTime), CAST(N'2021-10-11T20:40:36.530' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(11.47240000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38315, CAST(N'2021-10-11T20:40:37.120' AS DateTime), CAST(N'2021-10-11T20:40:37.123' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(8.60430000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38323, CAST(N'2021-10-11T20:40:38.767' AS DateTime), CAST(N'2021-10-11T20:40:38.770' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(7.45706000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38330, CAST(N'2021-10-11T20:40:39.700' AS DateTime), CAST(N'2021-10-11T20:40:39.700' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14724000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38334, CAST(N'2021-10-11T20:40:40.170' AS DateTime), CAST(N'2021-10-11T20:40:40.170' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16258000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38335, CAST(N'2021-10-11T20:40:40.177' AS DateTime), CAST(N'2021-10-11T20:40:40.177' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(11.47240000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38336, CAST(N'2021-10-11T20:40:40.180' AS DateTime), CAST(N'2021-10-11T20:40:40.183' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(8.60430000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38337, CAST(N'2021-10-11T20:40:40.187' AS DateTime), CAST(N'2021-10-11T20:40:40.183' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38338, CAST(N'2021-10-11T20:40:40.183' AS DateTime), CAST(N'2021-10-11T20:40:40.183' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19326000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38339, CAST(N'2021-10-11T20:40:40.190' AS DateTime), CAST(N'2021-10-11T20:40:40.190' AS DateTime), 0, CAST(57361.96000000000000000000 AS Decimal(38, 20)), CAST(-0.05000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57361960000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38340, CAST(N'2021-10-11T20:40:40.197' AS DateTime), CAST(N'2021-10-11T20:40:40.197' AS DateTime), 0, CAST(57361.92000000000000000000 AS Decimal(38, 20)), CAST(-0.09000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(2.86809600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38341, CAST(N'2021-10-11T20:40:40.207' AS DateTime), CAST(N'2021-10-11T20:40:40.207' AS DateTime), 0, CAST(57361.00000000000000000000 AS Decimal(38, 20)), CAST(-1.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38342, CAST(N'2021-10-11T20:40:40.210' AS DateTime), CAST(N'2021-10-11T20:40:40.210' AS DateTime), 0, CAST(57361.91000000000000000000 AS Decimal(38, 20)), CAST(-0.10000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16257190000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38343, CAST(N'2021-10-11T20:40:40.190' AS DateTime), CAST(N'2021-10-11T20:40:40.210' AS DateTime), 0, CAST(57362.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.86810000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38344, CAST(N'2021-10-11T20:40:40.217' AS DateTime), CAST(N'2021-10-11T20:40:40.213' AS DateTime), 0, CAST(57361.91000000000000000000 AS Decimal(38, 20)), CAST(-0.10000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72085730000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38345, CAST(N'2021-10-11T20:40:40.217' AS DateTime), CAST(N'2021-10-11T20:40:40.217' AS DateTime), 0, CAST(57361.95000000000000000000 AS Decimal(38, 20)), CAST(-0.06000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14723900000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38346, CAST(N'2021-10-11T20:40:40.217' AS DateTime), CAST(N'2021-10-11T20:40:40.217' AS DateTime), 0, CAST(57361.91000000000000000000 AS Decimal(38, 20)), CAST(-0.10000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01533370000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38347, CAST(N'2021-10-11T20:40:40.217' AS DateTime), CAST(N'2021-10-11T20:40:40.220' AS DateTime), 0, CAST(57360.38000000000000000000 AS Decimal(38, 20)), CAST(-1.63000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45684940000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38348, CAST(N'2021-10-11T20:40:40.380' AS DateTime), CAST(N'2021-10-11T20:40:40.380' AS DateTime), 0, CAST(57360.37000000000000000000 AS Decimal(38, 20)), CAST(-1.64000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72081110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38349, CAST(N'2021-10-11T20:40:40.387' AS DateTime), CAST(N'2021-10-11T20:40:40.390' AS DateTime), 0, CAST(57360.37000000000000000000 AS Decimal(38, 20)), CAST(-1.64000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(13.19288510000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38350, CAST(N'2021-10-11T20:40:40.393' AS DateTime), CAST(N'2021-10-11T20:40:40.390' AS DateTime), 0, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(-2.00000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60400150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38351, CAST(N'2021-10-11T20:40:40.387' AS DateTime), CAST(N'2021-10-11T20:40:40.393' AS DateTime), 0, CAST(57360.37000000000000000000 AS Decimal(38, 20)), CAST(-1.64000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(6.30964070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38352, CAST(N'2021-10-11T20:40:40.397' AS DateTime), CAST(N'2021-10-11T20:40:40.397' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86800000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38353, CAST(N'2021-10-11T20:40:40.397' AS DateTime), CAST(N'2021-10-11T20:40:40.400' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(10.89840000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38354, CAST(N'2021-10-11T20:40:40.403' AS DateTime), CAST(N'2021-10-11T20:40:40.407' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.73600000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38355, CAST(N'2021-10-11T20:40:40.400' AS DateTime), CAST(N'2021-10-11T20:40:40.407' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(8.60400000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38356, CAST(N'2021-10-11T20:40:40.413' AS DateTime), CAST(N'2021-10-11T20:40:40.410' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44160000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38357, CAST(N'2021-10-11T20:40:40.413' AS DateTime), CAST(N'2021-10-11T20:40:40.433' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01520070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38358, CAST(N'2021-10-11T20:40:40.390' AS DateTime), CAST(N'2021-10-11T20:40:40.413' AS DateTime), 0, CAST(57360.36000000000000000000 AS Decimal(38, 20)), CAST(-1.65000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(11.47207200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38359, CAST(N'2021-10-11T20:40:40.433' AS DateTime), CAST(N'2021-10-11T20:40:40.430' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72080000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38360, CAST(N'2021-10-11T20:40:40.433' AS DateTime), CAST(N'2021-10-11T20:40:40.437' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(10.32480000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38361, CAST(N'2021-10-11T20:40:40.463' AS DateTime), CAST(N'2021-10-11T20:40:40.463' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38362, CAST(N'2021-10-11T20:40:40.467' AS DateTime), CAST(N'2021-10-11T20:40:40.467' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72080000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38363, CAST(N'2021-10-11T20:40:40.460' AS DateTime), CAST(N'2021-10-11T20:40:40.467' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(12.04560000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38364, CAST(N'2021-10-11T20:40:40.467' AS DateTime), CAST(N'2021-10-11T20:40:40.470' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(13.19280000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38365, CAST(N'2021-10-11T20:40:40.480' AS DateTime), CAST(N'2021-10-11T20:40:40.817' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(6.30960110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38366, CAST(N'2021-10-11T20:40:40.580' AS DateTime), CAST(N'2021-10-11T20:40:40.850' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(5.16240090000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38367, CAST(N'2021-10-11T20:40:40.620' AS DateTime), CAST(N'2021-10-11T20:40:41.080' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58880080000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38368, CAST(N'2021-10-11T20:40:40.680' AS DateTime), CAST(N'2021-10-11T20:40:41.080' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73600100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38369, CAST(N'2021-10-11T20:40:40.723' AS DateTime), CAST(N'2021-10-11T20:40:41.100' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.73600100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38370, CAST(N'2021-10-11T20:40:40.743' AS DateTime), CAST(N'2021-10-11T20:40:41.103' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14720020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38371, CAST(N'2021-10-11T20:40:40.747' AS DateTime), CAST(N'2021-10-11T20:40:41.393' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(3.44160060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38372, CAST(N'2021-10-11T20:40:40.753' AS DateTime), CAST(N'2021-10-11T20:40:40.753' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86800000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38373, CAST(N'2021-10-11T20:40:40.817' AS DateTime), CAST(N'2021-10-11T20:40:40.820' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(5.16240000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38374, CAST(N'2021-10-11T20:40:40.850' AS DateTime), CAST(N'2021-10-11T20:40:40.850' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44160000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38375, CAST(N'2021-10-11T20:40:40.880' AS DateTime), CAST(N'2021-10-11T20:40:41.650' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(12.04560210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38376, CAST(N'2021-10-11T20:40:40.977' AS DateTime), CAST(N'2021-10-11T20:40:41.657' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72080030000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38377, CAST(N'2021-10-11T20:40:41.023' AS DateTime), CAST(N'2021-10-11T20:40:41.677' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(11.47200200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38378, CAST(N'2021-10-11T20:40:41.073' AS DateTime), CAST(N'2021-10-11T20:40:41.730' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(8.03040140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38379, CAST(N'2021-10-11T20:40:41.080' AS DateTime), CAST(N'2021-10-11T20:40:41.083' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(10.89840000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38380, CAST(N'2021-10-11T20:40:41.100' AS DateTime), CAST(N'2021-10-11T20:40:41.107' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(6.88320000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38381, CAST(N'2021-10-11T20:40:41.393' AS DateTime), CAST(N'2021-10-11T20:40:41.397' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(4.58880000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38382, CAST(N'2021-10-11T20:40:41.567' AS DateTime), CAST(N'2021-10-11T20:40:41.573' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72080000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38383, CAST(N'2021-10-11T20:40:41.623' AS DateTime), CAST(N'2021-10-11T20:40:41.623' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01520000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38384, CAST(N'2021-10-11T20:40:41.627' AS DateTime), CAST(N'2021-10-11T20:40:41.627' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57360000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38385, CAST(N'2021-10-11T20:40:41.630' AS DateTime), CAST(N'2021-10-11T20:40:41.630' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38386, CAST(N'2021-10-11T20:40:41.640' AS DateTime), CAST(N'2021-10-11T20:40:41.657' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(10.89840000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38387, CAST(N'2021-10-11T20:40:41.680' AS DateTime), CAST(N'2021-10-11T20:40:41.730' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(9.75120170000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38388, CAST(N'2021-10-11T20:40:41.677' AS DateTime), CAST(N'2021-10-11T20:40:41.680' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(9.17760000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38389, CAST(N'2021-10-11T20:40:41.700' AS DateTime), CAST(N'2021-10-11T20:40:41.700' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29440000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38390, CAST(N'2021-10-11T20:40:41.707' AS DateTime), CAST(N'2021-10-11T20:40:41.993' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(12.04560210000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38391, CAST(N'2021-10-11T20:40:41.720' AS DateTime), CAST(N'2021-10-11T20:40:42.147' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(7.45680130000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38392, CAST(N'2021-10-11T20:40:41.730' AS DateTime), CAST(N'2021-10-11T20:40:41.733' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(13.19280000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38393, CAST(N'2021-10-11T20:40:41.753' AS DateTime), CAST(N'2021-10-11T20:40:41.753' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16240000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38394, CAST(N'2021-10-11T20:40:41.777' AS DateTime), CAST(N'2021-10-11T20:40:42.153' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(3.44160060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38395, CAST(N'2021-10-11T20:40:41.827' AS DateTime), CAST(N'2021-10-11T20:40:42.260' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(5.16240090000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38396, CAST(N'2021-10-11T20:40:41.870' AS DateTime), CAST(N'2021-10-11T20:40:42.260' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60400150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38397, CAST(N'2021-10-11T20:40:41.993' AS DateTime), CAST(N'2021-10-11T20:40:41.997' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(10.89840000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38398, CAST(N'2021-10-11T20:40:42.137' AS DateTime), CAST(N'2021-10-11T20:40:42.270' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86800050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38399, CAST(N'2021-10-11T20:40:42.140' AS DateTime), CAST(N'2021-10-11T20:40:42.330' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01520070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38400, CAST(N'2021-10-11T20:40:42.147' AS DateTime), CAST(N'2021-10-11T20:40:42.147' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(4.58880000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38401, CAST(N'2021-10-11T20:40:42.153' AS DateTime), CAST(N'2021-10-11T20:40:42.153' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(6.30960000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38402, CAST(N'2021-10-11T20:40:42.227' AS DateTime), CAST(N'2021-10-11T20:40:42.333' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14720020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38403, CAST(N'2021-10-11T20:40:42.260' AS DateTime), CAST(N'2021-10-11T20:40:42.273' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(12.04560000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38404, CAST(N'2021-10-11T20:40:42.330' AS DateTime), CAST(N'2021-10-11T20:40:42.337' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(10.32480000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38405, CAST(N'2021-10-11T20:40:42.377' AS DateTime), CAST(N'2021-10-11T20:40:42.373' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29440000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38406, CAST(N'2021-10-11T20:40:42.470' AS DateTime), CAST(N'2021-10-11T20:40:42.470' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.03040000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38407, CAST(N'2021-10-11T20:40:42.510' AS DateTime), CAST(N'2021-10-11T20:40:42.513' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-2.01000000000000000000 AS Decimal(38, 20)), CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(10.89840000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38408, CAST(N'2021-10-11T20:40:42.663' AS DateTime), CAST(N'2021-10-11T20:40:43.823' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16240090000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38409, CAST(N'2021-10-11T20:40:42.670' AS DateTime), CAST(N'2021-10-11T20:40:43.827' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01520070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38410, CAST(N'2021-10-11T20:40:42.790' AS DateTime), CAST(N'2021-10-11T20:40:44.377' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(3.44160060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38411, CAST(N'2021-10-11T20:40:42.973' AS DateTime), CAST(N'2021-10-11T20:40:45.963' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(11.47200200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38412, CAST(N'2021-10-11T20:40:43.027' AS DateTime), CAST(N'2021-10-11T20:40:45.970' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19280230000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38413, CAST(N'2021-10-11T20:40:43.120' AS DateTime), CAST(N'2021-10-11T20:40:45.977' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(9.75120170000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38414, CAST(N'2021-10-11T20:40:43.227' AS DateTime), CAST(N'2021-10-11T20:40:45.987' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(8.03040140000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38415, CAST(N'2021-10-11T20:40:43.440' AS DateTime), CAST(N'2021-10-11T20:40:46.023' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(11.47200200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38416, CAST(N'2021-10-11T20:40:43.580' AS DateTime), CAST(N'2021-10-11T20:40:46.027' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29440040000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38417, CAST(N'2021-10-11T20:40:43.637' AS DateTime), CAST(N'2021-10-11T20:40:46.070' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(9.75120170000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38418, CAST(N'2021-10-11T20:40:43.823' AS DateTime), CAST(N'2021-10-11T20:40:43.827' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(9.75120000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38419, CAST(N'2021-10-11T20:40:44.023' AS DateTime), CAST(N'2021-10-11T20:40:46.073' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01520070000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38420, CAST(N'2021-10-11T20:40:44.077' AS DateTime), CAST(N'2021-10-11T20:40:46.077' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14720020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38421, CAST(N'2021-10-11T20:40:44.173' AS DateTime), CAST(N'2021-10-11T20:40:46.077' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(3.36000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14720020000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38425, CAST(N'2021-10-11T20:40:44.377' AS DateTime), CAST(N'2021-10-11T20:40:44.380' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(6.88320000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38428, CAST(N'2021-10-11T20:40:45.097' AS DateTime), CAST(N'2021-10-11T20:40:45.097' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57360000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38432, CAST(N'2021-10-11T20:40:45.533' AS DateTime), CAST(N'2021-10-11T20:40:45.530' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16240000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38434, CAST(N'2021-10-11T20:40:45.967' AS DateTime), CAST(N'2021-10-11T20:40:45.967' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(6.30960000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38435, CAST(N'2021-10-11T20:40:45.970' AS DateTime), CAST(N'2021-10-11T20:40:45.970' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19280000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38436, CAST(N'2021-10-11T20:40:45.970' AS DateTime), CAST(N'2021-10-11T20:40:45.970' AS DateTime), 0, CAST(57360.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73600000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38437, CAST(N'2021-10-11T20:40:45.973' AS DateTime), CAST(N'2021-10-11T20:40:45.973' AS DateTime), 0, CAST(57359.96000000000000000000 AS Decimal(38, 20)), CAST(-0.05000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44159760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38438, CAST(N'2021-10-11T20:40:45.977' AS DateTime), CAST(N'2021-10-11T20:40:45.980' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-3.36000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(7.45636450000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38439, CAST(N'2021-10-11T20:40:45.977' AS DateTime), CAST(N'2021-10-11T20:40:45.990' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-3.36000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(12.04489650000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38440, CAST(N'2021-10-11T20:40:46.023' AS DateTime), CAST(N'2021-10-11T20:40:46.030' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-3.36000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(10.32419700000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38441, CAST(N'2021-10-11T20:40:46.030' AS DateTime), CAST(N'2021-10-11T20:40:46.037' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00022000000000000000 AS Decimal(38, 20)), CAST(12.61846520000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38442, CAST(N'2021-10-11T20:40:46.037' AS DateTime), CAST(N'2021-10-11T20:40:46.037' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00022000000000000000 AS Decimal(38, 20)), CAST(12.61846300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38443, CAST(N'2021-10-11T20:40:46.073' AS DateTime), CAST(N'2021-10-11T20:40:46.080' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-3.36000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(10.89776350000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38444, CAST(N'2021-10-11T20:40:46.087' AS DateTime), CAST(N'2021-10-11T20:40:46.087' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-3.36000000000000000000 AS Decimal(38, 20)), CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58853200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38445, CAST(N'2021-10-11T20:40:46.117' AS DateTime), CAST(N'2021-10-11T20:40:46.333' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(8.02993240000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38446, CAST(N'2021-10-11T20:40:46.180' AS DateTime), CAST(N'2021-10-11T20:40:46.180' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29426600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38447, CAST(N'2021-10-11T20:40:46.227' AS DateTime), CAST(N'2021-10-11T20:40:46.427' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(2.29426640000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38448, CAST(N'2021-10-11T20:40:46.277' AS DateTime), CAST(N'2021-10-11T20:40:47.627' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(10.32419880000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38449, CAST(N'2021-10-11T20:40:46.333' AS DateTime), CAST(N'2021-10-11T20:40:46.337' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(6.30923150000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38450, CAST(N'2021-10-11T20:40:46.427' AS DateTime), CAST(N'2021-10-11T20:40:46.430' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(2.29426600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38451, CAST(N'2021-10-11T20:40:46.527' AS DateTime), CAST(N'2021-10-11T20:40:46.523' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16209850000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38452, CAST(N'2021-10-11T20:40:46.627' AS DateTime), CAST(N'2021-10-11T20:40:46.627' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38453, CAST(N'2021-10-11T20:40:46.680' AS DateTime), CAST(N'2021-10-11T20:40:48.523' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(12.04489860000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38454, CAST(N'2021-10-11T20:40:46.680' AS DateTime), CAST(N'2021-10-11T20:40:49.123' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(6.30923260000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38455, CAST(N'2021-10-11T20:40:46.720' AS DateTime), CAST(N'2021-10-11T20:40:49.127' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.02993240000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38456, CAST(N'2021-10-11T20:40:46.730' AS DateTime), CAST(N'2021-10-11T20:40:49.923' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.58853280000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38457, CAST(N'2021-10-11T20:40:46.810' AS DateTime), CAST(N'2021-10-11T20:40:49.927' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72069980000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38458, CAST(N'2021-10-11T20:40:47.100' AS DateTime), CAST(N'2021-10-11T20:40:49.937' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(11.47133200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38459, CAST(N'2021-10-11T20:40:47.140' AS DateTime), CAST(N'2021-10-11T20:40:50.817' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(6.30923260000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38460, CAST(N'2021-10-11T20:40:47.167' AS DateTime), CAST(N'2021-10-11T20:40:50.820' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01496620000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38461, CAST(N'2021-10-11T20:40:47.627' AS DateTime), CAST(N'2021-10-11T20:40:47.630' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(8.60349750000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38462, CAST(N'2021-10-11T20:40:47.673' AS DateTime), CAST(N'2021-10-11T20:40:50.827' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(12.61846520000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38463, CAST(N'2021-10-11T20:40:47.727' AS DateTime), CAST(N'2021-10-11T20:40:47.727' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58853200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38464, CAST(N'2021-10-11T20:40:47.773' AS DateTime), CAST(N'2021-10-11T20:40:47.770' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14713300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38465, CAST(N'2021-10-11T20:40:47.823' AS DateTime), CAST(N'2021-10-11T20:40:50.830' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.02000000000000000000 AS Decimal(38, 20)), CAST(57356.64000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(12.61846520000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38466, CAST(N'2021-10-11T20:40:48.080' AS DateTime), CAST(N'2021-10-11T20:40:50.837' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.64000000000000000000 AS Decimal(38, 20)), CAST(57356.02000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.88279920000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38467, CAST(N'2021-10-11T20:40:48.253' AS DateTime), CAST(N'2021-10-11T20:40:50.840' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38468, CAST(N'2021-10-11T20:40:48.523' AS DateTime), CAST(N'2021-10-11T20:40:48.527' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(5.73566500000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38469, CAST(N'2021-10-11T20:40:48.727' AS DateTime), CAST(N'2021-10-11T20:40:48.723' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72069950000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38470, CAST(N'2021-10-11T20:40:48.770' AS DateTime), CAST(N'2021-10-11T20:40:50.943' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(6.88279920000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38471, CAST(N'2021-10-11T20:40:48.773' AS DateTime), CAST(N'2021-10-11T20:40:50.997' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(10.32419880000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38472, CAST(N'2021-10-11T20:40:48.773' AS DateTime), CAST(N'2021-10-11T20:40:51.187' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(11.47133200000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38473, CAST(N'2021-10-11T20:40:48.807' AS DateTime), CAST(N'2021-10-11T20:40:51.187' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72069980000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38474, CAST(N'2021-10-11T20:40:48.863' AS DateTime), CAST(N'2021-10-11T20:40:51.373' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(6.30923260000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38475, CAST(N'2021-10-11T20:40:48.973' AS DateTime), CAST(N'2021-10-11T20:40:51.377' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(4.58853280000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38476, CAST(N'2021-10-11T20:40:49.020' AS DateTime), CAST(N'2021-10-11T20:40:51.380' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86783300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38477, CAST(N'2021-10-11T20:40:49.077' AS DateTime), CAST(N'2021-10-11T20:40:51.387' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.66000000000000000000 AS Decimal(38, 20)), CAST(57351.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(3.44139960000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38478, CAST(N'2021-10-11T20:40:49.123' AS DateTime), CAST(N'2021-10-11T20:40:49.127' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(9.75063050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38479, CAST(N'2021-10-11T20:40:49.220' AS DateTime), CAST(N'2021-10-11T20:40:51.397' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.69000000000000000000 AS Decimal(38, 20)), CAST(57350.97000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(10.89776540000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38480, CAST(N'2021-10-11T20:40:49.267' AS DateTime), CAST(N'2021-10-11T20:40:51.397' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.92000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29426640000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38481, CAST(N'2021-10-11T20:40:49.313' AS DateTime), CAST(N'2021-10-11T20:40:51.400' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.93000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17706560000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38482, CAST(N'2021-10-11T20:40:49.320' AS DateTime), CAST(N'2021-10-11T20:40:51.403' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.93000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72069980000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38483, CAST(N'2021-10-11T20:40:49.497' AS DateTime), CAST(N'2021-10-11T20:40:51.787' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.93000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(6.30923260000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38484, CAST(N'2021-10-11T20:40:49.917' AS DateTime), CAST(N'2021-10-11T20:40:52.147' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(5.93000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(5.73566600000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38486, CAST(N'2021-10-11T20:40:49.927' AS DateTime), CAST(N'2021-10-11T20:40:49.927' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86783250000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38487, CAST(N'2021-10-11T20:40:49.930' AS DateTime), CAST(N'2021-10-11T20:40:49.930' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16209850000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38488, CAST(N'2021-10-11T20:40:49.923' AS DateTime), CAST(N'2021-10-11T20:40:49.930' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(12.61846300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38489, CAST(N'2021-10-11T20:40:49.927' AS DateTime), CAST(N'2021-10-11T20:40:49.940' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(4.01496550000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38491, CAST(N'2021-10-11T20:40:50.123' AS DateTime), CAST(N'2021-10-11T20:40:50.120' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38494, CAST(N'2021-10-11T20:40:50.817' AS DateTime), CAST(N'2021-10-11T20:40:50.820' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(5.73566500000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38495, CAST(N'2021-10-11T20:40:50.823' AS DateTime), CAST(N'2021-10-11T20:40:50.823' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72069950000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38496, CAST(N'2021-10-11T20:40:50.823' AS DateTime), CAST(N'2021-10-11T20:40:50.823' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(9.17706400000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38497, CAST(N'2021-10-11T20:40:50.830' AS DateTime), CAST(N'2021-10-11T20:40:50.830' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.02993100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38498, CAST(N'2021-10-11T20:40:50.827' AS DateTime), CAST(N'2021-10-11T20:40:50.830' AS DateTime), 0, CAST(57356.65000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(6.88279800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38499, CAST(N'2021-10-11T20:40:50.833' AS DateTime), CAST(N'2021-10-11T20:40:50.833' AS DateTime), 0, CAST(57356.64000000000000000000 AS Decimal(38, 20)), CAST(-0.02000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(11.47132800000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38500, CAST(N'2021-10-11T20:40:50.833' AS DateTime), CAST(N'2021-10-11T20:40:50.833' AS DateTime), 0, CAST(57356.61000000000000000000 AS Decimal(38, 20)), CAST(-0.05000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30922710000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38501, CAST(N'2021-10-11T20:40:50.837' AS DateTime), CAST(N'2021-10-11T20:40:50.833' AS DateTime), 0, CAST(57356.61000000000000000000 AS Decimal(38, 20)), CAST(-0.05000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57356610000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38502, CAST(N'2021-10-11T20:40:50.837' AS DateTime), CAST(N'2021-10-11T20:40:50.837' AS DateTime), 0, CAST(57356.02000000000000000000 AS Decimal(38, 20)), CAST(-0.64000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29424080000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38503, CAST(N'2021-10-11T20:40:50.840' AS DateTime), CAST(N'2021-10-11T20:40:50.853' AS DateTime), 0, CAST(57356.02000000000000000000 AS Decimal(38, 20)), CAST(-0.64000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(7.45628260000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38504, CAST(N'2021-10-11T20:40:50.870' AS DateTime), CAST(N'2021-10-11T20:40:50.943' AS DateTime), 1, CAST(57356.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86780050000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38505, CAST(N'2021-10-11T20:40:50.943' AS DateTime), CAST(N'2021-10-11T20:40:50.947' AS DateTime), 0, CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(-0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(9.75052000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38506, CAST(N'2021-10-11T20:40:51.000' AS DateTime), CAST(N'2021-10-11T20:40:51.000' AS DateTime), 0, CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(-0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17696000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38507, CAST(N'2021-10-11T20:40:51.003' AS DateTime), CAST(N'2021-10-11T20:40:51.000' AS DateTime), 0, CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(-0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45628000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38508, CAST(N'2021-10-11T20:40:51.007' AS DateTime), CAST(N'2021-10-11T20:40:51.183' AS DateTime), 1, CAST(57356.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(2.29424040000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38509, CAST(N'2021-10-11T20:40:51.083' AS DateTime), CAST(N'2021-10-11T20:40:51.080' AS DateTime), 0, CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57356000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38510, CAST(N'2021-10-11T20:40:51.183' AS DateTime), CAST(N'2021-10-11T20:40:51.190' AS DateTime), 0, CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(-0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(8.60340000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38511, CAST(N'2021-10-11T20:40:51.227' AS DateTime), CAST(N'2021-10-11T20:40:51.370' AS DateTime), 1, CAST(57356.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72068030000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38512, CAST(N'2021-10-11T20:40:51.373' AS DateTime), CAST(N'2021-10-11T20:40:51.373' AS DateTime), 0, CAST(57351.03000000000000000000 AS Decimal(38, 20)), CAST(-5.63000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14702060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38513, CAST(N'2021-10-11T20:40:51.377' AS DateTime), CAST(N'2021-10-11T20:40:51.373' AS DateTime), 0, CAST(57351.03000000000000000000 AS Decimal(38, 20)), CAST(-5.63000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44106180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38514, CAST(N'2021-10-11T20:40:51.370' AS DateTime), CAST(N'2021-10-11T20:40:51.380' AS DateTime), 0, CAST(57356.00000000000000000000 AS Decimal(38, 20)), CAST(-0.66000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(11.47120000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38515, CAST(N'2021-10-11T20:40:51.390' AS DateTime), CAST(N'2021-10-11T20:40:51.393' AS DateTime), 0, CAST(57351.00000000000000000000 AS Decimal(38, 20)), CAST(-5.66000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(12.61722000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38516, CAST(N'2021-10-11T20:40:51.397' AS DateTime), CAST(N'2021-10-11T20:40:51.397' AS DateTime), 0, CAST(57350.75000000000000000000 AS Decimal(38, 20)), CAST(-5.91000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350750000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38517, CAST(N'2021-10-11T20:40:51.400' AS DateTime), CAST(N'2021-10-11T20:40:51.400' AS DateTime), 0, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(-5.92000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(8.60261100000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38518, CAST(N'2021-10-11T20:40:51.400' AS DateTime), CAST(N'2021-10-11T20:40:51.400' AS DateTime), 0, CAST(57350.97000000000000000000 AS Decimal(38, 20)), CAST(-5.69000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(4.58807760000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38519, CAST(N'2021-10-11T20:40:51.403' AS DateTime), CAST(N'2021-10-11T20:40:51.403' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-5.93000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(10.89663870000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38520, CAST(N'2021-10-11T20:40:51.430' AS DateTime), CAST(N'2021-10-11T20:40:51.430' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-5.93000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350730000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38521, CAST(N'2021-10-11T20:40:51.527' AS DateTime), CAST(N'2021-10-11T20:40:51.783' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(10.89664060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38522, CAST(N'2021-10-11T20:40:51.783' AS DateTime), CAST(N'2021-10-11T20:40:51.780' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58805840000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38523, CAST(N'2021-10-11T20:40:51.787' AS DateTime), CAST(N'2021-10-11T20:40:51.790' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-5.93000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(13.19066790000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38524, CAST(N'2021-10-11T20:40:51.827' AS DateTime), CAST(N'2021-10-11T20:40:51.827' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-5.93000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14701460000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38525, CAST(N'2021-10-11T20:40:52.150' AS DateTime), CAST(N'2021-10-11T20:40:52.150' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-5.93000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(12.61716060000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38526, CAST(N'2021-10-11T20:40:52.523' AS DateTime), CAST(N'2021-10-11T20:40:53.280' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01455180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38527, CAST(N'2021-10-11T20:40:53.280' AS DateTime), CAST(N'2021-10-11T20:40:53.280' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-5.93000000000000000000 AS Decimal(38, 20)), CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(5.16156570000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38528, CAST(N'2021-10-11T20:40:53.393' AS DateTime), CAST(N'2021-10-11T20:40:53.483' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01455180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38529, CAST(N'2021-10-11T20:40:53.400' AS DateTime), CAST(N'2021-10-11T20:40:54.877' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(8.02910360000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38530, CAST(N'2021-10-11T20:40:53.483' AS DateTime), CAST(N'2021-10-11T20:40:53.483' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01455110000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38531, CAST(N'2021-10-11T20:40:53.533' AS DateTime), CAST(N'2021-10-11T20:40:54.880' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350740000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38532, CAST(N'2021-10-11T20:40:53.537' AS DateTime), CAST(N'2021-10-11T20:40:55.177' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(8.02910360000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38533, CAST(N'2021-10-11T20:40:53.657' AS DateTime), CAST(N'2021-10-11T20:40:53.657' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73507300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38534, CAST(N'2021-10-11T20:40:53.870' AS DateTime), CAST(N'2021-10-11T20:40:55.220' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(6.88208880000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38535, CAST(N'2021-10-11T20:40:54.190' AS DateTime), CAST(N'2021-10-11T20:40:55.223' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01455180000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38537, CAST(N'2021-10-11T20:40:54.877' AS DateTime), CAST(N'2021-10-11T20:40:54.880' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(5.73507300000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38540, CAST(N'2021-10-11T20:40:55.177' AS DateTime), CAST(N'2021-10-11T20:40:55.180' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(9.74962410000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38541, CAST(N'2021-10-11T20:40:55.220' AS DateTime), CAST(N'2021-10-11T20:40:55.227' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(8.02910220000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38542, CAST(N'2021-10-11T20:40:55.280' AS DateTime), CAST(N'2021-10-11T20:40:55.277' AS DateTime), 0, CAST(57350.73000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29402920000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38544, CAST(N'2021-10-11T20:40:55.617' AS DateTime), CAST(N'2021-10-11T20:40:56.010' AS DateTime), 1, CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(6.88200120000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38545, CAST(N'2021-10-11T20:40:55.767' AS DateTime), CAST(N'2021-10-11T20:40:56.013' AS DateTime), 1, CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350010000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38546, CAST(N'2021-10-11T20:40:55.777' AS DateTime), CAST(N'2021-10-11T20:40:56.020' AS DateTime), 1, CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(0.00008000000000000000 AS Decimal(38, 20)), CAST(4.58800080000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38547, CAST(N'2021-10-11T20:40:56.003' AS DateTime), CAST(N'2021-10-11T20:40:56.003' AS DateTime), 0, CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86750000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38548, CAST(N'2021-10-11T20:40:56.010' AS DateTime), CAST(N'2021-10-11T20:40:56.010' AS DateTime), 0, CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38549, CAST(N'2021-10-11T20:40:56.010' AS DateTime), CAST(N'2021-10-11T20:40:56.010' AS DateTime), 0, CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_ClosedOrders] ([ClosedOrderId], [CreateDate], [ClosedDate], [IsBuy], [ExposedPrice], [Difference], [TotalPrice], [Amount], [Total], [Status], [CreateUserId], [BoughtUserId]) VALUES (38551, CAST(N'2021-10-11T20:40:56.010' AS DateTime), CAST(N'2021-10-11T20:40:56.020' AS DateTime), 0, CAST(57350.00000000000000000000 AS Decimal(38, 20)), CAST(-0.01000000000000000000 AS Decimal(38, 20)), CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(12.04350000000000000000 AS Decimal(38, 20)), 1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38144, CAST(N'2021-10-11T20:40:20.880' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(10.89878190000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38149, CAST(N'2021-10-11T20:40:21.387' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38150, CAST(N'2021-10-11T20:40:21.390' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86810050000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38151, CAST(N'2021-10-11T20:40:21.393' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00021000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38152, CAST(N'2021-10-11T20:40:21.393' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17792160000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38153, CAST(N'2021-10-11T20:40:21.397' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38154, CAST(N'2021-10-11T20:40:21.483' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38155, CAST(N'2021-10-11T20:40:21.700' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982110000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38156, CAST(N'2021-10-11T20:40:21.770' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(9.75154170000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38162, CAST(N'2021-10-11T20:40:21.787' AS DateTime), 1, CAST(57364.85000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(8.60472750000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38163, CAST(N'2021-10-11T20:40:21.860' AS DateTime), 1, CAST(57363.68000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(5.73636800000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38173, CAST(N'2021-10-11T20:40:22.580' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(12.04611450000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38174, CAST(N'2021-10-11T20:40:22.627' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16262050000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38176, CAST(N'2021-10-11T20:40:22.723' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14724900000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38177, CAST(N'2021-10-11T20:40:22.727' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362450000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38178, CAST(N'2021-10-11T20:40:22.823' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29449800000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38179, CAST(N'2021-10-11T20:40:22.860' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01537150000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38180, CAST(N'2021-10-11T20:40:22.860' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362450000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38181, CAST(N'2021-10-11T20:40:22.877' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86812250000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38187, CAST(N'2021-10-11T20:40:23.530' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60436750000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38188, CAST(N'2021-10-11T20:40:23.623' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44174700000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38189, CAST(N'2021-10-11T20:40:23.903' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00019000000000000000 AS Decimal(38, 20)), CAST(10.89886550000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38190, CAST(N'2021-10-11T20:40:24.197' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45711850000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38191, CAST(N'2021-10-11T20:40:24.307' AS DateTime), 1, CAST(57362.45000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19336350000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38193, CAST(N'2021-10-11T20:40:24.457' AS DateTime), 1, CAST(57364.78000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(11.47295600000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38194, CAST(N'2021-10-11T20:40:24.460' AS DateTime), 1, CAST(57365.00000000000000000000 AS Decimal(38, 20)), CAST(0.00021000000000000000 AS Decimal(38, 20)), CAST(12.04665000000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38210, CAST(N'2021-10-11T20:40:27.620' AS DateTime), 1, CAST(57365.82000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72097460000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38213, CAST(N'2021-10-11T20:40:27.643' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29479480000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38214, CAST(N'2021-10-11T20:40:27.643' AS DateTime), 1, CAST(57369.87000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(2.86849350000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38262, CAST(N'2021-10-11T20:40:35.050' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(8.60776050000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38263, CAST(N'2021-10-11T20:40:35.247' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16465630000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38264, CAST(N'2021-10-11T20:40:35.253' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(11.47701400000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38265, CAST(N'2021-10-11T20:40:35.253' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(11.47701400000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38266, CAST(N'2021-10-11T20:40:35.257' AS DateTime), 0, CAST(57385.07000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(11.47701400000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38273, CAST(N'2021-10-11T20:40:35.323' AS DateTime), 0, CAST(57376.68000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(12.04910280000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38274, CAST(N'2021-10-11T20:40:35.323' AS DateTime), 0, CAST(57377.66000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(11.47553200000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38275, CAST(N'2021-10-11T20:40:35.327' AS DateTime), 0, CAST(57377.65000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(6.88531800000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38276, CAST(N'2021-10-11T20:40:35.327' AS DateTime), 0, CAST(57380.00000000000000000000 AS Decimal(38, 20)), CAST(0.00021000000000000000 AS Decimal(38, 20)), CAST(12.04980000000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38277, CAST(N'2021-10-11T20:40:35.330' AS DateTime), 0, CAST(57377.54000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.18040640000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38278, CAST(N'2021-10-11T20:40:35.540' AS DateTime), 0, CAST(57373.85000000000000000000 AS Decimal(38, 20)), CAST(0.00022000000000000000 AS Decimal(38, 20)), CAST(12.62224700000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38283, CAST(N'2021-10-11T20:40:35.583' AS DateTime), 1, CAST(57365.81000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(10.89950390000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38284, CAST(N'2021-10-11T20:40:35.583' AS DateTime), 1, CAST(57365.81000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73658100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38285, CAST(N'2021-10-11T20:40:35.587' AS DateTime), 1, CAST(57365.81000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44194860000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38286, CAST(N'2021-10-11T20:40:35.593' AS DateTime), 1, CAST(57365.81000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19413630000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38287, CAST(N'2021-10-11T20:40:35.593' AS DateTime), 0, CAST(57370.72000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14741440000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38288, CAST(N'2021-10-11T20:40:35.597' AS DateTime), 0, CAST(57371.44000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(3.44228640000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38298, CAST(N'2021-10-11T20:40:35.837' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38299, CAST(N'2021-10-11T20:40:35.923' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38300, CAST(N'2021-10-11T20:40:35.980' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38301, CAST(N'2021-10-11T20:40:36.023' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38304, CAST(N'2021-10-11T20:40:36.333' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982110000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38305, CAST(N'2021-10-11T20:40:36.340' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38309, CAST(N'2021-10-11T20:40:36.590' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(4.01534070000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38310, CAST(N'2021-10-11T20:40:36.593' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57362010000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38311, CAST(N'2021-10-11T20:40:36.623' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00022000000000000000 AS Decimal(38, 20)), CAST(12.61964220000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38312, CAST(N'2021-10-11T20:40:36.770' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29448040000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38313, CAST(N'2021-10-11T20:40:36.830' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38314, CAST(N'2021-10-11T20:40:37.040' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.03068140000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38316, CAST(N'2021-10-11T20:40:37.203' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00017000000000000000 AS Decimal(38, 20)), CAST(9.75154170000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38317, CAST(N'2021-10-11T20:40:37.210' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00021000000000000000 AS Decimal(38, 20)), CAST(12.04602210000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38318, CAST(N'2021-10-11T20:40:37.217' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45706130000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38319, CAST(N'2021-10-11T20:40:37.750' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00009000000000000000 AS Decimal(38, 20)), CAST(5.16258090000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38320, CAST(N'2021-10-11T20:40:37.917' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00016000000000000000 AS Decimal(38, 20)), CAST(9.17792160000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38321, CAST(N'2021-10-11T20:40:38.283' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982110000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38322, CAST(N'2021-10-11T20:40:38.547' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00012000000000000000 AS Decimal(38, 20)), CAST(6.88344120000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38324, CAST(N'2021-10-11T20:40:38.783' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44172060000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38325, CAST(N'2021-10-11T20:40:38.990' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45706130000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38326, CAST(N'2021-10-11T20:40:39.077' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45706130000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38327, CAST(N'2021-10-11T20:40:39.087' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982110000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38328, CAST(N'2021-10-11T20:40:39.413' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73620100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38329, CAST(N'2021-10-11T20:40:39.520' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30982110000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38331, CAST(N'2021-10-11T20:40:39.930' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00015000000000000000 AS Decimal(38, 20)), CAST(8.60430150000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38332, CAST(N'2021-10-11T20:40:40.023' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19326230000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38333, CAST(N'2021-10-11T20:40:40.120' AS DateTime), 1, CAST(57362.01000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.03068140000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38422, CAST(N'2021-10-11T20:40:44.217' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(7.45680130000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38423, CAST(N'2021-10-11T20:40:44.227' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00014000000000000000 AS Decimal(38, 20)), CAST(8.03040140000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38424, CAST(N'2021-10-11T20:40:44.230' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00018000000000000000 AS Decimal(38, 20)), CAST(10.32480180000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38426, CAST(N'2021-10-11T20:40:44.527' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(3.44160060000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38427, CAST(N'2021-10-11T20:40:44.920' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00020000000000000000 AS Decimal(38, 20)), CAST(11.47200200000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38429, CAST(N'2021-10-11T20:40:45.293' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00003000000000000000 AS Decimal(38, 20)), CAST(1.72080030000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38430, CAST(N'2021-10-11T20:40:45.477' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00010000000000000000 AS Decimal(38, 20)), CAST(5.73600100000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38431, CAST(N'2021-10-11T20:40:45.480' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00002000000000000000 AS Decimal(38, 20)), CAST(1.14720020000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38433, CAST(N'2021-10-11T20:40:45.773' AS DateTime), 1, CAST(57360.01000000000000000000 AS Decimal(38, 20)), CAST(0.00018000000000000000 AS Decimal(38, 20)), CAST(10.32480180000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38485, CAST(N'2021-10-11T20:40:49.923' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(13.19203180000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38490, CAST(N'2021-10-11T20:40:50.117' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00005000000000000000 AS Decimal(38, 20)), CAST(2.86783300000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38492, CAST(N'2021-10-11T20:40:50.457' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00004000000000000000 AS Decimal(38, 20)), CAST(2.29426640000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38493, CAST(N'2021-10-11T20:40:50.640' AS DateTime), 1, CAST(57356.66000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19203180000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38536, CAST(N'2021-10-11T20:40:54.573' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00006000000000000000 AS Decimal(38, 20)), CAST(7.45559620000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38538, CAST(N'2021-10-11T20:40:55.073' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00023000000000000000 AS Decimal(38, 20)), CAST(13.19067020000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38539, CAST(N'2021-10-11T20:40:55.123' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00011000000000000000 AS Decimal(38, 20)), CAST(6.30858140000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38543, CAST(N'2021-10-11T20:40:55.323' AS DateTime), 1, CAST(57350.74000000000000000000 AS Decimal(38, 20)), CAST(0.00013000000000000000 AS Decimal(38, 20)), CAST(7.45559620000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38550, CAST(N'2021-10-11T20:40:56.017' AS DateTime), 1, CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.00007000000000000000 AS Decimal(38, 20)), CAST(7.45550130000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (38552, CAST(N'2021-10-11T20:40:56.130' AS DateTime), 1, CAST(57350.01000000000000000000 AS Decimal(38, 20)), CAST(0.00001000000000000000 AS Decimal(38, 20)), CAST(0.57350010000000000000 AS Decimal(38, 20)), N'0996e6bb-ea74-447b-9832-d1b5a02d4a70')
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
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(1000007.42930390956472321792 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:28.957' AS DateTime), CAST(N'2021-09-16T21:36:28.957' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (2, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(1746042.54117006822738921790 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:28.983' AS DateTime), CAST(N'2021-09-16T21:36:28.983' AS DateTime), N'')
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
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

SELECT @new_identity = NEXT VALUE FOR [dbo].[BTC_USDT_OpenOrderId_Sequence]

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders] (OpenOrderId, IsBuy, Price, Amount, Total, CreateUserId)
VALUES (@new_identity, @isBuy, @price, @amount, @total, @userid)

SELECT @new_identity

END
GO
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
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateUserIncomeWallet]
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

--Создаём внутренний кошелёк, если его не было
--insert wallet if not exist
IF NOT EXISTS(SELECT 1 FROM [Exchange].[dbo].[Wallets] WHERE UserId = @userid AND CurrencyAcronim = @currencyAcronim)
BEGIN
INSERT INTO [Exchange].[dbo].[Wallets] (UserId, CurrencyAcronim, Value)
VALUES (@userid, @currencyAcronim, 0)
END

RETURN

END
GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrder_ById]
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
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrders]
AS
BEGIN

SELECT * FROM [BTC_USDT_OpenOrders]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

SELECT DISTINCT TOP(15) COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy, 
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount,
	(SELECT SUM(D3.Price * D3.Amount)
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D3
	WHERE D3.Price = D1.Price) AS Total
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
WHERE D1.IsBuy = 1
GROUP BY  D1.Price, D1.IsBuy
ORDER BY  Price DESC

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

SELECT DISTINCT TOP(15) COUNT(D1.Price) AS CountPrices, D1.Price, D1.IsBuy, 
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
CREATE PROCEDURE [dbo].[GetBots_ByBotAuthCode]
@botAuthCode nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Bots] WHERE BotAuthCode = @botAuthCode
	
END






GO
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

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedOrderId DESC

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersToClosedOrders]
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

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrder] (ClosedOrderId, Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@closedOrderId, @total, @createDate, getdate(), @isBuy, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_BuyOrder]
@createUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE  IsBuy = 0 AND @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder]
		@userId = @createUserId,
		@isBuy = @isBuy,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
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

	
	SELECT @amountLocal as Amount, -1 as Id
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (NEXT VALUE FOR [dbo].[BTC_USDT_OpenOrderId_Sequence],
				@total,
				@createDate,
				getdate(),
				@isBuy,
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
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
	SET    IsBuy = (SELECT IsBuy FROM #selectedOrder),
		   Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  OpenOrderId = (SELECT OpenOrderId FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
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
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (NEXT VALUE FOR [dbo].[BTC_USDT_OpenOrderId_Sequence],
				@total,
				@createDate,
				getdate(),
				@isBuy,
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

	SELECT 0 as Amount, -1 as Id
END

END
GO
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

	SELECT TOP (1) * INTO #firstOrder FROM #closedOrdersByLastMinute ORDER BY ClosedOrderId
	SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedOrderId DESC

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

	SELECT TOP (1) * INTO #lastOrderByCandleStick FROM #closedOrdersByLastCandleStick ORDER BY ClosedOrderId DESC

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_SellOrder]
@createUserId nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders]
WHERE  IsBuy = 1 AND @price <= Price 
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder]
		@userId = @createUserId,
		@isBuy = @isBuy,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
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
	
	SELECT @amountLocal as Amount, -1 as Id
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (NEXT VALUE FOR [dbo].[BTC_USDT_OpenOrderId_Sequence],
				@total,
				@createDate,
				getdate(),
				@isBuy,
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
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
	SET    IsBuy = (SELECT IsBuy FROM #selectedOrder),
		   Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  OpenOrderId = (SELECT OpenOrderId FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders]
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT OpenOrderId FROM #selectedOrder),
				(SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				(SELECT IsBuy FROM #selectedOrder),
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
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (NEXT VALUE FOR [dbo].[BTC_USDT_OpenOrderId_Sequence],
				@total,
				@createDate,
				getdate(),
				@isBuy,
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
		
	SELECT 0 as Amount, -1 as Id
END

END
GO
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
