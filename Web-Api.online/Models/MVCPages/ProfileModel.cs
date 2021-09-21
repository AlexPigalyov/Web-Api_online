using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Web_Api.online.Models.Tables;

namespace Web_Api.online.Models.MVCPages
{
    public class ProfileModel
    {
        public UsersInfo UserInfo { get; set; }
        public List<Events> LastThreeEvents { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}
