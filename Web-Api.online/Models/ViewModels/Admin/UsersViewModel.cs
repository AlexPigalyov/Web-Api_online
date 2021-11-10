using System.Collections.Generic;

namespace Web_Api.online.Models.ViewModels
{
    public class UsersViewModel
    {
        public List<spGetUsers_PagedSettings> Users { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
