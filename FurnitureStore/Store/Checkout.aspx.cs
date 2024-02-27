using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FurnitureStore.Store
{
    public partial class Checkout : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("LoginOrSignup.aspx");
            }
            if (!IsPostBack)
            {
                bindUserDetails();
            }
        }

        private void bindUserDetails()
        {
            string fullName = string.Empty;

            // Split the full name into an array of strings using space as the separator

            // Now, you can access the first name and last name using the array elements


            string query = "Select * from [Cart] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    fullName = dr["Name"].ToString();
                    txtEmail.Text = dr["Address"].ToString();
                    txtPinCode.Text = dr["Address"].ToString();
                    txtMobile.Text = dr["Address"].ToString();
                }
            }
            else3
            {
                Response.Write("<h2>No Data Found</h2>");
            }
            string[] nameParts = fullName.Split(' ');
            string firstName = nameParts[0];
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;
        }

    }
}