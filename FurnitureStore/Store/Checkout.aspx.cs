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
            //if (Session["userId"] == null)
            //{
            //    Response.Redirect("LoginOrSignup.aspx");
            //}
            if (!IsPostBack)
            {
                bindUserDetails();
                bindCart();
            }
        }


        private void bindUserDetails()
        {
            string fullName = string.Empty;

            // Split the full name into an array of strings using space as the separator

            // Now, you can access the first name and last name using the array elements

            con.Open();
            string query = "Select * from [User] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", 2);
            //cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    fullName = dr["Name"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPinCode.Text = dr["PinCode"].ToString();
                    txtMobile.Text = dr["Mobile"].ToString();
                    txtAddress2.Text = dr["Address"].ToString();
                }
            }
            else
            {
                Response.Write("<h2>No Data Found</h2>");
            }
            string[] nameParts = fullName.Split(' ');
            string firstName = nameParts[0];
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;
            txtFirstName.Text = firstName;
            txtLastName.Text = lastName;
            con.Close();
        }


        private void bindCart()
        {
            con.Open();
            string query = "Select ProductName,Price from [Cart] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", 1);
            //cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            ddlCheckout.DataSource = dt;
            ddlCheckout.DataBind();
            con.Close();
        }

    }
}