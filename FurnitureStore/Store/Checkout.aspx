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



                        <div class="form-group">
                            <label for="c_ship_different_address" class="text-black" data-bs-toggle="collapse" href="#ship_different_address" role="button" aria-expanded="false" aria-controls="ship_different_address">
                                <asp:CheckBox ID="c_ship_different_address" Value="1" runat="server" Text=" Ship To A Different Address?" />
                                <div class="collapse" id="ship_different_address">
                                    <div class="py-2">

                                        <div class="form-group">
                                            <label for="c_diff_country" class="text-black">Country <span class="text-danger">*</span></label>
                                            <asp:DropDownList ID="ddlCountry2" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="">Select Something</asp:ListItem>
                                                <asp:ListItem Value="1">India</asp:ListItem>
                                                <asp:ListItem Value="2">USA</asp:ListItem>
                                                <asp:ListItem Value="3">Australia</asp:ListItem>
                                                <asp:ListItem Value="3">Nepal</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-6">
                                                <label for="txtFirstNameOther" class="text-black">First Name <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtFirstNameOther" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="txtLastNameOther" class="text-black">Last Name <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtLastNameOther" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-12">
                                                <label for="txtAddressOther1" class="text-black">Address <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtAddressOther1" CssClass="form-control" placeholder="Street address" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group mt-3">
                                            <asp:TextBox ID="txtAddressOther2" Placeholder="Apartment, suite, unit etc. (optional)" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-6">
                                                <label for="txtStateOther" class="text-black">State<span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtStateOther" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="txtPinCode" class="text-black">Posta / Zip <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtPinCodeOther" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row mb-5">
                                            <div class="col-md-6">
                                                <label for="txtEmailOther" class="text-black">Email Address <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtEmailOther" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="txtMobileOther" class="text-black">Phone <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtMobileOther" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>

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
                                        <th>Product</th>
                                        <th>Total</th>
                                    </thead>
                                </table>

                                <asp:DataList ID="ddlCheckout" runat="server">
                                    <ItemTemplate>
                                        <table class="table site-block-order-table">
                                            <tr>
                                                <td><%#Eval("ProductName") %> <strong class="mx-2">x</strong> 1</td>
                                                <td><%#Eval("Price") %></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>

                                <table class="table site-block-order-table mb-5">
                                    <tbody>

                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                                            <td class="text-black">$350.00</td>
                                        </tr>
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                            <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="border p-3 mb-3">
                                    <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>

                                    <div class="collapse" id="collapsebank">
                                        <div class="py-2">
                                            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="border p-3 mb-3">
                                    <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>

                                    <div class="collapse" id="collapsecheque">
                                        <div class="py-2">
                                            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="border p-3 mb-5">
                                    <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Paypal</a></h3>

                                    <div class="collapse" id="collapsepaypal">
                                        <div class="py-2">
                                            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <button class="btn btn-black btn-lg py-3 btn-block" onclick="window.location='thankyou.html'">Place Order</button>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- </form> -->
        </div>
    </div>



</asp:Content>
