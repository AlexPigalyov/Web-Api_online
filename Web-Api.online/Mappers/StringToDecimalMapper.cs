using System;

namespace Web_Api.online.Mappers
{
    public static class StringToDecimalMapper
    {
        public static decimal ParseToDecimal(this string str)
        {
            return decimal
                .Parse(string.Join(
                    string.Empty,
                    str.Split(default(string[]),
                    StringSplitOptions.RemoveEmptyEntries))
                .Replace(',', '.'), CultureInfo.InvariantCulture);
        }
    }
}
