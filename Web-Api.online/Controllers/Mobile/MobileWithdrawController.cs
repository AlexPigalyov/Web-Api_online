﻿using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Clients;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.WithdrawModels;
using Web_Api.online.Services;

namespace Web_Api.online.Controllers.Mobile;

[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
[Route("[controller]/[action]")]
public class MobileWithdrawController : Controller
{
    private WalletsRepository _walletsRepository;
    private WithdrawService _withdrawService;
    private ZCashService _zecService;
    private EtheriumService _etheriumService;

    public MobileWithdrawController(WalletsRepository walletsRepository,
        WithdrawService withdrawService, ZCashService zecService,
        EtheriumService etheriumService)
    {
        _walletsRepository = walletsRepository;
        _withdrawService = withdrawService;
        _zecService = zecService;
        _etheriumService = etheriumService;
    }

    [HttpGet]
    public async Task<IActionResult> Index(string currency)
    {
        var _currency = await _walletsRepository.GetCurrencyByAcronimAsync(currency);

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (_currency != null)
        {
            GeneralWithdrawModel model = new GeneralWithdrawModel();
            model.Balance = (await _walletsRepository.GetUserWalletAsync(userId, currency)).Value;
            model.Currency = currency;

            if (_currency.Acronim == "ETH")
            {
                model.IsApproximate = true;
                model.Commission = 0.0008m;
            }

            if (_currency.Acronim == "DOGE")
            {
                model.IsApproximate = false;
                model.Commission = 0.00226m;
            }

            if (_currency.Acronim == "DASH")
            {
                model.IsApproximate = true;
                model.Commission = 0.00002660m;
            }

            return Ok(model);
        }

        return BadRequest("Something went wrong");
    }

    [HttpPost]
    public async Task<IActionResult> Index(GeneralWithdrawModel model)
    {
        GeneralWithdrawModel m = new();

        if (ModelState.IsValid)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            m.Balance = (await _walletsRepository.GetUserWalletAsync(userId, model.Currency)).Value;

            if (model.Currency == "ZEC")
            {
                m = await _zecService.SendToAddress(model, userId);
            }
            else if (model.Currency == "ETH")
            {
                m = await _etheriumService.SendToAddress(model, userId);
            }
            else
            {
                m = await _withdrawService.Send(model, userId);
            }


            return Ok(m);
        }

        return BadRequest("Something went wrong");
    }
}