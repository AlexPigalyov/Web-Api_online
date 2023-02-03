using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Web_Api.online.Areas.Identity.Pages.Account;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Extensions;
using Web_Api.online.Models.Enums;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;


namespace Web_Api.online.Controllers.Mobile;

[AllowAnonymous]
[Route("[controller]/[action]")]
public class MobileUserAuthController : Controller
{
    private readonly UserManager<IdentityUser> _userManager;
    private readonly SignInManager<IdentityUser> _signInManager;
    private readonly UsersInfoRepository _usersInfoRepository;
    private IEventsRepository _eventsRepository;

    public MobileUserAuthController(
        UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager,
        UsersInfoRepository usersInfoRepository, IEventsRepository eventsRepository)
    {
        _userManager = userManager;
        _signInManager = signInManager;
        _usersInfoRepository = usersInfoRepository;
        _eventsRepository = eventsRepository;
    }

    [HttpPost]
    public async Task<ActionResult> Login([FromBody] LoginModel.InputModel model)
    {
        if (ModelState.IsValid)
        {
            // This doesn't count login failures towards account lockout
            // To enable password failures to trigger account lockout, set lockoutOnFailure: true
            var result = await _signInManager.PasswordSignInAsync(model.Login, model.Password, model.RememberMe,
                lockoutOnFailure: false);
            if (result.Succeeded)
            {
                var userId = (await _userManager.FindByNameAsync(model.Login))!.Id;
                
                var claims = new List<Claim> { new(ClaimTypes.NameIdentifier, userId) };

                var jwt = new JwtSecurityToken(
                    issuer: MobileAuthOptions.ISSUER,
                    audience: MobileAuthOptions.AUDIENCE,
                    claims: claims,
                    expires: DateTime.UtcNow.Add(TimeSpan.FromDays(30)), // время действия 2 минуты
                    signingCredentials: new SigningCredentials(MobileAuthOptions.GetSymmetricSecurityKey(),
                        SecurityAlgorithms.HmacSha256));

                return Ok(new JwtSecurityTokenHandler().WriteToken(jwt));
            }


            if (result.RequiresTwoFactor)
            {
                return BadRequest("Needs two factor auth.");
            }


            if (result.IsLockedOut)
            {
                return BadRequest("Account is locked out.");
            }

            var user = await _userManager.FindByEmailAsync(model.Login);

            if (user != null)
            {
                var resultByEmail = await _signInManager.PasswordSignInAsync(user.UserName, model.Password,
                    model.RememberMe, lockoutOnFailure: false);

                if (resultByEmail.Succeeded)
                {
                    var claims = new List<Claim> { new(ClaimTypes.NameIdentifier, user.Id) };

                    var jwt = new JwtSecurityToken(
                        issuer: MobileAuthOptions.ISSUER,
                        audience: MobileAuthOptions.AUDIENCE,
                        claims: claims,
                        expires: DateTime.UtcNow.Add(TimeSpan.FromDays(30)), // время действия 2 минуты
                        signingCredentials: new SigningCredentials(MobileAuthOptions.GetSymmetricSecurityKey(),
                            SecurityAlgorithms.HmacSha256));

                    return Ok(new JwtSecurityTokenHandler().WriteToken(jwt));
                }

                if (resultByEmail.RequiresTwoFactor)
                {
                    return BadRequest("Needs two factor auth.");
                }

                if (resultByEmail.IsLockedOut)
                {
                    return BadRequest("Account is locked out.");
                }
            }

            return BadRequest("Invalid login attempt.");
        }

        // If we got this far, something failed, redisplay form
        return BadRequest("Something went wrong.");
    }
    
    [HttpPost]
    public async Task<IActionResult> Register([FromBody] RegisterModel.InputModel model)
    {
        if (ModelState.IsValid)
        {
            var user = new IdentityUser { UserName = model.Email, Email = model.Email };
            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                await _usersInfoRepository.CreateEmptyUsersInfo(user.Id);
                
                spGetUserByUserNumber refUser = null;

                if (model.RefId != null)
                {
                    await _usersInfoRepository.SetUsersInfoRefid(user.Id, model.RefId.GetValueOrDefault().ToString());

                    refUser = await _usersInfoRepository.GetUserByUserNumber(model.RefId.GetValueOrDefault());
                }
                
                await _eventsRepository.CreateEventAsync(new EventTableModel()
                {
                    UserId = user.Id,
                    Type = (int)EventTypeEnum.Registration,
                    Comment = "Platform registration.",
                    WhenDate = DateTime.Now,
                    CurrencyAcronim = ""
                });
                
                if (refUser != null)
                {
                    await _eventsRepository.CreateEventAsync(new EventTableModel()
                    {
                        UserId = refUser.Id,
                        Type = (int)EventTypeEnum.RegistrationByRefferalLink,
                        Comment = $"Got new refferal {user.Email.HideEmail()}.",
                        WhenDate = DateTime.Now,
                        CurrencyAcronim = ""
                    });
                }
                
                //var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                /*
                var code = "123";
                code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                var callbackUrl = Url.Page(
                    "/Account/ConfirmEmail",
                    pageHandler: null,
                    values: new { area = "Identity", userId = user.Id, code = code, returnUrl = returnUrl },
                    protocol: Request.Scheme);

                await _emailSender.SendEmailAsync(Input.Email, "Confirm your email",
                    $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.");
                
                if (_userManager.Options.SignIn.RequireConfirmedAccount)
                {
                    return RedirectToPage("RegisterConfirmation", new { email = Input.Email, returnUrl = returnUrl });
                }
                */
                
                var claims = new List<Claim> { new(ClaimTypes.NameIdentifier, user.Id) };

                var jwt = new JwtSecurityToken(
                    issuer: MobileAuthOptions.ISSUER,
                    audience: MobileAuthOptions.AUDIENCE,
                    claims: claims,
                    expires: DateTime.UtcNow.Add(TimeSpan.FromDays(30)), // время действия 30 дней
                    signingCredentials: new SigningCredentials(MobileAuthOptions.GetSymmetricSecurityKey(),
                        SecurityAlgorithms.HmacSha256));

                return Ok(new JwtSecurityTokenHandler().WriteToken(jwt));
            }

            return BadRequest(string.Join("\n", result.Errors.Select(x => x.Description)));
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(string.Empty, error.Description);
            }
        }

        // If we got this far, something failed, redisplay form
        return BadRequest("Something went wrong.");
    }
}