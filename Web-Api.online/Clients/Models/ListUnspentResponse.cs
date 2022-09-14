namespace Web_Api.online.Clients.Models
{
    public class ListUnspentResponse
    {
        public string TxId { get; set; }
        public int Vout { get; set; }
        public string Address { get; set; }
        public string Account { get; set; }
        public string Label { get; set; }
        public string ScriptPubKey { get; set; }
        public decimal Amount { get; set; }
        public int Confirmations { get; set; }
        public bool Spendable { get; set; }

        public override string ToString()
        {
            // The Account field/concept is deprecated and will be removed in v0.18, cf.:
            // https://bitcoincore.org/en/releases/0.17.0/#label-and-account-apis-for-wallet
            if (!(Account is null))
            {
                return $"Account: {Account}, Address: {Address}, Amount: {Amount}, Confirmations: {Confirmations}";
            }
            return $"Label: {Label}, Address: {Address}, Amount: {Amount}, Confirmations: {Confirmations}";
        }
    }
}
