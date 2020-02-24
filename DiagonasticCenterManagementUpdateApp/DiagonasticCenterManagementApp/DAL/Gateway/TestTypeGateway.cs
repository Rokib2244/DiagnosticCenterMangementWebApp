using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.UI.Setup;

namespace DiagonasticCenterManagementApp.DAL.Gateway
{
    public class TestTypeGateway:ParentGateway
    {
     
        public List<TestTypes> GetAllTestType()
        {
            
            List<TestTypes> allTestTypes=new List<TestTypes>();
            Query = "SELECT * FROM TestType ORDER BY testType";
            Command=new SqlCommand(Query,Connection);
            Connection.Open();
            Reader=Command.ExecuteReader();
            while (Reader.Read())
            {
                TestTypes testTypes = new TestTypes();
                string testType = Reader["testType"].ToString();
                testTypes.TestTypeName = testType;
                testTypes.Index =Convert.ToInt32(Reader["ID"]);
                allTestTypes.Add(testTypes);
            }
            Reader.Close();
            Connection.Close();
            return allTestTypes;
        }

        public int SetTestType(string testType)
        {
            Query = "INSERT INTO TestType VALUES('" + testType + "');";
            Command=new SqlCommand(Query,Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool CheckTypeName(string typeName)
        {
            Query = "SELECT * FROM TestType WHERE testType='" + typeName + "'";
            Command=new SqlCommand(Query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool hasRows = Reader.HasRows;
            Reader.Close();
            Connection.Close();
            return hasRows;
        }
    }
}