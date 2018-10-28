using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Filter.Metadata
{
    [AttributeUsage(AttributeTargets.Property, Inherited = false, AllowMultiple = false)]
    public sealed class FilterParticipatedAttribute : Attribute
    {
        public FilterParticipatedAttribute(string title)
        {
            this.Title = title;
        }
        public string Title { get; private set; }
    }
}

