using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories.Abstract
{
    public interface IExceptionsRepository
    {
        public Task<List<ExceptionTableModel>> GetTop10000ExceptionsAsync();

        public Task CreateExceptionAsync(ExceptionTableModel exception);
    }
}
