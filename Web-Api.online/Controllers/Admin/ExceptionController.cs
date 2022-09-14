using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories.Abstract;

namespace Web_Api.online.Controllers.Admin
{
    [Authorize(Roles = "Administrator")]
    [Route("/Admin/Exceptions")]
    public class ExceptionController : Controller
    {
        private readonly IExceptionsRepository _exceptionsRepository;
        public ExceptionController(IExceptionsRepository exceptionsRepository)
        {
            _exceptionsRepository = exceptionsRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var viewModel = await _exceptionsRepository.GetTop10000ExceptionsAsync();

            return View("Views/Admin/Exceptions.cshtml", viewModel);
        }
    }
}