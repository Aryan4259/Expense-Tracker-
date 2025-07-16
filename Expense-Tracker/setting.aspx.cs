using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class setting : System.Web.UI.Page
    {
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Expense-Tracker\\Expense-Tracker\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MobileNumber"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadUserData();
            }
        }
        private void LoadUserData()
        {
            string mobileNumber = Session["MobileNumber"].ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT u.fnm, u.lnm, u.mno, p.gmail, p.profile_image 
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
                        lblFullName.Text = "Name: " + reader["fnm"] + " " + reader["lnm"];
                        lblMobile.Text = "Mobile: " + reader["mno"];
                        txtGmail.Text = reader["gmail"] != DBNull.Value ? reader["gmail"].ToString() : "";
                        UserNameLabel.Text = reader["fnm"].ToString();
                        string profileImagePath = reader["profile_image"] != DBNull.Value ? reader["profile_image"].ToString() : "~/Images/default.png";
                        imgProfile.ImageUrl = profileImagePath;
                        ProfilePic.ImageUrl = profileImagePath;
                    }
                }
            }
        }

        protected void btnSaveGmail_Click(object sender, EventArgs e)
        {
            string mobileNumber = Session["MobileNumber"].ToString();
            string gmail = txtGmail.Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                IF EXISTS (SELECT 1 FROM UserProfile WHERE mno = @mno)
                    UPDATE UserProfile SET gmail = @gmail WHERE mno = @mno;
                ELSE
                    INSERT INTO UserProfile (mno, gmail, profile_image) VALUES (@mno, @gmail, '~/Images/default.png');";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@mno", mobileNumber);
                    cmd.Parameters.AddWithValue("@gmail", gmail);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            LoadUserData(); // Refresh page data
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUploadProfile.HasFile)
            {
                string mobileNumber = Session["MobileNumber"].ToString();
                string uploadFolderPath = Server.MapPath("~/Uploads/");

                // Ensure the Uploads folder exists
                if (!Directory.Exists(uploadFolderPath))
                {
                    Directory.CreateDirectory(uploadFolderPath);
                }

                // Generate a unique file name
                string fileName = mobileNumber + "_" + Path.GetFileName(fileUploadProfile.FileName);
                string filePath = "~/Uploads/" + fileName;
                string fullPath = Path.Combine(uploadFolderPath, fileName);

                // Save file to server
                fileUploadProfile.SaveAs(fullPath);

                // Save file path to the database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"
            IF EXISTS (SELECT 1 FROM UserProfile WHERE mno = @mno)
                UPDATE UserProfile SET profile_image = @profile_image WHERE mno = @mno;
            ELSE
                INSERT INTO UserProfile (mno, gmail, profile_image) VALUES (@mno, '', @profile_image);";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@mno", mobileNumber);
                        cmd.Parameters.AddWithValue("@profile_image", filePath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                LoadUserData(); // Refresh profile image
            }
        }

    }
}