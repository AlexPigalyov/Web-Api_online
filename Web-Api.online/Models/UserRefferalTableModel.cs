using System;

namespace Web_Api.online.Models
{
    public class UserRefferalTableModel
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string ReffererId { get; set; }
    }
}
