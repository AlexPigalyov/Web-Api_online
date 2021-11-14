USE [web-api.online]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoinsRates](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Acronim] [nvarchar](10) NOT NULL,
	[Site] [nvarchar](150) NOT NULL,
	[Sell] [float] NOT NULL,
	[Buy] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsUp] [bit] NULL,
 CONSTRAINT [PK_CoinsRates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DpdCities](
	[cityId] [bigint] NOT NULL,
	[cityIdSpecified] [bit] NOT NULL,
	[countryCode] [nvarchar](50) NOT NULL,
	[countryName] [nvarchar](50) NOT NULL,
	[regionCode] [int] NOT NULL,
	[regionCodeSpecified] [bit] NOT NULL,
	[regionName] [nvarchar](100) NOT NULL,
	[cityCode] [nvarchar](50) NOT NULL,
	[cityName] [nvarchar](100) NOT NULL,
	[abbreviation] [nvarchar](50) NOT NULL,
	[indexMin] [nvarchar](50) NULL,
	[indexMax] [nvarchar](50) NULL,
	[Population] [bigint] NULL,
	[Settled] [nchar](20) NULL,
	[lat] [float] NULL,
	[lng] [float] NULL,
 CONSTRAINT [PK_DpdCities_48] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
	[IsUp] [bit] NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInfo](
	[UserId] [nvarchar](450) NOT NULL,
	[ProfilePhotoPath] [nvarchar](max) NULL,
	[FullName] [nvarchar](450) NULL,
	[AboutMe] [nvarchar](max) NULL,
	[FacebookLink] [nvarchar](max) NULL,
	[InstagramLink] [nvarchar](max) NULL,
	[SkypeLink] [nvarchar](max) NULL,
	[TwitterLink] [nvarchar](max) NULL,
	[LinkedinLink] [nvarchar](max) NULL,
	[GithubLink] [nvarchar](max) NULL,
	[Location] [nvarchar](200) NULL,
	[RegistrationDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.4')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0996e6bb-ea74-447b-9832-d1b5a02d4a70', N'BinanceBotParserAccount', N'BINANCEBOTPARSERACCOUNT', N'BinanceBot@account.com', N'BINANCEBOT@ACCOUNT.COM', 0, N'AQAAAAEAACcQAAAAEICThOTkYjSjK5jyZevrxyXQKFJSkKBLBJtyFFsBOWtXdaSzavQAWyuoQOjzcI60Rw==', N'WSU5WODB2ZPLFWJTVUMLEFGLXC2HIQL7', N'af9397e0-6e95-4146-acc6-dfaa54609e5d', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1d6254fc-8f94-4229-b09f-a2b225c128b0', N'BitFinexBotParserAccount', N'BITFINEXBOTPARSERACCOUNT', N'BitFinexBot@account.com', N'BITFINEXBOT@ACCOUNT.COM', 0, N'AQAAAAEAACcQAAAAEIaLsIvppF8t/wKD9bGJUSKJoVZY04K3/s6RdW+p8OGzJRVAaHYxM5mbw63L2bXDvg==', N'E3X2AVHCLBZCUJNWXIS6IDURXK3VAKVN', N'3c6a161c-6edd-497e-ba09-4406d09f06f1', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'40ffde92-878c-4c09-ac6b-c86a769d1623', N'alex.pigalyov@gmail.com', N'ALEX.PIGALYOV@GMAIL.COM', N'alex.pigalyov@gmail.com', N'ALEX.PIGALYOV@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMGh3KyRXbNgFE8Xv/XmdT3ViCOi4X2WVCRiA7nIqaXrHUbE+URvo7Sb0biYTdQZsA==', N'7DSMMORLJEQSVUFYDLMO7XABIXNRAXVD', N'8f7ff654-4437-4fbc-aa90-b6723711c176', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'73e1341c-f193-45cb-ac0b-4dfedc605a0d', N'mathewsun@rambler.ru', N'MATHEWSUN@RAMBLER.RU', N'mathewsun@rambler.ru', N'MATHEWSUN@RAMBLER.RU', 0, N'AQAAAAEAACcQAAAAEA2pkFAiJ6Jy2fzpCXsaSWuOQwW8yAoKfOvCBht90WyJVgHNXTEOjDXOiIJNECXVpw==', N'OFPJS5WCP3WFQ2YMVDDOUL6HC2CYLKAB', N'6163a952-35b7-43c7-a97b-314fa5699246', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'824bef62-0f83-4e98-bec1-85ddca883324', N'PoloniexBotParserAccount', N'POLONIEXBOTPARSERACCOUNT', N'PoloniexBot@account.com', N'POLONIEXBOT@ACCOUNT.COM', 0, N'AQAAAAEAACcQAAAAED0uuFHIkuPsCrbavHvdv2f7PjiNHLj1Krq48MxYQDwhQbeq7L8I7KihdevQXuP/sQ==', N'SA6KGZCGKHC3T3EVHYPXWQF2NXCL6LIJ', N'5981b82d-15da-4811-a9d6-95c9a21e4f9e', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cce4bbb8-e74c-4d2b-af4c-b87da455c6cf', N'KucoinBotParserAccount', N'KUCOINBOTPARSERACCOUNT', N'KucoinBot@account.com', N'KUCOINBOT@ACCOUNT.COM', 0, N'AQAAAAEAACcQAAAAEObRZQLROLv4FtSA+SROwixJa01gAhf5tlgwR2yl2KFNTbd2bZnPt2xnDKh8JAJpBA==', N'SSWHTLMOGLTVDAWOYDATGA6ZVTIARITT', N'addd6a13-bb90-441d-821e-889a03614113', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f15ad39c-2e1d-492b-b3af-047fad496645', N'mathewsun@yandex.ru', N'MATHEWSUN@YANDEX.RU', N'mathewsun@yandex.ru', N'MATHEWSUN@YANDEX.RU', 0, N'AQAAAAEAACcQAAAAEMPUt3KyFehwjy1jMHZoDb7WhipReiu3wmudRusN2HJHtIM21y17Ox4FIZcpwZrpbQ==', N'TN3P74GZPZS7HBVQ62WK2NGCTBX4CBN4', N'c219af2d-ee55-4d3d-ba38-e3d8ccb5703d', NULL, 0, 0, NULL, 1, 0)
GO
ALTER TABLE [dbo].[CoinsRates] ADD  CONSTRAINT [DF_CoinsRates_Sell]  DEFAULT ((0)) FOR [Sell]
GO
ALTER TABLE [dbo].[CoinsRates] ADD  CONSTRAINT [DF_CoinsRates_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[CoinsRates] ADD  CONSTRAINT [DF_CoinsRates_IsUp]  DEFAULT ((1)) FOR [IsUp]
GO
ALTER TABLE [dbo].[DpdCities] ADD  CONSTRAINT [DF_DpdCities_indexMin_48]  DEFAULT (NULL) FOR [indexMin]
GO
ALTER TABLE [dbo].[DpdCities] ADD  CONSTRAINT [DF_DpdCities_indexMax_48]  DEFAULT (NULL) FOR [indexMax]
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Price]  DEFAULT ((0)) FOR [Buy]
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Cell]  DEFAULT ((0)) FOR [Sell]
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_IsUp]  DEFAULT ((1)) FOR [IsUp]
GO
ALTER TABLE [dbo].[UsersInfo] ADD  CONSTRAINT [DF_UsersInfo_RegistrationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateOrUpdateProfileUserInfo]
@userId nvarchar(450),
@fullName nvarchar(450),
@aboutMe nvarchar(MAX),
@facebookLink nvarchar(MAX),
@instagramLink nvarchar(MAX),
@skypeLink nvarchar(MAX),
@twitterLink nvarchar(MAX),
@linkedinLink nvarchar(MAX),
@githubLink nvarchar(MAX)
AS
BEGIN

IF NOT EXISTS(SELECT 1 FROM [web-api.online].[dbo].[UsersInfo] WHERE UserId = @userId)
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo] (UserId, FullName, AboutMe, FacebookLink, InstagramLink, SkypeLink, TwitterLink, LinkedinLink, GithubLink)
VALUES (@userId, @fullName, @aboutMe, @facebookLink, @instagramLink, @skypeLink, @twitterLink, @linkedinLink, @githubLink)

END
ELSE
BEGIN

UPDATE [web-api.online].[dbo].[UsersInfo]
SET FullName = @fullName,
    AboutMe = @aboutMe,
	FacebookLink = @facebookLink,
	InstagramLink = @instagramLink,
	SkypeLink = @skypeLink,
	TwitterLink = @twitterLink,
	LinkedinLink = @linkedinLink,
	GithubLink = @githubLink
WHERE UserId = @userId

END


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateOrUpdateProfileUsersInfoPhoto]
@userId nvarchar(450),
@profilePhotoPath nvarchar(MAX)
AS
BEGIN

IF NOT EXISTS(SELECT 1 FROM [web-api.online].[dbo].[UsersInfo] WHERE UserId = @userId)
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo] (UserId, ProfilePhotoPath)
VALUES (@userId, @profilePhotoPath)

END
ELSE
BEGIN

UPDATE [web-api.online].[dbo].[UsersInfo]
SET ProfilePhotoPath = @profilePhotoPath
WHERE UserId = @userId

END


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CreateOrUpdateUsersInfoLocation]
@userId nvarchar(450),
@location nvarchar(200)
AS
BEGIN

IF NOT EXISTS(SELECT 1 FROM [web-api.online].[dbo].[UsersInfo] WHERE UserId = @userId)
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo] (UserId, Location)
VALUES (@userId, @location)

END
ELSE
BEGIN

UPDATE [web-api.online].[dbo].[UsersInfo]
SET Location = @location
WHERE UserId = @userId

END


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindUsersByUsernameFor_Paged]
@userName nvarchar(450),
@page int,
@pageSize int
AS
BEGIN

Select
  ANU.UserName
  ,ANU.Email
  ,UI.FullName
  ,UI.Location
  ,UI.RegistrationDate
FROM [web-api.online].[dbo].[AspNetUsers] as ANU
inner join [web-api.online].[dbo].[UsersInfo] as UI
ON ANU.Id = UI.UserId
WHERE ANU.UserName LIKE '%' + @userName + '%'
Order By ANU.Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCoinRatesByAcronim]
@acronim nvarchar(10)
AS
BEGIN

SELECT * 
FROM [web-api.online].[dbo].[CoinsRates] 
WHERE Acronim = @acronim

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetCoinRatesByAcronimAndSite]
@acronim nvarchar(10),
@site nvarchar(150)
AS
BEGIN

SELECT * 
FROM [web-api.online].[dbo].[CoinsRates] 
WHERE [Acronim] = @acronim 
AND [Site] = @site

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfUsers]
AS
BEGIN

SELECT COUNT(1) FROM [web-api.online].[dbo].[AspNetUsers]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetDPDCitiesTop10]
@text nvarchar(50)
AS
BEGIN
SELECT TOP (10) [cityId]
,[cityIdSpecified]
,[countryCode]
,[countryName]
,[regionCode]
,[regionCodeSpecified]
,[regionName]
,[cityCode]
,[cityName]
,[abbreviation]
,[indexMin]
,[indexMax]
,[Population]
,[Settled]
,[lat]
,[lng]
FROM [web-api.online].[dbo].[DpdCities]
WHERE 
[cityName] like N'%'+@text+'%'
ORDER BY Population DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetLastCoinsRates]
AS
BEGIN

select cr.* from   [CoinsRates] cr
inner join (SELECT [Acronim], [Site], Max([Date]) as dateres
FROM [web-api.online].[dbo].[CoinsRates]
group by Acronim, [Site]) as se
on se.[Acronim] = cr.[Acronim] and se.[Site] = cr.[Site] and se.dateres = cr.Date

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetLastRates]
AS
BEGIN

select r.* from   [Rates] r
inner join (SELECT [Acronim], [Site], Max([Date]) as dateres
FROM [web-api.online].[dbo].[Rates]
group by Acronim, [Site]) as se
on se.[Acronim] = r.[Acronim] and se.[Site] = r.[Site] and se.dateres = r.Date

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoles_Paged]
@page int,
@pageSize int
AS
BEGIN

SELECT Id, Name FROM [web-api.online].[dbo].[AspNetRoles]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTickerRates]
AS
BEGIN

select
rub.[Id]
,rub.[Acronim]
,rub.[Site]
,rub.[Buy]
,rub.[Sell]
,rub.[Date]
,rub.[IsUp]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'RUB'
    order by Id desc) rub

union all

select
eur.[Id]
,eur.[Acronim]
,eur.[Site]
,eur.[Buy]
,eur.[Sell]
,eur.[Date]
,eur.[IsUp]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'EUR'
    order by Id desc) eur

	union all

select
xau.[Id]
,xau.[Acronim]
,xau.[Site]
,xau.[Buy]
,xau.[Sell]
,xau.[Date]
,xau.[IsUp]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'XAU'
    order by Id desc) xau

	union all

select
pl.[Id]
,pl.[Acronim]
,pl.[Site]
,pl.[Buy]
,pl.[Sell]
,pl.[Date]
,pl.[IsUp]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'PL'
    order by Id desc) pl

	union all

select
xag.[Id]
,xag.[Acronim]
,xag.[Site]
,xag.[Buy]
,xag.[Sell]
,xag.[Date]
,xag.[IsUp]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'XAG'
    order by Id desc) xag

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserInfo_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[UsersInfo]
WHERE UserId = @userId

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  ANU.UserName
  ,ANU.Email
  ,UI.FullName
  ,UI.Location
  ,UI.RegistrationDate
FROM [web-api.online].[dbo].[AspNetUsers] as ANU
inner join [web-api.online].[dbo].[UsersInfo] as UI
ON ANU.Id = UI.UserId
Order By ANU.Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



GO
