using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //if (txtUsr.Text == "macintosh" && txtPwd.Text == "macintosh")
            //{
            //    FormsAuthentication.RedirectFromLoginPage(txtUsr.Text, false);
            //}

            string conString = "Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;";
            string query = "SELECT * FROM perdorues WHERE username=@username and password=@password";
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand(query, con);
            
            cmd.Parameters.AddWithValue("@username", txtUsr.Text);
            cmd.Parameters.AddWithValue("@password", txtPwd.Text);
            cmd.Connection = con;
            SqlDataReader dr;

            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["RolID"] = dr["RolID"].ToString();
                FormsAuthentication.RedirectFromLoginPage(txtUsr.Text, false);
            }

            else
            {
                lblError.Text = "Kredencialet e ofruara jane gabim, Ju lutemi provojeni perseri!!!";
            }
        }
    }
}