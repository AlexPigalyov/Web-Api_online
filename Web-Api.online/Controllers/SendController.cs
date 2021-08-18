using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Web_Api.online.Clients;
using Web_Api.online.Clients.Interfaces;
using Web_Api.online.Models.Tables;
using Web_Api.online.Repositories;

namespace Web_Api.online.Controllers
{
    public class SendController : Controller
    {
        private WalletsRepository _walletsRepository;
        private ILitecoinService _litecoinService;
        public IndexModel model { get; set; }

        public class IndexModel
        {
            public string Status { get; set; }
            public decimal AmountMin { get; set; }
            public decimal Commission { get; set; }

            [Required]
            public string Currency { get; set; }
            [Required]
            public string Address { get; set; }
            [Required]
            public string Amount { get; set; }
        }

        public SendController(WalletsRepository walletsRepository,
            ILitecoinService litecoinService)
        {
            model = new IndexModel();
            _walletsRepository = walletsRepository;
            _litecoinService = litecoinService;
        }

        [HttpGet]
        public IActionResult LTC()
        {
            model.Currency = "LTC";
            model.AmountMin = 777;
            model.Commission = 777;
            return View(model);
        }

        [HttpPost]
        public IActionResult LTC(IndexModel indexModel)
        {

            if(ModelState.IsValid)
            {
                try
                {
                    decimal _amount = Convert.ToDecimal(indexModel.Amount);
                    _litecoinService.SendToAddress(indexModel.Address, _amount, "", "", true);
                    indexModel.Status = "success";
                }
                catch
                {
                    indexModel.Status = "error";
                    return View(indexModel);
                }

            }
            return View(nameof(LTC), indexModel);
        }
    }
}
