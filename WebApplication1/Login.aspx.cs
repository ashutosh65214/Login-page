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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private SqlConnection obj = null;
        private SqlCommand cmd = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSignIn_Click(object sender, EventArgs e)
        {
            using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
            {
                using (cmd = new SqlCommand("select * from MailUsers where MailUserId=@MailUserId and MailUserPwd=@MailuserPwd", obj))
                {
                    Session["s1"] = TxtUsrId.Text;
                    cmd.Parameters.AddWithValue("@MailUserId", TxtUsrId.Text);
                    cmd.Parameters.AddWithValue("@MailuserPwd", TxtPassword.Text);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        //fetch user name from database
                        using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
                        {
                            using (cmd = new SqlCommand("select MailUserName from MailUsers where MailUserId=@MailUserId", obj))
                            {
                                if (obj.State == ConnectionState.Closed)
                                {
                                    obj.Open();
                                }

                                cmd.Parameters.AddWithValue("@MailUserId", TxtUsrId.Text);
                                SqlDataReader dr = cmd.ExecuteReader();
                                while (dr.Read())
                                {
                                    Session["s2"] = dr.GetValue(0).ToString();
                                }

                                obj.Close();
                            }
                        }
                            Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid user id and password')</script>");
                    }
                    
                }
            }
        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}