using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Data;
using Microsoft.OpenApi.Models;
using Web_Api.online.Repositories;
using Web_Api.online.Hubs;
using Web_Api.online.Services.DI;
using Web_Api.online.Repositories.Abstract;
using Web_Api.online.Models.Tables;
using Web_Api.online.Services;
using Web_Api.online.Models.Constants;
using Web_Api.online.Models;

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
            services.AddTransient<webapionlineContext>();
            services.AddTransient<ExchangeContext>();
            services.AddTransient<TradeRepository>();
            services.AddTransient<IRatesRepository, RatesRepository>();
            services.AddTransient<EventsRepository>();
            services.AddTransient<BotsRepository>();


            services.AddTransient<TransactionsRepository>();
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

            UserSeed(serviceProvider).Wait();
            WalletSeed(serviceProvider).Wait();
            BotAuthCodesSeed(serviceProvider).Wait();
        }
        private async Task UserSeed(IServiceProvider serviceProvider)
        {
            var userManager = serviceProvider.GetService<UserManager<IdentityUser>>();

            var user = await userManager.FindByIdAsync(UserId.ParserBot);

            if (user == null)
            {
                await userManager.CreateAsync(new IdentityUser()
                {
                    Id = UserId.ParserBot,
                    UserName = "BotParserAccount",
                    Email = "Bot@account.com"
                }, "botaccountpassword");
            }
        }

        private async Task WalletSeed(IServiceProvider serviceProvider)
        {
            var walletRepository = serviceProvider.GetService<WalletsRepository>();

            var wallets = await walletRepository.GetUserWalletsAsync(UserId.ParserBot);

            if (wallets.FirstOrDefault(x => x.CurrencyAcronim == "BTC") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new Wallet()
                {
                    Address = "",
                    CurrencyAcronim = "BTC",
                    UserId = UserId.ParserBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }

            if (wallets.FirstOrDefault(x => x.CurrencyAcronim == "USDT") == null)
            {
                var wallet = await walletRepository.CreateUserWalletAsync(new Wallet()
                {
                    Address = "",
                    CurrencyAcronim = "USDT",
                    UserId = UserId.ParserBot
                });

                wallet.Value = 1000000;

                await walletRepository.UpdateWalletBalance(wallet);
            }
        }

        private async Task BotAuthCodesSeed(IServiceProvider serviceProvider)
        {
            var botsRepository = serviceProvider.GetService<BotsRepository>();

            var authCodes = await botsRepository.GetBotByUserId(UserId.ParserBot);

            if (!authCodes.Any(x => x.BotAuthCode == BotAuthCode.Binance))
            {
                await botsRepository.CreateBot(new Models.StoredProcedures.Args_spCreateBot()
                {
                    Name = "Binance",
                    BotAuthCode = BotAuthCode.Binance,
                    UserId = UserId.ParserBot
                });
            }

            if (!authCodes.Any(x => x.BotAuthCode == BotAuthCode.BitFinex))
            {
                await botsRepository.CreateBot(new Models.StoredProcedures.Args_spCreateBot()
                {
                    Name = "BitFinex",
                    BotAuthCode = BotAuthCode.BitFinex,
                    UserId = UserId.ParserBot
                });
            }

            if (!authCodes.Any(x => x.BotAuthCode == BotAuthCode.Huobi))
            {
                await botsRepository.CreateBot(new Models.StoredProcedures.Args_spCreateBot()
                {
                    Name = "Huobi",
                    BotAuthCode = BotAuthCode.Huobi,
                    UserId = UserId.ParserBot
                });
            }

            if (!authCodes.Any(x => x.BotAuthCode == BotAuthCode.Kucoin))
            {
                await botsRepository.CreateBot(new Models.StoredProcedures.Args_spCreateBot()
                {
                    Name = "Kucoin",
                    BotAuthCode = BotAuthCode.Kucoin,
                    UserId = UserId.ParserBot
                });
            }

            if (!authCodes.Any(x => x.BotAuthCode == BotAuthCode.Poloniex))
            {
                await botsRepository.CreateBot(new Models.StoredProcedures.Args_spCreateBot()
                {
                    Name = "Poloniex",
                    BotAuthCode = BotAuthCode.Poloniex,
                    UserId = UserId.ParserBot
                });
            }
        }
    }
}