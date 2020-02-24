using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Gateway;
using DiagonasticCenterManagementApp.DAL.Model;

namespace DiagonasticCenterManagementApp.BLL
{
    public class TestTypeManager
    {
        TestTypeGateway testTypeGateway=new TestTypeGateway();

        public string SetName(string name)
        {
            if (name.Length > 0)
            {
                int rowAffected = testTypeGateway.SetTestType(name);
                if (rowAffected > 0)
                {
                    return "Test type added Successfully.";
                }
                else
                {
                    return "Operation Failed.";
                }
            }
            else
            {
                return "Test Type Name should not be empty.";
            }
           
        }

        public List<TestTypes> GetAllTestType()
        {
            return testTypeGateway.GetAllTestType();
        }

        public bool CheckTypeName(string typeName)
        {
            return testTypeGateway.CheckTypeName(typeName);
        }
    }
}