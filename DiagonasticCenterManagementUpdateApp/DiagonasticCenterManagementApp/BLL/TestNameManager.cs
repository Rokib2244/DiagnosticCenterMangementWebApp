using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Gateway;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.BLL
{
    public class TestNameManager
    {
        TestNameGateway testNameGateway=new TestNameGateway();
        public List<TestNamesWithType> GetAllTestNames()
        {
            return testNameGateway.GetAllTestNames();
        }

        public string SaveTestName(TestName testName)
        {
            if (testName.Testname.Length < 1)
            {
                string message = "There is no Test name";
                if (testName.Fee.ToString().Length < 1 && testName.TestTypeID<1)
                {
                    message += ", Fee and test type is not valid";
                }
                else if (testName.Fee.ToString().Length < 1 || testName.Fee<1)
                {
                    message += "and Fee is not valid.";
                }
                else if (testName.TestTypeID < 1)
                {
                    message += "and Test type is not valid.";
                }
                return message;

            }else if (testName.TestTypeID < 1)
            {
                return "Test type is not valid.";
            }
            else if (testName.Fee.ToString().Length < 1 || testName.Fee < 1)
            {
                return "Test Fee is not valid.";
            }
            else
            {
                return testNameGateway.SaveTestName(testName);
            }
        }

        public double GetTestFee(int id)
        {
            return testNameGateway.GetTestFee(id);
        }
    }
}