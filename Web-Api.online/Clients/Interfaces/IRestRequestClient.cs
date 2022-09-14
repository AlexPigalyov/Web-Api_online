using Web_Api.online.Clients.Models;

namespace Web_Api.online.Clients.Interfaces
{
    public interface IRestRequestClient
    {
        T MakeRequest<T>(RestMethods method, params object[] parameters);
    }
}
