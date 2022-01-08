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
            balanceProviderModel.StartBalanceSender = walletTableModel.Value;

            if (currency.PercentCommissionForIncomeTransaction != null)
            {
                balanceProviderModel.Commission = incomeTransaction.Amount * currency.PercentCommissionForIncomeTransaction.Value;

                balanceProviderModel.ResultBalanceSender = walletTableModel.Value + (incomeTransaction.Amount - balanceProviderModel.Commission.Value);

            }
            else
            {
                balanceProviderModel.ResultBalanceSender = walletTableModel.Value + incomeTransaction.Amount;
            }

            return balanceProviderModel;
        }

        public async Task<BalanceProviderModel> Send(TransferTableModel transfer, WalletTableModel walletSender, WalletTableModel walletReceiver)
        {
            var currency = await _walletsRepository.GetCurrencyByAcronimAsync(transfer.CurrencyAcronim);


            BalanceProviderModel balanceProviderModel = new();
            balanceProviderModel.PercentCommission = currency.PercentCommissionForTransfer;
            balanceProviderModel.StartBalanceSender = walletSender.Value;
            balanceProviderModel.StartBalanceReceiver = walletReceiver.Value;

            if (currency.PercentCommissionForTransfer != null)
            {
                balanceProviderModel.Commission = transfer.Value * currency.PercentCommissionForTransfer.Value;

                balanceProviderModel.ResultBalanceSender = walletSender.Value - transfer.Value;
                balanceProviderModel.ResultBalanceReceiver = walletReceiver.Value + (transfer.Value - balanceProviderModel.Commission.Value);
            }
            else
            {
                balanceProviderModel.ResultBalanceSender = walletSender.Value - transfer.Value;
                balanceProviderModel.ResultBalanceReceiver = walletReceiver.Value + transfer.Value;
            }

            return balanceProviderModel;
        }
    }
}
