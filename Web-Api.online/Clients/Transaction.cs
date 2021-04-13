using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web_Api.online.Clients
{
    public class Transaction
    {
        public double Amount { get; set; }
        public double Fee { get; set; }
        public int Confirmation { get; set; }// количество подтверждений >= 6 рекомендуется
        public string Blockhash { get; set; }
        public int Blockindex { get; set; }
        public int Blocktime { get; set; }
        public string Txid { get; set; }
        public int Time { get; set; }
        public int TimeReceived { get; set; }
        public string Bip125 { get; set; }

        Details details = new Details();

        public string Hex { get; set; }
    }

    public class Details
    {
        public string Account { get; set; }
        public string Address { get; set; }
        public string Category { get; set; }
        public double Amount { get; set; }
        public string Label { get; set; }
        public int Vout { get; set; }
        public double Fee { get; set; }
        public bool Abandoned { get; set; }
    }
}
