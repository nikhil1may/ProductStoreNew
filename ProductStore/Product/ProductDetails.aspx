<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ProductStore.Product.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Product Management</h1>
 
  </div>
</div>
        <div style="align-content:center; margin:10%">
            <table class="table" style="width:60%">
                <tr>
                    <td>
                        Product Name : <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                     <td>
                        Category : <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>

                </tr>
                  <tr>
                    <td>
                        Product Unit :  <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>
                     <td>
                        Product Currency : <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-control"></asp:DropDownList>
                    </td>

                </tr>
                  <tr>
                    <td>
                        Product Price :  <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
     ControlToValidate="txtPrice"
     ErrorMessage="Only numeric allowed." ForeColor="Red"
     ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate">*
</asp:RegularExpressionValidator>
                    </td>
                       <td>
                          <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
                    </td>

                </tr>
                 <tr>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" Text="Save Changes" OnClick="btnEdit_Click" CssClass="btn btn-primary btn-lg" />
                    </td>
                      <td>
                          <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-danger btn-lg" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
