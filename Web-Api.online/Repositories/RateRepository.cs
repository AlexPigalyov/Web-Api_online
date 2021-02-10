using System.Linq;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories
{
    public static class Raterepository
    {
        public static Rate GetLastRates()
        {
            using (var ctx = new webapionlineContext())
            {
                return ctx.Rates.OrderByDescending(item => item.Id).FirstOrDefault();
            }
        }
    }
}
