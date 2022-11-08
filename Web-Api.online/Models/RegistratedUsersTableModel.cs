using System;

namespace Web_Api.online.Models.ViewModels
{
    public class RegisteredUsersTableModel
    {
        public int Number { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public DateTime RegistrationDate { get; set; }
    }
}
