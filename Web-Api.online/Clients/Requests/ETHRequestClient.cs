using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Security;

namespace Web_Api.online.Clients.Requests
{
    public class ETHRequestClient
    {
        public string GetNewAddress(string lable)
        {
            using (var httpClientHandler = new HttpClientHandler())
            {
                httpClientHandler.ServerCertificateCustomValidationCallback = (message, cert, chain, sslPolicyErrors) => true;
                try
                {
                    using (var httpClient = new HttpClient(httpClientHandler))
                    {
                        var result = httpClient.GetAsync($"http://192.168.1.67:777/ETH/GetNewAddress?label={lable}").Result;

                        return  result.Content.ReadAsStringAsync().Result;
                    }
                }
                catch(Exception e)
                {
                    return null;
                }
                
            }
        }
        
        public void ExecuteTransaction(long transactionId)
        {
            using (var httpClientHandler = new HttpClientHandler())
            {
                httpClientHandler.ServerCertificateCustomValidationCallback = (message, cert, chain, sslPolicyErrors) => true;
                try
                {
                    using (var httpClient = new HttpClient(httpClientHandler))
                    {
                        var result = httpClient.GetAsync($"http://192.168.1.67:777/ETH/ExecuteTransaction?transactionId={transactionId}").Result;
                    }
                }
                catch (Exception e)
                {
                    return;
                }
            }
        }
    }
}
