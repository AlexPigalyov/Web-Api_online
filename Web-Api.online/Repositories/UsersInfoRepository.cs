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

        public async Task<UserInfoTableModel> spGetUserInfo_ByUserId(string userId)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    return await db.QueryFirstAsync<UserInfoTableModel>(
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
        public async Task spCreateOrUpdateUsersInfoLocation(UserInfoTableModel model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    await db.ExecuteAsync(
                        "spCreateOrUpdateUsersInfoLocation",
                        new
                        {
                            userId = model.UserId,
                            location = model.Location
                        },
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex) { }
            }
        }

        public async Task spCreateOrUpdateProfileUsersInfoPhoto(UserInfoTableModel model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    await db.ExecuteAsync(
                        "spCreateOrUpdateProfileUsersInfoPhoto",
                        new
                        {
                            userId = model.UserId,
                            profilePhotoPath = model.ProfilePhotoPath
                        },
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex) { }
            }
        }

        public async Task spCreateOrUpdateProfileUserInfo(UserInfoTableModel model)
        {
            using (IDbConnection db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                try
                {
                    await db.ExecuteAsync(
                        "spCreateOrUpdateProfileUserInfo",
                        new
                        {
                            userId = model.UserId,
                            fullName = model.FullName,
                            aboutMe = model.AboutMe,
                            facebookLink = model.FacebookLink,
                            instagramLink = model.InstagramLink,
                            skypeLink = model.SkypeLink,
                            twitterLink = model.TwitterLink,
                            linkedinLink = model.LinkedinLink,
                            githubLink = model.GithubLink
                        },
                        commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex) { }
            }
        }
    }
}
