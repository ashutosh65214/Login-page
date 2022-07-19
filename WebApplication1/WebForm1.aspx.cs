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
    public partial class WebForm1 : System.Web.UI.Page
    {
        private SqlConnection obj = null;
        private SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["ConShop"].ConnectionString))
                {
                    using (cmd = new SqlCommand("usp_SignUp", obj))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MailUserId", TxtUsrId.Text);
                        cmd.Parameters.AddWithValue("@MailUserName", TxtUsrName.Text);
                        cmd.Parameters.AddWithValue("@MailUSerPwd", TxtPassword.Text);
                        cmd.Parameters.AddWithValue("@AccountCreationDate", DateTime.Today);
                        cmd.Parameters.AddWithValue("@Hobbies", ChkListHobbies.Text);

                        if (obj.State == ConnectionState.Closed)
                        {
                            obj.Open();
                        }
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Redirect("Login.aspx");

            }

        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            this.reset();
        }
        public void reset()
        {
            TxtUsrId.Text = "";
            TxtUsrName.Text = "";
            TxtPassword.Text = "";
            TxtConfirmPassword.Text = "";

        }

        protected void cvHobbies_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int ctr = 0;
            for (int i = 0; i < ChkListHobbies.Items.Count; i++)
            {
                if (ChkListHobbies.Items[i].Selected)
                {
                    ctr++;
                }
            }

            if (ctr >= 2)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}