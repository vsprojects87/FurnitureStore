using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
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
        SqlCommand cmd;
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
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into [User](Name,Password,Email,Address,Mobile) values(@Name,@Password,@Email,@Address,@Mobile)", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword2.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());

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
            txtName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtMobile.Text = string.Empty;
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmailOrMobile.Text == "admin")
                {
                    string username = ConfigurationManager.AppSettings["username"];
                    string password = ConfigurationManager.AppSettings["password"];
                    if (username == txtEmailOrMobile.Text.Trim() && password == txtPassword.Text.Trim())
                    {
                        Session["admin"] = username;
                        Response.Redirect("../Admin/Dashboard.aspx");
                    }
                    else
                    {
                        showErrorMsg("admin");
                    }
                }
                else
                {
                    string query = @"Select * from [User] where Mobile=@Mobile and Password=@Password";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Mobile", txtEmailOrMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["Name"] = reader["Name"].ToString();
                        Session["userId"] = reader["UserId"].ToString();
                        Response.Redirect("Default.aspx", false);
                    }
                    else
                    {
                        showErrorMsg("Name");
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                con.Close();
            }
        }

        private void showErrorMsg(string UserType)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "<b>" + UserType + " </b> Credentials are incorrect !";
            lblMessage.CssClass = "alert alert-danger";
        }
    }
}