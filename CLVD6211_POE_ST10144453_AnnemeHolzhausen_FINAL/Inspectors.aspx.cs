using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class Inspectors : System.Web.UI.Page
    {
        public string InspectorNo { get; set; }
        public string InspectorName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlInspectorInfo.Visible = false;
                btnUpdate.Visible = false;
                btnDelete.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string inspectorID = txtInspectorID.Text;
            Inspectors inspector = GetInspectorByID(inspectorID);

            if (inspector != null)
            {
                pnlInspectorInfo.Visible = true;
                lblInspectorNo.Text = inspector.InspectorNo;
                lblInspectorName.Text = inspector.InspectorName;
                lblEmail.Text = inspector.Email;
                lblMobile.Text = inspector.Mobile;

                btnUpdate.Visible = true;
                btnDelete.Visible = true;
            }
            else
            {
                lblMessage.Text = "Inspector not found.";
                pnlInspectorInfo.Visible = false;
                btnUpdate.Visible = false;
                btnDelete.Visible = false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string inspectorID = txtInspectorID.Text;
            string inspectorName = txtInspectorName.Text;
            string email = txtEmail.Text;
            string mobile = txtMobile.Text;

            // Update the inspector in the database
            bool success = UpdateInspector(inspectorID, inspectorName, email, mobile);

            if (success)
            {
                lblMessage.Text = "Inspector updated successfully.";
                // Refresh the inspector information
                btnSearch_Click(sender, e);
            }
            else
            {
                lblMessage.Text = "Failed to update inspector.";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string inspectorID = txtInspectorID.Text;

            // Delete the inspector from the database
            bool success = DeleteInspector(inspectorID);

            if (success)
            {
                lblMessage.Text = "Inspector deleted successfully.";
                pnlInspectorInfo.Visible = false;
                btnUpdate.Visible = false;
                btnDelete.Visible = false;
            }
            else
            {
                lblMessage.Text = "Failed to delete inspector.";
            }
        }

        private Inspectors GetInspectorByID(string inspectorID)
        {
            string connectionString = "your_connection_string";
            string query = "SELECT * FROM INSPECTOR WHERE InspectorNo = @InspectorID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@InspectorID", inspectorID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Inspectors inspector = new Inspectors
                            {
                                InspectorNo = reader["InspectorNo"].ToString(),
                                InspectorName = reader["InspectorName"].ToString(),
                                Email = reader["Email"].ToString(),
                                Mobile = reader["Mobile"].ToString()
                            };

                            return inspector;
                        }
                    }
                }
            }

            return null; // Return null if the inspector is not found
        }


        private bool DeleteInspector(string inspectorID)
        {
            // Perform the database query to delete the inspector based on the InspectorID
            // Replace this code with your actual database query using ADO.NET or an ORM

            string connectionString = "your_connection_string";
            string query = "DELETE FROM INSPECTOR WHERE InspectorNo = @InspectorID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@InspectorID", inspectorID);
                    int rowsAffected = command.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }

        private bool UpdateInspector(string inspectorID, string inspectorName, string email, string mobile)
        {
            // Perform the database query to update the inspector based on the InspectorID
            // Replace this code with your actual database query using ADO.NET or an ORM

            string connectionString = "your_connection_string";
            string query = "UPDATE INSPECTOR SET InspectorName = @InspectorName, Email = @Email, Mobile = @Mobile WHERE InspectorNo = @InspectorID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@InspectorID", inspectorID);
                    command.Parameters.AddWithValue("@InspectorName", inspectorName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Mobile", mobile);
                    int rowsAffected = command.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }
    }

   
}
