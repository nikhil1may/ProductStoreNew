using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductStore.Interface
{
    interface IAPIAccess
    {
        string GetAllProducts();
        string GetProductById(int Id);
        string GetAllCurrencies();
        string GetAllCategories();
        string GetAllUnits();
        string UpdateProduct(string data);
        string DeleteProduct(string Id);
        string UpdateCategory(string data);
        string DeleteCategory(string Id);
        string GetCategoryById(int Id);
        string GetMethod(string url);
        string PostMethod(string data, string url);
        string GetProductBySearch(string criteria);
        string GetCategoryByName(string criteria);
    }
}
