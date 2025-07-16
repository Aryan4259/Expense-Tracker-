using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class forgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_Click(object sender, EventArgs e)
        {
            string mobileNumber = mno.Text;
            string password1 = pwd1.Text;
            string password2 = pwd2.Text;

            if (password1 == password2)
            {
                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("update [user] set pwd=@pwd where mno=@mno", connection);
                    command.Parameters.AddWithValue("@mno", mobileNumber);
                    command.Parameters.AddWithValue("@pwd", password1);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("Password updated successfully!");
                        Response.Redirect("login.aspx");
                    }
                    else
                    {
                        Response.Write("Mobile number not found. Please try again.");
                    }
                }
            }
            else
            {
                Response.Write("Passwords do not match. Please try again.");
            }
        }
    }
}