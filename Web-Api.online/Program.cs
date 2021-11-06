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
                        var jobKey = new JobKey("TradeJob");

                        // Register the job with the DI container
                        q.AddJob<TradeJob>(opts => opts.WithIdentity(jobKey));

                        // Create a trigger for the job
                        q.AddTrigger(opts => opts
                            .ForJob(jobKey) 
                            .WithIdentity("TradeJob-trigger") 
                            .WithSimpleSchedule(builder => builder
                                .WithInterval(TimeSpan.FromMilliseconds(500))
                                .RepeatForever()
                            )); // run every 100 ms
                    });
                    services.AddQuartzHostedService(q => q.WaitForJobsToComplete = true);
                });
    }
}
