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
    public partial class NewProducts : System.Web.UI.Page
    {
        static string s = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlCommand cmd;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Store/LoginOrSignup.aspx");
            }
            Session["title"] = "Add Job";
            if (!IsPostBack)
            {
                FillData();
            }
        }


        private void FillData()
        {
            if (Request.QueryString["id"] != null)
            {
                query = "select * from Products where ProductId='" + Request.QueryString["id"] + "' ";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtProductName.Text = sdr["ProductName"].ToString();
                        txtProductPrice.Text = sdr["ProductPrice"].ToString();
                        txtDescription.Text = sdr["ProductDescription"].ToString();
                        txtCategory.Text = sdr["ProductCategory"].ToString();
                        btnAdd.Text = "Update";
                        linkBack.Visible = true;
                        Session["title"] = "Edit Product";
                        // when we will get the id back to edit the information we want text of save button to change to Update and
                        // we want to show linkbutton once we are on edit menu so we can go back to view jobs
                        // we also want to change title of the page when we are updating from Add job to edit job thats why on page load 
                        // we will load the data if have requested id on edit otherwise it will continue to add job
                    }
                }
                else
                {
                    lblMsg.Text = "Job Not Found";
                    lblMsg.CssClass = "alert alert-danger";
                }
                sdr.Close();
                con.Close();
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type, concatQuery, imagePath = string.Empty;
                bool isValidToExecute = false;
                if (Request.QueryString["id"] != null)
                {
                    if (fuItemImage.HasFile)
                    {
                        if (IsValidExtention(fuItemImage.FileName))
                        {
                            concatQuery = "ProductImage=@ProductImage, ";
                        }
                        else
                        {
                            concatQuery = string.Empty;
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }
                    query = @"Update Products set ProductName=@ProductName, ProductPrice=@ProductPrice, ProductDescription=@ProductDescription,ProductCategory=@ProductCategory, " + concatQuery + " where ProductId=@id";
                    type = "updated";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductDescription", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductCategory", txtCategory.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                    if (fuItemImage.HasFile)
                    {
                        if (IsValidExtention(fuItemImage.FileName))
                        {
                            Guid obj = new Guid();
                            imagePath = "Images/" + obj.ToString() + fuItemImage.FileName;
                            fuItemImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuItemImage.FileName);
                            cmd.Parameters.AddWithValue("@ProductImage", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg,.jpeg,.png file for Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Please Select the Image Fie";
                        lblMsg.CssClass = "alert alert-danger";
                        //cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        //isValidToExecute = true;
                    }
                }
                else
                {
                    query = @"Insert into Products(ProductName,ProductCategory,ProductPrice,ProductDescription,ProductImage) values(@ProductName,@ProductCategory,@ProductPrice,@ProductDescription,@ProductImage)";
                    type = "saved";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductCategory", txtCategory.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductPrice", txtProductPrice.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductDescription", txtDescription.Text.Trim());
                    if (fuItemImage.HasFile)
                    {
                        if (IsValidExtention(fuItemImage.FileName))
                        {
                            Guid obj = new Guid();
                            imagePath = "Images/" + obj.ToString() + fuItemImage.FileName;
                            fuItemImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuItemImage.FileName);
                            cmd.Parameters.AddWithValue("@ProductImage", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg,.jpeg,.png file for Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Please Select the Image Fie";
                        lblMsg.CssClass = "alert alert-danger";
                        //cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        //isValidToExecute = true;
                    }
                }

                if (isValidToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "Job " + type + " Successful . . !";
                        lblMsg.CssClass = "alert alert-success";
                        clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot" + type + "the Records, Please Try After Some Time";
                        lblMsg.CssClass = "alert alert-danger";
                    }
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


        private bool IsValidExtention(string fileName)
        {
            bool isValid = false;
            string[] filExtentions = { ".jpg", ".jpeg", ".png" };
            for (int i = 0; i <= filExtentions.Length - 1; i++)
            {
                if (fileName.Contains(filExtentions[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
         //this is checking whether the extention is valid or not


        public void clear() 
        {
            txtProductName.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtCategory.Text = string.Empty;
        }
    }
}