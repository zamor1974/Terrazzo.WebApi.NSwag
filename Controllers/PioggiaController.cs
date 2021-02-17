using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Terrazzo.WebApi.NSwag.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PioggiaController : ControllerBase
    {
        [HttpGet]
        public Int64 Get()
        {
            return 125;
            //var databaseHelper = new DatabaseHelper();
            //var pioggia = databaseHelper.GetPioggiaAdesso();
            //return pioggia.Valore;
        }
    }
}
