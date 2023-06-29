using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public class Rental
    {
        public int RentalID { get; set; }
        public string CarNumber { get; set; }
        public string Inspector { get; set; }
        public string Driver { get; set; }
        public decimal RentalFee { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        // Other properties...
    }
    public partial class Rentals : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRentals();
            }
        }

        protected void btnCreateRental_Click(object sender, EventArgs e)
        {
            string carNumber = txtCarNumber.Text;
            string inspector = txtInspector.Text;
            string driver = txtDriver.Text;
            decimal rentalFee = Convert.ToDecimal(txtRentalFee.Text);
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

            // Insert the new rental into the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Rentals (CarNumber, Inspector, Driver, RentalFee, StartDate, EndDate) " +
                               "VALUES (@CarNumber, @Inspector, @Driver, @RentalFee, @StartDate, @EndDate)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CarNumber", carNumber);
                command.Parameters.AddWithValue("@Inspector", inspector);
                command.Parameters.AddWithValue("@Driver", driver);
                command.Parameters.AddWithValue("@RentalFee", rentalFee);
                command.Parameters.AddWithValue("@StartDate", startDate);
                command.Parameters.AddWithValue("@EndDate", endDate);

                connection.Open();
                command.ExecuteNonQuery();
            }

            BindRentals(); // Refresh the rentals list after adding a new rental
        }

        protected void btnGetRental_Click(object sender, EventArgs e)
        {
            int rentalID = Convert.ToInt32(txtRentalID.Text);

            // Retrieve the rental by ID from the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Rentals WHERE RentalID = @RentalID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RentalID", rentalID);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dtRental = new DataTable();

                connection.Open();
                adapter.Fill(dtRental);

                if (dtRental.Rows.Count > 0)
                {
                    // Display the retrieved rental details
                    Rental rental = new Rental
                    {
                        RentalID = Convert.ToInt32(dtRental.Rows[0]["RentalID"]),
                        CarNumber = dtRental.Rows[0]["CarNumber"].ToString(),
                        Inspector = dtRental.Rows[0]["Inspector"].ToString(),
                        Driver = dtRental.Rows[0]["Driver"].ToString(),
                        RentalFee = Convert.ToDecimal(dtRental.Rows[0]["RentalFee"]),
                        StartDate = Convert.ToDateTime(dtRental.Rows[0]["StartDate"]),
                        EndDate = Convert.ToDateTime(dtRental.Rows[0]["EndDate"])
                    };

                    // Show rental details on the page (e.g., in labels or text boxes)
                    lblRentalID.Text = rental.RentalID.ToString();
                    lblCarNumber.Text = rental.CarNumber;
                    lblInspector.Text = rental.Inspector;
                    lblDriver.Text = rental.Driver;
                    lblRentalFee.Text = rental.RentalFee.ToString();
                    lblStartDate.Text = rental.StartDate.ToString();
                    lblEndDate.Text = rental.EndDate.ToString();
                }
                else
                {
                    // Rental with the specified ID was not found
                    // Display an error message or perform appropriate action
                }
            }
        }

        private void BindRentals()
        {
            // Retrieve all rentals from the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Rentals";
                SqlCommand command = new SqlCommand(query, connection);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dtRentals = new DataTable();

                connection.Open();
                adapter.Fill(dtRentals);

                // Display the rentals in a gridview or any other suitable UI control
                gvRentals.DataSource = dtRentals;
                gvRentals.DataBind();
            }
        }
    }
}
