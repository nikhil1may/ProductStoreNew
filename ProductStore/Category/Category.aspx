<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Category.aspx.cs" Inherits="ProductStore.Category.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
   
     <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Category</h1>
 
  </div>
</div>
        <div style="width:60%;margin:10%;float:none">
        <div style="float:left">
            <asp:GridView ID="grdCatgory" runat="server" AutoGenerateColumns="true" CssClass="table">

                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkDelete_Click" Text="Delete Category"> </asp:LinkButton>
                             <asp:LinkButton runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="lnkEdit_Click" Text="Edit Category"> </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div style="float:right">
             Category :  <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox><asp:TextBox ID="txtCategoryId" runat="server" Visible="false"></asp:TextBox>
    <hr />
          <asp:Button ID="btnAddUpdateCategory" runat="server" Text="Add Category" OnClick="btnAddUpdateCategory_Click" CssClass="btn btn-info btn-lg" />
      </div>
  </div>
</asp:Content>