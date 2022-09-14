using Newtonsoft.Json;

namespace Web_Api.online.Clients.Models
{
    public class SignRawTransactionWithKeyInput
    {
        [JsonProperty(PropertyName = "txid", Order = 0)]
        public string TxId { get; set; }

        [JsonProperty(PropertyName = "vout", Order = 1)]
        public int Vout { get; set; }

        [JsonProperty(PropertyName = "scriptPubKey", Order = 2)]
        public string ScriptPubKey { get; set; }

        [JsonProperty(PropertyName = "redeemScript", Order = 3)]
        public string RedeemScript { get; set; }
    }
}
