using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
    public class SignRawTransactionWithKeyRequest
    {
        public SignRawTransactionWithKeyRequest(string rawTransactionHex, string sigHashType = "ALL")
        {
            RawTransactionHex = rawTransactionHex;
            PrivateKeys = new List<string>();
            Inputs = new List<SignRawTransactionWithKeyInput>();
            SigHashType = sigHashType;
        }

        public string RawTransactionHex { get; set; }
        public List<string> PrivateKeys { get; set; }
        public List<SignRawTransactionWithKeyInput> Inputs { get; set; }
        public string SigHashType { get; set; }

        public void AddKey(string privateKey)
        {
            PrivateKeys.Add(privateKey);
        }

        public void AddInput(string txId, int vout, string scriptPubKey, string redeemScript)
        {
            Inputs.Add(new SignRawTransactionWithKeyInput
            {
                TxId = txId,
                Vout = vout,
                ScriptPubKey = scriptPubKey,
                RedeemScript = redeemScript
            });
        }

        public void AddInput(SignRawTransactionWithKeyInput input)
        {
            Inputs.Add(input);
        }
    }
}
