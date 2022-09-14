namespace Web_Api.online.Clients.Models
{
	public class MasternodeResponse
	{
		public string Address { get; set; }
		public string Payee { get; set; }
		public string Status { get; set; }
		public int Protocol { get; set; }
		public int LastSeen { get; set; }
		public int ActiveSeconds { get; set; }
		public int LastPaidTime { get; set; }
		public int LastPaidBlock { get; set; }
	}
}
