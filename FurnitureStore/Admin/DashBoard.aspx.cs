using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FurnitureStore.Admin
{
	public partial class DashBoard : System.Web.UI.Page
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
			bindLabels();
		}

		private void bindLabels()
		{
			con.Open();
			cmd = new SqlCommand("select COUNT(*) from [Products]", con);
			int te = (int)cmd.ExecuteScalar();
			lblProducts.Text = te.ToString();

			cmd = new SqlCommand("select COUNT(Distinct OrderId) from [Order]", con);
			int td = (int)cmd.ExecuteScalar();
			lblOrders.Text = td.ToString();
			con.Close();
		}

	}
}