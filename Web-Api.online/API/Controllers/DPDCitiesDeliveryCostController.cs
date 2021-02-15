using System;
using System.Threading.Tasks;
using Web_Api.online.Repositories;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Models;

namespace Web_Api.online.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DPDCitiesDeliveryCostController : ControllerBase
    {
        private readonly DPDCalc.DPDCalculatorClient _calcClient;
        public DPDCitiesDeliveryCostController()
        {
            _calcClient = new DPDCalc.DPDCalculatorClient();
        }
        [HttpPost]
        public async Task<IActionResult> Index([FromBody] DPDCalcRequestModel request)
        {
            try
            {
                var deliveryCity = await DpdCityRepository.GetDPDCityAsync(request.DeliveryCityName);
                var pickupCity = await DpdCityRepository.GetDPDCityAsync(request.PickupCityName);

                var serviceCosts = await _calcClient.getServiceCost2Async(new DPDCalc.serviceCostRequest()
                {
                    auth = new DPDCalc.auth()
                    {
                        clientKey = request.ClientKey,
                        clientNumber = request.ClientNumber
                    },
                    delivery = new DPDCalc.cityRequest()
                    {
                        cityId = deliveryCity.FirstOrDefault().cityId,
                        cityIdSpecified = true,
                    },
                    pickup = new DPDCalc.cityRequest()
                    {
                        cityId = pickupCity.FirstOrDefault().cityId,
                        cityIdSpecified = true,
                    },
                    declaredValue = request.DeclaredValue,
                    selfDelivery = request.SelfDelivery,
                    selfPickup = request.SelfPickup,
                    weight = request.Weight
                });

                return Ok(serviceCosts);
            }
            catch (Exception exc)
            {
                return BadRequest(exc.Message);
            }

        }
    }
}
