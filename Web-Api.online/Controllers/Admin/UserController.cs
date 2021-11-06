using Microsoft.AspNetCore.Mvc;

using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Constants;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Route("/Admin/Users")]
    public class UserController : Controller
    {
        private readonly UserRepository _userRepository;
        public UserController(UserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index(int page = 1, string userNameExpression = "")
        {
            int pageSize = 15;

            if (User.IsInRole(RolesNameConstant.Admin))
            {
                if (!string.IsNullOrEmpty(userNameExpression))
                {
                    var users = await _userRepository.FindUsersByUsernameForAdminPanel(userNameExpression, page, pageSize);

                    UsersViewModel viewModel = new UsersViewModel()
                    {
                        PageViewModel = new PageViewModel(users.Count, page, pageSize),
                        Users = users
                    };

                    return View("Views/Admin/Users.cshtml", viewModel);
                }
                else
                {
                    var users = await _userRepository.GetUsersForAdminPanelAsync(page, pageSize);
                    var usersCount = await _userRepository.GetCountOfUsers();

                    UsersViewModel viewModel = new UsersViewModel()
                    {
                        PageViewModel = new PageViewModel(usersCount, page, pageSize),
                        Users = users
                    };

                    return View("Views/Admin/Users.cshtml", viewModel);
                }
            }
            else
            {
                return BadRequest("You're not admin");
            }

        }
    }
}
