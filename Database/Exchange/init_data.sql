USE [Exchange]
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
SET IDENTITY_INSERT [dbo].[Currencies] ON 
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (1, N'BTC', N'Bitcoin', CAST(N'2021-04-22T04:17:22.167' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (2, N'USDT', N'Dollar', CAST(N'2021-04-22T04:18:16.937' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (3, N'ETH', N'Etherium', CAST(N'2021-04-22T04:18:32.010' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (4, N'LTC', N'LiteCoin', CAST(N'2021-04-24T03:22:55.287' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (5, N'XRP', N'Ripple', CAST(N'2021-04-24T03:23:23.307' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (6, N'DOGE', N'DogeCoin', CAST(N'2021-04-24T03:23:48.857' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (7, N'BCH', N'BitcoinCash', CAST(N'2021-04-24T03:24:49.830' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (8, N'DASH', N'DashCoin', CAST(N'2021-04-24T03:25:17.297' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (9, N'EURT', N'Euro', CAST(N'2023-02-04T11:53:31.410' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (10, N'RURT', N'Ruble', CAST(N'2023-02-04T11:53:51.453' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade], [NodeIsReady]) VALUES (11, N'KZTT', N'Tenge', CAST(N'2023-02-04T11:59:40.933' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Pairs] ON 
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (1, N'BTC', N'USDT', 1, CAST(N'2022-03-26T01:23:27.010' AS DateTime), N'BTC - USDT', N'BTCUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (2, N'ETH', N'USDT', 10, CAST(N'2022-04-06T19:25:23.480' AS DateTime), N'ETH - USDT', N'ETHUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (3, N'DOGE', N'USDT', 20, CAST(N'2022-04-06T19:29:14.483' AS DateTime), N'DOGE - USDT', N'DOGEUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (4, N'LTC', N'USDT', 30, CAST(N'2022-04-06T19:29:33.643' AS DateTime), N'LTC - USDT', N'LTCUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (5, N'DASH', N'USDT', 40, CAST(N'2022-04-06T19:29:53.803' AS DateTime), N'DASH - USDT', N'DASHUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (8, N'DASH', N'BTC', 10, CAST(N'2022-05-19T20:14:29.610' AS DateTime), N'DASH - BTC', N'DASHBTC')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (9, N'ETH', N'BTC', 10, CAST(N'2022-05-19T20:18:54.023' AS DateTime), N'ETH - BTC', N'ETHBTC')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (10, N'LTC', N'BTC', 10, CAST(N'2022-05-19T20:19:42.520' AS DateTime), N'LTC - BTC', N'LTCBTC')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (11, N'DOGE', N'BTC', 10, CAST(N'2022-05-20T06:59:04.987' AS DateTime), N'DOGE - BTC', N'DOGEBTC')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (12, N'BCH', N'USDT', 10, CAST(N'2022-05-20T07:00:43.477' AS DateTime), N'BCH - USDT', N'BCHUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (13, N'BCH', N'BTC', 10, CAST(N'2022-05-20T07:00:56.773' AS DateTime), N'BCH - BTC', N'BCHBTC')
GO
SET IDENTITY_INSERT [dbo].[Pairs] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([Id], [Name], [Value], [LastUpdateDateTime]) VALUES (1, N'EthereumLastReadBlock', N'13772971', CAST(N'2021-12-08T07:25:22.927' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (1, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(999942.00501515950472321792 AS Decimal(38, 20)), N'BTC', CAST(N'2021-09-16T21:36:28.957' AS DateTime), CAST(N'2021-09-16T21:36:28.957' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (2, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(498219.73257400478938921790 AS Decimal(38, 20)), N'USDT', CAST(N'2021-09-16T21:36:28.983' AS DateTime), CAST(N'2021-09-16T21:36:28.983' AS DateTime), N'')
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
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (11, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(19743.73746000000000000000 AS Decimal(38, 20)), N'ETH', CAST(N'2022-04-25T12:35:14.910' AS DateTime), CAST(N'2022-04-25T12:35:14.910' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (13, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(19953.18976000000000000000 AS Decimal(38, 20)), N'DOGE', CAST(N'2022-04-25T12:36:13.210' AS DateTime), CAST(N'2022-04-25T12:36:13.210' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (14, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(9973.72424000000000000000 AS Decimal(38, 20)), N'LTC', CAST(N'2022-04-25T12:36:13.227' AS DateTime), CAST(N'2022-04-25T12:36:13.227' AS DateTime), N'')
GO
INSERT [dbo].[Wallets] ([Id], [UserId], [Value], [CurrencyAcronim], [Created], [LastUpdate], [Address]) VALUES (15, N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', CAST(19990.80616000000000000000 AS Decimal(38, 20)), N'DASH', CAST(N'2022-04-25T12:36:13.230' AS DateTime), CAST(N'2022-04-25T12:36:13.230' AS DateTime), N'')
GO
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
SET IDENTITY_INSERT [dbo].[P2PCrypts] ON 
GO
INSERT [dbo].[P2PCrypts] ([Id], [Name]) VALUES (1, N'BTC')
GO
INSERT [dbo].[P2PCrypts] ([Id], [Name]) VALUES (2, N'USDT')
GO
INSERT [dbo].[P2PCrypts] ([Id], [Name]) VALUES (3, N'LTC')
GO
SET IDENTITY_INSERT [dbo].[P2PCrypts] OFF
GO
SET IDENTITY_INSERT [dbo].[P2PFiats] ON 
GO
INSERT [dbo].[P2PFiats] ([Id], [Name]) VALUES (1, N'USD')
GO
INSERT [dbo].[P2PFiats] ([Id], [Name]) VALUES (2, N'EUR')
GO
INSERT [dbo].[P2PFiats] ([Id], [Name]) VALUES (3, N'RUB')
GO
SET IDENTITY_INSERT [dbo].[P2PFiats] OFF
GO
SET IDENTITY_INSERT [dbo].[P2PPayments] ON 
GO
INSERT [dbo].[P2PPayments] ([Id], [Name]) VALUES (1, N'Sberbank')
GO
INSERT [dbo].[P2PPayments] ([Id], [Name]) VALUES (2, N'Tinkoff')
GO
SET IDENTITY_INSERT [dbo].[P2PPayments] OFF
GO
SET IDENTITY_INSERT [dbo].[P2PTimeFrames] ON 
GO
INSERT [dbo].[P2PTimeFrames] ([Id], [Mins], [ViewName]) VALUES (1, 15, N'15 mins')
GO
INSERT [dbo].[P2PTimeFrames] ([Id], [Mins], [ViewName]) VALUES (2, 30, N'30 mins')
GO
INSERT [dbo].[P2PTimeFrames] ([Id], [Mins], [ViewName]) VALUES (3, 60, N'1 hr')
GO
SET IDENTITY_INSERT [dbo].[P2PTimeFrames] OFF
GO
SET IDENTITY_INSERT [dbo].[P2PValutes] ON 
GO
INSERT [dbo].[P2PValutes] ([Id], [Name]) VALUES (1, N'EUR')
GO
INSERT [dbo].[P2PValutes] ([Id], [Name]) VALUES (2, N'RUB')
GO
INSERT [dbo].[P2PValutes] ([Id], [Name]) VALUES (3, N'USD')
GO
SET IDENTITY_INSERT [dbo].[P2PValutes] OFF
GO
