using ProductStore.Interface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using Unity;

namespace ProductStore.Utility
{
    public class APIAccess: IAPIAccess
    {
        
        public string serverName = null;

        private static IExceptionHandling logger;

       
        public APIAccess()
        {
            serverName = ConfigurationSettings.AppSettings["APIServerName"];
            GetDependentInstances();
        }

        public void GetDependentInstances()
        {
            var container = UnityConfig.Register();
            logger = container.Resolve<IExceptionHandling>();
        }



        public string GetAllProducts()
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/GetAllProducts");

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }
        public string GetProductById(int Id)
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/GetProductById/"+Id);

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }
        public string GetAllCurrencies()
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/GetAllCurrencies/");

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string GetAllCategories()
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/GetAllCategories/");

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string GetAllUnits()
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/GetAllUnits/");

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string UpdateProduct(string data)
        {
            try { 
            string result = PostMethod(data, "https://"+ serverName + "/api/Edit/UpdateProduct");

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }
        public string DeleteProduct(string Id)
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/DeleteProduct/" + Id);

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string GetCategoryById(int Id)
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/GetCategoryById/" + Id);

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string DeleteCategory(string Id)
        {
            try { 
            string result = GetMethod("https://"+ serverName + "/Home/DeleteCategory/" + Id);

            return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public  string GetMethod(string strgeturl)
        {
          
             string response = "";
            string data = string.Empty;
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                byte[] strbyte = encoding.GetBytes(strgeturl);
                System.Net.HttpWebRequest HttpWReq = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(strgeturl);
                HttpWReq.KeepAlive = false;
                HttpWReq.Method = "GET";
                HttpWReq.Timeout = 60000;
                HttpWReq.ContentType = "text/xml";
                HttpWReq.ContentLength = 0;
                using (HttpWebResponse httpResponse = HttpWReq.GetResponse() as System.Net.HttpWebResponse)
                {
                    //Get StreamReader that holds the response stream
                    using (StreamReader reader = new System.IO.StreamReader(httpResponse.GetResponseStream()))
                    {
                        response = reader.ReadToEnd();

                    }
                }

            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
            return response;          
        }

        public string PostMethod(string data , string url)
        {
            try { 
            using (var client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/json";             
                var result = client.UploadString(url, "POST", data);
                  return result;
            }
            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string UpdateCategory(string data)
        {
            try { 
            string result = PostMethod(data, "https://"+ serverName + "/api/Edit/AddUpdateCategory");
            return result;
            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string GetProductBySearch(string criteria)
        {
            try { 
            string result = PostMethod(criteria,"https://"+ serverName + "/api/Edit/SearchProduct/" );

            return result;
            }
            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }

        public string GetCategoryByName(string criteria)
        {
            try
            {
                string result = PostMethod(criteria,"https://" + serverName + "/api/Edit/SearchCategory/");

                return result;
            }

            catch (Exception ex)
            {
                logger.Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }
    }
}