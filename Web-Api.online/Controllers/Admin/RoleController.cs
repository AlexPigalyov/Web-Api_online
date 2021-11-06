using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

using System.Threading.Tasks;

using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Route("/Admin/Roles")]
    public class RoleController : Controller
    {
        RoleManager<IdentityRole> _roleManager;
        RoleRepository _roleRepository;

        public RoleController(
            RoleManager<IdentityRole> roleManager,
            RoleRepository roleRepository)
        {
            _roleManager = roleManager;
            _roleRepository = roleRepository;
        }

        public async Task<IActionResult> Index(int page = 1)
        {
            int pageSize = 15;

            var roles = await _roleRepository.GetRolesForAdminPanelAsync(page, pageSize);

            RolesViewModel viewModel = new RolesViewModel()
            {
                PageViewModel = new PageViewModel(roles.Count, page, pageSize),
                Roles = roles
            };

            return View("/Admin/Roles",viewModel);
        }
    }
}
