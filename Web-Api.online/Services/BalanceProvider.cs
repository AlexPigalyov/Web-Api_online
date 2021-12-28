using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Services
{
    public class BalanceProvider
    {
        private WalletsRepository _walletsRepository;

        public BalanceProvider(WalletsRepository walletsRepository)
        {
            _walletsRepository = walletsRepository;
        }


        public async Task<BalanceProviderModel> Income(WalletTableModel walletTableModel,
            IncomeTransactionTableModel incomeTransaction)
        {
            var currencyTableModel = await _walletsRepository.GetCurrencyByAcronimAsync(incomeTransaction.CurrencyAcronim);

            var balanceProviderModel = new BalanceProviderModel();
            balanceProviderModel.PercentCommission = currencyTableModel.PercentCommissionForIncomeTransaction;
            balanceProviderModel.StartBalance = walletTableModel.Value;

            if (currencyTableModel.PercentCommissionForIncomeTransaction != null)
            {
                balanceProviderModel.Commission = incomeTransaction.Amount * currencyTableModel.PercentCommissionForIncomeTransaction.Value;
            }
            else
            {
                balanceProviderModel.ResultBalance = walletTableModel.Value + incomeTransaction.Amount;
            }

            return balanceProviderModel;
        }
    }
}
