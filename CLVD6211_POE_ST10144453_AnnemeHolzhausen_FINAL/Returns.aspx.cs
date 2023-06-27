using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLVD6211_POE_ST10144453_AnnemeHolzhausen_FINAL
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Web.UI.WebControls;

    public partial class Returns : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Perform initial data binding or any other page load logic
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Save button click logic goes here
        }

        protected void imgReturnDate_Click(object sender, ImageClickEventArgs e)
        {
            calReturnDate.Visible = !calReturnDate.Visible;
        }

        protected void calReturnDate_SelectionChanged(object sender, EventArgs e)
        {
            txtReturnDate.Text = calReturnDate.SelectedDate.ToString("yyyy-MM-dd");
            calReturnDate.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string returnID = txtSearchReturnID.Text.Trim();

            // Perform search logic based on returnID
            // Retrieve and display the matching return data
        }

        protected void btnViewAllReturns_Click(object sender, EventArgs e)
        {
            // Retrieve and display all returns data
        }
    }
}
