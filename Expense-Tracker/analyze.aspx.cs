using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class analyze : System.Web.UI.Page
    {
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ByDateRepeater.DataSource = null;
                ByDateRepeater.DataBind();

                LoadUserData();
            }

            income();
            expense();
            statement();
            
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
        private void income()
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "select * from [transaction] where income > 0 and mno = @mno";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@mno", MNO);
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    decimal balance = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["income"] != DBNull.Value)
                            balance += Convert.ToDecimal(row["income"]);
                        if (row["expense"] != DBNull.Value)
                            balance -= Convert.ToDecimal(row["expense"]);

                        row["balance"] = balance; // Update balance in the DataTable itself.
                    }

                    // Update the database after updating the DataTable.
                    foreach (DataRow row in dt.Rows)
                    {
                        string uQuery = "update [transaction] set balance = @balance where id = @id";
                        using (SqlCommand ucmd = new SqlCommand(uQuery, conn))
                        {
                            ucmd.Parameters.AddWithValue("@balance", row["balance"]);
                            ucmd.Parameters.AddWithValue("@id", row["id"]);
                            ucmd.ExecuteNonQuery();
                        }
                    }

                    IncomeRepeater.DataSource = dt;
                    IncomeRepeater.DataBind();
                }
            }
        }

        private void expense()
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "select * from [transaction] where expense > 0 and mno = @mno";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@mno", MNO);
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    decimal balance = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["income"] != DBNull.Value)
                            balance += Convert.ToDecimal(row["income"]);
                        if (row["expense"] != DBNull.Value)
                            balance -= Convert.ToDecimal(row["expense"]);

                        row["balance"] = balance; // Update balance in the DataTable itself.
                    }

                    // Update the database after updating the DataTable.
                    foreach (DataRow row in dt.Rows)
                    {
                        string uQuery = "update [transaction] set balance = @balance where id = @id";
                        using (SqlCommand ucmd = new SqlCommand(uQuery, conn))
                        {
                            ucmd.Parameters.AddWithValue("@balance", row["balance"]);
                            ucmd.Parameters.AddWithValue("@id", row["id"]);
                            ucmd.ExecuteNonQuery();
                        }
                    }

                    ExpenseRepeater.DataSource = dt;
                    ExpenseRepeater.DataBind();
                }
            }
        }
        private void statement()
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "SELECT * from [transaction] where (expense>0 OR income>0) and mno=" + MNO + "";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable transaction = new DataTable();
                    decimal balance = 0;
                    foreach (DataRow row in transaction.Rows)
                    {
                        if (row["income"].ToString() != "")
                            balance += Convert.ToDecimal(row["income"]);
                        if (row["expense"].ToString() != "")
                            balance += Convert.ToDecimal(row["expense"]);
                        if (row["income"].ToString() == "")
                            row["income"] = "0";
                        if (row["expense"].ToString() == "")
                            row["expense"] = "0";
                        Session["StatementId"] = row["id"];
                    }
                    statementRepeater.DataSource = reader;
                    statementRepeater.DataBind();
                }
            }
        }
        protected void btnAddIncome_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtStartDate.Text) || string.IsNullOrWhiteSpace(txtEndDate.Text))
            {
                return; // RequiredFieldValidator already handles validation
            }

            DateTime startDate, endDate;
            if (!DateTime.TryParse(txtStartDate.Text, out startDate) || !DateTime.TryParse(txtEndDate.Text, out endDate))
            {
                return; // Handle invalid date parsing error (optional)
            }

            string mobileNumber = Session["MobileNumber"] as string;
            if (string.IsNullOrEmpty(mobileNumber))
            {
                return; // Handle the case where session is null (optional)
            }

            FetchByDateReport(startDate, endDate, mobileNumber);
        }
        private void FetchByDateReport(DateTime startDate, DateTime endDate, string mobileNumber)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT 
                    [date], 
                    ISNULL(income, 0) AS income, 
                    ISNULL(expense, 0) AS expense, 
                    category, 
                    pay_type, 
                    ISNULL(by_whom, '-') AS by_whom, 
                    ISNULL(to_whom, '-') AS to_whom, 
                    ISNULL(balance, 0) AS balance
                FROM [transaction] 
                WHERE [date] BETWEEN @StartDate AND @EndDate
                AND mno = @MobileNumber
                ORDER BY [date] ASC";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);
                    cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ByDateRepeater.DataSource = dt;
                    ByDateRepeater.DataBind();
                }
            }
        }
        
    } 
}