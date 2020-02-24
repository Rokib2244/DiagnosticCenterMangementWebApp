using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Gateway;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.BLL
{
    public class TestWiseReportManager
    {
        TestWiseReportGateway aTestWiseReportGateway = new TestWiseReportGateway();
        public List<TestWiseVM> GetAllTestInfo(List<string> testNames,DateTime fromDate,DateTime toDate)
        {
            return aTestWiseReportGateway.GetAllTestInfo(testNames,fromDate,toDate);
        }
    }
}