USE [web-api.online]
GO
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_ClosedOrder]    Script Date: 20.08.2021 23:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCreateUserInfo]
@userId nvarchar(450),
@profilePhotoPath nvarchar(MAX),
@fullName nvarchar(450),
@aboutMe nvarchar(MAX),
@facebookLink nvarchar(MAX),
@instagramLink nvarchar(MAX),
@skypeLink nvarchar(MAX),
@twitterLink nvarchar(MAX),
@linkedinLink nvarchar(MAX),
@githubLink nvarchar(MAX),
@location nvarchar(200)
AS
BEGIN

INSERT INTO UsersInfo (UserId, ProfilePhotoPath, FullName, AboutMe, FacebookLink, InstagramLink, SkypeLink, TwitterLink, LinkedinLink, GithubLink, Location)
VALUES (@userId, @profilePhotoPath, @fullName, @aboutMe, @facebookLink, @instagramLink, @skypeLink, @twitterLink, @linkedinLink, @githubLink, @location)

END
