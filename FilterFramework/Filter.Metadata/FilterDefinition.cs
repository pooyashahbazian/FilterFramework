using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Metadata
{
    public abstract class FilterDefinition
    {
        protected FilterDefinition()
        {

        }        
        public FilterDefinition And(FilterDefinition right)
        {
            return ComplexFilterDefinition.And(this, right);
        }
        public FilterDefinition Or(FilterDefinition right)
        {
            return ComplexFilterDefinition.Or(this, right);
        }
    }
 


}
