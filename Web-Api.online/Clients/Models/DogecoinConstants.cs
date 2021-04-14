namespace Web_Api.online.Clients.Models
{
    public static class DogecoinConstants
    {
        public sealed class Constants : CoinConstants<Constants>
        {
            public readonly ushort CoinReleaseHalfsEveryXInYears = 4;
            public readonly ushort DifficultyIncreasesEveryXInBlocks = 2016;
            public readonly uint OneDogecoinInKoinus = 100000000;
            public readonly decimal OneKoinuInXDG = 0.00000001M;
            public readonly decimal OneMicrocoinInXDG = 0.000001M;
            public readonly decimal OneMillicoinInXDG = 0.001M;
            public readonly string Symbol = "Ð";
        }
    }
}
