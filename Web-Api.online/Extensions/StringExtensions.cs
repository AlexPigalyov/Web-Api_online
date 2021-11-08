using System;

namespace Web_Api.online.Extensions
{
    public static class StringExtensions
    {

        public static bool IsName(this string name)
        {

            return false;
        }

        public static bool IsWalletId(this string walletId)
        {

            return false;
        }

        public static decimal? ConvertToDecimal(this string number)
        {
            decimal num;
            try
            {
                number = number.Replace(".", ",");
                num = Convert.ToDecimal(number);
            }
            catch
            {
                try
                {
                    number = number.Replace(",", ".");
                    num = Convert.ToDecimal(number);
                }
                catch
                {
                    return null;
                }
            }
            return num;
        }
    }
}
