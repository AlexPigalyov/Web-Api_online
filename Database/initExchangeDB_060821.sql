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
	[Status] [nvarchar](50) NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NOT NULL
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
	[CreateUserId] [nvarchar](450) NOT NULL
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
	[WalletId] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransactionId] [nvarchar](max) NULL,
	[IncomeWallet] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
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
	[Address] [nvarchar](150) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BTC_USDT_OpenOrders] ON 
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (1, CAST(N'2021-05-21T00:23:16.627' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (2, CAST(N'2021-05-21T00:26:20.780' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (3, CAST(N'2021-05-21T00:29:38.720' AS DateTime), 1, CAST(5.00000000000000000000 AS Decimal(38, 20)), CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (4, CAST(N'2021-05-21T00:30:37.980' AS DateTime), 1, CAST(4.00000000000000000000 AS Decimal(38, 20)), CAST(34.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (5, CAST(N'2021-05-21T00:32:33.493' AS DateTime), 1, CAST(8.00000000000000000000 AS Decimal(38, 20)), CAST(7.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (6, CAST(N'2021-08-05T23:39:54.570' AS DateTime), 1, CAST(7000.00000000000000000000 AS Decimal(38, 20)), CAST(200.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (7, CAST(N'2021-08-05T23:40:44.653' AS DateTime), 1, CAST(1000.00000000000000000000 AS Decimal(38, 20)), CAST(800.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (8, CAST(N'2021-08-05T23:41:15.250' AS DateTime), 1, CAST(5000.00000000000000000000 AS Decimal(38, 20)), CAST(90.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (9, CAST(N'2021-08-05T23:42:06.980' AS DateTime), 1, CAST(500078.00000000000000000000 AS Decimal(38, 20)), CAST(990.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (10, CAST(N'2021-08-06T19:26:29.747' AS DateTime), 1, CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(2.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
GO
INSERT [dbo].[BTC_USDT_OpenOrders] ([OpenOrderId], [CreateDate], [IsBuy], [Price], [Amount], [Total], [CreateUserId]) VALUES (11, CAST(N'2021-08-06T19:29:46.167' AS DateTime), 1, CAST(400.00000000000000000000 AS Decimal(38, 20)), CAST(100.00000000000000000000 AS Decimal(38, 20)), CAST(0.00000000000000000000 AS Decimal(38, 20)), N'53cd122d-6253-4981-b290-11471f67c528')
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

select buco.* 
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
AS
BEGIN

SELECT DISTINCT COUNT(D1.Price) AS CountPrices, D1.Price,
    (SELECT SUM(D2.Amount)
    FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D2
    WHERE D2.Price = D1.Price) AS Amount
FROM [Exchange].[dbo].[BTC_USDT_OpenOrders] AS D1
GROUP BY  D1.Price
ORDER BY  Price

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
      ,iw.[Value]
      ,iw.[Address]
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
