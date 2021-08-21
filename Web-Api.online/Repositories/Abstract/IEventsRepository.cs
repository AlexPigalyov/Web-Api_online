using System.Collections.Generic;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories.Abstract
{
    public interface IEventsRepository
        : IBaseRepository<Events>
    {
        List<Events> GetByUserId(string userId);
    }
}
