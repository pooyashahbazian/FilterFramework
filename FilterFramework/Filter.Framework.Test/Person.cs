using Filter.Metadata;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Framework.Test
{
    [ExcludeFromCodeCoverage]

    public class Person
    {
        [FilterParticipated("Person name")]
        public string Name { get; set; }
        [FilterParticipated("Birth date")]
        public DateTime Birthdate { get; set; }
        public string LastName { get; set; }
        public override bool Equals(object obj)
        {
            bool areEqual = false;
            var prs = obj as Person;
            if (prs != null)
            {
                areEqual = this.Birthdate == prs.Birthdate&&this.LastName==prs.LastName&&this.LastName==prs.LastName;
            }
            return areEqual;
        }
        public override int GetHashCode()
        {
            return this.Name.GetHashCode()&this.LastName.GetHashCode()&this.Birthdate.GetHashCode();
        }
    }
    [ExcludeFromCodeCoverage]

    public static class SampleData
    {
        public static List<Person> PersonList = new List<Person>
        {
            new Person { Name="Jack",Birthdate=new DateTime(1980,1,1), LastName="Smith"},
            new Person { Name="Liam",Birthdate=new DateTime(2000,11,5), LastName="Johnson"},
            new Person { Name="Noah",Birthdate=new DateTime(1980,7,13), LastName="Brown"},
            new Person { Name="Jack",Birthdate=new DateTime(1960,9,23), LastName="Miller"},
            new Person { Name="Benjamin",Birthdate=new DateTime(2013,10,7), LastName="Mike"},
        };

    }

}
