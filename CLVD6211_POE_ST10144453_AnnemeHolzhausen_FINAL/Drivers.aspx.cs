using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
        public partial class Drivers : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Perform initial setup or data binding
                BindDriversGrid();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string driverID = txtDriverID.Text.Trim();
            DataTable dtDriver = GetDriverFromDatabase(driverID);
            gridDrivers.DataSource = dtDriver;
            gridDrivers.DataBind();
            gridDrivers.Visible = true;
        }

        protected void gridDrivers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditDriver")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                gridDrivers.EditIndex = rowIndex;
                BindDriverData();
            }
            else if (e.CommandName == "DeleteDriver")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string driverID = gridDrivers.DataKeys[rowIndex].Value.ToString();
                DeleteDriverFromDatabase(driverID);
                BindDriverData();
            }
        }

        protected void btnSaveNewDriver_Click(object sender, EventArgs e)
        {
            string driverID = txtNewDriverID.Text.Trim();
            string driverName = txtNewDriverName.Text.Trim();
            string driverAddress = txtNewDriverAddress.Text.Trim();
            string driverEmail = txtNewDriverEmail.Text.Trim();
            string driverMobile = txtNewDriverMobile.Text.Trim();

            SaveNewDriverToDatabase(driverID, driverName, driverAddress, driverEmail, driverMobile);
            BindDriverData();

            txtNewDriverID.Text = string.Empty;
            txtNewDriverName.Text = string.Empty;
            txtNewDriverAddress.Text = string.Empty;
            txtNewDriverEmail.Text = string.Empty;
            txtNewDriverMobile.Text = string.Empty;
        }

        protected void btnViewAllDrivers_Click(object sender, EventArgs e)
        {
            BindDriverData();
        }

        private void BindDriverData()
        {
            DataTable dtDrivers = GetAllDriversFromDatabase();
            gridDrivers.DataSource = dtDrivers;
            gridDrivers.DataBind();
            gridDrivers.Visible = true;
        }

        private DataTable GetAllDriversFromDatabase()
        {
            // Replace this with your code to fetch data from the database and return a DataTable
            // Example:
            DataTable dtDrivers = new DataTable();
            dtDrivers.Columns.Add("DriverID");
            dtDrivers.Columns.Add("DriverName");
            dtDrivers.Columns.Add("DriverAddress");
            dtDrivers.Columns.Add("DriverEmail");
            dtDrivers.Columns.Add("DriverMobile");

            // Add sample data
            dtDrivers.Rows.Add("1", "John Doe", "123 Main St", "johndoe@example.com", "555-1234");
            dtDrivers.Rows.Add("2", "Jane Smith", "456 Elm St", "janesmith@example.com", "555-5678");
            dtDrivers.Rows.Add("3", "Mike Johnson", "789 Oak St", "mikejohnson@example.com", "555-9012");

            return dtDrivers;
        }

        private DataTable GetDriverFromDatabase(string driverID)
        {
            // Replace this with your code to fetch data for the specified driver ID from the database and return a DataTable
            // Example:
            DataTable dtDriver = new DataTable();
            dtDriver.Columns.Add("DriverID");
            dtDriver.Columns.Add("DriverName");
            dtDriver.Columns.Add("DriverAddress");
            dtDriver.Columns.Add("DriverEmail");
            dtDriver.Columns.Add("DriverMobile");

            // Add sample data
            dtDriver.Rows.Add("1", "John Doe", "123 Main St", "johndoe@example.com", "555-1234");

            return dtDriver;
        }

        private void SaveNewDriverToDatabase(string driverID, string driverName, string driverAddress, string driverEmail, string driverMobile)
        {
            // Replace this with your code to save the new driver information to the database
        }

        private void DeleteDriverFromDatabase(string driverID)
        {
            // Replace this with your code to delete the driver from the database
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Retrieve the input values
            string driverID = txtNewDriverID.Text;
            string driverName = txtNewDriverName.Text;
            string driverAddress = txtNewDriverAddress.Text;
            string driverEmail = txtNewDriverEmail.Text;
            string driverMobile = txtNewDriverMobile.Text;

            // Save the data or perform any necessary operations

            // Clear the input fields
            txtNewDriverID.Text = string.Empty;
            txtNewDriverName.Text = string.Empty;
            txtNewDriverAddress.Text = string.Empty;
            txtNewDriverEmail.Text = string.Empty;
            txtNewDriverMobile.Text = string.Empty;

            // Refresh the drivers grid or perform any necessary operations
            BindDriversGrid();
        }

       

        private void BindDriversGrid()
        {
            // Retrieve and bind the drivers data to the grid
            // Example code:
            // gridDrivers.DataSource = YourDataAccessLayer.GetDrivers();
            // gridDrivers.DataBind();
        }
        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            BindAllDriversGrid();
        }

        private void BindAllDriversGrid()
        {
            // Retrieve and bind all drivers data to the grid
            // Example code:
            // gridDrivers.DataSource = YourDataAccessLayer.GetAllDrivers();
            // gridDrivers.DataBind();
        }

    }
}

    
