using System;

namespace Web_Api.online.Extensions
{
    public static class StringExtensions
    {
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
