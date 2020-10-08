using Newtonsoft.Json;
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

namespace ProductStore.Product
{
    public partial class Products : System.Web.UI.Page
    {
        private static IExceptionHandling logger;
        private static IAPIAccess _apiAccess;
        public Products()
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
            if (!IsPostBack)
            {
                try
                {
                    string data = _apiAccess.GetAllProducts();
                    DataTable myObjectDT = JsonConvert.DeserializeObject<DataTable>(data);
                    grdProductDetails.DataSource = myObjectDT;
                    grdProductDetails.DataBind();

                    data = _apiAccess.GetAllCategories();
                    DataTable dtCategories = JsonConvert.DeserializeObject<DataTable>(data);
                    ddlCategory.DataSource = dtCategories;
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "Id";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("All", "0"));
                }

                catch (Exception ex)
                {
                    logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                    Response.Write("<script>alert('Something Went Wrong')</script>");
                }
            }
        }

        protected void lnkViewDetails_Click(Object sender, CommandEventArgs e)
        {
            try
            {
                if (e.CommandArgument != null)
                {
                    Response.Redirect("ProductDetails?Id=" + e.CommandArgument.ToString());
                }
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                Response.Write("<script>alert('Something Went Wrong')</script>");
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductDetails.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                ProductSearch productSearch = new ProductSearch();
                productSearch.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                productSearch.ProductName = txtProductSearch.Text;

                string jsonProductDetails = JsonConvert.SerializeObject(productSearch);
                string data = _apiAccess.GetProductBySearch(jsonProductDetails);
                DataTable myObjectDT = JsonConvert.DeserializeObject<DataTable>(data);
                grdProductDetails.DataSource = myObjectDT;
                grdProductDetails.DataBind();
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                Response.Write("<script>alert('Something Went Wrong')</script>");
            }
        }
    }
}