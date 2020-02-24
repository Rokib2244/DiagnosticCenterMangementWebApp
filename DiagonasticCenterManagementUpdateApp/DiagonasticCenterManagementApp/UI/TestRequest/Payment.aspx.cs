using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagonasticCenterManagementApp.BLL;
using DiagonasticCenterManagementApp.DAL.Model;

namespace DiagonasticCenterManagementApp.UI.TestRequest
{
    public partial class Payment : System.Web.UI.Page
    {
        BillManager billManager=new BillManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_OnServerClick(object sender, EventArgs e)
        {
            Patient patient=new Patient();
            string billNo = billNoTextBox.Value;
            string mobileNumber = mobileNoTextBox.Value;
            string message="";
            if ((billNo.Trim().Length == 0 && mobileNumber.Trim().Length == 0) ||(billNo.Trim().Length > 0 && mobileNumber.Trim().Length > 0))
            {
                message = "Either Bill No or Mobile No Should be Filled.";
            }
            else if (billNo.ToString().Trim().Length > 0)
            {

                patient = billManager.GetBillInfoByBillNo(Convert.ToInt32(billNoTextBox.Value));
            }
            else
            {
                patient = billManager.GetBillInfoByMobileNo(mobileNumber);
            }
            if (patient == null)
            {
                message = "Patient with entered Bill No. or Mobile No. does not exists.";
            }
            else
            {
                dueDateTextBox.Value = patient.DueDate.ToString();
                amountTextBox.Value = patient.TotalFee.ToString();
                ViewState["Patient"] = patient;
            }
            messageLabel.Text = message;
            

        }

        protected void payButton_OnServerClick(object sender, EventArgs e)
        {
            if (amountTextBox.Value.Trim().Length == 0 || dueDateTextBox.Value.Length == 0)
            {
                paymentLabel.Text = "Payment Information is not valid.";
            }
            else
            {
                Patient patient = (Patient)ViewState["Patient"];
                double totalFee = patient.TotalFee;
                if (Convert.ToDouble(amountTextBox.Value) == totalFee)
                {
                    paymentLabel.Text = billManager.UpdateBillInformation(patient.PhoneNumber);
                }
                else if (Convert.ToDouble(amountTextBox.Value) == 0)
                {
                    paymentLabel.Text = "Bill is Unpaid.";
                }
                else
                {
                    paymentLabel.Text = "Partial payment is not possible.";
                }
            }
            
        }
    }
}