using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Group_6_IT114L_MP
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usermail"] != null)
            {
                ((Label)Master.FindControl("UsernameLBL")).Text = Session["usermail"].ToString();

                if(!IsPostBack)
                {
                    // Display user info
                    using (OleDbConnection xConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; " +
                    "Data Source=" + Server.MapPath("~/AppData/Cinema.mdb")))
                    {
                        using (OleDbCommand xCmd = new OleDbCommand())
                        {
                            xCmd.Connection = xConn;
                            xConn.Open();
                            xCmd.CommandText = "SELECT * FROM [Users] WHERE xEmail = '"
                                + Session["usermail"].ToString() + "';";
                            OleDbDataReader xReader = xCmd.ExecuteReader();

                            if (xReader.HasRows)
                            {
                                xReader.Read();
                                Firstname.Text = xReader["xFirstname"].ToString();
                                Lastname.Text = xReader["xLastname"].ToString();
                                Email.Text = xReader["xEmail"].ToString();
                                Passw.Text = xReader["xPassword"].ToString();
                                DropDownList1.SelectedValue = xReader["xPayment"].ToString();
                                Address.Text = xReader["xAddress"].ToString();
                            }
                            xReader.Close();
                        }
                    }
                }
            }
        }

        // update user info
        protected void Save_Click(object sender, EventArgs e)
        {
            using (OleDbConnection xConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; " +
                "Data Source=" + Server.MapPath("~/AppData/Cinema.mdb")))
            {
                using (OleDbCommand xCmd = new OleDbCommand())
                {
                    xCmd.Connection = xConn;
                    xCmd.CommandText = "UPDATE [Users] SET xLastname = ?, xFirstname = ?, xEmail = ?," +
                        "xPassword = ?, xPayment = ?, xAddress = ? " +
                        "WHERE xEmail = '" + Session["usermail"].ToString() + "';";

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
            Response.Write("<script>alert('Updated!');</script>");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }
    }
}