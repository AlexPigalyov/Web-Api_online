using System;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;

using Web_Api.online.Data.Repositories;

namespace Web_Api.online.API.Controllers
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
