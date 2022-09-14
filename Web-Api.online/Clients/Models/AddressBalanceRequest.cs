using System.Collections.Generic;
using Newtonsoft.Json;

namespace Web_Api.online.Clients.Models
{
	public class AddressBalanceRequest
	{
		[JsonProperty("addresses")]
		public List<string> Addresses { get; set; }
	}
}
