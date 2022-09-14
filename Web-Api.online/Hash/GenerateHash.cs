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

        public static string ComputeHash(string currency, int walletFromId, int walletToId,
            decimal value, DateTime date, string comment)
        {
            byte[] inputBytes = Encoding.UTF8.GetBytes($"{currency} " +
                $"{walletFromId} " +
                $"{walletToId} " +
                $"{currency} " +
                $"{value} " +
                $"{date} " +
                $"{comment} " +
                $"{salt}");

            byte[] hashedBytes = algorithm.ComputeHash(inputBytes);

            var sBuilder = new StringBuilder();
            for (int i = 0; i < hashedBytes.Length; i++)
            {
                sBuilder.Append(hashedBytes[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        public static string sha256(string inputString)
        {
            var crypt = new System.Security.Cryptography.SHA256Managed();
            var hash = new System.Text.StringBuilder();
            byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(inputString));
            foreach (byte theByte in crypto)
            {
                hash.Append(theByte.ToString("x2"));
            }
            return hash.ToString();
        }
    }
}
