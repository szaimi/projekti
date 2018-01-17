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
    public partial class Klient_Softe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadKlient();
                LoadSofts();
            }

            if (Session["RolID"].ToString() == "1" || Session["RolID"].ToString() == "2")
            {
                Response.Redirect("~/Secure/Forbiden.aspx");
            }
            else
            {

            }
        }


        protected void LoadKlient()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();

            string query = "SELECT * FROM Klient";
            SqlCommand com = new SqlCommand(query, con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            ddlKlient.DataTextField = ds.Tables[0].Columns["Emertimi"].ToString();

            ddlKlient.DataValueField = ds.Tables[0].Columns["ID"].ToString(); ddlKlient.DataSource = ds.Tables[0];
            ddlKlient.DataBind();
            ddlKlient.Items.Insert(0, new ListItem("Zgjidh Klientin", "0"));
        }


        protected void LoadSofts()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();

            string query = "SELECT * FROM Softe";
            SqlCommand com = new SqlCommand(query, con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            ddlSoft.DataTextField = ds.Tables[0].Columns["Emri"].ToString();

            ddlSoft.DataValueField = ds.Tables[0].Columns["ID"].ToString(); ddlSoft.DataSource = ds.Tables[0];
            ddlSoft.DataBind();
            ddlSoft.Items.Insert(0, new ListItem("Zgjidh Software-in", "0"));
        }

        protected void btnKS_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO dbo.Klientsofte (KlientID, SoftID, DATA) " +
                           "VALUES  ( @KlientID, @SoftID, GETDATE())";

            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");

            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.Parameters.AddWithValue("@KlientID", ddlKlient.Text);
            cmd.Parameters.AddWithValue("@SoftID", ddlSoft.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            lblMsg.Text = "Te dhenat u ruajtem  ne sistem!!!";
        }
    }
}