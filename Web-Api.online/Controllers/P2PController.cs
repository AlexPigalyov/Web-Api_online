using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
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
    public async Task<IActionResult> Index(string cryptName = "USDT", string isBuy = "buy", int page = 1)
    {
        var crypt = await _p2PRepository.GetCryptByName(cryptName);
        var crypts = await _p2PRepository.GetCrypts();

        var isBuyers = isBuy.Trim().ToLower() == "buy";
        
        var p2pUsers = await _p2PRepository.GetP2PUsersByCryptId(isBuyers, crypt.Id, crypt.Name, page);
            
        var model = new P2PViewModel()
        {
            Crypts = crypts,
            P2PSellers = p2pUsers
        };
        
        return View(model);
    }
}