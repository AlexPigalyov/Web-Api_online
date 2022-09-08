namespace Web_Api.online.Extensions
{
    public static class DecimalExtensions
    {
        // Precision after comma in decimal
        private const int Precision = 2;

        /// <summary>
        /// Converts decimal like 10000,00000000 to 10000,00 or 10000 to 10000
        /// </summary>
        /// <param name="value"></param>
        /// <returns>Converted decimal to formatted string</returns>
        public static string ShowAsCurrency(this decimal value)
        {
            var stringValue = value.ToString();

            var commaIndex = stringValue.IndexOf(',');

            if (commaIndex < 0) return stringValue;

            return stringValue.Remove(commaIndex + 1 + Precision);
        }
    }
}
