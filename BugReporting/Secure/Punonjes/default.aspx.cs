using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Punonjes
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currUser = User.Identity.Name;
          //  lblPershendetje.Text = "Pershendetje, " + currUser;

           // SqlDataSource1.SelectParameters.Add("punonjesid", returnCurrentPunonjes(currUser));
            //SqlDataSource1.SelectParameters.Add("punonjesid").DefaultValue = "some value";
            SqlDataSource1.SelectParameters["punonjesid"].DefaultValue = returnCurrentPunonjes(currUser).ToString();

            //    https://forums.asp.net/t/1115044.aspx?Passing+Parameters+for+SqlDataSource+from+code+behind


            if (Session["RolID"].ToString() == "1" || Session["RolID"].ToString() == "3")
            {
                Response.Redirect("~/Secure/Forbiden.aspx");
            }
            else
            {


            }
        }



        private int returnCurrentPunonjes(string username)
        {
            // merr si parameter User.identity.Name;

            string query = "SELECT Punonjes.ID FROM dbo.Perdorues " +
                           "INNER JOIN dbo.Punonjes ON Punonjes.Perdorues = Perdorues.ID " +
                           "WHERE Username = @username";
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            Int32 id = (Int32)cmd.ExecuteScalar();
            con.Close();
            return id;
        }


        protected void btnPergjigje_Click(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow row = (GridViewRow)btn.NamingContainer;


            //GridViewRow row = btn.NamingContainer as GridViewRow;
            string ticketid = GridView1.DataKeys[row.RowIndex].Values[0].ToString();
            Session["TicketID"] = ticketid;
            Response.Redirect("DergoPergjigje.aspx");  
        }
    }
}