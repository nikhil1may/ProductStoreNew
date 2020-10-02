<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.cs" Inherits="ProductStore.Product.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
        <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Product </h1>
 
  </div>
</div>

    <div>
        <div style="width:40%;margin-bottom:5% ; margin-left:10%;float:left">

            Category : <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
            </asp:DropDownList>
            
           Product Name :  <asp:TextBox ID="txtProductSearch" runat="server" CssClass="form-control">


                </asp:TextBox>
             <hr />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary btn-group-lg" />
        </div>
         <div style="width:40%;margin:1%;float:right">

            <asp:Button ID="btnAddNew" runat="server" Text="Add New Product" OnClick="btnAddNew_Click" CssClass="btn btn-success btn-lg" />
        </div>

    </div>
        <div style="width:60% ; margin:5%"> 
            <asp:GridView ID="grdProductDetails" runat="server" AutoGenerateColumns="true" CssClass="table">

                <Columns>
                    <asp:TemplateField>

                        <ItemTemplate>

                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkViewDetails_Click" Text="View Details"> </asp:LinkButton>


                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        

   </asp:Content>