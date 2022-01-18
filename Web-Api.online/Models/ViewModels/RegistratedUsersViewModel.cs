using System;

namespace Web_Api.online.Models.ViewModels
{
    public class RegistratedUsersViewModel
    {
        public string Email { get; set; }
        public string FullName { get; set; }
        public DateTime RegistrationDate { get; set; }
    }
}
