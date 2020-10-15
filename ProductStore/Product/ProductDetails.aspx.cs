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

namespace ProductStore.Product
{
  
    public partial class ProductDetails : System.Web.UI.Page
    {
        [Microsoft.Practices.Unity.Dependency]
        public IExceptionHandling logger { get; set; }
        [Microsoft.Practices.Unity.Dependency]
        public IAPIAccess _apiAccess { get; set; }        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                try
                {

                    // Get all Categories and bind to dropdown
                    string data = _apiAccess.GetAllCategories();
                    DataTable dtCategories = JsonConvert.DeserializeObject<DataTable>(data);
                    ddlCategory.DataSource = dtCategories;
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "Id";
                    ddlCategory.DataBind();


                    // Get all Currencies and bind to dropdown
                    string Currencydata = _apiAccess.GetAllCurrencies();
                    DataTable dtCurrency = JsonConvert.DeserializeObject<DataTable>(Currencydata);
                    ddlCurrency.DataSource = dtCurrency;
                    ddlCurrency.DataTextField = "CurrencyName";
                    ddlCurrency.DataValueField = "Id";
                    ddlCurrency.DataBind();

                    // Get all Units and bind to dropdown
                    string UnitData = _apiAccess.GetAllUnits();
                    DataTable dtUnit = JsonConvert.DeserializeObject<DataTable>(UnitData);
                    ddlUnit.DataSource = dtUnit;
                    ddlUnit.DataTextField = "UnitName";
                    ddlUnit.DataValueField = "Id";
                    ddlUnit.DataBind();

                    if (Request.QueryString["Id"] != null)
                    {
                        int Id = Convert.ToInt32(Request.QueryString["Id"]?.ToString());
                        string result = _apiAccess.GetProductById(Id);
                        dynamic dtProductDetails = JObject.Parse(result);
                        txtProductName.Text = dtProductDetails.productName;
                        ddlCategory.SelectedValue = dtProductDetails.categoryName;
                        ddlUnit.SelectedValue = dtProductDetails.unitName;
                        ddlCurrency.SelectedValue = dtProductDetails.currencyName;
                        txtPrice.Text = dtProductDetails.price;
                        txtId.Text = dtProductDetails.Id;
                        btnEdit.Text = "Update Product";
                        btnDelete.Visible = true;
                        ProductNameSaved.Text = dtProductDetails.productName;
                    }
                    else
                    {
                        txtId.Text = "0";
                        btnEdit.Text = "Add Product";
                        btnDelete.Visible = false;
                    }
                }
                
                catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                    Response.Write("<script>alert('Something Went Wrong')</script>");
                }
        }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                Models.ProductDetails productDetails = new Models.ProductDetails();
                productDetails.Id = Convert.ToInt32(txtId.Text);
                productDetails.productName = txtProductName.Text;
                productDetails.categoryName = ddlCategory.SelectedValue;
                productDetails.currencyName = ddlCurrency.SelectedValue;
                productDetails.unitName = ddlUnit.SelectedValue;
                productDetails.price = Convert.ToDecimal(txtPrice.Text);

                string jsonProductDetails = JsonConvert.SerializeObject(productDetails);

                ProductSearch productSearch = new ProductSearch();
                productSearch.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                productSearch.ProductName = txtProductName.Text;

                string checkProductName = JsonConvert.SerializeObject(productSearch);
                string data = _apiAccess.GetProductBySearch(checkProductName);
                DataTable checkProductNameDT = JsonConvert.DeserializeObject<DataTable>(data);

                if (checkProductNameDT.Rows.Count > 0 && ProductNameSaved.Text != txtProductName.Text)
                {
                     Response.Write("<script>alert('Product name Already Present')</script>");
                }

                else
                {
                    _apiAccess.UpdateProduct(jsonProductDetails);
                    if (btnEdit.Text == "Update Product")
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Product Details Updated sucessfully'); window.open('Products.aspx');", true);
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Product Details Added sucessfully'); window.open('Products.aspx');", true);

                }
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                Response.Write("<script>alert('Something Went Wrong')</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            { 
            _apiAccess.DeleteProduct(txtId.Text);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Product Details Deleted sucessfully'); window.open('ProductDetails.aspx');", true);
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                Response.Write("<script>alert('Something Went Wrong')</script>");
            }
        }
    }
}