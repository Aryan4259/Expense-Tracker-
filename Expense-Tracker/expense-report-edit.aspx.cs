using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class expense_report_edit : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        int id = Convert.ToInt32(Request.QueryString["id"]);
                        LoadTransactionDetails(id);
                        // 🚀 Auto-update when page loads
                    }
                    else
                    {
                        Response.Redirect("income-report.aspx");
                    }
                }
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
        private void LoadTransactionDetails(int id)
        {
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "SELECT * FROM [transaction] WHERE ID = @ID";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtDate.Text = Convert.ToDateTime(reader["date"]).ToString("yyyy-MM-dd");
                        txtExpense.Text = reader["expense"].ToString();
                        txtCategory.Text = reader["category"].ToString();
                        txtPayType.Text = reader["pay_type"].ToString();
                        txtToWhom.Text = reader["to_whom"].ToString();
                        txtDate.Text = reader["date"].ToString();
                    }
                }
            }
        }
        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            // Get ID from Query String
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("income-report.aspx");
                return;
            }

            int id = Convert.ToInt32(Request.QueryString["id"]);
            string constr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "UPDATE [transaction] SET expense=@expense, category=@category, pay_type=@paytype, to_whom=@to_whom, date=@date WHERE id=@id";

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@expense", txtExpense.Text);
                    cmd.Parameters.AddWithValue("@category", txtCategory.Text);
                    cmd.Parameters.AddWithValue("@paytype", txtPayType.Text);
                    cmd.Parameters.AddWithValue("@to_whom", txtToWhom.Text);

                    // Convert Date
                    DateTime date;
                    if (DateTime.TryParse(txtDate.Text, out date))
                    {
                        cmd.Parameters.AddWithValue("@date", date);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@date", DBNull.Value);
                    }

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("expense-report.aspx");
        }
    }
}