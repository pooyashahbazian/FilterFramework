using Filter.Framework;
using Filter.Framework.Specification;
using Filter.Metadata;
using Filter.Sample.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Sample.Backend
{
    public static class Controller
    {
        public static  IEnumerable<Product> LoadProducts(FilterDefinition filterdata)
        {
            IEnumerable<Product> result = null;            
            if (filterdata == null)
            {
                result = products;
            }
            else
            {                
                var filter = FilterBuilder.CreateFilterExpression<Product>(filterdata).Compile();
                result = products.Where(filter).ToList();
            }
            return result;
        }



        #region sampleData
        static List<Product> products = new List<Product>
        {
            new Product{Company="LG",ProductionDate=new DateTime(2017,12,1),Name="TV QOLED",Price=200  },
            new Product{Company="LG",ProductionDate=new DateTime(2016,1,1),Name="DVD Player",Price=80  },
            new Product{Company="LG",ProductionDate=new DateTime(2008,8,23),Name="Digital Receiver",Price=55  },
            new Product{Company="LG",ProductionDate=new DateTime(2011,7,18),Name="Sound bar",Price=79  },
        };
        #endregion sampleData
    }
}
