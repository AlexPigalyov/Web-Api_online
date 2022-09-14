using System;
using System.Globalization;

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

        //public static decimal? ConvertToDecimal(this string number)
        //{
        //    decimal num;
        //    try
        //    {
        //        number = number.Replace(".", ",");
        //        num = decimal.Parse(number);
        //    }
        //    catch
        //    {
        //        try
        //        {
        //            number = number.Replace(",", ".");
        //            num = decimal.Parse(number);
        //        }
        //        catch
        //        {
        //            return null;
        //        }
        //    }
        //    return num;
        //}

        public static decimal? ConvertToDecimal(this string number)
        {
            decimal result;

            if (!decimal.TryParse(number, NumberStyles.Any, CultureInfo.GetCultureInfo("ru-RU"), out result) &&
                // Then try in US english
                !decimal.TryParse(number, NumberStyles.Any, CultureInfo.GetCultureInfo("en-US"), out result) &&
                // Then in neutral language
                !decimal.TryParse(number, NumberStyles.Any, CultureInfo.InvariantCulture, out result))
            {
                result = 0;
            }
            return result;
        }
    }
}
