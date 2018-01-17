using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Support
{
    public partial class Atasho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                        if(!IsPostBack)
                       {
                           LoadDepartaments();
                       }

                        if (Session["RolID"].ToString() == "1" || Session["RolID"].ToString() == "2")
                        {
                            Response.Redirect("~/Secure/Forbiden.aspx");
                        }
                        else
                        {

                        }
        }

        private void NdryshoStatus(int ticketid)
        {
             SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
             con.Open();
           // Ticjketit qe dua ta atashoj i ndryshoj stTUSID nga 4 ne 2 , nepermjet queryt me update
            string updt_query = "UPDATE Ticket SET StatusID = 2 WHERE ID = @TicketID2";
            SqlCommand cmd2 = new SqlCommand(updt_query, con);
            cmd2.Parameters.AddWithValue("@TicketID2", ticketid);

            
            cmd2.ExecuteNonQuery();
            con.Close();
            // update i kolones statusid tek tabelat e tickets , ku statusis nga pending ne proces

        }


        protected void buton1_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO dbo.Atashim( PunonjesID, TicketID, Data ) "
                          + "VALUES  ( @PunonjesID, @TicketID, GETDATE())";

            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PunonjesID", ddlPun.SelectedValue);
            cmd.Parameters.AddWithValue("@TicketID", Convert.ToInt32(Session["TicketID"]));

            // Ticjketit qe dua ta atashoj i ndryshoj stTUSID nga 4 ne 2 , nepermjet queryt me update
            string updt_query = "UPDATE dbo.Ticket" +
                                "SET StatusID = 2 " +
                                "WHERE dbo.Ticket.ID=@TicketID2";
            SqlCommand cmd2 = new SqlCommand(updt_query, con);
            cmd2.Parameters.AddWithValue("@TicketID2", Convert.ToInt32(Session["TicketID"]));

            con.Open();
            cmd.ExecuteNonQuery();
            
            con.Close();
            NdryshoStatus(Convert.ToInt32(Session["TicketID"]));
            Response.Redirect("Default.aspx");
        }

        protected void LoadDepartaments()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();

            string query = "SELECT * FROM dbo.Departament";
            SqlCommand com = new SqlCommand(query, con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            ddlDep.DataTextField = ds.Tables[0].Columns["Emertimi"].ToString();

            ddlDep.DataValueField = ds.Tables[0].Columns["ID"].ToString(); ddlDep.DataSource = ds.Tables[0];
            ddlDep.DataBind();
            ddlDep.Items.Insert(0, new ListItem("Zgjidh departamentin", "0"));
            ddlPun.Items.Insert(0, new ListItem("Zgjidh Punonjesin", "0"));
        }


        protected void ddlDep_SelectedIndexChanged(object sender, EventArgs e)
        {

            int depid = Convert.ToInt32(ddlDep.SelectedValue);
            //ddlPun.Items.Clear();
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();
            string qry = "SELECT ID, Emri + ' ' + Mbiemri as emri "  + "FROM punonjes where departament = @departament";
            SqlCommand com2 = new SqlCommand(qry, con); // table name 
            com2.Parameters.AddWithValue("@departament", depid);
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);  // fill dataset

            ddlPun.DataTextField = ds2.Tables[0].Columns["emri"].ToString();
            ddlPun.DataValueField = ds2.Tables[0].Columns["ID"].ToString();
            ddlPun.DataSource = ds2.Tables[0];

            ddlPun.DataBind();
        }




    }
}