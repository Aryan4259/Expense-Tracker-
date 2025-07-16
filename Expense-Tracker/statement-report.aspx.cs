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
    public partial class statement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    IncomeRepeater.DataSource = reader;
                    IncomeRepeater.DataBind();
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
        }
        protected void EditButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("statement-report-edit.aspx");
        }
    }
}