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


        public static string RelativeDate(DateTime theDate)

        {

            Dictionary<long, string> thresholds = new Dictionary<long, string>();

            int minute = 60;

            int hour = 60 * minute;

            int day = 24 * hour;

            thresholds.Add(60, "{0} seconds ago");

            thresholds.Add(minute * 2, "a minute ago");

            thresholds.Add(45 * minute, "{0} minutes ago");

            thresholds.Add(120 * minute, "an hour ago");

            thresholds.Add(day, "{0} hours ago");

            thresholds.Add(day * 2, "yesterday");

            thresholds.Add(day * 30, "{0} days ago");

            thresholds.Add(day * 365, "{0} months ago");

            thresholds.Add(long.MaxValue, "{0} years ago");

            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;

            foreach (long threshold in thresholds.Keys)

            {

                if (since < threshold)

                {

                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));

                    return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());

                }

            }

            return "";

        }


        private void ShowOrders()
        {
            string query = "SELECT [OrderId],[OrderDate],[OrderTotal],[ProductName],[ProductId],[ProductImage],[PersonName]," +
                "[BillingAddress],[PersonPinCode],[PersonMobile],[PaymentMode] FROM [dbo].[Order] where UserId=@UserId";
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

    }
}