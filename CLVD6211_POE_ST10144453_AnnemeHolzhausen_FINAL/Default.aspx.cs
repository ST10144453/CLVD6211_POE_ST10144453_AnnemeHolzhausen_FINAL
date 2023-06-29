using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string inspectorEmail = txtInspectorEmail.Text.Trim();
            string inspectorID = txtInspectorID.Text.Trim();

            if (ValidateInspector(inspectorEmail, inspectorID))
            {
                // Login successful
                Response.Redirect("Contents.aspx"); // Replace "Dashboard.aspx" with the desired page after successful login
            }
            else
            {
                // Login failed
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid login credentials";
            }
        }

        private bool ValidateInspector(string email, string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            string query = "SELECT COUNT(*) FROM INSPECTOR WHERE Email = @Email AND InspectorNo = @InspectorNo";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@InspectorNo", id);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    connection.Close();

                    return count > 0;
                }
            }
        }
    }
}
