using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Web_Api.online.Clients;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Services.Interfaces;

namespace Web_Api.online.Services.DI
{
    public static class Startup
    {
        public static void AddCoinManager(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<IBitcoinService, BitcoinService>();
            services.AddSingleton<IBitcoinCashService, BitcoinCashService>();
            services.AddSingleton<IDashService, DashService>();
            services.AddSingleton<IDogecoinService, DogecoinService>();
            services.AddSingleton<ILitecoinService, LitecoinService>();
            //services.AddSingleton<IZCashService, ZCashService>();

            services.AddSingleton<ICoinManager, CoinManager>();
        }
    }
}
