using System.Collections.Generic;
using System.Linq;

using Web_Api.online.Data;
using Web_Api.online.Models;
using Web_Api.online.Repositories.Abstract;

namespace Web_Api.online.Repositories
{
    public class EventsRepository
        : BaseRepository<EventModel, ExchangeContext>,
          IEventsRepository
    {
        private readonly ExchangeContext _context;
        public EventsRepository(ExchangeContext context)
            : base(context)
        {
            _context = context;
        }

        public List<EventModel> GetByUserId(string userId)
        {
            return _context.Events
                .Where(x => x.UserId == userId)
                .OrderByDescending(x => x.WhenDate)
                .ToList();
        }
    }
}
