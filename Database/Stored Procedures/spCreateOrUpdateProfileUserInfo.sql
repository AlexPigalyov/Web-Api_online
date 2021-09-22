USE [web-api.online]
GO
/****** Object:  StoredProcedure [dbo].[spAdd_BTC_USDT_ClosedOrder]    Script Date: 20.08.2021 23:57:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCreateOrUpdateProfileUserInfo]
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

IF NOT EXISTS(SELECT * FROM UsersInfo WHERE UserId = @userId)
BEGIN

INSERT INTO UsersInfo (UserId, FullName, AboutMe, FacebookLink, InstagramLink, SkypeLink, TwitterLink, LinkedinLink, GithubLink)
VALUES (@userId, @fullName, @aboutMe, @facebookLink, @instagramLink, @skypeLink, @twitterLink, @linkedinLink, @githubLink)

END
ELSE
BEGIN

UPDATE UsersInfo
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
