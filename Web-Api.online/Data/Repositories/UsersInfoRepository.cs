using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories
{
    public class UsersInfoRepository
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnection _db;
        public UsersInfoRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));            
        }

        public async Task<UserInfoTableModel> spGetUserInfo_ByUserId(string userId)
        {
            try
            {
                return await _db.QueryFirstAsync<UserInfoTableModel>(
                    "GetUserInfo_ByUserId",
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
        public async Task spCreateOrUpdateUsersInfoLocation(UserInfoTableModel model)
        {
            try
            {
                await _db.ExecuteAsync(
                    "CreateOrUpdateUsersInfoLocation",
                    new
                    {
                        userId = model.UserId,
                        location = model.Location
                    },
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { }
        }

        public async Task spCreateOrUpdateProfileUsersInfoPhoto(UserInfoTableModel model)
        {
            try
            {
                await _db.ExecuteAsync(
                    "CreateOrUpdateProfileUsersInfoPhoto",
                    new
                    {
                        userId = model.UserId,
                        profilePhotoPath = model.ProfilePhotoPath
                    },
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex) { }
        }

        public async Task spCreateOrUpdateProfileUserInfo(UserInfoTableModel model)
        {
            try
            {
                await _db.ExecuteAsync(
                    "CreateOrUpdateProfileUserInfo",
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
