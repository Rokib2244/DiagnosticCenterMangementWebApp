using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.DAL.Gateway
{
    public class TestNameGateway:ParentGateway
    {
        public List<TestNamesWithType> GetAllTestNames()
        {
            Query = "SELECT * FROM TestNamesWithType ORDER BY testName";
            Command=new SqlCommand(Query,Connection);
            List<TestNamesWithType> testNames=new List<TestNamesWithType>();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                TestNamesWithType testNamesWithType=new TestNamesWithType();
                testNamesWithType.Id = Convert.ToInt32(Reader["ID"]);
                testNamesWithType.Fee = Convert.ToDouble(Reader["fee"]);
                testNamesWithType.TestName = Reader["testName"].ToString();
                testNamesWithType.TestType = Reader["testType"].ToString();
                testNames.Add(testNamesWithType);
            }
            Reader.Close();
            Connection.Close();
            return testNames;

        }

        public string SaveTestName(TestName testName)
        {
            Query = "INSERT INTO TestName VALUES ('" + testName.TestTypeID + "','" + testName.Testname + "','" +
                    testName.Fee + "')";
            Command=new SqlCommand(Query,Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            if (rowAffected > 0)
            {
                return "Test Name is saved successfully.";
            }
            else
            {
                return "Test Name save is unsuccessful.";
            }
        }

        public double GetTestFee(int id)
        {

            Query = "SELECT fee FROM TestName WHERE ID=" + id;
            Command=new SqlCommand(Query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            double fee = 0;
            while (Reader.Read())
            {
               fee =Convert.ToDouble(Reader["fee"]);
            }
            Reader.Close();
            Connection.Close();
            return fee;
        }
    }
}