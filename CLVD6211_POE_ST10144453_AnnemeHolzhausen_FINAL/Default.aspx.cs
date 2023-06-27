using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class _Default : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string inspectorEmail = txtInspectorEmail.Text;
            string inspectorID = txtInspectorID.Text;

            // Perform your login authentication logic here
            // You can check the entered email and ID against your database or any other authentication mechanism

            // Example authentication logic (replace with your own):
            if (inspectorEmail == "example@email.com" && inspectorID == "12345")
            {
                // Successful login
                // Redirect the user to the home page or any other authenticated page
                Response.Redirect("Contents.aspx");
            }
            else
            {
                // Failed login
                lblMessage.Text = "Invalid email or ID. Please try again.";
                lblMessage.Visible = true;
            }
        }
    }
}