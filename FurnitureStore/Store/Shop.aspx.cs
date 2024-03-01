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
using System.Xml.Linq;
using System.Diagnostics;
using System.Runtime.Remoting.Messaging;

namespace FurnitureStore.Store
{
    public partial class Shop : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        string query;
        string ProductPrice, ProductName, ProductImage = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showJobList();
            }
        }
        private void showJobList()
        {
            if (dt == null)
            {
                string query = @"Select ProductId, ProductName, ProductPrice, ProductDescription, ProductImage from Products";
                cmd = new SqlCommand(query, con);
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }



        protected void lbAddToCart_Click(object sender, EventArgs e)
        {
            string productId = (sender as LinkButton).CommandArgument;

            if (Session["userId"] == null)
            {
                Response.Redirect("LoginOrSignup.aspx");
            }
            else
            {
                AddProductToCart(productId);
            }
        }

        private void AddProductToCart(string productId)
        {
            Session["productId"] = productId;
            try
            {
                con.Open();
                cmd = new SqlCommand("select ProductName, ProductPrice from Products where ProductId=@p1",con);
                cmd.Parameters.AddWithValue("@p1", Session["productId"]);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ProductName = reader["ProductName"].ToString();
                        ProductPrice = reader["ProductPrice"].ToString();
                        ProductImage = reader["ProductImage"].ToString();
                    }
                }
                reader.Close();
                cmd = new SqlCommand("insert into [Cart](UserId, ProductId,ProductName, Price) values(@UserId,@ProductId,@ProductName,@Price)", con);
                cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                cmd.Parameters.AddWithValue("@ProductId", Session["productId"]);
                cmd.Parameters.AddWithValue("@ProductName", ProductName);
                cmd.Parameters.AddWithValue("@Price", ProductPrice);
                cmd.Parameters.AddWithValue("@ProductImage", ProductImage);

                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    Response.Write("<script>alert('Added to cart . . .');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error');</script>");
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