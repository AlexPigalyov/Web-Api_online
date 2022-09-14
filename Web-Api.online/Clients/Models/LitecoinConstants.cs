namespace Web_Api.online.Clients.Models
{
    public static class LitecoinConstants
    {
        public sealed class Constants : CoinConstants<Constants>
        {
            public readonly ushort CoinReleaseHalfsEveryXInYears = 4;
            public readonly ushort DifficultyIncreasesEveryXInBlocks = 2016;
            public readonly uint OneLitecoinInLitetoshis = 100000000;
            public readonly decimal OneLitetoshiInLTC = 0.00000001M;
            public readonly decimal OneMicrocoinInLTC = 0.000001M;
            public readonly decimal OneMillicoinInLTC = 0.001M;
            public readonly string Symbol = "Ł";
        }
    }
}
