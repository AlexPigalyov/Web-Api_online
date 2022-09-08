using System.Text;

namespace Web_Api.online.Extensions
{
    public static class DecimalExtensions
    {
        // Precision after comma in decimal
        private const int Precision = 2;

        /// <summary>
        /// Converts decimal like 10000,123000 to 10000,123 or 10000,0000 to 10000,00
        /// </summary>
        /// <param name="value">decimal</param>
        /// <returns>Converted decimal to formatted string. If exception - returns this.ToString()</returns>
        public static string ShowAsCurrency(this decimal value)
        {
            try
            {
                var splitted = value.ToString().Split(',');

                if (splitted.Length == 0) return splitted[0];

                var sbAfterComma = new StringBuilder(splitted[1]);

                while (sbAfterComma.Length > Precision && sbAfterComma[^1] == '0')
                {
                    sbAfterComma = sbAfterComma.Remove(sbAfterComma.Length - 1, 1);
                }

                return string.Concat(splitted[0], ",", sbAfterComma);
            }
            catch
            {
                return value.ToString();
            }
        }
    }
}
