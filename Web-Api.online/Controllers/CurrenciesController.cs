using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using Web_Api.online.Repositories;

namespace Web_Api.online.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CurrenciesController : ControllerBase
    {
        public class Currencies
        {
            public string CurrencyOfMetal = "USD";
            public string Unit = "Ounce";
            public string CurrencyOfValute = "RUB";
            public Dictionary<string, double> Rates { get; set; } = new Dictionary<string, double>();
        }

        [HttpGet]
        public IActionResult GetCurrencies(string currencyOfMetal = "USD", string currencyOfValute = "USD")
        {
            var lastRates = Raterepository.GetLastRates();
            Currencies currencies = new Currencies();
            currencies.CurrencyOfMetal = currencyOfMetal;
            currencies.CurrencyOfValute = currencyOfValute;
            Dictionary<string, double> valuteCurrencies, metalCurrencies;

            Dictionary<string, double> rates = JsonConvert.DeserializeObject<Dictionary<string, double>>(lastRates.Value);

            metalCurrencies = rates.Take(4)
                .ToDictionary(x => x.Key, x => x.Value);
            valuteCurrencies = rates.Skip(5)
                .ToDictionary(x => x.Key, x => x.Value);

            if ((!valuteCurrencies.ContainsKey(currencyOfValute) && currencyOfValute != "USD") ||
                (!valuteCurrencies.ContainsKey(currencyOfMetal) && currencyOfMetal != "USD"))
            {
                return BadRequest("You entered a currency of an unknown type");
            }

            double selectedValuteCurrency = 0;
            double selectedMetalCurrency = 0;

            foreach (KeyValuePair<string, double> valuteCurrency in valuteCurrencies)
            {
                if (selectedMetalCurrency != 0 && selectedValuteCurrency != 0) break;
                else if (currencyOfMetal == "USD" && selectedValuteCurrency != 0) break;
                else if (currencyOfValute == "USD" && selectedMetalCurrency != 0) break;
                else if (currencyOfValute == "USD" && currencyOfMetal == "USD") break;

                if (valuteCurrency.Key == currencyOfMetal)
                {
                    selectedMetalCurrency = valuteCurrency.Value;
                }
                if (valuteCurrency.Key == currencyOfValute)
                {
                    selectedValuteCurrency = valuteCurrency.Value;
                }
            }

            if (currencyOfMetal != "USD")
            {
                foreach (KeyValuePair<string, double> metalCurrency in metalCurrencies)
                {
                    currencies.Rates.Add(metalCurrency.Key, Math.Round(metalCurrency.Value * selectedMetalCurrency, 5));
                }
            }
            else
            {
                currencies.Rates = metalCurrencies;
            }

            if (currencyOfValute != "USD")
            {
                foreach (KeyValuePair<string, double> valuteCurrency in valuteCurrencies)
                {
                    if (valuteCurrency.Key == currencyOfValute)
                    {
                        currencies.Rates.Add("USD", valuteCurrency.Value);
                    }
                    currencies.Rates.Add(valuteCurrency.Key, Math.Round(selectedValuteCurrency / valuteCurrency.Value, 5));
                }
            }
            else
            {
                if (!valuteCurrencies.ContainsKey("USD"))
                {
                    currencies.Rates.Add("USD", 1);
                }

                foreach (KeyValuePair<string, double> valuteCurrency in valuteCurrencies)
                {
                    currencies.Rates.Add(valuteCurrency.Key, valuteCurrency.Value);
                }
            }

            return Ok(currencies);
        }
    }
}
