using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BugReporting.Secure.Support
{
    public partial class NewKlient : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {

            string query = "INSERT INTO dbo.Perdorues " +
                    " ( Username ,PASSWORD ,Email ,Lastlogout , RolID) " +
                    "VALUES  ( @Username ,@PASSWORD ,@Email1 ,NULL , 1); " +
                    "INSERT INTO dbo.Klient " +
                    "( Emertimi ,Lloji ,NIPT ,Email ,Adresa ,Perdorues) " +
                    "VALUES  (@Emertimi ,@Lloji ,@NIPT ,@Email2 ,@Adresa , SCOPE_IDENTITY())";

            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");

            SqlCommand cmd1 = new SqlCommand(query, con);
            con.Open();
            cmd1.Parameters.AddWithValue("@Username", TxtUsername.Text);
            cmd1.Parameters.AddWithValue("@PASSWORD", TxtPassword.Text);
            cmd1.Parameters.AddWithValue("@Email1", TxtEmail.Text);
            cmd1.Parameters.AddWithValue("@Email2", TxtEmail.Text);
            cmd1.Parameters.AddWithValue("@Emertimi", TxtEmk.Text);
            cmd1.Parameters.AddWithValue("@Lloji", Txtlloji.Text);
            cmd1.Parameters.AddWithValue("@NIPT", TxtNipt.Text);
            cmd1.Parameters.AddWithValue("@Email", TxtEmail.Text);
            cmd1.Parameters.AddWithValue("@Adresa", TxtAdresa.Text);
            cmd1.ExecuteNonQuery();
                    con.Close();
                     lblmesazh.Text = "Te dhenat u ruajtem  ne sistem!!!";

        }
    }
}








