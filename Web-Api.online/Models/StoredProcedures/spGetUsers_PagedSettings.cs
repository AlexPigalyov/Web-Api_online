using System;

namespace Web_Api.online.Models
{
    public class spGetUsers_PagedSettings
    {
        public string UserName { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string Location { get; set; }    
    }
}
