USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Acronim] [nvarchar](10) NOT NULL,
	[Site] [nvarchar](150) NOT NULL,
	[Buy] [float] NOT NULL,
	[Sell] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Rates] ON 
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (1, N'ARS', N'https://ru.exchange-rates.org/currentRates/A/USD', 88.46087, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (2, N'BSD', N'https://ru.exchange-rates.org/currentRates/A/USD', 1, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (3, N'BBD', N'https://ru.exchange-rates.org/currentRates/A/USD', 2, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (4, N'BZD', N'https://ru.exchange-rates.org/currentRates/A/USD', 2.01599, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (5, N'BMD', N'https://ru.exchange-rates.org/currentRates/A/USD', 1, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (6, N'BOB', N'https://ru.exchange-rates.org/currentRates/A/USD', 6.93, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (7, N'BRL', N'https://ru.exchange-rates.org/currentRates/A/USD', 5.37049, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (8, N'VES', N'https://ru.exchange-rates.org/currentRates/A/USD', 1736216.06028, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (9, N'XCD', N'https://ru.exchange-rates.org/currentRates/A/USD', 2.7026, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (10, N'HTG', N'https://ru.exchange-rates.org/currentRates/A/USD', 73.50815, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (11, N'GTQ', N'https://ru.exchange-rates.org/currentRates/A/USD', 7.74193, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (12, N'ANG', N'https://ru.exchange-rates.org/currentRates/A/USD', 1.79436, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (13, N'HNL', N'https://ru.exchange-rates.org/currentRates/A/USD', 24.06264, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (14, N'DOP', N'https://ru.exchange-rates.org/currentRates/A/USD', 57.83963, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (15, N'KYD', N'https://ru.exchange-rates.org/currentRates/A/USD', 0.8334, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (16, N'CAD', N'https://ru.exchange-rates.org/currentRates/A/USD', 1.26926, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (17, N'COP', N'https://ru.exchange-rates.org/currentRates/A/USD', 3522.83979, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (18, N'CRC', N'https://ru.exchange-rates.org/currentRates/A/USD', 610.72513, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (19, N'CUP', N'https://ru.exchange-rates.org/currentRates/A/USD', 26.5, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (20, N'MXN', N'https://ru.exchange-rates.org/currentRates/A/USD', 19.93485, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (21, N'NIO', N'https://ru.exchange-rates.org/currentRates/A/USD', 34.86369, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (22, N'PAB', N'https://ru.exchange-rates.org/currentRates/A/USD', 1, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (23, N'PYG', N'https://ru.exchange-rates.org/currentRates/A/USD', 6729.23955, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (24, N'PEN', N'https://ru.exchange-rates.org/currentRates/A/USD', 3.64268, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (25, N'TTD', N'https://ru.exchange-rates.org/currentRates/A/USD', 6.78551, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (26, N'UYU', N'https://ru.exchange-rates.org/currentRates/A/USD', 42.68021, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (27, N'CLP', N'https://ru.exchange-rates.org/currentRates/A/USD', 725.59187, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (28, N'JMD', N'https://ru.exchange-rates.org/currentRates/A/USD', 149.51895, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (29, N'AUD', N'https://ru.exchange-rates.org/currentRates/P/USD', 1.2894, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (30, N'BDT', N'https://ru.exchange-rates.org/currentRates/P/USD', 84.64659, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (31, N'BND', N'https://ru.exchange-rates.org/currentRates/P/USD', 1.32534, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (32, N'VND', N'https://ru.exchange-rates.org/currentRates/P/USD', 22990.79147, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (33, N'HKD', N'https://ru.exchange-rates.org/currentRates/P/USD', 7.75319, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (34, N'INR', N'https://ru.exchange-rates.org/currentRates/P/USD', 72.59143, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (35, N'IDR', N'https://ru.exchange-rates.org/currentRates/P/USD', 13988.5471, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (36, N'KHR', N'https://ru.exchange-rates.org/currentRates/P/USD', 4065.77992, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (37, N'CNY', N'https://ru.exchange-rates.org/currentRates/P/USD', 6.45826, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (38, N'KRW', N'https://ru.exchange-rates.org/currentRates/P/USD', 1104.51185, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (39, N'XPF', N'https://ru.exchange-rates.org/currentRates/P/USD', 98.40584, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (40, N'LAK', N'https://ru.exchange-rates.org/currentRates/P/USD', 9340.22048, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (41, N'MOP', N'https://ru.exchange-rates.org/currentRates/P/USD', 7.97668, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (42, N'MYR', N'https://ru.exchange-rates.org/currentRates/P/USD', 4.0383, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (43, N'MMK', N'https://ru.exchange-rates.org/currentRates/P/USD', 1408.52845, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (44, N'NPR', N'https://ru.exchange-rates.org/currentRates/P/USD', 116.22549, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (45, N'NZD', N'https://ru.exchange-rates.org/currentRates/P/USD', 1.38389, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (46, N'PKR', N'https://ru.exchange-rates.org/currentRates/P/USD', 158.86001, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (47, N'SCR', N'https://ru.exchange-rates.org/currentRates/P/USD', 21.20685, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (48, N'SGD', N'https://ru.exchange-rates.org/currentRates/P/USD', 1.32517, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (49, N'TWD', N'https://ru.exchange-rates.org/currentRates/P/USD', 28.00977, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (50, N'THB', N'https://ru.exchange-rates.org/currentRates/P/USD', 29.86171, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (51, N'FJD', N'https://ru.exchange-rates.org/currentRates/P/USD', 2.02654, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (52, N'PHP', N'https://ru.exchange-rates.org/currentRates/P/USD', 48.06835, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (53, N'LKR', N'https://ru.exchange-rates.org/currentRates/P/USD', 194.0473, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (54, N'JPY', N'https://ru.exchange-rates.org/currentRates/P/USD', 104.92318, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (55, N'ALL', N'https://ru.exchange-rates.org/currentRates/E/USD', 102.01994, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (56, N'GBP', N'https://ru.exchange-rates.org/currentRates/E/USD', 0.72244, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (57, N'BYN', N'https://ru.exchange-rates.org/currentRates/E/USD', 2.59093, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (58, N'BGN', N'https://ru.exchange-rates.org/currentRates/E/USD', 1.61653, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (59, N'HUF', N'https://ru.exchange-rates.org/currentRates/E/USD', 295.86524, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (60, N'DKK', N'https://ru.exchange-rates.org/currentRates/E/USD', 6.13652, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (61, N'EUR', N'https://ru.exchange-rates.org/currentRates/E/USD', 0.82514, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (62, N'ISK', N'https://ru.exchange-rates.org/currentRates/E/USD', 128.55634, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (63, N'MKD', N'https://ru.exchange-rates.org/currentRates/E/USD', 50.86144, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (64, N'MDL', N'https://ru.exchange-rates.org/currentRates/E/USD', 17.4023, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (65, N'NOK', N'https://ru.exchange-rates.org/currentRates/E/USD', 8.46244, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (66, N'PLN', N'https://ru.exchange-rates.org/currentRates/E/USD', 3.71072, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (67, N'RUB', N'https://ru.exchange-rates.org/currentRates/E/USD', 73.79537, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (68, N'RON', N'https://ru.exchange-rates.org/currentRates/E/USD', 4.02172, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (69, N'RSD', N'https://ru.exchange-rates.org/currentRates/E/USD', 97.0031, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (70, N'UAH', N'https://ru.exchange-rates.org/currentRates/E/USD', 27.83715, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (71, N'HRK', N'https://ru.exchange-rates.org/currentRates/E/USD', 6.24752, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (72, N'CZK', N'https://ru.exchange-rates.org/currentRates/E/USD', 21.23449, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (73, N'SEK', N'https://ru.exchange-rates.org/currentRates/E/USD', 8.30422, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (74, N'CHF', N'https://ru.exchange-rates.org/currentRates/E/USD', 0.89192, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (75, N'AZN', N'https://ru.exchange-rates.org/currentRates/M/USD', 1.69915, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (76, N'AMD', N'https://ru.exchange-rates.org/currentRates/M/USD', 523.30187, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (77, N'BHD', N'https://ru.exchange-rates.org/currentRates/M/USD', 0.37701, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (78, N'GEL', N'https://ru.exchange-rates.org/currentRates/M/USD', 3.29649, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (79, N'ILS', N'https://ru.exchange-rates.org/currentRates/M/USD', 3.25087, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (80, N'JOD', N'https://ru.exchange-rates.org/currentRates/M/USD', 0.70888, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (81, N'IQD', N'https://ru.exchange-rates.org/currentRates/M/USD', 1461.77132, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (82, N'IRR', N'https://ru.exchange-rates.org/currentRates/M/USD', 42084.02553, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (83, N'YER', N'https://ru.exchange-rates.org/currentRates/M/USD', 250.36962, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (84, N'KZT', N'https://ru.exchange-rates.org/currentRates/M/USD', 419.20259, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (85, N'QAR', N'https://ru.exchange-rates.org/currentRates/M/USD', 3.6372, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (86, N'KGS', N'https://ru.exchange-rates.org/currentRates/M/USD', 84.46828, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (87, N'KWD', N'https://ru.exchange-rates.org/currentRates/M/USD', 0.3025, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (88, N'LBP', N'https://ru.exchange-rates.org/currentRates/M/USD', 1516.60176, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (89, N'AED', N'https://ru.exchange-rates.org/currentRates/M/USD', 3.67326, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (90, N'OMR', N'https://ru.exchange-rates.org/currentRates/M/USD', 0.385, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (91, N'SAR', N'https://ru.exchange-rates.org/currentRates/M/USD', 3.75099, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (92, N'TRY', N'https://ru.exchange-rates.org/currentRates/M/USD', 7.03722, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (93, N'TMT', N'https://ru.exchange-rates.org/currentRates/M/USD', 3.50827, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (94, N'UZS', N'https://ru.exchange-rates.org/currentRates/M/USD', 10531.99881, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (95, N'DZD', N'https://ru.exchange-rates.org/currentRates/F/USD', 132.97907, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (96, N'AOA', N'https://ru.exchange-rates.org/currentRates/F/USD', 651.31774, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (97, N'BWP', N'https://ru.exchange-rates.org/currentRates/F/USD', 10.84643, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (98, N'BIF', N'https://ru.exchange-rates.org/currentRates/F/USD', 1941.32451, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (99, N'GMD', N'https://ru.exchange-rates.org/currentRates/F/USD', 51.41439, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (100, N'GHS', N'https://ru.exchange-rates.org/currentRates/F/USD', 5.79898, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (101, N'GNF', N'https://ru.exchange-rates.org/currentRates/F/USD', 10279.80395, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (102, N'DJF', N'https://ru.exchange-rates.org/currentRates/F/USD', 177.84177, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (103, N'EGP', N'https://ru.exchange-rates.org/currentRates/F/USD', 15.62067, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (104, N'ZMW', N'https://ru.exchange-rates.org/currentRates/F/USD', 21.59243, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (105, N'CVE', N'https://ru.exchange-rates.org/currentRates/F/USD', 90.98373, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (106, N'KES', N'https://ru.exchange-rates.org/currentRates/F/USD', 109.28584, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (107, N'XAF', N'https://ru.exchange-rates.org/currentRates/F/USD', 541.25437, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (108, N'XOF', N'https://ru.exchange-rates.org/currentRates/F/USD', 541.25437, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (109, N'LSL', N'https://ru.exchange-rates.org/currentRates/F/USD', 14.63471, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (110, N'LYD', N'https://ru.exchange-rates.org/currentRates/F/USD', 4.44807, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (111, N'MUR', N'https://ru.exchange-rates.org/currentRates/F/USD', 39.7551, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (112, N'MWK', N'https://ru.exchange-rates.org/currentRates/F/USD', 774.51564, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (113, N'MAD', N'https://ru.exchange-rates.org/currentRates/F/USD', 8.94564, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (114, N'NAD', N'https://ru.exchange-rates.org/currentRates/F/USD', 14.63471, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (115, N'NGN', N'https://ru.exchange-rates.org/currentRates/F/USD', 405.32378, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (116, N'RWF', N'https://ru.exchange-rates.org/currentRates/F/USD', 991.93841, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (117, N'SZL', N'https://ru.exchange-rates.org/currentRates/F/USD', 14.63224, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (118, N'SOS', N'https://ru.exchange-rates.org/currentRates/F/USD', 577.92594, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (119, N'SDG', N'https://ru.exchange-rates.org/currentRates/F/USD', 55.22249, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (120, N'TZS', N'https://ru.exchange-rates.org/currentRates/F/USD', 2316.5803, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (121, N'TND', N'https://ru.exchange-rates.org/currentRates/F/USD', 2.69572, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (122, N'UGX', N'https://ru.exchange-rates.org/currentRates/F/USD', 3662.20543, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (123, N'ETB', N'https://ru.exchange-rates.org/currentRates/F/USD', 39.60459, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (124, N'ZAR', N'https://ru.exchange-rates.org/currentRates/F/USD', 14.54275, 0, CAST(N'2021-02-13T20:05:32.423' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (125, N'XAU', N'https://www.moex.com/ru/derivatives/commodity/gold/', 1818.8, 0, CAST(N'2021-02-13T20:05:34.623' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (126, N'PAL', N'https://www.moex.com/ru/derivatives/commodity/gold/', 2381, 0, CAST(N'2021-02-13T20:05:34.623' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (127, N'PL', N'https://www.moex.com/ru/derivatives/commodity/gold/', 1240, 0, CAST(N'2021-02-13T20:05:34.623' AS DateTime))
GO
INSERT [dbo].[Rates] ([Id], [Acronim], [Site], [Buy], [Sell], [Date]) VALUES (128, N'XAG', N'https://www.moex.com/ru/derivatives/commodity/gold/', 27.1, 0, CAST(N'2021-02-13T20:05:34.623' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rates] OFF
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Price]  DEFAULT ((0)) FOR [Buy]
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Cell]  DEFAULT ((0)) FOR [Sell]
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Date]  DEFAULT (getdate()) FOR [Date]
GO
