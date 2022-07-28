using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;

namespace Web_Api.online.Controllers;

public class P2PController : Controller
{
    private readonly P2PRepository _p2PRepository;

    public P2PController(P2PRepository p2PRepository)
    {
        _p2PRepository = p2PRepository;
    }
    
    [Route("/{cryptName}/{id}")]
    public async Task<IActionResult> Index(string cryptName = "USDT", int page = 1)
    {
        var crypt = await _p2PRepository.GetCryptByName(cryptName);

        return View(_p2PRepository.GetP2PSellersByCryptId(crypt.Id, crypt.Name, page));
    }
}