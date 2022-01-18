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
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[TeachersAndLessons]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndLessons_Lessons] FOREIGN KEY([LessonName])
REFERENCES [dbo].[Lessons] ([Name])
GO
ALTER TABLE [dbo].[TeachersAndLessons] CHECK CONSTRAINT [FK_TeachersAndLessons_Lessons]
GO
ALTER TABLE [dbo].[TeachersAndLessons]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndLessons_TeachersInfo] FOREIGN KEY([TeachId])
REFERENCES [dbo].[TeachersInfo] ([TeacherId])
GO
ALTER TABLE [dbo].[TeachersAndLessons] CHECK CONSTRAINT [FK_TeachersAndLessons_TeachersInfo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateEmptyUsersInfo]
@userId nvarchar(450)
AS
BEGIN

INSERT INTO [web-api.online].[dbo].[UsersInfo](UserId)
VALUES (@userId)


END
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
Create PROCEDURE [dbo].[GetAllRegistratedUser]

AS
BEGIN

Select AspNetUsers.Email, UsersInfo.FullName, UsersInfo.RegistrationDate FROM AspNetUsers Left Join UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
WHERE AspNetUsers.Id IS NOT NULL
AND UsersInfo.UserId IS NOT NULL
	
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
CREATE PROCEDURE [dbo].[GetUserIdBy_UserName_NormalizedUserName_Email_PhoneNumber]
@searchText nvarchar(max)
AS
BEGIN

Select ANU.Id
FROM AspNetUsers as ANU
WHERE 
ANU.UserName = @searchText
OR ANU.NormalizedUserName = @searchText
OR ANU.Email = @searchText
OR ANU.PhoneNumber = @searchText

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

SELECT * FROM [web-api.online].[dbo].[UsersInfo]
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
