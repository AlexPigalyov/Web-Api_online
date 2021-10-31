using System.IO;
using System.Net;

namespace Web_Api.online.Requests
{
    public static class ETH
    {
        public static string Url { get; private set; } = "https://192.168.1.75:44345/ETH/";

        public static string GetNewAddress(string lable)
        {
            WebRequest req = WebRequest.Create($"{Url}GetNewAddress?label={lable}");
            WebResponse resp = req.GetResponse();
            Stream stream = resp.GetResponseStream();
            StreamReader sr = new StreamReader(stream);
            string result = sr.ReadToEnd();
            sr.Close();
            return result;
        }
    }
}
