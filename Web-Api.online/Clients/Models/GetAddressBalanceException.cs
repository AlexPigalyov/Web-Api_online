using System;

namespace Web_Api.online.Clients.Models
{
    [Serializable]
    public class GetAddressBalanceException : Exception
    {
        public GetAddressBalanceException()
        {
        }

        public GetAddressBalanceException(string customMessage) : base(customMessage)
        {
        }

        public GetAddressBalanceException(string customMessage, Exception exception) : base(customMessage, exception)
        {
        }
    }
}
