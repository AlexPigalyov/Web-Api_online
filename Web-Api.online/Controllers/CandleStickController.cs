using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers;

public class CandleStickController : Controller
{
    private readonly CandleStickRepository _candleStickRepository;
    private readonly PairsRepository _pairsRepository;

    public CandleStickController(
        CandleStickRepository candleStickRepository,
        PairsRepository pairsRepository)
    {
        _candleStickRepository = candleStickRepository;
        _pairsRepository = pairsRepository;
    }

    [HttpGet]
    public async Task<ActionResult> GetCandleStick(GetCandleStickModel model)
    {
        var pair = await _pairsRepository.GetPairByAcronimAsync(model.Acronim.ToUpper());

        if (pair == null) return BadRequest("wrong pair");
        
        if (!model.DateStart.HasValue)
        {
            model.DateStart = System.DateTime.Now.AddDays(-2);
        }

        var candleStick = await _candleStickRepository.GetCandleStick(model, pair.SQLTableName);

        var currentCandleStick = await _candleStickRepository.GetCurrentCandleStick(pair.SQLTableName);

        var resultModel = new CandleStickViewModel()
        {
            CurrentCandleStick = currentCandleStick,
            LastCandleSticks = candleStick
        };

        return Ok(resultModel);
    }
}