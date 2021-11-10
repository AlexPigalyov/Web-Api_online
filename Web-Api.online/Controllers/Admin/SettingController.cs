using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models.Constants;
using Web_Api.online.Models.StoredProcedures;
using Web_Api.online.Models.Tables;

namespace Web_Api.online.Controllers.Admin
{
    [Route("/Admin/Settings")]
    public class SettingController : Controller
    {
        private SettingRepository _settingRepository;

        public SettingController(SettingRepository settingRepository)
        {
            _settingRepository = settingRepository;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var viewModel = await _settingRepository.GetSettings();

            return View("Views/Admin/Settings.cshtml", viewModel);
        }

        [HttpPost]
        [Route("Update")]
        public async Task<IActionResult> Update([FromBody] List<spUpdateSettingArgs> model)
        {
            foreach (var setting in model)
            {
                await _settingRepository.UpdateSetting(setting);
            }

            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] SettingTableModel model)
        {
            await _settingRepository.CreateSetting(model);

            return Ok();
        }
    }
}