using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Data;
using Microsoft.OpenApi.Models;
using Web_Api.online.Hubs;
using Web_Api.online.Services.DI;
using Web_Api.online.Models.Tables;
using Web_Api.online.Services;
using Web_Api.online.Models.Constants;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Data.Repositories.Abstract;
using Web_Api.online.Clients;
using Microsoft.AspNetCore.Identity.UI.Services;
using Web_Api.online.Clients.Requests;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Facebook;
using ReflectionIT.Mvc.Paging;
using Web_Api.online.Middlewares;

namespace Web_Api.online
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<WebApiDbContext>(options =>
                options.UseSqlServer(
                    Configuration.GetConnectionString("DefaultConnection")));
            services.AddDatabaseDeveloperPageExceptionFilter();

            services.AddMvc();
            services.AddPaging(options =>
            {
                options.ViewName = "Bootstrap4";
                options.PageParameterName = "pageindex";
            });

            services.AddIdentity<IdentityUser, IdentityRole>(options =>
            {
                options.SignIn.RequireConfirmedAccount = false;
                options.SignIn.RequireConfirmedEmail = false;
                options.SignIn.RequireConfirmedPhoneNumber = false;
                options.Password.RequireDigit = false;
                options.Password.RequiredLength = 1;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireUppercase = false;
                options.Password.RequireLowercase = false;
            })
            .AddEntityFrameworkStores<WebApiDbContext>()
            .AddDefaultTokenProviders();

            services.AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;

            })
                .AddCookie()
                .AddGoogle(GoogleDefaults.AuthenticationScheme, options =>
                 {
                     options.ClientId = Configuration["Authentitcation:Google:ClientId"];
                     options.ClientSecret = Configuration["Authentitcation:Google:ClientSecret"];
                     options.ClaimActions.MapJsonKey("urn:google:picture", "picture", "url");
                 })
                .AddFacebook(FacebookDefaults.AuthenticationScheme, options =>
                {
                    options.AppId = Configuration["Authentitcation:Facebook:AppId"];
                    options.AppSecret = Configuration["Authentitcation:Facebook:AppSecret"];
                    options.ClaimActions.MapJsonKey("urn:facebook:picture", "picture", "url");
                });

            services.AddControllersWithViews();
            
            services.AddSignalR();

            services.AddRazorPages();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Web_Api.online", Version = "v1" });
            });



            services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = new PathString("/Identity/Account/Login");
            });

            services.AddTransient<WalletsRepository>();
            services.AddTransient<CandleStickRepository>();
            services.AddTransient<UsersInfoRepository>();
            services.AddTransient<webapionlineContext>();
            services.AddTransient<ExchangeContext>();
            services.AddTransient<TradeRepository>();
            services.AddTransient<PairsRepository>();
            services.AddTransient<IRatesRepository, RatesRepository>();
            services.AddTransient<EventsRepository>();
            services.AddTransient<UserRepository>();
            services.AddTransient<BotsRepository>();
            services.AddTransient<SettingRepository>();
            services.AddTransient<RoleRepository>();
            services.AddTransient<TransferRepository>();
            services.AddTransient<ExceptionsRepository>();
            services.AddTransient<TransactionsRepository>();
            services.AddTransient<OutcomeTransactionRepository>();
            services.AddTransient<TransactionManager>();
            services.AddTransient<WithdrawService>();
            services.AddTransient<ETHRequestClient>();
            services.AddCoinManager(Configuration);
            services.AddTransient<ZCashService>();
            services.AddTransient<EtheriumService>();
            services.AddTransient<WalletService>();
            services.AddTransient<BalanceProvider>();
            services.AddTransient<IEmailSender, EmailSender>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public async void Configure(IApplicationBuilder app, IWebHostEnvironment env, IServiceProvider serviceProvider)
        {
            app.UseCors(builder => builder
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Web_Api.online v1"));

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseAuthentication();

            app.UseRouting();
            app.UseAuthorization();

            app.UseMiddleware<ExceptionHandlerMiddleware>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
                endpoints.MapRazorPages();
                endpoints.MapHub<btcusdtHub>("/btcusdthub");
                endpoints.MapHub<ChatHub>("/chatHub");
            });

            _ = Task.Run(async () =>
            {
                var candleStickRepository = serviceProvider.GetService<CandleStickRepository>();

                while (true)
                {
                    await Task.Delay(1000 * 60);

                    _ = candleStickRepository.spProcess_BTC_USDT_CandleStick();
                }
            });

            RolesSeed(serviceProvider).Wait();
            UserSeed(serviceProvider).Wait();
            WalletSeed(serviceProvider).Wait();
            BotAuthCodesSeed(serviceProvider).Wait();
        }

        private async Task RolesSeed(IServiceProvider serviceProvider)
        {
            var roleManager = serviceProvider.GetService<RoleManager<IdentityRole>>();

            #region AdminRole

            var adminRole = await roleManager.FindByNameAsync(RolesNameConstant.Admin);
            if (adminRole == null)
            {
                await roleManager.CreateAsync(new IdentityRole()
                {
                    Name = RolesNameConstant.Admin
                });
            }
            #endregion
            #region NewsManagerRole

            var newsManagerRole = await roleManager.FindByNameAsync(RolesNameConstant.NewsManager);
            if (newsManagerRole == null)
            {
                await roleManager.CreateAsync(new IdentityRole()
                {
                    Name = RolesNameConstant.NewsManager
                });
            }
            #endregion
            #region OutcomePaymentsManagerRole

            var outcomePaymentsManagerRole = await roleManager.FindByNameAsync(RolesNameConstant.OutcomePaymentsManager);
            if (outcomePaymentsManagerRole == null)
            {
                await roleManager.CreateAsync(new IdentityRole()
                {
                    Name = RolesNameConstant.OutcomePaymentsManager
                });
            }
            #endregion
            #region IncomePaymentsManagerRole

            var incomePaymentsManagerRole = await roleManager.FindByNameAsync(RolesNameConstant.IncomePaymentsManager);
            if (incomePaymentsManagerRole == null)
            {
                await roleManager.CreateAsync(new IdentityRole()
                {
                    Name = RolesNameConstant.IncomePaymentsManager
                });
            }
            #endregion
        }
        private async Task UserSeed(IServiceProvider serviceProvider)
        {
            var userManager = serviceProvider.GetService<UserManager<IdentityUser>>();
            var usersInfoRepository = serviceProvider.GetService<UsersInfoRepository>();

            #region AdminDefaultAccount
            var adminDefaultAcc = await userManager.FindByIdAsync(UserIdConstant.AdminDefaultAcc);
            if (adminDefaultAcc == null)
            {
                var newAcc = new IdentityUser()
                {
                    Id = UserIdConstant.AdminDefaultAcc,
                    UserName = "admin@account.com",
                    Email = "admin@account.com"
                };

                var res = await userManager.CreateAsync(newAcc, "admin123123123");

                if (res.Succeeded)
                {
                    await userManager.AddToRoleAsync(newAcc, RolesNameConstant.Admin);

                    await usersInfoRepository.spCreateOrUpdateProfileUserInfo(new UserInfoTableModel()
                    {
                        FullName = "Admin",
                        AboutMe = "Admin Account",
                        Location = "Russia",
                        RegistrationDate = DateTime.Now,
                        UserId = UserIdConstant.AdminDefaultAcc
                    });
                }
            }
            #endregion
            #region BinanceAcc

            var binanceAcc = await userManager.FindByIdAsync(UserIdConstant.BinanceBot);
            if (binanceAcc == null)
            {
                var newAcc = new IdentityUser()
                {
                    Id = UserIdConstant.BinanceBot,
                    UserName = "BinanceBotParserAccount",
                    Email = "BinanceBot@account.com"
                };

                var res = await userManager.CreateAsync(newAcc, "binancebotaccountpassword");

                if (res.Succeeded)
                {
                    await usersInfoRepository.spCreateOrUpdateProfileUserInfo(new UserInfoTableModel()
                    {
                        FullName = "Binance Bot",
                        AboutMe = "Binance Bot Account",
                        Location = "Russia",
                        RegistrationDate = DateTime.Now,
                        UserId = UserIdConstant.BinanceBot
                    });
                }
            }
            #endregion
            #region BitFinexAcc

            var bitFinexAcc = await userManager.FindByIdAsync(UserIdConstant.BitFinexBot);
            if (bitFinexAcc == null)
            {
                var newAcc = new IdentityUser()
                {
                    Id = UserIdConstant.BitFinexBot,
                    UserName = "BitFinexBotParserAccount",
                    Email = "BitFinexBot@account.com"
                };

                var res = await userManager.CreateAsync(newAcc, "bitfinexbotaccountpassword");

                if (res.Succeeded)
                {
                    await usersInfoRepository.spCreateOrUpdateProfileUserInfo(new UserInfoTableModel()
                    {
                        FullName = "BitFinex Bot",
                        AboutMe = "BitFinex Bot Account",
                        Location = "Russia",
                        RegistrationDate = DateTime.Now,
                        UserId = UserIdConstant.BitFinexBot
                    });
                }
            }
            #endregion
            #region KucoinAcc

            var kucoinAcc = await userManager.FindByIdAsync(UserIdConstant.KucoinBot);
            if (kucoinAcc == null)
            {
                var newAcc = new IdentityUser()
                {
                    Id = UserIdConstant.KucoinBot,
                    UserName = "KucoinBotParserAccount",
                    Email = "KucoinBot@account.com"
                };

                var res = await userManager.CreateAsync(newAcc, "kucoinbotaccountpassword");

                if (res.Succeeded)
                {
                    await usersInfoRepository.spCreateOrUpdateProfileUserInfo(new UserInfoTableModel()
                    {
                        FullName = "Kucoin Bot",
                        AboutMe = "Kucoin Bot Account",
                        Location = "Russia",
                        RegistrationDate = DateTime.Now,
                        UserId = UserIdConstant.KucoinBot
                    });
                }
            }
            #endregion
            #region PoloniexAcc

            var poloniexAcc = await userManager.FindByIdAsync(UserIdConstant.PoloniexBot);
            if (poloniexAcc == null)
            {
                var newAcc = new IdentityUser()
                {
                    Id = UserIdConstant.PoloniexBot,
                    UserName = "PoloniexBotParserAccount",
                    Email = "PoloniexBot@account.com"
                };

                var res = await userManager.CreateAsync(newAcc, "poloniexbotaccountpassword");

                if (res.Succeeded)
                {
                    await usersInfoRepository.spCreateOrUpdateProfileUserInfo(new UserInfoTableModel()
                    {
                        FullName = "Poliniex Bot",
                        AboutMe = "Poliniex Bot Account",
                        Location = "Russia",
                        RegistrationDate = DateTime.Now,
                        UserId = UserIdConstant.PoloniexBot
                    });
                }
            }
            #endregion
        }

        private async Task WalletSeed(IServiceProvider serviceProvider)
        {
            var walletRepository = serviceProvider.GetService<WalletsRepository>();

            #region BinanceWallet

            var binanceWallets = await walletRepository.GetUserWalletsAsync(UserIdConstant.BinanceBot);
            if (binanceWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserIdConstant.BinanceBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }

            if (binanceWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserIdConstant.BinanceBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }
            #endregion
            #region BitFinexWallet

            var bitFinexWallets = await walletRepository.GetUserWalletsAsync(UserIdConstant.BitFinexBot);
            if (bitFinexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserIdConstant.BitFinexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }

            if (bitFinexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserIdConstant.BitFinexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }
            #endregion
            #region KucoinWallet

            var kucoinWallets = await walletRepository.GetUserWalletsAsync(UserIdConstant.KucoinBot);
            if (kucoinWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserIdConstant.KucoinBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }

            if (kucoinWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserIdConstant.KucoinBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }
            #endregion
            #region PoloniexWallet

            var poloniexWallets = await walletRepository.GetUserWalletsAsync(UserIdConstant.PoloniexBot);
            if (poloniexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserIdConstant.PoloniexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }

            if (poloniexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserIdConstant.PoloniexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalanceAsync(wallet);
            }
            #endregion
        }

        private async Task BotAuthCodesSeed(IServiceProvider serviceProvider)
        {
            var botsRepository = serviceProvider.GetService<BotsRepository>();

            #region BinanceAuthCode

            var binanceAuthCodes = await botsRepository.GetBotByUserId(UserIdConstant.BinanceBot);
            if (!binanceAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.Binance))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "Binance",
                    BotAuthCode = BotAuthCode.Binance,
                    UserId = UserIdConstant.BinanceBot
                });
            }
            #endregion
            #region BitFinexAuthCode

            var bitFinexAuthCodes = await botsRepository.GetBotByUserId(UserIdConstant.BitFinexBot);
            if (!bitFinexAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.BitFinex))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "BitFinex",
                    BotAuthCode = BotAuthCode.BitFinex,
                    UserId = UserIdConstant.BitFinexBot
                });
            }
            #endregion
            #region KucoinAuthCode

            var kucoinAuthCodes = await botsRepository.GetBotByUserId(UserIdConstant.KucoinBot);
            if (!kucoinAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.Kucoin))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "Kucoin",
                    BotAuthCode = BotAuthCode.Kucoin,
                    UserId = UserIdConstant.KucoinBot
                });
            }
            #endregion
            #region PoloniexAuthCode

            var poloniexAuthCodes = await botsRepository.GetBotByUserId(UserIdConstant.PoloniexBot);
            if (!poloniexAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.Poloniex))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "Poloniex",
                    BotAuthCode = BotAuthCode.Poloniex,
                    UserId = UserIdConstant.PoloniexBot
                });
            }
            #endregion
        }
    }
}