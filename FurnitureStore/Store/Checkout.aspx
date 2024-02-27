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
                                <label for="txtCompany" class="text-black">Company Name </label>
                                <asp:TextBox ID="txtCompany" CssClass="form-control" runat="server"></asp:TextBox>
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
                            <label for="c_create_account" class="text-black" data-bs-toggle="collapse" href="#create_an_account" role="button" aria-expanded="false" aria-controls="create_an_account">
                                <input type="checkbox" value="1" id="c_create_account">
                                Create an account?</label>
                            <div class="collapse" id="create_an_account">
                                <div class="py-2 mb-4">
                                    <p class="mb-3">Create an account by entering the information below. If you are a returning customer please login at the top of the page.</p>
                                    <div class="form-group">
                                        <label for="c_account_password" class="text-black">Account Password</label>
                                        <input type="email" class="form-control" id="c_account_password" name="c_account_password" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="c_ship_different_address" class="text-black" data-bs-toggle="collapse" href="#ship_different_address" role="button" aria-expanded="false" aria-controls="ship_different_address">
                                <input type="checkbox" value="1" id="c_ship_different_address">
                                Ship To A Different Address?</label>
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
                                            <label for="c_diff_fname" class="text-black">First Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_fname" name="c_diff_fname">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="c_diff_lname" class="text-black">Last Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_lname" name="c_diff_lname">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="c_diff_companyname" class="text-black">Company Name </label>
                                            <input type="text" class="form-control" id="c_diff_companyname" name="c_diff_companyname">
                                        </div>
                                    </div>

                                    <div class="form-group row  mb-3">
                                        <div class="col-md-12">
                                            <label for="c_diff_address" class="text-black">Address <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_address" name="c_diff_address" placeholder="Street address">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Apartment, suite, unit etc. (optional)">
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="c_diff_state_country" class="text-black">State / Country <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_state_country" name="c_diff_state_country">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="c_diff_postal_zip" class="text-black">Posta / Zip <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_postal_zip" name="c_diff_postal_zip">
                                        </div>
                                    </div>

                                    <div class="form-group row mb-5">
                                        <div class="col-md-6">
                                            <label for="c_diff_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_email_address" name="c_diff_email_address">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="c_diff_phone" class="text-black">Phone <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="c_diff_phone" name="c_diff_phone" placeholder="Phone Number">
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
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                        <th>Product</th>
                                        <th>Total</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Top Up T-Shirt <strong class="mx-2">x</strong> 1</td>
                                            <td>$250.00</td>
                                        </tr>
                                        <tr>
                                            <td>Polo Shirt <strong class="mx-2">x</strong>   1</td>
                                            <td>$100.00</td>
                                        </tr>
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
