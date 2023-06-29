using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data; 
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class Cars : System.Web.UI.Page
    {
        public string CarID { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string carID = txtCarID.Text.Trim(); // Get the car ID entered by the user

            // Perform the search in the database using the car ID
            // Replace the "YOUR_CONNECTION_STRING" with your actual database connection string
            using (SqlConnection connection = new SqlConnection("YOUR_CONNECTION_STRING"))
            {
                string query = "SELECT CarID, CarMake, CarModel FROM Cars WHERE CarID = @CarID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CarID", carID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    gridCars.DataSource = reader;
                    gridCars.DataBind();
                    tableContainer.Visible = true; // Show the table container
                }
                else
                {
                    tableContainer.Visible = false; // Hide the table container
                                                    // Display a message indicating no matching car found
                    ClientScript.RegisterStartupScript(this.GetType(), "NoResults", "alert('No car found with the specified ID.');", true);
                }

                reader.Close();
            }
        }

        protected void btnSaveNewCar_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            // Retrieve the values entered by the user
            string carMake = txtNewCarMake.Text;
            string carModel = txtNewCarModel.Text;
            string carID = txtNewCarID.Text;

            // Create a new SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Construct the SQL query to insert a new car into the database
                string query = "INSERT INTO Cars (CarMake, CarModel, CarID) VALUES (@CarMake, @CarModel, @CarID)";

                // Create a new SqlCommand with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Set the parameter values
                    command.Parameters.AddWithValue("@CarMake", carMake);
                    command.Parameters.AddWithValue("@CarModel", carModel);
                    command.Parameters.AddWithValue("@CarID", carID);

                    // Open the database connection
                    connection.Open();

                    // Execute the SQL command
                    command.ExecuteNonQuery();

                    // Close the database connection
                    connection.Close();
                }
            }

            // Clear the input fields after successfully adding the car
            txtNewCarMake.Text = string.Empty;
            txtNewCarModel.Text = string.Empty;
            txtNewCarID.Text = string.Empty;

            // Refresh the GridView to show the newly added car
            btnViewAllCars_Click(sender, e);
        }

        protected void btnViewAllCars_Click(object sender, EventArgs e)
        {
            // Retrieve the connection string from the Web.config file
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            // Create a new SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Construct the SQL query to select all cars from the database
                string query = "SELECT CarID, CarMake, CarModel FROM Cars";

                // Create a new SqlCommand with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Open the database connection
                    connection.Open();

                    // Create a SqlDataReader to read the data from the database
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Bind the SqlDataReader to the GridView
                        gridCars.DataSource = reader;
                        gridCars.DataBind();
                    }
                }
            }

            // Show the table container div after retrieving the data
            tableContainer.Style["display"] = "block";
        }

        protected void gridCars_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCar")
            {
                // Get the index of the row where the Edit button was clicked
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the CarID from the selected row
                string carID = gridCars.DataKeys[rowIndex].Value.ToString();

                // Retrieve the car details from the database based on the CarID
                Cars car = GetCarByID(carID);

                if (car != null)
                {
                    // Populate the textboxes with the car details
                    txtEditCarID.Text = car.CarID;
                    txtEditCarMake.Text = car.CarMake;
                    txtEditCarModel.Text = car.CarModel;

                    // Show the edit container div and hide the table container div
                    editContainer.Style["display"] = "block";
                    tableContainer.Style["display"] = "none";
                }
                else
                {
                    // Car not found, handle the error or display a message
                }
            }
        }

        protected void btnSaveEditCar_Click(object sender, EventArgs e)
        {
            string carID = txtEditCarID.Text;
            string carMake = txtEditCarMake.Text;
            string carModel = txtEditCarModel.Text;

            // Update the car details in the database
            bool success = UpdateCarDetails(carID, carMake, carModel);

            if (success)
            {
                // Show the table container div and hide the edit container div
                tableContainer.Style["display"] = "block";
                editContainer.Style["display"] = "none";

                // Refresh the grid view to show the updated car details
                BindGridCars();
            }
            else
            {
                // Handle the error, display a message, or redirect to an error page
            }
        }


        protected void btnReturnToSearchResults_Click(object sender, EventArgs e)
        {
            // Show the table container div and hide the edit container div
            tableContainer.Style["display"] = "block";
            editContainer.Style["display"] = "none";
        }

        private void BindGridCars()
        {
            // Retrieve car data from the database and bind it to the GridView control
            // Implement your logic here to fetch the car data from the database

            // Example code to bind the car data to the GridView control
            DataTable carData = GetCarDataFromDatabase(); // Implement your method to fetch car data

            gridCars.DataSource = carData;
            gridCars.DataBind();
        }

      
        private string connectionString; // Replace with your database connection string


        public Cars GetCarByID(string carID)
        {
            Cars car = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM Cars WHERE CarID = @CarID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CarID", carID);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        car = new Cars();
                        car.CarID = reader["CarID"].ToString();
                        car.CarMake = reader["CarMake"].ToString();
                        car.CarModel = reader["CarModel"].ToString();
                    }
                }
            }

            return car;
        }

        private void DeleteCarByID(string carID)
        {
            string connectionString = "your_connection_string_here"; // Replace with your actual connection string

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Cars WHERE CarID = @CarID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CarID", carID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void gridCars_RowCommandHandler(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCar")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gridCars.Rows[rowIndex];
                string carID = row.Cells[0].Text; // Assuming CarID is displayed in the first column

                // Call a method to delete the car from the database
                DeleteCarByID(carID);

                // Rebind the grid to reflect the updated data
                BindCarData();
            }
        }

        protected void BindCarData()
        {
            // Code to retrieve car data from the database and bind it to the GridView
            // For example:
            string connectionString = "YourConnectionString";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT CarID, CarMake, CarModel FROM Cars";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    gridCars.DataSource = reader;
                    gridCars.DataBind();
                }
            }
        }

        protected DataTable GetCarDataFromDatabase()
        {
            DataTable dataTable = new DataTable();
            string connectionString = "YourConnectionString";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT CarID, CarMake, CarModel FROM Cars";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dataTable);
                }
            }

            return dataTable;
        }

        protected bool UpdateCarDetails(string carID, string carMake, string carModel)
        {
            // Assuming you have a connection string named "YourConnectionString"
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString))
            {
                string query = "UPDATE Cars SET CarMake = @CarMake, CarModel = @CarModel WHERE CarID = @CarID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CarMake", carMake);
                    command.Parameters.AddWithValue("@CarModel", carModel);
                    command.Parameters.AddWithValue("@CarID", carID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
            if (!string.IsNullOrEmpty(carID))
            {
                return true;
            }
            else
            {
                return false;
            }
        }


    }

}



    

