using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers
{
    public class MyController : Controller
    {
        private readonly IEventsRepository _eventsRepository;
        private readonly UsersInfoRepository _usersInfoRepository;
        private readonly UserManager<IdentityUser> _usersManager;
        private readonly WalletsRepository _walletsRepository;
        private readonly UserRepository _userRepository;
        public MyController(
            IEventsRepository eventsRepository,
            UsersInfoRepository usersInfoRepository,
            UserManager<IdentityUser> usersManager,
            WalletsRepository walletsRepository,
            UserRepository userRepository)
        {
            _eventsRepository = eventsRepository;
            _usersInfoRepository = usersInfoRepository;
            _usersManager = usersManager;
            _walletsRepository = walletsRepository;
            _userRepository = userRepository;
        }

        [HttpPost]
        public async Task<ActionResult> UpdateProfileData(ProfileViewModel model)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return Redirect("/Identity/Account/Login%2FMy%2FProfile");
            }

            model.UserInfo.UserId = userId;

            if (!string.IsNullOrEmpty(model.Username))
            {
                var normalizedUserName = model.Username.ToUpper();

                if (!await _usersManager.Users.AnyAsync(x => x.NormalizedUserName == normalizedUserName))
                {
                    await _usersManager.SetUserNameAsync(
                        await _usersManager.FindByIdAsync(userId),
                        model.Username);
                }
                else
                {
                    return BadRequest("A user with same username was found");
                }

            }

            await _usersInfoRepository.spCreateOrUpdateProfileUserInfo(model.UserInfo);

            return RedirectToAction("Profile");
        }

        [HttpGet]
        public async Task<IActionResult> Profile()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return Redirect("/Identity/Account/Login%2FMy%2FProfile");
            }

            UserInfoTableModel userInfo = (await _usersInfoRepository.GetUserInfo(userId)) ?? new UserInfoTableModel();
            List<EventTableModel> lastFiveEvents = await _eventsRepository.GetLastFiveEvents_ByUserId(userId);
            List<spGetNotEmptyValueWallet_ByUserIdResult> notEmptyWallets = await _walletsRepository.GetNotEmptyWalletsByUserIdAsync(userId);

            var user = await _usersManager.FindByIdAsync(userId);

            var userItem = await _userRepository.GetUser(userId);

            var model = new ProfileViewModel()
            {
                Email = user.Email,
                Username = user.UserName,
                PhoneNumber = user.PhoneNumber,
                UserInfo = userInfo,
                LastFiveEvents = lastFiveEvents,
                NotEmptyWallets = notEmptyWallets,
                IsMyProfile = true,
                UserNumber = userItem.Number.ToString()
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


        public async Task<IActionResult> MyRefferals(SortModel model)
        {
            int pageSize = 15;

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (string.IsNullOrEmpty(userId))
            {
                return Redirect("/Identity/Account/Login%2FMy%2FEvents");
            }

            var reffUsers = await _userRepository.GetUserRefferals_Paged(userId, model.Page, pageSize);

            var itemsCount = await _userRepository.GetCountOfRefferrersUser(userId);

            var user = await _userRepository.GetUser(userId);

            UserRefferalViewModel viewModel = new UserRefferalViewModel()
            {
                PageViewModel = new PageViewModel(itemsCount, model.Page, pageSize),
                MyRefferals = reffUsers ?? new List<UserRefferalTableModel>(),
                User = user
            };

            return View(viewModel);
        }

    }
}
