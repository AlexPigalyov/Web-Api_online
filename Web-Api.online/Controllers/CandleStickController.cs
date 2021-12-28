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

        public CandleStickController(CandleStickRepository candleStickRepository)
        {
            _candleStickRepository = candleStickRepository;
        }

        [HttpGet]
        public async Task<ActionResult> GetCandleStick(GetCandleStickModel model)
        {
            if (!model.DateStart.HasValue)
            {
                model.DateStart = System.DateTime.Now.AddDays(-2);
            }

            var candleStick = await _candleStickRepository.Get_BTC_USDT_CandleSticks(model);

            var currentCandleStick = await _candleStickRepository.GetCurrent_BTC_USDT_CandleStick();

            var resultModel = new CandleStickViewModel()
            {
                CurrentCandleStick = currentCandleStick,
                LastCandleSticks = candleStick
            };

            return Ok(resultModel);
        }
    }
}
