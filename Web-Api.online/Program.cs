using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

using Quartz;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Jobs;

namespace Web_Api.online
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                })
                .ConfigureServices((hostContext, services) =>
                {
                    services.AddQuartz(q =>
                    {
                        q.UseMicrosoftDependencyInjectionScopedJobFactory();

                        // Create a "key" for the job
                        var tradeJobKey = new JobKey("TradeJob");
                        var btcUsdtJobKey = new JobKey("BtcUsdtJob");
                        var candleStickJobKey = new JobKey("CandleStickJob");

                        // Register the job with the DI container
                        q.AddJob<TradeJob>(opts => opts.WithIdentity(tradeJobKey));
                        q.AddJob<BtcUsdtJob>(opts => opts.WithIdentity(btcUsdtJobKey));
                        q.AddJob<CandleStickJob>(opts => opts.WithIdentity(candleStickJobKey));

                        // Create a trigger for the job
                        q.AddTrigger(opts => opts
                            .ForJob(tradeJobKey)
                            .WithIdentity("TradeJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(btcUsdtJobKey)
                            .WithIdentity("BtcUsdtJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(500))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(candleStickJobKey)
                            .WithIdentity("CandleStickJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000 * 60))
                                .RepeatForever()
                            ));

                    });
                    services.AddQuartzHostedService(q => q.WaitForJobsToComplete = true);
                });
    }
}
