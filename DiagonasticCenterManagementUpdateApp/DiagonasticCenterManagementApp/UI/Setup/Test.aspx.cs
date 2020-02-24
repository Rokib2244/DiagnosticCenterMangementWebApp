using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagonasticCenterManagementApp.BLL;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.UI.Setup
{
    public partial class TestUI : System.Web.UI.Page
    {
        private TestNameManager testNameManager = new TestNameManager();
        TestTypeManager testTypeManager=new TestTypeManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                GetTestNames();
            }
        }

        private void GetTestNames()
        {
            List<TestTypes> testTypes = testTypeManager.GetAllTestType();
            testTypeDropDownList.DataSource = testTypes;
            testTypeDropDownList.DataValueField = "Index";
            testTypeDropDownList.DataTextField = "TestTypeName";
            testTypeDropDownList.DataBind();
            List<TestNamesWithType> testNames = testNameManager.GetAllTestNames();
            showAllTestNameGridView.DataSource = testNames;
            showAllTestNameGridView.DataBind();
        }

        protected void saveTypeNameButton_Click(object sender, EventArgs e)
        {
            TestName testName=new TestName();
            testName.Testname = testNameTextBox.Value;
            if (feeTextBox.Value.ToString().Length == 0)
            {
                testName.Fee = 0;
            }
            else
            {
                testName.Fee = Convert.ToDouble(feeTextBox.Value);
            }
            
            testName.TestTypeID = Convert.ToInt32(testTypeDropDownList.SelectedValue);
            string message=testNameManager.SaveTestName(testName);
            messageLabel.Text = message;
            testNameTextBox.Value = null;
            feeTextBox.Value = null;
            GetTestNames();
        }
    }
}