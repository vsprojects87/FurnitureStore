using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace FurnitureStore.Store
{
    public partial class Checkout : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt, OrderDT;
        string query;
        int maxorderid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("LoginOrSignup.aspx");
            }
            if (!IsPostBack)
            {
                bindUserDetails();
                bindCart();
                autoincreament();
            }
        }

        // binding user detail from user database table to checkout address so we dont have to type every field
        private void bindUserDetails()
        {
            string fullName = string.Empty;

            // Split the full name into an array of strings using space as the separator

            // Now, you can access the first name and last name using the array elements

            con.Open();
            string query = "Select * from [User] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
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
            Session["personname"] = fullName;
            string firstName = nameParts[0];
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;
            txtFirstName.Text = firstName;
            txtLastName.Text = lastName;
            con.Close();
        }

        // all the products from card will be binded to checkout page once we go onto checkout from carts
        private void bindCart()
        {
            con.Open();
            string query = "Select ProductId,ProductImage,ProductName,Price,CartId from [Cart] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            OrderDT = new DataTable();
            adapter.Fill(dt);
            adapter.Fill(OrderDT);
            Session["StoredDataTable"] = OrderDT;
            // storing the values of datatable i.e datalist for future use
            ddlCheckout.DataSource = dt;
            ddlCheckout.DataBind();

            // binding total price
            cmd = new SqlCommand(" select SUM(CAST(Price AS DECIMAL(10,2))) from Cart where UserId=" + Session["userId"],con);
            Session["Total"]=cmd.ExecuteScalar();
            lblCartTotal.Text = Session["Total"].ToString();
            lblTotal.Text = Session["Total"].ToString();
            con.Close();
        }

        // this is the main function which is saving every product order record one by one from getting data from datatable
        // and each row storing records in database as a different cart product but all having same ProductId
        private void saveOrderRecords()
        {
            autoincreament();
            DataTable storedDataTable = Session["StoredDataTable"] as DataTable;
            DateTime time = DateTime.Now;
            int tprice = 0;
            bool success = false;
            foreach (DataRow row in storedDataTable.Rows)
            {
                string col1 = row["ProductId"].ToString();
                string col2 = row["ProductImage"].ToString();
                string col3 = row["ProductName"].ToString();
                string col4 = row["Price"].ToString();
                if (int.TryParse(col4, out int num))
                {
                    tprice = tprice + num;
                }
                try
                {
                    con.Open();
                    query = "Insert into [Order](OrderId,OrderDate,OrderTotal,ProductPrice,ProductName,ProductId,ProductImage" +
                        ",UserId,PersonName,BillingAddress,PersonPinCode,PersonMobile ,PaymentMode) " +
                        "values(@OrderId,@OrderDate,@OrderTotal,@ProductPrice,@ProductName,@ProductId,@ProductImage,@UserId,@PersonName,@BillingAddress,@PersonPinCode," +
                        "@PersonMobile,@PaymentMode)";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@OrderId", maxorderid);
                    cmd.Parameters.AddWithValue("@OrderDate", Convert.ToDateTime(time.ToString("yyyy-MM-dd HH:mm:ss")));
                    cmd.Parameters.AddWithValue("@OrderTotal", tprice.ToString());
                    cmd.Parameters.AddWithValue("@ProductPrice", col4);
                    cmd.Parameters.AddWithValue("@ProductName", col3);
                    cmd.Parameters.AddWithValue("@ProductId", col1);
                    cmd.Parameters.AddWithValue("@ProductImage", col2);
                    cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                    cmd.Parameters.AddWithValue("@PersonName", Session["personname"]);
                    cmd.Parameters.AddWithValue("@BillingAddress", txtAddress1.Text + txtAddress2.Text);
                    cmd.Parameters.AddWithValue("@PersonPinCode", txtPinCode.Text);
                    cmd.Parameters.AddWithValue("@PersonMobile", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@PaymentMode", "COD");
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        con.Close();
                        success = true;
                    }
                    else
                    {
                        Response.Write("<script>alert('Cannot Placed Order')</script>");
                        con.Close();
                        success = false;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
            if (success)
            {
                Response.Redirect("../Store/ThankYou.aspx");
            }
            else
            {
                Response.Write("<script>alert('Failed')</script>");
            }
        }


        // button click event for order
        protected void Button1_Click(object sender, EventArgs e)
        {
            saveOrderRecords();
        }


        // will get the max order id for next order
        public void autoincreament()
        {
            con.Open();
            cmd = new SqlCommand("select MAX(OrderId) from [Order]", con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string d = dr[0].ToString();
                if (d == null)
                {
                    maxorderid = 1;
                }
                else
                {
                    if (int.TryParse(d, out int num))
                    {
                        maxorderid = num + 1;
                    }
                }
            }
            dr.Close();
            con.Close();
        }

    }
}