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
    public partial class number_range_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
        }
        protected void btnAddIncome_Click(object sender, EventArgs e)
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "select * from [transaction] where balance BETWEEN @minBalance and @maxBalance and mno="+MNO+"";

            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@minBalance", minbal.Text);
                    cmd.Parameters.AddWithValue("@maxBalance", maxbal.Text);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        DataTable table = new DataTable();
                        table.Load(reader);
                        IncomeRepeater.DataSource = table;
                        IncomeRepeater.DataBind();                  
                    }
                }
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
            Response.Redirect("number-range-report-edit.aspx");
        }
    }
}