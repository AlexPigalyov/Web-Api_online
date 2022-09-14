using System;

namespace Web_Api.online.Models.StoredProcedures
{
    public class spGetNews
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Text { get; set; }
        public DateTime Created { get; set; }
        public string AuthorId { get; set; }
        public string UserName { get; set; }
    }
}
