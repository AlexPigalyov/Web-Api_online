using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;

namespace Web_Api.online.Services
{
    public class CandleStickService
    {
        private readonly CandleStickRepository _candleStickRepository;

        public CandleStickService(CandleStickRepository candleStickRepository)
        {
            _candleStickRepository = candleStickRepository;
        }

        public async Task CreateCandleStick(string pairName)
        {
            var lastCandleStick = await _candleStickRepository.GetLastCandleStick(pairName);
            
            var lastOrders = await _candleStickRepository.GetLastOrdersBySeconds(pairName, "60");
                
            if (lastOrders.Count > 0)
            {
                var firstOrder = lastOrders.FirstOrDefault();
                var lastOrder = lastOrders.LastOrDefault();
                
                if(lastCandleStick == null)
                {
                    await _candleStickRepository.CreateCandleStick(pairName, new Models.Tables.CandleStickTableModel()
                    {
                        Open = firstOrder.ExposedPrice,
                        OpenTime = firstOrder.ClosedDate,
                        High = lastOrders.Max(x => x.ExposedPrice),
                        Low = lastOrders.Min(x => x.ExposedPrice),
                        Close = lastOrder.ExposedPrice,
                        CloseTime = lastOrder.ClosedDate
                    });
                }
                else
                {
                    await _candleStickRepository.CreateCandleStick(pairName, new Models.Tables.CandleStickTableModel()
                    {
                        Open = lastCandleStick.Close,
                        OpenTime = lastCandleStick.CloseTime,
                        High = lastOrders.Max(x => x.ExposedPrice),
                        Low = lastOrders.Min(x => x.ExposedPrice),
                        Close = lastOrder.ExposedPrice,
                        CloseTime = lastOrder.ClosedDate
                    });
                }    
            }
        }
    }
}
