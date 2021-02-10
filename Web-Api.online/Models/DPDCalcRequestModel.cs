namespace Web_Api.online.Models
{
    public class DPDCalcRequestModel
    {
        public string ClientKey { get; set; }
        public long ClientNumber { get; set; }
        public string DeliveryCityName { get; set; }
        public string PickupCityName { get; set; }
        public bool SelfPickup { get; set; }
        public bool SelfDelivery { get; set; }
        public double DeclaredValue { get; set; }
        public double Weight { get; set; }
    }
}
