using Microsoft.AspNetCore.Mvc;

namespace Web_Api.online.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        public IActionResult Test()
        {
            return Ok("1234567890123");
        }
    }
}
