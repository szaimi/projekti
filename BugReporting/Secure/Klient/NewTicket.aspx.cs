using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BugReporting.Secure.Klient
{
    public partial class NewTicket : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // http://www.aspdotnet-suresh.com/2012/10/bind-aspnet-gridview-with-datareader-in.html
            // http://www.c-sharpcorner.com/blogs/easy-steps-to-insert-data-into-sql-server-using-asp-netc-sharp1
            // http://www.c-sharpcorner.com/UploadFile/0c1bb2/fill-Asp-Net-dropdown-list-from-database-table-using-Asp-Net/  
            // http://www.c-sharpcorner.com/uploadfile/9f0ae2/gridview-edit-delete-and-update-in-asp-net/
            if (Convert.ToInt32(Session["RolID"]) == 2 || Convert.ToInt32(Session["RolID"]) == 3)
            {
                Response.Redirect("No-Access.aspx");
            }
            if (!IsPostBack)
            {
                Load_ddlPrioriteti();
                Load_ddlKlientSofte();
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        private void ClearControls()
        {
            txtSubjekti.Text = "";
            txtPermbajtja.Text = "";
        }


        private int returnCurrentKlient(string username)
        {
            // merr si parameter User.identity.Name;

            string query = "SELECT Klient.ID FROM dbo.Perdorues INNER JOIN dbo.Klient ON Klient.Perdorues = Perdorues.ID WHERE Username = @username";
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", username);
            con.Open();
            Int32 klientid = (Int32)cmd.ExecuteScalar();
            con.Close();
            return klientid;
        }

        protected void Load_ddlPrioriteti()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();

            SqlCommand com = new SqlCommand("SELECT ID, Emertimi FROM dbo.Prioritet", con); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            ddlPrioriteti.DataTextField = ds.Tables[0].Columns["Emertimi"].ToString();
            ddlPrioriteti.DataValueField = ds.Tables[0].Columns["ID"].ToString(); // to retrive specific  textfield name 
            ddlPrioriteti.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            ddlPrioriteti.DataBind();  //binding dropdownlist
            ddlPrioriteti.Items.Insert(0, new ListItem("Cakto prioritetin", "0"));
        }

        protected void Load_ddlKlientSofte()
        {

            string currentUser = User.Identity.Name.ToString();
            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            con.Open();
            string query = "SELECT dbo.Softe.* FROM dbo.Perdorues INNER JOIN dbo.Klient ON Klient.Perdorues = Perdorues.ID INNER JOIN dbo.Klientsofte ON Klientsofte.KlientID = Klient.ID INNER JOIN dbo.Softe ON Softe.ID = Klientsofte.SoftID WHERE Username= @username";
            SqlCommand com = new SqlCommand(query, con); // table name 
            com.Parameters.AddWithValue("@username", currentUser);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            ddlSofti.DataTextField = ds.Tables[0].Columns["Emri"].ToString();
            ddlSofti.DataValueField = ds.Tables[0].Columns["ID"].ToString();             // to retrive specific  textfield name 
            ddlSofti.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            ddlSofti.DataBind();  //binding dropdownlist
            ddlSofti.Items.Insert(0, new ListItem("Zgjidh softin", "0"));
        }

        protected void btnAddTicket_Click(object sender, EventArgs e)
        {
            string currUser = User.Identity.Name;

            string query = "INSERT INTO dbo.Ticket(KlientID ,SoftID,PrioritetID,StatusID,Subjekti,Permbajtja,Data)" +
                           "VALUES  (@KlientID ,@SoftID,@PrioritetID,@StatusID,@Subjekti,@Permbajtja,getdate())";

            SqlConnection con = new SqlConnection("Data Source=localhost; Initial Catalog=BugSystem; Integrated Security=true;");
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@KlientID", returnCurrentKlient(currUser.ToString()));
            cmd.Parameters.AddWithValue("@SoftID", ddlSofti.SelectedValue);
            cmd.Parameters.AddWithValue("@PrioritetID", ddlPrioriteti.SelectedValue);
            cmd.Parameters.AddWithValue("@StatusID", 4);
            cmd.Parameters.AddWithValue("@Subjekti", txtSubjekti.Text);
            cmd.Parameters.AddWithValue("@Permbajtja", txtPermbajtja.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Default.aspx");
        }
    }
}