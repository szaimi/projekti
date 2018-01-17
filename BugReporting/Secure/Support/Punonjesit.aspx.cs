using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Support
{
    public partial class Punonjesit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RolID"].ToString() == "1" || Session["RolID"].ToString() == "2")
            {
                Response.Redirect("~/Secure/Forbiden.aspx");
            }
            else
            {

            }
        }
    }
}