using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers;

[Route("Users")]
public class UsersController : Controller
{
    private readonly IEventsRepository _eventsRepository;
    private readonly UsersInfoRepository _usersInfoRepository;
    private readonly UserManager<IdentityUser> _usersManager;
    private readonly WalletsRepository _walletsRepository;
    private readonly UserRepository _userRepository;

    public UsersController(IEventsRepository eventsRepository, UsersInfoRepository usersInfoRepository, UserManager<IdentityUser> usersManager, WalletsRepository walletsRepository, UserRepository userRepository)
    {
        _eventsRepository = eventsRepository;
        _usersInfoRepository = usersInfoRepository;
        _usersManager = usersManager;
        _walletsRepository = walletsRepository;
        _userRepository = userRepository;
    }

    [HttpGet]
    [Route("{username}")]
    public async Task<ActionResult> Profile(string username)
    {
        var user = await _usersManager.FindByNameAsync(username);

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (user != null)
        {
            UserInfoTableModel userInfo = (await _usersInfoRepository.GetUserInfo(user.Id)) ?? new UserInfoTableModel();
            List<EventTableModel> lastFiveEvents = await _eventsRepository.GetLastFiveEvents_ByUserId(user.Id);
            List<spGetNotEmptyValueWallet_ByUserIdResult> notEmptyWallets = await _walletsRepository.GetNotEmptyWalletsByUserIdAsync(user.Id);

            var model = new ProfileViewModel()
            {
                Email = user.Email,
                Username = user.UserName,
                PhoneNumber = user.PhoneNumber,
                UserInfo = userInfo,
                LastFiveEvents = lastFiveEvents,
                NotEmptyWallets = notEmptyWallets,
                IsMyProfile = userId == user.Id
            };

            return View("~/Views/Users/Profile.cshtml", model);
        }

        return View("~/Views/Users/UserNotExists.cshtml");
    }
}