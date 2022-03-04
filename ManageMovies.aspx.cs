using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Group_6_IT114L_MP
{
    public partial class ManageMovies : System.Web.UI.Page
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
                    xCmd.CommandText = "INSERT INTO [Movies] (Mov_name, Mov_time, Mov_date) " +
                        "VALUES (@Mov_name, @Mov_time, @Mov_date)";

                    xCmd.Parameters.AddWithValue("@Mov_name", MovName.Text);
                    xCmd.Parameters.AddWithValue("@Mov_time", MovTime.Text);
                    xCmd.Parameters.AddWithValue("@Mov_date", MovDate.Text);

                    xConn.Open();
                    xCmd.ExecuteNonQuery();
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}