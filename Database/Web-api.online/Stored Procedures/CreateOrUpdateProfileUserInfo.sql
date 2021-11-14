ALTER PROCEDURE [dbo].[CreateOrUpdateProfileUserInfo]
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
