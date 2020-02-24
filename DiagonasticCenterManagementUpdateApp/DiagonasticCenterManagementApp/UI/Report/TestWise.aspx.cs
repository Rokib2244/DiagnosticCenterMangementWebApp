using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagonasticCenterManagementApp.BLL;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.UI.Report
{
    public partial class TestWise : System.Web.UI.Page
    {
        TestWiseReportManager aTestWiseReportManager = new TestWiseReportManager();
        TestNameManager aTestNameManager=new TestNameManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void showButton_OnServerClick(object sender, EventArgs e)
        {
            
            if (fromDateTextBox.Value.Length == 0 || toDateTextBox.Value.Length == 0)
            {
                messageLabel.Text = "<span style='color:red;font-weight:bold;font-style:italic;font-size:15px;'>From Date and To Date all should be filled.";
            }
            else
            {
                messageLabel.Text = "";
                DateTime fromDate = Convert.ToDateTime(fromDateTextBox.Value);
                DateTime toDate = Convert.ToDateTime(toDateTextBox.Value);
                List<TestNamesWithType> testNamesWithTypes = aTestNameManager.GetAllTestNames();
                List<string> testNames=new List<string>();
                foreach (TestNamesWithType testNameWithType in testNamesWithTypes)
                {
                    testNames.Add(testNameWithType.TestName);
                }

                List<TestWiseVM> aTestWiseVm = aTestWiseReportManager.GetAllTestInfo(testNames,fromDate,toDate);
                double totalAmount=0;
                foreach (TestWiseVM test in aTestWiseVm)
                {
                    totalAmount += test.TotalAmount;
                }
                totalTextBox.Value = totalAmount.ToString();
                testWiseReportGridView.DataSource = aTestWiseVm;
                testWiseReportGridView.DataBind();
            }
            
            




        }
    }
}