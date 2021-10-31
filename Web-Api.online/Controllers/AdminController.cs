using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers
{
    public class AdminController : Controller
    {
        private readonly UserRepository _userRepository;
        public AdminController(UserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        public IActionResult Index()
        {
            return Redirect("/Admin/Users");
        }
    }
}
