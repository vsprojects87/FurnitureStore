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
        int r;

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
                autoincreament();
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
            Session["personname"] = fullName;
            string firstName = nameParts[0];
            string lastName = nameParts.Length > 1 ? nameParts[1] : string.Empty;
            txtFirstName.Text = firstName;
            txtLastName.Text = lastName;
            con.Close();
        }


        private void bindCart()
        {
            con.Open();
            string query = "Select ProductId,ProductImage,ProductName,Price,CartId from [Cart] where UserId=@UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", 1);
            //cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            OrderDT = new DataTable();
            adapter.Fill(dt);
            adapter.Fill(OrderDT);
            Session["StoredDataTable"] = OrderDT;
            // storing the values of datatable i.e datalist for future use
            ddlCheckout.DataSource = dt;
            ddlCheckout.DataBind();
            con.Close();
        }

        private void saveOrderRecords()
        {
            DataTable storedDataTable = Session["StoredDataTable"] as DataTable;
            // Assuming you already have a DataTable named "storedDataTable"
            List<Dictionary<string, string>> rows = new List<Dictionary<string, string>>();

            foreach (DataRow row in storedDataTable.Rows)
            {
                Dictionary<string, string> rowData = new Dictionary<string, string>();

                foreach (DataColumn col in storedDataTable.Columns)
                {
                    // Access the value in the current cell
                    object cellValue = row[col];

                    // Convert the cell value to string (handling null values gracefully)
                    string stringValue = cellValue?.ToString() ?? "";

                    // Add the column name and corresponding cell value to the rowData dictionary
                    rowData.Add(col.ColumnName, stringValue);
                }

                // Add the rowData dictionary to the rows list
                rows.Add(rowData);
            }

            // Display or use the data as needed
            foreach (var row in rows)
            {
                string pid = string.Empty;
                string pimg = string.Empty;
                string pname = string.Empty;
                string pprice=string.Empty;
                int tprice = 0;
                DateTime time = DateTime.Now;
                foreach (var kvp in row)
                {
                    Label1.Text += kvp.Value + " : "  ;
                    //pid=kvp.Value;
                    //pimg = kvp.Value;
                    //pname = kvp.Value;
                    //pprice = kvp.Value;
                    //if (int.TryParse(pprice, out int intValue))
                    //{
                    //    tprice = tprice + intValue;
                    //}

                }
                Response.Write(" <br/>");

                //try
                //{
                //    con.Open();
                //    string query = "Insert into [Order]([OrderId],[OrderDate],[OrderTotal],[ProductName],[ProductId],[ProductImage]" +
                //        ",[UserId],[PersonName],[BillingAddress],[PersonPinCode],[PersonMobile] ,[PaymentMode]) " +
                //        "values(@OrderId,@OrderDate,@OrderTotal,@ProductName,@ProductId,@ProductImage,@UserId,@PersonName,@BillingAddress,@PersonPinCode," +
                //        "@PersonMobile,@PaymentMode)";
                //    cmd = new SqlCommand(query, con);
                //    cmd.Parameters.AddWithValue("@OrderId", r);
                //    cmd.Parameters.AddWithValue("@OrderDate", time.ToString("yyyy-MM-dd HH:mm:ss"));
                //    cmd.Parameters.AddWithValue("@OrderTotal", Convert.ToInt32(tprice));
                //    cmd.Parameters.AddWithValue("@ProductName", pname);
                //    cmd.Parameters.AddWithValue("@ProductId", pid);
                //    cmd.Parameters.AddWithValue("@ProductImage", pimg);
                //    cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                //    cmd.Parameters.AddWithValue("@PersonName", Session["personname"]);
                //    cmd.Parameters.AddWithValue("@BillingAddress", txtAddress1.Text + txtAddress2.Text);
                //    cmd.Parameters.AddWithValue("@PersonPinCode", txtPinCode.Text);
                //    cmd.Parameters.AddWithValue("@PersonMobile", txtMobile.Text);
                //    cmd.Parameters.AddWithValue("@PaymentMode", "COD");
                //    int res = cmd.ExecuteNonQuery();
                //    if (res > 0)
                //    {
                //        Response.Write("<script>alert('Order Placed Successfully')</script>");
                //        Response.Redirect("../Store/ThankYou.aspx");
                //    }
                //    else
                //    {
                //        Response.Write("<script>alert('Cannot Placed Order')</script>");
                //    }
                //    con.Close();
                //} catch(Exception ex)
                //{
                //    Response.Write("<script>alert('"+ex.Message+"')</script>");
                //}
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            saveOrderRecords();
        }

        public void autoincreament()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select max(OrderId) from [Order]", con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string d = dr[0].ToString();
                if (d == "")
                {
                   r = 1;
                }
                else
                {
                    r = Convert.ToInt16(d[0].ToString());
                    r = r + 1;
                }
            }
            dr.Close();
            con.Close();

        }

    }
}