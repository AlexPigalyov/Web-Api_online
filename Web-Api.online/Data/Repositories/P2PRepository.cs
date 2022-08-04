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

            await _dbExchange.QueryAsync("CreateValute", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }
    
    public async Task CreatePayment(string name)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("name", name);

            await _dbExchange.QueryAsync("CreatePayment", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }
    
    public async Task CreatePaymentValute(long paymentId, long valuteId)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("paymentId", paymentId);
            p.Add("valuteId", valuteId);

            await _dbExchange.QueryAsync("CreatePaymentValute", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }
    
    public async Task CreateP2PSeller(string userId, decimal price, long fiatId, decimal limitFrom, decimal limitTo, decimal available, long paymentId, long cryptId)
    {
        try
        {
            var p = new DynamicParameters();
            p.Add("userId", userId);
            p.Add("price", price);
            p.Add("fiatId", fiatId);
            p.Add("limitFrom", limitFrom);
            p.Add("limitTo", limitTo);
            p.Add("available", available);
            p.Add("paymentId", paymentId);
            p.Add("cryptId", cryptId);
            
            await _dbExchange.QueryAsync("CreateP2PSeller", p, commandType: CommandType.StoredProcedure);
        }
        catch (Exception ex) { }
    }

    public async Task<List<P2PSellerPaymentTableModel>> GetP2PPaymentByP2PUserId(long p2pSellerId)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("p2pSellerId", p2pSellerId);

            return (await _dbExchange.QueryAsync<P2PSellerPaymentTableModel>("GetP2PPaymentsByP2PUserId",
                    parameters,
                    commandType: CommandType.StoredProcedure)).ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<FiatTableModel> GetFiatById(long fiatId)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("fiatId", fiatId);

            return await _dbExchange.QueryFirstAsync<FiatTableModel>("GetFiatById",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<CryptTableModel> GetCryptById(long id)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("id", id);

            return await _dbExchange.QueryFirstAsync<CryptTableModel>("GetCryptById",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<CryptTableModel> GetCryptByName(string name)
    {
        try
        {
            var parameters = new DynamicParameters();
            parameters.Add("name", name);

            return await _dbExchange.QueryFirstAsync<CryptTableModel>("GetCryptByName",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<List<CryptTableModel>> GetCrypts()
    {
        try
        {
            return (await _dbExchange.QueryAsync<CryptTableModel>("GetCrypts",
                commandType: CommandType.StoredProcedure)).ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }

    public async Task<List<string>> GetP2PUserPaymentsByP2PUserId(long p2pUserId)
    {
        try
        {
            return (await GetP2PPaymentByP2PUserId(p2pUserId)).Select(x =>
            {
                var parameters = new DynamicParameters();
                parameters.Add("id", x.PaymentId);

                return _dbWebApi.QueryFirstAsync<PaymentTableModel>(
                    "GetPaymentById",
                    parameters,
                    commandType: CommandType.StoredProcedure).Result.Name;
            }).ToList();
        }
        catch (Exception exc)
        {
            return null;
        }
    }
    
    public async Task<List<P2PSellerModel>> GetP2PUsersByCryptId(bool isBuyers, long cryptId, string cryptName, int page)
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

                user.FiatName = (await GetFiatById(p2pSeller.FiatId)).Name;
                user.CryptName = (await GetCryptById(p2pSeller.CryptId)).Name;
                user.Payments = await GetP2PUserPaymentsByP2PUserId(p2pSeller.Id);
            }

            return result.ToList();
        }
        catch (Exception ex)
        {
            return null;
        }
    }
}