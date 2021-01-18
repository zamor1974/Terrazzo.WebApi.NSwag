using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Terrazzo.WebApi.NSwag
{
    public class Piogge
    {
        public List<Pioggia> Misurazioni { get; set; }

        public Piogge()
        {
            Misurazioni = new List<Pioggia>();
        }
    }
    public class Pioggia
    {
        public long Valore { get; set; }
        public string Stato { get; set; }
    }
}
