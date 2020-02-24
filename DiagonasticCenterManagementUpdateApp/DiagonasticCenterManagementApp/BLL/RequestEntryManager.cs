using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Gateway;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.BLL
{
    
    public class RequestEntryManager
    {
        RequestEntryGateway aRequestEntryGateway =new RequestEntryGateway();


        public string SavePatientInfo(Patient aPatient)
        {
            int hasRowAffected;

            hasRowAffected = aRequestEntryGateway.SavePatientInfo(aPatient);

            if (hasRowAffected < 1)
            {
                return "Error";
            }
            else
            {
                return "Saved";
            }
        }

        public int GetBillNo()
        {
            Random aRandom =new Random();
            int number = aRandom.Next(10, 10000000);
            while (aRequestEntryGateway.GetBillNo( number = aRandom.Next(10, 1000000))==1)
            {
            }

            return number;
        }

        public int ChackPhoneNumber(string phoneNumber)
        {
           
           return aRequestEntryGateway.CheckPhoneNumber(phoneNumber);
        }

        public string SaveAllEntries(List<TestNamesWithType> testNames,int patientID)
        {
            int rowAffected=aRequestEntryGateway.SaveAllEntries(testNames,patientID);
            if (rowAffected == testNames.Count)
            {
                return "All Entries Saved.";
            }
            else
            {
                return "All Entry unsuccessful.";
            }
        }

        public int GetPatientID(string phoneNumber)
        {
            return aRequestEntryGateway.GetPatientID(phoneNumber);
        }

        
    }
}