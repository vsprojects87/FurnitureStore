using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FurnitureStore.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Store/LoginOrSignup.aspx");
            }
            if (!IsPostBack)
            {
                ShowUsers();
            }
        }


        private void ShowUsers()
        {
            string query = string.Empty;
            query = @"Select Row_Number() over(Order by (Select 1)) as [Sr.No],[OrderId],PersonName, BillingAddress,PersonPinCode,PersonMobile,OrderDate, "+
				"PaymentMode,MAX(OrderTotal) AS MaxOrderTotal " +
				"FROM[dbo].[Order] " +
				"GROUP BY [OrderId],PersonName,BillingAddress,  PersonPinCode, PersonMobile, OrderDate,PaymentMode";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowUsers();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int OrderId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                cmd = new SqlCommand("Delete from [Order] where OrderId=@id", con);
                cmd.Parameters.AddWithValue("@id", OrderId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Text = "Order Remove Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Text = "Cannot Delete this Order";
                    lblMsg.CssClass = "alert alert-danger";
                }
                con.Close();
                GridView1.EditIndex = -1;
                ShowUsers();
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