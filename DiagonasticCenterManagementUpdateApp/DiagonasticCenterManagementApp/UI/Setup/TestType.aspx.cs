using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagonasticCenterManagementApp.BLL;
using DiagonasticCenterManagementApp.DAL.Model;

namespace DiagonasticCenterManagementApp.UI.Setup
{
    public partial class TestTypeUI : System.Web.UI.Page
    {
        TestTypeManager testTypeManager=new TestTypeManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateTestTypes();
        }

        private void UpdateTestTypes()
        {
            List<TestTypes> testTypes = testTypeManager.GetAllTestType();
            allTestTypeGridView.DataSource = testTypes;
            allTestTypeGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string typeName = typeNameTextBox.Value;
            bool doesTypeNameExist = testTypeManager.CheckTypeName(typeName);
            if (doesTypeNameExist)
            {
                messageLabel.Text= "<span class='redLabel'>Test Type with Same Name already Exists.</span>";
            }
            else
            {
                messageLabel.Text="<span class='greenLabel'>"+testTypeManager.SetName(typeName)+"</span>";
            }
            typeNameTextBox.Value = null;
            UpdateTestTypes();
            
        }
    }
}