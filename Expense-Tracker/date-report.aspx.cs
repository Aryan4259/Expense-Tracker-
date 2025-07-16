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
    public partial class date_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnAddIncome_Click(object sender, EventArgs e)
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = @"SELECT t1.*, t2.balance from [transaction] t1 inner join(select date, sum(income)-sum(expense) as balance from [transaction] where date between @StartDate and @EndDate group by date) t2 on t1.date=t2.date where t1.date between @StartDate and @EndDate and mno=" + MNO + "";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
                cmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);

                decimal balance = 0;
                foreach (DataRow row in dt.Rows)
                {
                    if (row["income"].ToString() != "")
                        balance += Convert.ToDecimal(row["income"]);
                    if(row["expense"].ToString() != "")
                        balance -= Convert.ToDecimal(row["expense"]);
                    Session["DateId"] = row["id"];
                }
                IncomeRepeater.DataSource = dt;
                IncomeRepeater.DataBind();
            }
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button deletebutton = (Button)sender;
            string id = deletebutton.CommandArgument;
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "delete from [transaction] where id = @id";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
            }
            IncomeRepeater.DataBind();
        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("date-report-edit.aspx");
        }
    }
}