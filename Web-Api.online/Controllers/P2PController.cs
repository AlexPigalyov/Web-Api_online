using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers;

public class P2PController : Controller
{
    private readonly P2PRepository _p2PRepository;

    public P2PController(P2PRepository p2PRepository)
    {
        _p2PRepository = p2PRepository;
    }
    
    [Route("p2p/{isBuy}/{cryptName}/{id}")]
    [HttpGet]
    public async Task<IActionResult> Index(string cryptName = "USDT", string isBuy = "buy", int page = 1)
    {
        var crypt = await _p2PRepository.GetCryptByName(cryptName);
        var crypts = await _p2PRepository.GetCrypts();

        var isBuyers = isBuy.Trim().ToLower() == "buy";
        
        var p2pUsers = await _p2PRepository.GetP2PUsersByCryptId(isBuyers, crypt.Id, crypt.Name, page);
        var fiats = await _p2PRepository.GetFiats();
        var payments = await _p2PRepository.GetPayments();
        var timeFrames = await _p2PRepository.GetP2PTimeFrames();
        
        var model = new P2PViewModel()
        {
            IsBuy = isBuyers,
            Payments = payments,
            Fiats = fiats,
            Crypts = crypts,
            P2PUsers = p2pUsers,
            TimeFrames = timeFrames 
        };
        
        return View(model);
    }
    
    [Route("p2p/create-p2p-add")]
    [HttpPost]
    public async Task<IActionResult> CreateP2PAd([FromBody]P2PAddRequestModel model)
    {
        var cryptId = (await _p2PRepository.GetCryptByName(model.Crypt)).Id;
        List<int> paymentIds = new List<int>();

        foreach (var paymentName in model.Payments)
        {
            paymentIds.Add((await _p2PRepository.GetPaymentByName(paymentName)).Id);
        }
        
        var fiatId = (await _p2PRepository.GetFiatByName(model.Fiat)).Id;
        var timeFrameId = (await _p2PRepository.GetTimeFrameByViewName(model.TimeFrame)).Id;
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("You are not authorized.");
        }

        await _p2PRepository.CreateP2PUser(model.IsBuy, userId, model.Price, fiatId, model.LimitFrom, model.LimitTo,
            model.TotalAmount, paymentIds, cryptId, timeFrameId);

        return Ok();
    }
}