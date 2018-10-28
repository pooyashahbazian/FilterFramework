using Filter.Metadata;
using Filter.Sample.Backend;
using Filter.Sample.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FilterSample
{
    class Program
    {
        static void Main(string[] args)
        {
            var filter1= new Filter.Metadata.SimpleFilterDefinition("Name", "TV", Filter.Metadata.ComparesionOperator.Contains);
            var filter2 = new Filter.Metadata.SimpleFilterDefinition("ProductionDate", "2011/01/01", Filter.Metadata.ComparesionOperator.GreaterThan);
            var filter3 = filter1.Or(filter2);
            var data =Controller.LoadProducts(filter3);
            foreach (var item in data)
            {
                Console.WriteLine(item);
            }
            Console.ReadLine();
            
        }
    }
}
