using System.Collections.Generic;

using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.ViewModels
{
    public class ProfileViewModel
    {
        public UserInfoTableModel UserInfo { get; set; }
        public string Username { get; set; }
        public List<EventTableModel> LastThreeEvents { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public List<spGetNotEmptyValueWallet_ByUserIdResult> NotEmptyWallets { get; set; }
    }
}
