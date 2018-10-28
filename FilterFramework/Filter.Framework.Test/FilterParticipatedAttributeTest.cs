using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Filter.Metadata;
using System.Diagnostics.CodeAnalysis;

namespace Filter.Framework.Test
{
    [ExcludeFromCodeCoverage]
    [TestClass]
    public class FilterParticipatedAttributeTest
    {
        [TestMethod]
        public void Test_FilterMetadataExtractor()
        {

            var searchMetadata = FilterMetadataExtractor.ExtractMetadata<Person>();
            Assert.IsNotNull(searchMetadata);
            Assert.AreEqual(searchMetadata.TypeName, typeof(Person).FullName);
            Assert.AreEqual(searchMetadata.Items.Count,2);
            Assert.AreEqual(searchMetadata.Items[0].FieldName, "Name");
            Assert.AreEqual(searchMetadata.Items[0].Type, TypeCode.String);
            Assert.AreEqual(searchMetadata.Items[0].Title, "Person name");

            Assert.AreEqual(searchMetadata.Items[1].FieldName, "Birthdate");
            Assert.AreEqual(searchMetadata.Items[1].Type, TypeCode.DateTime);
            Assert.AreEqual(searchMetadata.Items[1].Title, "Birth date");
        }

        [TestMethod]
        public void Test_GetTypeCodeOfField()
        {

            var searchMetadata = FilterMetadataExtractor.ExtractMetadata<Person>();
            Assert.IsNotNull(searchMetadata);
            Assert.AreEqual(searchMetadata.TypeName, typeof(Person).FullName);
            Assert.AreEqual(searchMetadata.Items.Count, 2);
            Assert.AreEqual(searchMetadata.Items[0].FieldName, "Name");
            Assert.AreEqual(searchMetadata.Items[0].Type, TypeCode.String);
            Assert.AreEqual(searchMetadata.Items[0].Title, "Person name");

            Assert.AreEqual(searchMetadata.Items[1].FieldName, "Birthdate");
            Assert.AreEqual(searchMetadata.Items[1].Type, TypeCode.DateTime);
            Assert.AreEqual(searchMetadata.Items[1].Title, "Birth date");

            var name_typecode=searchMetadata.GetTypeCodeOfField("Name");
            Assert.AreEqual(name_typecode, TypeCode.String);
            var birthdate_typecode = searchMetadata.GetTypeCodeOfField("Birthdate");
            Assert.AreEqual(birthdate_typecode, TypeCode.DateTime);
        }
      
    }

}
