using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class budget_management : System.Web.UI.Page
    {
        // ✅ Database connection string
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MobileNumber"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCategories();
                LoadBudgets();
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
        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT DISTINCT category FROM [Transaction] WHERE mno = @mno AND expense > 0"; // Fetch only expense categories
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@mno", Session["MobileNumber"]);
                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlCategory.DataSource = reader;
                    ddlCategory.DataTextField = "category";
                    ddlCategory.DataValueField = "category";
                    ddlCategory.DataBind();

                    reader.Close();
                }
            }
        }



        private void LoadBudgets()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Id, category, budget FROM Budget WHERE mno = @mno";
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("@mno", Session["MobileNumber"]);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptBudget.DataSource = dt;
                    rptBudget.DataBind();
                }
            }
        }

        protected void btnAddBudget_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "INSERT INTO Budget (mno, category, budget) VALUES (@mno, @category, @budget)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@mno", Session["MobileNumber"]);
                    cmd.Parameters.AddWithValue("@category", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@budget", txtBudgetAmount.Text);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadBudgets();
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM Budget WHERE Id = @Id AND mno = @mno";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@mno", Session["MobileNumber"]);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadBudgets();
        }

        protected void btnUpdateBudget_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE Budget SET budget = @budget WHERE Id = @Id AND mno = @mno";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", hfBudgetID.Value);
                    cmd.Parameters.AddWithValue("@mno", Session["MobileNumber"]);
                    cmd.Parameters.AddWithValue("@budget", txtEditBudgetAmount.Text);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadBudgets();
        }

    }
}
