using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Filter.Metadata;
using System.Linq;
using System.Diagnostics.CodeAnalysis;

namespace Filter.Framework.Test
{
    
    [ExcludeFromCodeCoverage]
    [TestClass]
    public class FilterBuilderTest
    {
        [TestMethod]
        public void Test_SingleFilter()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Name", "Jack", ComparesionOperator.Equals);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(simpleFilterDefinition1);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
            Assert.IsNotNull(filterdData);
            Assert.AreEqual(filterdData.Count,2);
            Assert.IsTrue(filterdData[0].Equals(SampleData.PersonList[0]) );
            Assert.IsTrue(filterdData[1].Equals(SampleData.PersonList[3]));
        }

        [TestMethod]
        public void Test_SingleFilter_EndsWith()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Name", "n", ComparesionOperator.EndsWith);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(simpleFilterDefinition1);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
            Assert.IsNotNull(filterdData);
            Assert.AreEqual(filterdData.Count, 1);
            Assert.IsTrue(filterdData[0].Equals(SampleData.PersonList[4]));
        }

        [TestMethod]
        public void Test_SingleFilter_StartsWith()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Name", "B", ComparesionOperator.StartsWith);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(simpleFilterDefinition1);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
            Assert.IsNotNull(filterdData);
            Assert.AreEqual(filterdData.Count, 1);
            Assert.IsTrue(filterdData[0].Equals(SampleData.PersonList[4]));
        }
        [TestMethod]
        public void Test_SingleFilter_Contains()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Name", "iam", ComparesionOperator.Contains);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(simpleFilterDefinition1);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
            Assert.IsNotNull(filterdData);
            Assert.AreEqual(filterdData.Count, 1);
            Assert.IsTrue(filterdData[0].Equals(SampleData.PersonList[1]));
        }
        [TestMethod]
        public void Test_ComplexFilter_Or()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Name", "Jack", ComparesionOperator.Equals);
            var simpleFilterDefinition2 = new SimpleFilterDefinition("Birthdate", "2000/01/01", ComparesionOperator.GreaterThan);
            var cmplxFilterDefinition = simpleFilterDefinition1.Or(simpleFilterDefinition2);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(cmplxFilterDefinition);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
            Assert.IsNotNull(filterdData);
            Assert.AreEqual(filterdData.Count,4);            
            Assert.IsTrue(filterdData[0].Equals(SampleData.PersonList[0]));
            Assert.IsTrue(filterdData[1].Equals(SampleData.PersonList[1]));
            Assert.IsTrue(filterdData[2].Equals(SampleData.PersonList[3]));
            Assert.IsTrue(filterdData[3].Equals(SampleData.PersonList[4]));
        }
        [TestMethod]
        public void Test_ComplexFilter_And()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Name", "Jack", ComparesionOperator.Equals);
            var simpleFilterDefinition2 = new SimpleFilterDefinition("Birthdate", "1960/09/23", ComparesionOperator.Equals);
            var cmplxFilterDefinition = simpleFilterDefinition1.And(simpleFilterDefinition2);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(cmplxFilterDefinition);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
            Assert.IsNotNull(filterdData);
            Assert.AreEqual(filterdData.Count, 1);
            Assert.IsTrue(filterdData[0].Equals(SampleData.PersonList[3]));
        }
        [TestMethod]
        [ExpectedException(typeof(InvalidOperationException))]
        public void Test_InvalidFilter()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("LastName", "Jack", ComparesionOperator.Equals);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(simpleFilterDefinition1);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
        }

        [TestMethod]
        [ExpectedException(typeof(InvalidOperationException))]
        public void Test_InvalidFilter_BadDataFormat()
        {
            var simpleFilterDefinition1 = new SimpleFilterDefinition("Birthdate", "JunkData", ComparesionOperator.Equals);
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(simpleFilterDefinition1);
            var filterdData = SampleData.PersonList.Where(expFilter.Compile()).ToList();
        }
        [TestMethod]
        public void Test_InvalidFilter_Null()
        {
            var expFilter = FilterBuilder.CreateFilterExpression<Person>(null);
            Assert.IsNull(expFilter);
        }
    }
}