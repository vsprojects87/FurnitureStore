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
				ShowOrders();
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
			if (e.CommandName == "LogOut")
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


		

		private void ShowOrders()
		{
			// we have only taken fields which is common for all the prodct under same order id like
			// customer name, orderid, paymentmode,etc.
			string query = "SELECT  [OrderId], BillingAddress,PersonPinCode,PersonMobile,OrderDate," +
				"PaymentMode,MAX(OrderTotal) AS MaxOrderTotal " +
				"FROM[dbo].[Order] " +
				"WHERE UserId = @UserId " +
				"GROUP BY [OrderId],BillingAddress,  PersonPinCode, PersonMobile, OrderDate,PaymentMode;";
			cmd = new SqlCommand(query, con);
			cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
			adapter = new SqlDataAdapter(cmd);
			dt = new DataTable();
			adapter.Fill(dt);
			if (dt != null)
			{
				dlOrder.DataSource = dt;
				dlOrder.DataBind();
			}
			else
			{
				lblMessage.Text = "No Orders To Show";
				lblMessage.CssClass = "alert alert-danger";
			}
		}

		protected void dlOrder_ItemDataBound(object sender, DataListItemEventArgs e)
		{

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				// Find the inner DataList control within the outer DataList
				DataList InnerDataList = (DataList)e.Item.FindControl("dlSingleOrder");

				// Retrieve the OrderID for the current item
				string orderID = DataBinder.Eval(e.Item.DataItem, "OrderId").ToString();

				// Bind the inner DataList to the records corresponding to the current OrderID
				InnerDataList.DataSource = GetOrderDetailsByOrderID(orderID); // You need to implement this method to fetch details for a specific OrderID
				InnerDataList.DataBind();

			}
		}

		private object GetOrderDetailsByOrderID(string orderID)
		{
			string query = "SELECT [OrderId],[OrderDate],[OrderTotal],[ProductName],[ProductId],[ProductImage],[ProductPrice],[PersonName]," +
							"[BillingAddress],[PersonPinCode],[PersonMobile],[PaymentMode] FROM [dbo].[Order] where OrderId=@OrderId";
			cmd = new SqlCommand(query, con);
			cmd.Parameters.AddWithValue("@OrderID", orderID);
			SqlDataAdapter adp=new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			adp.Fill(ds);
			return ds; 
		}
	}
}