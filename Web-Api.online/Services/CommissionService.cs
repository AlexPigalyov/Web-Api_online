using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Services
{
    public class CommissionService
    {
        public decimal? TakeIncomeCommission(IncomeTransactionTableModel incomeTransaction, CurrencyTableModel currency)
        {
            if(currency.PercentCommissionForIncomeTransaction != null)
            {
                return incomeTransaction.Amount * currency.PercentCommissionForIncomeTransaction;
            }
            else
            {
                return null;
            }
        }
    }
}
