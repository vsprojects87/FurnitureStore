using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FurnitureStore.Store
{
    public partial class Profile : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("../Store/LoginOrSignup.aspx");
            }
            if (!IsPostBack)
            {
                showUserProfile();
            }
        }

        private void showUserProfile()
        {
            string query = "Select UserId, Name,Email,Mobile, Address, PinCode from [User] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            if (dt != null)
            {
                dlProfile.DataSource = dt;
                dlProfile.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please Login again with new username');</script>");
            }
        }

        protected void dlProfile_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "EditUserProfile")
            {
                Response.Redirect("ProfileUpdate.aspx?id=" + e.CommandArgument.ToString());
            }
            if(e.CommandName == "LogOut")
            {
                Session.Abandon();
                Response.Redirect("../Store/Default.aspx");
            }
        }

        protected void btnDeleteProfile_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                cmd = new SqlCommand("delete from [User] where UserId=@p1", con);
                cmd.Parameters.AddWithValue("@p1", Session["userId"].ToString());
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    Response.Write("<script>alert('Account Deleted Successfully');</script>");
                    Session.Abandon();
                    Response.Redirect("../Store/Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Try again Later, Something Went Wrong !');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            finally
            {
                con.Close();
            }
        }
    }
}