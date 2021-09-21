using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

using Web_Api.online.Models.MVCPages;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories;

namespace Web_Api.online.Controllers
{
    public class MyController : Controller
    {
        private readonly EventsRepository _eventsRepository;
        private readonly UsersInfoRepository _usersInfoRepository;
        private readonly UserManager<IdentityUser> _usersManager;
        public MyController(
            EventsRepository eventsRepository,
            UsersInfoRepository usersInfoRepository,
            UserManager<IdentityUser> usersManager)
        {
            _eventsRepository = eventsRepository;
            _usersInfoRepository = usersInfoRepository;
            _usersManager = usersManager;
        }

        public async Task<IActionResult> Profile()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            
            if (string.IsNullOrEmpty(userId))
            {
                return Redirect("/Identity/Account/Login%2FMy%2FProfile");
            }

            UsersInfo userInfo = (await _usersInfoRepository.spGetUserInfo_ByUserId(userId)) ?? new UsersInfo();
            List<Events> lastThreeEvents = await _eventsRepository.spGetLastThreeEvents_ByUserId(userId);
            var user = await _usersManager.FindByIdAsync(userId);

            var model = new ProfileModel()
            {
                Email = user.Email,
                PhoneNumber = user.PhoneNumber,
                UserInfo = userInfo,
                LastThreeEvents = lastThreeEvents
            };

            return View(model);
        }

        public async Task<IActionResult> Events()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return Redirect("/Identity/Account/Login%2FMy%2FEvents");
            }

            return View(await _eventsRepository.GetByUserId(userId));
        }
    }
}
