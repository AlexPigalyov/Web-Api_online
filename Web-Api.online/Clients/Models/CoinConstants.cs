using System;

namespace Web_Api.online.Clients.Models
{
    public abstract class CoinConstants<T> where T : CoinConstants<T>, new()
    {
        private static readonly Lazy<T> Lazy = new Lazy<T>(() => new T());
        public static T Instance => Lazy.Value;
    }
}
