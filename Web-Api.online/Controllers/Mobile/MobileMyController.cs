using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Models;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;
using Web_Api.online.Models.ViewModels;
using Web_Api.online.Models.ViewModels.Profile;

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
    private readonly PairsRepository _pairsRepository;
    private readonly TradeRepository _tradeRepository;
    private readonly TransactionsRepository _transactionsRepository;
    public MobileMyController(
        IEventsRepository eventsRepository, UsersInfoRepository usersInfoRepository, 
        UserManager<IdentityUser> usersManager, WalletsRepository walletsRepository,
        UserRepository userRepository, PairsRepository pairsRepository, 
        TradeRepository tradeRepository, TransactionsRepository transactionsRepository)
    {
        _eventsRepository = eventsRepository;
        _usersInfoRepository = usersInfoRepository;
        _usersManager = usersManager;
        _walletsRepository = walletsRepository;
        _userRepository = userRepository;
        _pairsRepository = pairsRepository;
        _tradeRepository = tradeRepository;
        _transactionsRepository = transactionsRepository;
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
    
    [HttpGet]
    public async Task<ActionResult> OpenOrders()
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (!string.IsNullOrEmpty(userId))
        {
            var pairs = await _pairsRepository.GetAllPairsAsync();
            
            List<spGetOpenOrdersByUser> list = await _tradeRepository.spGet_OpenOrders_ByUser(userId);

            list.ForEach(p =>
            {
                var ppair = pairs.First(x => x.Acronim == p.Pair);

                p.Currency1 = ppair.Currency1;
                p.Currency2 = ppair.Currency2;
                p.Pair = p.Currency1 + " " + p.Currency2;
            });

            return Ok(list);
        }

        return BadRequest("User not authorized");
    }
    
    public async Task<ActionResult> ClosedOrders()
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (!string.IsNullOrEmpty(userId))
        {
            var pairs = await _pairsRepository.GetAllPairsAsync();

            List<ClosedOrderTableModel> closedOrders = new List<ClosedOrderTableModel>();

            foreach (var pair in pairs)
            {
                List<ClosedOrderTableModel> pairClosedOrders = await _tradeRepository.spGetClosedOrders_ByCreateUserIdWithOrderByDescClosedDate(userId, pair.SQLTableName);

                pairClosedOrders.ForEach(p =>
                {
                    p.Currency1 = pair.Currency1;
                    p.Currency2 = pair.Currency2;
                    p.PairAcronim = pair.Currency1 + " " + pair.Currency2;
                });

                closedOrders.AddRange(pairClosedOrders);
            }

            return Ok(closedOrders.OrderByDescending(x => x.ClosedDate));
        }

        return BadRequest("User not authorized");
    }
    
    public async Task<ActionResult> CancelOrder(long id, string acronim)
    {
        var pair = await _pairsRepository.GetPairByAcronimAsync(acronim);

        if (pair == null) return BadRequest("Wrong pair");

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("You are not authorized.");
        }

        var order = await _tradeRepository.GetOpenOrderById(pair.Currency1, pair.Currency2, id);

        if (order == null)
        {
            return BadRequest("Order with this id doesn't exist.");
        }

        if (order.CreateUserId != userId)
        {
            return BadRequest("This is not your order.");
        }

        await _tradeRepository.MoveFromOpenToClosedOrders(order, userId,
            ClosedOrderStatusEnum.Canceled, pair.SQLTableName);

        var wallet = await _walletsRepository
            .GetUserWalletAsync(userId, order.IsBuy ? pair.Currency2 : pair.Currency1);

        await _walletsRepository
            .UpdateUserWalletBalanceAsync(wallet.Id, order.IsBuy ? order.Total : order.Amount);

        await _eventsRepository.CreateEventAsync(new EventTableModel()
        {
            UserId = userId,
            Type = (int)EventTypeEnum.CancelOrder,
            Comment = "Total: " + order.Total.ToString("G29") + " " + acronim,
            WhenDate = DateTime.Now,
            CurrencyAcronim = acronim
        });

        return Ok();
    }
    
    public async Task<IActionResult> Incomes(SortModel model)
    {
        int pageSize = 15;

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("User not authorized");
        }

        var userIncomes = await _transactionsRepository.GetPagedIncomeTransactionsByUserId(userId, model.Page, pageSize);

        MyIncomeTransactionsViewModel viewModel = new MyIncomeTransactionsViewModel()
        {
            PageViewModel = new PageViewModel(userIncomes.Count, model.Page, pageSize),

            IncomeTransactions = userIncomes
        };

        return Ok(viewModel);
    }
    
    public async Task<IActionResult> Events()
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("User not authorized");
        }

        return Ok(await _eventsRepository.GetByUserId(userId));
    }
    
    public async Task<IActionResult> MyRefferals(SortModel model)
    {
        int pageSize = 100;

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (string.IsNullOrEmpty(userId))
        {
            return BadRequest("User not authorized");
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

        return Ok(viewModel);
    }
}