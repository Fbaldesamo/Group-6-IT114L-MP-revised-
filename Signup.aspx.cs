using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Group_6_IT114L_MP
{
    public partial class Signup1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "Select payment method")
            {
                using (OleDbConnection xConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; " +
                "Data Source=" + Server.MapPath("~/AppData/Cinema.mdb")))
                {
                    using (OleDbCommand xCmd = new OleDbCommand())
                    {
                        xCmd.Connection = xConn;
                        xCmd.CommandText = "INSERT INTO [Users] (xLastname, xFirstname, xEmail, xPassword, xPayment, xAddress) " +
                            "VALUES (@xLastname, @xFirstname, @xEmail, @xPassword, @xPayment, @xAddress)";

                        xCmd.Parameters.AddWithValue("@xLastname", Lastname.Text);
                        xCmd.Parameters.AddWithValue("@xFirstname", Firstname.Text);
                        xCmd.Parameters.AddWithValue("@xEmail", Email.Text);
                        xCmd.Parameters.AddWithValue("@xPassword", Passw.Text);
                        xCmd.Parameters.AddWithValue("@xPayment", DropDownList1.SelectedValue);
                        xCmd.Parameters.AddWithValue("@xAddress", Address.Text);

                        xConn.Open();
                        xCmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script>alert('Success!');</script>");
                Session["usermail"] = Email.Text;
                Response.Redirect("Movies.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please select payment method.');</script>");
            }
            
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FirstPage.aspx");
        }
    }
}