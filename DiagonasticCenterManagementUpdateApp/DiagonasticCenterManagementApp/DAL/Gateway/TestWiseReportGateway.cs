using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.DAL.Gateway
{
    public class TestWiseReportGateway:ParentGateway
    {


        public List<TestWiseVM> GetAllTestInfo(List<string> testNames,DateTime fromDate,DateTime toDate)
        {
            List<TestWiseVM> testWise=new List<TestWiseVM>();
            foreach (string testName in testNames)
            {
                TestWiseVM test=new TestWiseVM();
                int row = 0;
                Query = "SELECT * FROM TestWiseReport WHERE testName='" + testName + "' AND dueDate>='"+fromDate+"' AND dueDate<='"+toDate+"';";
                Command=new SqlCommand(Query,Connection);
                Connection.Open();
                //Connection.Close();
                //Command=new SqlCommand(Query,Connection);
                //Connection.Open();
                
                Reader = Command.ExecuteReader();
                test.TestName = testName;
                while (Reader.Read())
                {
                    row++;
                    test.TestFee = Convert.ToDouble(Reader["fee"]);
                }
                //Query = "SELECT COUNT(*) AS row FROM TestWiseReport WHERE testName='" + testName + "' AND dueDate>='" + fromDate + "' AND dueDate<='" + toDate + "';";
                //Command=new SqlCommand(Query,Connection);
                //Reader = Command.ExecuteReader();
                //while (Reader.Read())
                //{
                //    test.TotalTest = Convert.ToInt32(Reader["row"]);
                //}
                test.TotalTest = row;
                test.TotalAmount = test.TotalTest*test.TestFee;
                testWise.Add(test);
                Reader.Close();
                Connection.Close();
            }

            return testWise;
        }
    }
}