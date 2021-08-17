using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Repositories.Abstract
{
    public abstract class BaseRepository<TEntity, TContext>
        : IBaseRepository<TEntity> where TEntity
        : class
        where TContext
        : DbContext
    {
        private readonly TContext _context;
        private readonly DbSet<TEntity> _dbSet;

        public BaseRepository(TContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _dbSet = _context.Set<TEntity>();
        }
        public async Task CreateAsync(TEntity entity)
        {
            try
            {
                _dbSet.Add(entity);
                await _context.SaveChangesAsync();
            }
            catch (Exception exc) { }
        }

        public async Task RemoveAsync(TEntity entity)
        {
            _dbSet.Remove(entity);
            await _context.SaveChangesAsync();
        }

        public async Task RemoveByIdAsync(long id)
        {
            TEntity entity = await FindByIdAsync(id);
            if (entity != null)
            {
                _dbSet.Remove(entity);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<IEnumerable<TEntity>> GetAsync()
        {
            return await _dbSet.ToListAsync();
        }

        public async Task<TEntity> FindByIdAsync(long id)
        {
            return await _dbSet.FindAsync(id);
        }

        public async Task UpdateAsync(TEntity entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }
    }
}
