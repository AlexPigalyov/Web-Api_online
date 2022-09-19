namespace Web_Api.online.Services
{
    using QRCoder;

    public static class QrCodeService
    {
        /// <summary>
        /// Generating QR code with 2 pixels per squire from input string
        /// </summary>
        /// <param name="input">Input string</param>
        /// <returns>Bitmap QR Code</returns>
        public static byte[] GenerateQrCode(string input)
        {
            try
            {
                using var qrGenerator = new QRCodeGenerator();

                using QRCodeData qrCodeData = qrGenerator.CreateQrCode(input, QRCodeGenerator.ECCLevel.Q);

                using var qrCode = new BitmapByteQRCode(qrCodeData);

                return qrCode.GetGraphic(2);
            }
            catch 
            {
                return null;
            }
        }

        /// <summary>
        /// Generating sized QR code from input string
        /// </summary>
        /// <param name="input">Input string</param>
        /// <param name="squareSize">White and black squares size in pixels</param>
        /// <returns>Bitmap QR Code</returns>
        public static byte[] GenerateQrCode(string input, int squareSize)
        {
            try
            {
                using var qrGenerator = new QRCodeGenerator();

                using QRCodeData qrCodeData = qrGenerator.CreateQrCode(input, QRCodeGenerator.ECCLevel.Q);

                using var qrCode = new BitmapByteQRCode(qrCodeData);

                return qrCode.GetGraphic(squareSize);
            }
            catch
            {
                return null;
            }
        }
    }
}
