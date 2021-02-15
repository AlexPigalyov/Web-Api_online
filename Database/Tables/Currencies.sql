USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Acronim] [nvarchar](5) NULL,
	[Country] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (1, N'Georgiy Pobedonosec MMD', N'GPM', N'Russia')
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (2, N'Georgiy Pobedonosec SPMD', N'GPS', N'Russia')
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (5, N'Gold', N'XAU', N'Earth')
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (6, N'Silver', N'XAG', N'Earth')
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (7, N'Platinum', N'PL', N'Earth')
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (8, N'Argentine Peso', N'ARS', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (9, N'Australian Dollar', N'AUD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (10, N'Bahraini Dinar', N'BHD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (11, N'Barbadian Dollar', N'BBD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (12, N'Brazilian Real', N'BRL', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (13, N'British Pound', N'GBP', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (14, N'Canadian Dollar', N'CAD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (15, N'Central African CFA franc', N'XAF', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (16, N'Chilean Peso', N'CLP', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (17, N'Chinese Yuan', N'CNY', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (18, N'Cyprus Pound', N'CYP', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (19, N'Czech Koruna', N'CZK', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (20, N'Danish Krone', N'DKK', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (21, N'East Caribbean Dollar', N'XCD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (22, N'Egyptian Pound', N'EGP', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (23, N'Estonian Kroon', N'EEK', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (24, N'Euro', N'EUR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (25, N'Hong Kong Dollar', N'HKD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (26, N'Hungarian Forint', N'HUF', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (27, N'Icelandic Krona', N'ISK', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (28, N'Indian Rupee', N'INR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (29, N'Indonesian Rupiah', N'IDR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (30, N'Israeli Sheqel', N'ILS', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (31, N'Jamaican Dollar', N'JMD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (32, N'Japanese Yen', N'JPY', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (33, N'Jordanian Dinar', N'JOD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (34, N'Kenyan Shilling', N'KES', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (35, N'Latvian Lats', N'LVL', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (36, N'Lebanese Pound', N'LBP', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (37, N'Lithuanian Litas', N'LTL', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (38, N'Malaysian Ringgit', N'MYR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (39, N'Mexican Peso', N'MXN', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (40, N'Moroccan Dirham', N'MAD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (41, N'Namibian Dollar', N'NAD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (42, N'Nepalese Rupee', N'NPR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (43, N'New Zealand Dollar', N'NZD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (44, N'Norwegian Krone', N'NOK', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (45, N'Omani Rial', N'OMR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (46, N'Pakistani Rupee', N'PKR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (47, N'Panamanian Balboa', N'PAB', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (48, N'Philippine Peso', N'PHP', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (49, N'Polish Zloty', N'PLN', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (50, N'Qatari Riyal', N'QAR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (51, N'Romanian Leu', N'RON', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (52, N'Russian Rouble', N'RUB', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (53, N'Saudi Riyal', N'SAR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (54, N'Singapore Dollar', N'SGD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (55, N'South African Rand', N'ZAR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (56, N'South Korean Won', N'KRW', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (57, N'Sri Lankan Rupee', N'LKR', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (58, N'Swedish Krona', N'SEK', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (59, N'Swiss Franc', N'CHF', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (60, N'Thai Baht', N'THB', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (61, N'Turkish Lira', N'TRY', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (62, N'United Arab Emirates Dirham', N'AED', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (63, N'US Dollar', N'USD', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (64, N'Venezuelan bolivar', N'VEF', NULL)
GO
INSERT [dbo].[Currencies] ([Id], [Name], [Acronim], [Country]) VALUES (65, N'West African CFA franc', N'XOF', NULL)
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
