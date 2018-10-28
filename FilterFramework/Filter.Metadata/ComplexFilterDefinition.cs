using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Metadata
{
    public sealed class ComplexFilterDefinition : FilterDefinition
    {
        private ComplexFilterDefinition()
        {

        }
        internal static FilterDefinition And(FilterDefinition left, FilterDefinition right)
        {
            return new ComplexFilterDefinition { RightFilter = right, LeftFilter = left, FiltersConnector = Connector.And };
        }
        internal static FilterDefinition Or(FilterDefinition left, FilterDefinition right)
        {
            return new ComplexFilterDefinition { RightFilter = right, LeftFilter = left, FiltersConnector = Connector.Or };
        }

        public FilterDefinition RightFilter { get; private set; }
        public FilterDefinition LeftFilter { get; private set; }
        public Connector FiltersConnector { get; private set; }
        public enum Connector
        {
            And,
            Or
        }
        public override string ToString()
        {
            return $"( {LeftFilter} {FiltersConnector} {RightFilter} )";
        }
    }
}
