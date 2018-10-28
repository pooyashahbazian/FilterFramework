using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Metadata
{
    public sealed class FilterMetadata
    {
        public string TypeName { get; set; }
        public List<FilterItemMetadata> Items { get; set; }
        public TypeCode GetTypeCodeOfField(string fieldName)
        {
            TypeCode resule = TypeCode.Empty;
            var item = Items.FirstOrDefault(x => x.FieldName == fieldName);
            if (item != null)
            {
                resule = item.Type;
            }
            return resule;
        }
    }

    public class FilterItemMetadata
    {
        public string Title { get; set; }
        public string FieldName { get; set; }
        public TypeCode Type { get; set; }
    }

}
