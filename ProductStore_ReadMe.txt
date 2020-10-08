There are two solutions 

1.ProductStore  - This is ASP.NET Webform Project

2.ProductStoreAPI - This WebAPI Project

We are doing all the operations in ProductStoreAPI , UI part and API methods call from ProductStore.

In WebConfig of ProductStore , there is key 'APIServerName' , where we have to pass the API path , if we run it on local then localhost path should be passed here.

I have created SQL script , as this is DB first Approch . So first create database 'ProductStore' and  run the SQL script. IT will create neccessary table with data also stored procedure.

Then run 'ProductStoreAPI' Project.

After that run 'ProductStore' Project.