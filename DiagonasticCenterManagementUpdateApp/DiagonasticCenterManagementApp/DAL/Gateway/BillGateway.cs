using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Model;

namespace DiagonasticCenterManagementApp.DAL.Gateway
{
    public class BillGateway:ParentGateway
    {
        public Patient GetBillInfoByBillNo(int billNo)
        {
            Query = "SELECT * FROM Patients WHERE billNo = " + billNo;
            Command=new SqlCommand(Query,Connection);
            Patient patient=new Patient();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                //patient.BillNo = Convert.ToInt32(Reader["billNo"]);
                patient.TotalFee = Convert.ToInt32(Reader["totalFee"]);
                patient.DueDate = (DateTime)Reader["dueDate"];
            }
            Reader.Close();
            Connection.Close();
            return patient;

        }

        public Patient GetBillInfoByMobileNo(string mobileNumber)
        {
            Query = "SELECT * FROM Patients WHERE phoneNumber = '" +mobileNumber+"'";
            Command = new SqlCommand(Query, Connection);
            Patient patient = new Patient();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                patient.PhoneNumber = Reader["phoneNumber"].ToString();
                patient.TotalFee = Convert.ToInt32(Reader["totalFee"]);
                patient.DueDate = (DateTime)Reader["dueDate"];
            }
            Reader.Close();
            Connection.Close();
            return patient;
        }

        public string UpdateBillInformation(string phoneNumber)
        {
            Query = "UPDATE Patients SET totalFee=0 WHERE phoneNumber='" + phoneNumber + "'";
            Command=new SqlCommand(Query,Connection);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            if (rowAffected > 0)
            {
                return "Bill Paid.";
            }
            else
            {
                return "Operation Unsuccessful.";
            }
        }

        public List<Patient> GetUnpaidBillInfo(DateTime fromDate, DateTime toDate)
        {
            Query = "SELECT * FROM Patients WHERE totalFee>0 AND dueDate>='" + fromDate + "' AND dueDate <= '" + toDate +
                    "'";
            Command=new SqlCommand(Query,Connection);
            List<Patient> patients=new List<Patient>();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Patient patient=new Patient();
                patient.BillNo =Convert.ToInt32(Reader["billNo"]);
                patient.PhoneNumber = Reader["phoneNumber"].ToString();
                patient.Name = Reader["name"].ToString();
                patient.TotalFee =Convert.ToDouble(Reader["totalFee"]);
                patients.Add(patient);
            }
            Reader.Close();
            Connection.Close();
            return patients;
        }
    }
}