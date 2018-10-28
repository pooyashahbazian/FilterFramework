using Filter.Metadata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Sample.Model
{
    public sealed class Product
    {
        [FilterParticipated("Prouct Name")]
        public string Name { get; set; }
        [FilterParticipated("Price")]
        public int Price { get; set; }
        [FilterParticipated("Production Date")]
        public DateTime ProductionDate { get; set; }

        public string Company { get; set; }

        public override string ToString()
        {
            return $"Company: {Company} Name: {Name} Price: {Price} ProductionDate: {ProductionDate.Date}"; 
        }
    }
}
