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

        public static Transfer ComputeHash(Transfer transfer)
        {
            byte[] inputBytes = Encoding.UTF8.GetBytes($"{transfer.CurrensyAcronim} " +
                $"{transfer.WalletFromId} " +
                $"{transfer.WalletToId} " +
                $"{transfer.Value} " +
                $"{salt}");

            byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            transfer.Hash = BitConverter.ToString(hashedBytes);

            return transfer;
        }
    }
}
