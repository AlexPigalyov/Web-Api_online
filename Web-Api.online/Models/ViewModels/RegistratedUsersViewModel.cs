using System.Collections.Generic;

namespace Web_Api.online.Models.ViewModels
{
    public class RegistratedUsersViewModel
    {
        public List<RegistratedUsersTableModel> RegistratedUsers { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
