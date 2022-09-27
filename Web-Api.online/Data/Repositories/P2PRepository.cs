using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories;

public class P2PRepository
{
    private readonly IDbConnection _dbExchange;
    private readonly SqlConnection _dbWebApi;

    public P2PRepository(IConfiguration configuration)
    {
        _dbWebApi = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
        _dbExchange = new SqlConnection(configuration.GetConnectionString("ExchangeConnection"));
    }

    public async Task CreateValute(string name)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("name", name);

            await _dbExchange.QueryAsync("CreateP2PValute", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }

    public async Task<List<P2PFiatTableModel>> GetFiats()
    {
        try
        {
            return (await _dbExchange.QueryAsync<P2PFiatTableModel>("GetP2PFiats", commandType: CommandType.StoredProcedure))
                .ToList();
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    
    public async Task<List<P2PPaymentTableModel>> GetPayments()
    {
        try
        {
            return (await _dbExchange.QueryAsync<P2PPaymentTableModel>("GetP2PPayments", commandType: CommandType.StoredProcedure))
                .ToList();
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    
    public async Task CreatePayment(string name)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("name", name);

            await _dbExchange.QueryAsync("CreateP2PPayment", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }
    
    public async Task CreateUserPayment(long p2pUserId, int p2pPaymentId, bool isBuyer)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("p2pUserId", p2pUserId);
            p.Add("p2pPaymentId", p2pPaymentId);
            p.Add("isBuyer", isBuyer);

            await _dbExchange.ExecuteAsync("CreateP2PUserPayment", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }
    
    public async Task CreateP2PUser(bool isBuyer, string userId, decimal price, int fiatId, decimal limitFrom, decimal limitTo, decimal available, List<int> paymentIds, int cryptId, int timeFrameId)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("new_identity", dbType: DbType.Int64, direction: ParameterDirection.InputOutput);
            p.Add("userId", userId);
            p.Add("price", price);
            p.Add("p2pFiatId", fiatId);
            p.Add("limitFrom", limitFrom);
            p.Add("limitTo", limitTo);
            p.Add("available", available);
            p.Add("p2pCryptId", cryptId);
            p.Add("p2pTimeFrameId", timeFrameId);
            
            await _dbExchange.QueryAsync<long>("CreateP2P" + (isBuyer ? "Buyer" : "Seller"), p, commandType: CommandType.StoredProcedure);
            var id = p.Get<long>("new_identity");
            
            paymentIds.ForEach(async x => await CreateUserPayment(id, x, isBuyer));
        }
        catch (Exception ex) { }
    }

    public async Task<List<P2PUserPaymentTableModel>> GetP2PPaymentByP2PUserId(long p2pSellerId, bool isBuyer)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("p2pUserId", p2pSellerId);
            parameters.Add("isBuyer", isBuyer);

            return (await _dbExchange.QueryAsync<P2PUserPaymentTableModel>("GetP2PPaymentsByP2PUserId",
                    parameters,
                    commandType: CommandType.StoredProcedure)).ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<P2PFiatTableModel> GetFiatById(int fiatId)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("fiatId", fiatId);

            return await _dbExchange.QueryFirstAsync<P2PFiatTableModel>("GetP2PFiatById",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<P2PCryptTableModel> GetCryptById(int id)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("id", id);

            return await _dbExchange.QueryFirstAsync<P2PCryptTableModel>("GetP2PCryptById",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<P2PCryptTableModel> GetCryptByName(string name)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("name", name);

            return await _dbExchange.QueryFirstAsync<P2PCryptTableModel>("GetP2PCryptByName",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<P2PFiatTableModel> GetFiatByName(string name)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("name", name);

            return await _dbExchange.QueryFirstAsync<P2PFiatTableModel>("GetP2PFiatByName",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<P2PTimeFramesTableModel> GetTimeFrameByViewName(string viewName)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("viewName", viewName);

                return await _dbExchange.QueryFirstAsync<P2PTimeFramesTableModel>("GetP2PTimeFrameByViewName",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    
    
    public async Task<P2PPaymentTableModel> GetPaymentByName(string name)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("name", name);

            return await _dbExchange.QueryFirstAsync<P2PPaymentTableModel>("GetP2PPaymentByName",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<List<P2PCryptTableModel>> GetCrypts()
    {
        try
        {
            return (await _dbExchange.QueryAsync<P2PCryptTableModel>("GetP2PCrypts",
                commandType: CommandType.StoredProcedure)).ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }

    public async Task<List<string>> GetP2PUserPaymentsByP2PUserId(long p2pUserId, bool isBuyer)
    {
        try
        {
            var p2pPaymentsIds = await GetP2PPaymentByP2PUserId(p2pUserId, isBuyer);
            
            return p2pPaymentsIds.Select(x =>
            {
                var parameters = new DynamicParameters();
                parameters.Add("id", x.P2PPaymentId);

                return _dbExchange.QueryFirstAsync<P2PPaymentTableModel>(
                    "GetP2PPaymentById",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result.Name;
            }).ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }

    public async Task<List<P2PTimeFramesTableModel>> GetP2PTimeFrames()
    {
        try
        {
            return (await _dbExchange
                    .QueryAsync<P2PTimeFramesTableModel>("GetP2PTimeFrames", commandType: CommandType.StoredProcedure))
                    .ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<List<P2PSellerModel>> GetP2PUsersByCryptId(bool isBuyers, int cryptId, string cryptName, int page)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("cryptId", cryptId);
            parameters.Add("page", page);

            var p2pUsers = new List<P2PUserTableModel>();

            if (isBuyers)
            {
                p2pUsers = (await _dbExchange.QueryAsync<P2PUserTableModel>("GetP2PBuyersByCryptId",
                        parameters,
                        commandType: CommandType.StoredProcedure)).ToList();
            }
            else
            {
                p2pUsers = (await _dbExchange.QueryAsync<P2PUserTableModel>("GetP2PSellersByCryptId",
                    parameters,
                    commandType: CommandType.StoredProcedure)).ToList();
            }

            var result = new List<P2PSellerModel>();
            
            foreach (var p2pSeller in p2pUsers)
            {
                var user = new P2PSellerModel()
                {
                    Available = p2pSeller.Available,
                    LimitFrom = p2pSeller.LimitFrom,
                    LimitTo = p2pSeller.LimitTo,
                    Price = p2pSeller.Price
                };
                
                parameters = new DynamicParameters();
                parameters.Add("userId", p2pSeller.UserId);
                
                user.UserName = (await _dbWebApi.QueryFirstAsync<AspNetUserTableModel>(
                    "GetUser",
                    parameters,
                    commandType: CommandType.StoredProcedure)).UserName;

                user.FiatName = (await GetFiatById(p2pSeller.P2PFiatId)).Name;
                user.CryptName = (await GetCryptById(p2pSeller.P2PCryptId)).Name;
                user.Payments = await GetP2PUserPaymentsByP2PUserId(p2pSeller.Id, isBuyers);

                result.Add(user);
            }

            return result.ToList();
        }
        catch (Exception ex)
        {
            return null;
        }
    }
}