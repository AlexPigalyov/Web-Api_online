using System;
using System.Security.Cryptography;
using System.Text;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Hash
{
    public static class GenerateHash
    {
        private static SHA256CryptoServiceProvider algorithm;
        private static string salt;
        static GenerateHash()
        {
            algorithm = new SHA256CryptoServiceProvider();
            salt = "qweg547SGxzckgfiBCXwqrszxcs12qwadfd";
        }

        public static TransferTableModel ComputeHash(TransferTableModel transfer)
        {
            byte[] inputBytes = Encoding.UTF8.GetBytes($"{transfer.CurrencyAcronim} " +
                $"{transfer.WalletFromId} " +
                $"{transfer.WalletToId} " +
                $"{transfer.CurrencyAcronim} " +
                $"{transfer.Value} " +
                $"{transfer.Date} " +
                $"{transfer.Comment} " +
                $"{salt}");

            byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            var sBuilder = new StringBuilder();
            for (int i = 0; i < hashedBytes.Length; i++)
            {
                sBuilder.Append(hashedBytes[i].ToString("x2"));
            }
            transfer.Hash = sBuilder.ToString();

            return transfer;
        }
    }
}
