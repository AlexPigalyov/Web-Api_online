using System;

namespace Web_Api.online.Models.Tables
{
    public class SettingTableModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Value { get; set; }
        public DateTime LastUpdateDateTime { get; set; }
    }
}
