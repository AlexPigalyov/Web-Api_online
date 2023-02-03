using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
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
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
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
            
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidIssuer = MobileAuthOptions.ISSUER,
                        ValidateAudience = true,
                        ValidAudience = MobileAuthOptions.AUDIENCE,
                        ValidateLifetime = true,
                        IssuerSigningKey = MobileAuthOptions.GetSymmetricSecurityKey(),
                        ValidateIssuerSigningKey = true,
                    };
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
                options.LoginPath = new PathString("/Login");
            });

            services.AddTransient<P2PRepository>();
            services.AddTransient<WalletsRepository>();
            services.AddTransient<CandleStickRepository>();
            services.AddTransient<UsersInfoRepository>();
            services.AddTransient<webapionlineContext>();
            services.AddTransient<ExchangeContext>();
            services.AddTransient<TradeRepository>();
            services.AddTransient<PairsRepository>();
            services.AddTransient<IRatesRepository, RatesRepository>();
            services.AddTransient<IEventsRepository, EventsRepository>();
            services.AddTransient<UserRepository>();
            services.AddTransient<BotsRepository>();
            services.AddTransient<ISettingRepository, SettingRepository>();
            services.AddTransient<INewsRepository, NewsRepository>();
            services.AddTransient<RoleRepository>();
            services.AddTransient<TransferRepository>();
            services.AddTransient<IExceptionsRepository, ExceptionsRepository>();
            services.AddTransient<TransactionsRepository>();
            services.AddTransient<IOutcomeTransactionRepository, OutcomeTransactionRepository>();
            services.AddTransient<TransactionManager>();
            services.AddTransient<WithdrawService>();
            services.AddTransient<CandleStickService>();
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
                endpoints.MapHub<StatsOrdersHub>("/statsordershub");
                endpoints.MapHub<PairsHub>("/pairshub");
                endpoints.MapHub<BtcUsdtHub>("/btcusdthub");
                endpoints.MapHub<EthUsdtHub>("/ethusdthub");
                endpoints.MapHub<DogeUsdtHub>("/dogeusdthub");
                endpoints.MapHub<LtcUsdtHub>("/ltcusdthub");
                endpoints.MapHub<DashUsdtHub>("/dashusdthub");
                endpoints.MapHub<DashBtcHub>("/dashbtchub");
                endpoints.MapHub<EthBtcHub>("/ethbtchub");
                endpoints.MapHub<LtcBtcHub>("/ltcbtchub");
                endpoints.MapHub<DogeBtcHub>("/dogebtchub");
                endpoints.MapHub<BchUsdtHub>("/bchusdthub");
                endpoints.MapHub<BchBtcHub>("/bchbtchub");
                
                //endpoints.MapHub<ChatHub>("/chatHub");
            });

        }
    }
}