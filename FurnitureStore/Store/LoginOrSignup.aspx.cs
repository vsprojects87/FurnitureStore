using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FurnitureStore.Store
{
    public partial class LoginOrSignup : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelSignIn.Visible = true;
                PanelSignUp.Visible = false;
            }
        }

        protected void lbsignin_Click(object sender, EventArgs e)
        {
            PanelSignIn.Visible = true;
            PanelSignUp.Visible = false;
        }

        protected void lbsignup_Click(object sender, EventArgs e)
        {
            PanelSignIn.Visible = false;
            PanelSignUp.Visible = true;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("insert into User(Name,Password,Email,Address,Mobile) values(@Name,@Password,@Email,@Address,@Mobile)", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);

                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    PanelSignIn.Visible = true;
                    PanelSignUp.Visible = false;
                    lblMessage.Visible = true;
                    lblMessage.Text = "Sign Up Successful";
                    lblMessage.CssClass = "alert alert-success";
                    clear();
                }
                else
                {
                    lblMessage.Text = "Try Again Later";
                    lblMessage.CssClass = "alert alert-danger";
                    clear();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
                lblMessage.Focus();
            }
        }

        private void clear()
        {
            //txtFName.Text = string.Empty;
            //txtLName.Text = string.Empty;
            //txtEmail.Text = string.Empty;
            //txtMessage.Text = string.Empty;

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {

        }
    }
}