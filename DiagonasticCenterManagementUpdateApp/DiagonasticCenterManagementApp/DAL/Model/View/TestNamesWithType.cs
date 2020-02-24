using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagonasticCenterManagementApp.DAL.Model.View
{
    [Serializable]
    public class TestNamesWithType
    {
        public int Id { get; set; }
        public string TestName { get; set; }
        public string TestType { get; set; }
        public double Fee { get; set; }
    }
}