using Quartz;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Services;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class CandleStickJob : IJob
    {
        private readonly PairsRepository _pairsRepository;
        private readonly CandleStickService _candleStickService;
        public CandleStickJob(PairsRepository pairsRepository, CandleStickService candleStickService)
        {
            _pairsRepository = pairsRepository;
            _candleStickService = candleStickService;
        }

        public async Task Execute(IJobExecutionContext context)
        {
            var pairs = await _pairsRepository.GetAllPairsAsync();

            foreach(var pair in pairs)
            {
                await _candleStickService.CreateCandleStick(pair.Currency1 + "_" + pair.Currency2);
            }
        }
    }
}
