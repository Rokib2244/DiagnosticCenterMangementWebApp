using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagonasticCenterManagementApp.BLL;
using DiagonasticCenterManagementApp.DAL.Model;

namespace DiagonasticCenterManagementApp.UI.Report
{
    public partial class UnpaidBill : System.Web.UI.Page
    {
        BillManager billManager=new BillManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void showButton_OnServerClick(object sender, EventArgs e)
        {
            if (fromDateTextBox.Value.Length == 0 || toDateTextBox.Value.Length == 0)
            {
                messageLabel.Text = "<span style='color:red;font-weight:bold;font-style:italic;font-size:15px;'>From Date and To Date both should be filled.";
            }
            else
            {
                DateTime fromDate = Convert.ToDateTime(fromDateTextBox.Value);
                DateTime toDate = Convert.ToDateTime(toDateTextBox.Value);
                List<Patient> patients = billManager.GetUnpaidBillInfo(fromDate, toDate);
                if (patients.Count == 0)
                {
                    messageLabel.Text = "<span style='color:red;font-weight:bold;font-style:italic;font-size:15px;'>No Information found</span>";
                }
                else
                {
                    unpaidBillReportGridView.DataSource = patients;
                    unpaidBillReportGridView.DataBind();
                }
            }
            
        }
    }
}