using Filter.Metadata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Framework.Specification
{
    internal static class StringMethods
    {
        public readonly static MethodInfo ContainsMethod = typeof(string).GetMethod("Contains", new[] { typeof(string) });
        public readonly static MethodInfo StartsWithMethod = typeof(string).GetMethod("StartsWith", new[] { typeof(string) });
        public readonly static MethodInfo EndsWithMethod = typeof(string).GetMethod("EndsWith", new[] { typeof(string) });

    }
    public sealed class FieldSpecification<T> : Specification<T>
    {
        readonly SimpleFilterDefinition data;
        readonly TypeCode typeCode;
        public FieldSpecification(SimpleFilterDefinition data,TypeCode typeCode)
        {
            this.data = data;
            this.typeCode= typeCode;
        }        
        public override Expression<Func<T, bool>> ToExpression()
        {
            return Translate();
        }



          
        public Expression<Func<T, bool>> Translate()
        {
            ParameterExpression param = Expression.Parameter(typeof(T), "parm");
            Expression cmpExpression = null;
            MemberExpression member = Expression.Property(param, data.FieldName);
            Type type = Type.GetType("System." + typeCode);
            ConstantExpression constant = Expression.Constant(Convert.ChangeType(data.Value, typeCode), type);            


            switch (data.Operator)
            {
                case ComparesionOperator.Equals:
                    cmpExpression = Expression.Equal(member, constant);
                    break;
                case ComparesionOperator.Contains:
                    cmpExpression = Expression.Call(member, StringMethods.ContainsMethod, constant);
                    break;
                case ComparesionOperator.GreaterThan:
                    cmpExpression = Expression.GreaterThan(member, constant);
                    break;
                case ComparesionOperator.GreaterThanOrEqual:
                    cmpExpression = Expression.GreaterThanOrEqual(member, constant);
                    break;
                case ComparesionOperator.LessThan:
                    cmpExpression = Expression.LessThan(member, constant);
                    break;
                case ComparesionOperator.LessThanOrEqualTo:
                    cmpExpression = Expression.LessThanOrEqual(member, constant);
                    break;
                case ComparesionOperator.StartsWith:
                    cmpExpression = Expression.Call(member, StringMethods.StartsWithMethod, constant);
                    break;
                case ComparesionOperator.EndsWith:
                    cmpExpression = Expression.Call(member, StringMethods.EndsWithMethod, constant);
                    break;
            }
            Expression<Func<T, bool>> result = null;
            if (cmpExpression != null)
            {
                result = Expression.Lambda<Func<T, bool>>(cmpExpression, param);
            }
            return result;
        }
    }
}
