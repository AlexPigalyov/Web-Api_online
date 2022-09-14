using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Web_Api.online.Clients.Models
{
    public class Hashing
    {
        public static string GetSha256(string text)
        {
            return new SHA256Managed().ComputeHash(Encoding.UTF8.GetBytes(text)).Aggregate(string.Empty, (current, x) => current + $"{x:x2}");
        }
    }
}
