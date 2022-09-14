using System;

namespace Web_Api.online.Models.ViewModels
{
    public class RegistratedUsersTableModel
    {
        public int Number { get; set; }
        public string Email { get; set; }
        public string FullName { get; set; }
        public DateTime RegistrationDate { get; set; }
    }
}
