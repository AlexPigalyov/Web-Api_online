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
            var currency = await _walletsRepository.GetCurrencyByAcronimAsync(incomeTransaction.CurrencyAcronim);

            var balanceProviderModel = new BalanceProviderModel();
            balanceProviderModel.PercentCommission = currency.PercentCommissionForIncomeTransaction;
            balanceProviderModel.StartBalanceReceiver = walletTableModel.Value;

            if (currency.PercentCommissionForIncomeTransaction != null)
            {
                balanceProviderModel.Commission = incomeTransaction.Amount * currency.PercentCommissionForIncomeTransaction.Value;

                balanceProviderModel.ResultBalanceReceiver = walletTableModel.Value + (incomeTransaction.Amount - balanceProviderModel.Commission.Value);

            }
            else
            {
                balanceProviderModel.ResultBalanceReceiver = walletTableModel.Value + incomeTransaction.Amount;
            }

            return balanceProviderModel;
        }

        public async Task<BalanceProviderModel> Send(decimal value, WalletTableModel walletSender, WalletTableModel walletReceiver)
        {
            var currency = await _walletsRepository.GetCurrencyByAcronimAsync(walletSender.CurrencyAcronim);


            BalanceProviderModel balanceProviderModel = new();
            balanceProviderModel.PercentCommission = currency.PercentCommissionForTransfer;
            balanceProviderModel.StartBalanceSender = walletSender.Value;
            balanceProviderModel.StartBalanceReceiver = walletReceiver.Value;

            if (currency.PercentCommissionForTransfer != null)
            {
                balanceProviderModel.Commission = value * currency.PercentCommissionForTransfer.Value;

                balanceProviderModel.ResultBalanceSender = walletSender.Value - value;
                balanceProviderModel.ResultBalanceReceiver = walletReceiver.Value + (value - balanceProviderModel.Commission.Value);
            }
            else
            {
                balanceProviderModel.ResultBalanceSender = walletSender.Value - value;
                balanceProviderModel.ResultBalanceReceiver = walletReceiver.Value + value;
            }

            return balanceProviderModel;
        }
        
        public async Task<BalanceProviderModel> Withdraw(decimal value, WalletTableModel wallet)
        {
            var currency = await _walletsRepository.GetCurrencyByAcronimAsync(wallet.CurrencyAcronim);


            BalanceProviderModel balanceProviderModel = new();
            balanceProviderModel.PercentCommission = currency.PercentCommissionForOutcomeTransaction;
            balanceProviderModel.StartBalanceSender = wallet.Value;

            if (currency.PercentCommissionForOutcomeTransaction != null)
            {
                balanceProviderModel.Commission = value * currency.PercentCommissionForOutcomeTransaction.Value;

            }
            balanceProviderModel.ResultBalanceSender = wallet.Value - value;

            return balanceProviderModel;
        }
    }
}
