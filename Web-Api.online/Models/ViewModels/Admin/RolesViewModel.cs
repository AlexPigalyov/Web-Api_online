using System.Collections.Generic;

using Web_Api.online.Models.StoredProcedures;

namespace Web_Api.online.Models.ViewModels
{
    public class RolesViewModel
    {
        public List<spGetRolesForAdminPanelResult> Roles { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
