using Microsoft.Extensions.Logging;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Threading.Tasks;
using System.Text;
using System.Collections.Generic;
using JsonProperty = System.Text.Json.JsonProperty;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Clients
{
    public class RpcResponseMessage
    {
        public object result { get; set; }
    }

    public class RpcResponseMessageListAddressGroupPings
    {
        public List<List<List<string>>> result { get; set; }
    }
    public class RpcResponseMessageTrnsaction
    {
        public Transaction result { get; set; }
    }

    public class ZhCashClient
    {
        public string Url { get; set; } = "http://20.67.106.9:5555";//дефолтное значение, чтобы контроллекры выводили на экран


        private HttpClient _httpclient;
        private string User = "1";
        private string Password = "1";


        public ZhCashClient(HttpClient httpclient)
        {
            _httpclient = httpclient;
            //Set Basic Auth
            var base64String = Convert.ToBase64String(Encoding.ASCII.GetBytes($"{User}:{Password}"));
            _httpclient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", base64String);
        }

        public List<Wallet> GetZhCashListAddressGroupPings()
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "listaddressgroupings" } };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);
                requestMessage.Content = new StringContent("{\"method\":\"listaddressgroupings\"}", Encoding.UTF8, "application/json");

                HttpResponseMessage response = _httpclient.SendAsync(requestMessage).Result;

                string apiResponse = response.Content.ReadAsStringAsync().Result;

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessageListAddressGroupPings result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessageListAddressGroupPings>(apiResponse);
                        return ZhCashListAddressGroupPingsConvertToList(result.result);
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }

        public RpcResponseMessage GetWalletInfo()
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "getwalletinfo" } };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);
                requestMessage.Content = new StringContent("{\"method\":\"getwalletinfo\"}", Encoding.UTF8, "application/json");

                HttpResponseMessage response = _httpclient.SendAsync(requestMessage).Result;

                string apiResponse = response.Content.ReadAsStringAsync().Result;

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessage result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessage>(apiResponse);

                        return result;
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }

        public RpcResponseMessage GetBalance()
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "getbalance" } };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);
                requestMessage.Content = new StringContent("{\"method\":\"getbalance\"}", Encoding.UTF8, "application/json");

                HttpResponseMessage response = _httpclient.SendAsync(requestMessage).Result;

                string apiResponse = response.Content.ReadAsStringAsync().Result;

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessage result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessage>(apiResponse);

                        return result;
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }

        public RpcResponseMessage GetNewAddress(string Label = null)
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "getnewaddress" } };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);
                if (Label == null)
                {
                    requestMessage.Content = new StringContent("{\"method\":\"getnewaddress\"}", Encoding.UTF8, "application/json");
                }
                else
                {
                    requestMessage.Content = new StringContent("{\"method\":\"getnewaddress\", \"params\":" + $"[\"{Label}\"]" + " }", Encoding.UTF8, "application/json");
                }

                HttpResponseMessage response = _httpclient.SendAsync(requestMessage).Result;

                string apiResponse = response.Content.ReadAsStringAsync().Result;

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessage result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessage>(apiResponse);

                        return result;
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }

        public RpcResponseMessage GetAddressInfo(string Address)
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "getaddressinfo" } };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);

                requestMessage.Content = new StringContent("{\"method\":\"getaddressinfo\",\"params\":" + $"[\"{Address}\"]" + " }", Encoding.UTF8, "application/json");

                HttpResponseMessage response = _httpclient.SendAsync(requestMessage).Result;

                string apiResponse = response.Content.ReadAsStringAsync().Result;

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessage result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessage>(apiResponse);

                        return result;
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }

        public async Task<RpcResponseMessage> SendToAddressAsync(string SenderAddress, string Address, double Coins)
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "sendtoaddress" },
                    { "content-type", "text/plain"} };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);
                // из отправленной суммы вычитается комисия за транзакцию
                // получатель получит меньше указанной суммы
                var str = $"[\"{Address}\", {Coins.ToString().Replace(",",".")}," +
                    $" \"transfer\", \"transfer\", true," +
                    $" null, null, \"\", \"{SenderAddress}\"," +
                    $" true" +
                    "]}";

                requestMessage.Content = new StringContent("{\"method\": \"sendtoaddress\", \"params\":" +
                    $" {str}",
                    Encoding.UTF8, "application/json");

                HttpResponseMessage response = await _httpclient.SendAsync(requestMessage);

                string apiResponse = await response.Content.ReadAsStringAsync();

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessage result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessage>(apiResponse);

                        return result;
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }

        public List<Wallet> ZhCashListAddressGroupPingsConvertToList(List<List<List<string>>> result)
        {
            List<Wallet> wallets = new List<Wallet>();
            foreach (var listFirst in result)
            {
                foreach (var listSecond in listFirst)
                {
                    try
                    {
                        wallets.Add(new Wallet()
                        {
                            Address = listSecond[0],
                            Amount = double.Parse(listSecond[1]),
                            Label = listSecond.Count == 2 ? null : listSecond[2]
                        });
                    }
                    catch
                    {
                        wallets.Add(new Wallet()
                        {
                            Address = listSecond[0],
                            Amount = double.Parse(listSecond[1].Replace(".", ",")), // на локалке
                            Label = listSecond.Count == 2 ? null : listSecond[2]
                        });
                    }
                }
            }

            return wallets;
        }

        public RpcResponseMessageTrnsaction GetTransaction(string TransactionId)
        {
            try
            {
                var parameters = new Dictionary<string, string> { { "method", "gettransaction" } };
                var encodedContent = new FormUrlEncodedContent(parameters);

                //var responseStream = await _httpclient.GetStreamAsync(url);

                HttpRequestMessage requestMessage = new HttpRequestMessage(HttpMethod.Post, Url);

                requestMessage.Content = new StringContent("{\"method\":\"gettransaction\",\"params\":" + $"[\"{TransactionId}\"]" + " }", Encoding.UTF8, "application/json");

                HttpResponseMessage response = _httpclient.SendAsync(requestMessage).Result;

                string apiResponse = response.Content.ReadAsStringAsync().Result;

                try
                {
                    if (apiResponse != "")
                    {
                        RpcResponseMessageTrnsaction result = Newtonsoft.Json.JsonConvert.DeserializeObject<RpcResponseMessageTrnsaction>(apiResponse);

                        return result;
                    }
                    else
                    { throw new Exception(); }
                }
                catch (Exception ex)
                {
                    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
                }
            }
            catch (Exception e)
            {
                //_logger.LogError(e, $"Something went wrong when calling WeatherStack.com");
                return null;
            }
        }
    }
}
