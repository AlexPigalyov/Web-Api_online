using Dapper;

using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Data.Repositories
{
    public class UserRepository
    {
        private readonly IDbConnection _dbWebApi;
        private readonly IDbConnection _dbExchange;
        public UserRepository(IConfiguration configuration)
        {
            _dbWebApi = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
            _dbExchange = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
        }
        public async Task<List<spGetUsers_PagedSettings>> GetPagedUsers(int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _dbWebApi.QueryAsync<spGetUsers_PagedSettings>(
                        "GetUsers_Paged",
                        parameters,
                        commandType: CommandType.StoredProcedure)).ToList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task<List<spGetUsers_PagedSettings>> FindPagedUsersByUsername(string userName, int page, int pageSize)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("userName", userName);
                parameters.Add("page", page);
                parameters.Add("pageSize", pageSize);

                return (await _dbWebApi.QueryAsync<spGetUsers_PagedSettings>(
                        "FindUsersByUsername_Paged",
                        parameters,
                        commandType: CommandType.StoredProcedure)).AsList();
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public async Task<int> GetCountOfRefferrersUser(string userId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("userId", userId);

            return await _dbWebApi.QueryFirstAsync<int>(
                    "GetCountOfRefferrersUser",
                    parameters,
                    commandType: CommandType.StoredProcedure);
        }

        public async Task<AspNetUserTableModel> GetUser(string userId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("userId", userId);

            return await _dbWebApi.QueryFirstAsync<AspNetUserTableModel>(
                    "GetUser",
                    parameters,
                    commandType: CommandType.StoredProcedure);
        }

        public async Task<int> GetCountUserRefferer()
        {
            try
            {
                return await _dbWebApi.QueryFirstAsync<int>(
                    "GetCountUserRefferer",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {
                return 0;
            }
        }

        public async Task<int> GetCountWallets()
        {
            try
            {
                return await _dbWebApi.QueryFirstAsync<int>(
                    "GetCountWallets",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {
                return 0;
            }
        }

        public async Task<List<UserRefferalTableModel>> GetRefferersPaged(int page, int pageSize)
        {

            var p = new DynamicParameters();
            p.Add("page", page);
            p.Add("pageSize", pageSize);

            List<UserRefferalTableModel> result =
                (List<UserRefferalTableModel>)await _dbWebApi.QueryAsync<UserRefferalTableModel>
                ("GetRefferals_Paged",
                    p,
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<List<UserRefferalTableModel>> GetAllRefferers()
        {
            List<UserRefferalTableModel> result =
                (List<UserRefferalTableModel>)await _dbWebApi.QueryAsync<UserRefferalTableModel>
                ("GetAllRefferals",
                    commandType: CommandType.StoredProcedure);

            return result;

        }

        public async Task<List<UserRefferalTableModel>> GetUserRefferalsListAsync(string userId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("userId", userId);

            List<UserRefferalTableModel> result =
                (List<UserRefferalTableModel>)await _dbWebApi.QueryAsync<UserRefferalTableModel>
                ("GetUserRefferals",
                    parameters,
                    commandType: CommandType.StoredProcedure);

            return result;

        }

        public async Task<List<UserRefferalTableModel>> GetUserRefferals_Paged(string userId, int page, int pageSize)
        {
            var parameters = new DynamicParameters();
            parameters.Add("userId", userId);
            parameters.Add("page", page);
            parameters.Add("pageSize", pageSize);


            List<UserRefferalTableModel> result =
                (List<UserRefferalTableModel>)await _dbWebApi.QueryAsync<UserRefferalTableModel>
                ("GetUserRefferals_Paged",
                    parameters,
                    commandType: CommandType.StoredProcedure);

            return result;

        }

        public async Task<List<WalletViewModel>> GetWalletsPaged(int page, int pageSize)
        {
            var p = new DynamicParameters();
            p.Add("page", page);
            p.Add("pageSize", pageSize);

            List<WalletViewModel> result =
                (List<WalletViewModel>)await _dbExchange.QueryAsync<WalletViewModel>
                ("GetWallets_Paged",
                    p,
                    commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task<string> GetUserIdFromDbWebApi(string userAttributeValue)
        {
            try
            {
                var parameters = new DynamicParameters();

                parameters.Add("searchText", userAttributeValue);

                return
                    await _dbWebApi.QueryFirstOrDefaultAsync<string>(
                        "GetUserIdBy_UserName_NormalizedUserName_Email_PhoneNumber",
                        parameters,
                        commandType: CommandType.StoredProcedure);
            }
            catch
            {
                return null;
            }
        }

        public async Task<string> GetUserIdFromDbExchange(string walletAddress)
        {
            try
            {
                var parameters = new DynamicParameters();

                parameters.Add("address", walletAddress);

                return
                    await _dbExchange.QueryFirstOrDefaultAsync<string>(
                            "GetUserIdByWalletAddress",
                            parameters,
                            commandType: CommandType.StoredProcedure);
            }
            catch
            {
                return null;
            }
        }

        public async Task<string> FindUserIdForSendPageAsync(string searchText)
        {
            var userIdFromDbWebApi = await this.GetUserIdFromDbWebApi(searchText);

            return
                string.IsNullOrEmpty(userIdFromDbWebApi)
                ? await this.GetUserIdFromDbExchange(searchText)
                : userIdFromDbWebApi;
        }

        public async Task<int> GetCountOfUsers()
        {
            try
            {
                return await _dbWebApi.QueryFirstAsync<int>(
                    "GetCountOfUsers",
                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception exc)
            {
                return 0;
            }
        }
    }
}
