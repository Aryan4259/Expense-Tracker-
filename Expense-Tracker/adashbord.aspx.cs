using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class adashbord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserStatistics();
                LoadUserList();
            }
        }
        private void LoadUserStatistics()
        {
             string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Get total users count
                SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM [user]", conn);
                lblTotalUsers.Text = cmdTotal.ExecuteScalar().ToString();

                // Get active users count
                SqlCommand cmdActive = new SqlCommand("SELECT COUNT(*) FROM [user] WHERE mno IN (SELECT mno FROM UserProfile)", conn);
                lblActiveUsers.Text = cmdActive.ExecuteScalar().ToString();

                // Calculate inactive users
                int totalUsers = Convert.ToInt32(lblTotalUsers.Text);
                int activeUsers = Convert.ToInt32(lblActiveUsers.Text);
                lblInactiveUsers.Text = (totalUsers - activeUsers).ToString();
            }
        }

        private void LoadUserList()
        {
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(@"
            SELECT u.fnm, u.lnm, u.mno, p.gmail, p.profile_image 
            FROM [user] u 
            LEFT JOIN UserProfile p ON u.mno = p.mno", conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptUsers.DataSource = dt;
                    rptUsers.DataBind();
                }
                else
                {
                    // Debugging - Show an empty state if no users are found
                    rptUsers.DataSource = null;
                    rptUsers.DataBind();
                }
            }
        }


    }
}
