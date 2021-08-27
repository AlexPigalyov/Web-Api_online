using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Newtonsoft.Json;
using System.Linq;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories;
using Web_Api.online.Models.Enums;

namespace Web_Api.online.Hubs
{
    public class btcusdtHub : Hub
    {
        private readonly TradeRepository _tradeRepository;

        public btcusdtHub(
            TradeRepository tradeRepository) : base()
        {
            _tradeRepository = tradeRepository;
        }
    }
}
