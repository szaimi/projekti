using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
namespace BugReporting.Secure.Klient
{
    public partial class _default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }

            if (Convert.ToInt32(Session["RolID"]) == 2 || Convert.ToInt32(Session["RolID"]) == 3)
            {
                Response.Redirect("/Secure/Forbiden.aspx");
            }
            else
            { 
            
            }
        }


        string qry = "INSERT INTO dbo.Perdorues " +
        "( Username , PASSWORD ,Email ,Lastlogout ,RolID) " +
        "VALUES  ( @username , @password ,  @email , NULL ,1   ) " +
        "INSERT INTO dbo.Klient " +
        "  ( Emertimi ,   Lloji ,  NIPT , Email ,Adresa ,Perdorues ) " +
        "VALUES  ( @emertimi , @lloji , @nipt , @email , @adresa , SCOPE_IDENTITY())";


        private int returnCurrentKlient(string username)
        {
            // merr si parameter User.identity.Name;

            string query = "SELECT Klient.ID FROM dbo.Perdorues INNER JOIN dbo.Klient ON Klient.Perdorues = Perdorues.ID WHERE Username = @username";
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            Int32 klientid = (Int32)cmd.ExecuteScalar();
            con.Close();
            return klientid;
        }

        // This method is used to bind gridview from database
        protected void BindGridview()
        {
            // afishioj ne GW tickets e userit te loguar
            string query = "SELECT distinct Ticket.ID as tid, Klient.ID AS kid,Klient.Emertimi AS kemertimi,Softe.Emri AS semri, " +
"Softe.Pershkrimi as spershkrimi, " +
"Ticket.Subjekti AS tsub, Ticket.Permbajtja AS tper, " +
"Prioritet.Emertimi AS pemertimi, Statusi.Emertimi AS semertimi, Ticket.Data as tdata " +
"FROM Ticket INNER JOIN Klient ON Klient.ID = Ticket.KlientID " +
//"INNER JOIN Klientsofte ON Klientsofte.KlientID = Klient.ID  " +
"INNER JOIN Softe ON Softe.ID = Ticket.SoftID " +
"INNER JOIN Prioritet ON Prioritet.ID = Ticket.PrioritetID " +
"INNER JOIN Statusi ON Statusi.ID = Ticket.StatusID " +
"WHERE Ticket.KlientID = @klientid ORDER BY Ticket.Data DESC";
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");

            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            string currUser = User.Identity.Name;
            cmd.Parameters.AddWithValue("@klientid", returnCurrentKlient(currUser.ToString()));
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            con.Close();

        }



        //protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    BindGridview();
        //}

    }
}