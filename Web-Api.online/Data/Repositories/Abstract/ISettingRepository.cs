using System.Collections.Generic;
using System.Threading.Tasks;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Data.Repositories.Abstract
{
    public interface ISettingRepository
    {
        public Task<List<spGetSettingsResult>> GetSettings();
        public Task UpdateSetting(spUpdateSettingArgs model);
        public Task CreateSetting(SettingTableModel model);

    }
}
