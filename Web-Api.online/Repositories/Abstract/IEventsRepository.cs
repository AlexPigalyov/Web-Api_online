using System.Collections.Generic;

using Web_Api.online.Models;

namespace Web_Api.online.Repositories.Abstract
{
    public interface IEventsRepository
        : IBaseRepository<EventModel>
    {
        List<EventModel> GetByUserId(string userId);
    }
}
