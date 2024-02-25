using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FurnitureStore.Store
{
    public partial class Store : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void lbtnProfile_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("../Store/Login.aspx");
            }
            else
            {
                Response.Redirect("Profile.aspx");
            }
        }
    }
}