using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Metadata
{
    public sealed class SimpleFilterDefinition : FilterDefinition
    {
        public SimpleFilterDefinition(string fieldName, string value, ComparesionOperator @operator)
        {
            this.FieldName = fieldName;
            this.Value = value;
            this.Operator = @operator;
        }
        public string FieldName { get; private set; }
        public string Value { get; private set; }
        public ComparesionOperator Operator { get; private set; }
        public override string ToString()
        {
            return $"{FieldName} {Operator} {Value}";
        }
    }
}
