using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Reflection.Emit;

namespace Expense_Tracker.Html
{
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MobileNumber"] != null)
            {
                if (!IsPostBack)
                {
                    // Update the balance when the page loads for the first time
                    UpdateBalance();
                    LoadBudgetData();
                    LoadUserData();
                    
                }
            }
            else
            {
                // Redirect to login page if no session found
                Response.Redirect("~/Login.aspx");
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
        private void LoadBudgetData()
        {
            if (Session["MobileNumber"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string query = @"
    SELECT B.category AS Category, 
           ISNULL(SUM(T.expense), 0) AS TotalExpense,  
           B.budget AS Budget
    FROM Budget B
    LEFT JOIN [Transaction] T ON B.category = T.category AND T.mno = @mno
    WHERE B.mno = @mno  -- Ensure budget is filtered by session number
    GROUP BY B.category, B.budget";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@mno", Session["MobileNumber"]);
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        rptBudget.DataSource = dt;
                        rptBudget.DataBind();
                    }
                }
            }
        }



        protected void btnAddIncome_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string txt_Income = txtIncome.Text;
            string txt_InCategory = txtCategory.Text;
            string txt_InPayType = txtPayType.Text;
            string txt_InByWhom = txtByWhom.Text;
            string txt_InDate = txtDate.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("insert into [transaction] (mno, category, income, date, pay_type, by_whom) values (@In_mno, @In_Category, @Income, @In_Date, @In_PayType, @In_ByWhom)", connection);
                command.Parameters.AddWithValue("@In_mno", Session["MobileNumber"]);
                command.Parameters.AddWithValue("@In_Category", txt_InCategory);
                command.Parameters.AddWithValue("@Income", txt_Income);
                command.Parameters.AddWithValue("@In_Date", txt_InDate);
                command.Parameters.AddWithValue("@In_PayType", txt_InPayType);
                command.Parameters.AddWithValue("@In_ByWhom", txt_InByWhom);
                command.ExecuteNonQuery();
                connection.Close();
            }
            txtIncome.Text = "";
            txtCategory.Text = "";
            txtPayType.Text = "";
            txtByWhom.Text = "";
            txtDate.Text = "";
            UpdateBalance();

        }

        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string txt_Expense = txtExpenseAmount.Text;
            string txt_ExCategory = txtExpenseCategory.Text;
            string txt_ExPayType = txtExpensePayType.Text;
            string txt_ExToWhom = txtExpenseToWhom.Text;
            string txt_ExDate = txtExpenseDate.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("insert into [transaction] (mno, category, expense, date, pay_type, to_whom) values (@Ex_mno, @Ex_Category, @Expense, @Ex_Date, @Ex_PayType, @Ex_ToWhom)", connection);
                command.Parameters.AddWithValue("@Ex_mno", Session["MobileNumber"]);
                command.Parameters.AddWithValue("@Ex_Category", txt_ExCategory);
                command.Parameters.AddWithValue("@Expense", txt_Expense);
                command.Parameters.AddWithValue("@Ex_Date", txt_ExDate);
                command.Parameters.AddWithValue("@Ex_PayType", txt_ExPayType);
                command.Parameters.AddWithValue("@Ex_ToWhom", txt_ExToWhom);
                command.ExecuteNonQuery();
                connection.Close();
            }
            txtExpenseAmount.Text = "";
            txtExpenseCategory.Text = "";
            txtExpensePayType.Text = "";
            txtExpenseToWhom.Text = "";
            txtExpenseDate.Text = "";
            UpdateBalance();
            LoadBudgetData();

        }
        private void UpdateBalance()
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "SELECT * FROM [Transaction] WHERE mno = @MNO";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MNO", MNO); // Use parameterized queries to prevent SQL injection
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    decimal totalIncome = 0, totalExpense = 0, balance = 0;

                    foreach (DataRow row in dt.Rows)
                    {
                        if (!string.IsNullOrEmpty(row["income"].ToString()))
                            totalIncome += Convert.ToDecimal(row["income"]);

                        if (!string.IsNullOrEmpty(row["expense"].ToString()))
                            totalExpense += Convert.ToDecimal(row["expense"]);
                    }

                    balance = totalIncome - totalExpense;

                    // Display results in labels
                    Label2.Text = "&#8377; " + totalIncome.ToString();
                    Label3.Text = "&#8377; " + totalExpense.ToString();
                    Label1.Text = "&#8377; " + balance.ToString();

                    // Apply the negative balance class if the balance is negative
                    if (balance < 0)
                    {
                        widget.Attributes["class"] += " negative-balance";
                    }
                }
            }

        }
    }
   
}

