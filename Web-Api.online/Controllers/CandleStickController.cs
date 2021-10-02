using Microsoft.AspNetCore.Mvc;

using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;

namespace Web_Api.online.Controllers
{
    public class CandleStickController : Controller
    {
        private readonly CandleStickRepository _candleStickRepository;
        public CandleStickController(
            CandleStickRepository candleStickRepository)
        {
            _candleStickRepository = candleStickRepository;
        }
        [HttpGet]
        public async Task<ActionResult> GetCandleStick()
        {
            var candleStick = await _candleStickRepository.spGet_BTC_USDT_CandleStick();

            return Ok(candleStick);
        }
    }
}
