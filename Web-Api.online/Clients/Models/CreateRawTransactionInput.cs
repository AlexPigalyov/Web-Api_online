using Newtonsoft.Json;

namespace Web_Api.online.Clients.Models
{
    public class CreateRawTransactionInput
    {
        [JsonProperty("txid")]
        public string TxId { get; set; }

        [JsonProperty("vout")]
        public int Vout { get; set; }
    }
}
