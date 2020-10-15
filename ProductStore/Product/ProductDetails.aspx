<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProductDetails.aspx.cs" Inherits="ProductStore.Product.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Product Management</h1>
 
  </div>
</div>
        <div style="align-content:center; margin:10%">
            <table  style="width:60%">
                <tr>
                    <td>
                        Product Name : <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtProductName" ID="rfvProductName" runat="server" ErrorMessage="Please Enter Product Name" ValidationGroup="AddEditProduct">Please Enter Product Name</asp:RequiredFieldValidator>
                        <asp:Label ID="ProductNameSaved" runat="server"  Visible="false"></asp:Label>
                    </td>
                     <td>
                        Category : <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>

                </tr>
                  <tr style="padding-bottom:1%">
                    <td>
                        Product Unit :  <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>
                     <td>
                        Product Currency : <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>

                </tr>
                  <tr>
                    <td>
                        <div style="margin-top: 4%; margin-bottom:4%;">
                        Product Price :  <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>

                          <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtPrice" ID="rfvPrice" runat="server" ErrorMessage="Please Enter Price" ValidationGroup="AddEditProduct">Please Enter Price</asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
     ControlToValidate="txtPrice"
     ErrorMessage="Only numeric allowed." ForeColor="Red"
     ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ValidationGroup="AddEditProduct">Please Enter Only Numbers
</asp:RegularExpressionValidator> </div>
                    </td>
                       <td>
                          <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
                    </td>

                </tr>
                 <tr>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" Text="Save Changes" OnClick="btnEdit_Click" ValidationGroup="AddEditProduct" CssClass="btn btn-primary btn-lg" />
                    </td>
                      <td>
                          <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-danger btn-lg" />
                    </td>
                </tr>
            </table>
        </div>
   </asp:Content>
