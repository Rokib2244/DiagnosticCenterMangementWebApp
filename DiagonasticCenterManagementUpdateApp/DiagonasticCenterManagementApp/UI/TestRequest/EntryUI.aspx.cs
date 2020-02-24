using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagonasticCenterManagementApp.BLL;
using DiagonasticCenterManagementApp.DAL.Model;
using DiagonasticCenterManagementApp.DAL.Model.View;

namespace DiagonasticCenterManagementApp.UI.TestRequest
{
    public partial class Entry : System.Web.UI.Page
    {
        TestNameManager testNameManager=new TestNameManager();
        private List<TestNamesWithType> testNames=new List<TestNamesWithType>();
        RequestEntryManager aRequestEntryManager=new RequestEntryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //testNames = (List<TestNamesWithType>)ViewState["TestNames"];   
            if (!IsPostBack)
            {
                PopulateWithTestNames();
                GetTestFee();
                ViewState["TestNames"] = testNames;
            }
            

        }

        private void PopulateTestNameGridView()
        {
            testNames = (List<TestNamesWithType>) ViewState["TestNames"];
            showAllTestEntryGridView.DataSource = testNames;
            showAllTestEntryGridView.DataBind();
            double total=0;
            foreach (TestNamesWithType test in testNames)
            {
                total += test.Fee;
            }
            totalTextBox.Value = total.ToString();
        }

        private void PopulateWithTestNames()
        {
            List<TestNamesWithType> testNames = testNameManager.GetAllTestNames();
            selectTestDropDownList.DataSource = testNames;
            selectTestDropDownList.DataValueField = "Id";
            selectTestDropDownList.DataTextField = "TestName";
            selectTestDropDownList.DataBind();
        }

        protected void selectTestDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetTestFee();
        }

        private void GetTestFee()
        {
            int id = Convert.ToInt32(selectTestDropDownList.SelectedValue);
            double fee = testNameManager.GetTestFee(id);
            feeTextBox.Value = fee.ToString();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            testNames = (List<TestNamesWithType>)ViewState["TestNames"];
            TestNamesWithType testName=new TestNamesWithType();
            testName.TestName = selectTestDropDownList.SelectedItem.Text;
            testName.Id = Convert.ToInt32(selectTestDropDownList.SelectedValue);
            testName.Fee = Convert.ToDouble(feeTextBox.Value);
            bool doesTestNameExist = false;
            foreach (TestNamesWithType test in testNames)
            {
                if (test.TestName == testName.TestName)
                {
                    doesTestNameExist = true;
                    break;
                }
            }
            if (doesTestNameExist)
            {
                messageLabel.Text =
                    "<span style='color:red;font-size:15px;font-weight:bold;font-style:italic;'>Test Name already entered.</span>";
                ViewState["TestNames"] = testNames;
                PopulateTestNameGridView();

            }
            else
            {
                testNames.Add(testName);
                //showAllTestEntryGridView.DataSource = testNames;
                //showAllTestEntryGridView.DataBind();
                ViewState["TestNames"] = testNames;
                PopulateTestNameGridView();
            }
            
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            testNames = (List<TestNamesWithType>)ViewState["TestNames"];
            Patient aPatient =new Patient();

            aPatient.Name = patientNameTextBox.Value;
            aPatient.BirthDate = Convert.ToDateTime(birthTextBox.Value);
            aPatient.PhoneNumber = mobileTextBox.Value;
            aPatient.TotalFee = Convert.ToDouble(totalTextBox.Value);
            aPatient.DueDate= DateTime.Now;

            aPatient.BillNo = aRequestEntryManager.GetBillNo();
            billNo.Value = aPatient.BillNo.ToString();

            if (aRequestEntryManager.ChackPhoneNumber(aPatient.PhoneNumber)<1)
            {
                messageLabel.Text = aRequestEntryManager.SavePatientInfo(aPatient);
                int patientID = aRequestEntryManager.GetPatientID(aPatient.PhoneNumber);
               
                successEntryLabel.Text=aRequestEntryManager.SaveAllEntries(testNames,patientID);
            }
            else
            {
                messageLabel.Text = "Error!";
            }
            

        }
    }
}