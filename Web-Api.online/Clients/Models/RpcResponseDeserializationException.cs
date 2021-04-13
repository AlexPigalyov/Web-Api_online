using System;

namespace Web_Api.online.Clients.Models
{
    [Serializable]
    public class RpcResponseDeserializationException : Exception
    {
        public RpcResponseDeserializationException()
        {
        }

        public RpcResponseDeserializationException(string customMessage) : base(customMessage)
        {
        }

        public RpcResponseDeserializationException(string customMessage, Exception exception) : base(customMessage, exception)
        {
        }
    }
}
