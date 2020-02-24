using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DiagonasticCenterManagementApp.DAL.Gateway
{
    public class ParentGateway
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["TestTypeConnection"].ToString();
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public string Query { get; set; }
        public SqlDataReader Reader { get; set; }

        public ParentGateway()
        {
            Connection = new SqlConnection(connectionString);
        }
    }
}