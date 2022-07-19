using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private SqlConnection obj = null;
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserId.Text = Session["s1"].ToString();
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
            {
                using (cmd = new SqlCommand("usp_Send", obj))
                {    
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FromMailUserId", lblUserId.Text);
                    cmd.Parameters.AddWithValue("@ToMailUserId", TxtToMailUserId.Text);
                    cmd.Parameters.AddWithValue("@Subject", TxtSubject.Text);
                    cmd.Parameters.AddWithValue("@MailText", TxtText.Text);
                    cmd.Parameters.AddWithValue("@IsMailNew",ddlNewOrNot.Text);

                    cmd.Parameters.AddWithValue("@MaildateTime", DateTime.Today);
                    if (obj.State == ConnectionState.Closed)
                    {
                        obj.Open();
                    }
                    cmd.ExecuteNonQuery();

                   
                }
            }
            Response.Write("<script>alert('Message Sent....')</script>");
        }
    }
}