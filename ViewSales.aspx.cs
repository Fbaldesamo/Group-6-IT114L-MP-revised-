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
    public partial class ViewSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        /*
        protected void ShowSales()
        {
            using (OleDbConnection xConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0; " +
               "Data Source=" + Server.MapPath("~/AppData/Cinema.mdb")))
            {
                using (OleDbCommand xCmd = new OleDbCommand())
                {
                    xCmd.Connection = xConn;
                    xConn.Open();
                    xCmd.CommandText = "SELECT SUM(Total) AS 'Total Sales' FROM MovieChoice;";
                    OleDbDataReader xReader = xCmd.ExecuteReader();

                    if (xReader.HasRows) 
                    {
                        xReader.Read();
                        Cell1.Text = xReader["Total Sales"].ToString();
                    }
                    xReader.Close();
                }
            }
        } */
    }

}