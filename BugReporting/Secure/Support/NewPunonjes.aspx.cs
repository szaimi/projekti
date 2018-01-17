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
    public partial class NewPunonjes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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



        protected void LoadDepartaments()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();

            string query = "SELECT * FROM dbo.Departament";
            SqlCommand com = new SqlCommand(query, con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            DropDownListDep.DataTextField = ds.Tables[0].Columns["Emertimi"].ToString();

            DropDownListDep.DataValueField = ds.Tables[0].Columns["ID"].ToString(); DropDownListDep.DataSource = ds.Tables[0];
            DropDownListDep.DataBind();
            DropDownListDep.Items.Insert(0, new ListItem("Zgjidh departamentin", "0"));
        }

        protected void btn_Punonjes_Click(object s, EventArgs e)
        {
            string query = "INSERT INTO dbo.Perdorues " +
                   " ( Username ,PASSWORD ,Email ,Lastlogout , RolID) " +
                   "VALUES  ( @Username ,@PASSWORD ,@Email ,NULL , 2); " +
                   "INSERT INTO dbo.Punonjes " +
                   "( Emri ,Mbiemri ,Departament ,Perdorues) " +
                   "VALUES  ( @Emri ,@Mbiemri ,@Departament , SCOPE_IDENTITY()) ";

            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");

            SqlCommand cmd1 = new SqlCommand(query, con);
            con.Open();
            cmd1.Parameters.AddWithValue("@Username", txtUsername.Text);
            cmd1.Parameters.AddWithValue("@PASSWORD", txtPassword.Text);
            cmd1.Parameters.AddWithValue("@Email", txtEmail.Text);
           
            cmd1.Parameters.AddWithValue("@Emri", Txtemri.Text);
            cmd1.Parameters.AddWithValue("@Mbiemri", Txtmbiemri.Text);
            cmd1.Parameters.AddWithValue("@Departament ", DropDownListDep.SelectedValue);
            cmd1.ExecuteNonQuery();
            con.Close();
            lblMesazh.Text = "Te dhenat u ruajtem  ne sistem!!!";
        }

     
    }
}