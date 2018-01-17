using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Klient
{
    public partial class Kthe_Pergjigje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // http://www.aspsnippets.com/Articles/How-to-bind-and-pass-query-string-in-HyperLink-in-GridView-in-ASPNet.aspx
            string ticketid = Request.QueryString["tid"];

            string conString = "Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;";
            string query = "SELECT Ticket.Subjekti AS sub, Ticket.Permbajtja AS per, Pergjigje.Permbajtja pergjper " +
                           "FROM dbo.Ticket INNER JOIN dbo.Pergjigje ON Pergjigje.TicketID = Ticket.ID " +
                           "WHERE Pergjigje.TicketID=@ticketid";

    
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ticketid", Convert.ToInt32(ticketid));
           
            SqlDataReader dr;

            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                subjekti.InnerText = dr["sub"].ToString();
                permbajtja.InnerText = dr["per"].ToString();
                pergjigja.InnerText = dr["pergjper"].ToString();
              
            }

            if (Convert.ToInt32(Session["RolID"]) == 2 || Convert.ToInt32(Session["RolID"]) == 3)
            {
                Response.Redirect("No-Access.aspx");
            }
            else
            { }
        }
    }
}