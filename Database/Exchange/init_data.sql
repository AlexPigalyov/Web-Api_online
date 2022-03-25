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
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (1, N'BTC', N'Bitcoin', CAST(N'2021-04-22T04:17:22.167' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (2, N'USDT', N'Dollar', CAST(N'2021-04-22T04:18:16.937' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (3, N'ETH', N'Etherium', CAST(N'2021-04-22T04:18:32.010' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (4, N'LTC', N'LiteCoin', CAST(N'2021-04-24T03:22:55.287' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (5, N'XRP', N'Ripple', CAST(N'2021-04-24T03:23:23.307' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (6, N'DOGE', N'DogeCoin', CAST(N'2021-04-24T03:23:48.857' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (7, N'BCH', N'BitcoinCash', CAST(N'2021-04-24T03:24:49.830' AS DateTime), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Acronim], [Name], [Created], [PercentCommissionForIncomeTransaction], [PercentCommissionForTransfer], [PercentCommissionForOutcomeTransaction], [PercentCommissionForTrade]) VALUES (8, N'DASH', N'DashCoin', CAST(N'2021-04-24T03:25:17.297' AS DateTime), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Pairs] ON 
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (1, N'BTC', N'USDT', 1, CAST(N'2022-03-26T01:23:27.010' AS DateTime), N'BTC - USDT', N'BTCUSDT')
GO
INSERT [dbo].[Pairs] ([Id], [Currency1], [Currency2], [Order], [Created], [Header], [Acronim]) VALUES (2, N'ETH', N'USDT', 2, CAST(N'2022-03-26T01:23:44.073' AS DateTime), N'ETH - USDT', N'ETHUSDT')
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
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
