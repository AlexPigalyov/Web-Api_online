namespace Web_Api.online.Models
{
    public class SortModel
    {
        public string ColumnName { get; set; }
        public string SearchString { get; set; }
        public int Page { get; set; } = 1;
        public bool OrderBy { get; set; } = true;
    }
}