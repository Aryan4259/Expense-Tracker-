using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "admin" && password == "admin")
            {
                Session["AdminUser"] = "admin";
                Response.Redirect("adashbord.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Username or Password!";
            }
        }

    }
}