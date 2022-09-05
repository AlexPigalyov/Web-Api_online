using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories.Abstract
{
    public interface IEventsRepository
    {
        public Task<List<EventTableModel>> GetLastFiveEvents_ByUserId(string userId);
        public Task CreateEventAsync(EventTableModel model);
        public Task<List<EventTableModel>> GetByUserId(string userId);
    }
}
