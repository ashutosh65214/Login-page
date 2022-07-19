using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["s2"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                lblFirstName.Text = $"Welcome,{Session["s2"]}";
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRCon"].ConnectionString))
                {
                    using (adapter = new SqlDataAdapter("select * from Department", con))
                    {
                        ds = new DataSet();
                        adapter.Fill(ds,"Department");
                        GridDepartment.DataSource = ds.Tables["Department"];
                        GridDepartment.DataBind();
                    }

                }

                 
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            if (Session["s2"] != null)
            {
                Session.RemoveAll();
            }
            Response.Redirect("Login.aspx");
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            Response.Redirect("SendMail.aspx");
        }
    }
}