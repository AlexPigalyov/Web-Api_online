using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.ViewModels;

namespace Web_Api.online.Controllers.Admin
{
    [Route("/Admin/Exceptions")]
    public class ExceptionController : Controller
    {
        private readonly ExceptionsRepository _exceptionsRepository;
        public ExceptionController(ExceptionsRepository exceptionsRepository)
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