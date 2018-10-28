using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
namespace Filter.Framework.Specification
{
    public abstract class Specification<T>
    {

        public abstract Expression<Func<T, bool>> ToExpression();


        public Specification<T> And(Specification<T> specification)
        {
            return new AndSpecification<T>(this, specification);
        }


        public Specification<T> Or(Specification<T> specification)
        {
            return new OrSpecification<T>(this, specification);
        }
    }




}
