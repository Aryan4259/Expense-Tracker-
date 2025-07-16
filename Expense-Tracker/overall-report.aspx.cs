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
    public partial class overall_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindRepeater();
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
        protected void btnSort_Click(object sender, EventArgs e)
        {
            BindRepeater();
        }

        private void BindRepeater()
        {
            string MNO = Session["MobileNumber"].ToString();
            string conn_str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string query = "SELECT * from [transaction] where mno="+MNO+"";

            if (ddlSort.SelectedValue != "")
            {
                query += "ORDER BY " + ddlSort.SelectedValue;
            }
            using (SqlConnection conn = new SqlConnection(conn_str))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable table = new DataTable();
                        adapter.Fill(table);
                        IncomeRepeater.DataSource = table;
                        IncomeRepeater.DataBind();
                    }
                }
            }
        }
    }
}