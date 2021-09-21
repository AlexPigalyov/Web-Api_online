using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public class UsersInfoRepository
    {
        private readonly IConfiguration _configuration;

        public UsersInfoRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<UsersInfo> spGetUserInfo_ByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    return await db.QueryFirstAsync<UsersInfo>(
                        "spGetUserInfo_ByUserId",
                        new 
                        {
                            userId = userId
                        },
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public async Task spCreateUserInfo(UsersInfo model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    await db.ExecuteAsync(
                        "spCreateUserInfo",
                        new
                        {
                            userId = model.UserId,
                            profilePhotoPath = model.ProfilePhotoPath,
                            fullName = model.FullName,
                            aboutMe = model.AboutMe,
                            facebookLink = model.FacebookLink,
                            instagramLink = model.InstagramLink,
                            skypeLink = model.SkypeLink,
                            twitterLink = model.TwitterLink,
                            linkedinLink = model.LinkedinLink,
                            githubLink = model.GithubLink,
                            location = model.Location
                        },
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex) { }
            }
        }
    }
}
