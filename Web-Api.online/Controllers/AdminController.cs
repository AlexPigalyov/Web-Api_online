using Microsoft.AspNetCore.Mvc;

namespace Web_Api.online.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
