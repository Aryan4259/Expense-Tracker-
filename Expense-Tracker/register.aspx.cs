using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            string firstName = f_nm.Text;
            string lastname = l_nm.Text;
            string mobileNumber = m_no.Text;
            string password = pwd.Text;
            string confirmPassword = c_pwd.Text;
            Session["firstname"] = f_nm.Text.ToString();
            Session["lastname"] = l_nm.Text.ToString();
            if (password == confirmPassword)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("insert into dbo.[user] (fnm, lnm, mno, pwd) values (@fnm, @lnm, @mno, @pwd)", connection);
                    cmd.Parameters.AddWithValue("@fnm", firstName);
                    cmd.Parameters.AddWithValue("@lnm", lastname);
                    cmd.Parameters.AddWithValue("@mno", mobileNumber);
                    cmd.Parameters.AddWithValue("@pwd", password);
                    
                    cmd.ExecuteReader();
                    connection.Close();
                    Response.Write("Registration Successful!");
                    Response.Redirect("login.aspx");
                }
            }
            else
            {
                Response.Write("Passwords do not match. Please try again."); 
            }
        }

        protected void c_pwd_TextChanged(object sender, EventArgs e)
        {

        }
    }
}