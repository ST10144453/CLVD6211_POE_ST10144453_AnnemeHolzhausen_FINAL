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
                BindReturns();
            }
        }

        protected void ViewAllReturnsButton_Click(object sender, EventArgs e)
        {
            ViewAllReturns();
        }

        protected void SearchReturnButton_Click(object sender, EventArgs e)
        {
            int returnID = Convert.ToInt32(ReturnIDTextBox.Text);
            SearchReturn(returnID);
        }

        private void ViewAllReturns()
        {
            string connectionString = "your_connection_string_here";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Returns";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();

                reader.Close();
            }
        }

        private void SearchReturn(int returnID)
        {
            string connectionString = "your_connection_string_here";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Returns WHERE ReturnID = @ReturnID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ReturnID", returnID);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    int carNo = Convert.ToInt32(reader["CarNo"]);
                    string inspector = reader["Inspector"].ToString();
                    string driver = reader["Driver"].ToString();
                    DateTime returnDate = Convert.ToDateTime(reader["ReturnDate"]);
                    int elapsedDate = Convert.ToInt32(reader["ElapsedDate"]);
                    decimal fine = Convert.ToDecimal(reader["Fine"]);

                    ReturnIDLabel.Text = "Return ID: " + returnID;
                    CarNoLabel.Text = "Car No: " + carNo;
                    InspectorLabel.Text = "Inspector: " + inspector;
                    DriverLabel.Text = "Driver: " + driver;
                    ReturnDateLabel.Text = "Return Date: " + returnDate;
                    ElapsedDateLabel.Text = "Elapsed Date: " + elapsedDate;
                    FineLabel.Text = "Fine: " + fine;
                }
                else
                {
                    ReturnIDLabel.Text = "Return not found.";
                    CarNoLabel.Text = string.Empty;
                    InspectorLabel.Text = string.Empty;
                    DriverLabel.Text = string.Empty;
                    ReturnDateLabel.Text = string.Empty;
                    ElapsedDateLabel.Text = string.Empty;
                    FineLabel.Text = string.Empty;
                }

                reader.Close();
            }
        }


        private void BindReturns()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM RETURNCAR", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvReturns.DataSource = dt;
                gvReturns.DataBind();
            }
        }

        private void GetReturnByID(string returnId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM RETURNCAR WHERE ReturnID = @ReturnID", con);
                cmd.Parameters.AddWithValue("@ReturnID", returnId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvReturns.DataSource = dt;
                    gvReturns.DataBind();
                }
                else
                {
                    // No return found with the provided ID
                    gvReturns.DataSource = null;
                    gvReturns.DataBind();
                    lblErrorMessage.Text = "No return found with the provided ID.";
                }
            }
        }
    }
}
