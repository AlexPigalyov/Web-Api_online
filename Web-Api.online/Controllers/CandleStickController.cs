using Microsoft.AspNetCore.Mvc;

using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.ViewModels;

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
        public async Task<ActionResult> GetCandleStick(GetCandleStickModel model)
        {
            var candleStick = await _candleStickRepository.spGet_BTC_USDT_CandleSticks(model);

            var currentCandleStick = await _candleStickRepository.spGetCurrent_BTC_USDT_CandleStick();

            var resultModel = new CandleStickViewModel()
            {
                CurrentCandleStick = currentCandleStick,
                LastCandleSticks = candleStick
            };

            return Ok(resultModel);
        }
    }
}
