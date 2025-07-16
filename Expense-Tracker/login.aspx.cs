using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string mobileNumber = txtMobileNumber.Text;
            string password = txtPassword.Text;
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from [user] where mno=@mno and pwd=@pwd", connection);
                cmd.Parameters.AddWithValue("@mno", mobileNumber);
                cmd.Parameters.AddWithValue("@pwd", password);
                Session["MobileNumber"] = txtMobileNumber.Text.ToString();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("Invalid mobiole number or password. please try again.");
                }
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgot.aspx");
        }
    }
}