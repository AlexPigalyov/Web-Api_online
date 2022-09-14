using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class SignRawTransactionRequest
    {
        public SignRawTransactionRequest(string rawTransactionHex, string sigHashType = "ALL")
        {
            RawTransactionHex = rawTransactionHex;
            Inputs = new List<SignRawTransactionInput>();
            PrivateKeys = new List<string>();
            SigHashType = sigHashType;
        }

        public string RawTransactionHex { get; set; }
        public List<SignRawTransactionInput> Inputs { get; set; }
        public List<string> PrivateKeys { get; set; }
        public string SigHashType { get; set; }

        public void AddInput(string txId, int vout, string scriptPubKey, string redeemScript)
        {
            Inputs.Add(new SignRawTransactionInput
            {
                TxId = txId,
                Vout = vout,
                ScriptPubKey = scriptPubKey,
                RedeemScript = redeemScript
            });
        }

        public void AddInput(SignRawTransactionInput signRawTransactionInput)
        {
            Inputs.Add(signRawTransactionInput);
        }

        public void AddKey(string privateKey)
        {
            PrivateKeys.Add(privateKey);
        }
    }
}
