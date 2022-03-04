using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace Group_6_IT114L_MP
{
    public partial class ManageAcc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Insert(object sender, EventArgs e)
        {
            using (OleDbConnection xConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; " +
                "Data Source=" + Server.MapPath("~/AppData/Cinema.mdb")))
            {
                using (OleDbCommand xCmd = new OleDbCommand())
                {
                    xCmd.Connection = xConn;
                    xCmd.CommandText = "INSERT INTO [Users] (xLastname, xFirstname, xEmail, xPassword, xPayment, xAddress) " +
                        "VALUES (@xLastname, @xFirstname, @xEmail, @xPassword, @xPayment, @xAddress)";

                    xCmd.Parameters.AddWithValue("@xLastname", LastTB.Text);
                    xCmd.Parameters.AddWithValue("@xFirstname", FirstTB.Text);
                    xCmd.Parameters.AddWithValue("@xEmail", EmailTB.Text);
                    xCmd.Parameters.AddWithValue("@xPassword", PasswordTB.Text);
                    xCmd.Parameters.AddWithValue("@xPayment", PaymentDDL.SelectedValue);
                    xCmd.Parameters.AddWithValue("@xAddress", AddressTB.Text);

                    xConn.Open();
                    xCmd.ExecuteNonQuery();
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}