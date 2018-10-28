using Filter.Framework.Specification;
using Filter.Metadata;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Filter.Framework
{
    public static class FilterBuilder
    {
        public static Expression<Func<T, bool>> CreateFilterExpression<T>(FilterDefinition filterdata)
        {
            if (filterdata == null)
            {
                return null;
            }
            var metadata = FilterMetadataExtractor.ExtractMetadata<T>();

            DoValidationProcess(filterdata, metadata);
            var spec = CreateExpression<T>(filterdata, metadata);
            return spec.ToExpression();
        }

        private static void DoValidationProcess(FilterDefinition filterdata,FilterMetadata metadata)
        {
            List<SimpleFilterDefinition> simpleFilters = new List<SimpleFilterDefinition>();
            ExtractAllSimpleFilterData(filterdata, ref simpleFilters);
            foreach (var filter in simpleFilters)
            {
                bool isValidField = false;
                foreach (var item in metadata.Items)
                {
                    if (filter.FieldName == item.FieldName)
                    {
                        try
                        {
                            Convert.ChangeType(filter.Value, item.Type);
                            isValidField = true;
                        }
                        catch
                        {
                            isValidField = false;
                            break;

                        }
                    }
                }
                if (!isValidField)
                {
                    throw new InvalidOperationException($"Invalid filter has been  applyed to {metadata.TypeName} Filter: {filter}");
                }
            }
        }

        private static void ExtractAllSimpleFilterData(FilterDefinition filterdata, ref List<SimpleFilterDefinition> result)
        {
            if (filterdata is SimpleFilterDefinition)
            {
                result.Add(filterdata as SimpleFilterDefinition);
            }
            else if (filterdata is ComplexFilterDefinition)
            {
                var complexfilterData = filterdata as ComplexFilterDefinition;
                ExtractAllSimpleFilterData(complexfilterData.LeftFilter, ref result);
                ExtractAllSimpleFilterData(complexfilterData.RightFilter, ref result);
            }

        }

        private static Specification<T> CreateExpression<T>(FilterDefinition filterdata, FilterMetadata metadata)
        {
            Specification<T> spec = null;
            if (filterdata is SimpleFilterDefinition)
            {
                var data = filterdata as SimpleFilterDefinition;
                spec = new FieldSpecification<T>(data,metadata.GetTypeCodeOfField(data.FieldName));
            }
            else if (filterdata is ComplexFilterDefinition)
            {
                var data = filterdata as ComplexFilterDefinition;
                if (data.FiltersConnector == ComplexFilterDefinition.Connector.And)
                {
                    spec = new AndSpecification<T>(CreateExpression<T>(data.LeftFilter, metadata), CreateExpression<T>(data.RightFilter, metadata));
                }
                else
                {
                    spec = new OrSpecification<T>(CreateExpression<T>(data.LeftFilter, metadata), CreateExpression<T>(data.RightFilter, metadata));
                }
            }
            return spec;
        }
    }

}
