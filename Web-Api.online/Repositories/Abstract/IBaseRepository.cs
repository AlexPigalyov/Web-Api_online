using System.Collections.Generic;
using System.Threading.Tasks;

namespace Web_Api.online.Repositories.Abstract
{
    public interface IBaseRepository<TEntity> where TEntity
        : class
    {
        Task CreateAsync(TEntity entity);
        Task RemoveAsync(TEntity entity);
        Task RemoveByIdAsync(long id);
        Task<IEnumerable<TEntity>> GetAsync();
        Task<TEntity> FindByIdAsync(long id);
        Task UpdateAsync(TEntity entity);
    }
}
