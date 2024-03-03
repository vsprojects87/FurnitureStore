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
    public partial class Cart : System.Web.UI.Page
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
                showCartItems();
            }
        }


        private void showCartItems()
        {
            string query = "Select ProductName,Price from [Cart] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            if (dt != null)
            {
                dlCart.DataSource = dt;
                dlCart.DataBind();
            }
            else
            {
                Response.Write("<h2>No Items In the Cart</h2>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}