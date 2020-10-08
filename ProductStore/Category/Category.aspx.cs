using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ProductStore.Interface;
using ProductStore.Models;
using ProductStore.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Unity;

namespace ProductStore.Category
{
    public partial class Category : System.Web.UI.Page
    {
        private static IExceptionHandling logger;
        private static IAPIAccess _apiAccess;
        public Category()
        {
            GetDependentInstances();
        }

        public void GetDependentInstances()
        {
            var container = UnityConfig.Register();
            _apiAccess = container.Resolve<IAPIAccess>();
            logger = container.Resolve<IExceptionHandling>();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    string data = _apiAccess.GetAllCategories();
                    DataTable dtCategories = JsonConvert.DeserializeObject<DataTable>(data);
                    grdCatgory.DataSource = dtCategories;
                    grdCatgory.DataBind();
                    txtCategoryId.Text = "0";
                }
                catch(Exception ex)
                {
                    logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                }
            }
        }
        protected void lnkDelete_Click(Object sender, CommandEventArgs e)
        {
            try
            {
                if (e.CommandArgument != null)
                {
                    ProductSearch productSearch = new ProductSearch();
                    productSearch.CategoryId = Convert.ToInt32(e.CommandArgument);
                    productSearch.ProductName = "";

                    string jsonProductDetails = JsonConvert.SerializeObject(productSearch);
                    string data = _apiAccess.GetProductBySearch(jsonProductDetails);
                    DataTable myObjectDT = JsonConvert.DeserializeObject<DataTable>(data);

                    if (myObjectDT.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('You Can Not Delete This Category, Products Associated')</script>");
                    }

                    else
                    {

                        _apiAccess.DeleteCategory(e.CommandArgument.ToString());
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Category Deleted sucessfully'); window.open('Category.aspx');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                Response.Write("<script>alert('Something Went Wrong')</script>");
            }
        }
        protected void lnkEdit_Click(Object sender, CommandEventArgs e)
        {
            try { 
            if (e.CommandArgument != null)
            {
                int Id = Convert.ToInt32(e.CommandArgument.ToString());
                string result = _apiAccess.GetCategoryById(Id);
                dynamic catgoryData = JObject.Parse(result);
                txtCategory.Text = catgoryData.CategoryName;
                txtCategoryId.Text = catgoryData.Id;
                btnAddUpdateCategory.Text = "Update Category";
               
            }
            else
            {
                btnAddUpdateCategory.Text = "Add Category";
                txtCategoryId.Text = "0";

                }
            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                  Response.Write("<script>alert('Something Went Wrong')</script>");
            }
        
        }

        protected void btnAddUpdateCategory_Click(object sender, EventArgs e)
        {
            try { 
            Models.CategoryDetails categoryDetails = new Models.CategoryDetails();
            categoryDetails.Id = Convert.ToInt32(txtCategoryId.Text);
                categoryDetails.CategoryName = txtCategory.Text.TrimEnd().TrimStart(); ;          

            string jsonProductDetails = JsonConvert.SerializeObject(categoryDetails);

                string checkData = _apiAccess.GetCategoryByName(jsonProductDetails);
                DataTable dtCategories = JsonConvert.DeserializeObject<DataTable>(checkData);
                if (dtCategories.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Category Name Already Present')</script>");
                }

                else
                {
                    _apiAccess.UpdateCategory(jsonProductDetails);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Category Details Added/Updated sucessfully'); window.open('Category.aspx');", true);
                }
            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
            Response.Write("<script>alert('Something Went Wrong')</script>");
        }
    
        }
    }
}