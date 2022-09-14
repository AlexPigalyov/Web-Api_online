namespace Web_Api.online.Clients.Interfaces
{
    public interface ICoinService : IRestService, ICoinParameters
    {
        public string CoinShortName { get; }
        public string CoinLongName { get; }
    }
}
