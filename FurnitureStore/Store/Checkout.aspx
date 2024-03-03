<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Store.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="FurnitureStore.Store.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>Checkout</h1>
                    </div>
                </div>
                <div class="col-lg-7">
                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <div class="untree_co-section">
        <div class="container">

            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Billing Details</h2>
                    <div class="p-3 p-lg-5 border bg-white">

                        <div class="form-group">
                            <label for="c_country" class="text-black">Country <span class="text-danger">*</span></label>
                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Select Something</asp:ListItem>
                                <asp:ListItem Value="1">India</asp:ListItem>
                                <asp:ListItem Value="2">USA</asp:ListItem>
                                <asp:ListItem Value="3">Australia</asp:ListItem>
                                <asp:ListItem Value="3">Nepal</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <label for="txtFirstName" class="text-black">First Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="txtLastName" class="text-black">Last Name <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="txtAddress1" class="text-black">Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtAddress1" CssClass="form-control" placeholder="Street address" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group mt-3">
                            <asp:TextBox ID="txtAddress2" Placeholder="Apartment, suite, unit etc. (optional)" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6">
                                <label for="txtState" class="text-black">State<span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="txtPinCode" class="text-black">Posta / Zip <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group row mb-5">
                            <div class="col-md-6">
                                <label for="txtEmail" class="text-black">Email Address <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="txtMobile" class="text-black">Phone <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>


                    </div>
                </div>

                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Your Order</h2>
                            <div class="p-3 p-lg-5 border bg-white">

                                <table class="table site-block-order-table">
                                    <thead>
                                        <th>Preview</th>
                                        <th>Product</th>
                                        <th>Total</th>
                                    </thead>
                                </table>

                                <asp:DataList ID="ddlCheckout" runat="server">
                                    <ItemTemplate>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col table">
                                                    <tr>
                                                        <td>
                                                            <img class="img-fluid rounded" src="../<%#Eval("ProductImage") %>" />
                                                        </td>
                                                        <td class="w-75"><%#Eval("ProductName") %> <strong class="mx-2">x</strong> 1</td>
                                                        <td><%#Eval("Price") %></td>
                                                    </tr>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>


                                <table class="table site-block-order-table mb-5">
                                    <tbody>

                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                                            <td><asp:Label ID="lblCartTotal" Csslass="text-black" runat="server"></asp:Label></td>
<%--                                            <td >$350.00</td>--%>
                                        </tr>
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                            <td><asp:Label ID="lblTotal" CssClass="text-black font-weight-bold" runat="server"></asp:Label></td>
<%--                                            <td ><strong>$350.00</strong></td>--%>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="form-group">
                                    <asp:Button ID="Button1" CssClass="btn btn-black btn-lg py-3 btn-block" runat="server" Text="Place Order" OnClick="Button1_Click" />
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- </form> -->
        </div>
    </div>

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

</asp:Content>
