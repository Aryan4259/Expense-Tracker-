using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Expense_Tracker.Expense_Tracker
{
    public partial class expense_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\PROJECT\\Expense-Tracker\\Expense-Tracker\\Expense-Tracker\\App_Data\\Expense-Tracker.mdf;Integrated Security=True;User Instance=True";
            string txt_Expense = txtExpenseAmount.Text;
            string txt_ExCategory = txtExpenseCategory.Text;
            string txt_ExPayType = txtExpensePayType.Text;
            string txt_ExToWhom = txtExpenseToWhom.Text;
            string txt_ExDate = txtExpenseDate.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("insert into [transaction] (category, income, date, pay_type, by_whom) values (@Ex_Category, @Expense, @Ex_Date, @Ex_PayType, @Ex_ToWhom)", connection);
                command.Parameters.AddWithValue("@Ex_Category", txt_ExCategory);
                command.Parameters.AddWithValue("@Expense", txt_Expense);
                command.Parameters.AddWithValue("@Ex_Date", txt_ExDate);
                command.Parameters.AddWithValue("@Ex_PayType", txt_ExPayType);
                command.Parameters.AddWithValue("@Ex_ToWhom", txt_ExToWhom);
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}