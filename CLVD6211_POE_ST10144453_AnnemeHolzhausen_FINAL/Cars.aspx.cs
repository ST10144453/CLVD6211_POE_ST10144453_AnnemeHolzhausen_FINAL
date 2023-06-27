using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class Cars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Retrieve the values from the input fields
            string carMake = txtNewCarMake.Text;
            string carModel = txtNewCarModel.Text;
            string carID = txtCarID.Text;

            // Implement your logic to save the input here
            // For example, you can store the values in a database or perform any other desired action

            // Optionally, you can display a success message or perform any additional actions after saving the input
            // For example, you can redirect the user to a different page or display a confirmation message

            // Redirect the user to a different page after saving the input
            Response.Redirect("SuccessPage.aspx");
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string carID = txtCarID.Text.Trim();
            DataTable dtCars = GetCarsFromDatabase(); // Replace this with your code to fetch data from the database

            DataRow[] searchResults = dtCars.Select($"CarID = '{carID}'");

            gridCars.DataSource = searchResults.Length > 0 ? searchResults.CopyToDataTable() : null;
            gridCars.DataBind();
        }

        protected void gridCars_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCar")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string carID = gridCars.DataKeys[rowIndex]["CarID"].ToString();
                // Redirect to the edit page for the specified car ID
                Response.Redirect($"EditCar.aspx?CarID={carID}");
            }
            else if (e.CommandName == "DeleteCar")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string carID = gridCars.DataKeys[rowIndex]["CarID"].ToString();
                // Delete the car with the specified car ID from the database
                DeleteCarFromDatabase(carID);
                BindCarData(); // Refresh the grid
            }
        }

        protected void btnSaveNewCar_Click(object sender, EventArgs e)
        {
            string carMake = txtNewCarMake.Text.Trim();
            string carModel = txtNewCarModel.Text.Trim();

            // Save the new car to the database
            SaveNewCarToDatabase(carMake, carModel);
            BindCarData(); // Refresh the grid

            // Clear the input fields
            txtNewCarMake.Text = string.Empty;
            txtNewCarModel.Text = string.Empty;
        }

        protected void btnViewAllCars_Click(object sender, EventArgs e)
        {
            BindCarData();
        }

        private void BindCarData()
        {
            DataTable dtCars = GetCarsFromDatabase(); // Replace this with your code to fetch data from the database
            gridCars.DataSource = dtCars;
            gridCars.DataBind();
        }

        private DataTable GetCarsFromDatabase()
        {
            // Replace this with your code to fetch data from the database and return a DataTable
            // Example:
            DataTable dtCars = new DataTable();
            dtCars.Columns.Add("CarID");
            dtCars.Columns.Add("CarMake");
            dtCars.Columns.Add("CarModel");

            // Add sample data
            dtCars.Rows.Add("1", "Toyota", "Camry");
            dtCars.Rows.Add("2", "Honda", "Civic");
            dtCars.Rows.Add("3", "Ford", "Mustang");

            return dtCars;
        }

        private void DeleteCarFromDatabase(string carID)
        {
            // Replace this with your code to delete the car from the database based on the car ID
            // Example:
            // Your delete logic here
        }

        private void SaveNewCarToDatabase(string carMake, string carModel)
        {
            // Replace this with your code to save the new car to the database
            // Example:
            // Your save logic here
        }
    }
}

