using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Support
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string currUser = User.Identity.Name;
           // lblPershendetje.Text = "Pershendetje, " + currUser;

            if (Session["RolID"].ToString() == "1" || Session["RolID"].ToString() == "2")
            {
                Response.Redirect("~/Secure/Forbiden.aspx");
            }
            else
            {

            }
        }

       

        protected void btnAtasho_Click(object sender, EventArgs e)
        {
            // https://weblogs.asp.net/gurusarkar/get-gridview-rowindex-upon-button-click

            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow row = (GridViewRow)btn.NamingContainer;


            //GridViewRow row = btn.NamingContainer as GridViewRow;
            string ticketid = GridView1.DataKeys[row.RowIndex].Values[0].ToString();
            Session["TicketID"] = ticketid;
            Response.Redirect("Atasho.aspx");     
        }

      
    }
}