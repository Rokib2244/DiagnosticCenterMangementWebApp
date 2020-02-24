using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.DAL.Gateway
{
    public class RequestEntryGateway:ParentGateway
    {
        public int SavePatientInfo(Patient aPatient)
        {

            Query = "INSERT INTO Patients VALUES ('" + aPatient.Name + "','" + aPatient.BirthDate + "','" +
                aPatient.PhoneNumber+"','"+aPatient.TotalFee+"','"+aPatient.BillNo+"','"+aPatient.DueDate+"')";
            Command =new SqlCommand(Query,Connection);

            Connection.Open();

            int hasRowAffected = Command.ExecuteNonQuery();

            Connection.Close();

            return hasRowAffected;

        }

        public int GetBillNo(int number)
        {
            Query = "SELECT * FROM Patients WHERE billNo =" + number;
            Command = new SqlCommand(Query,Connection);
            int rowAffected;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.Read())
            {
                rowAffected = 1;
            }
            else
            {
                rowAffected = 0;
            }
            

            Reader.Close();
            Connection.Close();

            return rowAffected; 
        }

        public int CheckPhoneNumber(string phoneNumber)
        {
            Query = "SELECT * FROM Patients WHERE phoneNumber ='"+phoneNumber+"'";
            Command = new SqlCommand(Query, Connection);
            int rowAffected;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.Read())
            {
                rowAffected = 1;
            }
            else
            {
                rowAffected = 0;
            }
            
            Reader.Close();
            Connection.Close();
            return rowAffected;

        }

        public int SaveAllEntries(List<TestNamesWithType> testNames,int patientID)
        {
            int rowAffected = 0;
            foreach (TestNamesWithType testName in testNames)
            {
                Query = "INSERT INTO AllPatientEntries VALUES("+patientID+",'"+testName.Id+"',"+testName.Fee+")";
                Command=new SqlCommand(Query,Connection);
                Connection.Open();
                rowAffected += Command.ExecuteNonQuery();
                Connection.Close();
            }
            return rowAffected;
        }

        public int GetPatientID(string phoneNumber)
        {
            Query = "SELECT ID FROM Patients WHERE phoneNumber='" + phoneNumber + "'";
            Command=new SqlCommand(Query,Connection);
            int id=0;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                id = Convert.ToInt32(Reader["ID"]);
            }
            Reader.Close();
            Connection.Close();
            return id;
        }

    }
}