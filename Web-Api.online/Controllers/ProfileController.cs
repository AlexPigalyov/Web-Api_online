using Microsoft.AspNetCore.Mvc;

using System.Security.Claims;
using System.Threading.Tasks;

using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Controllers
{
    public class ProfileController : Controller
    {
        private readonly IEventsRepository _eventsRepository;

        public ProfileController(
            IEventsRepository eventsRepository)
        {
            _eventsRepository = eventsRepository;
        }

        public async Task<IActionResult> Events()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest("You are not authorized.");
            }

            return View(_eventsRepository.GetByUserId(userId));
        }
    }
}
