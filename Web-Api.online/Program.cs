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
                        var bchBtcJobKey = new JobKey("BchBtcJobKey");
                        var bchUsdtJobKey = new JobKey("BchUsdtJobKey");
                        var dashBtcJobKey = new JobKey("DashBtcJobKey");
                        var dashUsdtJobKey = new JobKey("DashUsdtJobKey");
                        var dogeBtcJobKey = new JobKey("DogeBtcJobKey");
                        var dogeUsdtJobKey = new JobKey("DogeUsdtJobKey");
                        var ethBtcJobKey = new JobKey("EthBtcJobKey");
                        var ethUsdtJobKey = new JobKey("EthUsdtJobKey");
                        var LtcBtcJobKey = new JobKey("LtcBtcJobKey");
                        var LtcUsdtJobKey = new JobKey("LtcUsdtJobKey");
                        var candleStickJobKey = new JobKey("CandleStickJob");

                        // Register the job with the DI container
                        q.AddJob<TradeJob>(opts => opts.WithIdentity(tradeJobKey));
                        q.AddJob<BtcUsdtJob>(opts => opts.WithIdentity(btcUsdtJobKey));
                        q.AddJob<BchUsdtJob>(opts => opts.WithIdentity(bchUsdtJobKey));
                        q.AddJob<BchBtcJob>(opts => opts.WithIdentity(bchBtcJobKey));
                        q.AddJob<DashBtcJob>(opts => opts.WithIdentity(dashBtcJobKey));
                        q.AddJob<DashUsdtJob>(opts => opts.WithIdentity(dashUsdtJobKey));
                        q.AddJob<DogeBtcJob>(opts => opts.WithIdentity(dogeBtcJobKey));
                        q.AddJob<DogeUsdtJob>(opts => opts.WithIdentity(dogeUsdtJobKey));
                        q.AddJob<EthBtcJob>(opts => opts.WithIdentity(ethBtcJobKey));
                        q.AddJob<EthUsdtJob>(opts => opts.WithIdentity(ethUsdtJobKey));
                        q.AddJob<LtcBtcJob>(opts => opts.WithIdentity(LtcBtcJobKey));
                        q.AddJob<LtcUsdtJob>(opts => opts.WithIdentity(LtcUsdtJobKey));
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
                            .ForJob(bchBtcJobKey)
                            .WithIdentity("BchBtcJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(bchUsdtJobKey)
                            .WithIdentity("BchUsdtJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(dashBtcJobKey)
                            .WithIdentity("DashBtcJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(dashUsdtJobKey)
                            .WithIdentity("DashUsdtJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(dogeBtcJobKey)
                            .WithIdentity("DogeBtcJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(dogeUsdtJobKey)
                            .WithIdentity("DogeUsdtJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(ethBtcJobKey)
                            .WithIdentity("EthBtcJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(ethUsdtJobKey)
                            .WithIdentity("EthUsdtJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(LtcBtcJobKey)
                            .WithIdentity("LtcBtcJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
                                .RepeatForever()
                            ));
                        q.AddTrigger(opts => opts
                            .ForJob(LtcUsdtJobKey)
                            .WithIdentity("LtcUsdtJob-trigger")
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(1000))
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
