using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Framework.Specification
{
    internal class ParameterReplacer : ExpressionVisitor
    {

        private readonly ParameterExpression parameter;

        protected override Expression VisitParameter(ParameterExpression node) => base.VisitParameter(parameter);

        internal ParameterReplacer(ParameterExpression parameter)
        {
            this.parameter = parameter;
        }
    }
}
