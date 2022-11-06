using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Data.Repositories;
using System.Security.Claims;
using System.Threading.Tasks;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers
{
    public class ErrorController : Controller
    {
        public ErrorController()
        {

        }

        [HttpGet]
        public async Task<IActionResult> PageNotExist()
        {
            
            return View();
        }
    }
}
