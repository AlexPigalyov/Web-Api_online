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
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (1, N'40ffde92-878c-4c09-ac6b-c86a769d1623', 4, CAST(1.00000000000000000000 AS Decimal(38, 20)), N'1', CAST(N'2021-09-10T13:03:43.133' AS DateTime), N'BTC')
GO
INSERT [dbo].[Events] ([Id], [UserId], [Type], [Value], [Comment], [WhenDate], [CurrencyAcronim]) VALUES (2, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', 5, CAST(1.00000000000000000000 AS Decimal(38, 20)), N'1', CAST(N'2021-09-10T13:03:43.133' AS DateTime), N'BTC')
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
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX1')
GO
INSERT [dbo].[TestTable] ([Amount], [SelectedOrderAmount], [Text]) VALUES (CAST(0.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'XXX2')
GO
SET IDENTITY_INSERT [dbo].[Transfers] ON 
GO
INSERT [dbo].[Transfers] ([Id], [WalletFromId], [WalletToId], [Value], [Date], [CurrencyAcronim], [Hash], [Comment]) VALUES (1, 3, 1, CAST(1.00000000000000000000 AS Decimal(38, 20)), CAST(N'2021-09-10T13:03:43.110' AS DateTime), N'BTC', N'75b6bbe7d646869bbcbe2fba187a43956a8899d0fb2baa030e6afdc26b88e586', N'1')
GO
SET IDENTITY_INSERT [dbo].[Transfers] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (1, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', CAST(1003729.14287575876193607190 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-02T15:32:29.617' AS DateTime), CAST(N'2021-09-10T13:03:43.110' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (2, N'cf685ef7-9a1f-4062-aa2a-365088511f7d', CAST(936313.14713247280604307498 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-02T15:32:29.637' AS DateTime), CAST(N'2021-09-02T15:32:29.637' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (3, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(15.00000000000000000000 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-02T15:32:40.250' AS DateTime), CAST(N'2021-09-10T13:03:43.110' AS DateTime), N'82200ad9b9c14a70b56f05aaa5bbddac')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (4, N'40ffde92-878c-4c09-ac6b-c86a769d1623', CAST(1044427.00000000000000000000 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-02T15:32:40.253' AS DateTime), CAST(N'2021-09-02T15:32:40.253' AS DateTime), N'1da7ca87befd4f27a155267a6fcbc14a')
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
cREATE PROCEDURE [dbo].[spMove_BTC_USDT_FromOpenOrdersToClosedOrders]
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

insert into BTC_USDT_ClosedOrders (ClosedOrderId, Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@closedOrderId, @total, @createDate, getdate(), @isBuy, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

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
@createDate datetime
AS
BEGIN

SELECT TOP 1 *
INTO   #selectedOrder
FROM   BTC_USDT_OpenOrders
WHERE  IsBuy != @isBuy AND 
	   (( IsBuy = 1 AND @price <= Price ) OR 
	   ( IsBuy = 0 AND @price >= Price ))
ORDER  BY Price,
          CreateDate

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @selectedOrderAmountLocal DECIMAL(38, 20);
SET @selectedOrderAmountLocal = 0;

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT * FROM #selectedOrder)
BEGIN	
	SELECT 0;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 

	INSERT INTO BTC_USDT_ClosedOrders (	
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
		   Amount = @amountLocal,
		   CreateUserId = @createUserId
	WHERE  OpenOrderId = @openOrderId 	
	
	SELECT @amountLocal
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	SET @selectedOrderAmountLocal = @selectOrderAmount - @amount;
	
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = @openOrderId
	
	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
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
		   Amount = @selectedOrderAmountLocal,
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  OpenOrderId = (SELECT OpenOrderId FROM #selectedOrder)

	SELECT 0
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = 
		(SELECT OpenOrderId FROM #selectedOrder) 
		
	DELETE FROM BTC_USDT_OpenOrders
	WHERE  OpenOrderId = @openOrderId

	INSERT INTO BTC_USDT_ClosedOrders (
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

	INSERT INTO BTC_USDT_ClosedOrders (
				ClosedOrderId, Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

		VALUES (@openOrderId,
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

	SELECT 0
END
DROP TABLE #selectedOrder

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSendCoins]
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

UPDATE Wallets
SET Value -= @value, LastUpdate = GETDATE()
WHERE ID = @senderWalletId

UPDATE Wallets
SET Value += @value, LastUpdate = GETDATE()
WHERE Id = @receiverWalletId

insert into Transfers (WalletFromId, WalletToId, Value, Date, CurrencyAcronim, Hash, Comment)
values (@senderWalletId, @receiverWalletId, @value, GETDATE(), @currencyAcronim, @hash, @Comment)

insert into Events (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@senderUserId, @typeSend, @value, @Comment, GETDATE(), @currencyAcronim)

insert into Events (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@receiverUserId, @typeRecieve, @value, @Comment, GETDATE(), @currencyAcronim)

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
