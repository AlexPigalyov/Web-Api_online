using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
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

            services.AddDefaultIdentity<IdentityUser>(options =>
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
                .AddEntityFrameworkStores<WebApiDbContext>();
            services.AddControllersWithViews();

            services.AddSignalR();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Web_Api.online", Version = "v1" });
            });

            services.AddTransient<WalletsRepository>();
            services.AddTransient<CandleStickRepository>();
            services.AddTransient<UsersInfoRepository>();
            services.AddTransient<webapionlineContext>();
            services.AddTransient<ExchangeContext>();
            services.AddTransient<TradeRepository>();
            services.AddTransient<IRatesRepository, RatesRepository>();
            services.AddTransient<EventsRepository>();
            services.AddTransient<BotsRepository>();

            services.AddTransient<TransactionsRepository>();
            services.AddTransient<OutcomeTransactionRepository>();
            services.AddTransient<TransactionManager>();
            services.AddTransient<WithdrawService>();
            services.AddCoinManager(Configuration);
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

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

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

            UserSeed(serviceProvider).Wait();
            WalletSeed(serviceProvider).Wait();
            BotAuthCodesSeed(serviceProvider).Wait();
        }
        private async Task UserSeed(IServiceProvider serviceProvider)
        {
            var userManager = serviceProvider.GetService<UserManager<IdentityUser>>();

            var binanceAcc = await userManager.FindByIdAsync(UserId.BinanceBot);

            if (binanceAcc == null)
            {
                await userManager.CreateAsync(new IdentityUser()
                {
                    Id = UserId.BinanceBot,
                    UserName = "BinanceBotParserAccount",
                    Email = "BinanceBot@account.com"
                }, "binancebotaccountpassword");
            }

            var bitFinexAcc = await userManager.FindByIdAsync(UserId.BitFinexBot);
            
            if(bitFinexAcc == null)
            {
                await userManager.CreateAsync(new IdentityUser()
                {
                    Id = UserId.BitFinexBot,
                    UserName = "BitFinexBotParserAccount",
                    Email = "BitFinexBot@account.com"
                }, "bitfinexbotaccountpassword");
            }

            var kucoinAcc = await userManager.FindByIdAsync(UserId.KucoinBot);

            if (kucoinAcc == null)
            {
                await userManager.CreateAsync(new IdentityUser()
                {
                    Id = UserId.KucoinBot,
                    UserName = "KucoinBotParserAccount",
                    Email = "KucoinBot@account.com"
                }, "kucoinbotaccountpassword");
            }

            var poloniexAcc = await userManager.FindByIdAsync(UserId.PoloniexBot);

            if (poloniexAcc == null)
            {
                await userManager.CreateAsync(new IdentityUser()
                {
                    Id = UserId.PoloniexBot,
                    UserName = "PoloniexBotParserAccount",
                    Email = "PoloniexBot@account.com"
                }, "poloniexbotaccountpassword");
            }
        }

        private async Task WalletSeed(IServiceProvider serviceProvider)
        {
            var walletRepository = serviceProvider.GetService<WalletsRepository>();
            #region BinanceWallet
            var binanceWallets = await walletRepository.GetUserWalletsAsync(UserId.BinanceBot);

            if (binanceWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserId.BinanceBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }

            if (binanceWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserId.BinanceBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }
            #endregion
            #region BitFinexWallet
            var bitFinexWallets = await walletRepository.GetUserWalletsAsync(UserId.BitFinexBot);

            if (bitFinexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserId.BitFinexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }

            if (bitFinexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserId.BitFinexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }
            #endregion
            #region KucoinWallet
            var kucoinWallets = await walletRepository.GetUserWalletsAsync(UserId.KucoinBot);

            if (kucoinWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserId.KucoinBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }

            if (kucoinWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserId.KucoinBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }
            #endregion
            #region PoloniexWallet
            var poloniexWallets = await walletRepository.GetUserWalletsAsync(UserId.PoloniexBot);

            if (poloniexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserId.PoloniexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }

            if (poloniexWallets?.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new WalletTableModel()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserId.PoloniexBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }
            #endregion
        }

        private async Task BotAuthCodesSeed(IServiceProvider serviceProvider)
        {
            var botsRepository = serviceProvider.GetService<BotsRepository>();

            var binanceAuthCodes = await botsRepository.GetBotByUserId(UserId.BinanceBot);

            if (!binanceAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.Binance))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "Binance",
                    BotAuthCode = BotAuthCode.Binance,
                    UserId = UserId.BinanceBot
                });
            }

            var bitFinexAuthCodes = await botsRepository.GetBotByUserId(UserId.BitFinexBot);

            if (!bitFinexAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.BitFinex))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "BitFinex",
                    BotAuthCode = BotAuthCode.BitFinex,
                    UserId = UserId.BitFinexBot
                });
            }

            var kucoinAuthCodes = await botsRepository.GetBotByUserId(UserId.KucoinBot);

            if (!kucoinAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.Kucoin))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "Kucoin",
                    BotAuthCode = BotAuthCode.Kucoin,
                    UserId = UserId.KucoinBot
                });
            }

            var poloniexAuthCodes = await botsRepository.GetBotByUserId(UserId.PoloniexBot);

            if (!poloniexAuthCodes.Any(x => x.BotAuthCode == BotAuthCode.Poloniex))
            {
                await botsRepository.CreateBot(new BotsTableModel()
                {
                    Name = "Poloniex",
                    BotAuthCode = BotAuthCode.Poloniex,
                    UserId = UserId.PoloniexBot
                });
            }
        }
    }
}