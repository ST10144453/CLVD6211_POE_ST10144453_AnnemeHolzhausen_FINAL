using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    public partial class Rentals : System.Web.UI.Page
    {
        private List<Rental> rentalList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize rentalList and bind it to the GridView
                rentalList = new List<Rental>();
                BindRentalListToGridView();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Retrieve the input values
            string rentalID = txtRentalID.Text;
            string carNumber = txtCarNumber.Text;
            string inspector = txtInspector.Text;
            string driver = txtDriver.Text;
            decimal rentalFee = Convert.ToDecimal(txtRentalFee.Text);
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

            // Create a new Rental object
            Rental rental = new Rental(rentalID, carNumber, inspector, driver, rentalFee, startDate, endDate);

            // Add the new rental to the rentalList
            rentalList.Add(rental);

            // Clear the input fields
            ClearInputFields();

            // Bind the updated rentalList to the GridView
            BindRentalListToGridView();
        }

        protected void imgStartDate_Click(object sender, ImageClickEventArgs e)
        {
            calStartDate.Visible = !calStartDate.Visible;
        }

        protected void calStartDate_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = calStartDate.SelectedDate.ToString("yyyy-MM-dd");
            calStartDate.Visible = false;
        }

        protected void imgEndDate_Click(object sender, ImageClickEventArgs e)
        {
            calEndDate.Visible = !calEndDate.Visible;
        }

        protected void calEndDate_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = calEndDate.SelectedDate.ToString("yyyy-MM-dd");
            calEndDate.Visible = false;
        }

        protected void gridRentals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRental")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (index >= 0 && index < rentalList.Count)
                {
                    // Retrieve the selected rental from the rentalList
                    Rental rental = rentalList[index];

                    // Populate the input fields with the selected rental details
                    txtRentalID.Text = rental.RentalID;
                    txtCarNumber.Text = rental.CarNumber;
                    txtInspector.Text = rental.Inspector;
                    txtDriver.Text = rental.Driver;
                    txtRentalFee.Text = rental.RentalFee.ToString();
                    txtStartDate.Text = rental.StartDate.ToString("yyyy-MM-dd");
                    txtEndDate.Text = rental.EndDate.ToString("yyyy-MM-dd");
                }
            }
            else if (e.CommandName == "DeleteRental")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (index >= 0 && index < rentalList.Count)
                {
                    // Remove the selected rental from the rentalList
                    rentalList.RemoveAt(index);

                    // Bind the updated rentalList to the GridView
                    BindRentalListToGridView();
                }
            }
        }

        private void BindRentalListToGridView()
        {
            // Bind the rentalList to the GridView
            gridRentals.DataSource = rentalList;
            gridRentals.DataBind();

            // Show/hide the GridView based on the presence of rentals
            bool hasRentals = rentalList.Count > 0;
            gridRentals.Visible = hasRentals;
        }

        private void ClearInputFields()
        {
            // Clear the input fields
            txtRentalID.Text = string.Empty;
            txtCarNumber.Text = string.Empty;
            txtInspector.Text = string.Empty;
            txtDriver.Text = string.Empty;
            txtRentalFee.Text = string.Empty;
            txtStartDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Retrieve the rental ID from the textbox
            string rentalID = txtRentalID.Text;

            // Perform the necessary search logic using the rental ID
            List<Rental> searchResults = PerformSearch(rentalID);

            // Bind the search results to the gridview
            BindRentalListToGridView(searchResults);
        }

        private List<Rental> PerformSearch(string rentalID)
        {
            // Perform the search logic using the rental ID
            // Replace this with your actual search implementation
            // and return the search results as a List<Rental>
            List<Rental> searchResults = new List<Rental>();

            // Example search logic: Filter the rentalList based on the rentalID
            foreach (Rental rental in rentalList)
            {
                if (rental.RentalID == rentalID)
                {
                    searchResults.Add(rental);
                }
            }

            return searchResults;
        }

        private void BindRentalListToGridView(List<Rental> rentals)
        {
            // Bind the rentalList to the GridView
            gridRentals.DataSource = rentals;
            gridRentals.DataBind();

            // Show/hide the GridView based on the presence of rentals
            bool hasRentals = rentals.Count > 0;
            gridRentals.Visible = hasRentals;
        }
        protected void btnViewAllRentals_Click(object sender, EventArgs e)
        {
            // Perform the necessary logic to retrieve all rentals
            List<Rental> allRentals = GetAllRentals();

            // Bind all rentals to the GridView
            BindRentalListToGridView(allRentals);
        }

        private List<Rental> GetAllRentals()
        {
            // Retrieve all rentals from your data source
            // Replace this with your actual implementation
            // and return the list of all rentals as a List<Rental>
            List<Rental> allRentals = new List<Rental>();

            // Example implementation: Return the rentalList as all rentals
            allRentals = rentalList;

            return allRentals;
        }





        public class Rental
        {
            public string RentalID { get; set; }
            public string CarNumber { get; set; }
            public string Inspector { get; set; }
            public string Driver { get; set; }
            public decimal RentalFee { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }

            public Rental(string rentalID, string carNumber, string inspector, string driver, decimal rentalFee, DateTime startDate, DateTime endDate)
            {
                RentalID = rentalID;
                CarNumber = carNumber;
                Inspector = inspector;
                Driver = driver;
                RentalFee = rentalFee;
                StartDate = startDate;
                EndDate = endDate;
            }
        }
    }
}
