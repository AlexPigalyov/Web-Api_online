using System;
using System.Threading.Tasks;
using Web_Api.online.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Web_Api.online.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AllCitiesController : ControllerBase
    {
        // GET: top 10 DPD cities
        [HttpGet]
        public async Task<IActionResult> Get(string text = null)
        {
            try
            {
                return Ok(await DpdCityRepository.GetDPDCityAsync(text));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
