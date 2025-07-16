using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class expense : System.Web.UI.Page
    {
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
                UpdateBalance();
                LoadUserData();
            }
            
        }
        private void LoadUserData()
        {
            string mobileNumber = Session["MobileNumber"].ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT u.fnm, p.profile_image 
                FROM [user] u
                LEFT JOIN UserProfile p ON u.mno = p.mno
                WHERE u.mno = @mno";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@mno", mobileNumber);
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Set the user's first name
                        UserNameLabel.Text = reader["fnm"].ToString();

                        // Set the profile image (default if not found)
                        string profileImagePath = reader["profile_image"] != DBNull.Value ? reader["profile_image"].ToString() : "~/Images/default.png";
                        ProfilePic.ImageUrl = profileImagePath;
                    }
                }
            }
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button deletebutton = (Button)sender;
            string id = deletebutton.CommandArgument;
            string query = "DELETE FROM [transaction] WHERE id = @id";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
            }

            BindRepeater(); // Refresh list after deletion
            UpdateBalance(); // Update balances
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            // Get the clicked button
            Button btn = (Button)sender;

            // Get the repeater item
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            // Retrieve the ID from the hidden field
            HiddenField hfID = (HiddenField)item.FindControl("hfID");

            if (hfID != null)
            {
                string id = hfID.Value;
                Response.Redirect("expense-report-edit.aspx?id=" + id);
            }
           
        }
        private void BindRepeater()
        {
            string MNO = Session["MobileNumber"]?.ToString();
            if (string.IsNullOrEmpty(MNO)) return;

            string query = "SELECT * FROM [transaction] WHERE expense > 0 AND mno = @mno";

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@mno", MNO);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);

                IncomeRepeater.DataSource = dt;
                IncomeRepeater.DataBind();
            }
        }
        private void UpdateBalance()
        {
            string MNO = Session["MobileNumber"]?.ToString();
            if (string.IsNullOrEmpty(MNO)) return;

            string query = "SELECT id, income, expense FROM [transaction] WHERE mno = @mno ORDER BY id ASC";
            decimal balance = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@mno", MNO);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);

                foreach (DataRow row in dt.Rows)
                {
                    if (!string.IsNullOrEmpty(row["income"].ToString()))
                        balance += Convert.ToDecimal(row["income"]);

                    if (!string.IsNullOrEmpty(row["expense"].ToString()))
                        balance -= Convert.ToDecimal(row["expense"]);

                    using (SqlCommand ucmd = new SqlCommand("UPDATE [transaction] SET balance = @balance WHERE id = @id", conn))
                    {
                        ucmd.Parameters.AddWithValue("@balance", balance);
                        ucmd.Parameters.AddWithValue("@id", row["id"]);
                        ucmd.ExecuteNonQuery();
                    }
                }
            }

            // Refresh data
            BindRepeater();
        }
    }
}