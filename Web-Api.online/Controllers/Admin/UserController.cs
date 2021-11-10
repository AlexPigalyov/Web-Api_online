using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
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
        public async Task<IActionResult> Index(SortModel model)
        {
            int pageSize = 15;

            if (!string.IsNullOrEmpty(model.SearchString))
            {
                var users = await _userRepository.FindPagedUsersByUsername(model.SearchString, model.Page,
                    pageSize);

                UsersViewModel viewModel = new UsersViewModel()
                {
                    PageViewModel = new PageViewModel(users.Count, model.Page, pageSize),
                    Users = users
                };

                return View("Views/Admin/Users.cshtml", viewModel);
            }
            else if (!string.IsNullOrEmpty(model.ColumnName))
            {
                //NOT COMPLETED
                return null;
            }
            else
            {
                var users = await _userRepository.GetPagedUsers(model.Page, pageSize);
                var usersCount = await _userRepository.GetCountOfUsers();

                UsersViewModel viewModel = new UsersViewModel()
                {
                    PageViewModel = new PageViewModel(usersCount, model.Page, pageSize),
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