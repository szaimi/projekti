
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Punonjes
{
    public partial class DergoPergjigje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_ddlStatus();
            }

            if (Session["RolID"].ToString() == "1" || Session["RolID"].ToString() == "3")
            {
                Response.Redirect("~/Secure/Forbiden.aspx");
            }
            else
            {

            }
        }


        private void NdryshoStatus(int ticketid,int statusid)
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();
            // Ticjketit qe dua ta atashoj i ndryshoj stTUSID nga 2 ne 5 nose 6 , nepermjet queryt me update
            string updt_query = "UPDATE Ticket SET StatusID = @statusid WHERE ID = @TicketID2";
            SqlCommand cmd2 = new SqlCommand(updt_query, con);
            cmd2.Parameters.AddWithValue("@TicketID2", ticketid);
            cmd2.Parameters.AddWithValue("@statusid", statusid);

            cmd2.ExecuteNonQuery();
            con.Close();
            

        }

        protected void Load_ddlStatus()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();

            SqlCommand com = new SqlCommand("SELECT * FROM dbo.Statusi WHERE ID IN (5,6)", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            ddlStatus.DataTextField = ds.Tables[0].Columns["Emertimi"].ToString();
            ddlStatus.DataValueField = ds.Tables[0].Columns["ID"].ToString(); // to retrive specific  textfield name 
            ddlStatus.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            ddlStatus.DataBind();  //binding dropdownlist
            ddlStatus.Items.Insert(0, new ListItem("Cakto statusin", "0"));
        }


        protected void Button_Click(object sender, EventArgs e)
        {
            int statusi = Convert.ToInt32(ddlStatus.SelectedValue);
            string qry = "INSERT INTO dbo.Pergjigje " +
                         "( Permbajtja, TicketID ) " +
                         "VALUES  ( @Permbajtja, @TicketID)";

            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@Permbajtja", TxtPergjigje.Text);
            cmd.Parameters.AddWithValue("@TicketID", Convert.ToInt32(Session["TicketID"]));
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            NdryshoStatus(Convert.ToInt32(Session["TicketID"]), statusi);
            Response.Redirect("Default.aspx");

        }
    }
}