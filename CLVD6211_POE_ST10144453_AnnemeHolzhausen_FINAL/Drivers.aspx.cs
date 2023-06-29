// Code-behind file (Drivers.aspx.cs)

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class Drivers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hide the update and delete buttons initially
                btnUpdate.Visible = false;
                btnDelete.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Retrieve the driver ID from the input field
            string driverID = txtDriverID.Value;

            // Query the database to find the driver
            string connectionString = ConfigurationManager.ConnectionStrings["Your_Connection_String"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SQL command to select the driver information
                string query = "SELECT * FROM Drivers WHERE DriverID = @DriverID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Driver found, retrieve the information
                            string name = reader["DriverName"].ToString();
                            string address = reader["DriverAddress"].ToString();
                            string email = reader["Email"].ToString();
                            string mobile = reader["Mobile"].ToString();

                            // Display the driver information
                            lblDriverInfo.Text = $"Driver ID: {driverID}<br>Name: {name}<br>Address: {address}<br>Email: {email}<br>Mobile: {mobile}";

                            // Show the update and delete buttons
                            btnUpdate.Visible = true;
                            btnDelete.Visible = true;
                        }
                        else
                        {
                            // Driver not found, display an error message or handle accordingly
                            lblDriverInfo.Text = "Driver not found.";
                            btnUpdate.Visible = false;
                            btnDelete.Visible = false;
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Retrieve the updated driver information from the input fields
            string driverID = txtDriverID.Value;
            string updatedName = txtNewDriverName.Text;
            string updatedAddress = txtNewDriverAddress.Text;
            string updatedEmail = txtNewDriverEmail.Text;
            string updatedMobile = txtNewDriverMobile.Text;

            // Update the driver record in the database using the updated information
            string connectionString = ConfigurationManager.ConnectionStrings["Your_Connection_String"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SQL command to update the driver information
                string query = "UPDATE Drivers SET DriverName = @Name, DriverAddress = @Address, Email = @Email, Mobile = @Mobile WHERE DriverID = @DriverID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);
                    command.Parameters.AddWithValue("@Name", updatedName);
                    command.Parameters.AddWithValue("@Address", updatedAddress);
                    command.Parameters.AddWithValue("@Email", updatedEmail);
                    command.Parameters.AddWithValue("@Mobile", updatedMobile);

                    // Execute the update command
                    command.ExecuteNonQuery();

                    // Display a success message or handle accordingly
                    lblMessage.Text = "Driver record updated successfully.";
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Retrieve the driver ID from the input field
            string driverID = txtDriverID.Value;

            // Delete the driver record from the database
            string connectionString = ConfigurationManager.ConnectionStrings["Your_Connection_String"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SQL command to delete the driver record
                string query = "DELETE FROM Drivers WHERE DriverID = @DriverID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DriverID", driverID);

                    // Execute the delete command
                    command.ExecuteNonQuery();

                    // Display a success message or handle accordingly
                    lblMessage.Text = "Driver record deleted successfully.";
                }
            }
        }
    }
}
