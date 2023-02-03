using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Mobile;


[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[Route("[controller]/[action]")]
public class MobileMyController : Controller
{
    private readonly IEventsRepository _eventsRepository;
    private readonly UsersInfoRepository _usersInfoRepository;
    private readonly UserManager<IdentityUser> _usersManager;
    private readonly WalletsRepository _walletsRepository;
    private readonly UserRepository _userRepository;

    public MobileMyController(
        IEventsRepository eventsRepository, UsersInfoRepository usersInfoRepository, 
        UserManager<IdentityUser> usersManager, WalletsRepository walletsRepository,
        UserRepository userRepository)
    {
        _eventsRepository = eventsRepository;
        _usersInfoRepository = usersInfoRepository;
        _usersManager = usersManager;
        _walletsRepository = walletsRepository;
        _userRepository = userRepository;
    }

    [HttpGet]
    public async Task<ActionResult> Profile()
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("User not authorized");
        }

        UserInfoTableModel userInfo = (await _usersInfoRepository.GetUserInfo(userId)) ?? new UserInfoTableModel();
        List<EventTableModel> lastFiveEvents = await _eventsRepository.GetLastFiveEvents_ByUserId(userId);
        List<spGetNotEmptyValueWallet_ByUserIdResult> notEmptyWallets =
            await _walletsRepository.GetNotEmptyWalletsByUserIdAsync(userId);

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

        return Ok(model);
    }
    
    [HttpPost]
    public async Task<ActionResult> UpdateProfileData([FromBody]ProfileViewModel model)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("User not authorized");
        }

        model.UserInfo.UserId = userId;

        if (!string.IsNullOrEmpty(model.Username))
        {
            var normalizedUserName = model.Username.ToUpper();

            if (!await _usersManager.Users.AnyAsync(x => x.NormalizedUserName == normalizedUserName))
            {
                await _usersManager.SetUserNameAsync(
                    (await _usersManager.FindByIdAsync(userId))!,
                    model.Username);
            }
            // why? causes update profile error
            //else
            //{
            //    return BadRequest("A user with same username was found");
            //}
        }

        await _usersInfoRepository.spCreateOrUpdateProfileUserInfo(model.UserInfo);

        return Ok();
    }
}