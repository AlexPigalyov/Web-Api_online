using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Web_Api.online.Controllers
{
    public class StatsController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
