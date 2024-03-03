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
                dlCart.Focus();
            }
        }


        private void showCartItems()
        {
            string query = "Select CartId,ProductImage,ProductName,Price from [Cart] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            // storing cart data into session for further use
            Session["StoredCartData"] = dt;
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
            DataTable storedDataTable = Session["StoredCartData"] as DataTable;

            foreach (DataRow row in storedDataTable.Rows)
            {
                string col1 = row["Price"].ToString();

                foreach (DataListItem item in dlCart.Items)
                {
                    TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");

                    if (int.TryParse(txtQuantity.Text, out int quantity)&& int.TryParse(col1, out int Price))
                    {
                        int cartId = Convert.ToInt32(dlCart.DataKeys[item.ItemIndex]);                        
                        int quantityWisePrice = Price * quantity;
                        // Insert data into the database for each item
                        InsertIntoDatabase(cartId, quantity, quantityWisePrice);
                    }
                    else
                    {
                        // Handle invalid quantity (not a valid integer) for this item
                    }
                }
            }

            //Response.Redirect("Checkout.aspx");
        }

        private void InsertIntoDatabase(int cartID, int quantity, int quantityWisePrice)
        {
            con.Open();
            string query = "update [Cart] set Quantity=@Quantity, QuantityWisePrice=@QuantityWisePrice where CartId= "+cartID+" ";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Quantity", quantity.ToString());
            cmd.Parameters.AddWithValue("@QuantityWisePrice", quantityWisePrice.ToString());
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }


}