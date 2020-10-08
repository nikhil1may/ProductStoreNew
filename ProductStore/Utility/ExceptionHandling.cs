using Newtonsoft.Json;
using ProductStore.Interface;
using ProductStore.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using Unity;

namespace ProductStore.Utility
{
    public class ExceptionHandling: IExceptionHandling
    {
        public string serverName = ConfigurationSettings.AppSettings["APIServerName"];


        public void Error(string ErrorMessage)
        {
            try
            {
                ErrorModel errorModel = new ErrorModel();
                errorModel.ErrorMessage = ErrorMessage;
                string jsonError = JsonConvert.SerializeObject(errorModel);
                string result = PostMethod(jsonError, "https://" + serverName + "/api/Edit/ManageLog");             
            }
            catch (Exception ex)
            {
                Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
              
            }
        }
        public string PostMethod(string data, string url)
        {
            try
            {
                using (var client = new WebClient())
                {
                    client.Headers[HttpRequestHeader.ContentType] = "application/json";
                    var result = client.UploadString(url, "POST", data);
                    return result;
                }
            }
            catch (Exception ex)
            {
               Error("StackTrace :" + ex.StackTrace + " Error Mesage : " + ex.Message + "Inner Exception :" + ex.InnerException);
                return null;
            }
        }
    }
}