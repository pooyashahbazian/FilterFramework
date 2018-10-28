using Filter.Metadata;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Metadata
{
    public static class FilterMetadataExtractor
    {
        static ConcurrentDictionary<string, FilterMetadata> extractedData = new ConcurrentDictionary<string, FilterMetadata>();
        public static FilterMetadata ExtractMetadata<T>()
        {
            FilterMetadata metadata = null;
            var typeName = typeof(T).FullName;
            if (extractedData.ContainsKey(typeName))
            {
                metadata = extractedData[typeName];
            }
            else
            {
                metadata = DoExtractProcess(typeof(T));
                extractedData.TryAdd(typeName, metadata);
            }
            return metadata;
        }

        private static FilterMetadata DoExtractProcess(Type type)
        {
            List<FilterItemMetadata> items = new List<FilterItemMetadata>();
            var properties = type.GetProperties();
            foreach (var prop in properties)
            {
                var attribute = prop.GetCustomAttributes(typeof(FilterParticipatedAttribute), false);
                if (attribute.Length>0)
                {
                    FilterItemMetadata searchItem = new FilterItemMetadata();
                    searchItem.FieldName = prop.Name;
                    searchItem.Type = Type.GetTypeCode(prop.PropertyType);
                    searchItem.Title = (attribute[0] as FilterParticipatedAttribute).Title;
                    items.Add(searchItem);
                }
            }
            FilterMetadata metadta = null;
            if (items.Any())
            {
                metadta = new FilterMetadata();
                metadta.TypeName = type.FullName;
                metadta.Items = items;
            }
            return metadta;
        }
    }
}
