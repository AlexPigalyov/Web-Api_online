using System.Collections.Generic;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class UserRefferalViewModel
    {
        public UserInfoTableModel UserInfo { get; set; }
        public List<UserRefferalTableModel> UserRefferal { get; set; }
        public List<UserRefferalTableModel> MyRefferals { get; set; }
        public PageViewModel PageViewModel { get; set; }
    }
}
