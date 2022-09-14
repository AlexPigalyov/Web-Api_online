using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;
using Web_Api.online.Models;
using Web_Api.online.Data.Repositories.Abstract;

namespace Web_Api.online.Controllers
{
    class IndexPageModel
    {
        public List<PairsTableModel> TopMarkets1hChange { get; set; }
    }

    public class HomeController : Controller
    {
        private readonly PairsRepository _pairsRepository;
        private readonly ILogger<HomeController> _logger;
        private readonly INewsRepository _newsRepository;



        public HomeController(ILogger<HomeController> logger, PairsRepository pairsRepository, INewsRepository newsRepository)
        {
            _pairsRepository = pairsRepository;
            _logger = logger;
            _newsRepository = newsRepository;
        }

        public async Task<ActionResult> Index()
        {
            IndexPageModel model = new IndexPageModel();

            model.TopMarkets1hChange = await _pairsRepository.GetTopMarketsAsync();

            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public async Task<ActionResult> News()
        {
            NewsPageModel model = new NewsPageModel();

            model.NewsList = await _newsRepository.GetNews();

            return View(model);
        }
    }
}
