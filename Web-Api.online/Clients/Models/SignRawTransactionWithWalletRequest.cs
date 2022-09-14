using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class SignRawTransactionWithWalletRequest
    {
        public SignRawTransactionWithWalletRequest(string rawTransactionHex, string sigHashType = "ALL")
        {
            RawTransactionHex = rawTransactionHex;
            Inputs = new List<SignRawTransactionWithWalletInput>();
            SigHashType = sigHashType;
        }

        public string RawTransactionHex { get; set; }
        public List<SignRawTransactionWithWalletInput> Inputs { get; set; }
        public string SigHashType { get; set; }

        public void AddInput(string txId, int vout, string scriptPubKey, string redeemScript)
        {
            Inputs.Add(new SignRawTransactionWithWalletInput
            {
                TxId = txId,
                Vout = vout,
                ScriptPubKey = scriptPubKey,
                RedeemScript = redeemScript
            });
        }

        public void AddInput(SignRawTransactionWithWalletInput input)
        {
            Inputs.Add(input);
        }
    }
}
