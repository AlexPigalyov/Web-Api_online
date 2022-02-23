using System.Collections.Generic;

namespace Web_Api.online.Models.ViewModels
{
    public class UserRefferalViewModel
    {
        public List<UserRefferalTableModel> UserRefferal { get; set; }
        public List<UserRefferalTableModel> MyRefferals { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
