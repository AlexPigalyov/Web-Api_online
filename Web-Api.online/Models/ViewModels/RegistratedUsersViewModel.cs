using System.Collections.Generic;

namespace Web_Api.online.Models.ViewModels
{
    public class RegistratedUsersViewModel
    {
        public List<RegisteredUsersTableModel> RegisteredUsers { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
