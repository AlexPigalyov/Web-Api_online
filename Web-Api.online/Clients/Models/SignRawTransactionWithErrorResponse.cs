using System.Collections.Generic;

namespace Web_Api.online.Clients.Models
{
	public class SignRawTransactionWithErrorResponse : SignRawTransactionResponse
	{
		public List<SignRawTransactionError> Errors { get; set; }
	}
}
