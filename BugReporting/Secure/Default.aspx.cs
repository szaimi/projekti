using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["RolID"].ToString() == "1")
            {
                Response.Redirect("~/Secure/Klient/");
            }

            else if (Session["RolID"].ToString() == "2")
            {
                Response.Redirect("~/Secure/Punonjes/");
            }

            else if (Session["RolID"].ToString() == "3")
            {
                Response.Redirect("~/Secure/Support/");
            }
            else
            { 
              
            }
        }
    }
}