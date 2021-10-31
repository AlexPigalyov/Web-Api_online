using System.Collections.Generic;

namespace Web_Api.online.Models.ViewModels
{
    public class UsersViewModel
    {
        public List<spGetUsersForAdminPanelResult> Users { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
