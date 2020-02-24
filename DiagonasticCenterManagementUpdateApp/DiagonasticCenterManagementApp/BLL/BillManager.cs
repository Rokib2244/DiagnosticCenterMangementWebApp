using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagonasticCenterManagementApp.DAL.Gateway;
using DiagonasticCenterManagementApp.DAL.Model;

namespace DiagonasticCenterManagementApp.BLL
{
    
    public class BillManager
    {
        BillGateway billGateway=new BillGateway();

        public Patient GetBillInfoByBillNo(int billNo)
        {
            return billGateway.GetBillInfoByBillNo(billNo);
        }

        public Patient GetBillInfoByMobileNo(string mobileNumber)
        {
            return billGateway.GetBillInfoByMobileNo(mobileNumber);
        }

        public string UpdateBillInformation(string phoneNumber)
        {
            return billGateway.UpdateBillInformation(phoneNumber);
        }

        public List<Patient> GetUnpaidBillInfo(DateTime fromDate, DateTime toDate)
        {
            return billGateway.GetUnpaidBillInfo(fromDate, toDate);
        }
    }
}