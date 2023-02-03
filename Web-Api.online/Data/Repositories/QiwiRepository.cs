using Dapper;
using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Web_Api.online.Models;

namespace Web_Api.online.Data.Repositories
{
    public class QiwiRepository
    {
        private readonly IDbConnection _db;

        public QiwiRepository(IConfiguration configuration)
        {
            _db = new SqlConnection(configuration.GetConnectionString("DefaultConnection"));
        }

        public async Task<Phones> GetQiwiAcoount(string number)
        {
            var p = new DynamicParameters();
            p.Add("number", number);

            return await _db.QueryFirstAsync<Phones>("GetPhone", p, commandType: CommandType.StoredProcedure);
        }

        public async Task<bool> CheckExistCashIn(CashIns item)
        {
            var p = new DynamicParameters();
            p.Add("UserNumber", item.UserNumber);
            p.Add("Value", item.Value);
            p.Add("WhenDate", item.WhenDate);

            var result = await _db.QueryFirstAsync<bool>("CheckExistCashIn", p, commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task AddCashIn(CashIns item)
        {
            var p = new DynamicParameters();
            p.Add("UserNumber", item.UserNumber);
            p.Add("Value", item.Value);
            p.Add("Sposob", item.Sposob);
            p.Add("WhenDate", item.WhenDate);
            p.Add("AcceptedAccount", item.AcceptedAccount);
            p.Add("SendAccount", item.SendAccount);

            var result = await _db.QueryFirstAsync<bool>("AddCashIn", p, commandType: CommandType.StoredProcedure);
        }
        public async Task QiwiHistoryChecked(string number)
        {
            var p = new DynamicParameters();
            p.Add("number", number);

            var result = await _db.QueryFirstAsync("spUpdateQiwiAccountWhenHistoryChecked", p, commandType: CommandType.StoredProcedure);
        }

        public async Task<Phones> GetQiwiAcoountCashOut(double amount)
        {
            var p = new DynamicParameters();
            p.Add("amount", amount);

            var result = await _db.QueryFirstAsync("GetQiwiAcoountCashOut", p, commandType: CommandType.StoredProcedure);

            return result;
        }






    }
}
