using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Northwind_Newsletter_Moiz_Jamalia
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            literalInfo.Text = "Please enter your personal data:";
            rangeValBirthday.MaximumValue = DateTime.Now.Date.ToString("dd.MM.yyyy");
        }

        protected void CheckBoxValidator(object source, ServerValidateEventArgs args)
        {
            args.IsValid = checkAGB.Checked;
        }

        protected void OnBtnSubmit(object source, EventArgs args)
        {
            if (Page.IsValid) Response.Redirect("~/RegionsManagement.aspx");
        }
    }
}