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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
	[Created] [datetime] NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Number] [int] IDENTITY(1,1) NOT NULL,
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
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashIns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserNumber] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[Sposob] [nvarchar](max) NULL,
	[WhenDate] [datetime] NOT NULL,
	[AcceptedAccount] [nvarchar](50) NOT NULL,
	[SendAccount] [nvarchar](50) NULL,
 CONSTRAINT [PK_CashIns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashOuts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserNumber] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[WhenDate] [datetime] NOT NULL,
	[Sposob] [nvarchar](max) NOT NULL,
	[WhenAdminEvent] [datetime] NULL,
	[State] [int] NOT NULL,
	[Number] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[PaymentNumber] [nvarchar](50) NULL,
	[Result] [int] NOT NULL,
 CONSTRAINT [PK_CashOuts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[AuthorId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Blocked] [bit] NOT NULL,
	[LastActive] [datetime] NOT NULL,
	[Balance] [float] NOT NULL,
	[WhenHistoryChecked] [datetime] NOT NULL,
	[BalanceUpdatePerMonth] [float] NOT NULL,
	[BalanceUpdatePerMonthUpdateDate] [datetime] NOT NULL,
	[IdentificateStatus] [int] NOT NULL,
	[Commision] [bit] NOT NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
	[RegistrationDate] [datetime] NOT NULL,
	[ReffererId] [nvarchar](450) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220712-001814] ON [dbo].[AspNetUsers]
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserLogins] ADD  CONSTRAINT [DF_AspNetUserLogins_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[CashIns] ADD  CONSTRAINT [DF_CashIns_Sposob]  DEFAULT ('Qiwi') FOR [Sposob]
GO
ALTER TABLE [dbo].[CashIns] ADD  CONSTRAINT [DF_CashIns_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[CashIns] ADD  CONSTRAINT [DF_CashIns_AcceptedAccount]  DEFAULT ((0)) FOR [AcceptedAccount]
GO
ALTER TABLE [dbo].[CashOuts] ADD  CONSTRAINT [DF_CashOuts_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[CashOuts] ADD  CONSTRAINT [DF_CashOuts_Status]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[CashOuts] ADD  CONSTRAINT [DF_CashOuts_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[CashOuts] ADD  CONSTRAINT [DF_CashOuts_Result]  DEFAULT ((1)) FOR [Result]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_Blocked]  DEFAULT ((0)) FOR [Blocked]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_LastActive]  DEFAULT (getdate()) FOR [LastActive]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_WhenHistoryChecked]  DEFAULT (getdate()) FOR [WhenHistoryChecked]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_BalanceUpdatePerMonth]  DEFAULT ((0)) FOR [BalanceUpdatePerMonth]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_BalanceUpdatePerMonthUpdateDate]  DEFAULT (getdate()) FOR [BalanceUpdatePerMonthUpdateDate]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_IdentificateStatus]  DEFAULT ((1)) FOR [IdentificateStatus]
GO
ALTER TABLE [dbo].[Phones] ADD  CONSTRAINT [DF_Phones_Commision]  DEFAULT ((0)) FOR [Commision]
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
CREATE PROCEDURE [dbo].[AddCashIn]
@userNumber int,
@value float,
@sposob nvarchar(max),
@whenDate datetime,
@acceptedAccount nvarchar(50),
@sendAccount nvarchar(50)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[CashIns] ([UserNumber], [Value], [Sposob], [WwhenDate], [AcceptedAccount], [SendAccount])
VALUES (@userNumber, @value, @sposob, @whenDate, @acceptedAccount, @sendAccount)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CheckExistCashIn]
@userNumber integer,
@value float,
@whenDate datetime

AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT *

FROM CashIns 
WHERE UserNumber = @userNumber 
AND Value = @value
AND WhenDate = @whenDate

END

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
CREATE PROCEDURE [dbo].[GetAllRefferals]
AS
BEGIN

SELECT 
anu.Email,
anu.UserName,
ui.FullName,
ui.RegistrationDate,
ui.ReffererId

FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId IS NOT NULL

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRegistratedUser]

AS
BEGIN

SELECT AspNetUsers.Email, UsersInfo.FullName, UsersInfo.RegistrationDate 
FROM AspNetUsers 
LEFT JOIN UsersInfo
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
CREATE PROCEDURE [dbo].[GetCountOfRefferrersUser]
@userId nvarchar(450)
AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '87aa46b6-f6b1-4d7b-9540-a575b76b706c'

SELECT COUNT(1) FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
WHERE UsersInfo.ReffererId = @userId

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfRegistratedUsers]
AS
BEGIN

SELECT COUNT(1) FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
WHERE AspNetUsers.Id IS NOT NULL
AND UsersInfo.UserId IS NOT NULL

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
CREATE PROCEDURE [dbo].[GetCountUserRefferer]
AS
BEGIN

SELECT COUNT(1) FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId IS NOT NULL

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

CREATE PROCEDURE [dbo].[GetNews]
AS
BEGIN

SELECT n.[Id]
      ,n.[Name]
      ,n.[Text]
      ,n.[Created]
      ,n.[AuthorId]
	  ,u.[UserName]
FROM [News] AS n 
LEFT JOIN AspNetUsers AS u
ON n.AuthorId = u.Id


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhone]
@number nvarchar(450)

AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT *


FROM Phones 
WHERE Number = @number

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRefferals_Paged]
@page int,
@pageSize int
AS
BEGIN

SELECT 
LEFT(anu.Email, 2) + '*****' + RIGHT(anu.Email,4) Email, 
	ui.ReffererId,
	ui.RegistrationDate

FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId IS NOT NULL
ORDER By ui.RegistrationDate desc

OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetRegistratedUsers_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
	AspNetUsers.Number,
	LEFT(AspNetUsers.Email, 2) + '*****' + RIGHT(AspNetUsers.Email,4) Email, 
	LEFT(UsersInfo.FullName, 1) + '*****' + RIGHT(UsersInfo.FullName,1) FullName, 
	UsersInfo.RegistrationDate,
	UsersInfo.ReffererId,
	[AspNetUserLogins].Created
FROM AspNetUsers 
LEFT JOIN UsersInfo
ON AspNetUsers.Id = UsersInfo.UserId
LEFT JOIN [AspNetUserLogins]
ON AspNetUsers.Id = [AspNetUserLogins].[UserId]
Order By Number desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

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

CREATE PROCEDURE [dbo].[GetUser]
@userId nvarchar(450)

AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT *


FROM AspNetUsers 
WHERE Id = @userId

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserByPublicId]
@number integer

AS
BEGIN

SELECT *

FROM AspNetUsers 
WHERE Number = @number

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserByUserNumber]
@number int
AS
BEGIN

SELECT *
FROM AspNetUsers 
WHERE Number = @number

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
CREATE PROCEDURE [dbo].[GetUserRefferals]
@userId nvarchar(450)

AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT 
anu.Email,
anu.UserName,
ui.FullName,
ui.ReffererId


FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui
ON anu.Id = ui.UserId
WHERE ui.ReffererId = @userId

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserRefferals_Paged]
@userId nvarchar(450),
@page int,
@pageSize int
AS
BEGIN
--declare @userId nvarchar(450);
--set @userId = '08d803ba-a9fb-430e-a0b9-d4a366aeaee7'


SELECT
anu.Id
,LEFT(anu.Email, 2) + '*****' + RIGHT(anu.Email,4) Email
,ui.ReffererId
,ui.RegistrationDate
,anuref.Id

FROM AspNetUsers as anu
LEFT JOIN UsersInfo as ui ON anu.Id = ui.UserId
LEFT JOIN AspNetUsers anuref ON anuref.Number = ui.ReffererId
WHERE anuref.Id = @userId
ORDER By ui.RegistrationDate desc

OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SetUserInfoRefid]
@userId nvarchar(450),
@refid nvarchar(450)
AS
BEGIN

UPDATE [web-api.online].[dbo].[UsersInfo]
SET ReffererId = @refid
WHERE UserId = @userId

END
GO
