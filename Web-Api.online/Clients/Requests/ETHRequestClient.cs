using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Threading.Tasks;
using Web_Api.online.Models.Response;

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

                        return result.Content.ReadAsStringAsync().Result;
                    }
                }
                catch (Exception e)
                {
                    return null;
                }

            }
        }

        public async Task<ExecuteTransactionResponse> ExecuteTransactionAsync(long transactionId)
        {
            using (var httpClientHandler = new HttpClientHandler())
            {
                httpClientHandler.ServerCertificateCustomValidationCallback = (message, cert, chain, sslPolicyErrors) => true;
                try
                {
                    using (var httpClient = new HttpClient(httpClientHandler))
                    {

                        var result = await httpClient.GetAsync($"http://192.168.1.67:777/ETH/ExecuteTransaction?transactionId={transactionId}");
                        var jsonString = await result.Content.ReadAsStringAsync();
                        return JsonConvert.DeserializeObject<ExecuteTransactionResponse>(jsonString);
                    }
                }
                catch (Exception e)
                {
                    return new ExecuteTransactionResponse() { IsSuccess = false };
                }
            }
        }
    }
}
