﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FurnitureStore.Admin
{
    public partial class ContactList : System.Web.UI.Page
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
                ShowContact();
            }
        }


        private void ShowContact()
        {
            string query = string.Empty;
            query = @"Select Row_Number() over(Order by (Select 1)) as ContactId,FirstName, LastName, Email,Message from Contact";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gvContact.DataSource = dt;
            gvContact.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row =gvContact.Rows[e.RowIndex];
                int ContactId = Convert.ToInt32(gvContact.DataKeys[e.RowIndex].Values[0]);
                cmd = new SqlCommand("Delete from Contact where ContactId=@id", con);
                cmd.Parameters.AddWithValue("@id", ContactId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Text = "Contact Deleted Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Text = "Cannot Delete this Record";
                    lblMsg.CssClass = "alert alert-danger";
                }
                con.Close();
                gvContact.EditIndex = -1;
                ShowContact();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           gvContact.PageIndex = e.NewPageIndex;
            ShowContact();
        }

    }
}