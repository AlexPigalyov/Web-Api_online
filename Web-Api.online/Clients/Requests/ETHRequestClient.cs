﻿using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Web_Api.online.Models.Response;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Clients.Requests
{
    public class ETHRequestClient
    {
        private string _url;
        private readonly IConfiguration _configuration;

        public ETHRequestClient(IConfiguration configuration)
        {
            _configuration = configuration;
            _url = _configuration["ETH_DaemonUrl"];
        }

        public async Task<string> GetNewAddressAsync(string label)
        {
            try
            {
                string url = $"{_url}ETH/GetNewAddress?label=" + label;

                using (var httpClientHandler = new HttpClientHandler())
                {
                    using (var httpClient = new HttpClient(httpClientHandler))
                    {
                        var result = await httpClient.GetAsync(url);
                        var resultString = await result.Content.ReadAsStringAsync();
                        return resultString;
                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public async Task<List<IncomeTransactionTableModel>> GetNewTransactions(string userId)
        {
            try
            {
                Dictionary<string, string> parametrs = new Dictionary<string, string>();
                parametrs.Add("userId", userId);
                return await ExecuteGetQueryAsync<List<IncomeTransactionTableModel>>($"{_url}ETH/GetNewTransactions", parametrs);
            }
            catch
            {
                return new List<IncomeTransactionTableModel>();
            }
        }

        public async Task<ExecuteTransactionResponse> ExecuteTransactionAsync(long transactionId)
        {
            try
            {
                Dictionary<string, string> parametrs = new Dictionary<string, string>();
                parametrs.Add("outcomeTransactionId", transactionId.ToString());
                return await ExecuteGetQueryAsync<ExecuteTransactionResponse>($"{_url}ETH/ExecuteTransaction", parametrs);
            }
            catch
            {
                return new ExecuteTransactionResponse() { IsSuccess = false };
            }
        }

        private async Task<T> ExecuteGetQueryAsync<T>(string url, Dictionary<string, string> parametrs)
        {
            using (var httpClientHandler = new HttpClientHandler())
            {
                //httpClientHandler.ServerCertificateCustomValidationCallback = (message, cert, chain, sslPolicyErrors) => true;
                using (var httpClient = new HttpClient(httpClientHandler))
                {
                    List<string> listParametrs = new List<string>();

                    foreach (var param in parametrs)
                    {
                        listParametrs.Add($"{param.Key}={param.Value}");
                    }

                    string requestUrl = $"{url}?{string.Join("&", listParametrs)}";

                    var result = await httpClient.GetAsync(requestUrl);
                    var jsonString = await result.Content.ReadAsStringAsync();
                    return JsonConvert.DeserializeObject<T>(jsonString);
                }
            }
        }
    }
}
