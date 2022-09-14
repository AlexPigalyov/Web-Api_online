namespace Web_Api.online.Clients.Models
{
    public class Vin
    {
        public string TxId { get; set; }
        public string Vout { get; set; }
        public ScriptSig ScriptSig { get; set; }
        public string CoinBase { get; set; }
        public string Sequence { get; set; }
    }
}
