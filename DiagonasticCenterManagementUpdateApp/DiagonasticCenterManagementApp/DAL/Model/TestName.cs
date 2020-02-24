using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagonasticCenterManagementApp.DAL.Model
{
    public class TestName
    {
        public int ID { get; set; }
        public int TestTypeID { get; set; }
        public string Testname { get; set; }
        public double Fee { get; set; }

    }
}